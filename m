Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E353C36005
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 06:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcQ7NnRgFSzvQam2z7RFmdcGdQ0F8rSDMm8i5tefApI=; b=Lp3aU0pljR4LAm
	fCSugi95JfbpAiCvAyey6h1vXIITcRTLuncd6/5yipWmNSfymPSTkGXOq0AK7FQ0RPeCroftN6Evq
	GZAOvEmIT0r4cSk5ulGi0HD8dy22qI0RWw5sNBBUdgGTN2wLzt7HXVDeWFw7YNHDW6p2LU8EKkzXy
	EQ1k9NeE/VeoTOA4Rdum+7mIdSaHmJp4R8y250yIFWwIxg2tiDYS26i3CSUgDUEGwHBGiStA8wVry
	JgPDvtnxPYiw+2Vz2SgYw8W8+iXikpW8yFWYTZ0rpkJGbOXIdnPjpiGyNYVVZwFyK7Zyqu27w+zTk
	+DpD4AYO9i+NDPH3jW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IKl-000000059UP-3w0u;
	Mon, 28 Apr 2025 06:51:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IKi-000000059SN-1j7J
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 06:51:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so7200944a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Apr 2025 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745823074; x=1746427874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olp7njR9Ybm79qV02JWYfEZZNtFSE8MfHDfoR2yiSUc=;
        b=v7klof2N3nxnu1YaPq/8wFlXuul5XXQyOPRMu3ZbmcJl/DZV5MiRX80eDTmX7twjhM
         LRmo8gOHC7cSCzIljdNnBDrYz0Y7Tz01Zl9pm/hhK2BsWetLfUPeqFigg+IhihTRGyft
         nLeGbe0AK91Z3ETqJ+NHJTJwJ7y0PSgtjboG7JyJup/1XbtIvGmBQSTkWp3r3i+WPtx6
         ARv0HYn9C6bWxPGpooue2nGfDDZT0eKEf9pBc9wzy2NXcEj1OaEht01OIwfeHiPdUVnU
         zDVv3u5CZfVoT1KA8+Tj67sya9QYn9bJ2YN3eVrUbhDpMpVe2LDZRwM5W2GFXOc5+Ib0
         62SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745823074; x=1746427874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olp7njR9Ybm79qV02JWYfEZZNtFSE8MfHDfoR2yiSUc=;
        b=GqY27PGlQvQYjEUzN9F9wCOEazJvF5goAze4E/+BzvheVZ5XcB6fJtMABCOEMCrw18
         5rluILJE+aknnVcnWI67RFf2VrTf/6cE9ZlrZC+QDIPCzuQc3+85MR/kKfYcy7l+US2t
         TDaA5MgS84jDpfTrRJeCDSYm1TbYccVriGykBOqkN93Fbu0G/P0i0u6fvnCbQXM1QCSh
         a+eA92CFtQm/RwbPFA4BYraHGpkvSV6pnKXrXpjtMwPu0n0qVIyRCgR0nC7v+F2z1JpG
         OjVspoCinJdcpeHFaqM6EToKMqGIBNL9g4P/guOgrGwWZHT1LNjmWXboEen/NoLHait1
         09tg==
X-Forwarded-Encrypted: i=1; AJvYcCUyS0tfKWoq3In69yZJHy05ONAefeCRieVEByrnzRES+xgFPcOHAf7US4L/o4qlD/63j3jj+hlM3IQLbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRGmAK9L5hU9RKQxq3+3beOBLIdbi8AzgwPtBaH2IsIBTda18V
	7e5lJHvk9qm1HuSeXV1WwiUbWyX8+aAGY82twAZpBKdgXtYi9UNieTyF+FYF7C64wQg9K9mM4wY
	lK94izSn7u49O3BzZVbTY4dsP+NSB542JnkWDjA==
X-Gm-Gg: ASbGncubdRKLYIkM4dV+OgLFtnS4SZtAHJH+go8JtSUVQga3RHYEcMcTbKDaJhUImTu
	vOa4mBIBesyeNHsEKr3DxjbR6u9TAbZg1TMDdm+9FhqAF7DtjSbzcjzWLI3xAUgSdE+dyO7XPcq
	g8w5fG/JGWVmBcUMgV/zDyY9o=
X-Google-Smtp-Source: AGHT+IEtEaxs9n/fqGJEuZ8Xotr69RVdjbKFMaVctCQmuSvnkMpXaGIdiMr0ZU582rbQFSZfQks/8XyJ+CzfPm0I+P0=
X-Received: by 2002:a17:907:1b0b:b0:ac7:4d45:f13e with SMTP id
 a640c23a62f3a-ace710a0eacmr947603266b.13.1745823074048; Sun, 27 Apr 2025
 23:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250420070251.378950-1-guodong@riscstar.com> <20250420070251.378950-3-guodong@riscstar.com>
 <mzfiyc2me2smqrrmiymzkzxvsyjmst6ggy7scq4wxz2yfj2ef5@np3h3k467mbl>
