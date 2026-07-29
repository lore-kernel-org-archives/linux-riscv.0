Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89375C54F52
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGqEZTHXLXl9QqvOByzncEnS/cM39alC8JCZVH5hDYw=; b=wzNraKHGz+/+rV
	OH/3ZV1Go13PhV1vQ1K9BBsTevV+FlridhJxwjULyyFoYqu4t9kwlyeDeB8cev3GN+3CoGkic/k4n
	F25nSontwWEhP9+OPsLA+RmSpLhFZHD529Yan7RVTN09Xqnc7kStyrYcvgcpksB+RKfhcaXD6CKIn
	CFs8XjawhBTcRDp2r2NmukdGIXZnjfGdfd8ffZesfKopjzeX/j7nXV5sBY0SesU8lej5Q5MctE/P/
	BHM8dtGuVqtciQD++gAywmOyPQh7x2NVmjthX578asgRzo0e/Y5/bkcykyMagFha8jCKPRj2MHlPc
	yJA7DWZWr2IumrouOX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34e-00000007pRg-3C7W;
	Wed, 29 Jul 2026 12:07:48 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34b-00000007pPr-49ot
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:07:47 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cbb8ebaca74so341959a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326865; x=1785931665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Reyg7Uf6tDZ8+7RMN+GpyxgR6kpVXfUwi59Uf40QnCY=;
        b=EFsu1lqMD5VqwqAb9/6bhpKJ9ecJr//RGPDa/kDAhmIUWIEJiUNtafv0Qa7Ut7L1lN
         poOzoeUN+Zd/8z/3xykRtM3ec6gnWMwUNy/FuNJaxMghq/nb6ae8MiSMSsz40tPGncg+
         M7NKJq85/MIgMS/gcdguscZm7kATLMGodTfhfvm31ozO2BN2izepYoHqY0r7Y/DlBLWo
         M3nqwBov7fmkRgH0/y5fZC0M8WCy65ole0dqfLisD3XY6XoTb6W9fbhbM46o56axYzgA
         OOQ2GLBmHZ/7HnY2uJaI+tf5isFKiFtjWC2bRKH30q4T+5kugVSpytfKho3UfSS0bpZe
         9Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326865; x=1785931665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Reyg7Uf6tDZ8+7RMN+GpyxgR6kpVXfUwi59Uf40QnCY=;
        b=Kauiu4RueePNrTNRLKS4M6ZxmDkzyxj370afcF6rvYKO5BV8PYLriCHeZtfMTriLCJ
         jGuhBAXFjG7HIkgN69BERmy7DDNA/fDf4t7W1uOaNRwFQmNcSQ+tDarQV41WkBgcAGXs
         rDNtBGMHKsfVSa77V9sMqtNG/H9bp9GR9xg8Yz/6dPhu5P74qBJ/9C0C4gyWERKKM6HT
         3BkvD8hTTm34TbpxeLpsVw/virQUVcYG/zYxX/c9yo5n8AmDrP+V4mOGtpOZMGWY6yJm
         Lun0cabW7ekWClQR89D8f7unwGb+y5uGSK5Sv0l6JLz9e7Nk1D1nXNBIBCv4XznXc3lD
         J6PA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Oka8r5x6GPN/8jkfH08rElE74JItzoWBJwgKL/4UroRsq9o5dgk304twK5ofY+E7CpQ1tJKi1XcrPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS5Chmc337zBxWNq3k5ghlufV3OI+E16u9a9fkdBiY+f0MJkAO
	YlSkJk+0IqNGlxEcSNTbweLsWCHn28grRQdxikeddqaeMNo1Nbw/pT/n
X-Gm-Gg: AR+sD11/Kv3JHHA+HrSnL8IiUHIHcGOhfkjlpHfJrmFsALfH4yPisiO+0CffPT/89kq
	7MWH2XM41rdip8Pzj4gm7x9BxI8PrGtzO8iLbCo/znTEGOt3mWFHvCmVCbAIee1rHHueWUkCBdo
	2qV+vYPAf19tTs1IHMozH+qfM31nRXJLP2AiwsjaY+KFW7RabHLZYRWJ9kTomUlTrhqtFX8/HG+
	vah1/H7SocVZozp9M4W90RMritaWYTPMPFWuwDvYL4hZP66dp5JJbCGwA9lGcJ1KfqyuzVAk1iv
	RS4/ajXiXrd9SuoGKDhbcjZDLzKib67oBbpW37xkkCM0isAOUo4PjMFM1ZBpQMpG2AFuy0ef2MC
	HsvV7HWdwD6Z06FAVPQwG94QEyuCP5XbZMrikV8uc7cDhFsFYGcThT/fwdqU2NIyApJCism5FAi
	O8GC4eMKjcl/YU1L99qHLKgTA1dWYQdBLXeGNekWYdDiNM30LyjYb1GXbL1O/rI3cSXtCrDu8hM
	sQTQFeWKTdv3keO120dasRmEw==
X-Received: by 2002:a05:6a00:4f83:b0:845:c7f1:29fa with SMTP id d2e1a72fcca58-84e93250f57mr6434871b3a.30.1785326865329;
        Wed, 29 Jul 2026 05:07:45 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055133sm1309570b3a.18.2026.07.29.05.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:07:45 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	stable@vger.kernel.org,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [PATCH v3 2/3] RISC-V: KVM: Use unsigned int for vma_pageshift
Date: Wed, 29 Jul 2026 20:07:32 +0800
Message-ID: <20260729120733.829457-3-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729120733.829457-1-shanbeeyoo@gmail.com>
References: <20260729075230.743030-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_050746_049785_FE7654CA 
X-CRM114-Status: UNSURE (   9.98  )
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

vma_pageshift in kvm_riscv_mmu_map() was declared short.  Use unsigned
int, the conventional kernel type for bit widths and shift counts, in
preparation for sharing a common struct kvm_page_fault across
architectures.  No functional change.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 943d8dc72105..d2a06a54be17 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -541,7 +541,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	kvm_pfn_t hfn;
 	bool is_hugetlb;
 	bool writable;
-	short vma_pageshift;
+	unsigned int vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
 	struct kvm *kvm = vcpu->kvm;
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
