Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2F3C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ykFeGGZ3tI5fYSlX5wFO87ZvJNwM03bYSNeint1WBkE=; b=t14UUwMQHbf4+okGWfo1KfTW6a
	hFRSVCbY1wRLx7AKqzCe0LIXQr5TwBaz2Ny6X2oZovTnGUYNK5NwzykgrSoqNcOphcnFLLZJ3L8gv
	Ezm0ePOstToX45d4Ual3RZ5piUc4es/wQoXT8C/V/l3B3C22qs9RbNyw1SXmyQGLroy4N5tC5S1lB
	MogH8MO8B8Th+EoJRwqUqtWInBqMJNF5qd0tCAEsFWti3ulanpBfUsTz4O/dCE1axw3DWy9M04lQB
	V8kmPOLZn/zjx6jxEyjGL6NuCl7ccrZNpLf13qGwNYYS+s1Tkc5y1+ZTNRW2Bqh90FMlQGJHd2jtv
	n8rtJSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpCw-00000004sRJ-2FJ8;
	Wed, 05 Feb 2025 23:53:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpCt-00000004sQD-3m8I
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 23:53:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21661be2c2dso7214185ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 15:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738799603; x=1739404403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ra5Mbg5OY3KVHpv79LQ4A0jzyK7crMbEFKoAz+DcSV8=;
        b=fsLPH8ReYY6gUGkMk/YDtbP5RW8HJansM577anwAOScUCOzoivK/bOHKBLUyejcoMM
         uqnCii3sRuRy+k/QjA5AI7Twbeai1V9co03pytvCgqpBllg+e+21yzXNx7Z4Pa5PtpkQ
         uXxtxcz7C9DiEY/0LtHCLdS1ObjCy49nP1fnplofgcmQxFITyE+nZWLmKRY18aPPQxOC
         V3kUdVBzvs17ZEzc6cj5Y3NBdpgX0pmPuRVn6Kc6GoU9QePkB9nj5ej9g9eN79fdtVN0
         lNkhH2dZBGCp3Nwny8PLR2BBoO+Teo4Q2MuGKvVHFD45UM1iKcYb4iL5EKrJuhcpjF6x
         OTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799603; x=1739404403;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra5Mbg5OY3KVHpv79LQ4A0jzyK7crMbEFKoAz+DcSV8=;
        b=lpAZWXuYMZoIEWYPYulsaH3dLm7tew0bQ/M3HIe9oHnMbI6c5Z3Zql7P1z3EijR/uu
         ytuwqiyopE19hux4MySr2N86Og/zPmEzWxlunB9uIYGFNDXfIVP45sjnzwAVE0iC7Jvq
         TwSmJNONo2W+taT6WWj+KLZWekKrHm+arp7ETdJH0v7Jqhh2jrBTlJEgoXrqWd6P8Oe4
         GV0iTMokyd8b811T1aC3aVlmi/3btC7dNPbMpUKqvTq5/ZJpSDY+9yHBqW/p25ioIRkM
         imQxyk0Sx6dzuxhvcZTJ8kcwY1w3xLcKuDChwpeRju0CgXmWsUtxYxbfwQWtkxArfFtj
         ethw==
X-Forwarded-Encrypted: i=1; AJvYcCUrnj1qXRyAI9ZFo4AA828JoMsJxbUeqiiDVSHKrzcuRizQlOqpgD9Pvom2YvO6txCj18H4jNrHNIWCjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKfyjaWed7Xb/Kj5kYweYs2flzMBEbG3mVYisXtEmXcIbX0CSU
	2cDqnFssjKDExuBj2viw1hPKm7QNjuAiCtpYgeSzMQ70x3xJ6GDlIY265CXG0WI=
X-Gm-Gg: ASbGnctJyGUduXSxfSBFAY7algBN0Rve5yLpRswKtk53sCn3DxnvEZEYrVvn3joxoi4
	7PG5pQvYLDS4aDdV07jXdNzFACCv6Wizycw9OOQAaSLJU+MVftzmOCJeWCoi8qeTl2cG2/DxhKY
	njd5HMV69eX2Oz/DlzgaLo3Zse74Mv6H99OMuqYWl87mVZl+txq7l3/HI8+KFBIrg0KZgDGw5zP
	3ROWiLxd7HCXU+qUB1Kx32GmTrupeHWVxkIl9+rRTrDMnQTR119x4pYVy4pswyAgUXiYdVFEAIl
	8oSAO7Od5+VE
