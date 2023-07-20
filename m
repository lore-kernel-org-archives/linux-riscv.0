Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A060DEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9J39NlyFbf5f7GfK2DmPhm3XYDo7s1CoYjXUPiJvnU=; b=sK8JwYVNwCt5nn
	YaeMO+1h0Rydqg2SCmXCOilvDfU2Ain9vhTkYALU+kE2M9QTNgUbGZei7KqU/B067weyxYM/TvJjI
	b+aR5jH2ePb1/+8kR+I0LUPNq4TX6mXjT97gz1pM75UDh0Mg4Ccnm5OD0UA8ATHgezLjTd30rIhPW
	bFaOaKRz5iONV32Dxxe0/Dd8wiGERMLyveTORrYeYyxGyGVLiAq/sQCpP7SmlqszqsRdBKmc2ikCt
	fTHcZ8x87Pf3fOdXbOSt+Th6hNecxJF31mz9iH5rB0Si+1+DOL4GDwFZOos0P+URD738Y/H81Ed89
	OmQVXfSQxr09ojoxQcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUqV-00BPl9-0d;
	Thu, 20 Jul 2023 14:41:35 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUqK-00BPfQ-0n;
	Thu, 20 Jul 2023 14:41:25 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991fe70f21bso148272966b.3;
        Thu, 20 Jul 2023 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689864083; x=1690468883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLrHxYUorj4cRATSl4FYWOBY6cgIskL8/uHYHedoFV8=;
        b=gWcKKtu+NPxLWPKoWi3l0E4hcgurpq8rsryPV5UeUd/jTyTcdlvtGzb8gh0vph929W
         hr/RMZNCEsxLG3NWBSl60PCuiWYcdsfPONdHgFdAOnDMUgDNA1qOo8kUP2AUFiJiMcDf
         UKtBS/ErkKBVFXl2mZncl0VCjfxioeF1wCFhisv/VGv0JbxKwdQHnjdMPtQl8dpjxT6I
         ccyE8q9NPMzASWLBYhw4sR4Pzu1xv2BMCVLl+k0kZzQkNDpSaiv7UzSVPpeN6wSITaAf
         ZXLIBD5HlyMKXxRDkrj7j3QZ1sgaderLBP6XGfHj0oYi4LU4XCdssHqdMFcQCOiWQo+d
         QWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864083; x=1690468883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLrHxYUorj4cRATSl4FYWOBY6cgIskL8/uHYHedoFV8=;
        b=XoUIlT4MeZPZ7JMasZmYuVY8uoZ+44BHjHquonGejmkaIpvIQOEMpGYSvFSooPaFn8
         3+1TZQJ+WLDORKOOKB1hRf/9qsBeaJIAzs+zoDcudgi6EVvqeeaFIUAvrahgvMB/muhR
         bP1+GhQrFgnxiWBBuI6xvItPUYhQ0UZpvY7JdV7+Sh/Zozw9zHAIjnbbnhjsZGhWSF4z
         nBMowFU+xRPbjhLlNnu+NdBQd7cmLKuk7Y+NwStPoZSHXcsuFBRIW4OH0ai0O741Shvz
         7bIOux72iWCQCeulu0u40MVDCD5PIUPTLh7UgaHS30YyY12ih2/t6O1N11vdDEUMZ3tR
         Os2Q==
X-Gm-Message-State: ABy/qLYFGdi7ZJzpj6FfCtmo3mnFYkuK6y2am7n1QeNpz04C3qBavl2v
	ZwJW6Gyr2iqT0pkLv07kg+c=
X-Google-Smtp-Source: APBJJlHgueNlqW0haDo5hRGUxcvhVV7/ihvmmvg/gwqzFV0iohHNBCeqNUuKd8ZztzBQESq59FBD8w==
X-Received: by 2002:a17:906:8488:b0:970:1b2d:45cc with SMTP id m8-20020a170906848800b009701b2d45ccmr4904840ejx.57.1689864082442;
        Thu, 20 Jul 2023 07:41:22 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906924b00b0098e34446464sm799399ejx.25.2023.07.20.07.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:41:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <michael@walle.cc>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
Date: Thu, 20 Jul 2023 16:41:16 +0200
Message-ID: <168986404868.1519829.8131310221840364014.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_074124_281922_434252C4 
X-CRM114-Status: GOOD (  10.42  )
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

