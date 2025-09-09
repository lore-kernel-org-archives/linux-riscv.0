Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA071CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 08:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlMk8SGVUae9OjmNnd26G6nM3CGMrBh5vuzWnfkfozM=; b=xJaF6gqXSq4UKz
	XaO1pgXS7aluMv/xooXTs1aAgXaO0INKPP2lf0PO7hfnl7tA8k3hF7QhXkeCEUwDjbdas9GwMKxwX
	LC9WXE2YsYfpMJk4nwxDlCFaNmCO91+peXQOX3JQ00aJLCd4ZGX5bKcxl9E4ngen94CSU8W5Vk5eu
	1XW0xdZY+f9nFwHR6rrCzMbBn83eN4y+P6CkY1kblI4F9PBR3nO8VwwRef0YHnpopi6Fq2H2jJRJi
	c4DoMXEwhBmnPDzMSGcZTteTGu7YxPF+SUovLxi8W2ofAk3TMTWTREgn2PuqfyuaOHRWYTHDGxN05
	ZI/Jhqos+/4MYKrYEVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtIi-00000005PLb-3fiI;
	Tue, 09 Sep 2025 08:02:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO4-000000051nX-3XVe
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso4622731b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401412; x=1758006212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=UaEMobHbu+gyrkiuzNdfZ0bbE81u2A/ynnl4hidTcRVlpuQ8nC2TC/SD5BuZS7nHpH
         pZ2wcDxy92TPT00HU9IsKV1or66rGLdGmYti7Wur7GCNh845G4QZ18JwpPW0SB8XhqbI
         VkT3e5+3mbJfuz5LlUCNHhl2namYlQzxo9DIiCxuS+cgQa9QfGzc1Pgu3JMmhquderip
         0BV75LPhjK05ZOMvDfZsbm5GS4uCj/OJ/yHLBHJTVp4MJNb01kL86SKSqfAbPErHPSyE
         M/urqPq7pfc4cs0wrXCZdpbxcAcFkl4wh/scJzUG1fTZWDK7gYqpfodZ9BU7HKf5LZdG
         hf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401412; x=1758006212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=UVih6HRvtNE/M+Rll1dRTRgLP/Eyi6QOIEmXoOaL5wbpnaybUp/s+xpWbOHGcACq8w
         jeKbSvqzCMXkN0i/C5+PC5d1um0FzWdgtuIEoZnMQW34g1dqfcwIh49ZEZaWrXkEQGTi
         rkOPShwFkEDVzwD5QdNWDxM4u/ePrV8UGc6283LKM7PU2SWm0iVjMrLq3cyy46zfNydD
         2u88T6skxhkRwII8zXM1mezy2VkXm+OWH8qk1geAqb/8LtUPc6+TnB0Xfvl7CZNWWw9G
         div0UgmApoI0fHq32bqipbKSbtBvo9SN/sDhS74FHMpcrZKUwQj8JkUQ5VH69xM68yQx
         LGsw==
X-Gm-Message-State: AOJu0YzT95XXDxsFN+/KA9eqTjmGP2/ICsdJBByyGDYaaHIXAjWEIGWG
	xxqSkR8hdBYbKGxZK//BLQiykR4GZx0KgRvMzR4CeAy3xHsV0X25PcShxrE5IKadlXc=
X-Gm-Gg: ASbGncu9PUjWMDdzPvJrMrSGQj//R8fNssu/uv4E9t/SPPasjZOoa2oOENOy/oQ+8ys
	yoLy7VbFh8gVMWXJKEIsdbSD3+r1R0RH1zxR51r8DfPM1nsZiRU+yFHdYFujQsTK7ctgsI0johJ
	LEAkjYPljNe3W4BvOD5dG2Wt5Ie+CphOlZE1tsWcV0oa8YASFGMst0iQd01fxcq0uNcflIMDbba
	U1IQ98qUK0iVmkdyBHLDbAHmOhWSTC3Ju3G8OHJ2WTzP1J0BcJm+giCx5ncqye2A42IwzW22HuM
	GrYGsWUIPv0wfUJ0kXaEFEcWTP//hnHyJ2wWLxh2aVSv2X6QxJMhZ2UPDDnEurNxacOR5UjUd8u
	QuDsD1KHQKuC5uP1A4WQAzXaYpRiF3rLxA1a6hEnR5pwX/ePrNTn8O90i
X-Google-Smtp-Source: AGHT+IFeScYoURP1S0tDI9KKWt2+546E0P9kyjl9XLHBCBfgEh4mWYviwRJae66lvgYjFmHDEYj1kQ==
X-Received: by 2002:a05:6a00:140f:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7742de60630mr11833770b3a.19.1757401412287;
        Tue, 09 Sep 2025 00:03:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:27 -0700
Subject: [PATCH v6 8/8] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-8-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000332_886055_7DBF7994 
X-CRM114-Status: GOOD (  10.09  )
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

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index d678fd7e5973..f9c350ab84d9 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
