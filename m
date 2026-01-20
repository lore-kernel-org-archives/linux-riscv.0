Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953DAD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90qcddn8vg/kDXRpNOvHRrEvnLh7ME7rFRYD8j+HI+g=; b=JOnt7k8saHuB4s
	21VhfNtPlJ4gddl35aJjjybSKQvVHEdRy6ffvnKOlTYNQTZUnlEZ77rSz4L+5bDVX9xZe1wz62/fg
	/+VlBngqP0sGGoSKMqiF4KhoC/Ofyr56u6xH1zEInbeK7ijticmaHxfTD4Y33RUlrEJK8faata3Mk
	gxHMGZi1lhYUb2enqgSVtw06WlUfgM5QLGg7NHZq70am67KlU6yzshwjZvzhx2Ur+qZ7lNJXlz+5A
	L4A5dShXs2xUIVSonxlSLCFTfvJ+tVALYMaCrkfbSdQj6Wrt4o+bWRh0kfiE7WOLOZnmOYxaXsCjv
	DeFNeGzGM+xx9NLLbaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7nD-00000003VqF-2ku0;
	Tue, 20 Jan 2026 09:12:55 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7nB-00000003Vpo-0AiQ
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 09:12:54 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-793ee375a23so16372757b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 01:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768900371; cv=none;
        d=google.com; s=arc-20240605;
        b=MQIG+hAdSjpvzkyscYXRusVY+dQtqupYM9PL6/a2inrZ8pgNOA3Q3rlbwUrISJNpTO
         FtZa8bbskTIu9xxM199ioZi0V2b6dgM3rRnPvC1DSVw7LfppEhezC/kcrLGiAMcMQlv3
         SurLmzyDFwilZbfCBQRJ+lq3pzBxefpaDxQIzt6uV0fXjL0ZKZwhDZIkKdru+3RM5Kv0
         GO6RRhW4ntHYAnSeNXpgD26pGi3V4aAGns8njTab5v7IcqdR+T6ByHv+7Yyv33bzs2fB
         C0cVK5FXq0p30zKRONKDe/a5ZV8W4vrdq2U2BIq+aIL0UUb3TyEQubTDOVUOofDtX7iM
         xIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNxgsdZ6Vqh8ZsmPDkFdaFpUMUQSLQTx1/iXhsZCiLE=;
        fh=8HmmVnR/Ynfx8xCoJZpYbjRQoXQyvpIT2c6BnDzle2E=;
        b=URo4mY0Zz+NsGxHR75Y/LH624Gm2TXafP14Cfoq6BfK/a4Bhw0Hz47AIZxEb8LMcDw
         zDA02SAgzZoP97d3GBuldvVi5PDkiXq0/ZksjMh+7B0lKXBcdqvFq9NegkfHc5PXm/ZD
         TmjqVxd9qSJB344Wxza0K2CH8KpcmsS1TQ1DyiewfEcF8b1BDnjO312wRdkSrKQ3d2Y8
         IFhBGjzPRpLVgyXMyCqJhFpHZI8l9bp1B8ywJoQqykkiPUWBlX3zEmZXDKzZwKOL1vpa
         jS3XFKjD7QMYPXuynZ/SFItWm//BtoXLLHeKFc3E6vX1mbTJkGoD/OlPMSGBcu0k5Eet
         1lfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768900371; x=1769505171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNxgsdZ6Vqh8ZsmPDkFdaFpUMUQSLQTx1/iXhsZCiLE=;
        b=LOk8qZYq5Jo7vnPcL1BdJ5Oj9I1jNjjIvMV343+KBEq8qjpUHhWm4LMUIxjXiExWM0
         NIAL8jdRu+DyuLKFBYF6P5+3C2xZON1PU1x3Jpj6+K9GXglxclhGG+dRdSbVS3U0gXBk
         U4FyRXDRDHOzMuJXeWN1kNTMFN+IYCoz8IM4spv0OFVTSmSSPD3SrBHWFr5M4xzJZMmZ
         fLSqp7XXHd97cEyJQPNDtpP6VP1sfoCxWMokqunz7GpYFl8r3wZoVpyvWSuOhmnq1Lcn
         kYgh5XvWW/Q2P0/l0sf2Dzh1uGnjYClfUutVwnHEZTemYiaRX7IDgg4o7iqqa2Im/NWr
         d/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900371; x=1769505171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNxgsdZ6Vqh8ZsmPDkFdaFpUMUQSLQTx1/iXhsZCiLE=;
        b=Ohj5x4d69yWayYUq6ZXLU2BUlNP27lxoohM0DlzohcMJqEMCikRECJ8fuaWqlEfYRz
         uAru/pRCA/mY5VIIQSAP+FQoWH/EDq8wOCKRutN8ln/GASPwTf3aTcOiYdAkZ3ZRGKA0
         T5qa+f+GQIBcyQS6kMyaBFHz3w5jOlNpuMRzwjesPUd/peRJv97XviOnPCR8X5WlK+QD
         XZi0yJriCPLMSZc7z+YkvMF/P4hwq3YcU5MCahasUR3o75u6hn+ygDSxfLxDWUF4PYWp
         I0cBxhzCZvZKdQIrpLo4i+i1hpaq1zzytPQWY8zJiknI6dRJFhr/CMwMl9EYJbNJvMUk
         pEag==
