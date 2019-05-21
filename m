Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66953C04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 14:12:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB6120863
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 14:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wyfs9BXc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNYz8G8G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB6120863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84tKT6lDARs0MYmTwL0b0wokb4g6OEogYYnwufL1i78=; b=Wyfs9BXcNL0GJU
	UqVhPYFGILipOXheygwi7zmBcrJwavSxTbm5lHbxxekyBlQLVexiwBhEJC0U1amo3EWKTBz0rbRtc
	N5sHEkiOckCUDyt+FBGoqhcu/X2IqHMA5wgYWyhlnJrzz9FfTKRCdZCLcz2yABiiaY0gdqbzSZAFi
	KzxypLdjnrvqFts9ykSpH4S3aqqsr9yyYRFGSeWyw8gTF5lO2dA9YHnl8jlq5FjV50GiytlhV7abd
	eSiHoNOSahKcwW1f3WqGOKTquiwTjYFyDxOkqB/8QmEPRrXfxcfiwqpDcxxl7NYT/txPqGAny4fsv
	DuQvM07raLpi6ILl6ErA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT5VF-0007FS-46; Tue, 21 May 2019 14:12:29 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT5VB-0007ES-Pq
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 14:12:27 +0000
Received: by mail-qt1-x843.google.com with SMTP id y22so20593076qtn.8
 for <linux-riscv@lists.infradead.org>; Tue, 21 May 2019 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rVA8ZXa5QV70YbDkp9YT649xx7f+jYEVyeJZQPdGZGI=;
 b=KNYz8G8G4wqF9SLMz5UEP4uBbsSM4rUp4hWf01LMjBMjO2XIE07a1flfbw9ui96ly8
 58EKW9x2wtdWP9Jf0OPZc8As/B2RAQbV16WAysvvHzT/hYgDAeEXFS6gD1PHiu2mYfr9
 NP6/my/3g03VULmDbVry/uyE6MT6RpMM9t9zzXsnvR05KUXKzg7yuSC0QJQmPiRmBer9
 JNcPgwCmd8lAHCAk8Fy+7E57SpB3Bp2mPBL46WB0IZjE4L5EUR15uFM7S525EtWCcuOW
 2lgE14Ns+nQPOAQqiA1O9jf2LO/Jnv2QAgLnp/eKdZMo1QrqboWuj+C25IsYp/th3bWh
 mU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rVA8ZXa5QV70YbDkp9YT649xx7f+jYEVyeJZQPdGZGI=;
 b=uPaJFA35qfrSSwpukmKorof3uXDzrWRbLhLY0qqNNrBUGK+uPh2vgUERiveJlVWTwh
 +imv3KKxNxMhk78NwrO6Myt2O0BWMYWtkW7sTBQPr0tLbHptTJ20Cp40W8mwWbwv1QKN
 mAWP4Y4VQ7srxwaqid8J7jBMve/YIfuV+ObOEL3CvAgL/V1m/tiCLN42M2BSLTvEd9Cb
 nySQ3twHNp0ynIhguRCkuAm/aoMMA//ObmCRRcl3xm0/i46y8aL6Fx2F0Iy4X/3hgShk
 Ympp37JYYLzt7Yoa1Kd/YleGJVaFk83AVQqRO5Ag3rcNuxBeEE8VSwhB+zJzFZu4PRKa
 Ga0A==
X-Gm-Message-State: APjAAAW6T84hlCEDyIcbRunfpLtUQIvPoxf2MA06qnnatF1gAxyGeDAv
 KD4hVchqAda9eh+yK62FW8pTCt434ECKtzV7Kek=
X-Google-Smtp-Source: APXvYqwHkfhO09nfqXTpuVxldFIRdO0RMLVbZeU5cizeLi02ooz5wI8k00zFMkwUb/epZfzKv3dSc4oCnb7Il6LCIF0=
X-Received: by 2002:a0c:8931:: with SMTP id 46mr39016420qvp.3.1558447944471;
 Tue, 21 May 2019 07:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190521134622.18358-1-bjorn.topel@gmail.com>
 <49999b2d-f025-894a-be61-a52d13b24678@iogearbox.net>
In-Reply-To: <49999b2d-f025-894a-be61-a52d13b24678@iogearbox.net>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 21 May 2019 16:12:12 +0200
Message-ID: <CAJ+HfNifkxKz8df7gLBuqWA6+t6awrrRK6oW6m1nAYETJD+Vfg@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf, riscv: clear target register high 32-bits for
 and/or/xor on ALU32
