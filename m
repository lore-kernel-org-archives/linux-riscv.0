Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278D2C43602
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76fxOa3Hx1zuJWiREHs9KAKAHhT/AGiErN9qsIWWOX8=; b=kIMP1lzFewhBEd
	/S/2Hcf/zrrJSxKeIHrxS10S4XI183UBanVPUYOtxAv5gY5l11ZEizOCXfS/a0aiPYJguiJofaKCm
	Xmfl9yNrxK9OKQG8wLyrYeIvRdOEHfQPk5Eq5Me93AKlBgJsm2APKZaBNDeW0UstrgAVaaQ+O8nNI
	4lraZE6GlLzEPd8dPp8gTmS1PefFwMnNDENsdCG1PPLi+eienfe3RThaoqtk+GrdZLDIPg4z+PxLa
	GuNojkJAUgD7zlznZl0PaXiCdPUX0LF3UUFs8UHCFszWT3tqgBonP6cDiXeafWoJwYu/KolcAgSAH
	cqW4FlWsRmMcE/Mj9jxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTC8-0000000G9JC-2hHQ;
	Tue, 30 Jun 2026 07:47:48 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTC0-0000000G9E7-0FGX
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:47:43 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-36b9d265355so2053348a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805659; x=1783410459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=T1wSBuc6g2j0NttgVPFu6Jp0dmBuMD+XRqQTk7l+VY8jsXNfUJ3hlviPxU8Ct0G2Ad
         psOLcavGd1g21/gEusyNj2gLPZUzQE2mD3jMbbdmndAt+du1SygmSoNpY1bjnzhChcpe
         tsJ+CdNIlXePb2hvIqWC/4Rv8ym4+vh4qosIxfuOhOpRkl67BNHQmTMo03uzmYMgsMgj
         AvRmjmOhY/7U8AwsIn0Vl/MIMh2dU4oepyohJ/q/p5mh52KCN+v6ElXcjefQeRdAPvl+
         PELofXxnenmTXcjhZevynqNgGCKfKDmHyiY6Ag8gsES3hA9ci4u3qzHHLtG4dviVTWpf
         S7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805659; x=1783410459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=WL9dbKHsVle4ML0qFofQrVyq3yzB5bTJZT28PPgoGSRCOVGTSP6C0sAwQjuYBDszcw
         Jd2EyziCz6xe/vKxIR4d5JLUAwydERjYJs28vZUjddjVAWQmdeIOrd6ezRwPpPy7YHbZ
         q2glxGMSt6fEMzWEBR3WQXzNg9e/8SBvhPHH2fEjQk5Z2YAmtv6LUPm2rxaNOnCLgAOu
         dJEJk4avm/kbn1YUA/QIY8deju4QK1+aOaEjhRRwuBung62Dczl4cx19Rnb+zfpLPhiV
         1iou2uP25cguMHuCC7ZNolUsTJvYkJlhAblQBXX0z/91SAtfvLJgc05QVu5THV5nfLEJ
         F0uQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcZeWgqO8NWC18QVn3jymRaogHHpmsChuxoLmlA+vBTW5GciJIv+dbnqfrCc/lcEidWRBYhT5d59A6IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+6g+Lb6qTcZXoJ+2sjNkMuaz0m3Rn25V1LY79Q/67FT2pyYtg
	7yU8rYJX4OLgTb9ZnhH/qam1KIe29JTuP/St1fOGfnrbRpACq+arEzor
X-Gm-Gg: AfdE7ckYbVxxWkF2RSM3L5/O0gK4grzeFH8Q+T2aEAp4hY2ol1v+cx8gJQ1j5N2knAB
	CpqRIYI7MwEvCNiCHZYOK7sekcNeQpwIIMYj3Cx4OHTLfYky19u4Mlmn0kQbPPBo/Z2q7Hj0ny/
	H2d2Ja4UhW9jCLuBtLC/Oay5I8TBchRTRxkk2JoVLBlpiWqGVf+mAPTyJxW2Sbh3FWiXtUVgqtk
	ivI+Ei6FwkmRmPkyhAsiXKy53uJ9i2vVTTyV8GOKZF6QdUuXjRLjoA7t4QG3lY8EwDKXW6g3LrZ
	I4sfCxhmzBM5L6zUVUHj+MQYWQQ8hNcXfKdzBlwlbsxQFWOBV7ixtxhLmrlXKm3a05LMToJ2CdL
	zDopGG5OrI728HHpR+ZvzbbwLMbSDvDLy1y9EQJt+qpjTP33rMfb4B8T3/vIeU605uGZq1UlWBH
	IO6oA2NkvfGBc1JqGreQIw2dDlZw==
X-Received: by 2002:a17:902:d58f:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2ca2ea33e96mr19629385ad.39.1782805659205;
        Tue, 30 Jun 2026 00:47:39 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:38 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 01/10] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Tue, 30 Jun 2026 15:47:05 +0800
Message-ID: <20260630074715.4126796-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004740_094286_73A015D4 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that excludes non-dumpable reserved
regions from the kdump vmcore and will call crash_exclude_mem_range()
from generic, non-arch code.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 include/linux/crash_core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..0033d4777648 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -87,6 +87,12 @@ static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
 static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+static inline int crash_exclude_mem_range(struct crash_mem *mem,
+					  unsigned long long mstart,
+					  unsigned long long mend)
+{
+	return 0;
+}
 #endif /* CONFIG_CRASH_DUMP*/
 
 #ifdef CONFIG_CRASH_DM_CRYPT
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
