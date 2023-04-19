Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05BAC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+sZdryphwz+qAWHq/kPD+mgA9sK0pEILUNEhk7rFvg=; b=LlgNuP2HS74T6/
	tDxJmMG9I9Jn23Y6E/vgXO114+a1xGbVWlA+5ZseWdU8Nruohb8T6coEuow6A0pg1QVJT8NdaWj2I
	KI5/g813sQ46eHEhtOGiQGQ/TWI37/n8NItG8ucis2LZayxHeTre2q2PBSburDHPr0frV3ogn6Ivz
	dkqGTToIyxbEVUBtRT9Q8prmfkxMj22mpfG5gWSONq0sGKPspTF3MVi+A15DMtUwVxBoj2ESxcjVX
	Co9YPbwSrPs+uH2SXiYPaLx8JCtAVK8qHgEErOdApO07rFJgC9qBR8yGL2AyYFwwFMlOMwjpMPMLS
	WNULITZjsGSa0qli5TLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQY-006WZf-1K;
	Wed, 19 Apr 2023 22:37:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQW-006WXV-07
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ecSGlantlLzvA0G9VPQY9TXgG8EZEn7xksLEzRIVmIY=; b=f/mLc5TvFRoVXRHYGVG+fr1fX6
	AtnhydbomwHzBevDQGFtszsn4ZAy2yzwIWn05UNXQNUDgKeJ+TtbRzfASEYHbVSafbA/PFW84aCVm
	RR0lzEoICIzJ7IeB8n1ubGj+v3n1Z1tZNwKhRSOLtidaE+x9Kwij/oi+yua1742P4Dnfeln6uTeyW
	8kA3hEFnKRFy4GolLYqI+xJMJSWyQ7djXXY3/uWzdHgXT9MCl1PFPvBqIOYGcrJP7zb+ju8ZkZjgt
	Ypg51wN4aQO+Q8mnlnH64hw5QPgGBUOOZDg+4Kqh2e9rSfUiwQEye3Ir2FlvW4F4xuFZFMCDbiyk5
	5fGpqFlg==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG8u-00DeGj-HS
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:19:15 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b73203e0aso2788962b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942752; x=1684534752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecSGlantlLzvA0G9VPQY9TXgG8EZEn7xksLEzRIVmIY=;
        b=c21zAYv4W/8efVpj9s/CrAgsnyC7GRoXBj+SQ9uvGvmMRjbXi9C/l4ApXeL/28qOSL
         J5ZZ+TVmCUP3cqWaEnHlrNG9d5s4uDtI+r8DS5GpmAI6Te5+PPhg0JPesMsJ6QkBBUKM
         i2T5E7+u0KUNpPzwSPIgIDhWBA0x55J8INy/+9T5mEzV2Ub7rIt7zSh4bB9QChjdbp48
         Ndc6bow+xP/wEEVhqSShIWQJsWlE7p19+1r0llK0omkaJDYaHRCgD+bcV/3pj1FMTVTV
         cqaMAtAzWTd3lG4iAZAgavUNbrYuLSPh85yDNfwJPgtXxhKdv5Whjg+e3B66BtLz82q2
         i0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942752; x=1684534752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecSGlantlLzvA0G9VPQY9TXgG8EZEn7xksLEzRIVmIY=;
        b=Fz/dPnM7+ojgw7wc3dkL+Mxu0mKEwdIfxqv1VGaiilCENR3E5DaelYE49aQ8CMTnHE
         pm3MpkepXcODCqUJV7RA2qlt48pSIKqDsQdbbHDbUOPBO+wqLd+C/8bB/YwcEa62gjrF
         32/9OHNGBg283ABNxMpEGp1yIR3LNvJ+nCMjxMV165na5coHGOk0Y37beRhLNr4+Oy6p
         hvlo+m0/0N3j5Pc5e+kQszGdoyTBWqUCdjBo6ccSIzj+Vg1qiyUY5XOiV2WCIaPfRH3Y
         SOFQQagS9dRPkdvcc/B5ueWb9c+2aGOJr94Lo0cVXPcagn78Fu62fG7HGrDMCADeMH9e
         D7Rw==
X-Gm-Message-State: AAQBX9erNf0tz6YnMjhaqWqVOnKrICh0TfT4w1AoIQshCzq+/ir0mcbE
	pmDMZqEipGxUEVehBk1ZL82jsA==
X-Google-Smtp-Source: AKy350YKfPHbIymM6qmHQFNTIkUnRhQSV2hEDBlfRu6z0TKA3ibQ947LdlZE55huq5S43nAipp/NMA==
X-Received: by 2002:a17:903:22c7:b0:1a6:3737:750c with SMTP id y7-20020a17090322c700b001a63737750cmr4095049plg.21.1681942751934;
        Wed, 19 Apr 2023 15:19:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
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
Subject: [RFC 46/48] riscv/virtio: Have CoVE guests enforce restricted virtio memory access.
Date: Wed, 19 Apr 2023 15:17:14 -0700
Message-Id: <20230419221716.3603068-47-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231912_636221_A404B1C4 
X-CRM114-Status: GOOD (  13.06  )
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

CoVE guest requires that virtio devices use the DMA API to allow the
hypervisor to successfully access guest memory as needed.

The VIRTIO_F_VERSION_1 and VIRTIO_F_ACCESS_PLATFORM features tell virtio
to use the DMA API. Force to check for these features to fail the device
probe if these features have not been set when running as an TEE guest.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/mm/mem_encrypt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/mem_encrypt.c b/arch/riscv/mm/mem_encrypt.c
index 8207a5c..8523c50 100644
--- a/arch/riscv/mm/mem_encrypt.c
+++ b/arch/riscv/mm/mem_encrypt.c
@@ -10,6 +10,7 @@
 #include <linux/swiotlb.h>
 #include <linux/cc_platform.h>
 #include <linux/mem_encrypt.h>
+#include <linux/virtio_anchor.h>
 #include <asm/covg_sbi.h>
 
 /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
@@ -54,4 +55,7 @@ void __init mem_encrypt_init(void)
 
 	/* Call into SWIOTLB to update the SWIOTLB DMA buffers */
 	swiotlb_update_mem_attributes();
+
+	/* Set restricted memory access for virtio. */
+	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
