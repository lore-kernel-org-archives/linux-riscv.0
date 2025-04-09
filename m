Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5A9C369A6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ya0zyESDSFhd3EODjKye0aAR6Ke/2mrYxVQ63uxt1g=; b=UojstXss43goS2
	DiirZulpoX84fI7ewMljmhrPJ3YN4Ts61KlHcq6A45uiIjZpk6nPOruxyOL6qDpuF2AQUN7Qh61CW
	+5x+6C9qCF9IfyiBUT6l9gAb6YYzoHjZhiw3M9A6GzhF7Zzvv5unomg/+PJGiBgIf3uywUTI961Q4
	H2VDOba4eCA6SsKmHCHTx3KfNK8bK7iZREaahKaB3QLnn1ZSZnWyLSX2zlfda4H6MOX5Zk8UMVdny
	uIQbY5SnQMAF1anmLMLddYSzRmPap9vxhzdoMyVWG+WlzxyxChQShKeSwvgAtq1zxSzEv3Uv6ycKa
	pIybyTLWhXeGScikoI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z1R-000000080ws-3qrY;
	Wed, 09 Apr 2025 17:15:33 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z1O-000000080v9-1aqF
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 17:15:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so1064691a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744218929; x=1744823729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGPJJbzAC5lBZyjwN2/E/DuVXerJO+U7adFkynbBdr4=;
        b=hrFGyGgdiEgsGGuC91NJFZ8I3kezVkxs0SGe6Q8OBiYzWe7gICPYXv+yAj6bdHvxFS
         di29vvYJVrgP3XPlRQL4OOCy5lWRjEBWFgwfktiFTWeLQGqxOLR7JsI9UwzS8Du5gssf
         eG2Bv8MQMbABzcatq9+lXM2NEvYN1IntiaY7LgNoxQipBlbqKby1QyeGAtzmQryLp6Tk
         7teRFrYP1MGXodadT5I1oruWt7uTmAE0suNnxzzY/ILjwmtBm3DxoaJQD1W2/EAAnFS/
         gYfEjzz6/73F26XqiYf8UlioNQUeV3acf+h9TOaIMJYiM5Mf7HD0mebcsiVhOgMrG/zW
         zvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218929; x=1744823729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGPJJbzAC5lBZyjwN2/E/DuVXerJO+U7adFkynbBdr4=;
        b=rc56vqQNFTObrcmRFxPTf33ldM+0Wlau9u3IJV/BEr5IMHXDtDD0zVmw+WUAua96aa
         Pi7tAp9v26pOd4nb77INLu+ttGhScEcWwmJU0xwBxAtwjb3m/tu7HA/AhJ9u3HnsXIFn
         nYBYIn375ZzOMLO1ElqaMXetynUu3UtdWuNd1cbkN503KDqSofkqQKwtyvbSIV3wCzuT
         fQ3lCHge6voCQ9t/45suAyqZ0e5mb3EkFMI+vHKq4SYehOE5lVIsZpKPTD3qNID+wNga
         o+25NL7eSovAYi7s5NnKESr0FuRliX4BVi63E+r2V0xYsrIBi4V3l9Mla8nxNK8WnbM+
         gBCA==
X-Forwarded-Encrypted: i=1; AJvYcCVaADGiYqFVpPgCtHX57m+wovaGGd1+uJ1W0AutI09axTqZuv+gFyhZHhwr81EMOepaFhk64uYN7Z4fvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdAP804+TEyqvdn+e+dnM/vp03Jo7ee55h6oDEMQJ4e3BYD7my
	CcKFjmPHkkmhjcG3isjzw6GQLlnHyUOm0wtqGIsI9HOrpDEp3UpEj1saDL6lC+Y=
X-Gm-Gg: ASbGnctwWrjf0yiQ1hW3NXN2K3Qwzi/sFiZ2Sm1RUMHi1L2TERZi8roDOLAa6N2jls2
	hS4sQQ01oZBzPLOC0lAY7SUi+RU4swB73t0N+EvwfldqCJ6VixOTG759jxnh5RVFD0Jru2XBTIA
	keKd7YcnyGLz3EZydCsoq8uMXa33F7g+FKsMZ2AvPniP+9bs5UwtSNa7Qm0qJPTsEubhX82JlhQ
	U/1W7/GG9MtmFPFVgIl3jiIUV7wXc3c3+oLfHJnwCpH6M4OdTM6gguh+Ishzk775MRVYENfnbVT
	bc8O2lXi0DAbMDSnxCrdgUTyNp5k8TBlsAR442Q0bGqv8YiK+sSwBTEpTk3aJeEA5FjZNAo+Ug=
	=
X-Google-Smtp-Source: AGHT+IEqsyTfYHLCje1zAIyAh5//QPvZL/dx0cm03t3noxDSF5dYrGFWkuIW3HvIS7cUU3Gq7Cnmgw==
X-Received: by 2002:a17:90b:5488:b0:2ff:556f:bf9 with SMTP id 98e67ed59e1d1-306ec2077femr400073a91.4.1744218929505;
        Wed, 09 Apr 2025 10:15:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm1721650a91.47.2025.04.09.10.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:15:29 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] riscv: module: Allocate PLT entries for R_RISCV_PLT32
Date: Wed,  9 Apr 2025 10:14:50 -0700
Message-ID: <20250409171526.862481-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_101530_416043_D4132CD0 
X-CRM114-Status: GOOD (  13.07  )
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

apply_r_riscv_plt32_rela() may need to emit a PLT entry for the
referenced symbol, so there must be space allocated in the PLT.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/kernel/module-sections.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index e264e59e596e..91d0b355ceef 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -73,16 +73,17 @@ static bool duplicate_rela(const Elf_Rela *rela, int idx)
 static void count_max_entries(Elf_Rela *relas, int num,
 			      unsigned int *plts, unsigned int *gots)
 {
-	unsigned int type, i;
-
-	for (i = 0; i < num; i++) {
-		type = ELF_RISCV_R_TYPE(relas[i].r_info);
-		if (type == R_RISCV_CALL_PLT) {
+	for (int i = 0; i < num; i++) {
+		switch (ELF_R_TYPE(relas[i].r_info)) {
+		case R_RISCV_CALL_PLT:
+		case R_RISCV_PLT32:
 			if (!duplicate_rela(relas, i))
 				(*plts)++;
-		} else if (type == R_RISCV_GOT_HI20) {
+			break;
+		case R_RISCV_GOT_HI20:
 			if (!duplicate_rela(relas, i))
 				(*gots)++;
+			break;
 		}
 	}
 }
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
