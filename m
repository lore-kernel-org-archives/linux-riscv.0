Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD3CCD98C7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpocBj03Yebh7nj4sSDo4RYxhcqJrALGP90WK32fsqk=; b=JwRNsqeMgth2LJ
	67ulb/mK3QjVCyWBOGtttAIz+Mt2zijokh2HAH0DZ8jOo8+QDQLB25B86Nvrif/Wj967rI5FuUwi8
	3tc9v3jQ2kHJWKDpLhTv9hbDhKuXle752R0eZwUqi+O67+gIjH+xVgp84tDl3VLPspsW510/KK1dR
	zJhvSswrqyAukMq1cxPPeyRLT3ZCwdUAc4TVE1IznfD5xyyydBM41nS3d+JRWS8bTxxdSQ4lP2HsO
	/ozGL/LSAQhDWY92tV0MH6/mjwZPg7dTfESg+eyGYa3qxCaoGFAvIHALXHPmbr/9w2WFeb74NjQPW
	QSqNnANPTVMfh2lGlJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaUt-00000008y48-11ZZ;
	Thu, 11 Jun 2026 08:10:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaUr-00000008y3r-3jpC
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 08:10:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DA3B600AB
	for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 08:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028821F0089D
	for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165441;
	bh=OzBpfItUtOEf2eFxypCcg42sLsvDwHVRXaXNAUgljuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IrPw2PjP148jPkuwz3x3oZ6SckKxyWJbygS1e0W5g4TFZ2iiiMGkP8h8FeQHBf3ry
	 O5jeyJUS6CezdLpCFf7uLAU8csM3AJhyxq4+CKXoXYS1b4GrIpUgk2NktZdJDxbZkT
	 0LU7wIOrIM3ZlVcy8qwo0aUuQ+YXtbdCQ/uWsg9uycvl8w8UzuKnKYFa4S9RYNfEs+
	 ZS0cCl8jJgQf/1/YHcgnmaWGBVsVxsP07nEh30oaSCKO56BxPm2VVNJjLb93+8XHZk
	 i0IhiKD/O5Gtu8kIFN+c81eGAO5F5f91qqejatPRljLVp0jml7Pra3OzKMwzcPuAK7
	 hKtn+txKs5Muw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa68cfc182so7025151e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 01:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ938UFkij0z4q/jHVBNIo4rZghPWzwgZbomFbLglN/V63dUT2ZoOZOcsZLJPF+oOIm1NoFiRDXlvi9UKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoMg4w4JjIhD9B0pB+aJeYrZCD4IGIDIdC9/42phmpL0qDwvUc
	UglQuWVfbB18jpd7ceQcacDFKHB6XglRjCdxjfBf+IVzcA7uf1hHO3g72GSKnLa1fHP5DEZjDOp
	95ut/LTwjJ6RhHNG4EPQoyBnzPxEermA=
X-Received: by 2002:a05:6512:1243:b0:5aa:7653:49b3 with SMTP id
 2adb3069b0e04-5ad27fb3734mr609184e87.32.1781165439670; Thu, 11 Jun 2026
 01:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-3-changhuang.liang@starfivetech.com> <20260603-sinless-mooing-48a37d3d05ea@spud>
In-Reply-To: <20260603-sinless-mooing-48a37d3d05ea@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 10:10:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBeDkFAXLMDvEA8LjbBNJCz_ycYNPnDxs26qLTqDhXTQ@mail.gmail.com>
X-Gm-Features: AVVi8CdyDNSFfJSkRGe4nWHY6bfkMBmY29TaiK6kirTSTVWDFpGWXq8lEWJvp8o
Message-ID: <CAD++jLkBeDkFAXLMDvEA8LjbBNJCz_ycYNPnDxs26qLTqDhXTQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/21] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
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

T24gV2VkLCBKdW4gMywgMjAyNiBhdCA1OjE44oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gPiAgICAgICBQSU5fQ09ORklHX0lOUFVUX0RFQk9VTkNFLAo+ID4g
KyAgICAgUElOX0NPTkZJR19JTlBVVF9ERUJPVU5DRV9OUywKPiA+ICAgICAgIFBJTl9DT05GSUdf
SU5QVVRfRU5BQkxFLAo+ID4gICAgICAgUElOX0NPTkZJR19JTlBVVF9TQ0hNSVRULAo+ID4gICAg
ICAgUElOX0NPTkZJR19JTlBVVF9TQ0hNSVRUX0VOQUJMRSwKPgo+IFNob3VsZCB0aGlzIGdyb3cg
YSBtdXR1YWwgZXhjbHVzaW9uIGNoZWNrIGluIHBhcnNlX2Z3X2NmZygpPwo+IFBhcnQgb2YgbWUg
c2F5cyB5ZXMgZm9yIGNvbnNpc3RlbmN5LCBidXQgYWxzbyBhcyB0aGlzIGlzIGEgbmV3IHByb3Bl
cnR5Cj4gdGhhdCdzIGdvaW5nIHRvIGhhdmUgaGFkIGV4Y2x1c2lvbiBpbiB0aGUgYmluZGluZyBm
cm9tIHRoZSBzdGFydCBwYXJ0IG9mCj4gbWUgc2F5cyB0aGF0IGl0IGlzIHVubmVjZXNzYXJ5IHRv
IGFkZCB0aGF0LgoKR2l2ZW4gdGhhdCBpdCBhbHJlYWR5IGhhcyBhIG11dHVhbCBleGNsdXNpdml0
eSB3aGVyZSBpdCBtYXR0ZXJzCm1vc3QgKGluIHRoZSBiaW5kaW5ncykgSSBmZWVsIGl0J3MgdW5u
ZWNlc3NhcnkuIFRoZSBvbmx5IGJlbmVmaWNpYWxzCndvdWxkIGJlIG91dC1vZi10cmVlIHVzZXJz
IGFuZCBJIGFjdGl2ZWx5IGRvbid0IGNhcmUgYWJvdXQgdGhlc2UKcGVvcGxlLgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
