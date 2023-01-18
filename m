Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7B9C38142
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 02:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMOIjtNRPuUzC4HzKRe3hySPcteZJBkhQId2kzyDAZ4=; b=gG9kwfbj/PESIm
	zBaOmC9oFFoa5p3/c9cn8lBR4D1AX0HwKaCot7esm0JKGHFlHAkK6SJgNRqyXcSeDtdTl1NGjd9T1
	hwVqWArxcALiI3AitQXfLk638SMeM4M5Uvd5vW4l2iYsWjqmuu/fOVZl/tRPy4N00BXoEwwkmby8F
	jsiRGWtYHIaKO4fqBFm4uP7e5iAkAHujkRCxh4q5AbVc2KSGNQh4a9jojejWVgnv/FkA8KVCaY06h
	UxZW4l5ZNluTgm+2hKfZNBVVhBCa0HXmNuZRMKAHNuImufnvkskTDoZ6/2eZ91sMvgX27FGS7oXSD
	10sTzPaeTtpkNZwosrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyFm-00GbeV-62; Wed, 18 Jan 2023 02:32:42 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyFj-00Gbdn-58
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 02:32:40 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4d13cb4bbffso329494087b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 18:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhVRdi04ykAfBKvh2XosikgPFb7sAZbc1JGthKJqlS4=;
        b=Xsfz/HHBDO/vDBykab7FsTxQ82hjIhSdfx0E/zL+3YXYxMdPCwksOi8E1/nqlOb7v4
         Y/y+0A4dmitkt2zcYOuAEuIwjfYP8CbQYLo7znzidRpFEUpMm9nc1FTkj7YN0GBfizPH
         1AZ35hc9Abk2cT75pqRwbuBN50r7mYOrOgv51wT91c4vqJyxqnfOP8NjTroHhwjHt0bT
         QAwFtUqOtRPOv4sTrZE4IZlZ0GRLGCRQkuG8+HkitDgNLIC7O9kk4MWtFqGIyn5Kv3NO
         2i17tWm5g4dJh3IxoksPy8Uw7xjpkAzAoO/32zkSPqKV0556sLX4hP3P9O+C4mw6VLXV
         B7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhVRdi04ykAfBKvh2XosikgPFb7sAZbc1JGthKJqlS4=;
        b=dzJq2bRLwjXivCN743Z0CbDdvfevXhFBpC1JZsW4bBJ+7NVrp7NQOv5QU4CVdXbtk0
         sy4VnEqDlLpoqK2C5OSPQ11A96siE2UduY6xt1VM+0eaBAFM2qAmfBSFRlFCSJwE+joc
         QdnvMrNuSVyRfVVgWd3r0S2VUmD6TI1omcxd+c3NQ+J9vVxpnWCU3U0MnIh9RoThUEt1
         TCUbx5tlTk+aTJ+0CnRw2FXUr+ZbdRoe7jFrUkSpicgWZNv62ZdUjeTToaIubpZOsVFf
         +/6kyaAURxdkltQ7x2fDlawRDHARsprad9sjytjUf0h3RTRtnWk83fstOH0VHQE/ldnr
         E6cQ==
X-Gm-Message-State: AFqh2koV/3QoKN1Fu4y+FyXawdGyUmc9Q3S4Otcv5KPHULHJz0xJrf05
	NJuSx6I2pNHUbkjUvBDbHW7bpJNTEgItjdKd3zbVcA==
X-Google-Smtp-Source: AMrXdXupPoFgOwerETPCheh2dd9flISZCoiKBPocpXAh78KmGug8wpLEHcBdK2SAvDjD/HXUyWDuSMhRqrjDKbftW2Q=
X-Received: by 2002:a81:5246:0:b0:3d0:c950:c581 with SMTP id
 g67-20020a815246000000b003d0c950c581mr505917ywb.304.1674009157129; Tue, 17
 Jan 2023 18:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20230113083115.2590-1-nylon.chen@sifive.com> <Y8GjySjm9OjoZvCF@spud>
 <95F1EAA0-D8D6-4F8A-8049-5E7BFDE4C06C@jrtc27.com> <Y8K1a+xs6tbo7kV4@spud>
