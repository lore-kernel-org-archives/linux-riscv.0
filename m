Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED99C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 22:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2Fjus9WxckAvB5ASjWxXzKdwkjSFAHJWQNMHSo2UHuk=; b=1ovKziXAwqufxldKwqf3i6xUIH
	KVgxz12ghkJTi64pSCl2ayCVF6A/1oICWpTgBidkKbrxz/Kbb4P662vbwnLwHRWqyC/5fLqktFYKv
	7E6gDnt6i4x9uzbwue9muvzOi2QJw+Y7RuX7EuX9mGLdANps+3Cn7Z8cDRDGc84CIWgGXsPvGPdpq
	V+4mrms5wRHAOtmNVprSwT9AVLoF57EPfl3UXK5+dfIeV/CTd17vYHBMpviHG7Kzgdirg0bWyjg1U
	986A7UtlNuy4zZykhpX15PD2c49ldEp1ObbCvY9vELO4V2vdmRZAmxDbuf3SpeqF0f4Peo47o0Afi
	CO28k4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQakj-003zBT-2F;
	Thu, 18 Jan 2024 22:20:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQakf-003zAa-1x
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 22:20:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d6ff29293dso1115515ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 14:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705616443; x=1706221243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hc8hICt5ejBrlX4pfwNFCUxCM9+pbxHoveyZSbVMX8=;
        b=gktJS7jbmu8MoqO5uUyWk9sPMU+3D4ooByQlNr+afKW9wnPu6ow9orD+HeE4BbQrMw
         oMeTNQ8X0lOwCq8oeSk3LbtGhD7Hl13x0rO24IVSNn+Uhjwo9sb1qxq71Ix6LihJ1iHM
         uikUx+yjrY6cZzsJGPOkIWxCY81bzv5iiqJU9VOOpK6hJ/do7ReJ7iz8/FkdecN0phAh
         ybhSkPNd/xKeRjfjUR/ecXmqawSVrZ8h1sV1JIvcgeJa6a7XFgdzwuDA5etH8Dci4mEE
         H6QQMDgANxinMf/scOwwzuOwTl1TtZvDUfyAIHokX5o/1namHnNOrLXtte2kgimY6WPV
         S5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705616443; x=1706221243;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hc8hICt5ejBrlX4pfwNFCUxCM9+pbxHoveyZSbVMX8=;
        b=v3w/XgFuxQH+7kNwx5xRybQjCd9GgkpKZiYuYDdbvfZhciONyFym/lmpaied27wL84
         ZIyVBmTWuGm8l902ofBAkcHkLWPLkSFZrg/0l++I2kIELqAn8769PX/G+5Tf/fsN7BJ8
         vMdlf1sIIa0uTT/R2egVvHrTKqNGxJw7Xxy8KIFvjnKZ3Q6oF1f/zv6AhCGznw1B1hFN
         kXJX2G681C6qqusQFrXLKX1OM2QGRYdK+f/yR9TixEQ58cmTxeiAAHj11BF8ZtnhXpKI
         t5iQy87gDd2m1UnnCC+NgtYRcyJLPwXIyiaX+f92Lir8JM+uBBwH9CibMFGxGnYCWNOQ
         bA0g==
X-Gm-Message-State: AOJu0YzOlyYCLZEizPSLogOJWFVeVfeYE9dUlyFPaxkWk98GsqZDLOhf
	dP8hLRxIXcj89b2pbJPavAJuXLabLekRJFgnzO+OLaYPWOKd2Ffzgm160sEOWwY=
X-Google-Smtp-Source: AGHT+IFVi1Cop1qCpjAovMwPZtxUEOt7eZBvKmMFZlsB5B6T93oqVGP+/tGtlj7m80SQ4H5A77qI4g==
X-Received: by 2002:a17:902:d505:b0:1d7:af2:869c with SMTP id b5-20020a170902d50500b001d70af2869cmr1447197plg.123.1705616443503;
        Thu, 18 Jan 2024 14:20:43 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id u2-20020a170903304200b001d706912d1esm1664293pla.225.2024.01.18.14.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 14:20:42 -0800 (PST)
