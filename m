Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CFEC4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvkR7G+lc9IWspdp/VWFdZ3lFWTXWH6WV5d1yMZ/n1k=; b=Msl0rJShnSFTCq
	R+2qA7ffbH1nWuX/Q1/7+FLHiRI2LseweXHuhQbHj+Wq727eQmFFvAE+XQ4EsX0Brh695EkowiXHz
	S3NBD/CmRDOtZ1KPt5GeccVWHjqv0OxiE9D1kSh7vSYQoZbPoPkMfqx+ZFWne/OkIrPmEzVU0Hl/X
	tA/9v2RnKl5Pzw3FFbET2snOEaRBS4l2AB6ZYKDwWjur38VX9gccaIyXPSnSmrL+WFSuGrfoQNQwV
	2aTr4NbCmKdHbAeS3MfBCwOL1elDF+DrnWwXSfe8qm36XWMcIjXhiYbATzKozAICUNRCzJbLgyj56
	U+5z1QIFEH8qCJ2EMT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXdWq-0000000A4Uk-1ZXU;
	Wed, 07 Feb 2024 08:43:36 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXdWm-0000000A4SP-3vqQ
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 08:43:35 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-59a8ee08c23so114070eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707295411; x=1707900211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp05Gs6ocR+pGiy78G1ozNGgoHRJUMGLkTNH5sSFn7s=;
        b=ZISdR8+3Ki+Ia5FPSiX26vvyHaU9arLCjVjD21RiNOBzTBu84KiVb8/VeJP6aItV3d
         2NecRMroZCNVLzttmlBjtvdFYlA6/xWnXIuu9dGNTsp6m/b3Z42iiO8o9e+oneo6vddz
         Fa9CgZ0mzSb7BlijvQCboqtK7FIXG3p4QUsHhmBhNuCieokooXhsZ7xbIEhfRZ5GCgwl
         G2jpfG75gwuaKJxUSDFZv9tojTvt8D+OUgHPvB1V6j/PHD70y9OwyuR/oj4FRPGSIETz
         UaJU8KxxB0r0Yvrd8JX+S/7FIEoZQ9Q99ciWsjSMQJW6t8LNHhhFanB4VWmA4RLtmTdC
         6+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707295411; x=1707900211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vp05Gs6ocR+pGiy78G1ozNGgoHRJUMGLkTNH5sSFn7s=;
        b=ePS/Aq3wdiBGDxJmKqOZhoEHExMQUjrHT7MiYBgyXWVJ9wx1aGxXAehaa/+wact63/
         MAkqtGTuhOxo8GoOsPm6ICg9e7nDKk4CpnsZeq6+DL/5AO6bKG9SaGSINaXt9qDuK3ne
         XQp+FbaF3mbESB07D28yUuAi1hjtOvsFOvDCRCqiMQYBdqeXyWGHPf/nFpk9mMENsbUG
         dtdWr3PfYVKPaoGUBflsyY0/B8+tc5G1s5UEGvu9KBc7ssXHmLD62pLfFtwQrufkky9o
         yP2FBdFwJT+Yg6ox6L2eK0hgoCNIHuxrndZbaEFBhGLpIVjP63v9xY8UJ+BedIUs/3Ln
         Z8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWr17h4iPuIRZEr4lXrMrIM9QmU6lN39poe9eUBYZ8sYFE2ZUXogDANnelHfLL2FZUBlrmYE5tg1tGjRsd1ubk2NEnFPcYm/i7aVTQLz3ya
X-Gm-Message-State: AOJu0YxG+QU6FqV2xp3EcTWwi7g3Ery9YCPEd63/kQLFL8wrD0Ywy0C5
	n6gil2xnek774u2qSDgQ9IR5sLR0hOaKwRtkZvyLnw2A6QYdjpPeebW3tcwCab0XQOIgCtpTppI
	ErU808mh8nDGeg8AC5VIKa+DxiyvEgbh3R4gO/Y/uQ2I=
X-Google-Smtp-Source: AGHT+IGELlPVInHjuUNFiDoSwgl7eSrE39No9ErdiklAgq08gvX4ku9OXQZAPLT6wq1PZeBHvsC3cViu9Ao1ZMWDCJI=
X-Received: by 2002:a4a:86c5:0:b0:59a:161e:ed64 with SMTP id
 y5-20020a4a86c5000000b0059a161eed64mr4392036ooh.8.1707295410167; Wed, 07 Feb
 2024 00:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20240207055856.672184-1-qiujingbao.dlmu@gmail.com>
 <20240207060913.672554-1-qiujingbao.dlmu@gmail.com> <14d1464b-7d60-4021-bc33-b0e809f3cde0@kernel.org>
In-Reply-To: <14d1464b-7d60-4021-bc33-b0e809f3cde0@kernel.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Wed, 7 Feb 2024 16:43:19 +0800
Message-ID: <CAJRtX8Sj01ENTQ0VRNzwBy+e9qHyJdtUQxWBB1yDCE77-Xb9qw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: u.kleine-koenig@pengutronix.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_004333_005748_2D9F1940 
X-CRM114-Status: GOOD (  13.33  )
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

T24gV2VkLCBGZWIgNywgMjAyNCBhdCA0OjA54oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDA3LzAyLzIwMjQgMDc6MDksIEppbmdiYW8gUWl1
IHdyb3RlOgo+ID4gSW1wbGVtZW50IHRoZSBQV00gZHJpdmVyIGZvciBDVjE4MDAuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSmluZ2JhbyBRaXUgPHFpdWppbmdiYW8uZGxtdUBnbWFpbC5jb20+Cj4g
PiAtLS0KPgo+Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgY3YxODAw
X3B3bV9kcml2ZXIgPSB7Cj4gPiArICAgICAuZHJpdmVyID0gewo+ID4gKyAgICAgICAgICAgICAu
bmFtZSA9ICJjdjE4MDAtcHdtIiwKPiA+ICsgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0g
Y3YxODAwX3B3bV9kdF9pZHMsCj4gPiArICAgICB9LAo+ID4gKyAgICAgLnByb2JlID0gY3YxODAw
X3B3bV9wcm9iZSwKPiA+ICt9Owo+ID4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoY3YxODAwX3B3
bV9kcml2ZXIpOwo+ID4gKwo+ID4gK01PRFVMRV9BTElBUygicGxhdGZvcm06Y3YxODAwLXB3bSIp
Owo+Cj4gWW91IHNob3VsZCBub3QgbmVlZCBNT0RVTEVfQUxJQVMoKSBpbiBub3JtYWwgY2FzZXMu
IElmIHlvdSBuZWVkIGl0LAo+IHVzdWFsbHkgaXQgbWVhbnMgeW91ciBkZXZpY2UgSUQgdGFibGUg
aXMgd3JvbmcgKGUuZy4gbWlzc2VzIGVpdGhlcgo+IGVudHJpZXMgb3IgTU9EVUxFX0RFVklDRV9U
QUJMRSgpKS4gTU9EVUxFX0FMSUFTKCkgaXMgbm90IGEgc3Vic3RpdHV0ZQo+IGZvciBpbmNvbXBs
ZXRlIElEIHRhYmxlLgo+Cgp5b3UncmUgcmlnaHQsIEkgd2lsbCBkcm9wIGl0LgoKQmVzdCByZWdh
cmRzLApKaW5nYmFvIFFpdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
