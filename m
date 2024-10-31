Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4639EE68956
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 05:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejscrv7NtDD7lMCZf003FeaMJMJDPb4JqC13u9GcTxo=; b=xu+vahbjTBOJG9
	FUu4hDKq3qk7h5udhm5w2VhXd+tjv2IHrvbp7/e06KSUj1o70OMAkS+sh0w1+FbjCEnzL43Vqed/0
	EQEl3mhwIgI9XU3jXVhCCCM0mgyibT3mTu1AmDFA/NEWDq/oPuOYTmhLQBbLYgw0r9PrKKPB8hnfA
	+QFjg+i1eT7bglnek6ol4/RrNZwvbMZOaviI55OG2RvRGps4emurTri5QJl3gtRjJCxri1klWof5V
	ZFlfO4IWBqVj+Hy5dTVY3CHhlyr3C3NT7XR342Hodi08laPj0IqlyITaDxrek2Te974Yk6wLGaGmg
	esuvPqLqoUcO8LHGpAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6O0Q-00000002csK-14Wo;
	Thu, 31 Oct 2024 05:46:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6O0O-00000002crg-0Ptk
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 05:46:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso429419a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 22:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730353559; x=1730958359; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x9b2UEQxs0odyhfy9TOY1tUz8U+i9PmL23XX2DMzkGI=;
        b=Yz8m1zzk6qUma/q8L5/n/qHY4bh16DtnrXsfo+g9MOOFC6uG2+nyFXsKcIcFPOMwvl
         H/TxqUaLFxOHOe1+rR+na6/7/V2EApPJ/7Ynq4RTYTxiN31va6bOnBAsGgEYL4RmH1kc
         22a4kX9mGNnGitawLEe4rOgzxwncenaU/ZCTzkf43skgTtK/tG3vBbe6nS0YFt2YRwp9
         1HfqOWl1yEnAEDRIWeb+0/q3KU5LSKVnKBylJYcJUsSiQ6Z2oWDBn+a7sQjriYBQzpxJ
         mAPEpU/dMdcXIsTSiK6PGuQ3HMhyQBkhiMqcYJeP9HvmZLh5ASj05aOhJx6NKh9ETtlm
         iGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730353559; x=1730958359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9b2UEQxs0odyhfy9TOY1tUz8U+i9PmL23XX2DMzkGI=;
        b=mbozsV+UoSLWbMA6k7qHo9KezyxiWvh1iQCX590XOeJsJ2RMYFcgFfsp6RqcZmLANd
         BJk9+iGQP5/W9YoLXnHRy1A3f3anvSBOCG8BbiqJjHV8Z4GXriUMYn+9Xy2scjrX5V+v
         b8BZDPn/ELkZD8v/pJwoSMH/ADeWaLGQ/1WAFq+46/plhy21sVaOxVQeWLWH44AKAXAc
         CNxVcytBR4W/uqTo3dPArCW12MTcfBhVrqTcaM+W4aGI83rcmzWCq3RL/r0R0KJyDREV
         9k2yjvK2om1kJrSVkZ2RrmZ+/Qd1mwuGHSA5JBPZmo/ACvp8UAYyVV+zDfmcZR1vuBK7
         IYIA==
X-Forwarded-Encrypted: i=1; AJvYcCUsyO+eS8e1c67gYUVCqymj28rAFsO+1N82E9ew2QkXvdsqHQaL3C5gJgVKxwvX6BZJyo0rMqz6SnYo1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhKHOU1Jd1ysa291xgC0pAxXSuufVEtNubWMtcxlh8Z0yKnU2c
	h30/f8RIXP1pelZb2eIVkSXF5Rip/ostfJfaKA8FteJUgz7py/Xi
X-Google-Smtp-Source: AGHT+IEowWgm7vFzjvUbXcogbmidT9I+NuH0UhkIydSz86yZ+2NbVSVDMLuTxioICPD//NAuV5bhHA==
X-Received: by 2002:a17:90a:fa8e:b0:2c9:df1c:4a58 with SMTP id 98e67ed59e1d1-2e8f1087e8bmr21635954a91.23.1730353558912;
        Wed, 30 Oct 2024 22:45:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ea24sm2839654a91.6.2024.10.30.22.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 22:45:57 -0700 (PDT)
Date: Thu, 31 Oct 2024 13:45:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Yangyu Chen <cyy@cyyself.name>, 
	Hal Feng <hal.feng@starfivetech.com>, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
