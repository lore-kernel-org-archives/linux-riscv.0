Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EF0D5AE7D
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDNtzIkF2gYgA8/xI4cmaHnT4E7V7tMWb6cOzCHqkbM=; b=of1WydmzX58lYa
	lOAgI35Osq3YyYyG7fabAAzeWM19gJ9ZRZ28EzHV33jsPgrV/Vp1CpCI/vY3Xlu9sBl/vYKuZvWRt
	DD54ONYCXZV/8yB0DVSOVUz6NgRz1HMnjfxMNcDko4yyT1Py8u5vzV30VAXjhzrwSz2M2gerAEPlb
	9bOEKegfxWHRU0nD94n+HXEX1WD5QMC5BIXOMSyXYgdsL/2zvVXvroffiy0dyT2bUV18iisRxM36+
	9432Uus+1qXfKVjRBjNPEDQVnav9D5sqxv+ONgDLak9/wykb35kFM7DeSeoNc0EgpPzhpwjlm/L3p
	R+gK0gMYPu0S/slcr9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zUz-00000006QIj-2GMa;
	Thu, 07 Nov 2024 10:12:21 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zS0-00000006PZq-1aNe
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 10:09:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5cefc36c5d4so1007738a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 02:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730974154; x=1731578954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpDrSskUv1o1NTarlsHfGOMJt+ymu1r/HgLDqyVtDWA=;
        b=x7vJTww6KoN95IYcZ3RD2619PnAxXCHK2SwIxkW7I3lSOVdzZ0MjVCdvaHC/gZRD8u
         92ZCrn5/NTvm5bS4jG/EJ1qH9iJ156CiqHQUAXbl60N7Rr9dkiXn8Q0FcipG6t37llZZ
         /L5JGSpBtY9pguBFNCN1d3u4EFckUE1pZQMTXpSwolagu2kLwQKbWq8MpBlu6yikFXym
         910SBfoX/QRMrnGsjdmV+kGc4Bohy+rO3qxjWnLCOnsvFScp4pl86FNu+AgSt9zPwYI/
         f8sXMRXxpVQAMR0FfhvjjwwFvBZcc65FJnCOacCpgpcX9o1Krv9GzxEHDU1bf5mByt9m
         pFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730974154; x=1731578954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpDrSskUv1o1NTarlsHfGOMJt+ymu1r/HgLDqyVtDWA=;
        b=ZWQzctkSzztSn9iLghhFHTzz9ZteRu8AQAF98HFc1tvZ5W2WUsOWFM1Nm9SjitHnhX
         c2N9rqiRzol7SGcIbjXGzMA7H4tDNMHCIhRIfmqDynUV1M9egjpo8mIVjpnLuXL5bfiF
         7wBiZhWFNh3c7RHw57tUKK/Xq6kpYM3Gg3t1Zsor2Bm8i3qbsI/SgYsnJX3gZuot53bH
         yAvHxznd1SHCmmfqyNsdYBwfkCmaf6ZMQaJOO0JFhPgOxN7zOLY5AdxUE0a1HJYehf0E
         /9wGeatvJx1v/qGNZJ/Z6Sj1gJw5d228Zeyud4ux8r0Ky4VFjfCeNVPwugGFYq5tLqGS
         GSBw==
X-Forwarded-Encrypted: i=1; AJvYcCUusNtcQm0orwYPeCIhCYDpqmB8dssA2QqGoHcgUDWhmUQBLcsB5aENgN99oMil0IIQKIufP41sWpulug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo3dYU+O8Bi/RFLWY2re2E3hZ4WlojPA0jwjHdROibIq2RbXMu
	Y/+tQZD5py5AKEhrRpuqTqL70Tr5ykS904Z5fFFp4/ldy8hBzaBs3+QOV8mYcwart6arrMrJ5HS
	25/15WBYfXNPrKXIcX0LLESrYcm3NUtGr4VgNFw==
X-Google-Smtp-Source: AGHT+IERZV6Psk5Yyx4TfQfVXmINj5F1hDhQ/XqQ1JTLYObIeW3O+9WxU1vcOqYi3njcPAbsIOTANJXFovMSGP962Q4=
X-Received: by 2002:a05:6402:50cf:b0:5cf:529:1e73 with SMTP id
 4fb4d7f45d1cf-5cf05291f47mr741826a12.13.1730974154217; Thu, 07 Nov 2024
 02:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20241106193208.290067-1-bjorn@kernel.org> <20241107091307.GA2016393@myrica>
In-Reply-To: <20241107091307.GA2016393@myrica>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 7 Nov 2024 11:09:03 +0100
Message-ID: <CAHVXubh4A9JY2hVzYW0ES1QxfLL2iYczXBCcr5OXsrYoZcWJKw@mail.gmail.com>
Subject: Re: [PATCH] tools: Override makefile ARCH variable if defined, but empty
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Quentin Monnet <qmo@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Abdurachmanov <davidlt@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_020916_647957_EB1B27A1 
X-CRM114-Status: GOOD (  22.07  )
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