In-Reply-To: <mzfiyc2me2smqrrmiymzkzxvsyjmst6ggy7scq4wxz2yfj2ef5@np3h3k467mbl>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 28 Apr 2025 14:50:52 +0800
X-Gm-Features: ATxdqUER8JSTuuOTantCFeixTZRLC93zvf7G5uIviwPU2QmuQNBr7asOpX-Fl3I
Message-ID: <CAH1PCMZ4hqYo9SLCnzHYp_EiQKs5nhgW3XpxwqLEk4eX8=vWPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] pwm: pxa: add optional reset control
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_235116_714447_32B4AB65 
X-CRM114-Status: GOOD (  16.42  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMzozMOKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24gU3VuLCBBcHIgMjAsIDIw
MjUgYXQgMDM6MDI6NDdQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEBAIC00OSwxMCAr
NTAsMTAgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShwbGF0Zm9ybSwgcHdtX2lkX3RhYmxlKTsKPiA+
ICAjZGVmaW5lIFBXTURDUl9GRCAgICAoMSA8PCAxMCkKPiA+Cj4gPiAgc3RydWN0IHB4YV9wd21f
Y2hpcCB7Cj4gPiAtICAgICBzdHJ1Y3QgZGV2aWNlICAgKmRldjsKPiA+IC0KPiA+IC0gICAgIHN0
cnVjdCBjbGsgICAgICAqY2xrOwo+ID4gLSAgICAgdm9pZCBfX2lvbWVtICAgICptbWlvX2Jhc2U7
Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICAgICAgICAgICAqZGV2Owo+ID4gKyAgICAgc3RydWN0
IGNsayAgICAgICAgICAgICAgKmNsazsKPiA+ICsgICAgIHZvaWQgX19pb21lbSAgICAgICAgICAg
ICptbWlvX2Jhc2U7Cj4gPiArICAgICBzdHJ1Y3QgcmVzZXRfY29udHJvbCAgICAqcmVzZXQ7Cj4K
PiBDaGFuZ2VzIGxpa2UgdGhlc2UgYXJlIHRoZSByZWFzb24gSSBwcmVmZXIgdG8gbm90IGFsaWdu
IHRoZSBtZW1iZXIKPiBuYW1lcy4gTHVja2lseSByZXNldCBpcyBhIHdyaXRlIG9ubHkgdmFyaWFi
bGUgYW5kIHlvdSBjYW4ganVzdCBkcm9wIHRoaXMKPiBodW5rIGlmIHlvdSB1c2UgYSBsb2NhbCB2
YXJpYWJsZSBmb3IgaXQgaW4gcHdtX3Byb2JlKCkgYmVsb3cuCj4KClRoYW5rcyBVd2UgZm9yIHRo
ZSBzdWdnZXN0aW9uLCBJIGFncmVlLgpJIHdpbGwgdXBkYXRlIGl0IGluIHYzIGJ5IGRyb3BwaW5n
IHRoaXMgaHVuayBhbmQgdXNpbmcgYSBsb2NhbCB2YXJpYWJsZSBmb3IKcmVzZXQgaW4gcHdtX3By
b2JlKCkgYXMgeW91IHJlY29tbWVuZGVkLgoKQlIsCkd1b2RvbmcKCj4gPiAgfTsKPiA+Cj4gPiAg
c3RhdGljIGlubGluZSBzdHJ1Y3QgcHhhX3B3bV9jaGlwICp0b19weGFfcHdtX2NoaXAoc3RydWN0
IHB3bV9jaGlwICpjaGlwKQo+ID4gQEAgLTE3OSw2ICsxODAsMTEgQEAgc3RhdGljIGludCBwd21f
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAgICAgIGlmIChJU19FUlIo
cGMtPmNsaykpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHBjLT5jbGspOwo+ID4K
PiA+ICsgICAgIHBjLT5yZXNldCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhj
bHVzaXZlX2RlYXNzZXJ0ZWQoCj4gPiArICAgICAgICAgICAgICAgICAgICAgJnBkZXYtPmRldiwg
TlVMTCk7Cj4gPiArICAgICBpZiAoSVNfRVJSKHBjLT5yZXNldCkpCj4gPiArICAgICAgICAgICAg
IHJldHVybiBQVFJfRVJSKHBjLT5yZXNldCk7Cj4gPiArCj4gPiAgICAgICBjaGlwLT5vcHMgPSAm
cHhhX3B3bV9vcHM7Cj4gPgo+ID4gICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX09GKSkKPgo+
IEJlc3QgcmVnYXJkcwo+IFV3ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
