Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C1AC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPO4FAsYN7bEGiElsjkzPhFKQfJ4daSR4nAocKvg4wk=; b=wKoNfRD7Dm23gr
	1uElkhXLC0yUBZ78jLNRdiZzDMalY9JTlAGSn9p8aYrZUgJDGBA8+xsH6K2id1U7A3u/14Uh3B7r9
	P54RaAUBFDIt8mem5EezoqPbU1n61oSOnqLdUBbqAgA+6ZbkNPZ4aVrzL1hj+PAY8cMvLvdyLKbmk
	hRlWzRFKuAsbqcjIeXbDGFGfh4yT/V/AjcwEH/p+d8bIEVN4GSEiCZtOyhwJtpsOnVFHFL82Qj8Gf
	rUSY+/NO4R6LhAIE9qVZ1D20B2oNacOcqo+TxOV5Dj4NJHph8AaHBWP+IKbj8EZ/56zypvNMryxTt
	YBScVEUBP89QwfYzxNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpkG-0000000FafN-3Rq6;
	Thu, 29 Feb 2024 23:23:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjO-0000000FZyw-0bgH
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so1324394b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248945; x=1709853745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wFLc5gcnBs285NRnicKVmmQVV53EnA/2rANcUM2uCA=;
        b=SUyEyu1+lXZ6/hlA6/PX8lQCeSzFG+wVQONL7CUtTV3fceOzw6ssXEtpPtDUWNsFGM
         X1ukZnrvxbSpN+xdm2/ZMoXvSZuKTOYckYQ9umwq+LSxdHWIqPnuxi1defYlYzA5DeQ0
         slqfY+L4KyoPmSzph0RMZ/GlXy3lBpnNzubv5YjQ/VIgm+jBVaSYG9YrA7MGMh6ilRmS
         Hr2R6bO9xPe4jRC5/5K7UpsxVt1G3e4wZshngiaaGulZLgLYwHcl+Y4+227LK1zv5fDy
         mC4kyWri5immhdTnmFq0Iew0IzcUvzLPlMYYFxNK4yoEJoc3TfeyW4s/M2wAxd1hqsGF
         M5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248945; x=1709853745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wFLc5gcnBs285NRnicKVmmQVV53EnA/2rANcUM2uCA=;
        b=VgaYEKvcU1OIvBHZK6jPnje6lVYfVw85hTz87vspqgUqu7eqio4Gi2tTXf3VOTWG/i
         QSldR85CHv5WaqISlsGQx0Gt8Ys+t8v8+vQlpMz929fZdj2+/K9sMsbPVbh4nyxtmXad
         M0wD/sRjxI773wFNrEnvrVWBeNUu6mLmZDCHUw7Nu9KZ0QMF+NfXCQcxCsZr0aM8SZ6b
         Nau3n6ErX1Z0fLJMOyGjeGeNI+mypuWnMVD+7HCHekAqSKnUzFcN5qeNzxVgZmeLT0Ku
         4SiFNUgojQNolnxNb9FJ4y9pXDSfrDKBz5bcVuEEeGFgRw4uSOZVbSWgYZ4T/8Hh3nMm
         ujlg==
X-Forwarded-Encrypted: i=1; AJvYcCU45UT1Rw1udcwgD6BuH0Or4dM6XDpKEqFCm22owI0iOwGClLM6L5ltr+Tox8tI7G6gaU8yGWwyMufs1BiNvy1wpzxk+fxHglnH4qsx/tUx
X-Gm-Message-State: AOJu0Yzp745zBSH9M/jElsv9oQRGF2FYFR2YYT4cuue1JbXlNEkdaGlh
	GCvnNe2/KMuanIwMbCid27G7oW5DBIRwwbfrxuHnz3meo3HsOmgQIpYHbT4meFVuVyMu5bbun9p
	l
X-Google-Smtp-Source: AGHT+IHQJB+ROn7vFDGIQNWMDCSQS4WpsKXvgO9ytwgYp+s+V0Upk9jrJAXqE3yMlwAjPHhZUdgCcg==
X-Received: by 2002:a05:6a00:3d42:b0:6e4:eee0:5798 with SMTP id lp2-20020a056a003d4200b006e4eee05798mr179957pfb.14.1709248944849;
        Thu, 29 Feb 2024 15:22:24 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:24 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 11/13] riscv: mm: Make asid_bits a local variable
Date: Thu, 29 Feb 2024 15:21:52 -0800
Message-ID: <20240229232211.161961-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152226_477882_9F062C6D 
X-CRM114-Status: UNSURE (   8.60  )
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

This variable is only used inside asids_init().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 5315af06cd4d..0bf6d0070a14 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -20,7 +20,6 @@
 
 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
-static unsigned long asid_bits;
 static unsigned long num_asids;
 
 static atomic_long_t current_version;
@@ -226,7 +225,7 @@ static inline void set_mm(struct mm_struct *prev,
 
 static int __init asids_init(void)
 {
-	unsigned long old;
+	unsigned long asid_bits, old;
 
 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
