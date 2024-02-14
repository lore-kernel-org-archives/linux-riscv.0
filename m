Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9842CC48BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V/5s+nqfFiha1meVOP0WYykfHMsI3mPkfs0KuMrqsEg=; b=F3/Efzu8kPy/fJ
	eqKWIQBBMNxwO0BpMRkVMwr1LwKr+Xww02rBWhHKwZP62pIahwHcKQNlmjxlZBqeB4krlTdi+vBcF
	EA/oveAWiMZQ+EzlWxYVpV078G/MMJdBQYgH2BEGPAqEY2x2i2jgyHt6Ow8HAP313XFCILDkSg5XR
	n88snXzDLmEs0f16Pv7DEAvWfJtUmSZOcpEfn0V1ZsKJ+uUvtVklKwDiT3Nuksl0LEQ6MI4rEzLBN
	rD8qAswzY4Kx4zNq2P16byTrFi6hKkZYvC/EIXxK3G/ZaHfDQKcSxNFbiaTLKZCO9jK+x00uucDIs
	lPfNvY+5h8vXpZkBbJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHIo-0000000DLVU-3WGw;
	Wed, 14 Feb 2024 15:36:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHIm-0000000DLV7-0vpo
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 15:36:01 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e0a4823881so2479756b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 07:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707924959; x=1708529759; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=rsMZabPqQdOyGUzvRmcq12qy26eK1NK8IC3lX9TP0EM=;
        b=p7lfrh6ML5APbzTsHWhFcST3cS6KRuKixK/Lxe0i09CyCsoakVJKcaj4zlUZ/m6AnH
         neJmWQYASXEMsrwUKjSLlamm3YU5ECRz4WZFlWap8bWvbAs8X7626bfAoxI15ZoWri0J
         yLul5WI6s6xrTfAppwtM6ii6y13g1zsXPFjrJ49SdiUuHqRvOFqlnS4BaqWdWGYYikzv
         yzt3b+yM1HUXUpJxElMKM5YCyvJReaCzA+0nyI3nBINHz+UB2vQ5txGw2iD7P2A4Kenr
         gHmW2K9QYUuhPGGww0bG0cP9Rf0tSK+m7l8AUdBHSS992oGZPkTvAMvtYsYqacJvX8uL
         KkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707924959; x=1708529759;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsMZabPqQdOyGUzvRmcq12qy26eK1NK8IC3lX9TP0EM=;
        b=XEty3eoSnh/V4LdkiW9UHA/bKYEtHonMCBWAWawfzoyUxV7rjtlBCw/aZ4MJIQcq4V
         Gp0aBNAxAqkmIAhM/QdqY5LkVjKL4eREx+zxuATPBxMu3tHmEfyPDrFAd5HfUxIzmn1c
         GcTLLW6ukxpm7e5gEiBYGjHQBuCMPbPQ/PP5JvbDGp2MnfIo6c0y3fVRUAXcZiNXjKJg
         HFo5wFoCe3BFSA/xfjbIJdgOFuDrclg0V3I85G72BqFI/U0ceE3Dk3US9Cm3o4ykSuk2
         8v6/TAmXE31ee/PNL839SJVypIgDoFgIsvQnx2CRBKflwDpLCYN9tPjt6NN+0j5xUbQf
         nlRw==
X-Gm-Message-State: AOJu0YzZKTwnLxscZWQHhukAZZu7lPZ03iDnl3yMDaueJLzwi8MOb6dV
	6yh6KDh2uIf7qaV7jlnZ6773dyUmJsWtshuZqj8jE93IJ5W0DyA+4jEb8VYba7I=
X-Google-Smtp-Source: AGHT+IGCj5QYYGRsrk8Q2pygd+6XJjwy1KOMVBJGfPsVyi6BD67Qztrw9Lzw2Qr0q8IX8o3HWd0//A==
X-Received: by 2002:aa7:8b8e:0:b0:6e0:5281:e0d1 with SMTP id r14-20020aa78b8e000000b006e05281e0d1mr2385582pfd.1.1707924958554;
        Wed, 14 Feb 2024 07:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVi2q1qLmAsiIATfz24ig+iFdorSpWUIiVssALGUs9LyD/SA8Svg+RLskFF9Q3UBkfSIXUaqNAHSMROGt6rGhEjBIg8i400pd+JHT7D7ZPZig5ML1gXfZtiDwZSLuOr2IkB5OzqIQu5QHPMiC38TLbMz70t7m9sw126jWAF0Pi8QHsfIZT0cwIeMyzRoPB2O2IuROzwxS/cNdZ4lsd+3Snpc4Q2rdGzDCIMbRaCrt/hh6J393hnZIhkBWLUHHl8xpwy/bHH5iorENgQzCDaVoJKIAmtPkCrSkGDdd2JoKia20r/7sCfPQDtw3KMONjAkn80c8+y8aeq+1rCcVgx+jld/U14DkTxaAae39nF
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id h28-20020a056a00001c00b006dbe4452741sm9508749pfk.72.2024.02.14.07.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 07:35:57 -0800 (PST)
Subject: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by default
Date: Wed, 14 Feb 2024 07:34:30 -0800
Message-ID: <20240214153429.16484-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, ajones@ventanamicro.com,
  apatel@ventanamicro.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
  linux-serial@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_073600_483953_95AA7100 
X-CRM114-Status: GOOD (  13.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmer@rivosinc.com>

The new SBI console has the same problem as the old one: there's only
one shared backing hardware and no synchronization, so the two drivers
end up stepping on each other.  This was the same issue the old SBI-0.1
console drivers had, but that was disabled by default when SBI-0.1 was.

So just mark the new driver as nonportable.

Reported-by: Emil Renner Berthing <kernel@esmil.dk>
Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/tty/hvc/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 6e05c5c7bca1..c2a4e88b328f 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -108,13 +108,15 @@ config HVC_DCC_SERIALIZE_SMP
 
 config HVC_RISCV_SBI
 	bool "RISC-V SBI console support"
-	depends on RISCV_SBI
+	depends on RISCV_SBI && NONPORTABLE
 	select HVC_DRIVER
 	help
 	  This enables support for console output via RISC-V SBI calls, which
-	  is normally used only during boot to output printk.
+	  is normally used only during boot to output printk.  This driver
+	  conflicts with real console drivers and should not be enabled on
+	  systems that directly access the console.
 
-	  If you don't know what do to here, say Y.
+	  If you don't know what do to here, say N.
 
 config HVCS
 	tristate "IBM Hypervisor Virtual Console Server support"
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
