Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD40C49EA5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:02:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C38B6135A
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C38B6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMz3RgL50z8N7GLVde3RL1kruVhn+lCjZ/M6E4UyPPc=; b=B/7lZzAXJqX+DH
	Bud38LWRjouP/OhHmm9S93943PTTAjmN4nUVfgtxtD8d/UCR6EIod02MnTvxoU4yEsGCJ42uD6bZu
	EK/AwqK9Oand3Ywyopa+DyZCC2+E726QMvz8RFRCLDtR2a5yRxKR44Es4rJ+8+/hCLjdgC1s6Xznz
	xX3mtGhbNjBmFRUsrIeFcHF3no6enDIZM9x1GxG89mMh5iLg7ZvctvTDtdvuii9rHlHfIRyN58veo
	xnvXPIi40O1/XejVRlMNa2/+X0RzwkJZAWrmT/d/+bmXLqS3W/0c82hvYlzVeiV3GwiRkl0ZTCWUa
	ZQ0bja3n5ir1BAvbIjjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwaEu-00GvtP-4m; Fri, 25 Jun 2021 01:02:36 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwaEq-00Gvqr-F3
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 01:02:34 +0000
Received: by mail-ej1-f45.google.com with SMTP id nb6so12401222ejc.10
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 18:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTl2a45oK7ererAoqlIPpBJuapGCJZ6anTugsk9TTSQ=;
 b=pTJ5YNLaQMZVJQNbMIHMZPqGTpuWLabIgCYWzok7f5nwOWqqybv/q1Js5nFYIsf/8Q
 Pni3M3xnw64FDyHl8E+MK/oxYa0TO1wGoOieKeu1LKPDrvRaMV9nVFhjrkQWhwbrSmbn
 doTN5T/1R3OL82JcuFRuw+rrA7YZcvOnVUEmseJtpnFGxlikBF8BtIwVNiF54/u5yC/I
 mBGwrbDmA1PWTgb2sGrVxXFXNc+DFSF2r2LfwGNFtOj2oj6TFRa6fV5iO435DoBQ9nfP
 M6elpZVgxKxvQbZQGPs7il59krezg37A2KxXBlhCSymsiq6UI/gLT3mNWRur42GkHa2t
 UAhA==
X-Gm-Message-State: AOAM5322zXd6jCLZ7r45ZwT3xyQLEZcVMeUpeC7IpD4vHtaJ3KPqowEz
 JNtP467FO/kT0g3lb6XS1PA=
X-Google-Smtp-Source: ABdhPJxVCiXfkPACT3+y9E9wzhTSnrJLbSJnilSAXh81SgJREFTyL7yrttPSEAYBAPGeBAxl1Ro+MQ==
X-Received: by 2002:a17:906:c1d0:: with SMTP id
 bw16mr8146696ejb.146.1624582950900; 
 Thu, 24 Jun 2021 18:02:30 -0700 (PDT)
Received: from msft-t490s.home (host-95-251-17-240.retail.telecomitalia.it.
 [95.251.17.240])
 by smtp.gmail.com with ESMTPSA id yc29sm1921909ejb.106.2021.06.24.18.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 18:02:30 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] lib/string: optimized memset
Date: Fri, 25 Jun 2021 03:02:00 +0200
Message-Id: <20210625010200.362755-4-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625010200.362755-1-mcroce@linux.microsoft.com>
References: <20210625010200.362755-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_180232_555151_1CB3B248 
X-CRM114-Status: GOOD (  15.31  )
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

From: Matteo Croce <mcroce@microsoft.com>

The generic memset is defined as a byte at time write. This is always
safe, but it's slower than a 4 byte or even 8 byte write.

Write a generic memset which fills the data one byte at time until the
destination is aligned, then fills using the largest size allowed,
and finally fills the remaining data one byte at time.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 lib/string.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index 69adec252597..598ece5434e9 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -811,10 +811,36 @@ EXPORT_SYMBOL(__sysfs_match_string);
  */
 void *memset(void *s, int c, size_t count)
 {
-	char *xs = s;
+	union types dest = { .as_u8 = s };
 
+	if (count >= MIN_THRESHOLD) {
+		unsigned long cu = (unsigned long)c;
+
+		/* Compose an ulong with 'c' repeated 4/8 times */
+		cu |= cu << 8;
+		cu |= cu << 16;
+#if BITS_PER_LONG == 64
+		cu |= cu << 32;
+#endif
+
+		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
+			/*
+			 * Fill the buffer one byte at time until
+			 * the destination is word aligned.
+			 */
+			for (; count && dest.as_uptr & word_mask; count--)
+				*dest.as_u8++ = c;
+		}
+
+		/* Copy using the largest size allowed */
+		for (; count >= bytes_long; count -= bytes_long)
+			*dest.as_ulong++ = cu;
+	}
+
+	/* copy the remainder */
 	while (count--)
-		*xs++ = c;
+		*dest.as_u8++ = c;
+
 	return s;
 }
 EXPORT_SYMBOL(memset);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