SGkgQmrDtnJuLAoKT24gVGh1LCBOb3YgNywgMjAyNCBhdCAxMDoxMuKAr0FNIEplYW4tUGhpbGlw
cGUgQnJ1Y2tlcgo8amVhbi1waGlsaXBwZUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwg
Tm92IDA2LCAyMDI0IGF0IDA4OjMyOjA2UE0gKzAxMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4g
PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gPgo+ID4gVGhlcmUg
YXJlIGEgbnVtYmVyIG9mIHRvb2xzIChicGZ0b29sLCBzZWxmdGVzdHMpLCB0aGF0IHJlcXVpcmUg
YQo+ID4gImJvb3RzdHJhcCIgYnVpbGQuIEhlcmUsIGEgYm9vdHN0cmFwIGJ1aWxkIGlzIGEgYnVp
bGQgaG9zdCB2YXJpYW50IG9mCj4gPiBhIHRhcmdldC4gRS5nLiwgYXNzdW1lIHRoYXQgeW91J3Jl
IHBlcmZvcm1pbmcgYSBicGZ0b29sIGNyb3NzLWJ1aWxkIG9uCj4gPiB4ODYgdG8gcmlzY3YsIGEg
Ym9vdHN0cmFwIGJ1aWxkIHdvdWxkIHRoZW4gYmUgYW4geDg2IHZhcmlhbnQgb2YKPiA+IGJwZnRv
b2wuIFRoZSB0eXBpY2FsIHdheSB0byBwZXJmb3JtIHRoZSBob3N0IGJ1aWxkIHZhcmlhbnQsIGlz
IHRvIHBhc3MKPiA+ICJBUkNIPSIgaW4gYSBzdWItbWFrZS4gSG93ZXZlciwgaWYgYSB2YXJpYWJs
ZSBoYXMgYmVlbiBzZXQgd2l0aCBhCj4gPiBjb21tYW5kIGFyZ3VtZW50LCB0aGVuIG9yZGluYXJ5
IGFzc2lnbm1lbnRzIGluIHRoZSBtYWtlZmlsZSBhcmUKPiA+IGlnbm9yZWQuCj4gPgo+ID4gVGhp
cyBzaWRlLWVmZmVjdCByZXN1bHRzIGluIHRoYXQgQVJDSCwgYW5kIHZhcmlhYmxlcyBkZXBlbmRp
bmcgb24gQVJDSAo+ID4gYXJlIG5vdCBzZXQuCj4gPgo+ID4gV29ya2Fyb3VuZCBieSBvdmVycmlk
aW5nIEFSQ0ggdG8gdGhlIGhvc3QgYXJjaCwgaWYgQVJDSCBpcyBlbXB0eS4KPiA+Cj4gPiBGaXhl
czogODg1OWIwZGE1YWFjICgidG9vbHMvYnBmdG9vbDogRml4IGNyb3NzLWJ1aWxkIikKPiA+IFNp
Z25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+IFJldmll
d2VkLWJ5OiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4K
Pgo+ID4gLS0tCj4gPiAgdG9vbHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNoIHwgNCArKy0tCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNoIGIvdG9vbHMvc2NyaXB0cy9N
YWtlZmlsZS5hcmNoCj4gPiBpbmRleCBmNmE1MGYwNmRmYzQuLmVhYmZlOWY0MTFkOSAxMDA2NDQK
PiA+IC0tLSBhL3Rvb2xzL3NjcmlwdHMvTWFrZWZpbGUuYXJjaAo+ID4gKysrIGIvdG9vbHMvc2Ny
aXB0cy9NYWtlZmlsZS5hcmNoCj4gPiBAQCAtNyw4ICs3LDggQEAgSE9TVEFSQ0ggOj0gJChzaGVs
bCB1bmFtZSAtbSB8IHNlZCAtZSBzL2kuODYveDg2LyAtZSBzL3g4Nl82NC94ODYvIFwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLWUgcy9zaFsyMzRdLiovc2gvIC1lIHMv
YWFyY2g2NC4qL2FybTY0LyBcCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC1lIHMvcmlzY3YuKi9yaXNjdi8gLWUgcy9sb29uZ2FyY2guKi9sb29uZ2FyY2gvKQo+ID4KPiA+
IC1pZm5kZWYgQVJDSAo+ID4gLUFSQ0ggOj0gJChIT1NUQVJDSCkKPiA+ICtpZmVxICgkKHN0cmlw
ICQoQVJDSCkpLCkKPiA+ICtvdmVycmlkZSBBUkNIIDo9ICQoSE9TVEFSQ0gpCj4gPiAgZW5kaWYK
PiA+Cj4gPiAgU1JDQVJDSCA6PSAkKEFSQ0gpCj4gPgo+ID4gYmFzZS1jb21taXQ6IDc3NThiMjA2
MTE3ZGFiOTg5NGYwYmNiODMzM2Y4ZTQ3MzFjNTA2NWEKPiA+IC0tCj4gPiAyLjQ1LjIKPiA+CgpZ
b3UgY2FuIGFkZDoKClRlc3RlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
