Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B14F01832
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKtZB6UZ2RYKFYMx4EhiYYBzTZIC5WU8O0DnI0Y/DSM=; b=iRHDTrHWzVXRgy
	sPJY66QO7b8vVV9sWqf6ne3iWNb4H3hZ8TuT4MJANA5XSuvJ5KbDf071/7Bp6G0bRpZSKJmIdpvs8
	NvIHbcnNOat6QsKABVSNTyxJC0mGiArhfFrXLghehBlVccalhgUKqSsi4dkj1cwwUSeoAbVpefNUh
	9k177lwleSbR+ZpbDgaa/Fc1ayrIl/EYIlSIc2GcjUEoJSmM0ylBX3HDY9YuCBsB85AuWG79wOjRL
	7g08jYszOB6zKiyDqUJ0SG5wRovBKgoFvE6h0PWfVioZiE47Zy77GqCqh9MStmQeABUFL3cro1KLd
	Mm3r8JEPO1Odd/2NYsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVVP-00000003p26-2HOh;
	Fri, 06 Mar 2026 13:46:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVVM-00000003p1l-1k93
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 13:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0D04403D9;
	Fri,  6 Mar 2026 13:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D736C4CEF7;
	Fri,  6 Mar 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772804771;
	bh=ZH7mXSzFe4jJDQEYgn8zoZrXrIw5d6O9OOIOunJ33bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=szNE54xx8n6uEeRywKcJhj20PpeA+C9SMUaZzzyEX4XHyL4X/g79VHinV1D2errfV
	 S0dS53kfuFxbWatIv/z2ilPs7du7enHhd7Z2LMEmwXtx9fxG3YPyiZ3PrzUbAX5Phh
	 geB7JA4fYQab7J49XOjKXvCZLs28zBm0y3ijJI3SGFRUK179akYBpA1ukM8MaWHoAZ
	 b2RdyyBMI+/CZbWtgLyq57ab0n99S/57pJNRPmPLOFaPPUpVK6SQ83BjKcFuD4GlFg
	 teDdNZDKr4lHvdKUXmaC6GcDKJU+5Uq1aHa40bh4ROAg4r832Gl8ElB1MYfvxhd2xB
	 qzNSHiYUsFpVg==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add
 individual regulator supply properties
Message-Id: <177280476778.1042627.3296790673262334325.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 13:46:07 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_054612_472098_C2CC8538 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCAwNiBGZWIgMjAyNiAxMDozMjowMiArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiBB
ZGQgc3VwcGx5IHByb3BlcnRpZXMgdGhhdCBtYXRjaCB0aGUgUDEgUE1JQydzIGFjdHVhbCBoYXJk
d2FyZSB0b3BvbG9neQo+IHdoZXJlIGVhY2ggYnVjayBjb252ZXJ0ZXIgaGFzIGl0cyBvd24gVklO
IHBpbiBhbmQgTERPIGdyb3VwcyBzaGFyZQo+IGNvbW1vbiBpbnB1dCBwaW5zLiBTdXBwbHkgbmFt
ZXMgYXJlIGRlZmluZWQgYWNjb3JkaW5nIHRvIHRoZSBwaW5vdXQKPiBuYW1lcyBpbiB0aGUgUDEg
ZGF0YXNoZWV0Lgo+IAo+IFRoZSBleGlzdGluZyAidmluLXN1cHBseSIgaXMgZHJvcHBlZCBmcm9t
IHRoZSBiaW5kaW5nIGRvY3VtZW50IGFzIHRoZQo+IHVwZGF0ZWQgc3BhY2VtaXQgUDEgZHJpdmVy
IG5vIGxvbmdlciBwYXJzZXMgaXQuIE9ubHkgdGhlIHBlci1yYWlsIG5hbWVzCj4gKCJ2aW4xLXN1
cHBseSIsICJ2aW4yLXN1cHBseSIsIC4uLikgYXJlIHN1cHBvcnRlZC4KPiAKPiBbLi4uXQoKQXBw
bGllZCwgdGhhbmtzIQoKWzEvM10gZHQtYmluZGluZ3M6IG1mZDogc3BhY2VtaXQscDE6IEFkZCBp
bmRpdmlkdWFsIHJlZ3VsYXRvciBzdXBwbHkgcHJvcGVydGllcwogICAgICBjb21taXQ6IGUxM2Vi
YjRjZmNmZjQzOTlhMzRjM2E4OWM0OTMwMjA4OTlhNDMxZjcKCi0tCkxlZSBKb25lcyBb5p2O55C8
5pavXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
