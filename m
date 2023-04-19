Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B7FC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvPhld+Fiex6puhD8+XIYWfploKcFAI6sOMcot1tEI8=; b=XFHF3YINB8iEgv
	TaotIsXAQ8En8I9iQiHDHQZj406y7TRkTZtHEFZpPjYX9H+c9GicoDvREIRxWnyOWXCcclazzxDTN
	qygnb9T7zWsWzjQxv+AIHzse8WwE6l/A5QqmnHlWz+3tlW5x1mPTKYXDrYyDUXHur6kOi8TTrXHbN
	BV+Ui5v0O7Ai1XumcPJrCy7UAJYSXgNhHyjxPz/CA2GL2Uft1+dH65/goEcLlfrYX+btbu+LKHATS
	nTPLmqjuJ+zv9+ki+sDHz3X93dT4+sjDOxBmPvS7t9ZsKYlwY+WDs2n1FMVK5na04e2dqtn00nODS
	d6p2038atVtvStPmfgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGvE-006cFq-0Q;
	Wed, 19 Apr 2023 23:09:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGvC-006cFN-0c
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 23:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2k6fZhtBjuovD0xJN9/3Mss7sJpSj6M+Lhg1puIM9yQ=; b=V7gtSVrXJu90A9P8V7RCq2+Z8F
	dWHkY4rQomX03yj0axokrdoLXhj0+Xurzf70oim+s774CDw8x+jlzPg+Xzf3pF/pl/lw98Nt+JE8n
	Yf4AN7mQ6ARzS7+HUIzBntJk/mMuD9rgzPib13f+2Q714bLcwD4phox0TAQSs+Y/hFE8oFp8OeugD
	Z8zQ8RPDXHFX1atYEaJdnCz+jRkHNuyxIiAAS+Ndt6zf1i71BHX96mFSf6dRzasV9OG/cRTGJsl38
	0uJKCNU6ojEOydlD2YuRokKGFqJSSJjkaaYb6/GJLce3gp0Cke+lMhK0Sp7UhGPqasR+EPy2Who15
	VwS2hc6g==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDo-0021gI-0T
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:26:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1a5197f00e9so4695535ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943053; x=1684535053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k6fZhtBjuovD0xJN9/3Mss7sJpSj6M+Lhg1puIM9yQ=;
        b=frHFpOgJMj3IyT+0l6lF4ggQqLWSqJ+R5Lwl83JFjnZ1FgOj+RCeflj5OiteP2veXj
         hs8UabqlFhDeAfeVOqN8nsOlJjF/2yPcJvsYdreBOn4W0VsT07xnNPxxC9wRqCbEDrEI
         ZWpU6jo5/ivGxGl/5WlSrPuw4s+yWAlTdUEKKQGRxh6JkIhcKHr1ykdZxEako+r8BVLI
         Iia+UAGrprs58WkfVvjD7u2w/7WcLDjo2lLLRaRlMw3OivWlNDMPp50fyu9RdhML7Hv4
         wHYTWA+nkcv0sFjdO1RQEsLbEgouvwKngVct5OCtGdc8SgVKzfHhIkTKi03d/OSMpN46
         dypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943053; x=1684535053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2k6fZhtBjuovD0xJN9/3Mss7sJpSj6M+Lhg1puIM9yQ=;
        b=VugUWO0try83afKGQa31e6FBI6zlp/tk5QqDq8/6nVe20TeeXGWx/DJhEzCh9sE1cO
         Kvn9BPXN74+BS5zhqb0TlnHs8EJdnQkC+xT42ZqFt3mME6arN9b76ySeCoKP46O1GAI3
         XnRjPBfEa2Iirml9+UqU50VXARhf3eeVp3EMfcr+HdJ0hT0eqKO4kuIMXKWoz2lBPqS4
         ALjnEk4mRf60IwMl4CLwpqiM5xwhZtXd0Pps5JyTbFoSRCFMm5ku4ypGt4WA/703fFJ8
         41aIvFR1R05Rtd0rp8Tp/ZgDozBh11WKhF3F5+0TS10K9q8A1P64JZMMEn2dXHmelWyd
         G3Bg==
X-Gm-Message-State: AAQBX9evzSrC/TjP3PPFgE95leZcrcjiI6sgIn36+1kiJktMaSAB2o78
	Epxz1jvrmxduF8+3TKG4OaMf2A==
X-Google-Smtp-Source: AKy350a+wtlv0SH4nHUTs3X+REynERjZtWfA6CRUt3D8Ejpa/aSb6HljJIxaa3PlyPoDKWKx8hTZ+g==
X-Received: by 2002:a17:903:8c6:b0:1a0:42d4:e38a with SMTP id lk6-20020a17090308c600b001a042d4e38amr7048884plb.11.1681943053760;
        Wed, 19 Apr 2023 15:24:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 06/10] riscv: Change initrd alignment to a page size
Date: Wed, 19 Apr 2023 15:23:46 -0700
Message-Id: <20230419222350.3604274-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_232621_192342_A534424D 
X-CRM114-Status: GOOD (  11.72  )
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

Currently, the initrd image is aligned to 8. This is problematic for
CoVE where the image is expected to be aligned at page granularity level.

Thus, align it to 4k. This can be done only if user requested a TVM.
However, initrd usually much bigger (in MBs at least). Thus, aligning
to a page for everything should not matter much.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index d59e8bc..5f9b0d5 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -113,7 +113,7 @@ void kvm__arch_init(struct kvm *kvm)
 }
 
 #define FDT_ALIGN	SZ_4M
-#define INITRD_ALIGN	8
+#define INITRD_ALIGN	SZ_4K
 bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 				 const char *kernel_cmdline)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
