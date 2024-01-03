Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADDFC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 19:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgYNUfFrcic3emvmauGc3YanPNceMez11Ff6sYepvA8=; b=sVp4Cn/7HoH1qm
	Lx/jLMkJcg4SocHDJQQFx/G+wz+qeHHNJTsuFY2+xKlbLVzwZSnOTiDVnQH0MgxSFHdZ7cr5I5k/4
	RLfwfMduofkLixRkt0DdaPkTdJjQybdhaWMXhsmAjZbRK/Vcal5MSrbESQvKaEDo6ZOk9t3WeYv06
	lgwejDhBzovLreai+txJxLboLfFhb2yiBRGi7oAASOmOQay6aDgYQ7+gN12ADysqcl7AcRFhF8dm2
	inwE34T9ANT8aVyy5dA/kwxSNgL8JWW456jUnFYBAIlwVFh80Cg/MqPGrfY/wsTGDpm9kfDhHBzWl
	O5X837vOtdLtHiy8M5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL79r-00BviI-2I;
	Wed, 03 Jan 2024 19:44:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL79p-00Bvh1-04
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 19:44:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40d604b4b30so4988355e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 11:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704311043; x=1704915843; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9CHgCTAmoG5A60KnZf4T1tVz7YGGSxQ7gA16oR1g5Q=;
        b=YD8CQr3EHgaV5QA3orq8UuzVcKCzsFn48/MwGfpyfW1uuKhqLvdawbDbEInQ2yLPPm
         OkKzqGsH25v65e0jOV+2VLjedl174f6WJwKt/AFiMdK96DY2qCz9ooMvvFi2/MhMVa47
         lemb/oqfMNBD5WWUk8diBQeDnMKndp2EYRW8yqompt/CzZAhApDJevvxlMwi3dPdscN9
         kl3sjpqUqYXT+FX04HuskiiVQPR8FBGJZTZYmXF9dMpSppa+C+hmYp1TskwjcCOXSIrK
         9jmQsSPOSvVH2r2iTSb6MriCMy81uc8voXEbFgDma6WBwAmT4g2721zrk5Co+fLOWpW0
         DROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704311043; x=1704915843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9CHgCTAmoG5A60KnZf4T1tVz7YGGSxQ7gA16oR1g5Q=;
        b=cGd1xC1to/SvXyK6GgPRXCGjjp+4oMD6WHYlGLDnp5wNMNoHCYlRlEexzf7rJPpkMH
         gbziYxy+JNXLpIYyCHRcFI5f5YDfJ8os8y1MBDQA6cbtTwZTYnWgmkwRw/1XghhgipOy
         vC2myqL55m8RUv06V67B590ftYSD3gtK5pyI3YdQkZXOfmHnOSZB4lTLqUdKb8UcBplK
         xs61t7Fqr01DPOyBVT8Chdbf0CkVf+zpVT0DHeRNygMIebeM3V+6XWKdR5aFfS72TV4H
         ehOMDDwj5O76KQgYIPe1/7xp1SKLv96yhkZ96EUdjwbZ/4b7jcfVpfLLH/61/HzyI7rE
         y8Ow==
X-Gm-Message-State: AOJu0Yx7q/V6vBVAeDeGMDUaQxS8KyyteQOseHoIjCj1rFcfG/T4OETl
	e4LpYw1x07yZ5y/sr6Y5CiB82dPMSORC26Jy5YXHIZVNqW0=
X-Google-Smtp-Source: AGHT+IGBIb7ITYX23JqCQXbEC6XyafHEd4Hpmwy7lvlIeRDAyFWSQQ1AGyRWcV48sj2HCLaP6yOSBg==
X-Received: by 2002:a05:600c:1390:b0:40d:88ba:b1a4 with SMTP id u16-20020a05600c139000b0040d88bab1a4mr735290wmf.97.1704311043266;
        Wed, 03 Jan 2024 11:44:03 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b2-20020a5d4b82000000b003367ff4aadasm31164979wrt.31.2024.01.03.11.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:44:02 -0800 (PST)
Date: Wed, 3 Jan 2024 20:44:01 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions
 & cpufeature
Message-ID: <20240103-e4221a773e12206048879101@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
 <20240102-4f12393de3c6313650a24c17@orel>
 <CAJF2gTRRqbC5RTGtwhQD1pR+JoP_D64+AUMdO2r5ff-cR5AaUg@mail.gmail.com>
 <20240103-8a6aba29ada25eb1ab004687@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103-8a6aba29ada25eb1ab004687@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_114405_062486_38B4776B 