X-Google-Smtp-Source: AGHT+IESlnEloTRkMdGmIgpHf3GHd5Z19yX7ObK7xTCBbFAJo4c09Hwxk6ijfuAekNIxp8Vwcvp0xg==
X-Received: by 2002:a05:6a00:e84:b0:725:f097:ed21 with SMTP id d2e1a72fcca58-730351b9a07mr6070010b3a.15.1738799602709;
        Wed, 05 Feb 2025 15:53:22 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e1e792sm21788b3a.161.2025.02.05.15.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 15:53:21 -0800 (PST)
Date: Wed, 05 Feb 2025 15:53:21 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 12:41:24 PST (-0800)
Subject: Re: [PATCH v2] RISC-V: hwprobe: Use BIT macro to avoid warnings
In-Reply-To: <422ee6c5-048d-498e-a823-97deef02326f@ghiti.fr>
CC: jesse@rivosinc.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, cleger@rivosinc.com, Conor Dooley <conor@kernel.org>,
  Evan Green <evan@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, ajones@ventanamicro.com,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-2665f589-5f29-42fa-9c6e-3b00a39c38de@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_155324_189079_2102001E 
X-CRM114-Status: GOOD (  21.67  )
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

On Sun, 25 Aug 2024 23:28:17 PDT (-0700), alex@ghiti.fr wrote:
> Hi Jesse,
>
> On 22/08/2024 22:39, Jesse Taube wrote:
>> In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit field
>> which causes checkpatch to warn. Use BIT(N) and BIT_ULL(N) to avoid
>> these warnings.
>>
>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
>> ---
>> V1 -> V2:
>>   - Reword commit message
>> ---
>>   arch/riscv/include/uapi/asm/hwprobe.h | 102 +++++++++++++-------------
>>   1 file changed, 51 insertions(+), 51 deletions(-)
>>
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
>> index b706c8e47b02..d0874ff2fd37 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -21,57 +21,57 @@ struct riscv_hwprobe {
>>   #define RISCV_HWPROBE_KEY_MARCHID	1
>>   #define RISCV_HWPROBE_KEY_MIMPID	2
>>   #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
>> -#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
>> +#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	BIT_ULL(0)
>>   #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
>> -#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
>> -#define		RISCV_HWPROBE_IMA_C		(1 << 1)
>> -#define		RISCV_HWPROBE_IMA_V		(1 << 2)
>> -#define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
>> -#define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
>> -#define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
>> -#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
>> -#define		RISCV_HWPROBE_EXT_ZBC		(1 << 7)
>> -#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 8)
>> -#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 9)
>> -#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 10)
>> -#define		RISCV_HWPROBE_EXT_ZKND		(1 << 11)
>> -#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 12)
>> -#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 13)
>> -#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
>> -#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
>> -#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
>> -#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 17)
>> -#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 18)
>> -#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 19)
>> -#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 20)
>> -#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 21)
>> -#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 22)
>> -#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 23)
>> -#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 24)
>> -#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 25)
>> -#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 26)
>> -#define		RISCV_HWPROBE_EXT_ZFH		(1 << 27)
>> -#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 28)
>> -#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
>> -#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
>> -#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1ULL << 31)
>> -#define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
>> -#define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
>> -#define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
>> -#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
>> -#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
>> -#define		RISCV_HWPROBE_EXT_ZVE32X	(1ULL << 37)
>> -#define		RISCV_HWPROBE_EXT_ZVE32F	(1ULL << 38)
>> -#define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
>> -#define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
>> -#define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
>> -#define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 42)
>> -#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 43)
>> -#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
>> -#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
>> -#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>> -#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>> -#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
>> +#define		RISCV_HWPROBE_IMA_FD		BIT_ULL(0)
>> +#define		RISCV_HWPROBE_IMA_C		BIT_ULL(1)
>> +#define		RISCV_HWPROBE_IMA_V		BIT_ULL(2)
>> +#define		RISCV_HWPROBE_EXT_ZBA		BIT_ULL(3)
>> +#define		RISCV_HWPROBE_EXT_ZBB		BIT_ULL(4)
>> +#define		RISCV_HWPROBE_EXT_ZBS		BIT_ULL(5)
>> +#define		RISCV_HWPROBE_EXT_ZICBOZ	BIT_ULL(6)
>> +#define		RISCV_HWPROBE_EXT_ZBC		BIT_ULL(7)
>> +#define		RISCV_HWPROBE_EXT_ZBKB		BIT_ULL(8)
>> +#define		RISCV_HWPROBE_EXT_ZBKC		BIT_ULL(9)
>> +#define		RISCV_HWPROBE_EXT_ZBKX		BIT_ULL(10)
>> +#define		RISCV_HWPROBE_EXT_ZKND		BIT_ULL(11)
>> +#define		RISCV_HWPROBE_EXT_ZKNE		BIT_ULL(12)
>> +#define		RISCV_HWPROBE_EXT_ZKNH		BIT_ULL(13)
>> +#define		RISCV_HWPROBE_EXT_ZKSED		BIT_ULL(14)
>> +#define		RISCV_HWPROBE_EXT_ZKSH		BIT_ULL(15)
>> +#define		RISCV_HWPROBE_EXT_ZKT		BIT_ULL(16)
>> +#define		RISCV_HWPROBE_EXT_ZVBB		BIT_ULL(17)
>> +#define		RISCV_HWPROBE_EXT_ZVBC		BIT_ULL(18)
>> +#define		RISCV_HWPROBE_EXT_ZVKB		BIT_ULL(19)
>> +#define		RISCV_HWPROBE_EXT_ZVKG		BIT_ULL(20)
>> +#define		RISCV_HWPROBE_EXT_ZVKNED	BIT_ULL(21)
>> +#define		RISCV_HWPROBE_EXT_ZVKNHA	BIT_ULL(22)
>> +#define		RISCV_HWPROBE_EXT_ZVKNHB	BIT_ULL(23)
>> +#define		RISCV_HWPROBE_EXT_ZVKSED	BIT_ULL(24)
>> +#define		RISCV_HWPROBE_EXT_ZVKSH		BIT_ULL(25)
>> +#define		RISCV_HWPROBE_EXT_ZVKT		BIT_ULL(26)
>> +#define		RISCV_HWPROBE_EXT_ZFH		BIT_ULL(27)
>> +#define		RISCV_HWPROBE_EXT_ZFHMIN	BIT_ULL(28)
>> +#define		RISCV_HWPROBE_EXT_ZIHINTNTL	BIT_ULL(29)
>> +#define		RISCV_HWPROBE_EXT_ZVFH		BIT_ULL(30)
>> +#define		RISCV_HWPROBE_EXT_ZVFHMIN	BIT_ULL(31)
>> +#define		RISCV_HWPROBE_EXT_ZFA		BIT_ULL(32)
>> +#define		RISCV_HWPROBE_EXT_ZTSO		BIT_ULL(33)
>> +#define		RISCV_HWPROBE_EXT_ZACAS		BIT_ULL(34)
>> +#define		RISCV_HWPROBE_EXT_ZICOND	BIT_ULL(35)
>> +#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	BIT_ULL(36)
>> +#define		RISCV_HWPROBE_EXT_ZVE32X	BIT_ULL(37)
>> +#define		RISCV_HWPROBE_EXT_ZVE32F	BIT_ULL(38)
>> +#define		RISCV_HWPROBE_EXT_ZVE64X	BIT_ULL(39)
>> +#define		RISCV_HWPROBE_EXT_ZVE64F	BIT_ULL(40)
>> +#define		RISCV_HWPROBE_EXT_ZVE64D	BIT_ULL(41)
>> +#define		RISCV_HWPROBE_EXT_ZIMOP		BIT_ULL(42)
>> +#define		RISCV_HWPROBE_EXT_ZCA		BIT_ULL(43)
>> +#define		RISCV_HWPROBE_EXT_ZCB		BIT_ULL(44)
>> +#define		RISCV_HWPROBE_EXT_ZCD		BIT_ULL(45)
>> +#define		RISCV_HWPROBE_EXT_ZCF		BIT_ULL(46)
>> +#define		RISCV_HWPROBE_EXT_ZCMOP		BIT_ULL(47)
>> +#define		RISCV_HWPROBE_EXT_ZAWRS		BIT_ULL(48)
>>   #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>>   #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>>   #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
>
>
> Why isn't this one ^ converted too? I did not look but are there other
> occurrences in this file that should be converted too?

They're multi-bit values, I poked around looking for a macro and 
couldn't find any.  That said, the "<< 0" doesn't do anything -- it was 
there from back when we though we'd pack multiple values into this, but 
we screwed up some of the value/bitmask on this one so it's deprecated.

So I'm just dropping the "<< 0"

> And what about the rest of the riscv sources?

Probably Jesse was just squashing the checkpatch warnings in the files 
she touched.  Either way I think it's a reasonable cleanup, I'll send a 
v2.

>
> Thanks,
>
> Alex
>
>
>> @@ -85,6 +85,6 @@ struct riscv_hwprobe {
>>   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>>
>>   /* Flags */
>> -#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
>> +#define RISCV_HWPROBE_WHICH_CPUS	BIT(0)
>>
>>   #endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
