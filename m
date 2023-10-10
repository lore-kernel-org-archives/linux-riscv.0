Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9045BCD8CAC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6Eq6ePnmgUEFGHR7njKwHGJjW34OI7D44Wf2oWb37w=; b=Ir5vhyQtwRBx8a
	COkCZEIFBmkF3qFWXeY8jZIPQkKv0q2ke8z2gfswGiS+db2xw9XepfXyV1eJ/uPVwywulBiApIpTF
	slmWEs0mKbZXp5+9JcdkLDcxCtqJy5ytPMYUQPdUqVw1XJRIWt7zHXMRfxhJXx/rOpQ5SSkgdV5Xb
	PtyU27NvsztoGvmLce+uV3ownLxPMSvmN3ITQZCkOqA0WwbheuEOE4YM2DR7JgmBLclbf5+sai3Vf
	47VfBf//fESBSNE06kczHa7rGTmqBfvRpigraiXwcXO5EWJficC9lp4K/mvZiTqJ4yexeDdFPzryN
	bByZ4IkUUk29PMnqyTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGAf-00DoKA-10;
	Tue, 10 Oct 2023 17:05:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGAZ-00DoHA-2j
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 17:05:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c9b95943beso5620675ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957519; x=1697562319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8bTrDTugOefVQ1gZ31VUL3xKHXyC/9v3hCQTi2FF0M=;
        b=Q8b433TPIU7uv/WJUUvS6dWItJ0AN/y69E4tZGj7mv/nQGDBI2aWJESKTrGDUyYVRn
         RjvbOu03pDmo+p+HMtiPe/WuHI/EkEieNnaIpQ8NNn+PkJ92ecGYEXBmyXl8Gbb+SVpD
         CqEUr/Kh7nPR5F8fbqVnay6qjQT8ff6pnhX1UT4Ttxpor8ixGYWE0aLpqZna0+IEQXoq
         SzTHvM5HYhrgjLuuTzloC4h47XiAp6b/v+FxseYcexGhjwZwB0aqXV1nTIAJ/UExP5sx
         MUuOefy4F4IB54EXsN5e2gXeyEFiYAnWTxmuD5e1GZ1l7i5i+AfVnUioivi/CWv/FBpR
         JGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957519; x=1697562319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8bTrDTugOefVQ1gZ31VUL3xKHXyC/9v3hCQTi2FF0M=;
        b=kGsm84Ue2KCd2lC6pCtHk1D/mLofBPUTLwVCa4fZxWdCndkjpwK2AJ1SG0QSpJ3Oo/
         vF2xba7d0vDuSPfOmfJ+Q/fl6apyWNG3PJD8ZRIL8qwZsx6QEZb0kVdVQrnkLYmwCiZJ
         4Iqsfj4YIv94qJ2LDu6rupYmtwQeTgS9tsxt5YTUJXDMV/FZc0Z38aMCk/nm1mnH8+fd
         j3yi3uxxcIUenhMj3xeTDm5bnJurtPARRoFuI/+IDY4tDM+t0NKwEZxWTc0YiBCiu8LE
         EYeKh7Hl7UfieHSsCijCGeI2obfTUGMTLlmeWAF67JkFScIY1gAz7XZGcCZpx0z8gFZc
         6NzA==
X-Gm-Message-State: AOJu0Yz5vi4AUaC/AAMVYY2p6CeWW5ukEZsulxzVjar6rnRiGbcFjpR/
	HqeUXGd60r+5oH6+yXgS+Kj+JQ==
X-Google-Smtp-Source: AGHT+IFL7+0d+NQPD7h5kg3nJxB/J3VP1OkPOJXtOKdl/WfOH7Q9zbTJf6UkIcSLTxobmxIUYWGImA==
X-Received: by 2002:a17:902:ea0a:b0:1bb:598a:14e5 with SMTP id s10-20020a170902ea0a00b001bb598a14e5mr24227444plg.43.1696957519183;
        Tue, 10 Oct 2023 10:05:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:18 -0700 (PDT)
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
Subject: [PATCH 1/6] RISC-V: Add defines for SBI debug console extension
Date: Tue, 10 Oct 2023 22:34:58 +0530
Message-Id: <20231010170503.657189-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010170503.657189-1-apatel@ventanamicro.com>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_100519_885372_15BDED27 
X-CRM114-Status: UNSURE (   8.87  )
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

We add SBI debug console extension related defines/enum to the
asm/sbi.h header.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5b4a1bf5f439..12dfda6bb924 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -30,6 +30,7 @@ enum sbi_ext_id {
 	SBI_EXT_HSM = 0x48534D,
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
+	SBI_EXT_DBCN = 0x4442434E,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -236,6 +237,12 @@ enum sbi_pmu_ctr_type {
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 
+enum sbi_ext_dbcn_fid {
+	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
+	SBI_EXT_DBCN_CONSOLE_READ = 1,
+	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
