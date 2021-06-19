Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F9EC2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7076C600D1
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7076C600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lmJ7dapmshvqkN6AT6Wd4S0MDJi9s0S5BU2urm58N/c=; b=a9I7fj7r1lpWU5uoSAMb3aCZiE
	76IzQiqXCJjiwvd66/HOzFTt6d4qD7I7cMyQSgBN2Wg/IB/+a78BoIHOlZBXbfltw4F3le49ZUJnj
	poXb1b1lBeMCmQsjOz2BnVqJBDDm6ZOrpqB+dC42aVZQs3PywIuFpasGOfjCKTPyEmDOo3sl+neei
	r5P35+pNvqIJQcYDNhdbqbgsH1lYfLtHPqt/NPdaHZAEXjrYfCn6T4JBwiGgBA/pkZaczjCmUQpjO
	SnhyIKsXTlBN6PqQdYI0N7LvEGa3mpHunA3+11AXJeM0wJXtyjFVPReJaq/79svqLikLxRw8yRJio
	bbjQ4BUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luZNc-00GuTA-C0; Sat, 19 Jun 2021 11:43:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luZNZ-00GuSk-2r
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 11:43:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id a127so9819668pfa.10
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jun 2021 04:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OgpqTQ8TRc+evfamjKBsHRPlfB6iAzq8hyJY+nFPML4=;
 b=prFuScye+Kf39AgSxdKfHdVrPldWc7GbN49YMICgpbe6UvkMdZvX4dfPKyI6NMAg3X
 U88AY3CbsGqFET6OTfoCKwLy1NOF0ruLiLVcKFzUqeNwUfXuV2fUEscciFv6ZkLievX7
 L8K19EcBbfh5NVmBui30qHIR8CH2qx8No5v4OIJSHsZPjuQGodqZjE2yEToft3CIzR0A
 3egG60yLsv+AwcaNExycHzFw9lE1iBJItU1IGeEaiGgZ2OhDlMDbNfT+Sfk23EwUr9jd
 yQHdumfCXhAdgws+Ycs0ijY2yD/356LnTCzn1693OGttfQLPfa8gX40LixYcn+HPWTKi
 PGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OgpqTQ8TRc+evfamjKBsHRPlfB6iAzq8hyJY+nFPML4=;
 b=uL2PX/qs6j4n82W0T1EaH/IpWxRc8wvchqhFI+BEL8CBkeH7EHaNNzs91QrZKaEbG8
 jE/fj5cnHtCk7ZBsgmH72cUUeNiNSzHOmdboqcg1C3EGtn6V1IQrZmRm6w1GJj3mPwGe
 N+6zPJFyFMqBfG+PhAPoDmRuhQ0B1ZgOeu3o1jsz76T0ol0PCosdcE3qXVosAFMo3pH5
 8R7x45dEUp2Jzwp8kPUGcaMk22YqLjt3pW1U7ZGYXoDSXx2mZgXShpV8cKNQYV+3xUDz
 32sNqU+IZgwPF5TVbWW6OrkSEBOmuktfiXqzGit2mgLAU6PeCEmGy7U5ODIciw+W4PyH
 tggQ==
X-Gm-Message-State: AOAM533kM2+FVSy65mY5pAihtMsC07yfhyfLFRCoiXUBX1zxOuRAIodz
 vzbYQSdxkvioK0yFzRCO/hXpz3x6f3nsEA==
X-Google-Smtp-Source: ABdhPJzX5hLzSu58HgsENCBFDIdHp/AgPEgHWVxVqjft49bZ5+oO01jOZTN9Fqc5OuYGQs/tuODEnA==
X-Received: by 2002:a63:308:: with SMTP id 8mr10453545pgd.194.1624102991565;
 Sat, 19 Jun 2021 04:43:11 -0700 (PDT)
Received: from [192.168.1.153] (87.19.178.217.shared.user.transix.jp.
 [217.178.19.87])
 by smtp.gmail.com with ESMTPSA id l201sm10806599pfd.183.2021.06.19.04.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 04:43:11 -0700 (PDT)
Subject: [PATCH 5/5] riscv: __asm_to/copy_from_user: Bulk copy when both src, 
 dst are aligned
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <4637f0f2-2da9-1056-37bf-17c0861b6bff@gmail.com>
Date: Sat, 19 Jun 2021 20:43:06 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_044313_201196_9390E863 
X-CRM114-Status: UNSURE (   9.35  )
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


In the lucky situation that the both source and destination address are on
the aligned boundary, perform load and store with register size to copy the
data.

Without the unrolling, it will reduce the speed since the next store
instruction for the same register using from the load will stall the
pipeline.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index e2e57551fc76..bceb0629e440 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -67,6 +67,39 @@ ENTRY(__asm_copy_from_user)
 	bnez	a3, .Lshift_copy
 
 .Lword_copy:
+        /*
+	 * Both src and dst are aligned, unrolled word copy
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of aligned src
+	 * a3 - a1 & mask:(SZREG-1)
+	 * t0 - end of aligned dst
+	 */
+	addi	t0, t0, -(8*SZREG-1) /* not to over run */
+2:
+	fixup REG_L   a4,        0(a1), 10f
+	fixup REG_L   a5,    SZREG(a1), 10f
+	fixup REG_L   a6,  2*SZREG(a1), 10f
+	fixup REG_L   a7,  3*SZREG(a1), 10f
+	fixup REG_L   t1,  4*SZREG(a1), 10f
+	fixup REG_L   t2,  5*SZREG(a1), 10f
+	fixup REG_L   t3,  6*SZREG(a1), 10f
+	fixup REG_L   t4,  7*SZREG(a1), 10f
+	fixup REG_S   a4,        0(a0), 10f
+	fixup REG_S   a5,    SZREG(a0), 10f
+	fixup REG_S   a6,  2*SZREG(a0), 10f
+	fixup REG_S   a7,  3*SZREG(a0), 10f
+	fixup REG_S   t1,  4*SZREG(a0), 10f
+	fixup REG_S   t2,  5*SZREG(a0), 10f
+	fixup REG_S   t3,  6*SZREG(a0), 10f
+	fixup REG_S   t4,  7*SZREG(a0), 10f
+	addi	a0, a0, 8*SZREG
+	addi	a1, a1, 8*SZREG
+	bltu	a0, t0, 2b
+
+	addi	t0, t0, 8*SZREG-1 /* revert to original value */
+	j	.Lbyte_copy_tail
+
 .Lshift_copy:
 
 	/*
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
