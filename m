Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37961E92724
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 23:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hwc8bC+BsZhI8exGMwtbz1vfamkV6cMu1QRIIvmFghY=; b=FlUgO4hxdOeis5
	aK917flGoS8Wj5t3n29rSzyf3xZYFjNQoWcKYBMIVIL8dCrFDyi9k2qdXbbutfaMGwNlmqie9cXBp
	ZPTwHAywWCJhhDTTvhqDszVyrUnp3hAlWC2OkTFLK6WSXbvnyZAXuswZG0yLNc8FXT4ncSFaxmnl6
	bgO5DIcNbBoxRveGsj8oA04VfvQidBYOtvPYzeXBIDwkmmyNkQrrxw/15vOTQXyDTly/UIIHsX9XB
	uHLW4W3k+2Dml//yOrjqVcFsAnY2AQ+zLZ5FRp/O8kngOFp64mBgAhbW8gSBWAsASDCKwA4eZFu8E
	VhI8/HcRWFfWS8p6jnhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZe6p-00000002Hcl-3osr;
	Sat, 27 Dec 2025 23:54:07 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZe6n-00000002HcO-23Je
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 23:54:06 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-78a712cfbc0so75268187b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Dec 2025 15:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766879643; x=1767484443; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vAJYJFTVTvQKublqQlzRcmbWps7nPfytE/7e/IWl6M=;
        b=v6G1RDoRcl5No6lAq7YZiDrsVV0qcw08abuMCLYkizJ49OFfdEVCGw7/iByYt9Lqhz
         f9cacA+xN8qWKup/q8v8FxdXbBr5LN/actIElFbcy6STOoqywDMY4R8uM9K0ToNrjVID
         uo7KCwFwTSgdK+amUv3goX/78IyQCkd6JC551q+4+OiQ6seYuzs/MZ3W7N34+W8shNtf
         aeSxSe9qeKzRNOfQuEg/RCTAZ9oVHJMD21X4zJHtTjcehAhUodqps7lYbSavf6kwam0T
         O93XRTNstQKkze/VG+wb2GM9mY/KKrd3tS9/8rFQwea02vDJFSkBAuROah+z7i69j7Sq
         lnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766879643; x=1767484443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0vAJYJFTVTvQKublqQlzRcmbWps7nPfytE/7e/IWl6M=;
        b=gN6ozh+y7KJKbGzIgQB8GrgjJQTZIYueIIbOzDW4cVsLenATd711g/XyiRPUkp1Z7u
         YGzu20+O2/JXfYJuVhByMtZyGVdjavLn+tEwY+ZI2XZ3QMCNmb+MaSBtGC8H56r/1Q3B
         QqIpdmFzKeDjo9jRYAUWFKM7R/PJnXnt0wiPMzXQuG6InoscOALveggJAERqgOdJcUMS
         GerNzxV4tz/BNxViWUfLaOfbeNyYPQfXQc90CpLaY49YS6Dv/zj46AAsBilZy/iqFolW
         pu1ax642jmg7HrDjgRSMTjPpvpzeC9Kgie2LxRIPHb3T4vvnV7hKpTpzDaE636PNAIGh
         aadw==
X-Forwarded-Encrypted: i=1; AJvYcCUCJ/ZPVbuIzsOS2nTemhmmxZlznr2vH0Hb8lS7SDq5o1LXods+JYv2qC8G77rE4lfcyZ5cXtEcVBj3Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Tt8C+EaXK+0//9lH2LT44nvWd6V/lWoxecFsmInA8vJiBOJO
	B3E8/8jaD7d3HK1qeKHN79fiDAaS2AcfHYsdoYl8++gFqOtHuRotzlEdD472IBnDkIMzwNIN7TA
	v+Rhqnh3PUK+0tFXIZE0gSfmC4kMHgpLredsi/cVIEQ==
X-Gm-Gg: AY/fxX4kd788sMyNu/oReBofFX60XoMETuSddsnu44mq55OCkGB5aCJ3f9EoU6Ew66r
	s+Saw3mutfk7/8KwJY8wzA5zLXWH8Cxo0ypFUqKaBuw2t/zeUdbBPgtcveFjoN2OsP/fQ3HesMr
	2gYtjEryOJ1gbAEIbAcOqxgXp7Y/zFmYZyO8mn0Qp2EnQeFT322XquJmbBoRf7jaCImDf52ajTI
	c3H+0zf5hOmaaNDgOMNw8BWOeSHppdAcTnCgL+dMwuBbAsEhs3S1t80vbmgy+15VuLlHuvVEiKL
	iW6PZmwAHgXRKS3P3AziVsRJJrW1Z1ZSiyQkcInhET+/lN3MCRrtgWM=
