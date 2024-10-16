Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90739D206A0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 07:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UolLMXOXouqM93Pyzt5EuncMnGm5bpPu/br03cRS+w0=; b=PpiGaceDv94Q3g
	SxnMnrunKDqaKwRhChr6tU6T3gP0YDQ4qZ2l/zqWGU4j3/M2Houk5mG0//2K/FH45rS3RkAIQjx3t
	qdL6r2h7jM2VGE/g3ARbR/b4q/Ha+XT6tO9cLsEZurZ3BuzgDufQplm4ls94iVAaiGp9yCwkgfDog
	nUpvx1OcM6iQsbURtGzFdS9EGETAdcMthH7ww8dR3RFcfTEXbriRSHUIe1iuPhj0yTuO8r0x0W8Ux
	zeoi21HO4CMNr1hc4Om4zI7hq9qialPMaWHf8BcIRYuYfb6NGB1hYMKQyuTgWKe1MQWwcZCu7Pu2I
	chBtz8EWmo5ABlyOQ9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y26-0000000AluB-0Ony;
	Wed, 16 Oct 2024 07:01:22 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xzp-0000000Al1t-1MPG
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 06:59:02 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a3a03399fbso34872535ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 23:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729061940; x=1729666740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgqhkQIww3EnUduiJMY68fYIYly68qVF8vVZyUZJznY=;
        b=LFch9N4uQPYM7ZVpNf83eaRiYjiiv+227fysGnlrpum219z39HbH7yk4vFAf6wyLVK
         /n4PaLNXIMrfIxPB0+xo5BT2t/c6U7YxTZ5MrjEv3aX/K0quyZhyqfkxqpParvnaYuUS
         hI5UAnwFlraOiFNaIHoFAHaGHgRE+e2cyH9wua/iiLGd5NY1ELP2Eea+j4wXRinkJpab
         NHWHJ1BM0XRb8bIKVX6nRvCDqkE72BLH/eW2ujktsNWcuadx2Q12AM2/m//dPPUl2rvo
         b1kZ81DwOuAFNKP+bzRI1YQH1OKDoJtV7JPhDfGCyDIbtQevVpBkZQYPJT1MH5wnde8f
         PCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729061940; x=1729666740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgqhkQIww3EnUduiJMY68fYIYly68qVF8vVZyUZJznY=;
        b=cttqHFEgdZGbYesaYYmfw1O1vOQmoqWarEcP6pzZ2Zyzg18liK+FhoguuRw59FPsoI
         fzRdOIUjOBK+X3+fV4Gj3kvJI7G2zn5lD8Z4pm7VPQIe9LEnWUXeXTGB1cWfXxHyj8QO
         u3ZtsjqfHJBs3wPhonAqRDLJYsjiuX0Z44jqY6bvTF3zfoJs65mU9z5bwWA6UDKjmlIq
         WND5Jv2omUnk5LH0/PnmIL4rlSuloctiNn9OeWMaHYwP4gKPuO8mb7E+xbsBQtVPM1mt
         nOIfZKJrvU9A4Pf6/zD+yx1dJI/4mEbIomQIqLs6hEAbGSoqfxWoLTiihRzLiYy8I5mG
         o1gw==
X-Forwarded-Encrypted: i=1; AJvYcCXDIQ3mqtpWrb9aMarYJfs8nwwlPF3hLEh3y/e80j+/BcCYZ/21obRfUNFmuVBIuZ8DA/FA/ppkdIXuOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyinkwyewFR57YmwLw4VmITnnzlJpBqNQQ4yLVFxC0GmwDkoeJ0
	QlX4iGyXNEy1iqOEAATcBB12J+pu4mO+VgUA95a2cjZt1T2AO7HjjqdtmYJLJxzJov43BgVongS
	/UgDMhtVyC2pm1rE1ZVS1BJUKKsI7RfLpJasn0A==
X-Google-Smtp-Source: AGHT+IErhSKXVFLT/FTSTbt5YKWJYoMqeAPP9Z85ar2ZS+Bbj8qfmYFetiQos0G6hD7PlYuMWAq/MbtzSisSbfzWG1w=
X-Received: by 2002:a05:6e02:1385:b0:3a2:7651:9864 with SMTP id
 e9e14a558f8ab-3a3bcdc6befmr119191555ab.12.1729061940262; Tue, 15 Oct 2024
 23:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728579958.git.tjeznach@rivosinc.com> <Zw4s3BHQZ6x4d79-@8bytes.org>
 <20241015085945.GC19110@willie-the-truck>
In-Reply-To: <20241015085945.GC19110@willie-the-truck>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 15 Oct 2024 23:58:48 -0700
Message-ID: <CAH2o1u5UMQHvaNNUgKQk1e97c03ntuJALUTaW7gYaCuyfY471g@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] Linux RISC-V IOMMU Support
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235901_383262_D84B7820 
X-CRM114-Status: GOOD (  16.53  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMTo1OeKAr0FNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMTA6NTA6MzZBTSArMDIw
MCwgSm9lcmcgUm9lZGVsIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMTI6NDg6
MDNQTSAtMDcwMCwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVz
IGludHJvZHVjZXMgc3VwcG9ydCBmb3IgUklTQy1WIElPTU1VIGFyY2hpdGVjdGVkCj4gPiA+IGhh
cmR3YXJlIGludG8gdGhlIExpbnV4IGtlcm5lbC4KPiA+Cj4gPiBUaGFua3MgVG9tYXN6LiBJIHBs
YW4gdG8gbWVyZ2UgdGhpcyBkcml2ZXIgaW50byB0aGUgSU9NTVUgdHJlZSBpZiBubwo+ID4gZnVy
dGhlciBvYmplY3Rpb25zIGFyZSByYWlzZWQgaW4gdGhpcyB0aHJlYWQgYnkgRnJpZGF5LgoKVGhh
bmtzIEpvZXJnLiBJJ2xsIHRyeSB0byBhZGRyZXNzIGFueSByZW1haW5pbmcgaXNzdWVzIGFzYXAu
Cgo+Cj4gU29ycnksIGJhZCB0aW1pbmcgb24gbXkgcGFydCAtLSBJIGp1c3QgbGVmdCBhIGNvdXBs
ZSBvZiBxdWVzdGlvbnMvY29tbWVudHMKPiBhZnRlciBEcmV3IHBva2VkIG1lIGF0IExQQyB0byBs
b29rIGF0IHRoaXMuCj4KPiBIb3BlZnVsbHkgd2UnbGwgZ2V0IHRob3NlIHJlc29sdmVkIGFzYXAu
Cj4KCldpbGwsIHRoYW5rIHlvdSBmb3IgeW91ciB2YWx1YWJsZSBmZWVkYmFjay4KSG9wZWZ1bGx5
IHYxMCBhZGRyZXNzZWQgdGhvc2UgY29tbWVudHMuCgpCZXN0IFJlZ2FyZHMsCi0gVG9tYXN6Cgo+
IFdpbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