Message-ID: <t77tpj3zmabezppo4f2znseauml7w22zdddotdoenmhalm2yaq@vxkjqkleut6w>
References: <20241022040218.450573-1-inochiama@gmail.com>
 <20241022040218.450573-3-inochiama@gmail.com>
 <87jzdr2vyg.ffs@tglx>
 <CAAhSdy3Rmhhv5uzOzCT_B3EzQiXgV1FejZQbc5sLpwwFOXd5cg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3Rmhhv5uzOzCT_B3EzQiXgV1FejZQbc5sLpwwFOXd5cg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_224600_166657_AAB3E9A8 
X-CRM114-Status: GOOD (  21.58  )
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

T24gVGh1LCBPY3QgMzEsIDIwMjQgYXQgMTA6Mzc6MTBBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBIaSBUaG9tYXMsCj4gCj4gT24gVHVlLCBPY3QgMjksIDIwMjQgYXQgMToxNuKAr1BNIFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUs
IE9jdCAyMiAyMDI0IGF0IDEyOjAyLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gPiBBZGQgYSBk
cml2ZXIgZm9yIHRoZSBULUhFQUQgQzkwMCBBQ0xJTlQgU1NXSSBkZXZpY2UsIHdoaWNoIGlzIGFu
Cj4gPiA+IGVuaGFuY2VkIGltcGxlbWVudGF0aW9uIG9mIHRoZSBSSVNDLVYgQUNMSU5UIFNTV0kg
c3BlY2lmaWNhdGlvbi4KPiA+ID4gVGhpcyBkZXZpY2UgYWxsb3dzIHRoZSBzeXN0ZW0gdG8gc2Vu
ZCBpcGkgdmlhIGZhc3QgZGV2aWNlIGludGVyZmFjZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiA+Cj4gPiBDYW4gc29tZW9u
ZSBmcm9tIHRoZSBSSVNDViBmb2xrcyBwbGVhc2UgY29uZmlybSB0aGF0IHRodGlzIGlzIGdvb2Qg
dG8KPiA+IGdvPwo+IAo+IFRoZSBULUhFQUQgQzkwMCBBQ0xJTlQgU1NXSSBpcyBub3QgY29tcGxp
YW50IHRvIGFueSBSSVNDLVYgc3BlY2lmaWNhdGlvbgo+IHNvIGF0IHRoaXMgcG9pbnQgaXQgaXMg
YSBULUhFQUQgc3BlY2lmaWMgZGV2aWNlLiBUaGUgUklTQy1WIEFDTElOVCBTU1dJCj4gc3BlY2lm
aWNhdGlvbiBjaXRlZCBieSB0aGlzIGRyaXZlciB3YXMgbmV2ZXIgcmF0aWZpZWQgYnkgUklTQy1W
IGludGVybmF0aW9uYWwKPiBpbi1mYXZvciBvZiB0aGUgcmF0aWZpZWQgUklTQy1WIEFJQSBzcGVj
aWZpY2F0aW9uIHdoaWNoIGhhcyBhIG11Y2ggY2xlYW5lcgo+IHdheSBvZiBkb2luZyBJUEkgKGFz
IHNvZnR3YXJlIGluamVjdGVkIE1TSXMpIGltcGxlbWVudGVkIGJ5IHRoZSBJTVNJQwo+IGRyaXZl
ciBhbmQgdGhpcyBhbHNvIHN1cHBvcnRzIElQSSB2aXJ0dWFsaXphdGlvbi4KPiAKPiBTaW5jZSB0
aGlzIGlzIGEgVC1IRUFEIHNwZWNpZmljIGltcGxlbWVudGF0aW9uLCB0aGUgZGVzY3JpcHRpb24g
aW4gYWxsCj4gcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyBzaG91bGQgYmUgdXBkYXRlZCB0byByZXBs
YWNlIHJlZmVyZW5jZXMgb2YgdGhlCj4gUklTQy1WIEFDTElOVCBTU1dJIHNwZWNpZmljYXRpb24g
d2l0aCBwdWJsaWNseSBhdmFpbGFibGUgVC1IRUFECj4gZG9jdW1lbnRhdGlvbi4gT25jZSwgdGhp
cyBpcyBkb25lLCBJIHRoaW5rIHRoaXMgc2VyaWVzIGNhbiBnbyBhaGVhZC4KPiAKPiBSZWdhcmRz
LAo+IEFudXAKClRoYW5rcyBmb3IgeW91ciBraW5kbHkgZXhwbGFuYXRpb24uIEkgd2lsbCB1cGRh
dGUgYWxsIHRoZSBkZXNjcmlwdGlvbgphYm91dCB0aGVzZSBwYXRjaC4KClJlZ2FyZHMsCklub2No
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