X-CRM114-Status: GOOD (  24.93  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMDMsIDIwMjQgYXQgMDc6NDk6NDRBTSArMDEwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIFdlZCwgSmFuIDAzLCAyMDI0IGF0IDAyOjEzOjAwUE0gKzA4MDAsIEd1byBSZW4g
d3JvdGU6Cj4gPiBPbiBUdWUsIEphbiAyLCAyMDI0IGF0IDY6MzLigK9QTSBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gU3VuLCBEZWMg
MzEsIDIwMjMgYXQgMDM6Mjk6NTFBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Ci4u
Lgo+ID4gPiA+ICAjZGVmaW5lIEhGRU5DRV9WVk1BKHZhZGRyLCBhc2lkKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gPiA+IEBAIC0xOTYsNCArMjQ0LDE2IEBACj4gPiA+ID4gICAg
ICAgSU5TTl9JKE9QQ09ERV9NSVNDX01FTSwgRlVOQzMoMiksIF9fUkQoMCksICAgICAgICAgICAg
ICBcCj4gPiA+ID4gICAgICAgICAgICAgIFJTMShiYXNlKSwgU0lNTTEyKDQpKQo+ID4gPiA+Cj4g
PiA+ID4gKyNkZWZpbmUgQ0JPX1BSRUZFVENIX0koYmFzZSwgb2Zmc2V0KSAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgSU5TTl9TKE9QQ09ERV9PUF9JTU0sIEZVTkMzKDYp
LCBfX1JTMigwKSwgICAgICAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgICAgICAgIFNJTU0xMihv
ZmZzZXQpLCBSUzEoYmFzZSkpCj4gPiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIENCT19QUkVGRVRD
SF9SKGJhc2UsIG9mZnNldCkgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAg
IElOU05fUyhPUENPREVfT1BfSU1NLCBGVU5DMyg2KSwgX19SUzIoMSksICAgICAgICAgICAgICAg
XAo+ID4gPiA+ICsgICAgICAgICAgICBTSU1NMTIob2Zmc2V0KSwgUlMxKGJhc2UpKQo+ID4gPiA+
ICsKPiA+ID4gPiArI2RlZmluZSBDQk9fUFJFRkVUQ0hfVyhiYXNlLCBvZmZzZXQpICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICBJTlNOX1MoT1BDT0RFX09QX0lNTSwgRlVO
QzMoNiksIF9fUlMyKDMpLCAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAgICAgICAgU0lN
TTEyKG9mZnNldCksIFJTMShiYXNlKSkKPiA+ID4KPiA+ID4gU2hvdWxkbid0IHdlIGVuc3VyZSB0
aGUgbG93ZXIgNS1iaXRzIG9mIG9mZnNldCBhcmUgemVybyBieSBtYXNraW5nIGl0Pwo+ID4gVGhl
IHNwZWMgc2F5czoKPiA+ICJUaGVzZSBpbnN0cnVjdGlvbnMgb3BlcmF0ZSBvbiB0aGUgY2FjaGUg
YmxvY2sgd2hvc2UgZWZmZWN0aXZlIGFkZHJlc3MKPiA+IGlzIHRoZSBzdW0gb2YgdGhlIGJhc2Ug
YWRkcmVzcyBzcGVjaWZpZWQgaW4gcnMxIGFuZCB0aGUgc2lnbi1leHRlbmRlZAo+ID4gb2Zmc2V0
IGVuY29kZWQgaW4gaW1tWzExOjBdLCB3aGVyZSBpbW1bNDowXSBzaGFsbCBlcXVhbCAwYjAwMDAw
LiBUaGUKPiA+IGVmZmVjdGl2ZSBhZGRyZXNzIGlzIHRyYW5zbGF0ZWQgaW50byBhIGNvcnJlc3Bv
bmRpbmcgcGh5c2ljYWwgYWRkcmVzcwo+ID4gYnkgdGhlIGFwcHJvcHJpYXRlIHRyYW5zbGF0aW9u
IG1lY2hhbmlzbXMuIgo+ID4gCj4gPiBTbywgdGhlIHVzZXIgb2YgcHJlZmV0Y2gudyBzaG91bGQg
a2VlcCBpbW1bNDowXSB6ZXJvLgo+IAo+IFllcywgdGhlIHVzZXIgX3Nob3VsZF8ga2VlcCBpbW1b
NDowXSB6ZXJvLiBVbmxlc3Mgd2UgY2FuIHZhbGlkYXRlIGF0Cj4gY29tcGlsZSB0aW1lIHRoYXQg
YWxsIHVzZXJzIGhhdmUgcGFzc2VkIG9mZnNldHMgd2l0aCB0aGUgbG93ZXIgNS1iaXRzCj4gc2V0
IHRvIHplcm8sIHRoZW4gSSB0aGluayB3ZSBzaG91bGQgbWFzayB0aGVtIGhlcmUsIHNpbmNlIEkn
ZCByYXRoZXIKPiBub3QgcHJvdmlkZSB0aGUgdXNlciBhIGZvb3RndW4uCj4gCj4gPiBKdXN0IGxp
a2UgdGhlCj4gPiBwYXRjaCBoYXMgZG9uZSwgdGhlIHdob2xlIGltbVsxMTowXSBpcyB6ZXJvLgo+
IAo+IFRoYXQncyBqdXN0IG9uZSBwb3NzaWJsZSB1c2UsIGFuZCBJIHRoaW5rIGV4cG9zaW5nIHRo
ZSBvZmZzZXQgb3BlcmFuZCB0bwo+IHVzZXJzIG1ha2VzIHNlbnNlIGZvciB1bnJvbGxlZCBzZXF1
ZW5jZXMgb2YgaW52b2NhdGlvbnMsIHNvIEkgd291bGRuJ3QKPiBjb3VudCBvbiBvZmZzZXQgYWx3
YXlzIGJlaW5nIHplcm8uCj4KCkFub3RoZXIgdGhvdWdodCBvbiB0aGlzIGxpbmUgaXMgdGhhdCBh
IGJhc2Ugd2hpY2ggaXNuJ3QgYmxvY2sgc2l6ZSBhbGlnbmVkCm1heSBub3QgIndvcmsiLiBUaGUg
c3BlYyBzYXlzCgoiIiIKLi4uaW5zdHJ1Y3Rpb24gaW5kaWNhdGVzIHRvIGhhcmR3YXJlIHRoYXQg
dGhlIGNhY2hlIGJsb2NrIHdob3NlIGVmZmVjdGl2ZQphZGRyZXNzIGlzIHRoZSBzdW0gb2YgdGhl
IGJhc2UgYWRkcmVzcyBzcGVjaWZpZWQgaW4gcnMxIGFuZCB0aGUKc2lnbi1leHRlbmRlZCBvZmZz
ZXQgZW5jb2RlZCBpbiBpbW1bMTE6MF0sIHdoZXJlIGltbVs0OjBdIGVxdWFscwowYjAwMDAwLCBp
cyBsaWtlbHkgdG8gYmUgYWNjZXNzZWQuLi4KIiIiCgp3aGljaCBpbXBsaWVzIHdlIG5lZWQgYW4g
ZWZmZWN0aXZlIGFkZHJlc3Mgd2hpY2ggbWFwcyB0byBhIGNhY2hlIGJsb2NrLgpIb3dldmVyLCB1
bmxpa2UgaGF2aW5nIGEgbm9uemVybyBpbW1bNDowXSwgSSBkb24ndCBmZWFyIGEgcHJvYmxlbSB3
aXRoIHRoZQppbnN0cnVjdGlvbiBpZiAnYmFzZScgaXNuJ3QgYmxvY2sgc2l6ZWQgYWxpZ25lZCwg
YnV0IHRoZSBpbnN0cnVjdGlvbiBtaWdodApub3QgZG8gYW55dGhpbmcuCgpJIHRoaW5rIHdlIG5l
ZWQgdG8gYWRkIERUIHBhcnNpbmcgb2YgcmlzY3YsY2JvcC1ibG9jay1zaXplIGFuZCB0aGVuCnVz
ZSBpdCB0byBtYXNrIHRoZSBiYXNlIGFkZHJlc3MgaW4gdGhlIGNhbGxlcnMgb2YgdGhlc2UgbWFj
cm9zLiAoQnV0CnRoYXQgZG9lc24ndCBtZWFuIEkgZG9uJ3QgdGhpbmsgd2Ugc3RpbGwgbmVlZCB0
byBtYXNrIG9mZnNldCBoZXJlLikKClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
