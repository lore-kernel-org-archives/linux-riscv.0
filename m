Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551ABC02181
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 00:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suMOn9SqoLXJJIkY1UPnsB2vkwWUAI3RMl4s3tv/KoA=; b=Q4j71rZhDrjnVn
	5BtFWYGy98KzyR3TvES83WUw6Y3X2BOKErTKzLf71RjlutPx2KJyjP3uVbjvZsF2YNyH/MKv8k8Wf
	yfpj26atifK7ZY3h80cRksS/raAwrLr8aPqK3C7xmdZLWHMDAU2svdKm+vN6XprUGev1KkOepyNqL
	DO9TE3c1HCuKb/SDxKusgJAlmWccIO/2qzXir/dUpp4T2d15hE98OVqus1+nB/zpmUSDEYDpDpMQ0
	TbLOu1eWWEI4gioHBMSofjOOgUQWbd94RL7MGPkntrYbpocLeFgQnJanHR9FDh3q26HXr89g2Skg3
	n3k6oQzD/5PD/DZqZhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1takxu-0000000BRRu-2qZl;
	Thu, 23 Jan 2025 00:20:58 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1takxr-0000000BRRV-4AdQ
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 00:20:57 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4afdf8520c2so110465137.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 16:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737591654; x=1738196454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQYmS/K43Vh7Ly2e6rLyN5ogWE84SBYmvh5FEE5WcR0=;
        b=Xs6AJf4VKhkJKDtxcqYwzLRFvPFxQuWmV5SSiERf8gdVykzg4gtAMwGN+rCbtRdICn
         mqjZUSlIU13k0BTEmINtJgc8V4/vMmDcBPSSjh/sig+kx/PgiRaj2ZQ0rbZLYwtAcm4V
         izSMKFZzoHUURdvQmf1fD0mTzBh+/9yjL5vAR9TLQ+j9UM3G2Yu1RAvEwkpMIpcWX2KX
         IpE9qenmOZFTsRp6eYDM1BBPyHbMxbpwhO3W+J+LqxzhQ5p7Tmb2Jrczm1DVMcazkXlu
         zGz7VVFyeYXhaVHrN+hsjDnFEyX9padsvexZ7iJjDpCZB7V3nKyzrdiYKEAO6MSJ9Kcu
         aNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737591654; x=1738196454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQYmS/K43Vh7Ly2e6rLyN5ogWE84SBYmvh5FEE5WcR0=;
        b=bQbGy4SConYHWfzF40lPo8RNkUgyVOASAccXzhb0XkZZpVkl8dxuQnVHmHClP4IbiR
         Lv0YEEMWjd7+4/RTStYNiqqgefJwzxkLFhzBPN7l86pk+K88NsrHt9kqWNvaNiaSTJoP
         IJYW53Hay8449iSRpPMOhX4Q470Mz9LS99VtLcaeu1Zokx09X62mLK0vpucFdSk9VMbu
         wDZWohe+uyJmFIcBJYBoTCqfte5LyOClxLwklaQYsXNCfLyeDsj3VLbfawGc+m5K9wZ7
         pWZ9ew274Zvwz9iTDFXhcfnBXfxsmBRocEwc3048GQuJZ2Csoj2kwSurqxIOxYbGYdFc
         blnA==
X-Forwarded-Encrypted: i=1; AJvYcCWiSVNM0F7nuh+XY/131/Rtgc5pskIJFKMrXjO6GePTXXI4xogPgtgtqjuwg8gxXdH1H2EKpYfBnUMLNg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Re2ozmZISonkQSEr7KRJ+SgmJx6BOhmH9fn5rhp6TSOkIpZL
	EMqQUBMqzQlWBWmuOO2EfYjwAcz/p4DKEUd0fYkfehcNH1XF4tMElJ5nAkox72fLejFxucfuDgn
	JbW2YKw01UqsbEw16oI5etR6vF8EOHkTIDdIh8g==
X-Gm-Gg: ASbGncu/97PWRj+qhCQyPVJHsJ1BvOCGEuLpTZNuK2KnP5ajSsOZ22RUrHbWZFid06/
	YXY8eTPbn5zTKLiqWK1hd4HC7GVIOIntruHvfC0n0fVyT5z7cXo6spg==
