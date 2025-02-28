Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B198CC282CD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x/Jrzu4HpmDe0WwHOaoQWMJwwXqIHU6ioNPAtR6j0mE=; b=0dr39ULkF+lArQ
	A32nyjGKENunD0XzBQqTAiEZDPFinDh6sVnwDFB8jw4FY/k0aXnHiFMmjsUMp0Nr0ap5BW221bW2o
	RaP/lsYUejOmhF1Jx1aEkHkJeq6F9pTecFY8LE6MoF7v7UQy9diSAzYKLFlkOcKxlUP4Cy2LvuG6d
	fPZJXuLsK+0XvKOSJHFt5b/RGwqb7f5IAgCUCS0Hbks9QQcK+Z7UgSk9k2ju3iygeKZ70Z3aPWPGd
	q2lHz7jGLhYyT1vtZNdYNLt6iluLX9MHwXHi9/HPuGtXb6snWrIP884VDSaZgPGQCdxe8YrmrKPbo
	hcxjDyAJOI3niBm2EePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwK8-0000000AIAX-2aDM;
	Fri, 28 Feb 2025 09:06:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwK5-0000000AI9E-3Vuw
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 09:06:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-390dd35c78dso1519486f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Feb 2025 01:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740733580; x=1741338380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1iDXG4nsyxQE1e1A4QX9w6M1w8CTfF9s/nCaqEJCzgc=;
        b=y0A+DfYp5KVLWsIVMk2ZswQPhkuUWReEuYLBK817c/WI9xbDzLMWmNwbLK60hJZ6k3
         3NGJ/r4Ks7do5PQeYjDN3vCsxLF3GFX/Nv4s1b2Cp2REjvaZfqMTN+sortKkFv9mxf3r
         BJqMHzFcsNuVRkVqwBFgJCiHa89xJj5+Z8rC1WdapUC5BoWXt2M/X6PLhRlKCDHKPpc+
         uK4cKtDbSDQY7+6QrIXGisW79ZYYsDW0DC7qWn4mGwaA+cWg8aAuZ51HVA5W6StoEeL2
         k9txdkAsABKmYCfD444W9tIHx3QsI/0BsljwrtFSTmBRkEnqR3tNaN0geu85jye+cK4q
         nd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733580; x=1741338380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iDXG4nsyxQE1e1A4QX9w6M1w8CTfF9s/nCaqEJCzgc=;
        b=QW3v05lFm5POMy7h0kbCP67mtajoiKwvtAlZS/Fp3XspeTQNqlvQ1efNTe7v0nIuEG
         SPDSJd1tNauBuBOb1NAQah95MKKYNQoWJwvs9rv9SFrR8Q8pk36+mfTOskd3xZeepSHh
         6+nDcTm6Qz9sORl+8BIf186aEtLEKkSoVKs+u+miRU76G9vp6/Rm4xW2Zxje4fZnqbOw
         t7+6FNd9DS6+YU6ThGo1CPTw1cPPBt1R7iTn4iYYXMuYY4sznGLhF4HCpue6yEmZVT+O
         nK2bOs5f4SPlzS+MHLKB5ja8TTXc9ORJTWX5VQh2h9tuR8iYJmH6naeQ8y5cEsnCJhdP
         0KRw==
X-Forwarded-Encrypted: i=1; AJvYcCUroThppdSXzvLsI9V9iI9jsIVW1JZ5WrEuep59TBqg9MZR/7gbi9/kJryYS7RBg75DOWkgDw5fTdb4Dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwGuyGn9P9OIA1TMMJQnBZAYkPBZFCSXgKoAaKNUnToLL6tPUC
	xMLRRUP+o5DB9EPtfd+yeS8cq5WOpK4YlCTW0x1HmD5MG73VdL0y84i74TFiYMw=
X-Gm-Gg: ASbGnct29m1BBLkkcC0lGqVECsUEaBnFv/8Mt7tETmG+HKSLS8hH4agK5o0dqv0Qbcv
	Jnm3898MnrIYFQBG0jY75k38R3NSIr2hotUJZddqloy8HjbW0mU7Y3yjObTwNGjLTTzD5rMKlVk
	l+xCq42ZVP6yXgMGJLa9tmmllsJgF7/rrpObaKaL2KZutrJv7DuhhZyFfXoy67INunNeE0NcsOO
	77j4bg1S7b566biGnrvQGwVtrtSoQ/1xXJdQMW+YM8GU/jcw+wttPrmUY1DW93itkigInXpqKqv
	DBwcaYnZSQlRlyLc1Rdj+7UAxsE7QhkviZcIgXtHel2bNA==
X-Google-Smtp-Source: AGHT+IEMyVQFzZb3up6eSvKW7pURHbIkKoR0/iLhuxHiXvoVMxQ/kbxc0c0VX2sAkkKcTz4V2QSBEA==
X-Received: by 2002:a5d:598d:0:b0:38d:fede:54f8 with SMTP id ffacd0b85a97d-390ec155371mr1736556f8f.16.1740733580191;
        Fri, 28 Feb 2025 01:06:20 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3382:ef90:4aeb:d63d:2b85:ec0d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7d69sm4683786f8f.60.2025.02.28.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 01:06:19 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Fix missing __free_pages() in check_vector_unaligned_access()
Date: Fri, 28 Feb 2025 10:06:13 +0100
Message-Id: <20250228090613.345309-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_010621_873492_2724C0AB 
X-CRM114-Status: GOOD (  10.31  )
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

The locally allocated pages are never freed up, so add the corresponding
__free_pages().

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index d9d4ca1fadc7..a42115fbdeb8 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -340,7 +340,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned vector access speed\n",
 			cpu);
 
-		return;
+		goto free;
 	}
 
 	if (word_cycles < byte_cycles)
@@ -354,6 +354,9 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 		(speed ==  RISCV_HWPROBE_MISALIGNED_VECTOR_FAST) ? "fast" : "slow");
 
 	per_cpu(vector_misaligned_access, cpu) = speed;
+
+free:
+	__free_pages(page, MISALIGNED_BUFFER_ORDER);
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
