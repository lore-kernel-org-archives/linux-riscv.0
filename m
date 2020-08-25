Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61762C433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D8162074D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/3OZ+xv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIM+3AfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D8162074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J01Fj0vj+VV33VSy2oyE4zW2g/TNNio/hDPyteLmHc0=; b=k/3OZ+xvqmMmQiaWCGav2ADEV
	R33qmNI20uAY4T9NussU8x/VrnEnFpseQeY3m4rdC6EEtjm3m3l6ncjyxUOWOoFNMHcCG6tcOrEoB
	4f+CR0GruV3YDqGaxupoBlY7oJw/FW/mf+yRW2f0oM4brp+89pCxaPRL7aKGZjUJJ0xT9UV1iEkKc
	tbPGmyJzmOVh5jPBWNyXf1gbJcP4/UpcVvzWEI5hvqq9asyNR1hf/aJ5H3XLZhfFQrFigbqEKjgxp
	mBHwSNS65w8t1M0e3C3xMBBuvFzN1fENV+4QrOymUJdavc6Mk+p3Ygv1qk6LZtfyEKns6+Xuco7WW
	NlRaWiEtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdr3-0000Cx-Hn; Tue, 25 Aug 2020 18:39:33 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdqz-0000AQ-Ts
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:31 +0000
Received: by mail-lj1-x244.google.com with SMTP id w14so15005327ljj.4
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MbHO91ufP9iVLy6PlR7Wdl68UqE3gokYoRO3hoMerGs=;
 b=nIM+3AfQ80W1WdU6HlFrABvXpvHmvOBmkmXNaOfZa4xDJXiw3MQS46RRsEb4ZAnnat
 0E3zqjpJj8Xv0DFbBnrPPz4mwqS5Ic284V3GPLW4dtddtxJ+y8TxLb7rUwMxQUqsmmfA
 fqntKevFA3LJ1GNSNb515XdGWSxgOiVpAoA8Bvnk9n50EYdWYK/OdDB2SgzigssjN14C
 xSt9E5tdlnnOSidAYI5AoupRNlcgPeNQqIETm8n6rWLW+gGeQsWAHa1ZmWxCmNwbeKhw
 wcFuoO/9fLjgWMV+gNF+OBa1MEmN/M962sMHprT/i5J0i9ntQ6lm9mVQtamSeD2J0wxv
 ZHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MbHO91ufP9iVLy6PlR7Wdl68UqE3gokYoRO3hoMerGs=;
 b=ViHt4BzS9yCRPPcoS4J1B3voKtDUEoRPElrFQ97keC1U5rG1hXCK1KjLULWADfJ5hI
 gdILcWObeGC4rc6sqNEwyB8Ouok0LtrFgJJVBMxfpoD2quk0QdOV6dVWp9uKqo7f7GTo
 zbTq0LpJNYzlNN15rwcQEoLiM8NZQnv61Nhz2wgX9I5vMx5LSrenY2UBW9DL2M4jQAoY
 km9Uso49cvSeokUmYgiqCLDtkzdyRTUdGOI5S3LaaZE2Im3nDq+Po9eI6rVOL/V4JBUH
 5sgshh5cCl3I1yfiv5k4AFadAG4R5HBit5zWZzd2CUmNiTcNc5x1yscBHdkqvyjxXiu6
 WMhA==
X-Gm-Message-State: AOAM532KyRQnonWoyaIZXBp8+OpfQGSN8bZmofKwyIEY657Ajrdrbf/W
 mGuQ5u0yUqPi919KXudIFzekXyCbrGZuvg==
X-Google-Smtp-Source: ABdhPJxqmRxY61epkW/FokTcGJ+l5ar701jyVowJwrGzAYdKCLwUHGumgAavMqpg5uNFXKMS9r2gwQ==
X-Received: by 2002:a2e:5c5:: with SMTP id 188mr5192990ljf.466.1598380768050; 
 Tue, 25 Aug 2020 11:39:28 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:27 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 7/8] riscv/mm/fault: Move FAULT_FLAG_WRITE handling in
 do_page_fault()
Date: Tue, 25 Aug 2020 21:39:06 +0300
Message-Id: <20200825183907.275950-8-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
References: <20200825183907.275950-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143930_033751_106E01D2 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

Let's handle the translation of EXC_STORE_PAGE_FAULT to FAULT_FLAG_WRITE
once before looking up the VMA. This makes it easier to extract access
error logic in the next patch.
---
 arch/riscv/mm/fault.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 3b430fb18de3..bdc70d3d507f 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -208,6 +208,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
+	if (cause == EXC_STORE_PAGE_FAULT)
+		flags |= FAULT_FLAG_WRITE;
+
 retry:
 	mmap_read_lock(mm);
 	vma = find_vma(mm, addr);
@@ -251,7 +254,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 			bad_area(regs, mm, code, addr);
 			return;
 		}
-		flags |= FAULT_FLAG_WRITE;
 		break;
 	default:
 		panic("%s: unhandled cause %lu", __func__, cause);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
