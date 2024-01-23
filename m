Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F0FC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VN/kudBp75GvtH9QSXZtry/q+RGT7hOhdKYquZ7vkTc=; b=bLdZHQtJ1+jkb7
	ekBsWePcYa210YRqdadunRB97HE9jFZQJ1QC0qTCtAQZkY9d7eES6ynKYCm90591/zzYFWwoNEUCI
	o6xMcvQ1SiM/uMFauZbywshair0N0T7oGpzEvgNOW95HkazuHxZO4Y8lL5ICjcx49M5K5stCgvlDv
	nc593AoB7jkaNYF0/qx8OcEfJLcxAJtdovNHs2gZXO5wFrroKTpAx0Kf12X6P28ep2tBaLqPC1Mgm
	hk/dv+miKPAo+9isbRs8j+2I12cQBrP+aez0UM6PSis7riZIHv+KIMCbJbiUwMkDgljXHNHl/N6cM
	WGU1kulNPdrFFKlOd7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSGoU-00GbbD-2j;
	Tue, 23 Jan 2024 13:27:38 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSGoR-00Gba8-0h
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 13:27:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3387ef9fc62so4039951f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 05:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706016453; x=1706621253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QL2GFdOO+kItFWYTRtC2kovPV4Gzg0BKVM2d6mHAVeo=;
        b=g06WS6aIpAyrzCHRFxXOMZ942F0vcZkJW9idOCutQr0ItAmGsT9jcB/xrADEhcMZw4
         luvai5+L0b+sd7Er2C+W0dxh+bcYrNN5FjiobTovZpk+/C/ahLUhBum6zlgRVfpGozTn
         21Nu/izCU63hRseyyNbJFYlUtBvUzMNqnIZA3fFj+jJ2vt4TWBcy3+0a6/7fABPcgj/J
         6En0PqlgUDcfAHwvj7Kllc8la3xlOTyvtIf2MYHLZYxN/I8S9UAdc2GUbKF1NNJ/gsbQ
         3CmRtLQyNtEQWsr8yurAc61xaBDROY0YhDhuu+2ynskIpKZ64SX8grwtrP/DgPve+xtq
         j/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706016453; x=1706621253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QL2GFdOO+kItFWYTRtC2kovPV4Gzg0BKVM2d6mHAVeo=;
        b=DjeR6G/uA/wtt+nuwYVHQqQIYQArh2/ZmxpGyKOXWd0Ix6GPyTRc0PkEJhYpVLBrOv
         4UQwSWaLrRPVFpjKVWj/34bmxJcxzYf842TMGdYq/UoIj7pA7Br0hmYnOKBWyYlsw832
         n3rYWN9AbDb/crFIydJL/6LEDwMEl6J2hf5Fk6Ar/NSXKIaMyY9G1XOk5YuywJAHKMl4
         quZZpoZHCpKktjB85E1XPYgUnfsz+mRjdL3ydjkyYtjWmBwLvfqN+9pvFv93g/n/pszp
         ROPWqKGrIHvGQ1UpFbL6f7BdKQ0O4z32qmxpSxEzJDBoJXmsNMcy+PZED4MU5RRHQy24
         7a/A==
X-Gm-Message-State: AOJu0YzbnVPXa6hx9YUp2z+rOFftRPvNY8Wr7+DSra1+J45zNPBM1RYB
	B726MNXvp7Y7PfLYTXjGncHaYUtNUlbkMHp65MwSZdRXRVbmQM5tH1ATDXyW4hA=
X-Google-Smtp-Source: AGHT+IG5XIy+1vzarPkJNH17F+T3vYPOYhLpPlb/4qpi1Gz3DTxWN1NwgqXH8kvpbyFb4ZjOd0Xacg==
X-Received: by 2002:adf:fdc7:0:b0:337:70cd:a02f with SMTP id i7-20020adffdc7000000b0033770cda02fmr3005386wrs.9.1706016452996;
        Tue, 23 Jan 2024 05:27:32 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y6-20020a5d6146000000b003392f625adcsm6652270wrt.36.2024.01.23.05.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 05:27:32 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Dennis Zhou <dennis@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix wrong size passed to local_flush_tlb_range_asid()
Date: Tue, 23 Jan 2024 14:27:30 +0100
Message-Id: <20240123132730.2297719-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_052736_262896_1ACD4A47 
X-CRM114-Status: GOOD (  11.44  )
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

local_flush_tlb_range_asid() takes the size as argument, not the end of
the range to flush, so fix this by computing the size from the end and
the start of the range.

Fixes: 7a92fc8b4d20 ("mm: Introduce flush_cache_vmap_early()")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/tlbflush.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8d12b26f5ac3..9619965f6501 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -68,7 +68,7 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 
 void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	local_flush_tlb_range_asid(start, end, PAGE_SIZE, FLUSH_TLB_NO_ASID);
+	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
 }
 
 static void __ipi_flush_tlb_all(void *info)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
