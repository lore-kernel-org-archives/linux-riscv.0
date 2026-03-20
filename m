Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69C11098782
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wB9KMaGigoRXlQ9t7eZMreprkSVj+X+ku+pNMqgqUfc=; b=hdrlxZik8lKdle
	q4dLHOQZXbVnTcoMAQ1++fEauiVT1GOzFjsuGKDARty+n9Ej5vyMFyRst4fObsKda1+5lrEQa5oqt
	tf8BWgik4N4nl5kRRcde1oNO/sAsCYTqpr+lvH92ELxtE0HuBlsFTvBqkJcrO4Lo2fYjQ1lfsv6k1
	vMasSL6a3ctqj0ydIq4rm2BodE5WSJaQPOEw8+xZ9OfmLDFrYGY4HKZU5AMKcUl9rECQF0kDtcSP0
	YnByEciOXbWYF0cA9ebyOLdlK9rXALcPYzta+/3EJ9km9CG4rYT9tbB4zIXXWp/hXk1UkCkdGfcaQ
	ZT2mRcyOlC3mpGzFqZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZVC-0000000Cp16-2NhS;
	Fri, 20 Mar 2026 13:02:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZVA-0000000Cp0e-0yB0
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 13:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34E4D440DA
	for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 13:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D84C4CEF7
	for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774011775;
	bh=IWqyvQsFg1lanV8I+iC3MCVSR1nEdS0/5qOrIjLXX6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VL0aslaxQ8j3cGzm6v587Ak7/wEae2dSN98h7/sfhKSS547YqRZVV+1SmgsYMsrG4
	 43/RZXRgdtDgtBFMVwuOuLy5TNzOpWK4W4ltcK4a87Nfhral5hy8RRp6IjxrcRJQRx
	 syv6+TF3SkBjsyl/A90pIntDHfvkaphHwF+q2mPHDiunIBCcrtDVMzzUG8slQWLLFV
	 r/UxZyyJMczMowlcJWQ3qpezbC84QtNepMpHl79/vkVF5EE0er2Q56HK5c+Nzje1EA
	 7fcrAPbxdS2ye2MwiN57EIL8iMeOmaImgafEo22VE/jhqvWLqCLCY9nSMvEEAD+CJE
	 KKsPTh8MHgZiA==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-67bad873c3eso1083752eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 06:02:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEPx+U4NuFAmdWQ5AypcjWHp49asRZYWMln7Xjd67XUk2ufszIfl/s2X3Oz5rPIiyIoJtnfILjJtbfCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YytTI4jcJBEStgZqyzmAeuxlxK+hUwoub6rJxjobhzx6utR/SId
	f1NZXNyXcOBmbSXr3pyVAAu4f29lF56B/akLWStx3PuoBa4+aNxINbNsmYMIvIxmDCH24l1AfhF
	cjyOuC3vkq5cBBxmp+O3ODUQ5WNspFoc=
X-Received: by 2002:a05:6820:3081:b0:679:a58b:bf69 with SMTP id
 006d021491bc7-67c22bbc299mr2080548eaf.3.1774011774349; Fri, 20 Mar 2026
 06:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gift-nearest-fd3ef3e4819b@spud> <20260318-whisking-steadily-91b2497f6fb9@spud>
In-Reply-To: <20260318-whisking-steadily-91b2497f6fb9@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:02:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLnx_UKGqhyMK+TcYX=8UOGW-MtDYMm5FRFfh_iVkZTBFw@mail.gmail.com>
X-Gm-Features: AaiRm502-KuR4fUsvKOvd9AOtxbBgChisi7o25yu1nhHfdwnEmoVld1OFC1l9-M
Message-ID: <CAD++jLnx_UKGqhyMK+TcYX=8UOGW-MtDYMm5FRFfh_iVkZTBFw@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_060256_288381_829421D2 
X-CRM114-Status: UNSURE (   9.50  )
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

T24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgMTI6MDTigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gT24gUG9sYXJGaXJlIFNvQyB0aGVyZSBhcmUgbW9yZSBHUElPIGludGVy
cnVwdHMgdGhhbiB0aGVyZSBhcmUgaW50ZXJydXB0Cj4gbGluZXMgYXZhaWxhYmxlIG9uIHRoZSBQ
TElDLCBhbmQgYSBydW50aW1lIGNvbmZpZ3VyYWJsZSBtdXggaXMgdXNlZCB0bwo+IGRlY2lkZSB3
aGljaCBpbnRlcnJ1cHRzIGFyZSBhc3NpZ25lZCBkaXJlY3QgY29ubmVjdGlvbnMgdG8gdGhlIFBM
SUMgJgo+IHdoaWNoIGFyZSByZWxlZ2F0ZWQgdG8gc2hhcmluZyBhIGxpbmUuCj4KPiBSZXZpZXdl
ZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClJvYiBleHBs
YWluZWQgdG8gbWUgaG93IHRoaXMgd29ya3Mgc28gbG9va3MgZ29vZCB0byBtZSEKUmV2aWV3ZWQt
Ynk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
