Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6B3CD610D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5abyus8hVXThUSgRLbA9DAzXhp46sNmisGbC6WHRLSk=; b=iBPWOObPdjt5OF
	q8cg7nBULYCEEsstdT7A2EroKEOJ+016i4kinyJ61IRpX+Ubm0ixFMHtZJQonfK9I1RJmaRHkgOUZ
	8J8c4azvc9E6uOGei2fGC0x25Le2kpaeTnOAxekVsd28f7yWyJku2mVBvGLsjla7sUKSG1hlf2lpX
	qnMkPqizmSucR9z3VTx6w0No/FPw8YfdSasjMUp+Rn1/8aRuWJHF/3fBmPfA8ksSS3DDy5LW+hBAu
	FJ/NCh5eFnN6u/1q2cxX8QUvKZXLAWcWKWRQpELYC/eQfbWV1FGFy5lsKHMoJCN0dwvmf5OSkwTR2
	XZYKg7A0CsV8hJiVMncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qptSv-00BE6y-0P;
	Mon, 09 Oct 2023 16:50:45 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qptSr-00BE6P-2t
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 16:50:43 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50585357903so6248236e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696870237; x=1697475037; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJDXlavivIJ5Ir+dS0Trwo03SWTxQmVEdSm/kPuKeCY=;
        b=hvAEz2UpS3+115yV8/sIKLCCEh0vj3qCpUi2faM+ttBZH08jRQamFxqjts0GvT13Vn
         gNITgfSDcPLJugbALxYo042S3EFx4ajkdNkalS28orSwWh/nnfBT30Z+Knt99hk+EXo3
         pMRIy0cJNa6PSoTGdbyycI/gFoZ/5KQ9l3V7Rn0eydsxn2FVVq0WPNIkm4rWWo11ybqw
         yu9xcodccgEpxfB0+piQcFkkakwCG4+tDF+CPxnYYZtI8jmNl7FzY36JvzLLfSpmU5K8
         lSAqWHoNFODcrOGiIBiLVMgSDbA2kSNHd6tIuhFEa/H4mk5RgwBPegUVmoHc+kRGxvbX
         RDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870237; x=1697475037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJDXlavivIJ5Ir+dS0Trwo03SWTxQmVEdSm/kPuKeCY=;
        b=Ht5zS8A+aOVv/H8v5A5fwemkbWQSU7+902DXzcmrE7ZQgmoWBvYDUEye5rHv93ti8L
         /vgLJXSGUoNOAh3l/A8tmRBNEXaEqbsyYKpko7tJHtMjJnrmfhO4MR4JB0tClRUkOhRp
         eJ3f8tgaPMysMz7MHIW4Ll4V8cYsHTToC71V0R+h8xUgYJI4q7LXdH4UHLGvGy5Jv9yU
         BxaI3ZrPDog6wbB3Y+wV7/wxpX/g41kpt3APbksr1FoJsydOLOHpT8jSIevjf7neJhMf
         c4wLK43TITc2FQ/uQmQWjPmhewGoYNcc/v+PkuXpYXG8B6kwGJWNXkKwcg8Fe0XGZEyt
         9K2Q==
X-Gm-Message-State: AOJu0YzflNobZBcULNuPs9wYGM83LKXEKZJo3YuND9DxycDODWWZUkvC
	rzTLZHwU8hQOoJQNgBfXBJSppfxdGZivMO7SJncvAQ==
X-Google-Smtp-Source: AGHT+IG3pLNUPdZWXdD4H4mixQ+yklF6BgIprzWtpVwL3A3ePzUpUfUXMU2FL5B2dkPYc9kH2UF9WZJmSMzyeXkJ5pE=
X-Received: by 2002:a05:6512:368f:b0:503:985:92c4 with SMTP id
 d15-20020a056512368f00b00503098592c4mr10387399lfs.52.1696870236675; Mon, 09
 Oct 2023 09:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230921125518.175428-7-ajones@ventanamicro.com>
 <20230921125518.175428-10-ajones@ventanamicro.com> <CALs-HstCDZK3BPpubW8FqWQ8w4qH-_Zfgv3YhUYOgguv-OWufw@mail.gmail.com>
 <20231005-f530ebe8df5c0880e53fcfa3@orel> <CALs-Hsu3QCvjm7ERTFHqF+GjqkfK2x_eUbca2OjD0TzrCukABA@mail.gmail.com>
 <20231005-5221bab223ee6d8a4c77b23d@orel> <20231009-26f43e41ddc98f0263f4258d@orel>
