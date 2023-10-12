Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52217C46CA1
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vpG+8F1t19Fht3xZS1S09X+jDJSAiINuWEL37daZow=; b=L3sAtZVbu5B5bY
	acgQBVsXfmbUZZTrkGa0c21iS9P1tHOL5kys4/iH2qLipwdumMzU6nU+QUciQPda45IffUyMwXpa1
	TjLB5EV6vOhNGdrRCz7778R2cBmoArC19Bf2q5l4ciY29SKTQY3cBBgRPgStLTwp2afRUcSuQsgfu
	t5DHZukIkcLeQChCj8eWcxTzqD2nvjnNLGU5oDpQUIThntslGYTLSYOrAt6Od5BuzyBVsGqNjZaTC
	wgp2ksxgjL1JHUqVeZ6k2tHq1A6PbrAiAe1o+RoxAsOGm4XYlw9dCX/7aHUTIT4wRetpIO+ncfoEi
	/ox5seyQ6YwGnlUIuOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo31-00HRK2-2w;
	Thu, 12 Oct 2023 05:15:47 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2y-00HRF9-0s
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:46 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-69101022969so506725b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087741; x=1697692541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRORRt3s6hvFf4qGGIikwZfB3q5mq8SDYLLtJc1fkNQ=;
        b=Ci0AKKbEUCPmFNSjinETlmARLHTeVjN7/1qpm4rCMHtRC4LhAezCFG9FIIhPwwxUXl
         ohPlJwhGE5wTd+J4ZiN74Lv8RHbSaNaJ/4aTD/ttnsICDIMAoHiGidkEJQfg2+ihU8UM
         cj4MtEB8xmCN8k546e+YuyQ97CzwU7FFjOM569JSN8lMEFXIREScPkOdlGlw7DTNu24Y
         HF1lkrWnS2QGXnjnIVCY3nP6bJAivLkbEVcYtZ1qg1odVTkyBoaC26egVdFri6Kx25S0
         z6m2yeAIg8LKXuMPCp300jM3UN4VKomZWakwCVMjLmehlWN64VG6qefaEuDyPQyDs3Ti
         pbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087741; x=1697692541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRORRt3s6hvFf4qGGIikwZfB3q5mq8SDYLLtJc1fkNQ=;
        b=Wow0YVDXEA70lafGtVlXBKJsvaSw6Nuuwh8P1+dso18mhQfZSwohVg5y962ZIpPUAz
         iDT6mKgP/4uKm0Xi73jp6zvIUjoWbS9LfWmM7tStRye/ETjjE2kiIj7bq7E7OvFiFbey
         qL/7pApLFqlir/cBfKnUUy4Zx3Gw2XZRFONcUlIMtYtybTYlW2MGRdkwP2J07K63CkSd
         I6bWrAXQ2gu31g2Uo0V22V3DcUjd3SSDXmsenhQYRP9Y3LQ7bCmA/KAzdgmEyKSiqN09
         DrSOXzElT9G7rwHCWzbS5EBiPCew29kEdd8Dv7ydCZ8rE2KPUfecnzOkXFHU1MsvrBNT
         a7ww==
X-Gm-Message-State: AOJu0YxBADUfNyTx5Hy/xNJHDS64YwkFMiLq5CeoZ73UyEESZuVQ8AjP
	OsUzeTTE1u109JmzmLbw7fO9qQ==
X-Google-Smtp-Source: AGHT+IEHQA7g0wr5kBdA1+VUq03jI8s5X+zTK5oLbVixutxk664ESGEsqt+140ZFSE0KLFXmweQiJg==
X-Received: by 2002:a05:6a20:1586:b0:173:e36c:6d03 with SMTP id h6-20020a056a20158600b00173e36c6d03mr3716883pzj.22.1697087741089;
        Wed, 11 Oct 2023 22:15:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 5/8] RISC-V: Add inline version of sbi_console_putchar/getchar() functions
Date: Thu, 12 Oct 2023 10:45:06 +0530
Message-Id: <20231012051509.738750-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221544_321312_91640EEB 
X-CRM114-Status: UNSURE (   8.61  )
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

The functions sbi_console_putchar() and sbi_console_getchar() are
not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
inline version of these functions to avoid "#ifdef" on user side.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 12dfda6bb924..cbcefa344417 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+#ifdef CONFIG_RISCV_SBI_V01
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
+#else
+static inline void sbi_console_putchar(int ch) { }
+static inline int sbi_console_getchar(void) { return -1; }
+#endif
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
