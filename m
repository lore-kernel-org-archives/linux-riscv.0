Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6650C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 11:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywxfoLHZbyOzO/K0+FKE98cwpWi8tpnee5vdNyCDrRo=; b=jQ8ZV7YvKDhFTmUCbnWVtpU0Ou
	k+W1DTC/M4SWcr6LqiAJ9I2eNtrqTXmDxeHp8XB7heFNIR0mc8Zxq06OouzfX1XhANJEWZ67OJL0T
	xpxDM1FtJER1M4DEm/66bNL8h+7QAR1KC5PhiMJ57aUKD7SKvciXGCmoC3ghdV7+c4luj7OWsPCBa
	nV4+se+c0I//Z3W8BqN97P9yftEDgfX6WHIDzMcAgwkrXUJoQdb8XYXPrEJ16j23rsU1JjAJdsIJ/
	L/mAiEYYZzV8SjeruL9gzgNQ7AZlTxNF174VCGiXmrM7meCIc8Gbhxsg4D5J9gavJb76FT78HCSsZ
	edgRqqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKS2-0000000Cymy-2vAx;
	Thu, 04 Jul 2024 11:16:34 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKRz-0000000CymZ-1Ran
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 11:16:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D94B60004;
	Thu,  4 Jul 2024 11:16:26 +0000 (UTC)
Message-ID: <7fac15fb-83e0-4711-91a0-db0cb616c2c9@ghiti.fr>
Date: Thu, 4 Jul 2024 13:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Check that vdso does not contain any dynamic
 relocations
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Vladimir Isaev <vladimir.isaev@syntacore.com>,
 Roman Artemev <roman.artemev@syntacore.com>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240326113831.283025-1-alexghiti@rivosinc.com>
 <8734oqzlyq.fsf@all.your.base.are.belong.to.us>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <8734oqzlyq.fsf@all.your.base.are.belong.to.us>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_041631_546506_7C812569 
X-CRM114-Status: UNSURE (   8.90  )
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

SGkgQmrDtnJuLAoKT24gMDMvMDcvMjAyNCAxNDo0MSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBI
ZXkgQWxleCwKPgo+IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3Jp
dGVzOgo+Cj4+IExpa2Ugb3RoZXIgYXJjaGl0ZWN0dXJlcywgdXNlIHRoZSBjb21tb24gY21kX3Zk
c29fY2hlY2sgdG8gbWFrZSBzdXJlIG9mCj4+IHRoYXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBMb29raW5nIGluIFBXLCB0
aGlzIGZhaWxzIG9uIHJ2MzI/IElzIHRoYXQgYSBmYWxzZSBuZWdhdGl2ZT8KCgpJIGhhZCBtaXNz
ZWQgdGhhdCwgdGhhbmtzLgoKU28gaXQncyBub3QgYSBmYWxzZSBwb3NpdGl2ZSwgdGhlIGNoZWNr
IHRoaXMgcGF0Y2ggYWRkcyBhY3R1YWxseSByZXZlYWxzIAphbiBpc3N1ZTogZ2NjIHNlZW1zIHRv
IGJlIHNtYXJ0IGVub3VnaCB0byBpbnNlcnQgYSBtZW1zZXQoKSBpbiAKcmlzY3ZfdmRzb19nZXRf
Y3B1cygpLiBBbmQgdGhpcyBjYWxsIHRvIG1lbXNldCgpIGluc2VydHMgYSByZWxvY2F0aW9uLiAK
V2VpcmRseSwgb25seSBvbiBydjMyLgoKSSBtYW5hZ2VkIHRvIGZpeCB0aGlzIGJ5IGFkZGluZzoK
CmNjZmxhZ3MteSArPSAtZm5vLXRyZWUtbG9vcC1kaXN0cmlidXRlLXBhdHRlcm5zCgpJJ2xsIHNl
bmQgdGhpcyBmaXggc29vbi4KClRoYW5rcywKCgo+Cj4gT3RoZXIgdGhhbiB0aGF0LAo+IFJldmll
d2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
