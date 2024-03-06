Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602D4C54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qii/kv+nMYvZU3DsZBNwviYwubBZcShicEB+6z4dpo4=; b=KRGSQAhIQYrlb/
	MlFBpOuU5Ann8ijnJOcAECM0PgXDY/YnbljpAmrszzv+yboKFKMOykjtzqGkNOLBxC8hicEyz1PmU
	sILgKDyA+sDv8jZOdkXhjYTvFSIkmvFjmIC/sOO4KfQwr3p7dVG1IorAd/slYvh5P8JVtyvK5WC8G
	/YOkzVGLyqJKGrAdiLz16IxcBmwj8fX3fYjR71D+KGq703fVgJIXQCrL0+tfkw/K1x/QG/BVhq51h
	YsHt4RCbsAe8in2v1kkp6hf2r1C5wvvbXqeknxb5N0g7FuQW6v5kJ9APGrH7yAR/1S0Fdl+c2a1Pt
	Ykj8iuGtvBOKQSUZWyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqv1-00000000JAl-3o3d;
	Wed, 06 Mar 2024 13:02:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhquz-00000000J9b-1ch7
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4034F615F5
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 13:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2404BC433A6
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709730162;
	bh=xqlXieFYyjBFUDabcN0/XVC9R8+fZoD83jS3/xfMXgQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YZx6X8VFN6PtDH+uTL8WY4EYlGJQTvWxSYSjpi1UxDn/PI4CuCbZqJbobnzySq6w0
	 9FIMALKKxs9A1JcntyKsG8stN+tVixbXwmxwq+9lGtuj2cqLjeUJPd/JTZglEzGs5u
	 FRfWGMdlQzj6prvoCMBfRaqiBnXkv0bFq8xm2iKd99HhVoogpMigj6ZP4eE2UdhfRT
	 FBlFjDSb6j6g0Ioz++G+AkqZgednyMulnrFGc13R6u4OqgbP24aZ/vSIs866nVCkOU
	 gviYn7RdgPuwfUes+8QIJHGVBHUrRv9LJFKBRT9OxxqcsDGqk1kzLgqkcjef2W4107
	 v9NDQ1oTPBM3A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d204e102a9so74823131fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 05:02:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2eSsa5MbB2XJcYUTaqpbZNl3ElUlPM0RxZsw9yVmMluB6yjIIid6hfp6K69nvNhPxIPom8Cj4sHxZbcy9jA4nhbFZhvH4tEa9KBs3/JWr
X-Gm-Message-State: AOJu0Yz/3npRN6qFxGKjm0gH7/ez/iC3rL7k0riuUQ9IdovGGGghvwci
	zWVUIExGSDs/gd4Gamm0QOeVEn6mQ+5OvbH8ExC959js/1Cz28lO66qJ21Ih9eYRIAeXn0vu/zf
	3CIl/1T3pxElLVVNsWTIpBlO7icg=
X-Google-Smtp-Source: AGHT+IFN9slhZQp0MLbB7aRkcD7nL2BGfAfaw5R/2c2MSPjA6BDrQsiEXQNvYFLOmRtv/h6N5T0jPpresVWzCzFOhFM=
X-Received: by 2002:a2e:a266:0:b0:2d2:c8c2:5cb3 with SMTP id
 k6-20020a2ea266000000b002d2c8c25cb3mr3059245ljm.33.1709730160042; Wed, 06 Mar
 2024 05:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
 <20240306085622.87248-3-cuiyunhui@bytedance.com> <CAMj1kXEjjFAeVAVwiDO22RJECSM=L=0q6J=zog7JR38rUZpLGQ@mail.gmail.com>
 <CAEEQ3w=2pX+pjwoz=hNFpR4thD+d6o9OmBob8LMzZ8BbKZ=pqg@mail.gmail.com>
In-Reply-To: <CAEEQ3w=2pX+pjwoz=hNFpR4thD+d6o9OmBob8LMzZ8BbKZ=pqg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 Mar 2024 14:02:28 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFG=y_XXiaBHZOXDApZiCb48i0U5pX+GBRO2KAUom52VA@mail.gmail.com>
Message-ID: <CAMj1kXFG=y_XXiaBHZOXDApZiCb48i0U5pX+GBRO2KAUom52VA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/3] efistub: fix missed the initialization
 of gp
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	bp@alien8.de, xiao.w.wang@intel.com, jan.kiszka@siemens.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_050245_595604_66FEF219 
X-CRM114-Status: GOOD (  27.17  )
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

