Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EDECCF9FC
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XNKHxWei+t50zNSB9i+3jTCgC0+WQR1l7RNuaJ32/o=; b=PRWNuL0iL71e2n
	J2c2LLd68GujY6A0ikbEelyF606A6AaYrqm2IvR+BLgYgqg11qhPKgg5w3/muYRW/kUskf3vH0Ueo
	GiMyYWZaTu9E4NUScXAqNk2rfq586m6AcQhx30CveXFh2fr3jrvFVMuRtzyfE86aIDlvLy1ztrpbd
	O2f+CpcCU/7ENGgecgA+KWoSz/Rdauoz9RtAkReXQnK1tOKAmtaN6sBtmdIvAuBgQ5OmnYxKstuq/
	1d86orL5bVpbQWkMJVtPNQVjvxi67oZ5RGvY3+TGitwRHMDdFiFaFt4Nw2kBaXTDZXEjnyx77qRbk
	EU1CjICj4w0JcouohWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9J-00000004GB2-3hlC;
	Thu, 30 Oct 2025 13:57:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9H-00000004GAa-3azu
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 13:57:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-294fb21b0dcso9624155ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761832627; x=1762437427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8VyXh52m2HmF6WkbMPxGheT256pmfI79AWNunisbZ0=;
        b=hfkxbs4A87qWLsUYc/gXcgKzIjl6V9491Y+hHpHMZvALmHBXGdmtY40ydF9RSY7JO9
         SG8ykvUYLnBDojGBa+KC+grL4AlHxp2w2jbRA1DhdxACygAlOyfWBYU56aQJR4LMTPw/
         KHTtaaN5sSE2NKEJTO7Oe+SERvDS2u2lqZbhY7MSSWiNVUwmqxmK8/nX0TbOgemz7XII
         hRHP41frLY/8doEegl6FXxOmrnBGU84oQlkx1r66r2THOSikAhGwBWUV0hfCRWx+AvDb
         vbTwiAZsz3hV0AIq/+yowArAmVrthqmTGjX5z9MtarRpe/Qyv1WSzttbs7F9xpOB/vFs
         xjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832627; x=1762437427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8VyXh52m2HmF6WkbMPxGheT256pmfI79AWNunisbZ0=;
        b=OaR0AtZG1u8BqoOhzc7dXTfuWAQ9W2yPl/8BqUqI0ymcnAQJ4kW3dZXkS+7GhfpN9Y
         FEx/8eVgDfFSJAnX4B0PBR7Md/VoqO9fvYUi19NNnJL0tJGas9Q9vCs7YDckiUaCQSkz
         JO4h+Vv9Ry3zgwBS1h8k1Zi2y7Knk/PKV9CHX13TN1PU8BbLbvcEVoLse/UdOUu+b5yi
         T7r4xrfaWRMgih7ZkfLtkp+H4UaBbBCVVPkH+IyHtqPWcWC58t4w8imvViHzPGotehah
         NaWbeW/jpovxO5I6oeR2DmuOI+tYVft+ghSh3JS44Lnx4Zi6QL5eDb7h3g0/33KdxYx8
         TQHg==
X-Gm-Message-State: AOJu0YxFm4XwsqmO/Is0RWCleU83rMKoVZPQnX/+l1EG7h/9siMyQL9U
	O2lBe1PtgrKGZlLMiG9h606fWGZGwl0kw+I79f/Eyr+cu2crbvbbHSeOKHBGMQqWfeWO9IXoGGe
	1rT9oCbQ=
X-Gm-Gg: ASbGncvLC2zda5pbwuwOeotRjaKnGWwXJbPz++Mjz+RcRdtj0+hFPIKzrfY+x0E0KDU
	kA95SCh1Cn022MLLy7zukXsJPCMKONGtoaI3CTfIT8zCuhtQszRHCSyOCoj54NlYiRdOYI/bz4L
	pGRN9jnsKJ8+3CAwmoTEEx0I+jtSizJWvpS/JdzYN9gMtVackXXFv49sZKi8OrhMWbPAgEm6GpK
	zZEkQ/M6fsmr93/jhPGlkKokoYCcAch9vpM21s7IT5GNq6OZ5VzSvw4U/cXbwLCu9JZiIs0PUIQ
	PJ3B4GLTLiPDFQLvlqYYHAz1sdlZoCuJDwnYqS30YTC0C6c5YzXTY7U4a9PWrCKBBmH+W5cJukt
	s5cYguZ1/HVOLzHwSLi6agHO+KwqX3cH8hRq2twH0peleFbV57foB6gd6oeihoeX+RMv4FQ9E8W
	vmlmfI1tqksc0NhgAGto/+BWn3Ey2BrHK6iQy3jeVeylLTcNWVBezR8MN5v6JeMMU=
X-Google-Smtp-Source: AGHT+IGCoAuBzTrQiSWc/Ld2jXG5kw739zrV1CLzqkJDo2K/6TZfdSsStOQfI7qh++gzFJ3h/uvC5g==
X-Received: by 2002:a17:902:f550:b0:277:3488:787e with SMTP id d9443c01a7336-294dee0cebemr84296405ad.12.1761832626724;
        Thu, 30 Oct 2025 06:57:06 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e495e8sm187071905ad.110.2025.10.30.06.57.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Oct 2025 06:57:06 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v1 1/4] riscv: mm: Introduce percpu loaded_asid
Date: Thu, 30 Oct 2025 21:56:49 +0800
Message-ID: <20251030135652.63837-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030135652.63837-1-luxu.kernel@bytedance.com>
References: <20251030135652.63837-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065707_896067_0B46090D 
X-CRM114-Status: UNSURE (   8.96  )
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

The percpu loaded_asid records the asid currently used by each CPU.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/mmu_context.h | 1 +
 arch/riscv/mm/context.c              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 8c4bc49a3a0f5..fd532f8e8d057 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -39,6 +39,7 @@ static inline int init_new_context(struct task_struct *tsk,
 }
 
 DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
+DECLARE_PER_CPU(unsigned long, loaded_asid);
 
 #ifdef CONFIG_RISCV_ISA_SUPM
 #define mm_untag_mask mm_untag_mask
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 55c20ad1f7444..4d5792c3a8c19 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -32,6 +32,8 @@ static unsigned long *context_asid_map;
 static DEFINE_PER_CPU(atomic_long_t, active_context);
 static DEFINE_PER_CPU(unsigned long, reserved_context);
 
+DEFINE_PER_CPU(unsigned long, loaded_asid) = 0;
+
 static bool check_update_reserved_context(unsigned long cntx,
 					  unsigned long newcntx)
 {
@@ -193,6 +195,8 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 		  (cntx2asid(cntx) << SATP_ASID_SHIFT) |
 		  satp_mode);
 
+	this_cpu_write(loaded_asid, cntx2asid(cntx));
+
 	if (need_flush_tlb)
 		local_flush_tlb_all();
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
