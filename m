Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E17CCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/jKGUyI0TIk7viOlC5zH8E6gDDghys9cK7juPtF/pl8=; b=fJo+WkcQWFp8h/
	IML5pklPYJm51jisW1n9swnnwSpyk7xNF2AWkEbbL9xX0BnA29XyHZz4tThMNdKVoen7WaIhptO1K
	y+MEFg2yhHNmJleJIwbQXRCxLm5l5KYMI3LKy9Qint04+leG/CUr0HAh5QAVu0Wv2mIq1RvMLFTyp
	26s020Q604yTBVvt3ohxzxq957ZQVIyiUVu+GecTJwqtBKEFAxo8NLgAmHQmoDFFK9At0LonYBCeq
	qc5PMXwrwAQTxiEH5/jb3a8fwQJzNwnkpOHg5DSQ4xzNc6h2U4Laz/T3t6nndJCRT7y84ev1tgKvP
	JjxjGL8ryRS+1pkVYf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCwuS-0000000CCvS-1K3w;
	Sun, 26 Oct 2025 09:19:32 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCwuO-0000000CCur-2gHk
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 09:19:29 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so3431013a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Oct 2025 02:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761470367; x=1762075167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=udg3CwQcBQ0BBJcZyhfktrzA11lxinS2ppEpd97MHiI=;
        b=j61ipRUU6MyCqaa+VJ5SxQTrWq+Dm3tSEF6VTCUVIY+DN/x2w65zvncUY04DlX4V/F
         rGqg7lkrog5qHkEs04i391Q4xzDqbPUhb01SrpOJS7VKqsIQqr/90fsbl/tZdJanLlo+
         iyTY+YpMkEhb52Dg8l40SHD/CSUtvFP9IJYxU4BY0KY3PqSnvxjOUT4s9sDvAWbReaRk
         Y0LPOHwnZ3Ee4u6Foc1oxMWYBc6dm7Sppfx9ofcEj2PLe0Bgiw/U4F0dUjkrB58zKalz
         UCkLjkBANQ4hxm0GarJxzJBTJnDl1fzlYX6onOfhG3nwnRbpJSIW/b5ILXxLgxlXCRXt
         YvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761470367; x=1762075167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udg3CwQcBQ0BBJcZyhfktrzA11lxinS2ppEpd97MHiI=;
        b=ksms7VyyfpIhUD8eQoX8ObPOyJuBuHJri/UNMDxOaa4Komyt4G4hhywJmCguS4FzKW
         D/K5EvZjMebEweyY64CL+kU4uB4ySRSc6NlsuJfrkafCnnVGExdIIVKr5ApztTncPr98
         xxwSARrNRrGvmiJPr8ILb2U2zSgV06EAKsg3QW2n3FM9Q9tvaDIiX91ip+zh4R7PXyxB
         NkOgJk5evrgr5ltYrVOBORuO8TdX/YhsAgRMZChuA52K/OCJpYXnToOlwFqHPZgnS6/r
         HctHizkyWUAEajCdS5zgGDfariMDTNAwI0nakjAIqCYzyl1+nRydP8qz4UDPZ4RjX/uC
         SFIA==
X-Forwarded-Encrypted: i=1; AJvYcCU+lIMSQTnH6YTSgI2VMcQr3FykTDLS7334unVWs8Re/xLvoUFlPLnXeRTjdXniMxkIYqoOohQ5kp/qIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxND2+Wbn77WXIKgM1hEhrZ9BCeFtFFf8vCzv+ZfsGzOBzBUYfr
	LOJMUzmaRpi+I8Ny0wjw9eIKAvIvZvamcO8Pv1Sd6NjhVZNcI3WngAML
X-Gm-Gg: ASbGnctiAJ4zhK5anoJ8c4VeihTpxSQajn7s+jSWyJe52wsn5PRftG0DNkpIG5KwfaK
	DYnugY/FKwGFwrbpTXiyMzy1trnS7wVBOvGNnE0knfzoaXGAoEZdl0OTkv9zweDwgpBqDZvZaNo
	ISNCDRTK0SnKpXzDkdKqAmX7Q9RbOQz2Wfb/iY+1tg0moYukn4OKprdyDlB31/qamqF74OSUzTh
	1ZMc49fZBKwL68AQYutWwJ2Irh/TtB9aMiPDm/D1g3OPgAdBZShuBs8DIjxvnguW7ccYR4fSbCH
	v9A/L+ZvYoQT1CxD8IArtGiJOvTv34o9+1qwC8rXT/8Sxi3js+h0MSt8QR4mzdsOk1FWc5ziaOw
	OWRaCuLfB0Bz6hYEDyFHLX0VY3Tn99qe6+8Mj16QkSothQLTjCTv5qWoJN7Rkc/LF/KkHKxO9/u
	9kEzbuPxcgdogeNqkfGbb2bA==
X-Google-Smtp-Source: AGHT+IH6eN+njVM8GBwTsi7fLGE3YNfCJKSism0LE4927eZ8Rab/oS7OTOf02WSA0mHpx2ydqTM/Bg==
X-Received: by 2002:a17:90b:4c48:b0:32e:936f:ad7 with SMTP id 98e67ed59e1d1-33bcf8f8737mr8845587a91.27.1761470367609;
        Sun, 26 Oct 2025 02:19:27 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33fee418419sm1947131a91.12.2025.10.26.02.19.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Oct 2025 02:19:27 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] riscv: Fix memory leak in module_frob_arch_sections()
Date: Sun, 26 Oct 2025 17:19:08 +0800
Message-Id: <20251026091912.39727-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_021928_702819_5E26C496 
X-CRM114-Status: GOOD (  12.85  )
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

The current code directly overwrites the scratch pointer with the
return value of kvrealloc(). If kvrealloc() fails and returns NULL,
the original buffer becomes unreachable, causing a memory leak.

Fix this by using a temporary variable to store kvrealloc()'s return
value and only update the scratch pointer on success.

Found via static anlaysis and this is similar to commit 42378a9ca553
("bpf, verifier: Fix memory leak in array reallocation for stack state")

Fixes: be17c0df6795 ("riscv: module: Optimize PLT/GOT entry counting")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/riscv/kernel/module-sections.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index 75551ac6504c..1675cbad8619 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -119,6 +119,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	unsigned int num_plts = 0;
 	unsigned int num_gots = 0;
 	Elf_Rela *scratch = NULL;
+	Elf_Rela *new_scratch;
 	size_t scratch_size = 0;
 	int i;
 
@@ -168,9 +169,12 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
 		if (scratch_size_needed > scratch_size) {
 			scratch_size = scratch_size_needed;
-			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
-			if (!scratch)
+			new_scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
+			if (!new_scratch) {
+				kvfree(scratch);
 				return -ENOMEM;
+			}
+			scratch = new_scratch;
 		}
 
 		for (size_t j = 0; j < num_relas; j++)
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
