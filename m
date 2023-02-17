Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A08C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 14:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ew67YLLyHpUY+75N410nEFoLtAj591R09MGbjlV5exw=; b=WevrX/mxK4wo7U
	ycGGdEOoMViL2ctHE0Rgrn1D9PdQDfdC0SaVkiroAjAglS54EiyiBJ/scoEoyOklRxSDsH3nUYAPk
	Mg326R3bc3mnXX3hIOE57kOj8ryyGT1EnkK0ywS5A6nMyVuIzn9s3LaV7NbGpRsdlIrGmHJvxH7ss
	v3FaEDCFheTohiEReiBd+grilh7y72igwImUQqXCa0hqkciBeuYw0r2QK0dLmDWZruLkuKQBgQT6G
	4+ICRJybSAUuCfUJw/t2qdyI3pz8BZkSq93O02bA8IxWh2QXdoKnZmkzNQ5ucOiFxescFhSC8+nm5
	IkpHuWhVTao7Sj4xzANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT27o-00Edhv-7d; Fri, 17 Feb 2023 14:54:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT27m-00EdhG-2S
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 14:54:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EC5461C7A;
	Fri, 17 Feb 2023 14:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B500EC433EF;
	Fri, 17 Feb 2023 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676645649;
	bh=mAyxo9jzvMpBaS+OGt1uE0IiaE4JH5UGYXDEN92Phwg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UY7NL9L8gdr3kr0FZ3JHMa3CVQX8uHHUWF/IDsYGG1eMhtZajd+SvfPmk8RK11ZHP
	 iu2msEcey400TfIizRspgmRwexY75+NtyuQEG84fCoD/XmBqj5QDgDTVQlXkTuQLrY
	 PH5O1xXc+i0QhFXPCftt8uKypCHEYwzsjX3f+dS36NCG5nUmmdgQSZlo5s7Dexy8th
	 Og0RoXeH3rtE5OKqpCpEehLqtZB2llpGnLgDkCERZWGeALwgSCjU1cfBfni9uLnbEC
	 4jcCc7HSudofdaY5YlwAWHB9oofnpZ4GLt4kxWNDnY8RM+j0G9fs0VY5g8cRZQFs7v
	 uelimgXdvbLag==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 2/6] riscv: Rework kasan population functions
In-Reply-To: <20230203075232.274282-3-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
 <20230203075232.274282-3-alexghiti@rivosinc.com>
