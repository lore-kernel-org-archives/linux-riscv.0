Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57249ECE584
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2PJrJ2hQNYSm2ga4edQ3bRg488KZ0sIA0Lo2DAJH04=; b=wKe+a30sE2AjAJ
	yrjcqhYozUM13wgjosp9uK0EZXxrHy8TP+MFoREq7gCpyHRqNe8134jUUB319EX/gcjl8VzXURqdS
	sHFNQtu9MjkRmF1tHpIU22mHMp3iUTPWqxTwQaNa/qxr6WJvLwehxtRROAPk3wi2nMKbdjZweyXt+
	j0VYP4KzGwQn9O0hVuE1/RQWjgPwp1V55ZsZxKRsTzyCA245ikCCmNugninl19PNIiSddPJS+jcij
	Zc1jFBCexIiLaOPFaXCR0mhD+qzT10tewGvxhWc7vxJ1ONvOxzBmfUx4DEucqcKsSU7b8wDllu3OR
	zV/LGpwtYrIUWZ5HoDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sna9p-00000001C24-33zW;
	Mon, 09 Sep 2024 08:54:01 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sna1f-00000001ARE-3Gbr
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 08:45:37 +0000
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e1a819488e3so3399723276.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 01:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871533; x=1726476333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OClx8FdjyQ2dYCnYDOmUx9fSX8zEhQ05R0o7VQeRBrI=;
        b=m9iQIw0JJExpPaSdcFdPH802MBnveEol8uDbBttWGbQmTNgenohg4Rr+m6vvunofxg
         T0cU8Y/D2hhrWjAr36geV5ikKaUOBPg0aifnuuiiTVZ+YilJHidU1QzMTyi3EN7PMD23
         iBMQ6cCGaOeZW/DhkCtKj0rFGU7h/HQTT1b2I0H9sINri0CWlXJR+oapyxeWVtipV1I+
         1fjnndyFQ5wAWzrcMdNIYb5fpEZHcGUkIXTIrJatedU2o5DVh9DLe/21wP6OjjdvQxfb
         OeEA8EDINvtn+6WcX2vUUpJMDjuopb+EkEk7S4uoIS7DqjNILda8uE6WoXq7l9/qf6hO
         MxOg==
X-Forwarded-Encrypted: i=1; AJvYcCUx9QDKqA9CoVXhAmKie2czf45b6nC1GmMzDw5obqMKbcSsyaJ7LrDXjEIrcplk7qVRphXf+qzQcwOwYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRK3ocMS6j00dY9H9BbR6u4lplpOWwAavhK8x78u/Ufj/+QjSC
	0LCRZgq4NiQYRRFK00QIzeVXtHmcksV+VA7vxc8jBLtL3TyHw/j3+24gF6Ns
X-Google-Smtp-Source: AGHT+IHpwf5YB3j9yodVrBpgPWXxe4Dp25rT7nS/j9RpvQNV7AZ0SlcS7FDEP67wRm8P0/PrGnzUmA==
X-Received: by 2002:a05:6902:2e0a:b0:e1a:a0c2:df2d with SMTP id 3f1490d57ef6-e1d3487fbf4mr8379802276.23.1725871532879;
        Mon, 09 Sep 2024 01:45:32 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d4b2cf0f1sm875583276.4.2024.09.09.01.45.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:45:31 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6c49c9018ebso36299947b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 01:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXH51XmD7p1k68iTPx81/3PcHcP6kcBpjUuykbSXCkit78N6sLBj/RnxZpPjytI7gOydr/vQ8GLzuODdw==@lists.infradead.org
X-Received: by 2002:a05:690c:113:b0:64a:7040:2d8a with SMTP id
 00721157ae682-6db44f10494mr80803477b3.23.1725871531566; Mon, 09 Sep 2024
 01:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang@outlook.com>
 <202409080100.h6lX5Asm-lkp@intel.com> <MA0P287MB28225ECCF1D263A20917AD5DFE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB28225ECCF1D263A20917AD5DFE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 10:45:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOAmCsdcvdo41qD9f4L=K2uZa6nJN7D5YOTTuCnBHtWA@mail.gmail.com>
Message-ID: <CAMuHMdXOAmCsdcvdo41qD9f4L=K2uZa6nJN7D5YOTTuCnBHtWA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PWM
To: Chen Wang <unicorn_wang@outlook.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Chen Wang <unicornxw@gmail.com>, ukleinek@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_014535_849680_74EB4AAA 
X-CRM114-Status: GOOD (  22.19  )
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

