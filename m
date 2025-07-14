Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08540C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 06:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+CtJPHEgqZjm+2GP3xD3A3LQsESNXOzWaLr81N93MVw=; b=x8rINnKg8QRAKZ
	72vn0zmKdI0jBY3f88cu3oj5KTInK4bDM6alvqv76B5A7rye01eyhuzGdX/XjBq+fImdPqM3I7Iv0
	ji/1IxvWNiKv5Lgl9teHmHJIheQ+sD/flBEvY3LJL5c6V3fa1yQe8DtwdImAaRqaetRGLIswRT/yR
	GNcfpz9RWItLa7uiNcblbIzfajsZ6s/9ctB9fSVQuQPcD035C4MQpPKF7M89q5U6gCgKBotTIltXX
	rT03IO71WbsbI2skxEUH7Y5idoQkktPTIJfhJb5MK8Rbd53/R1wmzWgMrTE20zXdVOSs4DMUiHwhm
	me2Jl0g6Yu68lixUs2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCdr-00000001LLi-2wt5;
	Mon, 14 Jul 2025 06:26:23 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCOv-00000001IK8-0Wql
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 06:10:58 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-607142010bcso2816639a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Jul 2025 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473455; x=1753078255; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9Tn70FKTpBDzek73ufnJv469R3NOa6ous5bCCu5m1U=;
        b=hbCyld93qMKEl/u59LJA3r7aA5KskgJnhhtm3VwREvmR7qGI5aSPhvMaCdk+pQbWrS
         9lHrdqsS9ChZZS9rtAYnccmnxO0Yu69Vxp8fBfXhvw0KSUV+LLap7l65UToUJpE6oOwL
         VfIVmubCbL8fRGWD4i6z2xME6GwM6fQExdif2amD6232mWmDyuaRw8TwsEMuqLztGK3m
         8O2rlt1JJP4fDsRZgwYuIj2202mqAhUEFqXcQ7J/BS58jyHlwKNA8ChDR3lGzVvf1FSr
         MRBig/7FOdt373OpRi/aJmyMsJ3FfpMkZ3/sSHdrXvzP0cXueMNeNVD1BY2dwlWaskUI
         h29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473455; x=1753078255;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9Tn70FKTpBDzek73ufnJv469R3NOa6ous5bCCu5m1U=;
        b=hcszC6wHns+cRytT8FMY/cXNW47vF1dB5jz3PXTMYyUIk+OKtG2EmpCzSX/XxDUo68
         Bz7C3ce562y9yAcFoNTjx7clc/uD1s0I5EW6LBtYiytZ6GjGV3RG5gCkEJRsDV03pc4g
         hLKU8cXb5OOqf+oDcJtWfd3W/nqPwwo1/SiT0ajr7x8z5OnlK7alqHmv8ho3ocGNsu2v
         HdVS5CCemXRwogcvdnmXTMwzsBEWvPXoSEfpY5jZVnnvyZgl6YRzybRSyF8YexF5C663
         Qusf93JyCxDSjnJMJxChyOLGF7U+HHUnyUuZ6G1J6n2lV5WkiE4TgCHoNJs7Rp8e6s7o
         rWmw==
X-Forwarded-Encrypted: i=1; AJvYcCWFkEtjTUulhtUkqurQ5+6w9P0Z34QJhlzhql9T94F3c4nvM+mjv2eWG+WdP3OdPZAiyNHbRLtnNatv1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu+eSu3kkgr42889zYnFPQykCyl1pSvV8suw4v+fmEazah17Oy
	DdYLzF0w2oeO19vfacNzvoblISC8F0B7Ez6nOWbn9Xlh5sWn1MzsYTGntpp0fhcerawZMBEoNg=
	=
X-Google-Smtp-Source: AGHT+IHnMYU1tdLUgCWCMkDHtV2ofJo8Kj1jhtO5SeCzNxOoPrZb9dQJqddWyqsdiNjGgTivJJ6PBrvn
X-Received: from edbec48.prod.google.com ([2002:a05:6402:d70:b0:612:b2a:492f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2551:b0:60c:6c85:48dd
 with SMTP id 4fb4d7f45d1cf-611e84d5ce0mr9692143a12.23.1752473454949; Sun, 13
 Jul 2025 23:10:54 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:44 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=ardb@kernel.org;
 h=from:subject; bh=lBZw99MDLRGQYnmUAEaW8S2w5GuCP7F3IekTWgHFi6g=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3vvT+9Y9uuM3TXFJnJtsxIyzqcz/eR/PsPqzeEKNP
 R/foYsSHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiJ5gZGS5KK9wuT5s0Q+Ja
 CftM/4wbF554nvlzf3ftBpG1fNZ/k0QY/nDa+K/0XKev99bz53mu6oadcpenx9Ud4TpWE21YcXy aJQ8A
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-5-ardb+git@google.com>
Subject: [RFC PATCH 0/3] Remove unused EFI runtime APIs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_231057_190385_C71EA1D2 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: Juergen Gross <jgross@suse.com>, linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-efi@vger.kernel.org, x86@kernel.org, Bibo Mao <maobibo@loongson.cn>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, xen-devel@lists.xenproject.org, Feng Tang <feng.tang@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ard Biesheuvel <ardb@kernel.org>

Using EFI runtime services to program the RTC to wake up the system is
supported in theory, but rarely works in practice. Fortunately, this
functionality is rarely [if ever] used to begin with so we can just drop
it. (Note that the EFI rtc driver is not used by x86, which programs the
CMOS rtc directly)

The same applies to GetNextHighMonoCount(), which, if implemented,
usually relies on SetVariable() under the hood *, which is often not
supported at runtime by non-x86 platforms. But it has no known users
either so let's drop support for it as well.

This means we need to drop the slightly pointless tests for it too.

* EDK2 based EFI implementations usually have a MTC variable carrying
  the monotonic counter variable, which is therefore not truly
  monotonic, given that SetVariable() will happily overwrite it. 

Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> 
Cc: Sunil V L <sunilvl@ventanamicro.com>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: linux-rtc@vger.kernel.org
Cc: linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: x86@kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: loongarch@lists.linux.dev

Ard Biesheuvel (3):
  efi-rtc: Remove wakeup functionality
  efi/test: Don't bother pseudo-testing unused EFI services
  efi: Remove support for pointless, unused EFI services

 arch/x86/platform/efi/efi_64.c          |  22 ----
 drivers/firmware/efi/runtime-wrappers.c |  68 ------------
 drivers/firmware/efi/test/efi_test.c    | 108 +-------------------
 drivers/rtc/rtc-efi.c                   |  76 +-------------
 drivers/xen/efi.c                       |  56 ----------
 include/linux/efi.h                     |   6 --
 6 files changed, 4 insertions(+), 332 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