In-Reply-To: <20231009-26f43e41ddc98f0263f4258d@orel>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 9 Oct 2023 09:50:00 -0700
Message-ID: <CALs-HsubfzKEzi3BBNH2UHj9Oa77FbkKBxT34P_kqV5gX2OwJw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_095042_157584_38EB95F5 
X-CRM114-Status: GOOD (  28.39  )
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

T24gTW9uLCBPY3QgOSwgMjAyMyBhdCA4OjM54oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAwNSwgMjAyMyBhdCAwODoxMToy
NVBNICswMjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAwNSwgMjAyMyBh
dCAxMDoxMjoxNEFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9jdCA1
LCAyMDIzIGF0IDY6MjPigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgU2VwIDI1LCAyMDIzIGF0IDA5OjE2OjAx
QU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiAuLi4KPiA+ID4gPiA+IFNvIGlmIEkgd3Jp
dGUgb3V0IHRoaXMgYWxnb3JpdGhtLCBJIGdldCBzb21ldGhpbmcgbGlrZToKPiA+ID4gPiA+ICAq
IENyZWF0ZSBhbiBhcnJheSBvZiBldmVyeSBwb3NzaWJsZSBrZXksIGFuZCBkZWR1cGUgdGhlIGNh
bGxlcidzIGxpc3QKPiA+ID4gPiA+IG9mIHBhaXJzIGludG8gdGhpcyBhcnJheS4KPiA+ID4gPiA+
ICAqIEZvciBlYWNoIHJlbWFpbmluZyBjcHUsIGdvIHRocm91Z2ggdGhpcyBhcnJheSBhbmQgZWl0
aGVyIGNvbmZpcm0KPiA+ID4gPiA+IHRoZSBiaWcgYXJyYXkncyBlbGVtZW50IG1hdGNoZXMgdGhp
cyBjcHUncyB2YWx1ZSwgb3IgY2xlYXIgdGhlIGNwdQo+ID4gPiA+ID4gZnJvbSB0aGUgcmVzdWx0
IHNldC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBCdXQgd2h5IGRvIHdlIGdvIHRvIGFsbCB0aGUgZWZm
b3J0IG9mIGRlLWR1cGluZyB0aGUgY2FsbGVyJ3MgYXJyYXkgb2YKPiA+ID4gPiA+IHBhaXJzPyBD
YW4ndCB0aGV5IGRvIHRoYXQgdGhlbXNlbHZlcyAob3IgcGF5IGEgc21hbGwgcGVyZm9ybWFuY2UK
PiA+ID4gPiA+IHBlbmFsdHkgZm9yICJ5ZXMiIHJlc3VsdHMpPyBJbnN0ZWFkLCBjb3VsZG4ndCBp
dCBiZSBzb21ldGhpbmcgbGlrZToKPiA+ID4gPiA+IEZvciBlYWNoIHBhaXIgaW4gdGhlIHVzZXIn
cyBzZXQsIGZvciBlYWNoIHJlbWFpbmluZyBjcHUgaW4gdGhlIHNldCwKPiA+ID4gPiA+IGNvbXBh
cmUgdGhlIHZhbHVlcywgb3IgY2xlYXIgdGhlIGNwdSBpbiB0aGUgcmVtYWluaW5nIHNldC4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBEb2luZyB0aGF0IHdvdWxkIGFsc28gdGFrZSB0aGUgcnVudGltZSBm
cm9tIE8oa2V5c3BhY2UgKiBuY3B1cykgdG8KPiA+ID4gPiA+IE8ocXVlcnlfbGVuZ2ggKiBuY3B1
cykuCj4gPiA+ID4KPiA+ID4gPiBJIHdhbnQgdG8gZGUtZHVwZSBmb3IgdHdvIHJlYXNvbnM6Cj4g
PiA+ID4gICogcXVlcnlfbGVuZ3RoIGlzIHVuYm91bmRlZCwgYnV0IGtleXNwYWNlIGlzIGJvdW5k
ZWQgKGFuZCBpcyBjdXJyZW50bHkKPiA+ID4gPiAgICBzbWFsbCkKPiA+ID4KPiA+ID4gT2ssIGJ1
dCByZW1lbWJlciB0aGF0IGlmIHdlIHNoaXAgdGhpcyBiZWhhdmlvciB0b2RheSwgd2UncmUgY29t
bWl0dGVkCj4gPiA+IHRvIGl0IGZvcmV2ZXIuIFRoZSBrZXlzcGFjZSBpcyBsaWtlbHkgdG8gZ3Jv
dywgaXQgd291bGQgYmUgdW5mb3J0dW5hdGUKPiA+ID4gaWYgdGhpcyBzdGVwIHN0YXJ0ZWQgdG8g
Y2F1c2UgYSBub3RpY2VhYmxlIHBlcmZvcm1hbmNlIGRlbGF5Lgo+ID4KPiA+IE1heWJlIGl0J3Mg
bm90IHRvbyBsYXRlIHRvIHB1dCBhIGJvdW5kIG9uIHBhaXJzLCBpLmUuIHBhaXJfY291bnQgZ3Jl
YXRlcgo+ID4gdGhhbiBzb21lIG51bWJlciBzaG91bGQgcmV0dXJuIEUyQklHLgo+ID4KPgo+IFNj
cmF0Y2ggdGhpcyBpZGVhLiBJIHdlbnQgbG9va2luZyBmb3IgcHJlY2VkZW50IGZvciBsaW1pdGlu
ZyB0aGUgbGVuZ3RoIG9mCj4gaW5wdXQgYXJyYXlzIHRvIHN5c2NhbGxzLCBidXQgY291bGRuJ3Qg
ZmluZCBhbnkuIFRvIHRoZSBjb250cmFyeSwgSSBmb3VuZAo+IHRoYXQgbW92ZV9wYWdlcygpIHVz
ZWQgdG8gcmV0dXJuIEUyQklHIHdoZW4gdGhlcmUgd2VyZSAidG9vIG1hbnkgcGFnZXMgdG8KPiBt
b3ZlIiwgYnV0IGl0IGhhc24ndCBkb25lIHNvIHNpbmNlIDIuNi4yOSBhbmQsIGV2ZW4gdGhlbiwg
aXQgYXBwZWFycyB0aGUKPiBjb25jZXJuIHdhcyBtdWx0aXBsaWNhdGlvbiBvdmVyZmxvdywgbm90
IGhhdmluZyAidG9vIG11Y2giIHdvcmsuIFNvLCB3ZQo+IHNob3VsZCBsZWF2ZSB0aGUgbnVtYmVy
IG9mIHBhaXJzIHVuYm91bmRlZCwgYnV0LCB0b28gbWUsIHRoYXQgbWVhbnMgd2UKPiBzaG91bGQg
ZGUtZHVwZSwgc2luY2Ugd2UgY2FuIGRvIHRoZSBjb3B5X2Zyb21fdXNlcigpIG9uY2UgZm9yIGVh
Y2ggYXQgdGhhdAo+IHRpbWUsIGFuZCBhbnkgdXNlciB3aGljaCBkZWNpZGVzIHRvIHByb3ZpZGUg
ZWFjaCBiaXQgc2VwYXJhdGVseSBmb3IgZWFjaAo+IGJpdG1hc2sga2V5IHR5cGUgc2hvdWxkIGdl
dCB0aW55IHNwZWVkdXAuCgpJIHN0aWxsIGRvbid0IGdldCB0aGUgdXNlY2FzZSB3aGVyZSB1c2Vy
bW9kZSBpcyBnb2luZyB0byBiZSBzdWJtaXR0aW5nCnRoaXMgbGFyZ2UganVtYmxlIG9mIGtleXMs
IHJlcGxldGUgd2l0aCBtYW55IGR1cGxpY2F0ZXMuIEFuZCBldmVuIGlmCnN1Y2ggYSBjYXNlIGRp
ZCBleGlzdCwgd2h5IHNob3VsZCB0aGUga2VybmVsIGJlIHRoZSBvbmUgZGVkdXBpbmcsCmRyYWdn
aW5nIGluIGEgcnVudGltZSBwZW5hbHR5IGZvciBhbGwgb3RoZXIgY2FsbGVycyB0aGF0IGRpZG4n
dCBzdWJtaXQKZHVwbGljYXRlcy4gVXNlcm1vZGUgY291bGQgZGUtZHVwZSBvbiB0aGVpciBvd24g
SSdkIHRoaW5rLgoKLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
