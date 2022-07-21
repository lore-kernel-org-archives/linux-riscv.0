Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D68C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytnVEoWeFwzZaOxBtlBdU6xNJHEbW/JMiKqPavIdnG0=; b=nylDr7vglX3RIo
	cH8eObNO6CbKt4PQ9wRrOSvHN9UEzaIK0jQl1t5nWwhXILz+qZKMf60t9tE6ECyHI9AnqEoeJjzy3
	hOIHq3rXTeSjNy4kKOfuW2AOqliWhflr+klfVts4yQPeKmkCAYwRwyumtcenZAsNQP4katols/r6q
	Wf+0mYVqP62mhy2Ujg0TKe5uA8n/Pb1+YUz8/uBz4A+unoSGuvysZtoy8Oe3r5F/QSLi4OoFzo4ts
	I84wIhsyeBdyNX/feUYajCJ/IdxKjgCVvpt46miXbBG9lrJdbA+C9hiYEsf2tvACpR0MhEfvcpWxV
	7C/M+tP2c8ygTu3k+shw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXCC-007ykF-7V; Thu, 21 Jul 2022 14:30:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXC7-007ySp-Ti
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 14:30:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bu1so2528305wrb.9
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XhhMsY9RfWRqTmpaxcMmlEuk/6JY2Q0sFPTnxJuSH/c=;
        b=HF/GiANUG1tbwXOkMqbonr5uqgeDDqKXeHrpOGj9X1YCLcgJ31NlFsLSr19G+Us9iB
         fje0mIeU4RN4HWR/+C1BatWkzkD/Cylb//dKW0uio4/xskDi7YQBjPIcNnhBgkbOV6fq
         cz3WwLwdCrtnco6bL63SgRQ+LFIrLEeVdrNP0RRdcf76IGydcR4HYfLgo9tel4+DH2QI
         JeHWn8SsvVabE2yEQKwfRToTepvHML+GqcfARbnjBlMIaMQlZv5gxMdz9lK0EmltBh1A
         8Tk9OVCAkTsnvvLX1Fen9dReiGaKEXmKgJ26gzi0HuWd2GiYsq0GPBQy3SqgYxJf49ul
         MCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XhhMsY9RfWRqTmpaxcMmlEuk/6JY2Q0sFPTnxJuSH/c=;
        b=nXwdED+4Y1xyOdN7le7m93vXYfd7o3uInoS71GnN5YIwNMtBk82TyaFvaBbeFcO/Ex
         fuvWIHLvNhsrag7trIIdsm7Jcyd5gF3re6+isSsXh555E3JQRMjW4Jv4AU3UuUlmD1rQ
         /19J5BvZkmfQTWI2Vp2rQTo4WolNll//WuZHXYSXuaj56eih656LAuLn370Pjh8vgZr3
         R61p5MLNUTu9egB44xP/ePDV7mBHOFbYJ2JiaPcLAGwQ2oO7EhU/iqz/A3PybTjWkEMW
         lWDBgg4Jr/6pbwJcdpCabzv+8OhfI1oz+6nd45n5ar+SSatmwiXUrQnw50nku8iC5bgl
         ud8Q==
X-Gm-Message-State: AJIora9R9TyuNZkXrsIICNaVHP5K5QQEmIZAHloRYHUQPdrdCa1EoCMm
	H1KHc6mh3e9WNK7dmAs+cVFySg==
X-Google-Smtp-Source: AGRyM1tSv2LRbOsioc1gUtCnwKFEXIgzbpBFTfyM17uLvH/QU77KYxhHSkynSfcLTg2qDA6NtYC+Xw==
X-Received: by 2002:a5d:59a2:0:b0:21d:a96b:b3dd with SMTP id p2-20020a5d59a2000000b0021da96bb3ddmr32689302wrr.128.1658413823838;
        Thu, 21 Jul 2022 07:30:23 -0700 (PDT)
Received: from [10.205.160.53] ([95.83.233.54])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d4486000000b0021e47fb24a2sm2138817wrq.19.2022.07.21.07.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 07:30:23 -0700 (PDT)
Message-ID: <157e8ae8-2456-dca3-ab2e-5f60a5223ca2@conchuod.ie>
Date: Thu, 21 Jul 2022 15:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 3/4] pwm: add microchip soft ip corePWM driver
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Conor.Dooley@microchip.com
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Daire.McNamara@microchip.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220712142557.1773075-1-conor.dooley@microchip.com>
 <20220712142557.1773075-4-conor.dooley@microchip.com>
 <c49776c2-4807-91c1-010a-a33bd98b68b7@microchip.com>
 <ee05749f-c33f-3505-4309-f4d036de92a1@microchip.com>
 <20220721142030.yh7x3ebr2b4fcunc@pengutronix.de>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220721142030.yh7x3ebr2b4fcunc@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_073028_029725_7F87091A 
X-CRM114-Status: GOOD (  13.41  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjEvMDcvMjAyMiAxNToyMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gVGh1LCBKdWwgMjEsIDIwMjIgYXQgMTE6MDU6NTRBTSArMDAwMCwgQ29ub3IuRG9vbGV5
QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+IFNob3VsZCBJIHJlc3VibWl0IG5vdyB3aXRoIHRoZSB3
YXJuaW5ncyBmaXhlZD8KPj4gSXQgaXMgYSBwYWlyIG9mIHVudXNlZC1yZXN1bHQgb24gdGhlIG11
dGV4ZXMgJiBhIHVudXNlZC12YXJpYWJsZSBzbwo+PiB0aGV5IHNob3VsZCBub3QgaGF2ZSBtdWNo
IG9mIGFuIGltcGFjdCBvbiBhbnkgcmV2aWV3IHlvdSB3b3VsZCBnaXZlCj4+IGZvciB0aGlzIHZl
cnNpb24uCj4gCj4gRG9uJ3Qgd2FpdCBmb3IgbWUgdG8gZmluZCB0aGUgdGltZSB0byBsb29rLiBJ
ZiB5b3UgaGF2ZSBzb21lIHBlbmRpbmcKPiBjaGFuZ2VzIEkgcHJlZmVyIG5vdCB0byBsb29rIGF0
IHRoZSBzZXJpZXMgd2l0aCBrbm93biBkcmF3YmFja3MuCj4gCj4gU28gZmlyZSBhdCB3aWxsLgoK
Q29vbCwgZGlkbid0IHdhbnQgdG8gc2VuZCBhIHJldmlzaW9uIGlmIHlvdSBjb3VsZCd2ZSBiZWVu
IGluIHRoZQpwcm9jZXNzIG9mIGxvb2tpbmcgYXQgaXQuIEknbGwgc2VuZCB0aGUgZml4ZWQgdmVy
c2lvbiBzbyB0aGF0IGlmCnlvdSBkbyBnZXQgYSBjaGFuY2UgdG8gbG9vayBpdCdsbCBhdCBsZWFz
dCBiZSBhIGJldHRlciBvbmUgdGhhbgp2Ni4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
