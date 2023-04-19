Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F3AC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVoBp1b2d4zb1rP/iVL4MBdSmEZROZZ1oRjWMNJs/gg=; b=Qowne3Rnbr82ec
	9wGYALjbOvdd4RnURxGC0mdcl5W1StP2YQLIYDDaXVXMSH8qHkjbkmfDH7t9D3gcU8m1MVuWS//KN
	aDTU/dDBXMo+n+sWX9hQDbDmT+YtyTcn6qYROPfIYP/vcKt3YStFLSwDZuFaY0Hzmcj0SS4MhbxUI
	xPwwfF3M9WHIoM1+DSCu08SKGm4U8tKQCCkpgVgoL+n+77mYy32TWkMfASzjSFjrqRDDgaL5fgnfO
	Wugj5Yf/psOQm5dWyZI3PWKdBoLH/aobgbD/JaXrfEDn3SSyO6FoBbBgYZog/UBeBIxyUQXqWT8IL
	UrVGA2OU5LaXYRSaTx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8F-006THq-1o;
	Wed, 19 Apr 2023 22:18:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8B-006T2c-1T
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a686260adcso5385745ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942707; x=1684534707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WztMTyUU5RnTeRMzQjXOG7tTAHmGJecGpWKfqq8b0LY=;
        b=JM/4VdTUHWchd0agtBcZMVxlzWz+xlNHvW3+YRV1BgFp8SzvOalMG8gKSVRQwN23lF
         /HaZUXiHN5WGp4Li2ns1uHUPekHEfh3C+xw1tqVd+IJGR2EtpE3yOA/YQtJ1ZYeUVJ/l
         7gjUeS7TILHwQHaL9l5Fnqsci5dyPD6ZQhESjL0jYTR+yEk6eIszpIH5SlasnHwxJ7Ky
         wlJDpXRoqS0jyG2/jEwfH6PNHHxv4wzD8drzVC/Q8h9ghskwb1QRJA40nqZUrBtk1qK0
         ooViUN4xyDeEoBWE1iz1aXlci22pk9Oc7YzeXphdmUjkGiDah9tsQrhCdZR8NGP6os1O
         4yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942707; x=1684534707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WztMTyUU5RnTeRMzQjXOG7tTAHmGJecGpWKfqq8b0LY=;
        b=lu0kzxhD+/y7ykLSdjddFaLRaIg4x4t2frn+vbor/2JYZwJ7lxJsmoUlvtEmSF0D2C
         BAz1zYLoZq1lRn7mAQC+WuhCjuTVlZQqjq7ETqy5cj46kq0hjijTP+0f4KVwO2vS9h69
         dQVvAEULZ32Edg7C/+V5v+5dd/U7XCAox5S2Q9JW1hqzoSJEEB3lmA+f7TOo9/LA+z+u
         9S9ObIghifEQDVKvALGxES/KoJyOWs/nYDzxspoYnbC0LgmBr60e5OEddloOTyCCnpGC
         lmSS1dSMzSXvOU/b8Z0nXkQiANG+s6pCb4p8LKSQWQ/YaDzNPj4k0v62HgWFcDkStdiO
         CU/w==
X-Gm-Message-State: AAQBX9d+VuchfL2nZWXIPjcwGinple28a8Jm+YK2iYpZK5PHFrExchXL
	pm2kYLDr83RHB8pVS6geIHBGpg==
X-Google-Smtp-Source: AKy350am1y3CAd0kzsPnqccpnVuquygqNjOFE27i75PzlAcwaRULYItnkTY6+2qQuafZtBMoWXv5YA==
X-Received: by 2002:a17:902:b087:b0:1a6:9363:1632 with SMTP id p7-20020a170902b08700b001a693631632mr6436484plr.25.1681942707075;
        Wed, 19 Apr 2023 15:18:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:26 -0700 (PDT)
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
Subject: [RFC 26/48] RISC-V: Add COVI extension definitions
Date: Wed, 19 Apr 2023 15:16:54 -0700
Message-Id: <20230419221716.3603068-27-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151827_514530_03C4802B 
X-CRM114-Status: GOOD (  13.26  )
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

This patch adds the CoVE interrupt management extension(COVI) details
to the sbi header file.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index c5a5526..bbea922 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -33,6 +33,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_COVH = 0x434F5648,
+	SBI_EXT_COVI = 0x434F5649,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -369,6 +370,20 @@ enum sbi_ext_covh_fid {
 	SBI_EXT_COVH_TVM_INITIATE_FENCE,
 };
 
+enum sbi_ext_covi_fid {
+	SBI_EXT_COVI_TVM_AIA_INIT,
+	SBI_EXT_COVI_TVM_CPU_SET_IMSIC_ADDR,
+	SBI_EXT_COVI_TVM_CONVERT_IMSIC,
+	SBI_EXT_COVI_TVM_RECLAIM_IMSIC,
+	SBI_EXT_COVI_TVM_CPU_BIND_IMSIC,
+	SBI_EXT_COVI_TVM_CPU_UNBIND_IMSIC_BEGIN,
+	SBI_EXT_COVI_TVM_CPU_UNBIND_IMSIC_END,
+	SBI_EXT_COVI_TVM_CPU_INJECT_EXT_INTERRUPT,
+	SBI_EXT_COVI_TVM_REBIND_IMSIC_BEGIN,
+	SBI_EXT_COVI_TVM_REBIND_IMSIC_CLONE,
+	SBI_EXT_COVI_TVM_REBIND_IMSIC_END,
+};
+
 enum sbi_cove_page_type {
 	SBI_COVE_PAGE_4K,
 	SBI_COVE_PAGE_2MB,
@@ -409,6 +424,21 @@ struct sbi_cove_tvm_create_params {
 	unsigned long tvm_state_addr;
 };
 
+struct sbi_cove_tvm_aia_params {
+	/* The base address is the address of the IMSIC with group ID, hart ID, and guest ID of 0 */
+	uint64_t imsic_base_addr;
+	/* The number of group index bits in an IMSIC address */
+	uint32_t group_index_bits;
+	/* The location of the group index in an IMSIC address. Must be >= 24i. */
+	uint32_t group_index_shift;
+	/* The number of hart index bits in an IMSIC address */
+	uint32_t hart_index_bits;
+	/* The number of guest index bits in an IMSIC address. Must be >= log2(guests/hart + 1) */
+	uint32_t guest_index_bits;
+	/* The number of guest interrupt files to be implemented per vCPU */
+	uint32_t guests_per_hart;
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
