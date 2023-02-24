Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC186C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXl2kv6jbb1Huc6IsnaK3zKgcAXUNCc8jiHyW2p8JOc=; b=a2XhB1Ml0xJgkG
	uMQ9IaoaeTqL5LeBeBqwGkgVJtdtiZTaAoU9vSXqAtLViLJxmw0Ssf09hPS+jsT1A5wkjy/G37b1U
	qHxx9+UdmUMbGO9AlD6sar4RxctTbG11rqJoHdmy+PatUpejM4BsjFQBHJwkWZVANpfmhkGMNN7/O
	iyLgZSpPD7SJg4MdH56Am732jegM7rIfE0sZ/5xPoqo/ofjHIQ/TAqoTzMis8gswT71AEEYMUCDmJ
	3s9AbiSEP9dgxRHMsL1yC1UJn4MUEKFo+//taWu1ZphxTfIcYxp0qcZgztJzxPcxKGHIHje8QkZkT
	pe//EiaObUJzr9VMGaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaOW-0031zZ-60; Fri, 24 Feb 2023 15:54:00 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVaOS-0031y0-Vu
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:53:58 +0000
Received: from [167.98.27.226] (helo=[10.35.4.85])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pVaOK-008cjf-Qa; Fri, 24 Feb 2023 15:53:48 +0000
Message-ID: <ce498465-ad63-e8dc-43a9-e007e2cb1a41@codethink.co.uk>
Date: Fri, 24 Feb 2023 15:53:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/6] riscv: Rename Kconfig.erratas to Kconfig.errata
Content-Language: en-GB
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Jisheng Zhang ' <jszhang@kernel.org>, 'Palmer Dabbelt '
 <palmer@dabbelt.com>, 'Heiko Stuebner ' <heiko@sntech.de>,
 'Conor Dooley ' <conor.dooley@microchip.com>,
 'Albert Ou ' <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
References: <20230224154601.88163-1-ajones@ventanamicro.com>
 <20230224154601.88163-3-ajones@ventanamicro.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230224154601.88163-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_075357_040528_D60C334C 
X-CRM114-Status: UNSURE (   5.41  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjQvMDIvMjAyMyAxNTo0NSwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+IEVycmF0YSBpcyBhbHJl
YWR5IHBsdXJhbCBmb3IgZXJyYXR1bS4gUmVuYW1lIGl0IHRvIG1ha2UgdGhlCj4gZ3JhbW1hciBn
b29kZXIuCgpnb29kZXIgb19vCgpsZXQncyBqdXN0IGdvIGVtam9pICjila/CsOKWocKw77yJ4pWv
77i1IOKUu+KUgeKUuwoKLS0gCkJlbiBEb29rcwkJCQlodHRwOi8vd3d3LmNvZGV0aGluay5jby51
ay8KU2VuaW9yIEVuZ2luZWVyCQkJCUNvZGV0aGluayAtIFByb3ZpZGluZyBHZW5pdXMKCmh0dHBz
Oi8vd3d3LmNvZGV0aGluay5jby51ay9wcml2YWN5Lmh0bWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
