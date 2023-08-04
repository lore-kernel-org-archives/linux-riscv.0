Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B89C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJ39snjbx0614cpsAOD4XJpK+Wq4Kf088Q3lBC7/E74=; b=fzLNqGX9UZW4OE
	r+pmNlIH6qbmZCdiXmjJpp4Dh6n7q4Qi4+gA2ZCm005I0w9oEEfohe909r4+IWbwohndcaQQ6z7SU
	5HjHA0j3N8IS22o8DXo6Q/yBSTpOSGnyuMElANB7roc2vS7wIfUSxVq3xI1FEU14HsZT74h7URAYc
	lm4LxKzJOn2NqHeR1bV4lLWxiuH9I0Ek1PEH3KZ25H6vWk4bmw4aZL/SvmPntov0idZUE3Ryj9vOz
	WOwFZQi5bYwFsHKBLBYbyFBUYCGBG7aT2lDfsacyZ0VKsqvwQY2jhaKI99ea07DQC727SSOoJ4jFo
	lUUWYQmRfpE9Gbt6a/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRvy1-00CcAt-27;
	Fri, 04 Aug 2023 14:39:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRvxz-00Cc9j-00;
	Fri, 04 Aug 2023 14:39:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe45481edfso10922035e9.1;
        Fri, 04 Aug 2023 07:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159983; x=1691764783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/keJTTgc2oKYX00bfWRy8iHTbGm3dqXm1dsaxhchcPc=;
        b=KvfYSC7CEGPj1YKXYXG8g17C2CnIly55fHMe4Bh/zvSSV8wQcCvIDANJDAg7EFYs4k
         Rgxq2Sa7zYSYpyWedo5/COPTTpFMxQYLDBQI7zXnifk11g5RpHYI/SSkODB7BPR1kNpu
         RH7IzSbez5tb7/fYj4Hgo4DtniyoeeUIIFaHyRMwuZrj7tw3vyB9o/43BIuP0FLOgz58
         9JAc9SwqVHqix78jPoFsov0VCFE2WP8aO4cJsRZj8iN8yy74PjUZeWOM2cdpy/zy6HP9
         dK7t/LUbhrN2i4Rd2ji/MrW/GO4Vl88dDHD+/PEvM3S7rmZO5ja3j96DAqugQMhrowPi
         hbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159983; x=1691764783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/keJTTgc2oKYX00bfWRy8iHTbGm3dqXm1dsaxhchcPc=;
        b=dlycLDW3SIe9cHSHsAHhSQnAhj4ZVnd/iAoQOPmX0qNbMbQvHNkV4wWGzC5eQ6/CaO
         3WWjsAOY0hqFbJCNjhKmilB4WtJUF2GuKa0bRDbSxmsQoCUTjR6PGBaecnccMbsGNzlP
         eiFuPgtOy71CdamxTi9LWVO6HhxLJMHHPW/2iBJzfWekEECUOfeBpV6wESoJVquhXzz8
         DpGcKp5hixSqIsmlPJt+dxZ30y8FeYfgYLTSEE6wUgrK0FySSSC1aaMNxJvm1o4t/90n
         4Wj8k9wd2vzM2FzKfM44gxl11vmLMhzpWM15nrHlPD9aI2YulCrsDm+fP2VIZZYEFaCq
         CJIg==
X-Gm-Message-State: AOJu0Yx4N25wyD50A0E/U17OS+iI/rbxDTW1MoD1Bomu/xlMWRwKO8U9
	irssXG8bjDaroglqMqqXf7A=
X-Google-Smtp-Source: AGHT+IF3frUwbfH0b36TWheEdo2zyf2bWjXefALR0x/pFUcE5xwHRR11pBKFVe1FSUbK1lZJev7c/w==
X-Received: by 2002:a7b:cc95:0:b0:3fc:3f31:4233 with SMTP id p21-20020a7bcc95000000b003fc3f314233mr1884635wma.38.1691159983036;
        Fri, 04 Aug 2023 07:39:43 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id f22-20020a1cc916000000b003fbc9d178a8sm6834019wmb.4.2023.08.04.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:39:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: John Watts <contact@jookia.org>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Date: Fri, 04 Aug 2023 16:39:41 +0200
Message-ID: <5696365.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <ZMyZ5kZSiiJHtdeS@titan>
References: <20230731023701.2581713-1-contact@jookia.org>
 <3248110.44csPzL39Z@jernej-laptop> <ZMyZ5kZSiiJHtdeS@titan>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_073947_045331_9547114E 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, mkl@pengutronix.de, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RG5lIHBldGVrLCAwNC4gYXZndXN0IDIwMjMgb2IgMDg6MjU6NDIgQ0VTVCBqZSBKb2huIFdhdHRz
IG5hcGlzYWwoYSk6Cj4gT24gVGh1LCBBdWcgMDMsIDIwMjMgYXQgMTA6NTk6MzBQTSArMDIwMCwg
SmVybmVqIMWga3JhYmVjIHdyb3RlOgo+ID4gcGluY3RybC1uYW1lcyBhbmQgcGluY3RybC0wIGFy
ZSB1c3VhbGx5IGF0IHRoZSB0b3AuIEhvd2V2ZXIsIHNpbmNlIHRoZXJlCj4gPiBpcyBubyBoYXJk
IHJ1bGUgKEkndmUgc2VlbiBpdCBtaXhlZCksIEknbSBmaW5lIHdpdGggaXQuCj4gCj4gSGFwcHkg
dG8gY2hhbmdlIGlmIG5lZWRlZC4KCklmIHlvdSBkb24ndCBtaW5kLCBwbGVhc2UgZG8uCgo+IAo+
ID4gU2luY2Ugb3JpZ2luYWwgRFQgbm9kZSBlbnRyeSBnb2VzIHRocm91Z2ggbmV0ZGV2IHRyZWUs
IHRoaXMgc2hvdWxkIGJlCj4gPiBwaWNrZWQgdGhlcmUgb3IgaXQgY2FuIGJlIGRyb3BwZWQgdGhl
cmUgYW5kIEkgcGljayBib3RoIHBhdGNoZXMgb3IgSSBjYW4KPiA+IHBpY2sgcGF0Y2ggZm9yIGxh
dGVyIGtlcm5lbCB2ZXJzaW9uLgo+IAo+IERvIEkgaGF2ZSB0byBkbyBzb21ldGhpbmcgYmFzZWQg
b24gdGhpcywgbGlrZSByZXNlbmQgbXkgcGF0Y2g/CgpOb3RoaW5nIG9uIHlvdXIgc2lkZS4KCk1h
cmMsIHNpbmNlIHlvdSB0b29rIG9yaWdpbmFsIHBhdGNoIHRocm91Z2ggbmV0ZGV2IHRyZWUsIHdo
YXQgaXMgeW91ciBkZWNpc2lvbiAKaGVyZT8KCkJlc3QgcmVnYXJkcywKSmVybmVqCgo+IAo+ID4g
QmVzdCByZWdhcmRzLAo+ID4gSmVybmVqCj4gCj4gSm9obgoKCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
