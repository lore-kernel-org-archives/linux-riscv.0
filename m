Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360BFC83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Q8Ouosf89Zr1WgmlKP3WeP2pineWyRgRm014+SLnRA=; b=XiSgQAgia+QxJ+
	LIyua8CtiBamMb91PZX5sLrCDLL6oYKi+PO66iseWcK97fA3XlnDVu2DJo96l2C/xjkeieipTmrT2
	nWfZbGNkmd9sevu3GKOmQUUu7aVqxawlcXggU/RBphX16oXn2IzTBQz8kG0eNQgYQ8kaGvqBuoJ15
	4cSE5RyjHm4Sg5i1IEBGySC97Vj8/J+wmu/oRQPRKj83bV9PYSs4Biad0mYF3707+uO/nRXYddFFh
	YVUJ7fAdIJWMY5jN7rJXtdnV6WBXEEiixIGA7x3EWcNrhDHNfPZ6/FUNxbZxFIEljLX6YnQ4mnqc4
	XruL47QJ/Wo5B+ccs35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3qJ-00000001BqX-2Xkh;
	Tue, 22 Jul 2025 03:39:03 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3Tb-000000019BP-08Cn
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:37 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so3760942a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154134; x=1753758934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IczIPc9KHJgwzJvoZ8OSDmYG0jZ0892D1g8bhwKC07A=;
        b=mHFJTXrDxDuou91vK5bvtPiFbGFtQY99AwpPyQNqdwmKtG9/BgL7A3UCHOJNX3v1ub
         SjPNFSn/TGdupJJlUJYq+DbZt4TeQRT/iQvm08TicU5ejFx1aC05UGittMOB4hqAIJVi
         EybCeN+h+epeJ1Nnd8+McRNI4LuJJlJ/EWz3WWqTL1X10vGdvbtfNrRjN/GSwhL8PU2r
         AvZQEyq0/hIh6zLNFXsfV5jfZsur9oTsGXIVyfUirtA4GKHAUNzrBHNPI8JD+1wuZRxE
         X09tz8nYpW6I1D0A1Xn0ciaaI8m9oH6Z63rp+hxPryQer5TYGB06c0Xajg1pPucVwv5W
         w4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154134; x=1753758934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IczIPc9KHJgwzJvoZ8OSDmYG0jZ0892D1g8bhwKC07A=;
        b=NOlNHLj1apts3cicP1l/sQUIwIqLsQMFheRy1A9mnyhUTxIb8ovHkxhQSgDj7B/tXt
         3zveha5GHzsQ/o4Krp3lc79nRAOmopFDlBVX7+6MaPHQs/V5D4orm4eOof6jbVwhoJbC
         dcjyirfmHD5+4yFkRMKr6bZ/TUfqJiMPdpEZPHfa8Wnxmd/HAviSq/CtUqDBG+KrRCdS
         5C2haZHxoWP2X6roUEsogLzM+slv4R3yBdH4bCaHqBTYnXunBkX9LGCipGhCPu5BCzXh
         3SLgPHiRJMDTKAVYCij6Dn27+qm4BUINv3pXGeqRxOmtwPdbV5Wp6zXgj7Cvs0L85kin
         rnpA==
X-Gm-Message-State: AOJu0YyA3QZcqseukz0Ybl0+SpCJTf9yld4qCuRuEBMK3mAY4PNBvWKh
	axVMIIQ/AXq/s0tJ22oV0Owoh4fF0F/yCyJEMWs8sBvQCIAqC4j2YuLF3zq/VAaDFyM=
X-Gm-Gg: ASbGncteADkCIA/1V0Wnulq1PyCSfmawCKXvwqblmar2Up6LacfgldgYek6d5CX9+2r
	hn/vU1+mk/Mpi480Py7JhsrN1Kl5MaaVwRueiwybtwlDWl4Mh8riXoePA5LHb+nNE5zRrogruVO
	cwe535ZyGIppVP4VaXYCqB1oQM1zZwnxtfOI5V3ORIDrXLDgpagfh7Kipr4sOw99tSOw45Njwn4
	6lDciJVepdQdlYu8NdOmliMz8aG3QSiaVuG5WWslPWBYvAEUu4WNoFSKfv2I9boA1jcvVDRVaop
	1epd9mpo8k+UIDmBDBf9jWf7Z70gDH1fD4VW3ivU/1XNVvtwDy3OG6rkOFYhuxr+LQ8HY3DCpKF
	lFKuts6/X4ug5Z0O/QuUVeMTQ1BRVPhI5umg=
X-Google-Smtp-Source: AGHT+IH3k/+gjr1r10wY69nF/zLNtmLpBdy2psVbdr40RupdADuqBFyStTW2VIXjsnxPyVZeQF0kHg==
X-Received: by 2002:a17:90b:1646:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-31c9e77cfe5mr28771702a91.26.1753154134478;
        Mon, 21 Jul 2025 20:15:34 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:34 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:25 -0700
Subject: [PATCH v4 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-9-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201535_213290_D3787AA7 
X-CRM114-Status: UNSURE (   9.74  )
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

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 439ab2b3534f..03fd350ce7d1 100644
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
