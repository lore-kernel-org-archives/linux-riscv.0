Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E32CC47079
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 21:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSZgvaRu0QvX2sS+K2fCvNtNSqUVZrMEO1FB8AZnoyw=; b=hHa0oh+cGrnn6n
	JySHH8P4Tn/0EUN3s/poheKWVnf9vj7LgxEyjzolI8kGNEqLa2AKMFDy2ppAFAXZIbujRA7pUcNit
	GAHupMcao3/MrTbVdi3eimOtC4PHQUfIGTHLAXQ9edU+tNbxAfU70Sqw3HDStk54J4W9HzXm5hhSq
	XPixZ9DielrmpzyagBY41yXmK++Zb6JguDPgB6+WGfMbFoxCLw/sBVWj/ok1OehCw1RJDDMRTTeRA
	KJrylsiVKufJdAxw8Hn5zuB5fgSoHrfnsN6VUG3O7MCjA74o5ne/HCfkb5/Hq5eaSMVWRVV3BxInJ
	fXnDM4FGwR814l6kndLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk5-001bmP-2u;
	Fri, 29 Dec 2023 21:50:09 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk0-001biG-0x
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 21:50:06 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6dc06e14626so936975a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703886602; x=1704491402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpN1MW+95i3F5wasxziCwuSYEcNzMGQOQLUR8+9YpL0=;
        b=YJyjgLth9XYHMWZ/RJwTDzjy1In4mnF3PQtGVfVC7SdFRcdO+9ZZHWnGDXIFl4Fo7S
         fxcoVfaXemnVrUwqs+eBkW/frShqgqwrTcZpCCHlAWdAb5dUUscYHRFEX2OQnPuB3DaX
         jlka+Og11acYxBbNdeEpIWGuYAKiS5RCM1gzIFTqF3BVP5S+F7pd5uWthvAC+j7lv0IZ
         W8USot1mokghgaX+T+4sef2c6gzoaM+xQu6cPBBhF/7wszuN5ce/o5VxH5PWA0tRoR/J
         jubjFmw1zXcjBPlPVlWcBuzT1iKjJkBn8s/0yWLLooFRWJcesxUc/PS/pGGlSFkymHwL
         V0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886602; x=1704491402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpN1MW+95i3F5wasxziCwuSYEcNzMGQOQLUR8+9YpL0=;
        b=Ssnz6ptFDhR3kDQrdux+0YEZeuuB9oDl9bAabe7EnjzTD91oFLPuTgGklX0YjZcGkw
         RzeOJrEA2godoHRLHoN8rfUMVWVTKWm9UGnDVr5PZ7kryoYZKIYzriQt1P40Oik8w5SH
         e8rbGizppRF9eE6wy0yFdT8NqATIBUvDBFu4gxh5mcYLeYdEPub54mihdQmDPNLq20MN
         6t5j8q8qe1zNfsrvkIfpmJezNtI5E4eNH8e+0jbL5uWyQnu+ueQfnrd1Nr15Y/NyeXih
         xRnB4iBz/IVoprY0jxxUtuU3UyS2Li4S8jgYZGOEMDgt4jtW99nsJ8aPsxC5Z133pgJr
         BrEQ==
X-Gm-Message-State: AOJu0YxXbWCMkehwXDEy7g64Dl1MiPQovyNBMxzQqq/AF41gobPbMMiG
	/lBe+6jCv5b3VIC+iUHxgNc7PELCSiOJCw==
X-Google-Smtp-Source: AGHT+IEoMYlA+EqYZ2pNrGiuaXbA/ou3plDe34hdp2Cqt+fbfmvLcabjhNZrNrL5tfUhk6UK6bCctg==
X-Received: by 2002:a9d:6f09:0:b0:6db:f8e8:758d with SMTP id n9-20020a9d6f09000000b006dbf8e8758dmr2480275otq.31.1703886602427;
        Fri, 29 Dec 2023 13:50:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r126-20020a4a4e84000000b00594e32e4364sm1034751ooa.24.2023.12.29.13.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 13:50:02 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v2 02/10] RISC-V: Add FIRMWARE_READ_HI definition
Date: Fri, 29 Dec 2023 13:49:42 -0800
Message-Id: <20231229214950.4061381-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229214950.4061381-1-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_135004_339551_D71EFFC1 
X-CRM114-Status: UNSURE (   8.48  )
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

SBI v2.0 added another function to SBI PMU extension to read
the upper bits of a counter with width larger than XLEN.

Add the definition for that function.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b6f898c56940..914eacc6ba2e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -122,6 +122,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_START,
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
+	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 };
 
 union sbi_pmu_ctr_info {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