T24gV2VkLCA2IE1hciAyMDI0IGF0IDEzOjM0LCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBcmQsCj4KPiBPbiBXZWQsIE1hciA2LCAyMDI0IGF0IDU6
MzbigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBXZWQsIDYgTWFyIDIwMjQgYXQgMDk6NTYsIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFu
Y2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gQ29tcGFyZWQgd2l0aCBnY2MgdmVyc2lvbiAxMiwg
Z2NjIHZlcnNpb24gMTMgdXNlcyB0aGUgZ3AKPiA+ID4gcmVnaXN0ZXIgZm9yIGNvbXBpbGF0aW9u
IG9wdGltaXphdGlvbiwgYnV0IHRoZSBlZmlzdHViIG1vZHVsZQo+ID4gPiBkb2VzIG5vdCBpbml0
aWFsaXplIGdwLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gQ28tRGV2ZWxvcGVkLWJ5OiBaaGlwZW5nIFh1IDx4dXpo
aXBlbmcuMTk3M0BieXRlZGFuY2UuY29tPgo+ID4KPiA+IFRoaXMgbmVlZHMgYSBzaWduLW9mZiwg
YW5kIHlvdXIgc2lnbm9mZiBuZWVkcyB0byBjb21lIGFmdGVyLgo+ID4KPiA+ID4gLS0tCj4gPiA+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMgfCAxMSArKysrKysrKysrLQo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2VmaS1oZWFkZXIuUwo+ID4gPiBpbmRleCA1MTViMmRmYmNhNzUuLmZhMTdjMDhj
MDkyYSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TCj4g
PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUwo+ID4gPiBAQCAtNDAsNyAr
NDAsNyBAQCBvcHRpb25hbF9oZWFkZXI6Cj4gPiA+ICAgICAgICAgLmxvbmcgICBfX3BlY29mZl9k
YXRhX3ZpcnRfZW5kIC0gX19wZWNvZmZfdGV4dF9lbmQgICAgICAvLyBTaXplT2ZJbml0aWFsaXpl
ZERhdGEKPiA+ID4gICNlbmRpZgo+ID4gPiAgICAgICAgIC5sb25nICAgMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8vIFNpemVPZlVuaW5pdGlhbGl6ZWREYXRhCj4gPiA+
IC0gICAgICAgLmxvbmcgICBfX2VmaXN0dWJfZWZpX3BlX2VudHJ5IC0gX3N0YXJ0ICAgICAgICAg
Ly8gQWRkcmVzc09mRW50cnlQb2ludAo+ID4gPiArICAgICAgIC5sb25nICAgX2VmaXN0dWJfZW50
cnkgLSBfc3RhcnQgICAgICAgICAvLyBBZGRyZXNzT2ZFbnRyeVBvaW50Cj4gPiA+ICAgICAgICAg
LmxvbmcgICBlZmlfaGVhZGVyX2VuZCAtIF9zdGFydCAgICAgICAgICAgICAgICAgLy8gQmFzZU9m
Q29kZQo+ID4gPiAgI2lmZGVmIENPTkZJR18zMkJJVAo+ID4gPiAgICAgICAgIC5sb25nICBfX3Bl
Y29mZl90ZXh0X2VuZCAtIF9zdGFydCAgICAgICAgICAgICAgIC8vIEJhc2VPZkRhdGEKPiA+ID4g
QEAgLTEyMSw0ICsxMjEsMTMgQEAgc2VjdGlvbl90YWJsZToKPiA+ID4KPiA+ID4gICAgICAgICAu
YmFsaWduIDB4MTAwMAo+ID4gPiAgZWZpX2hlYWRlcl9lbmQ6Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICAuZ2xvYmFsIF9lZmlzdHViX2VudHJ5Cj4gPiA+ICtfZWZpc3R1Yl9lbnRyeToKPiA+Cj4gPiBU
aGlzIHNob3VsZCBnbyBpbnRvIC50ZXh0IG9yIC5pbml0LnRleHQsIG5vdCB0aGUgaGVhZGVyLgo+
ID4KPiA+ID4gKyAgICAgICAvKiBSZWxvYWQgdGhlIGdsb2JhbCBwb2ludGVyICovCj4gPiA+ICsg
ICAgICAgbG9hZF9nbG9iYWxfcG9pbnRlcgo+ID4gPiArCj4gPgo+ID4gV2hhdCBpcyBzdXBwb3Nl
ZCB0byBoYXBwZW4gaGVyZSBpZiBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0s9eT8gVGhlIEVGSQo+
ID4gc3R1YiBNYWtlZmlsZSByZW1vdmVzIHRoZSBTQ1MgQ0ZMQUdTLCBzbyB0aGUgc3R1YiB3aWxs
IGJlIGJ1aWx0Cj4gPiB3aXRob3V0IHNoYWRvdyBjYWxsIHN0YWNrIHN1cHBvcnQsIHdoaWNoIEkg
Z3Vlc3MgbWVhbnMgdGhhdCBpdCBtaWdodAo+ID4gdXNlIEdQIGFzIGEgZ2xvYmFsIHBvaW50ZXIg
YXMgdXN1YWw/Cj4gPgo+ID4gPiArICAgICAgIGNhbGwgX19lZmlzdHViX2VmaV9wZV9lbnRyeQo+
ID4gPiArICAgICAgIHJldAo+ID4gPiArCj4gPgo+ID4gWW91IGFyZSByZXR1cm5pbmcgdG8gdGhl
IGZpcm13YXJlIGhlcmUsIGJ1dCBhZnRlciBtb2RpZnlpbmcgdGhlIEdQCj4gPiByZWdpc3Rlci4g
U2hvdWxkbid0IHlvdSByZXN0b3JlIGl0IHRvIGl0cyBvbGQgdmFsdWU/Cj4gVGhlcmUgaXMgbm8g
bmVlZCB0byByZXN0b3JlIHRoZSB2YWx1ZSBvZiB0aGUgZ3AgcmVnaXN0ZXIuIFdoZXJlIGdwIGlz
Cj4gbmVlZGVkLCB0aGUgZ3AgcmVnaXN0ZXIgbXVzdCBmaXJzdCBiZSBpbml0aWFsaXplZC4gQW5k
IGhlcmUgaXMgdGhlCj4gZW50cnkuCj4KCkJ1dCBob3cgc2hvdWxkIHRoZSBmaXJtd2FyZSBrbm93
IHRoYXQgR1Agd2FzIGNvcnJ1cHRlZCBhZnRlciBjYWxsaW5nCnRoZSBrZXJuZWwncyBFRkkgZW50
cnlwb2ludD8gVGhlIEVGSSBzdHViIGNhbiByZXR1cm4gdG8gdGhlIGZpcm13YXJlCmlmIGl0IGVu
Y291bnRlcnMgYW55IGVycm9ycyB3aGlsZSBzdGlsbCBydW5uaW5nIGluIHRoZSBFRkkgYm9vdApz
ZXJ2aWNlcy4KCgo+IFJlZ2FyZGluZyB5b3VyIGZpcnN0IHR3byBjb21tZW50cyBhYm92ZSwgSSBw
bGFuIHRvIG1ha2UgdGhlIGZvbGxvd2luZwo+IGNoYW5nZXMgaW4gdjIsCj4gZWZpX2hlYWRlcl9l
bmQ6Cj4gKwo+ICsgICAgICAgX19JTklUCj4gKyAgICAgICAuZ2xvYmFsIF9lZmlzdHViX2VudHJ5
Cj4gK19lZmlzdHViX2VudHJ5Ogo+ICsgICAgICAgLyogUmVsb2FkIHRoZSBnbG9iYWwgcG9pbnRl
ciAqLwo+ICsub3B0aW9uIHB1c2gKPiArLm9wdGlvbiBub3JlbGF4Cj4gKyAgICAgICBsYSBncCwg
X19nbG9iYWxfcG9pbnRlciQKPiArLm9wdGlvbiBwb3AKPiArCj4gKyAgICAgICBjYWxsIF9fZWZp
c3R1Yl9lZmlfcGVfZW50cnkKPiArICAgICAgIHJldAo+ICsgICAgICAgX19IRUFECj4gKwo+ICAg
ICAgICAgLmVuZG0KPgo+IHdoYXQgZG8geW91IHRoaW5rPwo+CgpUaGlzIGxvb2tzIG9rIHRvIG1l
LCBidXQgSSB3b3VsZCBzdGlsbCBsaWtlIHRvIHVuZGVyc3RhbmQgd2h5IGl0IGlzIG9rCnRvIHJl
dHVybiB0byB0aGUgZmlybXdhcmUgd2l0aCBhIG1vZGlmaWVkIEdQIHZhbHVlLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
