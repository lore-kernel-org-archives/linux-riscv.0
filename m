Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EF5C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tv9ZRV9lin6TEEDiRfqX+Dz+dBEC/tWfpoEUBH27A8s=; b=ltvxofTe9pgw88
	YszBOhwyN98GI4XTvXMSIBfv2/de/2qph1Pc6JsbGpB01p41Ds3q72RBYotGYPo5dUsDvmU8fPtYi
	UrG5jiwyJpp0FecVDESZGX9WMQnRP3Zf7B8gsWSKh6K+I1jEGKwc7ex7jaxqFosciWYqSopBdlrHH
	BV6RkepSvvukqNmDTTIEAHAXzrUBK+atN35XryzypreW+FMjfaXuqWh05EBFb1A3R0nhzT2Uc9tK0
	6wcce+KtRJpG1QvKl3tb9o5g9n93a74ie4jBYBUnkayHVkksAlJf4iuJt/eFyzbBTNQr3X/eSBs3Y
	6Sf4x0Q/C5M9tlBoSi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQc-006Wdz-2G;
	Wed, 19 Apr 2023 22:37:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQZ-006WXV-2h
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3wZ38NgXR92ZnL3KCz4X1T1orXD86k7gku+jH9LYvlc=; b=sXWU2DYmm/all61rEO6UXVpE0s
	GG7AjfJe5emteqD8zCdFtXPSHkedkH678w2GV4Um4ykbQa9th4wDF/hQLYjQ9WnP2yZfuvyZ1rcqw
	p2eQme/HIbyKqyIm7j5sCkHfYT8JjbDRJGqAWmo8068Rki6KyPpqgak0erh8OzUeq5N9Nq6Kb6abw
	cwU12dtu/G3H9QLFYH592K3Ew+X7FeyehChAY1yPHdLn8/Kt2+9NLMs/HDM5dGejKpnxmUtNeqTKm
	Buvf9c7goPjRlqdC+JrmHAlODdppJi5h8pqRMUqeTqIz/8JnhliLqN8Y3Va1ZBmlRIYQBtnqi6Gis
	iZMHEmbQ==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG8b-00DeM3-Tt
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1a8097c1ccfso5309395ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942732; x=1684534732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wZ38NgXR92ZnL3KCz4X1T1orXD86k7gku+jH9LYvlc=;
        b=QmuuVYt46KpS/zYYMAaGwSu/4ogHzgebSuHz2Y3KqaXaWYNGDgVkh+TM+9F0z1UKqq
         yLwfXsEjIj5AyyA1hGl2bhxYnaVMKxeSrJ8kwz/jbSGPSXzXJrYc1cZLmnuKcOHvK/NO
         W+UYzU5cNYXd7iKLqbolbPZxHkvQvk9pg5qltXG2gdevWPNka1SD3vMUG51IVWwpm1Is
         pQl00SUeHSzQxwfQfWPPzCjONURk75DuuPNE8FRa7jDR7RGmxRIpfU2bo0VrGWZ8ZwD3
         0HsjPnYDT4F6NmAip4Qb5wSlSawzKk38AMTj8xzmlCbhjRiSI7AJ2N04QWgrNDK8/C2A
         ee7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942732; x=1684534732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wZ38NgXR92ZnL3KCz4X1T1orXD86k7gku+jH9LYvlc=;
        b=Qbq5FP1o11HYmUjg5oI0neFrTIQDCZkanFRrWMZRsExUR9L4Ut4L3xG4cAZEJ913xI
         wAjVRnseYoxWCMuEz2qBs+EfNh8T5/m3iteX44DZDay4j+TMq5bi9fp1M5MsS236y+gv
         m5JJorebXgjP0Gx7Z6DQbyDKCp5qJgHBUSpibYF0ZqglqPwj/zD8jj4eNRJElM9WPreU
         +Lnx6nBtRVAcwMU0g5p1t8okypoY/OgKc/LJwQhIojPv06gYvg48U5m2AQpcRStaNdk/
         t9zv/DLLAyJS2jf9OYGWQzNvVweKi2ZlHtrS32Mm3WR9WxhKvwp4GLkdtId1n9nnroyK
         aPHA==
X-Gm-Message-State: AAQBX9d05zb8tKoRDuG9Zr6V4CQ2etfdrDagUcoO5+zvz5SwB6k6R+A5
	80FpfNgl1yOwelD2+PBSPWyX8w==
X-Google-Smtp-Source: AKy350YlbYAHX3czmRaEVnTcNdf891KQxoyoTa0cHJBez0RPMbydsH+Ponf0TcKud2fsWou26F4oLw==
X-Received: by 2002:a17:903:2281:b0:1a6:3737:750d with SMTP id b1-20020a170903228100b001a63737750dmr7538499plh.17.1681942731698;
        Wed, 19 Apr 2023 15:18:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:51 -0700 (PDT)
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
Subject: [RFC 37/48] RISC-V: Add COVG SBI extension definitions
Date: Wed, 19 Apr 2023 15:17:05 -0700
Message-Id: <20230419221716.3603068-38-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231853_990192_4DCE2616 
X-CRM114-Status: GOOD (  10.66  )
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

CoVE specification defines a separate SBI extension known as CoVG
for the guest side interface. Add the definitions for that extension.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bbea922..e02ee75 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -34,6 +34,7 @@ enum sbi_ext_id {
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_COVH = 0x434F5648,
 	SBI_EXT_COVI = 0x434F5649,
+	SBI_EXT_COVG = 0x434F5647,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -439,6 +440,16 @@ struct sbi_cove_tvm_aia_params {
 	uint32_t guests_per_hart;
 };
 
+/* SBI COVG extension data structures */
+enum sbi_ext_covg_fid {
+	SBI_EXT_COVG_ADD_MMIO_REGION,
+	SBI_EXT_COVG_REMOVE_MMIO_REGION,
+	SBI_EXT_COVG_SHARE_MEMORY,
+	SBI_EXT_COVG_UNSHARE_MEMORY,
+	SBI_EXT_COVG_ALLOW_EXT_INTERRUPT,
+	SBI_EXT_COVG_DENY_EXT_INTERRUPT,
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
