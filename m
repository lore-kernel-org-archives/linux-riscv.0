Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86885C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gANEJrw5EvbN73vo3aFlyGkbtCxXAQTSkFm2pFX+dnk=; b=m0Yuo+bm5j+t5G
	E1+UG7fCbdOd/6farVGs/I1StU8c6jyDWndusEtnCFS7LwbByKXBklfNr9T0AbOQ5bcMaW7BgSjq5
	6E9ARydofnRvZ2ig3iixM7HdykPTBqoHIQ1dgvoeEUQ946HChNCyS3Vv5DXVfoI5xf+PvBuADq88X
	dFDuUMlXZjr9UQpGIKD0jQvAQpWIWqTjpXfo485qRNpI0/nXc8yEe5hbyIxr+2Jdi8/TZIXyGSSuA
	GmgU6rT19IKe+WtKfWB5nElqkSTbsRSfkNcK/dIGQckeqidl+wGHuOJJvLX3coTRdE3Zn0weAyURp
	TidaPosuKhSxiyos+jIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrHX-005zzC-Cu; Thu, 16 Dec 2021 13:58:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr8e-005wbO-4R
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:49:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o29so18990749wms.2
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 05:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3LQ3OmAQD9kzIVzbdsxECsWSS2pGDKwJ8pVBtgMaI2c=;
 b=miXBZ27ePAY3Phek81QCN2DvuJ95HPOphUuaLslf3DLF75CkR3Q7ETq3976wiRwWva
 s/PC2FYhV2jKtYQ5z01F0cKm9xNoHbsuHdDkYsuwA9NP1oFwmlaQMFBHvU8ry3GUIdmd
 2PVyBo+ad7OGMzsmzV3i+6mUOAaOEG3zsMH/1M+oS3Hnv5NN7xs82E3YFP4O1dh/vmND
 19NtpPbWqksbarXXYggzq8ip2tDL6PnU8JQoHYVQzRzeEueUjLqMCmVM5ovv7jFgEiHT
 QNQAYm74EK5rm4gNju/+/JIdoM4fbxUuVf1FEIGTMy/7Heb4hFvDr2Mpbo+7vqpIYXL1
 tCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3LQ3OmAQD9kzIVzbdsxECsWSS2pGDKwJ8pVBtgMaI2c=;
 b=lwEeJekKKC8XE/lVx4OTX4R+lkWqTmiENotSObqAxQmeVtNzL5jh4/hp4/T0o2D7kO
 vSoADEiPLUDR8BnIDKPiLqkf0kg94OrTfu1G7TWHF2GMww+5kA2IDw/rLDgLZT5M8rgO
 egJxTYjC5MFOyGuv9OMk8gH6FPVM5c0/IPyKLLZ9j61go+dRno8ojvW1oynx601BUePz
 Qw557vbJk8rN6IZDWwdsuwgAoXWPXM4B+PygbCxPYaYJ4UAl4vCu5xuJieyXeBoGbIKJ
 Qjfbfc71O8cg+alp02FscvJyjQqiL4oLnIVLezYt/KVLncOr6A2kjQ86r9EQTrcaosac
 I7TA==
X-Gm-Message-State: AOAM531dJ9iope52P2uKW3sK6N0OC/FqubTnq1TT2PRKB/HIBem2/Wcm
 iaOIqHqtR+VUC6ZKNdJBjS4GDiWd0Ck6Zg==
X-Google-Smtp-Source: ABdhPJzTl39YAx8e+eYpdbxrlhfmg4gpX+V0JbvxbDfgImCQ6CC4+8BmH5IcY00rEfyCQVmZ3xYvog==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr5170891wmc.56.1639662577472;
 Thu, 16 Dec 2021 05:49:37 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id t11sm4660401wrz.97.2021.12.16.05.49.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:49:37 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/1] riscv: default to CONFIG_RISCV_SBI_V01=n
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20211216123538.175087-1-heinrich.schuchardt@canonical.com>
Date: Thu, 16 Dec 2021 13:49:35 +0000
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <BC1B38E7-1170-4C05-948A-D18E80AC49E7@jrtc27.com>
References: <20211216123538.175087-1-heinrich.schuchardt@canonical.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_054940_243210_B8A8CDBB 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTYgRGVjIDIwMjEsIGF0IDEyOjM1LCBIZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmljaC5z
Y2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+IAo+IFRoZSBTQkkgMC4xIHNwZWNpZmlj
YXRpb24gaXMgb2Jzb2xldGUuIFRoZSBjdXJyZW50IHZlcnNpb24gaXMgMC4zLgo+IEhlbmNlIHdl
IHNob3VsZCBub3QgcmVseSBieSBkZWZhdWx0IG9uIFNCSSAwLjEgYmVpbmcgaW1wbGVtZW50ZWQu
CgpJdOKAmXMgd2hhdCBCQkwgaW1wbGVtZW50cywgYW5kIHNvbWUgcGVvcGxlIGFyZSBzdGlsbCB1
c2luZyBpdCwKZXNwZWNpYWxseSBnaXZlbiBlYXJseSBoYXJkd2FyZSBzaGlwcGVkIGJlZm9yZSBP
cGVuU0JJIGdyZXcgaW4KcG9wdWxhcml0eS4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
