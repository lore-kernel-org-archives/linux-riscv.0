Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7EDC61D85
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4FUUJWMeQ50MhgT9WfVWFZlC3MyJ9tf2sNwhOkJThc=; b=UuLgwkHYDU7arp
	aTOvVw+trzX9fSp6DT8zwe3rs9bYc9vQDNjfSuKmTY9wpHYQEAdglPc/MgTZ1W4kayjTuvDe3ltSd
	+QEYuUqQ23KX91Ox2p5BBCM+oY6U8eoTf4IOnSRO8QoTVxvSszYj1JVc3k7EVb4nqvwCZmkYKMdgt
	qKjS43UhKQtqt1BCBFvos28vB1c7DbIHhQAznNUT14wjF/PbyAfkD56dSTwTIP/tzDGXWMF5v5C11
	RBSkmeXMw1E6zijI+O/s1wySyS7/cbFpR70WvCe0FmcmwClYF1f+qXxwNqLdXyXi0+F8mOcSrU1zk
	wSAYcLM179OL9KRej7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bjD-000NFk-2F;
	Wed, 22 Nov 2023 01:08:31 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj8-000NAd-0q
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:27 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1f937a7b8aaso1562404fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615305; x=1701220105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8uQuAx5HbeGrqX4Ip/qQY7nv6lrxw4qacCJFbpKbko=;
        b=doxzn3P39GoLzIANEE7xyZlYT0g/EbxUXomzhZ1Lh5g02/awPYOsg3LJW6PsOi8hvo
         WWVAXSpxfdU8WeZM7Ew7I8m7NWpBN7FEQb7cR7CVS3c/pJT9KO1xMvzvZSvbetk79C48
         uFWBRy4jHtEJ9ZL0KV64RXB2Edj+p/lBqZeT7D11lgyAzdhj4eDjYIrzrr32GD8lfm0U
         4jV6W06d/a+LTAGbZjgd8Go9iSpMEBMqu9YDwMca1BjG4idpg/5oNjaLScm0J/hHNo8z
         jO4FVbXgc3OsmQLMZwc45/Oz2W8CDvz7yDsn+SO/kBjQwbVVoiSRYWERd9o56R4B6nVP
         qdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615305; x=1701220105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8uQuAx5HbeGrqX4Ip/qQY7nv6lrxw4qacCJFbpKbko=;
        b=fLbcX6HkiR/8yoYPg/0NDe/oZiRRIkg2+jPld5Uza9aUm43uVNV2o4jfnnakskTWYI
         uzJ3Xc0RoJ8WpiAwgG4xsKqXxTAJJneF4o/zEg1/JSCFX4kEWi4IaUoRLi6F/CVUvEW6
         H0g38Jeuj5hYkyCprqFxuSz13wA5begTnsf7V2tMdT4MzZxXA4y1vAO7wM6RyGnY6/ZB
         HSNyeIe+x5bJoGGNkf/zywDlqrYx/RoC51wFWcUuRqyLONl7mQO1+q/3aaNWNzVTP+t4
         WdxgEsoBp1TSjmmKyPGwe7sDx5oB786BhUIorbX9hgZ/hQqBCdDNCAho34FAOnY+dimc
         tn7A==
X-Gm-Message-State: AOJu0Yx7icA4WZx6LFxUKtAw8QrFS4JEfe2iLAzY65U8BSc+Tgnpe5ml
	AbpOKKtKKhX9Pv0Aoxmy/I0V0A==
X-Google-Smtp-Source: AGHT+IHzY35P/bmGNlxsboL33Yxa5yN9S+7CxJ9PS0wbWCSnN9yRamcO2jnn4/Cd8sidyrAKu3XrJw==
X-Received: by 2002:a05:6870:9b0c:b0:1f5:b5ca:435e with SMTP id hq12-20020a0568709b0c00b001f5b5ca435emr1104182oab.52.1700615304951;
        Tue, 21 Nov 2023 17:08:24 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:24 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 6/8] riscv: mm: Make asid_bits a local variable
Date: Tue, 21 Nov 2023 17:07:17 -0800
Message-ID: <20231122010815.3545294-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122010815.3545294-1-samuel.holland@sifive.com>
References: <20231122010815.3545294-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170826_294700_D08963E1 
X-CRM114-Status: UNSURE (   8.79  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index b5170ac1b742..43a8bc2d5af4 100644
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
