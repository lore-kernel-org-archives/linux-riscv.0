Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4E1C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7BUXLoYOITUMK3beG2D1QImyFYrvHJp+OBVe1KCmsA=; b=twqg52XClfi8lc
	hYgA5J+RGTyXgiyLeCy0PCnhOOXoOe0y6yoyql/+ULrDjW+EzjX+clGgxkD0Kat5fo3Ussv10x7TS
	NKCdzYkgpNI7LNrJDeHmkIFS03UKOkpx2tlfyJYNtbbsiEM/QIKzSqb+KHalCv4WSWu/YVSR4PVUb
	3Am9xm039aeZNncKgp2PjhYZD/ee3hRdVDW/UkqJh+nBpszNuAiAPzduD54gAbT/qXIJnPTzSX0K/
	hWUsgx51s9JdJah9QSMRGoXEpnewRONpQjQtDEYOD5Z0XPOz6ctGdGe8yPjAHKcXnPnbBSjrx270/
	tZ2Vj16r16SnnZAbECAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHGD-006ee2-0r;
	Wed, 19 Apr 2023 23:30:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8l-006Tb8-0s
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:19:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1a69f686345so4530415ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942743; x=1684534743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a40XLfKnT38y+rtkL3pdG8Ux1IFfCO6rS0FTBqpEPf0=;
        b=3qxwZ1AI4VGDwq0mJs81MteY/7NGEkj+18YI44D7IRwVFmeOk/RDHZQGN6wE3U+Fah
         h7gisXIiukRhgYPfWkwf74DwoXRlOc0S4t3u5KNMCW0DvYSt6D9lgBm8X1/OboQx9bjc
         IzBdkE1rsZq0oHGxqiSUWhGy7JzHKWqkxpvHKq8QGhfZMNoiHDUHp+knL2W2J0PauRX8
         Z60xK4xlPZJK9w4CVaJLh1I3bqfv7kssfB1lBki6XAPwuKeXcckA/zvCt73aqzG97NxY
         H3VYn/a0FuKbmIi+8CNiszb6pRZFNUdKkES3iAmBw3QloUaHccRpDErn+0099zd/wFiN
         sTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942743; x=1684534743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a40XLfKnT38y+rtkL3pdG8Ux1IFfCO6rS0FTBqpEPf0=;
        b=Wvb32a2leW2xcCa5c3SbwhsjZl7BywaHsTroWQB5suDgycHWFTpEX1T3ENB3aCVKX+
         dIDBlFt2xDxAhQWXcMkH9kRcC/nkLoMfZpnCDWzFyx/pa/X/kZ0P7HUgZFLsrAo0Lh6f
         7//MW+Zxo8Jas/hLhrvAr8U2xiuxLipubc8Gt5XsHICOoS2O1oejNBSqlTJdbl5/a4rm
         pIuZwwz2mVTDiRtiBbwfC7TGlkMZtjXNT6kO3WcSpWD8kRSbQxWdB7RRv7CY4WDY/Lqj
         1Evn/NwU55W8gzwVi120F3IjwST0SDNwvF+h78fuQEBkEKEuXu3WvrPICE2JYMu9mtHB
         0arA==
X-Gm-Message-State: AAQBX9cb1Cueh3dluABc4uPuf/yjoHoxzZro4o/UnsM/zgL0dBh5S8Yx
	pfbL8Q3ZGIMh6L31KQcwVUrJIQ==
X-Google-Smtp-Source: AKy350YLjqHMzW16SB61ZrKO34D3/TlmDW2rBvoLEyn4qa6+KyWVGCYv7MHLqblqPruYYQP5o2V7iQ==
X-Received: by 2002:a17:902:ea0e:b0:1a1:ee8c:eef5 with SMTP id s14-20020a170902ea0e00b001a1ee8ceef5mr7846112plg.7.1681942742761;
        Wed, 19 Apr 2023 15:19:02 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:02 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 42/48] RISC-V: Allow host to inject any ext interrupt id to a CoVE guest.
Date: Wed, 19 Apr 2023 15:17:10 -0700
Message-Id: <20230419221716.3603068-43-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151903_307033_611D2625 
X-CRM114-Status: GOOD (  13.40  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Ideally, host must not inject any external interrupt until explicitly
allowed by the guest. This should be done per interrupt id but currently
adding allow-all call in init_IRQ. In future, it will be modified
to allow specific interrupts only.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/irq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index eb9a68a..b5e0fd8 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -11,6 +11,8 @@
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <asm/sbi.h>
+#include <asm/covg_sbi.h>
+#include <asm/cove.h>
 
 static struct fwnode_handle *(*__get_intc_node)(void);
 
@@ -36,8 +38,18 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 
 void __init init_IRQ(void)
 {
+	int ret;
+
 	irqchip_init();
 	if (!handle_arch_irq)
 		panic("No interrupt controller found.");
 	sbi_ipi_init();
+
+	if (is_cove_guest()) {
+		/* FIXME: For now just allow all interrupts. */
+		ret = sbi_covg_allow_all_external_interrupt();
+
+		if (ret)
+			pr_err("Failed to allow external interrupts.\n");
+	}
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
