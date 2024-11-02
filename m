Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C091E6F099
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QBzUFA4N9PxCfzT0yBRcAIEZEiCQUJJzH0mYBU2Kjg=; b=WssvsGy45xmzV9
	QChoG0oaNV6d0WUBp1KJ1a/VQG/rZA/zsFUMvz3QDAEzhRS/Cn4vbc38MoQs1BPcHew4RYoCycKEE
	ip4313wqIizHiLc2Ihl8IivDtLO2o2UGz9FKs8tnJSlbfjLGUdooj3RFd/0iv8B0jNBnvbnVnzqXp
	mmFBR6kVQEKQvUAYtdVrNGAHDVS75MNhqbmPAFnmzAcdqzgiyrYzbr4J5GPbeaprHyu+DN0zOUKRI
	HYmY45fFNgKsatEIcD24Agpe7o9i7vraK8mPLaUaGUBYQPGAybG6krqliChaeZUbeEidGawrWk8L3
	rUihrX6ueB0U6fW+925Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hP-00000008a7d-3kgE;
	Sat, 02 Nov 2024 00:09:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hL-00000008a3t-2ngw
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:09:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso1867945a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730506139; x=1731110939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj12kTh6O/rQ/Xl4Qt+B24adktPEP3DMoxSVhcVbOAI=;
        b=lFgu6dCfzcCRKmcJgikWpUHNKbb464K9yTLwEaztQDvq5pkHtZVOQ7SHJjm9D7Dwea
         h7/s9Sl1ldkJWwlTnI9nOxzywQPIpOTZLO5GcLz/OemA/8aZjbyTROnVnsYMaJgJ2gac
         vdvo3aHn38uWqjD2iG5a+NxP4saEH34fRxIhgm9Ikj/Fr9DSaxV9hs/NkJX2i1ec9bKx
         9T4xsg11PNZMIqJPDSAP2wYB2PFKQcLCBJ+eG94Zz2tJXB3cfajIu4owhiLkkYJrC4dM
         9kkUpSTmR7g+Ig4ryZkZmEvib6/nf4ixEQBdl6clFpIo8TsrerYEgsGKbkzVQ6XiKwKg
         8jyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506139; x=1731110939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj12kTh6O/rQ/Xl4Qt+B24adktPEP3DMoxSVhcVbOAI=;
        b=dY67DGRNlt9Vex4azZXpEk+0RumGqzQOX2C8eeg5y3HIlvaEPkifdns533ANbmcm6V
         Yoqhe6xGy1IyU4ni5lNHgxIJt5QGhXBbmd5lCJC3H2v0sZUpe6gqZ827zTUKD/+dRJCZ
         b2AWLBWDLHlkbWsLiGinVfFxGFALoYAtE4+zHZ7HZ1RjhEepqBiaS5ZfVLYV/nyOLB9j
         aBkelQb8Eq3SSacOo1i8nNZH11XL3cbYfC7DAPVsFDsMBxkyELmpvRNSmilH+WzOBgBi
         3RG39G6gKfVjbOZqKLaMexA+1BoHV/SQmK7E+IAEAUN6LipnYBaKdriHxRnnvSSe9VYT
         Kzaw==
X-Forwarded-Encrypted: i=1; AJvYcCUXi4ZEKB7Kxb0MYRF8tHvM91Hb/8OMQ8kwalh9VI5mSzxRYYv3PxuaoVYFiEDuRk3vvm95aToDbtraJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMHKjgpGu1QsBKL0mKbFUTDteprpe3MwTSDtKaMIBky5Wm5Qcr
	MhS3ALqMt9M3yTcsFCQ8cftt7drTPOLGNWRQ/led3P1hE6WtAVHr/v4Ij4gy6ko=
X-Google-Smtp-Source: AGHT+IGji3cval3a5wb8acdD/53zei/e3sJ2bqSexeB5xbUIDHdLdQW6YclDCN4wNPBQMFu1+TtgTQ==
X-Received: by 2002:a17:90b:315:b0:2e2:ba35:356c with SMTP id 98e67ed59e1d1-2e8f11dceb8mr25968856a91.39.1730506138674;
        Fri, 01 Nov 2024 17:08:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc00856sm5505749a91.54.2024.11.01.17.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:08:58 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 09/11] riscv: alternative: Allow calls with alternate link registers
Date: Fri,  1 Nov 2024 17:08:03 -0700
Message-ID: <20241102000843.1301099-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241102000843.1301099-1-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_170859_835673_A6CD8A05 
X-CRM114-Status: GOOD (  11.68  )
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

Alternative assembly code may wish to use an alternate link register to
minimize the number of clobbered registers. Apply the offset fix to all
jalr (not jr) instructions, i.e. where rd is not x0.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/alternative.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 0128b161bfda..54d79e6f4afa 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -121,8 +121,8 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 			if (!riscv_insn_is_jalr(insn2))
 				continue;
 
-			/* if instruction pair is a call, it will use the ra register */
-			if (RV_EXTRACT_RD_REG(insn) != 1)
+			/* if instruction pair is a call, it will save a link register */
+			if (RV_EXTRACT_RD_REG(insn) == 0)
 				continue;
 
 			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
