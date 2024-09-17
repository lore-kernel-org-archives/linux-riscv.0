Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BCDC021A7
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KjCzXC1B0xeHDHarj8JryugQkYRhZuAvlNZetUM54E=; b=iKsn+PZWEhBCOV
	7QYrcRRbxTjhZv6vh+wtlmtyhyHzymyDevT5wqC5WPu8V4qg5J6IQF0NJq8Fpf/g/ePjMHyohfhVX
	Jn9Gu0leV6XCniC1j4aERMpWeW+r1nv74GJl52UEgrSCk83H5ZNYfgUBdQQ9m8BZp68I2Tz1fww5k
	TanwDp2Q01+/fcZCS/Dr26Sp95xuVWfcwJhhmHgCOcpGy/PNIAGo1G3k/HvpREwMK1OAZMw8THeOE
	a0k2zxnWww/MFK1tqh1cH8GzAkUSq+rr4exbZdWvyGbU7vPDzBoPuIkUzB0MKUD9JsLiHXh8uAR/p
	iwM9xh63p3yZZbolfiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqY8M-00000006DRY-0EbY;
	Tue, 17 Sep 2024 13:20:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqY8J-00000006DRB-25gC
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:20:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso48434465e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726579240; x=1727184040; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=efz8/Dk3oJm9eC7tnYg4VLPkI9QcVtmMhA9Iue4REoM=;
        b=h1H5MdnDun53jwd3xRevfoKuIZxDdcPnjHitrNPBfbMT1oYGp2Olsru9wdTu7Tgjxm
         OGk5KfpsiXfv/mGVqxjjD27JO0sZrre6e08AynW24dvE+U5jxVQa/cKPK5DFVHV8HRpL
         hxl21iX39tosE6o5CxIDQek2ombITAHXnCVBSDfuv9R0LTA/5nJ2l11hMJnDwQrsjqBd
         U+LwXh2SOJ6jXTNznm+9i6kYVw/U02GQfplPLVHQT0vxKv+0dbRczm+O97ESz1Q1GLRU
         lZNi7y6JLzZorsNtKq1AlL1VfDyIGyvGRHpiq36JHWUm6P2VUopFRP1VG3L0pgqIkXXR
         YlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726579240; x=1727184040;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efz8/Dk3oJm9eC7tnYg4VLPkI9QcVtmMhA9Iue4REoM=;
        b=oX6/7rrKci46d2pMdFhHdS4sstofd2ixVeOhtlJMuC5YDu7bwCsPks/KO7sO2AsfWT
         aZ2AsHoIlVmSwyCF1or8Iny/ziqGyuzAbNLhYRgUrJUhR/CAotyPwdMTZdHfoTeBoPY3
         4URDEs42/natdmDmaHaZ+wh1+w6WqLAl5mqdoHPQYUjScvmcjMobDSXcGVVTq/ViwoPH
         O8wWHwT+OWBjiwC3Prf5KGv3SbCxT7gEqwdZCQ/LoovXIb0Y0uo64z7gPGA8Ol3RqmeI
         8j3kExqnKUXw3nf59YKoweok0GfPYKQbaCE8wu4gms0XrAg+t2swHrSyN571+vbBO/CD
         bU9w==
X-Gm-Message-State: AOJu0YyZrGjEJFg58EglYmwYa+QaojDwbL6hT25BJo+eV35G+GFrzNp6
	vJbhtvvgz5dl/7+/pcQL/GRW9X1mI3BeXxQQVAV/oCALffdu+lsHQSIviq9s1GBtQA8lyF76Fry
	ygESlGcxA
X-Google-Smtp-Source: AGHT+IHfoLtvA+mRtaep/viVT0AmufamwU1g2A+08F04Ua7g+LOKCqmmS1jRE02/HpeYkCh6gd4GXw==
X-Received: by 2002:a05:600c:3b14:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42cdb522c81mr134732325e9.9.1726579240250;
        Tue, 17 Sep 2024 06:20:40 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da23dd5f3sm102677245e9.27.2024.09.17.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:20:39 -0700 (PDT)
Subject: [PATCH] RISC-V: defconfig: Remove ARCH_RENESAS
Date: Tue, 17 Sep 2024 06:19:36 -0700
Message-ID: <20240917131936.18980-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: prabhakar.csengg@gmail.com, geert+renesas@glider.be
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_062043_733047_5B6CBABF 
X-CRM114-Status: GOOD (  10.59  )
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

The RZ/Five is gated behind CONFIG_NONPORTABLE because of the DMA pool
issue.  e36ddf322686 ("riscv: defconfig: Disable RZ/Five peripheral
support") removes the drivers, so let's remove the rest of the vendor
support as well -- users of these will already have to play aruond with
kernel configs, so this shouldn't be much of a burden.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b51ef6cd1e39..7b896a0f78fc 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,7 +27,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP=y
-CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_SOC_STARFIVE=y
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
