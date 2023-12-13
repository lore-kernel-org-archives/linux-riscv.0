Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjnAo8IT2+Ta3b1rICcxBwHg9rWTyDY2zeDluKrISlU=; b=QZCJsTwTrI/0LG
	jTaiZAV9mCCcFuWDNGZ4WRLSDgSbidxfvA6tYRhsoo3OMrejAsWcRygvV6YMXMMLUSWU/UmqUdR36
	HZ50iAS1mwBTcSnAscbDHWfZT+RfZIB+8ryYzGhLw4yWBgxZwFG71xYqav4MKzrUkVl7g5sYaez1f
	6tRcVWAmtiTY8CMX0jmY3ly5IzBVZvSQPm++KZ1TLnhuKKL3yKQIZo/IU2eJxkaQ4TQUJVDkwQYhO
	FHhAr2/crm55R2QSUqr4ptcB59J7ndDdRav7teYZygA7+eMLWmzc6UPwjmvsiYpTjLxo0cj7cQvaR
	e4NNZNZu/Hr76NBSl42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVv5-00Fz8e-0J;
	Wed, 13 Dec 2023 20:33:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVv3-00Fz6Z-0x
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 20:33:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c25973988so75318825e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 12:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702499601; x=1703104401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNQI5S3fkIj7NrMfmbJzF3XH+7YYWzemWytVmilYcq0=;
        b=Okr3aK4yprZByaCdUDrAbdb5G++0K6ZmRvyOJ1h9sz8u/OdkGzv7n+hlV+fjTG8eR6
         YiTrLreYvv2y/XvEm3OSlbMgCSBbKsngAVOcZ90V/gFGcWbA2jK2aa0ZaULwhqXRAkw8
         m9GaoUXRzuVNFdF7tBlE6z8eYpZsnor+8A1WgjR13EJNMpwpF37rUuDv3c4TcDXEMANd
         Eyef+vOQ34o5kKPmwvPOVwRN9cEIQPMsaYQZq2LCQsebII5NDr3Om9Q8RoUjIioETXqs
         5zUwpssEiPm/thesVXpCK1JMJ+PWHZluzF5axL2Mcu1RU9f909HgzhDlJjW1Ou36FFGX
         KDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499601; x=1703104401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNQI5S3fkIj7NrMfmbJzF3XH+7YYWzemWytVmilYcq0=;
        b=A8fYU8gmIyJK5BAUv+5RXjyNnwrg7UIxCBtlJ6Ha1JaItdnI4zQSgXTNyEHgGTfQ0Y
         MA5+FCVCjLnYbeQc9CKux3k0T4QouzT6/SOZbjb/TBMySTJxBEdMy8I0Ihyr1Vt4SICY
         pUkoavhq9mZUH7uxpiE+nN1HtLt/vMRqpzGwNOL2WuKCOsNA1Uw+EPDn3STT2Z/mRzKm
         am97zjoUkEMDqdU716htyJe4P+v/2dSvolOUFnvn1bs13zGTcTo40u6yMRCVqfqeFuzC
         Mf6dOqNCJrib+qq2vuGvc1Th9rRqlsbIUYke8e6Se5o6P7EWjL+Pk0MA+WU/fhhBtSIN
         agPg==
X-Gm-Message-State: AOJu0Yzf57Tl/n/aBDD5MDCMZHW7HPb5fzcubQMV/fh+n61CrslSd8Sd
	uGajhBrZaidC/DQ6+kG3bZqh2A==
X-Google-Smtp-Source: AGHT+IG3reTNU+mJ6s5WyJ1mAvW4tTpIucH1hcfMu/iPtp1tRfvP2HWAF0mMX3m2L1tivm7yEvDWGA==
X-Received: by 2002:a05:6000:174d:b0:336:36fb:84c8 with SMTP id m13-20020a056000174d00b0033636fb84c8mr990697wrf.107.1702499601505;
        Wed, 13 Dec 2023 12:33:21 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d458a000000b00336463625c0sm136243wrq.51.2023.12.13.12.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:33:21 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Russell King <linux@armlinux.org.uk>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/4] riscv: mm: Only compile pgtable.c if MMU
Date: Wed, 13 Dec 2023 21:30:00 +0100
Message-Id: <20231213203001.179237-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213203001.179237-1-alexghiti@rivosinc.com>
References: <20231213203001.179237-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_123325_333280_227685B2 
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

All functions defined in there depend on MMU, so no need to compile it
for !MMU configs.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 3a4dfc8babcf..2c869f8026a8 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,10 +13,9 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o
 obj-y += cacheflush.o
 obj-y += context.o
-obj-y += pgtable.o
 obj-y += pmem.o
 
 ifeq ($(CONFIG_MMU),y)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
