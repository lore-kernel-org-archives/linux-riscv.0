Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB423C021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkE3YwfIUyYnxACbBRpK47se5+YHqXDmi1/j9gOv/t4=; b=gaPx9OFX2mqef5
	wjG9a9cZEZKXlnI0OlhtnAxiYK98ytqMJPmMF0Iw1uXxdnCTveob4mFWiATcY1B3//ps5NVeL8nAH
	N8pmSKiLUq4rQeiGCJnkCZXrVGvXuQPiZJMRqeKUc8DQBxF+SIpSMfY5AmUT4VUraa8D5xGYZqzin
	t2wn5JPveLnZhL2uk9ZB/ViQRTPqhgh2OFVjC4rqQFXVHiY/20zzkExHKEBZCih4Tkv2mBMX6FANa
	DQPb/rfS6KWCgd6uR7m5CoxHmiyNyGHnCdjpRxxnC0F8u6TtDsk4o8jY954zoAkpPxTlFF9yGkXH7
	HpwEzEVqhrP4TKIV8aGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2H1-0000000HScy-3ckD;
	Thu, 20 Feb 2025 08:51:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2G1-0000000HSHU-24ZI
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 08:50:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4399509058dso889695e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 00:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740041408; x=1740646208; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4cSnvn9ljr1+95vro6JQ9OboRp/UL3qAMCfprqMPPM=;
        b=fmtGtgJSYr64rtoTRzsLx0vXjEruH7Va0JvA4VwiG9kEznvD7rdOEn/PCpmP80RHrW
         nFU8IbePtvKmP1MRLdG+V1mgKc/mhV3ywUbdWhbX14w3c1T9u5sYqLko0FTgLsSFxgfz
         V03rAPhbAUvWnKY7XQimtajt2vp0fFYci+Ir0p2G4jZonAAUHup6oTDc0Go5kBxjRjSg
         avBsSx08PMTe0vhmfNU+J6NvL096y7Wg5WisVm7a41LGdIUTs8/rG3dZ/Zzd9DZlGgcI
         woZvVV4bB6PgGZidE1mPr9uJLEwRdrLawo0uftT1V8eBIj10c3RNX57LSvF9wOx1nEXH
         G+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041408; x=1740646208;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4cSnvn9ljr1+95vro6JQ9OboRp/UL3qAMCfprqMPPM=;
        b=T5MVboZZW/3m2bw9292tkv1L6xCQXTRqZ7SeRUdU29P86sy/MYglw4wBFmVJaqp5q4
         rQj14eByWTIeTF+4mtGUvi2Vtho07ZBclMkxMxc2rlLmkeVJ+t2Ic+OF59BjUGVhBoR2
         /cYGhf8HsCd+xB6WqR1qH39aBESYstJ0tALa4F9ESCMnQZjdG1BcDC+fPwjr1ukSxyAt
         1923QqEqF79pvX5tL4A60Y2F3dt1zpMTAo5hk55SSqX5MTkILkBRIG41bbSQ4IsLu0n6
         TYY2/tImKGCaqMjM5l7kv6izP5lU7RSbTvqslEygDYTJ0MqPGre5G25c7A7l3xYFoSG+
         f4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD71G1oK8Id6/X/4InNt7RMphxK9BE3WRGVHJyWllS2h0XSKGWiG9MOSbewE3BFg7w9LJv0aEVNxJi3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMMVzJkJwGLkjjfQJ1TdkYVwn2E6FMpGdFq/Mdu/FzJeDbjTiT
	DKLBh3sD9HXcP+95R4gFEGs/OQ1DnQngU+4XuABObXPSp9SbbS1hGIYrMAfJR/o=
X-Gm-Gg: ASbGncvlAxvFgOId6jqazO3oNdmHkhPUkIWZ1C6y7dWL6yO7MIA9S/VOsjb7C0V/YvA
	tdxsYjWJxhClNVMzl0cjBlmObQYd4hccJP42RrFObg5Jz9FS5Sxh3B1gBijq2m3rg0meRQVsREN
	xIjVnn6B3/7PZpATLX8x71Bh4kj2pGNC6fyrV9qNLf6oX6RJnVhTv1MiahRnu6DdI3LCx2EGcjg
	j26c3J5F7efhl8H5tS66/Jw0wzIXnUYqxYhSqBbgJ60QXcxN2Rija22Z8EBj001imq611nT18Dd
	mr2oGeLsMgHfilA8FLkSSpflObs0T6zMO1eaQvDnr4zQLXtJc1g=
X-Google-Smtp-Source: AGHT+IHfThnNuH0h6beaOQ5rYMykdsdyrSk1TPSC2gmbY63W9HKJJCP1ryph8gsbU1Jj4BNeY7MpCQ==
X-Received: by 2002:a05:600c:2d04:b0:439:84d3:f7fd with SMTP id 5b1f17b1804b1-43984d3fb0bmr51487845e9.4.1740041407801;
        Thu, 20 Feb 2025 00:50:07 -0800 (PST)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439918273dbsm81894325e9.20.2025.02.20.00.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:50:07 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 20 Feb 2025 09:50:06 +0100
