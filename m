Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6DEC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 19:50:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A508064E4D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 19:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A508064E4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1MFZIMRryk2c/5s1yUpw7aZxfDBHq6nGCqBKMLIFUu8=; b=cm0VxDjmZDnJ8l4oHJY50n1tJ
	iIFSx2PKbTfE3x3QEbQ37XaoHyRHQlBiLfTiw2Cz4KsD4Iuj+HWPQn0sxqrUzbxAEh/VFGFlfOIOG
	PqGx04oIcuY4O+Cp/+Tzf9nn7FRCqQUBFtCIPxk6DeFmje2KqvPSlTqHHOaV/mtxUhRjM6YedcmcT
	Am1mKL1RdZYrW/CJ+rYDaAV2nTLoTkX611Z5BM3907yx2DjwIvwDbZKEXlhQCYvzoui1YR8UFQA0e
	ajcaI/2w9DuQuBS6dcHpVTZzvVcMnJ+MYyZfiA/FbQVlBXDRxizWcXlQxx00bM/0P6kni5yWZGUJc
	gKha2dH8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAHyO-0004hh-Vd; Thu, 11 Feb 2021 19:49:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAHyM-0004go-M4
 for linux-riscv@lists.infradead.org; Thu, 11 Feb 2021 19:49:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5CF864E45;
 Thu, 11 Feb 2021 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613072994;
 bh=4c3MKlXhsOtiG9Oj6Oqk8T6TzpYMlcq+a7LsNrbH0Ro=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=h6qXPGVlXr+t+Pmw+UxH/mlIK9CkiJAu0o3KASyo6QZy63rMfPD4Ubh5zO8n67zrz
 23hC0BSTqHNUvG0k0CBpiZV05ApuKpjR1jZhWpya2++2Ugb8rY+6XKrqzLoLtKsZMb
 rprfhEN+p9Wo/vZG+bVY5p2pCyBCmS1aE/cXHvfPsoyxZS+ULnUE3DzlWU66U9z9an
 HrqYS2s6yaO9CD3l2mD4+W+XMGXCPHIFcHVwNdYzWka2OWa2LOxMC8EjkbK5Wro3Kz
 z0pclVCGOK+k6X6ytZ1lE08ZKHbppZzeSoUHSbTJtjB+0GwnimZCVrCtpEQ4InJ1nN
 fwxHhOBGwUtjg==
MIME-Version: 1.0
In-Reply-To: <20210120093040.1719407-7-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
 <20210120093040.1719407-7-lee.jones@linaro.org>
Subject: Re: [PATCH 06/20] clk: sifive: fu540-prci: Declare static const
 variable 'prci_clk_fu540' where it's used
From: Stephen Boyd <sboyd@kernel.org>
To: lee.jones@linaro.org
Date: Thu, 11 Feb 2021 11:49:52 -0800
Message-ID: <161307299270.1254594.13908235432213477383@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_144954_886241_6DFAE106 
X-CRM114-Status: UNSURE (   6.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Pragnesh Patel <Pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBMZWUgSm9uZXMgKDIwMjEtMDEtMjAgMDE6MzA6MjYpCj4gRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gCj4gIGRyaXZlcnMvY2xrL3NpZml2
ZS9mdTU0MC1wcmNpLmg6MTY6MzU6IHdhcm5pbmc6IOKAmHByY2lfY2xrX2Z1NTQw4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gIGRyaXZlcnMvY2xr
L3NpZml2ZS9mdTU0MC1wcmNpLmg6MTY6MzU6IHdhcm5pbmc6IOKAmHByY2lfY2xrX2Z1NTQw4oCZ
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gCj4gQ2M6
IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNvbT4KPiBDYzogU3RlcGhl
biBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgo+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1z
bGV5QHNpZml2ZS5jb20+Cj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
Cj4gQ2M6IFByYWduZXNoIFBhdGVsIDxQcmFnbmVzaC5wYXRlbEBzaWZpdmUuY29tPgo+IENjOiBa
b25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gQ2M6IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5v
cmcKPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCgpBcHBsaWVkIHRvIGNsay1u
ZXh0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