Ck9uIEZyaSwgMTQgSnVsIDIwMjMgMjI6NTY6MTMgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IHdoaWxlIHdvcmtpbmcgb24gYW4gZXh0ZW5zaW9uIGZvciB0aGUgcHdtIGZyYW1ld29y
aywgSSBub3RpY2VkIHRoYXQgc29tZQo+IGRyaXZlcnMgYW5kIGV2ZW4gdGhlIGNvcmUgb25seSBu
ZWFybHkgY29uc2lzdGVudGx5IG5hbWVkIGFsbCB2YXJpYWJsZXMKPiBhbmQgc3RydWN0IG1lbWJl
cnMgaG9sZGluZyBhIHBvaW50ZXIgdG8gYSBzdHJ1Y3QgcHdtX2NoaXAgImNoaXAiOgo+IAo+ICQg
Z2l0IGdyZXAgLVBobyAnc3RydWN0IHB3bV9jaGlwIFwqKlthLXowLTlfXSsoKm5sYTpbXChhLXow
LTlfXSknIHY2LjUtcmMxIHwgc29ydCB8IHVuaXEgLWMgfCBzb3J0IC1uCj4gICAgICAgMSBzdHJ1
Y3QgcHdtX2NoaXAgKnB3bQo+ICAgICAgIDEgc3RydWN0IHB3bV9jaGlwIHB3bQo+ICAgICAgIDEg
c3RydWN0IHB3bV9jaGlwIHB3bV9jaGlwCj4gICAgICAgMiBzdHJ1Y3QgcHdtX2NoaXAgKl9jaGlw
Cj4gICAgICAgNCBzdHJ1Y3QgcHdtX2NoaXAgKmMKPiAgICAgICA4IHN0cnVjdCBwd21fY2hpcCAq
cGMKPiAgICAgIDU3IHN0cnVjdCBwd21fY2hpcCBjaGlwCj4gICAgIDM1OCBzdHJ1Y3QgcHdtX2No
aXAgKmNoaXAKPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzAxLzEwXSBwd206IFVzZSBh
IGNvbnNpc3RlbnQgbmFtZSBmb3IgcHdtX2NoaXAgcG9pbnRlcnMgaW4gdGhlIGNvcmUKICAgICAg
ICBjb21taXQ6IGI0Zjc4ZmY3NDZlYzUyNzRmZmZhOTJmYTJhNGRjNTMxMzYwYjUwMTYKWzAyLzEw
XSBwd206IGF0bWVsLWhsY2RjOiBVc2UgY29uc2lzdGVudCB2YXJpYWJsZSBuYW1pbmcKICAgICAg
ICBjb21taXQ6IDUwOTE0MzkyNmUxODQ3NjJjZGFmZmI2YjY3ZDM4MDlmZGRkN2Y0ZDkKWzAzLzEw
XSBwd206IGJjbS1rb25hOiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hp
cCIKICAgICAgICBjb21taXQ6IGFmODczODVjN2FkMjc4MjA3ZDM0ZmYzNjgxZmEzMjVhMjQwYWU4
N2MKWzA0LzEwXSBwd206IGNyYzogQ29uc2lzdGVubHkgbmFtZSBwd21fY2hpcCB2YXJpYWJsZXMg
ImNoaXAiCiAgICAgICAgY29tbWl0OiBmYzMwODI2ZDUwZDEwZDY3NjI4YWRkZmFiYjkzNjdiNTA2
N2VmYTQyClswNS8xMF0gcHdtOiBjcm9zLWVjOiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZh
cmlhYmxlcyAiY2hpcCIKICAgICAgICBjb21taXQ6IDZiNWZkYjJiNjU1YWM5YWJlNmZiZDJjYmNi
MjVjODgzN2UzZTg1NTMKWzA2LzEwXSBwd206IGxwMzk0MzogQ29uc2lzdGVubHkgbmFtZSBwd21f
Y2hpcCB2YXJpYWJsZXMgImNoaXAiCiAgICAgICAgY29tbWl0OiBkZDQ5OWI2MzYxOGU1MjNiNDdm
MzBkOTliZjIwZjQxN2RlMTE4N2ZmClswNy8xMF0gcHdtOiByb2NrY2hpcDogQ29uc2lzdGVubHkg
bmFtZSBwd21fY2hpcCB2YXJpYWJsZXMgImNoaXAiCiAgICAgICAgY29tbWl0OiA4YzI5N2QxZmRi
NWQyYjgxZDM5YWRhNmI0MzVmYjkyYTQxYmU5ZjE3ClswOC8xMF0gcHdtOiBzaWZpdmU6IENvbnNp
c3Rlbmx5IG5hbWUgcHdtX2NoaXAgdmFyaWFibGVzICJjaGlwIgogICAgICAgIGNvbW1pdDogY2I2
OWY0MGVhN2NiMTM5MjIzOTAxZmNmYzgxZTRlMGEwYTAzNjczYwpbMDkvMTBdIHB3bTogc2wyOGNw
bGQ6IENvbnNpc3Rlbmx5IG5hbWUgcHdtX2NoaXAgdmFyaWFibGVzICJjaGlwIgogICAgICAgIGNv
bW1pdDogZTc5OTc0YzVjM2RkYzNlODE4MWY1ODIxMTdjNDM2ODU1NzUyNGYyMApbMTAvMTBdIHN0
YWdpbmc6IGdyZXlidXM6IHB3bTogQ29uc2lzdGVubHkgbmFtZSBwd21fY2hpcCB2YXJpYWJsZXMg
ImNoaXAiCiAgICAgICAgY29tbWl0OiBlZmQxZDFhZDdmNTI1ODA5ZmNkZjc1Mzg2MzhhMDgyNzRi
NzVjOTlmCgpCZXN0IHJlZ2FyZHMsCi0tIApUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
