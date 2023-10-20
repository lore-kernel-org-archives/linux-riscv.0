Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43329CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCMpAvkBJ/1oMtFttiDDRGrm52IaoaaOSwzwdhmMAyw=; b=zRPxWW9YZfRo1A
	Nh97Etc2qYZr137e2pOfjgMyW3+IItlXKSJisik8wDybTOhSfuidy20Z+6vtZ7q4bpp9CZfXFRSxW
	fIFRYaODNLe50Nz9v4WHcxcJU+7oYUK0Fga+LZhTZmTiIH4pr7cccS8Oa470yAqi4U4bGVVhK/6Lj
	HDA/6hhHkpLhRVMw5nv6uO7BZ73vGcTZRz4IVqBrLNPxlyLU3DzEB4YfIAk1FVLzLNvqkGTbDx3w0
	YFDalanby00qfLLsggDiPgvQMtZMepO1RTde5hNDhXr9GX6M9ZCGt9XhJQ+Ajq5m7qXpFOEGh9bmP
	+2qSaKpQFHgRYtb8+EDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpc-001Q62-1h;
	Fri, 20 Oct 2023 07:22:04 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpa-001Q2i-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:22:03 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b2f507c03cso314239b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786514; x=1698391314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFjlFx01Ut+IIk7lMz+iwDuvVBUbWHCR3u/gBbk/FU0=;
        b=EiHRqC0lSKmYaD75tCnAitMEFjYiHZaIaBjfGUcOpTDMwW2gYHW1IqDeRLfjXOpXtO
         a0ChwSc0T3ho4QSGobR0ZuRUGtXKq9HI4kq3We3WI8yrzWXj8rAkcVpIfGr0EVWGvpBO
         qWJ9wDzdrUk1Hqwf7E0DoHf1fcHNU30+NZ/jb3j4TYThSEwmopdkmwFAtGWEeiJof8In
         IUCGNrjFUUaSjAEiEsqVNuISjzEXnTkjCXQ1Na33r2nBFIc0CCQEE14pg5/25FPVZpWh
         IlHDs0OKW70+eMD0p+mAgjwzs1habxw9qPAVvNBYX9B2RWQNDKn9mY1cwsemDb7D4PPg
         zBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786514; x=1698391314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFjlFx01Ut+IIk7lMz+iwDuvVBUbWHCR3u/gBbk/FU0=;
        b=l6Q4k7Bg8mFsfqlwI1STgikVa32mpOeCEKYU1tprj/854vFnIaUSM/Z2dOPVBgLyoD
         SUrY+QRNI7Wl6es1+fXTtnZ4SLhS5tiL2Hpk1x9EXupp17x6oCbvzCfnu4pW+yknqWfH
         z3rVtYIyYdl2wWMM/NY/8sikgC8gRTKDpatmE1UEkHHMSsZXTLtsr/AXmqXFO1tIltrM
         TuwHDk1E3353TAx5G8XP46QswXsc5Ub2DVFMNWZ9K48WJ8TknSW+O63ayY7Tt4Fsd0ss
         REL5wgp+JgFq/0IgULEIr6Fp3HKGwdVN5VQ4WAfB+0ZID8slJVH1pNxvsKzY0wGt/vYo
         Wryw==
X-Gm-Message-State: AOJu0YzaaGNsBP/PLdwgoL1snZpgB+wwms/IMD+bBcuKqHjM7/VwUVo6
	/d3O+uRPVt/Lc0hyyeJqPrnKEA==
X-Google-Smtp-Source: AGHT+IHCf4SRFvcjUaBZbUoLW1qmUD5qW9WnhX5EFjNLnYxx3oBY2eRFWdyPRUuwwRReyZ05UhdEZg==
X-Received: by 2002:a05:6808:15a3:b0:3ad:ffa4:dfee with SMTP id t35-20020a05680815a300b003adffa4dfeemr1187937oiw.51.1697786514419;
        Fri, 20 Oct 2023 00:21:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:21:54 -0700 (PDT)
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
Subject: [PATCH v3 1/9] RISC-V: Add defines for SBI debug console extension
Date: Fri, 20 Oct 2023 12:51:32 +0530
Message-Id: <20231020072140.900967-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002202_525753_25470862 
X-CRM114-Status: UNSURE (   8.60  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