In-Reply-To: <Y8K1a+xs6tbo7kV4@spud>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 18 Jan 2023 10:32:25 +0800
Message-ID: <CAHh=Yk9jUFiwzw+RQDoyb7xDoHGXFzNprdXn8szmMZb5FB4jLw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Change PWM-controlled LED pin active mode and algorithm
To: Conor Dooley <conor@kernel.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_183239_217972_854A37CD 
X-CRM114-Status: GOOD (  34.71  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiDmlrwgMjAyM+W5tDHmnIgxNOaXpSDpgLHl
ha0g5LiL5Y2IMTA6MDDlr6vpgZPvvJoKPgo+IEhpIEplc3MhCj4KPiBPbiBGcmksIEphbiAxMywg
MjAyMyBhdCAwNzoyNDo1NlBNICswMDAwLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiA+IE9uIDEz
IEphbiAyMDIzLCBhdCAxODozMiwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4KPgo+ID4gPiBQbGVhc2UgcnVuIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgYmVm
b3JlIHNlbmRpbmcgcGF0Y2hlcywgeW91IG1pc3NlZAo+ID4gPiBib3RoIG1lICYgdGhlIFBXTSBt
YWludGFpbmVycyB1bmZvcnR1bmF0ZWx5IQo+ID4gPiBBRkFJSywgdGhlIFBXTSBtYWludGFpbmVy
cyB1c2UgcGF0Y2h3b3JrLCBzbyB5b3Ugd2lsbCBwcm9iYWJseSBoYXZlIHRvCj4gPiA+IHJlc2Vu
ZCB0aGlzIHBhdGNoc2V0IHNvIHRoYXQgaXQgaXMgb24gdGhlaXIgcmFkYXIuCj4gPiA+IEkndmUg
bWFya2VkIHRoZSBzZXJpZXMgYXMgIkNoYW5nZXMgUmVxdWVzdGVkIiBvbiB0aGUgUklTQy1WIG9u
ZS4KPiA+ID4KPiA+ID4gT24gRnJpLCBKYW4gMTMsIDIwMjMgYXQgMDQ6MzE6MTNQTSArMDgwMCwg
Tnlsb24gQ2hlbiB3cm90ZToKPiA+ID4KPiA+ID4+IEFjY29yZGluZyB0byB0aGUgY2lyY3VpdCBk
aWFncmFtIG9mIFVzZXIgTEVEcyAtIFJHQiBkZXNjcmliZWQgaW4gdGhlCj4gPiA+PiBtYW51YWwg
aGlmaXZlLXVubWF0Y2hlZC1zY2hlbWF0aWNzLXYzLnBkZlswXS4KPiA+ID4+IFRoZSBiZWhhdmlv
ciBvZiBQV00gaXMgYWNpdHZlLWhpZ2guCj4gPiA+Pgo+ID4gPj4gQWNjb3JkaW5nIHRvIHRoZSBk
ZXNjcmlwdGlvbm9mIFBXTSBmb3IgcHdtY21wIGluIFNpRml2ZSBGVTc0MC1DMDAwCj4gPiA+PiBN
YW51YWxbMV0uCj4gPiA+PiBUaGUgcHdtIGFsZ29yaXRobSBpcyAoUFcpIHB1bHNlIGFjdGl2ZSB0
aW1lICA9IChEKSBkdXR5ICogKFQpIHBlcmlvZFsyXS4KPiA+ID4+IFRoZSBgZnJhY2AgdmFyaWFi
bGUgaXMgcHVsc2UgImluYWN0aXZlIiB0aW1lIHNvIHdlIG5lZWQgdG8gaW52ZXJ0IGl0Lgo+ID4g
Pj4KPiA+ID4+IFNvIHRoaXMgcGF0Y2hzZXQgcmVtb3ZlcyBhY3RpdmUtbG93IGluIERUUyBhbmQg
YWRkcyByZXZlcnNlIGxvZ2ljIHRvCj4gPiA+PiB0aGUgZHJpdmVyLgo+ID4gPj4KPiA+ID4+IFsw
XTpodHRwczovL3NpZml2ZS1jaGluYS5vc3MtY24temhhbmdqaWFrb3UuYWxpeXVuY3MuY29tL0hp
Rkl2ZSUyMFVubWF0Y2hlZC9oaWZpdmUtdW5tYXRjaGVkLXNjaGVtYXRpY3MtdjMucGRmCj4gPiA+
PiBbMV06aHR0cHM6Ly9zaWZpdmUtY2hpbmEub3NzLWNuLXpoYW5namlha291LmFsaXl1bmNzLmNv
bS9IaUZJdmUlMjBVbm1hdGNoZWQvZnU3NDAtYzAwMC1tYW51YWwtdjFwMi5wZGYKPiA+ID4+IFsy
XTpodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9EdXR5X2N5Y2xlCj4gPiA+Cj4gPiA+IFBs
ZWFzZSBkZWxldGUgbGluayAyLCBjb252ZXJ0IHRoZSBvdGhlciB0d28gdG8gc3RhbmRhcmQgTGlu
azogdGFncyBhbmQKPiA+ID4gcHV0IHRoaXMgaW5mb3JtYXRpb24gaW4gdGhlIGR0cyBwYXRjaC4g
UG9zc2libHkgaW50byB0aGUgUFdNIHBhdGNoIHRvbywKPiA+ID4gZGVwZW5kaW5nIG9uIHdoYXQg
dGhlIFBXTSBtYWludGFpbmVycyB0aGluay4KPiA+ID4gVGhpcyBpbmZvIHNob3VsZCBiZSBpbiB0
aGUgY29tbWl0IGhpc3RvcnkgSU1PIGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UgZm9yCj4gPiA+IHRo
ZSBkdHMgcGF0Y2ggc2F5cyB3aGF0J3Mgb2J2aW91cyBmcm9tIHRoZSBkaWZmIHdpdGhvdXQgYW55
IGV4cGxhbmF0aW9uCj4gPiA+IGFzIHRvIHdoeS4KPiA+ID4KPiA+ID4gSSBkaWQgYSBiaXQgb2Yg
bG9va2luZyBhcm91bmQgb24gbG9yZSwgdG8gc2VlIGlmIEkgY291bGQgZmlndXJlIG91dAo+ID4g
PiB3aHkgaXQgd2FzIGRvbmUgbGlrZSB0aGlzIGluIHRoZSBmaXJzdCBwbGFjZSwgYW5kIEkgZm91
bmQ6Cj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXB3bS9DQUoyX2pPRzJNMDNh
TEJnVU9nR2pXSDlDVXhxMmFURzk3ZVNYNzA9VWFTYkdDTU1GX2dAbWFpbC5nbWFpbC5jb20vCj4g
Pgo+ID4gVGhhdCBEVFMgZG9jdW1lbnRhdGlvbiBtYWtlcyBubyBzZW5zZSB0byBtZSwgd2h5IGRv
ZXMgd2hhdCB0aGUgTEVEIGlzCj4gPiB3aXJlZCB0byBtYXR0ZXI/Cj4KPiBgYGAKPiAgICAgICBh
Y3RpdmUtbG93Ogo+ICAgICAgICAgZGVzY3JpcHRpb246Cj4gICAgICAgICAgIEZvciBQV01zIHdo
ZXJlIHRoZSBMRUQgaXMgd2lyZWQgdG8gc3VwcGx5IHJhdGhlciB0aGFuIGdyb3VuZC4KPiBgYGAK
Pgo+ID4gV2hldGhlciB5b3UgaGF2ZSB5b3VyIHRyYW5zaXN0b3IgbmV4dCB0byBncm91bmQgb3IK
PiA+IG5leHQgdG8gVmRkIGRvZXNu4oCZdCBtYXR0ZXIsIHdoYXQgbWF0dGVycyBpcyB3aGV0aGVy
IHRoZSB0cmFuc2lzdG9yIGlzCj4gPiBvbiBvciBvZmYuIE1heWJlIHdoYXQgdGhleSBtZWFuIGlz
IHdoZXRoZXIgdGhlICpQV00ncyBvdXRwdXQqIC8gKnRoZQo+ID4gdHJhbnNpc3RvcidzIGlucHV0
KiBpcyBwdWxsZWQgdG8gZ3JvdW5kIG9yIFZkZD8gSW4gd2hpY2ggY2FzZSB0aGUKPiA+IHByb3Bl
cnR5IHdvdWxkIGluZGVlZCBub3QgYXBwbHkgaGVyZS4KPiA+Cj4gPiBVbmxlc3MgdGhhdOKAmXMg
d3JpdHRlbiBhc3N1bWluZyB0aGUgTEVEIGlzIHdpcmVkIGRpcmVjdGx5IHRvIHRoZSBQV00sIGlu
Cj4gPiB3aGljaCBjYXNlIGl0IHdvdWxkIG1ha2Ugc2Vuc2UsIGJ1dCB0aGF04oCZcyBhIHZlcnkg
bmFycm93LW1pbmRlZCB2aWV3IG9mCj4gPiB3aGF0IHRoZSBQV00gb3V0cHV0IGlzIChkaXJlY3Rs
eSkgZHJpdmluZy4KPgo+IEkgd291bGQgc3VzcGVjdCB0aGF0IGl0IHdhcyB3cml0dGVuIHdpdGgg
dGhhdCBhc3N1bXB0aW9uLgo+IFByb2JhYmx5IHdhcyB0aGUgY2FzZSBvbiB0aGUgc3BlY2lmaWMg
Ym9hcmQgdGhpcyBwcm9wZXJ0eSB3YXMgb3JpZ2luYWxseQo+IGFkZGVkIGZvci4KPgpIaSBDb25v
cgoKQXMgeW91IGNhbiBzZWUsIHRoZXJlIGlzIGFsc28gdGhlIHNhbWUgZGVzY3JpcHRpb24gaW4g
VS1Cb290LgoKQnV0IGluIFUtQm9vdCwgdGhlIERUUyBvZiBVbm1hdGNoZWQvVW5sZWFzaGVkIGhh
cyBub3QgYmVlbiBhZGRlZCBhY3RpdmUtbG93LgoKVGhpcyBpcyBiZWNhdXNlIGFjdGl2ZS1oaWdo
IHNob3VsZCBiZSBjb3JyZWN0IGlmIHdlIGxvb2sgYXQgdGhlIGNpcmN1aXQgZGlhZ3JhbS4KPiBN
YXliZSBpdCdkIGJlIGEgYml0IG1vcmUgZm9vbHByb29mIHdyaXR0ZW4gYXMgIkZvciBMRURzIHRo
YXQgYXJlCj4gaWxsdW1pbmF0ZWQgd2hpbGUgdGhlIFBXTSBvdXRwdXQgaXMgbG93LiBGb3IgZXhh
bXBsZSwgd2hlcmUgYW4gTEVEIGlzCj4gd2lyZWQgYmV0d2VlbiBzdXBwbHkgYW5kIHRoZSBQV00g
b3V0cHV0LiI/Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
