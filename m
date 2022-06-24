Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A86BC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aUIiLEJ7vPHRyOa/YiPWIhPNDykGCiRB7l75/VXBYw=; b=EdIT+tdT+ekcvg
	v9HANT2aa/fWe61leMicMCS9zeEFTXJr7CAAgRbEpNDTDlLVjVdWMgm6kLHGYMNMj4Nn0qzWo0dpn
	9Hlogn3kSDs0XbumskWmJEmaaV8DKDXX3RwjpmSfgkvSNWjvQbBjAIr0K/AoXLFybUOQsZWSFOChR
	Gjaf4XeenU3s0XHgYdaeNWnHthyM1f4o3TMlj6s0bhrYnNJRblZpYsMTuhB1QGGV8xO0JmPbNTm+L
	X/gnQ4rdtGXl3Tqzkn05ILHs53JiVXz5LaKU666E5d4V9/lYdJS0IASBCCXh1/3rmO/BInjc7e2fl
	kEJE5qAsQ/bTdORMPGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bWv-000SOM-E4; Fri, 24 Jun 2022 05:06:53 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bFC-000HOL-FP
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 04:48:35 +0000
Received: by mail-pg1-x533.google.com with SMTP id 68so1337456pgb.10
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 21:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=4THMhvS8M5ZnFTHvTFejhkWhYsuAvg/ZgzsYmQOutl8=;
        b=jZ+UoLM3M7Aw8FzFUs4vfV0xGVF+Z1rgG06Q0g6ddvpteFSUct4m0aAnWG/UHlIHcy
         xDIWATlB0GGjs/hfRkxe6UQ1V4kDs2Fm3V/6fxpXi023MU/ojZBBXm7JW8wCFWafwRbY
         ZPHpdFFCz4HQaws9xVkBWt/pnD6GgEBKfUCt/XZPKwwH8Eji0UWJl8bjjLOYO2Km/VcU
         riLaGCyFAc2cIrl3N/VncOYPKf8urgmhHUYRlJWR81bCqV+fn5a5+P3hY9dVVfzj35qZ
         3V3zmkqcGPJtvORY1fF7FSMecx1wrSvXDD/7UYn08WWFqdnoryi8KMch/00RWyQK0gLR
         DpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:cc:from:to;
        bh=4THMhvS8M5ZnFTHvTFejhkWhYsuAvg/ZgzsYmQOutl8=;
        b=j0pSVP4l/Bza9iVUQcMr4hHUJx6RtAnUSfbeX8wKxW8CsBwcNzHHjfv9VcrG/P3AdE
         9aHbzLJfLz8Lb6BMMSt7gvJ3NJmc1q8nV+T9mhgFh5rI0p5VrM5DWgJBUqODWrp30a+9
         b3QsDm9sy9UV4x1yuneSMtGn637m/ad2R7YOg+xG+OcUkEp/VTe17oOAE2pI1gCcPGHC
         /ccKeqUeZZfV3lgTEx1WfEZOxRGHtivleOaRiiHz6bjJDaBxP8ESo/VDN6/n+kkalKoR
         gbImFkPHxfyzRxXEfomI/BV6iNo0BY7nlnw6NiSNuBZgPeRzhza5u9KBWPdxSu9SM/L0
         WgaA==
X-Gm-Message-State: AJIora/Z0LD1kgio4UUX+H4YnK72ZJCzKRmc0CUGjELxNUmAFobA2tfg
	NPkP86ONbJy07RBxuljpFfQapjQnwaBADA==
X-Google-Smtp-Source: AGRyM1tjG9XTGQzrvxKP1b0oJm9GIdXwYRdfAbtw1YGd6ry6SLMEHPonI2hZnL7q9k/q2Z13VDkRjA==
X-Received: by 2002:aa7:9206:0:b0:525:1068:c026 with SMTP id 6-20020aa79206000000b005251068c026mr31366064pfo.52.1656046110313;
        Thu, 23 Jun 2022 21:48:30 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id k26-20020aa7821a000000b0052517150777sm555865pfi.41.2022.06.23.21.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 21:48:29 -0700 (PDT)
Subject: [PATCH v2 5/5] RISC-V: Allow kexec_file() on 32-bit platforms
Date: Thu, 23 Jun 2022 21:48:11 -0700
Message-Id: <20220624044811.9682-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624044811.9682-1-palmer@rivosinc.com>
References: <20220624044811.9682-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, linux-integrity@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_214834_565914_082D7D3A 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With the build issues now sorted out we can enable kexec_file() on
32-bit platforms as well.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 898052ff743e..a246f2fe60c2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -388,7 +388,6 @@ config KEXEC_FILE
 	select KEXEC_CORE
 	select KEXEC_ELF
 	select HAVE_IMA_KEXEC if IMA
-	depends on 64BIT
 	help
 	  This is new version of kexec system call. This system call is
 	  file based and takes file descriptors as system call argument
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
