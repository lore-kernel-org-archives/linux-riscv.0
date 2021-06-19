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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BA9C2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:37:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C71610A1
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C71610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JMKuer9VVNRgo8DZx2urdDnkjbwoFnIYqIgrmcqEUxw=; b=nzJw1pEcYtqNYiS2BBwx+cwFa0
	Op3xgExW5wW0tLKSAfS4aavS8rqaimi5ONPoZj7h70T6g5/kIe8XrGTin5nzY0YQdR134Ll5A2bIP
	PpAVZ/424pJUq1mqzwxMPYAynMFwhzDszFUvRwNmmaWlrYYb5wxu168adlPP9/7N1ctTb0MJD9PI5
	wAtVNs+FTGzg7zAofHXNPLqc0T65ZqU3zKW+NSUdsAP+fIgA2vp/VKLkC3tfVUZ54EqgG8+uv3XTR
	4h8Bd/nZZTQFviGJV/Mnl8Xy1EK4qBdS1qGXE1tQdr2rczZW6GhpDPpQXjwd5QH/oM9KYICDpY/0Q
	kN81uV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luZHW-00GtZO-DO; Sat, 19 Jun 2021 11:36:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luZHT-00GtYV-LP
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 11:36:56 +0000
Received: by mail-pl1-x62c.google.com with SMTP id v12so6024792plo.10
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jun 2021 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tWMnQuK+9BIZ4cUDgnnI5UsvvwctYskK0oxgmeF7wt8=;
 b=coJxx5qMalRKncnE5J452fL+slVPFJmTv7X1W8/2E+ZIh9VGPK+NTvs8E4FwnCU6vd
 KQnTqW7h7hU3ExBYdrgu+Sm37nhSuDMdsPPVqHEQbAf/FBFGQ7bJRNPeoQVDmvKwib50
 HoGQW8mVLNy5sVg40UvRa+q17iIKRDtDwwkoaY8fUk+MGFoMszhv1uT1goaTFT2U1BIp
 XZpuTf4QaoURvGZLS1rr5Kpbg4bG5FhccQnfA/5Mq6vIEDAJ/YXJgwmUV5yLflYSCNFu
 tMY43h1Ewkjt9gfS4Wfi6DQ2y47CP8H/dkQHQN2RYdjYpF3BJXU9JBcKcdLe669ntX5S
 t4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tWMnQuK+9BIZ4cUDgnnI5UsvvwctYskK0oxgmeF7wt8=;
 b=ZAKaOM6E2oVXpjmCikzG5xf0Si3yHkG8zvgOuziT5fPykI7ei5h1YvJtiEm91VpiIT
 TJgEa1LCa9tq7EyoUuPkvS3uux4cihhgCeOgzYYVkYXXskRMP0Z+6e10aaLhAlqmpcJx
 yE0ByczqBqP8uJItBZ5Dqrh7urgIl5MP4CzyIyH8j5q0E1VY3oA0yAS5snLvCFI4w+f8
 0Eu1vVhxwCykNrjjtrQqfG5A8HSF6C4zqN+DkRNtoddXXr97ezXnDcyzviKSPgFfJYNS
 FyznipWkbkzB+F87eQU4A1tEqoHpChb8owfiaH/i9vXd4/nd3T+ZydEVaN6gmOh0r1q8
 xorA==
X-Gm-Message-State: AOAM532rGdyW8J+PDEpqOyuS+ei8xCePOlhlIQiK+Oz1/C/Gm8sxhW3C
 Nd/TTq4Zsty9HOZW5Hj+IzNUlAwSKuVf6w==
X-Google-Smtp-Source: ABdhPJyvEGPpuyqfanHruuFDbzULMZeI2N4HC4CNwz2NULTWpGj39RawbBaqLAMjOnRjtnFdZ6o6aQ==
X-Received: by 2002:a17:90b:503:: with SMTP id
 r3mr16224862pjz.195.1624102614543; 
 Sat, 19 Jun 2021 04:36:54 -0700 (PDT)
Received: from [192.168.1.153] (87.19.178.217.shared.user.transix.jp.
 [217.178.19.87])
 by smtp.gmail.com with ESMTPSA id o16sm10411752pfk.129.2021.06.19.04.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 04:36:54 -0700 (PDT)
Subject: [PATCH 3/5] riscv: __asm_to/copy_from_user: Copy until dst is aligned
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <d2efdd2e-c094-0475-d030-08eaa7efe917@gmail.com>
Date: Sat, 19 Jun 2021 20:36:49 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_043655_762766_88C2F003 
X-CRM114-Status: GOOD (  10.05  )
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


First copy in bytes until reaches the first word aligned boundary in
destination memory address.

For speeding up the copy, trying to avoid both the unaligned memory access
and byte access are the key. This is the preparation before the bulk
aligned word copy.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index be1810077f9a..4906b5ca91c3 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -32,6 +32,34 @@ ENTRY(__asm_copy_from_user)
 	add	t0, a0, a2
 	bgtu	a0, t0, 5f
 
+	/*
+	 * Use byte copy only if too small.
+	 */
+	li	a3, 8*SZREG /* size must be larger than size in word_copy */
+	bltu	a2, a3, .Lbyte_copy_tail
+
+	/*
+	 * Copy first bytes until dst is align to word boundary.
+	 * a0 - start of dst
+	 * t1 - start of aligned dst
+	 */
+	addi	t1, a0, SZREG-1
+	andi	t1, t1, ~(SZREG-1)
+	/* dst is already aligned, skip */
+	beq	a0, t1, .Lskip_first_bytes
+1:
+	/* a5 - one byte for copying data */
+	fixup lb      a5, 0(a1), 10f
+	addi	a1, a1, 1	/* src */
+	fixup sb      a5, 0(a0), 10f
+	addi	a0, a0, 1	/* dst */
+	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
+
+.Lskip_first_bytes:
+
+.Lword_copy:
+.Lshift_copy:
+
 .Lbyte_copy_tail:
 	/*
 	 * Byte copy anything left.
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