To: Daniel Borkmann <daniel@iogearbox.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_071225_844396_F5022262 
X-CRM114-Status: GOOD (  14.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jiong Wang <jiong.wang@netronome.com>, Netdev <netdev@vger.kernel.org>,
 linux-riscv@lists.infradead.org, bpf <bpf@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMSBNYXkgMjAxOSBhdCAxNjowMiwgRGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9n
ZWFyYm94Lm5ldD4gd3JvdGU6Cj4KPiBPbiAwNS8yMS8yMDE5IDAzOjQ2IFBNLCBCasO2cm4gVMO2
cGVsIHdyb3RlOgo+ID4gV2hlbiB1c2luZyAzMi1iaXQgc3VicmVnaXN0ZXJzIChBTFUzMiksIHRo
ZSBSSVNDLVYgSklUIHdvdWxkIG5vdCBjbGVhcgo+ID4gdGhlIGhpZ2ggMzItYml0cyBvZiB0aGUg
dGFyZ2V0IHJlZ2lzdGVyIGFuZCB0aGVyZWZvcmUgZ2VuZXJhdGUKPiA+IGluY29ycmVjdCBjb2Rl
Lgo+ID4KPiA+IEUuZy4sIGluIHRoZSBmb2xsb3dpbmcgY29kZToKPiA+Cj4gPiAgICQgY2F0IHRl
c3QuYwo+ID4gICB1bnNpZ25lZCBpbnQgZih1bnNpZ25lZCBsb25nIGxvbmcgYSwKPiA+ICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgYikKPiA+ICAgewo+ID4gICAgICAgcmV0dXJuICh1bnNpZ25l
ZCBpbnQpYSAmIGI7Cj4gPiAgIH0KPiA+Cj4gPiAgICQgY2xhbmctOSAtdGFyZ2V0IGJwZiAtTzIg
LWVtaXQtbGx2bSAtUyB0ZXN0LmMgLW8gLSB8IFwKPiA+ICAgICAgIGxsYy05IC1tYXR0cj0rYWx1
MzIgLW1jcHU9djMKPiA+ICAgICAgIC50ZXh0Cj4gPiAgICAgICAuZmlsZSAgICJ0ZXN0LmMiCj4g
PiAgICAgICAuZ2xvYmwgIGYKPiA+ICAgICAgIC5wMmFsaWduICAgICAgICAzCj4gPiAgICAgICAu
dHlwZSAgIGYsQGZ1bmN0aW9uCj4gPiAgIGY6Cj4gPiAgICAgICByMCA9IHIxCj4gPiAgICAgICB3
MCAmPSB3Mgo+ID4gICAgICAgZXhpdAo+ID4gICAuTGZ1bmNfZW5kMDoKPiA+ICAgICAgIC5zaXpl
ICAgZiwgLkxmdW5jX2VuZDAtZgo+ID4KPiA+IFRoZSBKSVQgd291bGQgbm90IGNsZWFyIHRoZSBo
aWdoIDMyLWJpdHMgb2YgcjAgYWZ0ZXIgdGhlCj4gPiBhbmQtb3BlcmF0aW9uLCB3aGljaCBpbiB0
aGlzIGNhc2UgbWlnaHQgZ2l2ZSBhbiBpbmNvcnJlY3QgcmV0dXJuCj4gPiB2YWx1ZS4KPiA+Cj4g
PiBBZnRlciB0aGlzIHBhdGNoLCB0aGF0IGlzIG5vdCB0aGUgY2FzZSwgYW5kIHRoZSB1cHBlciAz
Mi1iaXRzIGFyZQo+ID4gY2xlYXJlZC4KPiA+Cj4gPiBSZXBvcnRlZC1ieTogSmlvbmcgV2FuZyA8
amlvbmcud2FuZ0BuZXRyb25vbWUuY29tPgo+ID4gRml4ZXM6IDIzNTNlY2M2ZjkxZiAoImJwZiwg
cmlzY3Y6IGFkZCBCUEYgSklUIGZvciBSVjY0RyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybi50b3BlbEBnbWFpbC5jb20+Cj4KPiBXYXMgdGhpcyBtaXNzZWQgYmVjYXVz
ZSB0ZXN0X3ZlcmlmaWVyIGRpZCBub3QgaGF2ZSB0ZXN0IGNvdmVyYWdlPwoKWXVwLCBhbmQgSmlv
bmcgbm90ZWQgaXQuCgo+IElmIHNvLCBjb3VsZCB5b3UgZm9sbG93LXVwIHdpdGggYWx1MzIgdGVz
dCBjYXNlcyBmb3IgaXQsIHNvIG90aGVyCj4gSklUcyBjYW4gYmUgdHJhY2tlZCBmb3IgdGhlc2Ug
a2luZCBvZiBpc3N1ZSBhcyB3ZWxsLiBXZSBzaG91bGQKPiBwcm9iYWJseSBoYXZlIG9uZSBmb3Ig
ZXZlcnkgYWx1MzIgYWx1IG9wIHRvIG1ha2Ugc3VyZSBpdCdzIG5vdAo+IGZvcmdvdHRlbiBhbnl3
aGVyZS4KPgoKSSdsbCBoYWNrIGEgdGVzdF92ZXJpZmllciB0ZXN0IHJpZ2h0IGF3YXkuCgpUaGFu
a3MsCkJqw7ZybgoKCj4gVGhhbmtzLAo+IERhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
