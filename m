Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DCEC282D0
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8Y+UjiSl/Z1nF3x5AkYXpy71sGrt2yvtYIjEbX4YKQ=; b=Gr25XZaHOSurzT
	EbpI0t69Uqp22Cu+X7L/iyOt3ioRjjgcHm0yo4MdnAyQ0gCTCRs79Qmm+GUUKqlJGrwzk5cSyuJv6
	qh+zbWhK8hXOAo8wgmniLZCkpsQElxfgoahBwA+BS7w9NdjEPmycNwi/zfNLllqqVZ3IKR8NQ6hT+
	8YB56c7+S2c8bKshkf5NT2Xmv0OBPJTHc/gKtGBSlZbFvkoI7iQ16DsIVL/HlWpBLsEitG/aQVG6W
	jLCVm6Gj9flyOhLZ8gpJS1iavEEfKEqBnAmP1UcdDNIy7Oi0Sf3m+8uJg53wr3aWBMQWDCAFOEP8q
	gIP4Uwv/3zIMBD0lRw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNAu-00000003XYI-2XXw;
	Tue, 04 Mar 2025 07:58:48 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMsv-00000003TGL-3wzR
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:40:15 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-307bc125e2eso59692031fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 23:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741074012; x=1741678812; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYa7EfywJTw6o3MYMu3IjFEnE/ok1aP+gt2n/HM5KmA=;
        b=PInS41xZb1nFlEq697kXcfy1hYH+bstEwQI3bPJrf0+YmvrlYppoa3LI++enSbyaIZ
         G2I9EkQIoVN3PyQYVwNFSXj8cBYu0XuccNeABOTh0Z58JU0SQT+H2GES8aNXhZ3INVi5
         L2sv11Gwq5COHJ0Ci1nALkV4M7dw05YsHQG/pIPPaxX7EgGPKsEBJxWGY1CL10fqq4tq
         otf1jKDAU4FBSkXdc5bpU3Q8/d4hHAI9DFE4s7RHrfau6J1xAiuH9AOjQ3eSkXAgnDTK
         JG58p090+zqm9GEzXuYPOeOG8BVPY+WYlkI2C/rWzpSF2QjiHg0d83kt77jgQ4/WNdOm
         wZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074012; x=1741678812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYa7EfywJTw6o3MYMu3IjFEnE/ok1aP+gt2n/HM5KmA=;
        b=gJ9btcI+xaQ8DSDwak9y1lGTD/Qh2TtsHkoUPzDcXqB32bjxUsZJP+vyFXwwRM2sBc
         hg/5Q7yVCanrSxBklsvU6Sv9y5UM4dj08H4YUa7Q7N3bkORmJg4YqJjEajNU+3hADpUx
         M52GyKKC2XFP9IchPegdvQBBVM09HludnzzT9MAj/F23UkAG2qRHo1t322D9o0Pzs4vg
         HYZykyPchTTJfznGnL4Kov2isUBAGMqwgJtiZwonfFjD7oPl4TVhs7vC3CLBPQMeRf+c
         GUNpIWz8sUYQz3hS0z/H51GcDSIe5OnuT+pvwqVwyTlB7oJ+qyMyXciWdr91CKCZ5JRc
         6OLw==
X-Forwarded-Encrypted: i=1; AJvYcCWCoefngPUxj5GYsz7qzaChPmwsNJBVp8OwlxRoiS+UYysDc96XfEk55zc92vfofip/sy9yJwsgxvSPXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0MeanqTp0kvB2nEIc/gOhbAq0FpHTOXD2ifaXYw2iIbm5fJ+l
	fmWVJMLCSgNhI1ZcedQsVqp6jWw825BZEuhMhFcoKWM6pe2m4/XEAov36Cp9tpQ26fHQrtf9JlH
	ND9aXYcHxzeZXrow1BYleziXj5B2NLK5LVT20gw==
X-Gm-Gg: ASbGncu76cdnte2pfJXu7n9rgibwPPVphdwHK2HVs57ik8xUYgxc6rF9vIUoAYwYXD9
	bsPH7iAX/3MZPPhczCgsdnpRC9iHjnNl1IU/tPqrzhg/LXDa9iOJFt9cgPrWkGAK5gMo012DpZo
	am6R4nyeUqfv9s7YartJ/Mum2CtA==
X-Google-Smtp-Source: AGHT+IHXJH8RsSh9MugAj23AQppoEi7+HBO8uvCiCpR+EoTX8kmz1M4QPFhcf3U1tuxSzojD8Ca99DcRZmVr3olmu1M=
X-Received: by 2002:a2e:a716:0:b0:309:2267:32d0 with SMTP id
 38308e7fff4ca-30b932443e5mr44153791fa.21.1741074012067; Mon, 03 Mar 2025
 23:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org> <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:40:01 +0100
X-Gm-Features: AQ5f1JpaPsAGaJQpCY5h6TnkBJvDhbXUxtDbGepWe3FtwHACW1AT0pWNBP_lsZY
Message-ID: <CACRpkday=ZgxovKB03PCweh_rGzaJjSJ3ezC_UzPacQPPNJ6KA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_234013_988850_92D113AB 
X-CRM114-Status: GOOD (  10.10  )
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

T24gU3VuLCBNYXIgMiwgMjAyNSBhdCAxMjoxNuKAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gZ3BpbyBpcnEgd2hpY2ggdXNpbmcgdGhyZWUtY2VsbCBzY2hlbWUgc2hv
dWxkIGFsd2F5cyBjYWxsCj4gaW5zdGFuY2VfbWF0Y2goKSBmdW5jdGlvbiB0byBmaW5kIHRoZSBj
b3JyZWN0IGlycWRvbWFpbi4KPgo+IFRoZSBzZWxlY3QoKSBmdW5jdGlvbiB3aWxsIGJlIGNhbGxl
ZCB3aXRoICFET01BSU5fQlVTX0FOWSwKPiBzbyBmb3Igc3BlY2lmaWMgZ3BpbyBpcnEgZHJpdmVy
LCBpdCBuZWVkIHRvIHNldCBidXMgdG9rZW4KPiBleHBsaWNpdGx5LCBzb21ldGhpbmcgbGlrZToK
PiAgIGlycV9kb21haW5fdXBkYXRlX2J1c190b2tlbihnaXJxLT5kb21haW4sIERPTUFJTl9CVVNf
V0lSRUQpOwo+Cj4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+CgpJ
IHJlYWQgdXAgb24gdGhlIGJ1cyB0b2tlbiBjb2RlIGFuZCBpdCBzZWVtcyB0byBkbyB0aGUgcmln
aHQgdGhpbmchClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
