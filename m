Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08298CDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6Eq6ePnmgUEFGHR7njKwHGJjW34OI7D44Wf2oWb37w=; b=InbXsNm9gun5Qm
	ZIDYGctIOQOo7R9Um3MjqNyWfQwLN3B6KPM/Lt8nz7RvGC4KGaGFhGeukvEm+1jwISlJDzcxOrXEo
	w0Y4g+9Pm/c85tdDnr8OKEPJoO1cz88Gzoh4eZwGsEftdDkLizBeiOhWx9zkVrqWjr8EGdqNf1fsm
	fkpjsbi0+X1nMuigEKOHtDnkFY8nvn8zasFzZQt3e93v+83e9UQJoGH64kUBqT6XISOvfZCu/U4+T
	eNp0MHO7LTb+6ZsaKJIKAB92sZ5qdMPJkRIFCHJbZFp8BpA6t8jjvCr9ci0jXXn25fh76mYPuLKxK
	Hoad3u9txBLZSvnIxGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2j-00HR8F-2y;
	Thu, 12 Oct 2023 05:15:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2g-00HR66-1k
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:27 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-690d8fb3b7eso523174b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087723; x=1697692523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8bTrDTugOefVQ1gZ31VUL3xKHXyC/9v3hCQTi2FF0M=;
        b=orGwHFi9LTIdHK+xgRHKBUsgyt6wB3C+zaK1UE6GoNwohUEEdPOroMAptUjGbilW6+
         WWH5Ds1ZvJRKjO1tijIPvW2SOo0ZPkTzIvtmGhYDeQ0uttC2viCC6s1ZXs7/vXGJRPME
         ypf/smxCMML4K68/EXgiRdxxYyiuOzjIWznK6qy3BtpUWHM749+GpcpkEkAZP11aBg0w
         mk/9zdp/cqW0MIuKAY7L0op4newdz3p1ZHi4PnQLNGDXCuK6ZB2u7QDs9VWF2DWnbxzm
         ITpCb2mNy5vUUkvvr9v8CNTrmXb0936xi8yu+LNKcyAzv5228FH3hzsfi6xohsJ7dqbV
         cseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087723; x=1697692523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8bTrDTugOefVQ1gZ31VUL3xKHXyC/9v3hCQTi2FF0M=;
        b=rbu9kE5IvcUGUlbUMvcsZDGglnjMHcdknU9kLujNXo57MBIpXkdwpdGB7qRraA+Un+
         jaTFATrpxNQCztk4QzVlIyfG5iCykumbPPYV2L7UYG9SXuAwRFROAeZyMrAeiqIEoxYP
         qcQNOfgnpH3Hbz0OuSMWRf1zuGLyw0q4r7reF7pdDM7s2Og+qoBziXWwYVaGkElXLrbU
         Yc5GYP1z6HkdtI2bDzDI6GeLoPkPxdj5sF7S9jbgG3/F1S8ibe/Sc9RdnpnkYfHbQWQx
         VIq7FnNr2g++II+VuQUKDdgrBpvWXbOc4ULnkHo0eFYJdlFH/IHSzsIw0MFkkobuwi2f
         epcA==
X-Gm-Message-State: AOJu0YwPINC6idd/zgHVSzaPtUihlbsH1IQkB5pXzptOwP8stDmOgkct
	oxbvO7LwHY7eXk/dtORWi64mVw==
X-Google-Smtp-Source: AGHT+IF5O37nt3kva1oplLeK9oTh/UptqKIJMOtFRGHJUvOY3IKhqZJUhVs0shUGm9K4PlGiYUf6Xg==
X-Received: by 2002:a05:6a20:1609:b0:153:7515:9919 with SMTP id l9-20020a056a20160900b0015375159919mr27813886pzj.21.1697087723486;
        Wed, 11 Oct 2023 22:15:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:23 -0700 (PDT)
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
Subject: [PATCH v2 1/8] RISC-V: Add defines for SBI debug console extension
Date: Thu, 12 Oct 2023 10:45:02 +0530
Message-Id: <20231012051509.738750-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221526_582051_E9176850 
X-CRM114-Status: UNSURE (   8.52  )
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