Date: Thu, 18 Jan 2024 14:20:42 -0800 (PST)
X-Google-Original-Date: Thu, 18 Jan 2024 14:20:40 PST (-0800)
Subject: Re: [PATCH] riscv: lib: Support csum on GCC <11
In-Reply-To: <20240118-museum-ample-11d649f95de8@spud>
CC: charlie@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-6127df88-9768-4f9d-8d78-a1aeb4213451@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_142046_669677_750ED241 
X-CRM114-Status: GOOD (  24.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 18 Jan 2024 14:05:44 PST (-0800), Conor Dooley wrote:
> On Thu, Jan 18, 2024 at 01:53:59PM -0800, Charlie Jenkins wrote:
>> The OutputOperands field for asm goto statements is only supported
>> starting from GCC 11. Split the asm goto to remove the use of this
>> feature.
>> 
>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>> Fixes: a04c192eabfb ("riscv: Add checksum library")
>> ---
>> The OutputOperands field for asm goto statements is only supported
>> starting from GCC 11. Split the asm goto to remove the use of this
>> feature.
>
> Maybe this is a super naive question, but is it possible to just not
> use the custom csum code for gcc older than 11?

Charlie and I were talking, these old GCC versions also don't support 
ZBB.  So I think we can get away with something like

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 06ce8e7250d9..17f883b612c9 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -158,10 +158,16 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 
 	/*
 	 * Zbb support saves 6 instructions, so not worth checking without
-	 * alternatives if supported
+	 * alternatives if supported.
+	 *
+	 * Note that we pull the check for ZBB into the preprocessor proper
+	 * here, as otherwise GCC will attempt to compile the code inside the
+	 * "if (IS_ENABLED(ZBB)" block which fails because GCC10 doesn't
+	 * support ASM goto output operands.  GCC 10 also doesn't support ZBB,
+	 * so we're safe with that check here.
 	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+#if defined(CONFIG_RISCV_ISA_ZBB)
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
 		unsigned long fold_temp;
 
 		/*
@@ -213,6 +219,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 end:
 		return csum >> 16;
 	}
+#endif /*CONFIG_RISCV_ISA_ZBB*/
 no_zbb:
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
@@ -244,10 +251,11 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 
 	/*
 	 * Zbb support saves 6 instructions, so not worth checking without
-	 * alternatives if supported
+	 * alternatives if supported.  See above for the ZBB preprocessor
+	 * check.
 	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+#if defined(CONFIG_RISCV_ISA_ZBB)
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
 		unsigned long fold_temp;
 
 		/*
@@ -287,6 +295,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 #endif /* !CONFIG_32BIT */
 		return csum >> 16;
 	}
+#endif /*CONFIG_RISCV_ISA_ZBB*/
 no_zbb:
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);

which is building for me on GCC-10/defconfig.

>
>> ---
>>  arch/riscv/lib/csum.c | 42 ++++++++++++++++++++++++++++++------------
>>  1 file changed, 30 insertions(+), 12 deletions(-)
>> 
>> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
>> index 06ce8e7250d9..23be289f52b6 100644
>> --- a/arch/riscv/lib/csum.c
>> +++ b/arch/riscv/lib/csum.c
>> @@ -177,22 +177,35 @@ do_csum_with_alignment(const unsigned char *buff, int len)
>>  				  : no_zbb);
>>  
>>  #ifdef CONFIG_32BIT
>> -		asm_volatile_goto(".option push			\n\
>> +		/*
>> +		 * OutputOperands in asm goto is not supported until GCC 11, so
>> +		 * this asm has to be split to be compatible.
>> +		 */
>> +		asm (".option push				\n\
>>  		.option arch,+zbb				\n\
>>  			rori	%[fold_temp], %[csum], 16	\n\
>>  			andi	%[offset], %[offset], 1		\n\
>>  			add	%[csum], %[fold_temp], %[csum]	\n\
>> -			beq	%[offset], zero, %l[end]	\n\
>> -			rev8	%[csum], %[csum]		\n\
>>  		.option pop"
>>  			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
>> -			: [offset] "r" (offset)
>> -			:
>> -			: end);
>> +			: [offset] "r" (offset));
>> +
>> +		if (offset == 0)
>> +			goto end;
>> +
>> +		asm (".option push				\n\
>> +		.option arch, +zbb				\n\
>> +			rev8	%[csum], %[csum]		\n\
>> +		.option pop"
>> +			: [csum] "+r" (csum));
>>  
>>  		return (unsigned short)csum;
>>  #else /* !CONFIG_32BIT */
>> -		asm_volatile_goto(".option push			\n\
>> +		/*
>> +		 * OutputOperands in asm goto is not supported until GCC 11, so
>> +		 * this asm has to be split to be compatible.
>> +		 */
>> +		asm (".option push				\n\
>>  		.option arch,+zbb				\n\
>>  			rori	%[fold_temp], %[csum], 32	\n\
>>  			add	%[csum], %[fold_temp], %[csum]	\n\
>> @@ -200,13 +213,18 @@ do_csum_with_alignment(const unsigned char *buff, int len)
>>  			roriw	%[fold_temp], %[csum], 16	\n\
>>  			addw	%[csum], %[fold_temp], %[csum]	\n\
>>  			andi	%[offset], %[offset], 1		\n\
>> -			beq	%[offset], zero, %l[end]	\n\
>> -			rev8	%[csum], %[csum]		\n\
>>  		.option pop"
>>  			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
>> -			: [offset] "r" (offset)
>> -			:
>> -			: end);
>> +			: [offset] "r" (offset));
>> +
>> +		if (offset == 0)
>> +			goto end;
>> +
>> +		asm (".option push				\n\
>> +		.option arch, +zbb				\n\
>> +			rev8	%[csum], %[csum]		\n\
>> +		.option pop"
>> +			: [csum] "+r" (csum));
>>  
>>  		return (csum << 16) >> 48;
>>  #endif /* !CONFIG_32BIT */
>> 
>> ---
>> base-commit: 080c4324fa5e81ff3780206a138223abfb57a68e
>> change-id: 20240118-csum_remove_output_operands_asm_goto-49922c141ce7
>> -- 
>> - Charlie
>> 
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