Message-Id: <D7X576NHG512.2HBBO3JLIA1JH@ventanamicro.com>
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
Cc: <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <atishp@atishpatra.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "xiangwencheng" <xiangwencheng@lanxincomputing.com>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
 <D7WALEFMK28X.13HQ0UL1S3NM5@ventanamicro.com>
 <38cc241c40a8ef2775e304d366bcd07df733ecf0.f7f1d4c7.545f.42a8.90f5.c5d09b1d32ec@feishu.cn> <20250220-f9c4c4b3792a66999ea5b385@orel> <38cc241c40a8ef2775e304d366bcd07df733ecf0.818d94fe.c229.4f42.a074.e64851f0591b@feishu.cn>
In-Reply-To: <38cc241c40a8ef2775e304d366bcd07df733ecf0.818d94fe.c229.4f42.a074.e64851f0591b@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_005009_535466_2314D462 
X-CRM114-Status: GOOD (  12.03  )
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

MjAyNS0wMi0yMFQxNjoxNzozMyswODowMCwgeGlhbmd3ZW5jaGVuZyA8eGlhbmd3ZW5jaGVuZ0Bs
YW54aW5jb21wdXRpbmcuY29tPjoKPj4gRnJvbTogIkFuZHJldyBKb25lcyI8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+Cj4+IE9uIFRodSwgRmViIDIwLCAyMDI1IGF0IDAzOjEyOjU4UE0gKzA4MDAs
IHhpYW5nd2VuY2hlbmcgd3JvdGU6Cj4+ID4gSW4ga3ZtX2FyY2hfdmNwdV9ibG9ja2luZyBpdCB3
aWxsIGVuYWJsZSBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHQsIHdoaWNoCj4KPj4gPiBtZWFucyB3
aXJ0aW5nIHRvIFZTX0ZJTEUgd2lsbCBjYXVzZSBhbiBpbnRlcnJ1cHQuIEFuZCB0aGUgaW50ZXJy
dXB0IGhhbmRsZXIKPgo+PiA+IGhnZWlfaW50ZXJydXB0IHdoaWNoIGlzIHNldHRlZCBpbiBhaWFf
aGdlaV9pbml0IHdpbGwgZmluYWxseSBjYWxsIGt2bV92Y3B1X2tpY2sKPgo+PiA+IHRvIHdha2Ug
dXAgdkNQVS4KCihDb25maWd1cmUgeW91ciBtYWlsIGNsaWVudCwgc28gaXQgZG9lc24ndCBhZGQg
YSBuZXdsaW5lIGJldHdlZW4gZWFjaAogcXVvdGVkIGxpbmUgd2hlbiByZXBseWluZy4pCgo+PiA+
IFNvIEkgc3RpbGwgdGhpbmsgaXMgbm90IG5lY2Vzc2FyeSB0byBjYWxsIGFub3RoZXIga3ZtX3Zj
cHVfa2ljayBhZnRlciB3cml0aW5nIHRvCj4+ID4gVlNfRklMRS4KClNvIHRoZSBraWNrIHdhc24n
dCB0aGVyZSB0byBtYXNrIHNvbWUgb3RoZXIgYnVnLCB0aGFua3MuCgo+PiBSaWdodCwgd2UgZG9u
J3QgbmVlZCBhbnl0aGluZyBzaW5jZSBoZ2VpX2ludGVycnVwdCgpIGtpY2tzIGZvciB1cywgYnV0
IGlmCj4+IHdlIGRvCj4+wqAKPj4gQEAgLTk3Myw4ICs5NzMsOCBAQCBpbnQga3ZtX3Jpc2N2X3Zj
cHVfYWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+IMKgIMKgIMKgIMKg
IHJlYWRfbG9ja19pcnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPj7CoAo+PiDC
oCDCoCDCoCDCoCBpZiAoaW1zaWMtPnZzZmlsZV9jcHUgPj0gMCkgewo+PiArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGt2bV92Y3B1X3dha2VfdXAodmNwdSk7Cj4+IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHdyaXRlbChpaWQsIGltc2ljLT52c2ZpbGVfdmEgKyBJTVNJQ19NTUlPX1NFVElQTlVNX0xF
KTsKPj4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCBrdm1fdmNwdV9raWNrKHZjcHUpOwo+PiDCoCDC
oCDCoCDCoCB9IGVsc2Ugewo+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlaXggPSAmaW1zaWMt
PnN3ZmlsZS0+ZWl4W2lpZCAvIEJJVFNfUEVSX1RZUEUodTY0KV07Cj4+IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHNldF9iaXQoaWlkICYgKEJJVFNfUEVSX1RZUEUodTY0KSAtIDEpLCBlaXgtPmVp
cCk7Cj4+wqAKPj4gdGhlbiB3ZSBzaG91bGQgYmUgYWJsZSB0byBhdm9pZCB0YWtpbmcgYSBob3N0
IGludGVycnVwdC4KClRoZSB3YWtldXAgaXMgYXN5bmNocm9ub3VzLCBhbmQgdGhpcyB3b3VsZCBw
cmFjdGljYWxseSBuZXZlciBhdm9pZCB0aGUKaG9zdCBpbnRlcnJ1cHQsIGJ1dCB3ZSdkIGRvIGV4
dHJhIHBvaW50bGVzcyB3b3JrLi4uCkkgdGhpbmsgaXQncyBtdWNoIGJldHRlciBqdXN0IHdpdGgg
dGhlIHdyaXRlLiAgKFRoZSB3YWtldXAgd291bGQgYWdhaW4KbWFrZSBLVk0gbG9vayBsaWtlIGl0
IGhhcyBhIGJ1ZyBlbHNld2hlcmUuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