X-Forwarded-Encrypted: i=1; AJvYcCVbb6wN0Tno5OSSkqAgT0YTuA6yZ6TaXj7hCBRgpxDlq2jbScJBXI9gyzEljcxuvqwnWNvcVkafzNEmXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS/OMdo5wNykS38j3K26VQEou6PN8Y6+cDF79ligKvCIBPij5C
	BH4vg869CK952uY4LW1f7OqvoDmWqFFMAvAqd4brXBeOnxWj6CGef4fd0seVz2E9Sdo89siYYmI
	yrwv0Sh5vcOaOQB71YzWpf1HQJ0kNITlG/ZOFsu+AogJKo/pSvi+iN5ecLA==
X-Gm-Gg: AZuq6aLPQN0iNfchNksiNBuY568zqWZx7MUrMsMnk7IH30jOxSyVrtpGLIpu93lLiuP
	sSXJKOPuCrpNLo5Hi2zG8Yx7MEgYhYzD66Z4kn6gstNitskCFn6xVHU9q+zW/gUfxBZuTbh98Js
	FhHwW7O+fp0gQtjp/1axGxoDZ549Kq2b2+7/Bf2RS+qyomFCKgn/+H9q757AC+Ecn9sBYXqaG9D
	1sFVJvw0oLMoR6bD1pNmG+tutBkNba5eEebdURKFoMfDYX6ermj55dWtVQrOaJhJWRDCglpRdkk
	fcnsOguG8CwbgTVaUIY3+gdEC8GZR6grGryRz8XI9WdA
X-Received: by 2002:a05:690c:dc3:b0:783:6f68:2a05 with SMTP id
 00721157ae682-793c5262618mr114246527b3.14.1768900371200; Tue, 20 Jan 2026
 01:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-2-457df235efe9@riscstar.com> <f5a35fdc-9245-4be6-83a3-c1bfe86d30c9@riscstar.com>
In-Reply-To: <f5a35fdc-9245-4be6-83a3-c1bfe86d30c9@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 17:12:39 +0800
X-Gm-Features: AZwV_QiSUZjFVgUdNJN_FK9z3phGCKu7RzMoyj2ZIW92mPGRdZzm_Uoe-7AvW5g
Message-ID: <CAH1PCMbxE05U0kp0y1qVcE1Bozpq9DiDvS83DHTsh5XxdeqVsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] reset: Create subdirectory for SpacemiT drivers
To: Alex Elder <elder@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Haylen Chu <heylenay@4d2.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_011253_336762_DE639D78 
X-CRM114-Status: GOOD (  12.13  )
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

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMToyN+KAr0FNIEFsZXggRWxkZXIgPGVsZGVyQHJpc2Nz
dGFyLmNvbT4gd3JvdGU6Cj4KPiBPbiAxLzgvMjYgODoyMiBBTSwgR3VvZG9uZyBYdSB3cm90ZToK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L3NwYWNlbWl0L01ha2VmaWxlIGIvZHJpdmVy
cy9yZXNldC9zcGFjZW1pdC9NYWtlZmlsZQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmRlN2UzNThjNzRm
ZDdiMGZhYzNlYzJjMThkOTg1MzMxYWY2NGZjYmIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L2RyaXZlcnMvcmVzZXQvc3BhY2VtaXQvTWFrZWZpbGUKPiA+IEBAIC0wLDAgKzEsMyBAQAo+ID4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ICtvYmotJChDT05GSUdfUkVT
RVRfU1BBQ0VNSVRfSzEpICAgICAgICAgICAgICArPSByZXNldC1zcGFjZW1pdC1rMS5vCj4gPiAr
Cj4KPiBEaWRuJ3QgZ2l0IHNob3V0IGF0IHlvdSBmb3IgaGF2aW5nIGEgYmxhbmsgbGluZSBhdCB0
aGUgZW5kIG9mIHRoaXMgZmlsZT8KCk5vLiBCdXQgSSB0aGluayBJIGNhbiByZW1vdmUgaXQgdG8g
a2VlcCBhIGNvbnN0YW50IHN0eWxlIHdpdGggb3RoZXIgTWFrZWZpbGVzCnVuZGVyIHRoZSByZXNl
dCBkaXJlY3RvcnkuCgpCUiwKR3VvZG9uZyBYdQoKPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cmVzZXQvcmVzZXQtc3BhY2VtaXQuYyBiL2RyaXZlcnMvcmVzZXQvc3BhY2VtaXQvcmVzZXQtc3Bh
Y2VtaXQtazEuYwo+ID4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gPiByZW5hbWUgZnJvbSBkcml2
ZXJzL3Jlc2V0L3Jlc2V0LXNwYWNlbWl0LmMKPiA+IHJlbmFtZSB0byBkcml2ZXJzL3Jlc2V0L3Nw
YWNlbWl0L3Jlc2V0LXNwYWNlbWl0LWsxLmMKPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
