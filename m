Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18A8C2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:38:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C26601FF
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C26601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dQOdtXqLsVD2ZTZVNc8ugl8bpR8DugOBqpm6vq3aCuk=; b=oxqDbXvx7siU3l2o78bzubu/qw
	KaqxBqz13Obl09cyTLDS1g5qBkJyAXpe4MtvbN8+Jnu8lo/ZRxKCWdUvtzZ99m37jHWTrfP9PkNb3
	sP+XMC9/WcDpJUnBHSMdACe8Ur65REApkOfKSrx1slb7seXnkfyOO96uKcx5z3pU2bsdz4j+dlO87
	L8iAG4yUIi/C5C+tm68UnZkk1akyfhdUiWgGuNh8ddy+i5V6dsI3CNdgjpuUHR8q3Z0zs8BUsp7pO
	vJM0x1eCRDM8DSShrrzf/0Pw5LAzsZCfvzllcRN+wc7SfXnVo+AVQSFVnLTZbF3sqJXudkyzCg3tr
	ZZQLZE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luZIR-00Gtm2-EO; Sat, 19 Jun 2021 11:37:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luZIO-00Gthp-KG
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 11:37:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id y15so4005580pfl.4
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jun 2021 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vXLVQsXj6FC6nXeevSc8Ao3YS/Kg37+h24F/TyUkG4c=;
 b=FpmHzw9ecJn1mlRFA0MovE301HRBZjiQTpyNM4UrqH7L1sr0MtHSIs4gMoYM64SXkN
 ugIN3cXt0xSYfsWzTvL5SwsrQYTMxx9cuwqlHUJcMObsfHC2PTn+0nUg8bLC9LLah8/h
 jd5vM7Rr/yd6x1nrtNj04B5d5WNHX5xB4fTwCkT/wEGNcoOSjd4eilrs2aTdixgr1J3o
 iRgepBp/UD5LlB+mQ9qsKNeA+dD+7WMOPfa2WQH6zEcXyXskk+VIx7Z4H+ganGPeFDAE
 W3nFKtaKCjch35SuC/1gWpPZlkifhiogDi4S/eXIxF0hFv+mvsSj6ca8t2F+bgSQCvTo
 q66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vXLVQsXj6FC6nXeevSc8Ao3YS/Kg37+h24F/TyUkG4c=;
 b=ccS7cAqsRFHl/s5D5FvwNUfx+5KgjT4SqvqvN8awsjhhc4UrPfKYQVvsi8mfz8XRoX
 F8b3vU8K/9oyxvauv1Ei4WB2WICmSxVGSTwygfhF94kv0v2FgQW2DlnCbUVYgUhULUQf
 kCu7IV9nXqpj8wYaoFapcL3YqSloeMV51fXwd59ugMsSzsxzDaBlsyDq/KX1Z2v3gRoy
 wl12s1dnaAQCj0s+3dVwqJKztwvYjwyMaY5i39FYBhIJH5XNJPkGDHZBQLuiONevqBai
 Z9m/hZ4IDFc5YgAGCXsLylObedV8EYj2vhzqmKSZDk2MlyJLjptq3YTHe6Q9dasrKvn8
 UIIg==
X-Gm-Message-State: AOAM5313pjFCR8OBa/16I4IpXBxCPNfVVYL09snXlu8xPAkTrVmuDVIC
 zYY14n5dcuVAlZ5lzR+/3U+Vhua9kyjnuQ==
X-Google-Smtp-Source: ABdhPJy1L+2Pe5g/52F2AiehAyM0Rvkeekl8RrJbMqiPvZQYDx/zPa/hkZ+9SkONG1a2Dxt8DGvRTg==
X-Received: by 2002:a62:788b:0:b029:300:21b3:d630 with SMTP id
 t133-20020a62788b0000b029030021b3d630mr7860968pfc.77.1624102671655; 
 Sat, 19 Jun 2021 04:37:51 -0700 (PDT)
Received: from [192.168.1.153] (87.19.178.217.shared.user.transix.jp.
 [217.178.19.87])
 by smtp.gmail.com with ESMTPSA id d13sm10218023pfn.136.2021.06.19.04.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 04:37:51 -0700 (PDT)
Subject: [PATCH 4/5] riscv: __asm_to/copy_from_user: Bulk copy while shifting
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <767aa7e1-0cd0-1e60-3081-77b4c07d14ff@gmail.com>
Date: Sat, 19 Jun 2021 20:37:46 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_043752_739668_DF0C48ED 
X-CRM114-Status: GOOD (  15.13  )
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


The destination address is aligned now, but often time the source address
is not in an aligned boundary.

To reduce the unaligned memory access, it reads the data from source in
aligned boundaries, which will cause the data to have an offset, and then
combines the data in the next iteration by fixing offset with shifting
before writing to destination.

The majority of the improving copy speed comes from this shift copy.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 60 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 4906b5ca91c3..e2e57551fc76 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -56,10 +56,70 @@ ENTRY(__asm_copy_from_user)
 	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
 
 .Lskip_first_bytes:
+	/*
+	 * Now dst is aligned.
+	 * Use shift-copy if src is misaligned.
+	 * Use word-copy if both src and dst are aligned because
+	 * can not use shift-copy which do not require shifting
+	 */
+	/* a1 - start of src */
+	andi	a3, a1, SZREG-1
+	bnez	a3, .Lshift_copy
 
 .Lword_copy:
 .Lshift_copy:
 
+	/*
+	 * Word copy with shifting.
+	 * For misaligned copy we still perform aligned word copy, but
+	 * we need to use the value fetched from the previous iteration and
+	 * do some shifts.
+	 * This is safe because reading less than a word size.
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of src
+	 * a3 - a1 & mask:(SZREG-1)
+	 * t0 - end of uncopied dst
+	 * t1 - end of aligned dst
+	 */
+	/* calculating aligned word boundary for dst */
+	andi	t1, t0, ~(SZREG-1)
+	/* Converting unaligned src to aligned arc */
+	andi	a1, a1, ~(SZREG-1)
+
+	/*
+	 * Calculate shifts
+	 * t3 - prev shift
+	 * t4 - current shift
+	 */
+	slli	t3, a3, LGREG
+	li	a5, SZREG*8
+	sub	t4, a5, t3
+
+	/* Load the first word to combine with seceond word */
+	fixup REG_L   a5, 0(a1), 10f
+
+3:
+	/* Main shifting copy
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of aligned src
+	 * t1 - end of aligned dst
+	 */
+
+	/* At least one iteration will be executed */
+	srl	a4, a5, t3
+	fixup REG_L   a5, SZREG(a1), 10f
+	addi	a1, a1, SZREG
+	sll	a2, a5, t4
+	or	a2, a2, a4
+	fixup REG_S   a2, 0(a0), 10f
+	addi	a0, a0, SZREG
+	bltu	a0, t1, 3b
+
+	/* Revert src to original unaligned value  */
+	add	a1, a1, a3
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