SGkgQ2hlbiwKCk9uIE1vbiwgU2VwIDksIDIwMjQgYXQgMTA6MjbigK9BTSBDaGVuIFdhbmcgPHVu
aWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4gSSB3b25kZXIgd2h5IENPTkZJR19QV01f
U09QSEdPX1NHMjA0MiBpcyBlbmFiZWxkIGZvciBtNjhrPyBQbGVhc2UgcmVtb3ZlCj4gdGhpcy4K
CkJlY2F1c2UgaXQgZGVwZW5kcyBvbiBBUkNIX1NPUEhHTyB8fCBDT01QSUxFX1RFU1QuClNvIGl0
IGNhbiBiZSBlbmFibGVkIG9uIGFsbCBhcmNoaXRlY3R1cmVzIHdoZW4gY29tcGlsZS10ZXN0aW5n
LgoKPiBPbiAyMDI0LzkvOCAxOjU4LCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZToKPiA+IGtlcm5l
bCB0ZXN0IHJvYm90IG5vdGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoKPiA+Cj4g
PiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gNDMxYzE2NDZlMWY4NmI5NDlmYTM2ODVlZmM1
MGI2NjBhMzY0YzJiNl0KPiA+Cj4gPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1s
YWItbGtwL2xpbnV4L2NvbW1pdHMvQ2hlbi1XYW5nL2R0LWJpbmRpbmdzLXB3bS1zb3BoZ28tYWRk
LWJpbmRpbmdzLWZvci1zZzIwNDIvMjAyNDA5MDUtMjAxMzAzCj4gPiBiYXNlOiAgIDQzMWMxNjQ2
ZTFmODZiOTQ5ZmEzNjg1ZWZjNTBiNjYwYTM2NGMyYjYKPiA+IHBhdGNoIGxpbms6ICAgIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMzk4NTY5MGIyOTM0MDk4MmE0NTMxNGJkY2M5MTRjNTU0NjIx
ZTkwOS4xNzI1NTM2ODcwLmdpdC51bmljb3JuX3dhbmclNDBvdXRsb29rLmNvbQo+ID4gcGF0Y2gg
c3ViamVjdDogW1BBVENIIDIvMl0gcHdtOiBzb3BoZ286IGFkZCBkcml2ZXIgZm9yIFNvcGhnbyBT
RzIwNDIgUFdNCj4gPiBjb25maWc6IG02OGstcmFuZGNvbmZpZy1yMTMzLTIwMjQwOTA3IChodHRw
czovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNDA5MDgvMjAyNDA5MDgwMTAw
Lmg2bFg1QXNtLWxrcEBpbnRlbC5jb20vY29uZmlnKQo+ID4gY29tcGlsZXI6IG02OGstbGludXgt
Z2NjIChHQ0MpIDE0LjEuMAo+ID4gcmVwcm9kdWNlOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcv
MGRheS1jaS9hcmNoaXZlLzIwMjQwOTA4LzIwMjQwOTA4MDEwMC5oNmxYNUFzbS1sa3BAaW50ZWwu
Y29tL3JlcHJvZHVjZSkKPiA+Cj4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRl
IHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mCj4gPiB0aGUgc2Ft
ZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gPiB8IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IHwgQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQwOTA4MDEwMC5oNmxYNUFzbS1s
a3BAaW50ZWwuY29tLwo+ID4KPiA+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pOgo+ID4KPiA+Pj4gZHJpdmVycy9wd20vcHdtLXNvcGhnby1zZzIwNDIuYzo5OTozNDogd2Fy
bmluZzogJ3NnMjA0Ml9wd21fbWF0Y2gnIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1j
b25zdC12YXJpYWJsZT1dCj4gPiAgICAgICAgOTkgfCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBzZzIwNDJfcHdtX21hdGNoW10gPSB7Cj4gPiAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4gPgo+ID4KPiA+IHZpbSAr
L3NnMjA0Ml9wd21fbWF0Y2ggKzk5IGRyaXZlcnMvcHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMKPiA+
Cj4gPiAgICAgIDk4Cj4gPiAgICA+IDk5ICAgICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHNnMjA0Ml9wd21fbWF0Y2hbXSA9IHsKPiA+ICAgICAxMDAgICAgICAgICAgICAgICB7
IC5jb21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItcHdtIiB9LAo+ID4gICAgIDEwMSAgICAgICAg
ICAgICAgIHsgfSwKPiA+ICAgICAxMDIgICAgICAgfTsKPiA+ICAgICAxMDMgICAgICAgTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgc2cyMDQyX3B3bV9tYXRjaCk7Cj4gPiAgICAgMTA0CgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
