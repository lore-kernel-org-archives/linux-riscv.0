Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FB7C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 03:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IHWAx9APPaXYr/dfGTiKZ+qVVJdy6TpvmfpzKM+dQ8=; b=BD8nDb9Mr8XAH/
	/99iTCv6WSj+Rk7NB1S7gyhck7Rd/mgdUlb5/Dfv0dy90XRA7mr2UJ6tCQrOIVBTTFJ2TyK1P+mUv
	229acx2jOuuBWqyDThjnNyQnFR9BdPJ6ZOmseBVwQe3IixgOpbjiX18k+EAS8rAOArg4h4rriL5/s
	UJaU3zlK5Ea1+Uzr8bAHdrhK6kjHrzTsR/GT6plAvvKzgB+kVAvKTj0O8aKDY6jkIVKUJCAv0AuoZ
	CEbSoTr59PF1vEezNdjj/Wymc2zV4EOTLiwVO8sHDIcVlVBdBx+hLfUEvNfH86PuuwkbmMXIMjEPY
	b1LCtD7247R86yDqklXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW6bW-0000000BFaR-3w7l;
	Tue, 23 Jul 2024 03:54:22 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW6bT-0000000BFZg-1D29
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 03:54:21 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f04c29588so2190457e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 20:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721706856; x=1722311656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mfBfGvPkaBeH2hLbWeN6l9L0QxXvLWhmVsi1nmC0QY=;
        b=UOiv+qlUesNwdaRfvk6GvLUjDRQYR/GW/PHI7dS7C+5jY8pThNVyPI5MCbCew94hTC
         x4QlSFoC8/+/s6/EW6SjnXm9LJWkEyJxB8RHTtf6raFutqZ8kCaIWu4wcxYPqeTF4ynT
         3uVFMNbGtlPW8VR1p+JmOYBx1VfF+PGaT/RYrY+QiX5IniXFYyCJBPx26fAgOxmkI2l4
         uh7x/966I7yQ6hy4lG6bhWra5NRV9WeFriayQRXre/ROH2qbtvZZ38BCg68U6L4qjQyT
         I/WCyaXQD2LLnRHUesEAt3zUuiKvGd/qNmZrkKPUg08K5t3Lzt1vjMb8CUn8NjS3ZBBG
         DxPg==
X-Forwarded-Encrypted: i=1; AJvYcCVaTNs27dsHOrEirvllllFPGZg1Ja+3X/qNIWIb1Fx2M7wbgK/tnG3VvcsM3Gbq3V2MkKj/0/Imh8LNTrGqt28OZCYIaassxuOrjK7tPeXN
X-Gm-Message-State: AOJu0YyvUyE5eFJN8sbDTtpYbdIAuLJZ17MDBXX+PaOdr8U1p84O3y8c
	LzTlVyXbHj/Mmh8W5CxuvqljcAn5X8vAIKHwEhSb5+UtmaEztGp8KW2remwJ
X-Google-Smtp-Source: AGHT+IFPUJK73pfIeFC6KNRWRQzRoo2xAdbbGUsEm512UrZvCY4sFwkJljZaI7qeWVSnFJfzXYcTzA==
X-Received: by 2002:a05:6512:3d1a:b0:52e:be1f:bf7f with SMTP id 2adb3069b0e04-52efb7db70fmr5689099e87.27.1721706855493;
        Mon, 22 Jul 2024 20:54:15 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52f02255e1fsm752719e87.6.2024.07.22.20.54.15
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 20:54:15 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so61297221fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 20:54:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQCk/BjopoTFEENM42xl9UQu5LSTzDFRFbl7XtL2HeiRDKOb6fjOCJJzz2So1PKu2A92IOqpuB1OViPMMt6GtLC3/dISFcyQcPsYoPJLmh
X-Received: by 2002:a2e:bc0f:0:b0:2ef:296d:1dda with SMTP id
 38308e7fff4ca-2ef296d21bbmr48058911fa.1.1721706855131; Mon, 22 Jul 2024
 20:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com> <20240722-xtheadvector-v6-3-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-3-c9af0130fa00@rivosinc.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 23 Jul 2024 11:54:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65WLShdZLBcKBUviHMWFOM4oZmwVHWzVqCfz2rKdnoWyA@mail.gmail.com>
Message-ID: <CAGb2v65WLShdZLBcKBUviHMWFOM4oZmwVHWzVqCfz2rKdnoWyA@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_205419_360826_1F1DF8F7 
X-CRM114-Status: UNSURE (   8.71  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgNTo1OOKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gVGhlIEQxL0QxcyBTb0NzIHN1cHBvcnQgeHRoZWFk
dmVjdG9yIHNvIGl0IGNhbiBiZSBpbmNsdWRlZCBpbiB0aGUKPiBkZXZpY2V0cmVlLiBBbHNvIGlu
Y2x1ZGUgdmxlbmIgZm9yIHRoZSBjcHUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bj
c2llLm9yZz4KClBsZWFzZSB0YWtlIHRoaXMgd2l0aCBhbGwgdGhlIG90aGVyIHBhdGNoZXMuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