Date: Fri, 17 Feb 2023 15:54:06 +0100
Message-ID: <87lekwmjg1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_065410_212578_4891B16E 
X-CRM114-Status: GOOD (  21.03  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IE91ciBw
cmV2aW91cyBrYXNhbiBwb3B1bGF0aW9uIGltcGxlbWVudGF0aW9uIHVzZWQgdG8gaGF2ZSB0aGUg
ZmluYWwga2FzYW4KPiBzaGFkb3cgcmVnaW9uIG1hcHBlZCB3aXRoIGthc2FuX2Vhcmx5X3NoYWRv
d19wYWdlLCBiZWNhdXNlIHdlIGRpZCBub3QgY2xlYW4KPiB0aGUgZWFybHkgbWFwcGluZyBhbmQg
dGhlbiB3ZSBoYWQgdG8gcG9wdWxhdGUgdGhlIGthc2FuIHJlZ2lvbiAiaW4tcGxhY2UiCj4gd2hp
Y2ggbWFkZSB0aGUgY29kZSBjdW1iZXJzb21lLgo+Cj4gU28gbm93IHdlIGNsZWFyIHRoZSBlYXJs
eSBtYXBwaW5nLCBlc3RhYmxpc2ggYSB0ZW1wb3JhcnkgbWFwcGluZyB3aGlsZSB3ZQo+IHBvcHVs
YXRlIHRoZSBrYXNhbiBzaGFkb3cgcmVnaW9uIHdpdGgganVzdCB0aGUga2VybmVsIHJlZ2lvbnMg
dGhhdCB3aWxsCj4gYmUgdXNlZC4KPgo+IFRoaXMgbmV3IHZlcnNpb24gdXNlcyB0aGUgImdlbmVy
aWMiIHdheSBvZiBnb2luZyB0aHJvdWdoIGEgcGFnZSB0YWJsZQo+IHRoYXQgbWF5IGJlIGZvbGRl
ZCBhdCBydW50aW1lIChhdm9pZCB0aGUgWFhYX25leHQgbWFjcm9zKS4KPgo+IEl0IHdhcyB0ZXN0
ZWQgd2l0aCBvdXRsaW5lIGluc3RydW1lbnRhdGlvbiBvbiBhbiBVYnVudHUga2VybmVsCj4gY29u
ZmlndXJhdGlvbiBzdWNjZXNzZnVsbHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgooT25lIG1pbm9yIG5pdCwgdGhhdCBjYW4gYmUg
YWRkcmVzc2VkIGxhdGVyLikKClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+Cgo+ICBhcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYyB8IDM2MSArKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxODMgaW5zZXJ0
aW9ucygrKSwgMTc4IGRlbGV0aW9ucygtKQoKCj4gQEAgLTQ4Miw3ICs0MzcsMzcgQEAgc3RhdGlj
IHZvaWQgX19pbml0IGthc2FuX3NoYWxsb3dfcG9wdWxhdGUodm9pZCAqc3RhcnQsIHZvaWQgKmVu
ZCkKPiAgCXVuc2lnbmVkIGxvbmcgdmVuZCA9IFBBR0VfQUxJR04oKHVuc2lnbmVkIGxvbmcpZW5k
KTsKPiAgCj4gIAlrYXNhbl9zaGFsbG93X3BvcHVsYXRlX3BnZCh2YWRkciwgdmVuZCk7Cj4gLQls
b2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNyZWF0ZV90bXBf
bWFwcGluZyh2b2lkKQo+ICt7Cj4gKwl2b2lkICpwdHI7Cj4gKwlwNGRfdCAqYmFzZV9wNGQ7Cj4g
Kwo+ICsJLyoKPiArCSAqIFdlIG5lZWQgdG8gY2xlYW4gdGhlIGVhcmx5IG1hcHBpbmc6IHRoaXMg
aXMgaGFyZCB0byBhY2hpZXZlICJpbi1wbGFjZSIsCj4gKwkgKiBzbyBpbnN0YWxsIGEgdGVtcG9y
YXJ5IG1hcHBpbmcgbGlrZSBhcm02NCBhbmQgeDg2IGRvLgo+ICsJICovCj4gKwltZW1jcHkodG1w
X3BnX2Rpciwgc3dhcHBlcl9wZ19kaXIsIHNpemVvZihwZ2RfdCkgKiBQVFJTX1BFUl9QR0QpOwo+
ICsKPiArCS8qIENvcHkgdGhlIGxhc3QgcDRkIHNpbmNlIGl0IGlzIHNoYXJlZCB3aXRoIHRoZSBr
ZXJuZWwgbWFwcGluZy4gKi8KPiArCWlmIChwZ3RhYmxlX2w1X2VuYWJsZWQpIHsKPiArCQlwdHIg
PSAocDRkX3QgKilwZ2RfcGFnZV92YWRkcigqcGdkX29mZnNldF9rKEtBU0FOX1NIQURPV19FTkQp
KTsKPiArCQltZW1jcHkodG1wX3A0ZCwgcHRyLCBzaXplb2YocDRkX3QpICogUFRSU19QRVJfUDRE
KTsKPiArCQlzZXRfcGdkKCZ0bXBfcGdfZGlyW3BnZF9pbmRleChLQVNBTl9TSEFET1dfRU5EKV0s
Cj4gKwkJCXBmbl9wZ2QoUEZOX0RPV04oX19wYSh0bXBfcDRkKSksIFBBR0VfVEFCTEUpKTsKPiAr
CQliYXNlX3A0ZCA9IHRtcF9wNGQ7Cj4gKwl9IGVsc2Ugewo+ICsJCWJhc2VfcDRkID0gKHA0ZF90
ICopdG1wX3BnX2RpcjsKPiArCX0KPiArCj4gKwkvKiBDb3B5IHRoZSBsYXN0IHB1ZCBzaW5jZSBp
dCBpcyBzaGFyZWQgd2l0aCB0aGUga2VybmVsIG1hcHBpbmcuICovCj4gKwlpZiAocGd0YWJsZV9s
NF9lbmFibGVkKSB7Cj4gKwkJcHRyID0gKHB1ZF90ICopcDRkX3BhZ2VfdmFkZHIoKihiYXNlX3A0
ZCArIHA0ZF9pbmRleChLQVNBTl9TSEFET1dfRU5EKSkpOwo+ICsJCW1lbWNweSh0bXBfcHVkLCBw
dHIsIHNpemVvZihwdWRfdCkgKiBQVFJTX1BFUl9QVUQpOwo+ICsJCXNldF9wNGQoJmJhc2VfcDRk
W3A0ZF9pbmRleChLQVNBTl9TSEFET1dfRU5EKV0sCj4gKwkJCXBmbl9wNGQoUEZOX0RPV04oX19w
YSh0bXBfcHVkKSksIFBBR0VfVEFCTEUpKTsKPiArCX0KPiAgfQo+ICAKPiAgdm9pZCBfX2luaXQg
a2FzYW5faW5pdCh2b2lkKQo+IEBAIC00OTAsMTAgKzQ3NSwyNyBAQCB2b2lkIF9faW5pdCBrYXNh
bl9pbml0KHZvaWQpCj4gIAlwaHlzX2FkZHJfdCBwX3N0YXJ0LCBwX2VuZDsKPiAgCXU2NCBpOwo+
ICAKPiAtCWlmIChJU19FTkFCTEVEKENPTkZJR19LQVNBTl9WTUFMTE9DKSkKPiArCWNyZWF0ZV90
bXBfbWFwcGluZygpOwo+ICsJY3NyX3dyaXRlKENTUl9TQVRQLCBQRk5fRE9XTihfX3BhKHRtcF9w
Z19kaXIpKSB8IHNhdHBfbW9kZSk7CgpOaXQ6IE1heWJlIGFkZCBhIGNvbW1lbnQsIHdoeSB0aGUg
c2ZlbmNlLnZtYSBpcyAqbm90KiByZXF1aXJlZCBoZXJlLiBJCnRyaXBwZWQgb3ZlciBpdC4KCgpC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
