Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928C9D7877D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMGkXHCkIY1vl1tNIXKGerc4jSqZNI68reIIWfy4iT4=; b=M1kXw0mqGMdoCY
	q0t0WTiTS3WyOmbTalOH7Nh7/BF0QGJ5zidu2qSUzaZeqW1/IQvmAONUacRziC2D/dbfjWxzvlqJi
	W5AdbwPOJ0/wZv+chPkyOQUEskPnS1Xt5IhT9HOgwLgVQpc1EPD8UrsTDqmYd4+vYeu1LIwYwiq9S
	Jh3Z3NfxPmiuMYOcDGAcLpYBCjJRyP1/HbAhbCeVf2snRLly2YUZhBou066p70E9KP61APtopPAGF
	47FZNFnKA7urVsBoucpnrJgzn1DaZP552bDhWBZ3aUMOlPP1Fwhf5L3CgGENqywLvyiJ1UaQM/A1l
	dMhRLkVyWsyUXYZvWL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWb68-0000000ANyU-0OxU;
	Fri, 19 Dec 2025 14:04:48 +0000
Received: from mail-yx1-xb142.google.com ([2607:f8b0:4864:20::b142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWb65-0000000ANy6-2W3I
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 14:04:47 +0000
Received: by mail-yx1-xb142.google.com with SMTP id 956f58d0204a3-644715aad1aso2120527d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 06:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766153084; x=1766757884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGxqoB7Y4Q+aOAQo4uC0e9A1qBgkvdCsyCbyewI9lPY=;
        b=T9tjt14mqcu5ADe6Lk1nRV3fqjafUX/VZ2n4P84H7rUbzKx8/svxS57dIv2pX40vxK
         U1Ol6uYpVNvT30vG3hG1WbIqXsVAquvdVx8NGK1Uer0nPdLeudzGIAl9p/q3j+4aTfsd
         2l8Eq2fVgArZq04UsIHv3xBnIsKtxvxwE1qjl5mEisx1weNZwcWwBVe1ePvU7szpfxqB
         4l+H0nsuV0Up3t90zlAGTtRSpFhqN7EBkh+UPbvdFPvsJaNdcbowCocXhUUofrLO0zuT
         J8aklBszL0oueRsxJ7LlCJlHuDTdsfCpsnTOSfB/8lgSKzox3uLhN3Z41R096ASYBZ1C
         Zcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766153084; x=1766757884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EGxqoB7Y4Q+aOAQo4uC0e9A1qBgkvdCsyCbyewI9lPY=;
        b=acDLEw4gLqFBPsG1dXSLDrbanLF1h8nTMT2SjrfQ86ujNuH8UTlCZ4kXdAJivYXQbW
         5SiYkzgp4yZrC8LJJPnUHheY5np8ZBq/i5Jki+g4TtcDFtunI+aLCg+2TJgLLh4vHNWu
         Wnn0JhFVvEIUL3l4wrkCDegGntMKFj8lJCmOp7QJFxpBs4sGf8AZdCeL0C3mtOebwj+F
         a0fwdHM1l/3t4k+oZHRbOpAWgohxyZYo6lVzFRB7pRPKA2z9KAcD7c/hZ2CsA0SsN/pd
         4Bgs1XU9rqB+z+HnSXdvjxT9tSmeqqw9cdhDzzzm90HSyEJ66vZRjpG0Zmk/UOH10udg
         hIQA==
X-Forwarded-Encrypted: i=1; AJvYcCWp3RJ5YuMUDYM+IpDNPtIP5JpPkM0GgJkvADs3iOYwn0U7ZJIH5+ai8vQhmT8idEr47Kb9mR8n7q5ZOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAUOcGEQx+UbPMVvybSnvgPf+2kiAUOSFNjs1TT/kHKdIX7htH
	oStAw8QowgcrfKlfVpqTEMhgbkV4LMlEVpMmg3gQXp5/arpu2/iwX43tE9m1T2YaTj3mbgANEjZ
	hkj8RrdvfizhhtPkQtr6mi7987tVQZkY=
X-Gm-Gg: AY/fxX6rSa/o9uq67RAzlbUI1XRcJVLZLNrJ5tTv7O3ufgGLQdDhSLmdq8lT1El0dOG
	p5kCd9dVxKirgRuVseajPorAQWghuxCabRYWYN1Qkep3CKxSQ3aJtEKFChwKIerJY+fco6X4pzk
	JUlRiNS7nYoUEKJ+WWuVRA2QEvKdGpufp6mdncZEE/zMn4fgAOId3eRb6ZWcIEA3kin9Pd0V0th
	3Rtl5aZYCaUP7mUZtuLoN3Y1eB4h+mx1A97TgZG1hT3pmUuNbJL80ob0z4ehSvktpAM93v79zY=
X-Google-Smtp-Source: AGHT+IFe5VQEy4+st1yZpJ90yvWkO9sdYhLBqjXP1Svo3qIeSORvrFBH7F5HtDjDOBbEu4XaMNwh4a68BzkqLovyvi0=
X-Received: by 2002:a05:690e:1242:b0:63f:c019:23b2 with SMTP id
 956f58d0204a3-6466329e6b7mr4564629d50.28.1766153084263; Fri, 19 Dec 2025
 06:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20251118123639.688444-1-dongml2@chinatelecom.cn>
 <875xa2g0m0.fsf@igel.home> <5070743.31r3eYUQgx@7950hx> <1948844.tdWV9SEqCh@7950hx>
 <87cy4aeg56.fsf@igel.home>
In-Reply-To: <87cy4aeg56.fsf@igel.home>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Fri, 19 Dec 2025 22:04:32 +0800
X-Gm-Features: AQt7F2ruKyHMhyl2Amo3LqNoWlaqpaF_0zgXhcG3nHKrhX2LjLD44Yver_XU5ik
Message-ID: <CADxym3Y098836fHHRSjeryxCp=CPB8sDU19TBBVs07VZOERJXw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Menglong Dong <menglong.dong@linux.dev>, ast@kernel.org, rostedt@goodmis.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, mhiramat@kernel.org, 
	mark.rutland@arm.com, mathieu.desnoyers@efficios.com, jiang.biao@linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_060445_667346_54BF3C2E 
X-CRM114-Status: GOOD (  13.38  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgOTo0OeKAr1BNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gT24gRGV6IDE5IDIwMjUsIE1lbmdsb25nIERvbmcg
d3JvdGU6Cj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
IGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4gaW5kZXggNWY5NDU3ZTkxMGU4
Li4wOWI3MGJmMzYyZDMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gPiBAQCAt
MTEzNCw3ICsxMTM0LDcgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGlu
ZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwKPiA+ICAgICAgIHN0b3JlX2FyZ3MobnJfYXJn
X3Nsb3RzLCBhcmdzX29mZiwgY3R4KTsKPiA+Cj4gPiAgICAgICAvKiBza2lwIHRvIGFjdHVhbCBi
b2R5IG9mIHRyYWNlZCBmdW5jdGlvbiAqLwo+ID4gLSAgICAgaWYgKGZsYWdzICYgQlBGX1RSQU1Q
X0ZfT1JJR19TVEFDSykKPiA+ICsgICAgIGlmIChmbGFncyAmIEJQRl9UUkFNUF9GX0NBTExfT1JJ
RykKPiA+ICAgICAgICAgICAgICAgb3JpZ19jYWxsICs9IFJWX0ZFTlRSWV9OSU5TTlMgKiA0Owo+
Cj4gVGhlcmUgYXJlIG5vdyB0aHJlZSBvY2N1cnJlbmNlcyBvZiB0aGF0IGNvbmRpdGlvbiwgYW5k
IG9ubHkgdGhlIHRoaXJkCj4gb25lIHVzZXMgb3JpZ19jYWxsLiAgSG93IGFib3V0IG1lcmdpbmcg
dGhlbT8KClllYWgsIEkgdGhpbmsgd2UgY2FuIG1lcmdlIGl0IHRvIHRoZSB0aGlyZCBvbmUsIGxp
a2UgdGhpczoKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwppbmRleCA1Zjk0NTdlOTEwZTguLjM3ODg4
YWJlZTcwYyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYworKysg
Yi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCkBAIC0xMTMzLDEwICsxMTMzLDYgQEAg
c3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QKYnBmX3RyYW1w
X2ltYWdlICppbSwKCiAgICAgICAgc3RvcmVfYXJncyhucl9hcmdfc2xvdHMsIGFyZ3Nfb2ZmLCBj
dHgpOwoKLSAgICAgICAvKiBza2lwIHRvIGFjdHVhbCBib2R5IG9mIHRyYWNlZCBmdW5jdGlvbiAq
LwotICAgICAgIGlmIChmbGFncyAmIEJQRl9UUkFNUF9GX09SSUdfU1RBQ0spCi0gICAgICAgICAg
ICAgICBvcmlnX2NhbGwgKz0gUlZfRkVOVFJZX05JTlNOUyAqIDQ7Ci0KICAgICAgICBpZiAoZmxh
Z3MgJiBCUEZfVFJBTVBfRl9DQUxMX09SSUcpIHsKICAgICAgICAgICAgICAgIGVtaXRfaW1tKFJW
X1JFR19BMCwgY3R4LT5pbnNucyA/IChjb25zdCBzNjQpaW0gOgpSVl9NQVhfQ09VTlRfSU1NLCBj
dHgpOwogICAgICAgICAgICAgICAgcmV0ID0gZW1pdF9jYWxsKChjb25zdCB1NjQpX19icGZfdHJh
bXBfZW50ZXIsIHRydWUsIGN0eCk7CkBAIC0xMTcxLDYgKzExNjcsOCBAQCBzdGF0aWMgaW50IF9f
YXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdApicGZfdHJhbXBfaW1hZ2UgKmltLAog
ICAgICAgIH0KCiAgICAgICAgaWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfQ0FMTF9PUklHKSB7Cisg
ICAgICAgICAgICAgICAvKiBza2lwIHRvIGFjdHVhbCBib2R5IG9mIHRyYWNlZCBmdW5jdGlvbiAq
LworICAgICAgICAgICAgICAgb3JpZ19jYWxsICs9IFJWX0ZFTlRSWV9OSU5TTlMgKiA0OwogICAg
ICAgICAgICAgICAgcmVzdG9yZV9hcmdzKG1pbl90KGludCwgbnJfYXJnX3Nsb3RzLApSVl9NQVhf
UkVHX0FSR1MpLCBhcmdzX29mZiwgY3R4KTsKICAgICAgICAgICAgICAgIHJlc3RvcmVfc3RhY2tf
YXJncyhucl9hcmdfc2xvdHMgLSBSVl9NQVhfUkVHX0FSR1MsCmFyZ3Nfb2ZmLCBzdGtfYXJnX29m
ZiwgY3R4KTsKICAgICAgICAgICAgICAgIHJldCA9IGVtaXRfY2FsbCgoY29uc3QgdTY0KW9yaWdf
Y2FsbCwgdHJ1ZSwgY3R4KTsKCj4KPiAtLQo+IEFuZHJlYXMgU2Nod2FiLCBzY2h3YWJAbGludXgt
bTY4ay5vcmcKPiBHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2OSAyNTEw
ICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKPiAiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBs
ZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