X-Google-Smtp-Source: AGHT+IEhv1iwMFNgzL2n1D3qxYmYFnznNjZn/Bh2THNz0qVQWcHa3YNmsM1U54RXexGunoARNUdRYz2jyJk3Os5ODmY=
X-Received: by 2002:a05:690c:610b:b0:78a:6e23:2542 with SMTP id
 00721157ae682-78fb400dcfdmr218117857b3.35.1766879643443; Sat, 27 Dec 2025
 15:54:03 -0800 (PST)
MIME-Version: 1.0
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com> <604e5781-5c59-422f-9c5a-ee4be6f8b329@kernel.org>
In-Reply-To: <604e5781-5c59-422f-9c5a-ee4be6f8b329@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 07:53:52 +0800
X-Gm-Features: AQt7F2qc20ZUjd9UnVS-1ZbeNfksHFtdnbsOaXZ8RFpk1tbDmXxCOs-6B3ZEmyE
Message-ID: <CAH1PCMag00z2Fp8zjMUPS7AdU6Lgk0UsS+mku93NtNejqjyBMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] i2c: spacemit: add reset support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_155405_813944_646A6BC1 
X-CRM114-Status: GOOD (  14.66  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgNDowM+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxOS8xMi8yMDI1IDA4OjQyLCBFbmNyb3cgVGhv
cm5lIHdyb3RlOgo+ID4gQWRkIHJlc2V0IHN1cHBvcnQgZm9yIHRoZSBLMSBJMkMgZHJpdmVyLiBB
IHJlc2V0IGVuc3VyZXMgdGhhdCB0aGUKPiA+IGNvbnRyb2xsZXIgc3RhcnRzIGluIGEgY2xlYW4g
YW5kIGtub3duIHN0YXRlLgo+ID4KPiA+IFJlc2V0IGVuc3VyZXMgdGhhdCB0aGUgSTJDIGhhcmR3
YXJlIGlzIGluIGEgY2xlYW4gc3RhdGUuIFdlIGNhbm5vdCBhc3N1bWUKPiA+IHRoYXQgbm8gcHJv
Z3JhbSB1c2VkIEkyQyBiZWZvcmUgdGhlIGtlcm5lbCBib290ZWQuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRW5jcm93IFRob3JuZSA8anljMDAxOUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IENoYW5n
ZXMgaW4gdjI6Cj4gPiAtIFJlcGxhY2UgcmVzZXQgcHJvcGVydHkgaW4gZHQtYmluZGluZ3MuCj4K
PiBSZXBsYWNlIHdpdGggd2hhdD8gSSBkb24ndCBzZWUgYW55dGhpbmcgZWxzZSB0aGVyZSAtIHlv
dSBzdGlsbCBoYXZlCj4gcmVzZXQgcHJvcGVydHkuCgpJdCBsb29rcyBsaWtlIGEgcGhyYXNpbmcg
aXNzdWUuIEJ5ICdyZXBsYWNlLCcgSSBndWVzcywgRW5jcm93IG1lYW50IHRoYXQKdGhlIHJlc2V0
cyBwcm9wZXJ0eSB3YXMgbW92ZWQgKHJlb3JkZXJlZCwgcHV0IGludG8gYSBkaWZmZXJlbnQgJ3Bs
YWNlJykKd2l0aGluIHRoZSBmaWxlLCBub3QgdGhhdCBpdCB3YXMgc3dhcHBlZCBmb3IgYSBkaWZm
ZXJlbnQgcHJvcGVydHkuCgpFbmNvdywKCldvdWxkIHlvdSBwbGVhc2UgY29ycmVjdCB5b3VyIGNo
YW5nZWxvZyBkZXNjcmlwdGlvbgppbiB0aGUgbmV4dCB2ZXJzaW9uIHdpdGggc29tZXRoaW5nIGxp
a2UKJ1Jlb3JkZXIgdGhlIHBsYWNlbWVudCBvZiB0aGUgcmVzZXRzIHByb3BlcnR5IGluIHRoZSBk
dC1iaW5kaW5nIGZpbGUuJwoKQlIsCkd1b2RvbmcKCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5
c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
