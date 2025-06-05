Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A662FC5B543
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxaN7KuxeFyeQMJL2zvnJGwcdl1+GAIdJ1l1yEiqK+Y=; b=PA/fESL0PVLkgn
	9lWlhVlaPR7qocvMwUSrZ3rPrCWdEzyrcodzUQefFX8eEfp4NpR1NiWTh3NF7Tx1QV9SOjaPlADLs
	sTCcYEp3HjKTItv4JNdnr64YIhEPGsz2Jhc+zyCR9RBwIN/+iVR2XHJbA8qpks4/3/nXcscjLeDU6
	ySNtB9V2JZab4W3422LdUHpX2zXiLYA4f+XR2InOyijsbzjM5iNJu1RA0R+GeK6xO7zFmLXz4cDyR
	ECZTdDpfG/zYRiP9bz3kzX1fdeY584vOav1eJ+mApYIl86MMARNsx6W3sm+GkGNRUK37S9am6xl34
	V8Hvuihi7BevLlK4EtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t5-0000000EpB3-1FPu;
	Thu, 05 Jun 2025 06:15:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sy-0000000Ep3D-3jcm
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3121aed2435so650043a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104132; x=1749708932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=297HQlUGPdF+XZ67B7Ks8toSmyeODGGOfBIq41lD5gM=;
        b=A9ofncOWPPk4FqmPyziugPJb5GuMYRRTeNiXD0ibGCP2m1x0OalJWYOw4jgsdxD3Z+
         M6NWNe96l8z0MCOt3D4t8aB48wM9cEbMBxtrlZnOXozkLf74hTwtI9ZpryyBaYMCyQ5H
         caoPpMYESr80jpXTZovhrAs1enmZIMPH34+xjy8SGGoIKZZLnqPZvITZYFB21BPsej3s
         yFwFqnalq1oks96YkQAH+mXr+/9arw1+Fofjsju2AhEkp6yYPuk+vOCUqy0w1U8ptNKh
         Sfs/c4eol+2vBwkfYd7bdNlm6jTwo03w4rPFRx6FpHI3Vq/9qqQmiCWFZiW7WR49h4Zk
         KBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104132; x=1749708932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=297HQlUGPdF+XZ67B7Ks8toSmyeODGGOfBIq41lD5gM=;
        b=gkBFtxt6XdDGqEEGvIS4GYNo0VexcRgQh2qqM2NnU/HXj7UxFxAVlhn+hFod2EmVzr
         7rifR1JrPCy/9pbIHRQvhkUkF6u+NDUaJI7VWNA/+ok06sG7Xby/ojAKMm2i8lzwWhH4
         U7AuDBM3uyXH/y8SZtLPdfl39C+ycNh5xVxvm8ye8/Ind12Jhugl8Xm2dkcVRHjyakcE
         5I/xjQ5jXAoSjd0WyCMnOGzLr7ifQ3YOmuCQ3WcSfIKDLYK3UOGBHiKzR9OQKRlC69uA
         0N7SGppPyJdN9RY9ARPXu6xtCmReyJfoRhxU2Wt1kHv4gGhojwggbv1QxzKuP/LMA5T5
         U2/A==
X-Forwarded-Encrypted: i=1; AJvYcCUXdD6nrmQfAclpM30yKmHGf1Un5mHJ6Yzv2KJyYJcWouLQNk9ODtVRPOs5k/I0sS/vtctclhPOH9RxDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoB7f2tAnuUWaFKliUELH+bXEY2/7YbMv5CCfZetG7htHOCZUT
	C98gFGPxecBMS7kNHusm6PKss7OsvstjP3fVl6XZ1ybT6ACpWar3YgHiIItlIqmVkQw=
X-Gm-Gg: ASbGncuzbwCWYk1lMW/uLGSdIuURg0wEEboGSYb8yyyvPZ3XF+TBgiHMSkcHW9ZnyZ2
	aC11jJRG9HijSrFJf3XoHQlRWyFyGiyipIJhEov1oznO84DIlPjH+/+XfCLlbj/2rDDgpifN+KA
	OVqisaKrOc0HGRlh/ZUnIDcPNrb98ff3aT4zC0WSOgOPWXwybpSsmDazQTXqPd0GILyb2c5NPvS
	aE99YRA73G4GiNSPwj+zRhxDamUfC61Lu2BC/EwycesJGg7JH4BDgeim4c1bSfYxR7+cee9uo2c
	X1E/Xl3NVeJtV8XlzYQPV/dI4MUE3bZLrlJxRXGv9Lm37pYdPLzyHg6s8tk+9rQw35Om2usJHVT
	HTB1uTg==
X-Google-Smtp-Source: AGHT+IGaQDp4t9Rc9PacdM1BZZoSLCIgCU7kc4zabKe3J73B2NovkDFU1CUL1ahoIxkagRn4o+A2cg==
X-Received: by 2002:a17:90b:2641:b0:311:9c1f:8516 with SMTP id 98e67ed59e1d1-3130cd2c648mr8923161a91.15.1749104132103;
        Wed, 04 Jun 2025 23:15:32 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 07/13] RISC-V: KVM: Don't flush TLB in gstage_set_pte() when PTE is unchanged
Date: Thu,  5 Jun 2025 11:44:52 +0530
Message-ID: <20250605061458.196003-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231532_931200_94C0D05D 
X-CRM114-Status: GOOD (  10.05  )
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

The gstage_set_pte() should flush remote TLB only when a leaf PTE
changes so that unnecessary remote TLB flushes can be avoided.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..d4eb1999b794 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
 	}
 
-	set_pte(ptep, *new_pte);
-	if (gstage_pte_leaf(ptep))
-		gstage_remote_tlb_flush(kvm, current_level, addr);
+	if (pte_val(*ptep) != pte_val(*new_pte)) {
+		set_pte(ptep, *new_pte);
+		if (gstage_pte_leaf(ptep))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	}
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