X-Google-Smtp-Source: AGHT+IGS36QaibGoBFEQ5pqS4obwFpQV2loOF1aOhCd0cA3B4BAUIWrn7Re5huNLf61E9aRtdauPhVyk0qicAYrC+KA=
X-Received: by 2002:a67:e715:0:b0:4b2:5ca2:48fe with SMTP id
 ada2fe7eead31-4b690c1bb38mr19355223137.15.1737591654141; Wed, 22 Jan 2025
 16:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
 <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com>
 <zneb3qwgf52zitcbq4wz76shnmhwfkabbsts3sussjpc5s5tsz@uneaxdfp4m2f>
 <CAHh=Yk_oTdURhkna_saF6mrA9gDY=+v_j5NoY_7jTDLuZ=EXtg@mail.gmail.com>
 <7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2swtoffhec@zs4w4tuh6qvm> <5robb7ipl346daf3lqaqnsi3fcgj3wzmch5dqit2dczdyeknmv@dqft77bhwryg>
In-Reply-To: <5robb7ipl346daf3lqaqnsi3fcgj3wzmch5dqit2dczdyeknmv@dqft77bhwryg>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 23 Jan 2025 08:20:43 +0800
X-Gm-Features: AWEUYZkxxC5R36IuSGHK0JpbYf5wkyKfRkWS3a02LUJNlLu-d6BFx1xVhDXXJ0c
Message-ID: <CAHh=Yk-p69ppWWspEzzznhDnuk3i6dRGKzUaqZCwg_uAxB3FVA@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_162056_097459_632A1EEF 
X-CRM114-Status: GOOD (  18.72  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDI1
5bm0MeaciDIy5pelIOmAseS4iSDkuIvljYg3OjQ05a+r6YGT77yaCj4KPiBIZWxsbyBOeWxvbiwK
Pgo+IEkgdG9vayBhbm90aGVyIGxvb2sgaW4gdGhlIGRyaXZlciBhbmQgZm91bmQgYW5vdGhlciBw
cm9ibGVtOgpIaSBVd2UsIFRoYW5rIHlvdSBmb3IgdGhlIGluZm9ybWF0aW9uLgoKSSdsbCBuZWVk
IHNvbWUgdGltZSB0byB2ZXJpZnkgYW5kIHVuZGVyc3RhbmQgdGhlc2UgZGV0YWlscywgYXMgd2Vs
bCBhcwpjb25kdWN0IHRoZSByZWxldmFudCB0ZXN0cwo+Cj4gT24gVHVlLCBKYW4gMjEsIDIwMjUg
YXQgMDc6MTI6MTBQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiBPbiBUdWUs
IEphbiAyMSwgMjAyNSBhdCAwNDo0Nzo0NlBNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4g
PiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4g5pa8IDIw
MjXlubQx5pyIMjHml6Ug6YCx5LqMIOS4i+WNiDM6NDflr6vpgZPvvJoKPiA+ID4gPgo+ID4gPiA+
IEhlbGxvLAo+ID4gPiA+Cj4gPiA+ID4gT24gU3VuLCBKYW4gMTksIDIwMjUgYXQgMDM6MDM6MTZQ
TSArMDgwMCwgTnlsb24gQ2hlbiB3cm90ZToKPiA+ID4gPiA+IEkgcmFuIHNvbWUgYmFzaWMgdGVz
dHMgYnkgY2hhbmdpbmcgdGhlIHBlcmlvZCBhbmQgZHV0eSBjeWNsZSBpbiBib3RoCj4gPiA+ID4g
PiBkZWNyZWFzaW5nIGFuZCBpbmNyZWFzaW5nIHNlcXVlbmNlcyAoc2VlIHRoZSBzY3JpcHQgYmVs
b3cpLgo+ID4gPiA+Cj4gPiA+ID4gV2hhdCBpcyBjbGtfZ2V0X3JhdGUoZGRhdGEtPmNsaykgZm9y
IHlvdT8KPiA+ID4gMTMwIE1Iego+ID4KPiA+IE9LLCBzbyB0aGUgcG9zc2libGUgcGVyaW9kIGxl
bmd0aHMgYXJlCj4gPgo+ID4gICAgICAgKDEgPDwgKDE2ICsgc2NhbGUpKSAvICgxMzAgTUh6KQo+
ID4KPiA+IGZvciBzY2FsZSBpbiBbMCwgLi4gMTVdLCByaWdodD8gVGhhdCdzCj4gPgo+ID4gICAg
ICAgMl5zY2FsZSAqIDUwNDEyMy4wNzY5MjMwNzY5NCBucwo+ID4KPiA+IFNvIHRlc3RpbmcgcGVy
aW9kIGluIHRoZSByYW5nZSBiZXR3ZWVuIDUwMDAgbnMgYW5kIDE1MDAwIG5zIGlzbid0Cj4gPiBz
ZW5zaWJsZT8gRGlkIEkgZ2V0IHNvbWV0aGluZyB3cm9uZz8gSWYgdGhlIGFib3ZlIGlzIHJpZ2h0
LCBzd2l0Y2hpbmcKPiA+IGJldHdlZW4gcGVyaW9kPTEwMDgyNDYgbnMgYW5kIDEwMDgyNDcgbnMg
aXMgbGlrZWx5IHRvIHRyaWdnZXIgYQo+ID4gd2FybmluZy4KPgo+IFRoZSBwb3NzaWJsZSBwZXJp
b2RzIGFyZSBvZiB0aGUgZm9ybQo+Cj4gICAgICAgICAyXnNjYWxlICogQQo+Cj4gd2hlcmUgQSBp
cyBjb25zdGFudCBhbmQgb25seSBkZXBlbmRzIG9uIHRoZSBpbnB1dCBjbG9jayByYXRlLiBzY2Fs
ZQo+IHJhbmdlcyBvdmVyIFswLCAuLi4gMTVdLiAoSWYgSSBnb3QgaXQgcmlnaHQgaW4gbXkgbGFz
dCBtYWlsLCB3ZSBoYXZlIEEgPQo+IDUwNDEyMy4wNzY5MjMwNzY5NCBucy4pCj4KPiBJZiB5b3Ug
cmVxdWVzdCBzYXk6Cj4KPiAgICAgICAgIC5wZXJpb2QgPSAzLjkgKiBBCj4gICAgICAgICAuZHV0
eV9jeWNsZSA9IDEuOSAqIEEKPgo+IHRoZSBwZXJpb2QgYWN0dWFsbHkgZW1pdHRlZCBieSB0aGUg
UFdNIHdpbGwgYmUgMiAqIEEuIEJ1dCB0byBjYWxjdWxhdGUKPiBmcmFjIHRoZSBvcmlnaW5hbGx5
IHJlcXVlc3RlZCBwZXJpb2QgKGkuZS4gMy45ICogQSkgaXMgdXNlZC4gU28gZnJhYwo+IGJlY29t
ZXMgMzE5MjcgcmVzdWx0aW5nIGluIC5kdXR5X2N5Y2xlIGJlaW5nIH4wLjk3NCBBLiBBIGJldHRl
ciB2YWx1ZQo+IHdvdWxkIGJlIGZyYWMgPSA2MjI1OSB3aGljaCByZXN1bHRzIGluIC5kdXR5X2N5
Y2xlIOKJhSAxLjkgKiBBLgo+IChEZXBlbmRpbmcgb24gQSB0aGUgdmFsdWVzIGZvciBmcmFjIG1p
Z2h0IGJlIG9mZiBieSBvbmUgZHVlIHRvIHJvdW5kaW5nCj4gZGlmZmVyZW5jZXMuKQo+Cj4gU28g
SSB3b3VsZCBleHBlY3QgdGhhdCBQV01fREVCVUcgaXMgYW5ncnkgd2l0aCB5b3UgaWYgeW91IGdv
IGZyb20KPgo+ICAgICAgICAgLnBlcmlvZCA9IDIgKiBBCj4gICAgICAgICAuZHV0eV9jeWNsZSA9
IDEuOSAqIEEKPgo+IHRvCj4KPiAgICAgICAgIC5wZXJpb2QgPSAzLjkgKiBBCj4gICAgICAgICAu
ZHV0eV9jeWNsZSA9IDEuOSAqIEEKPgo+IC4KPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
