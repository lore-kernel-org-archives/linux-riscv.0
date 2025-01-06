Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5DFE77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qOGBB+I7dtwwGva1w24daASxPN3Ue+Ia6snwyNBdyg=; b=xb63mVLx0ush5Q
	mpy4mfleTmHT4XMZDMk0TiNDGS+EryLNFlWZTFpKuS62rVBEqTbiiFwFCCmxSPehaTc4SKBc6HLhd
	QWZhBb8FFCKJC+QJ4EEnUBmB4rSAgHvfr1r4dc4/edocA+pQF0JiieEK5G9bPMTwhZOVGcclTWFzx
	bHQp1hrtUh8N6Y1umwuDnTc9Jka+FsDRiQX6nI8IsNwKLbtYNrfblr1YeVsjELgWDa2EgvQSd1Tlv
	v6AafO2ZSbmM/tAcM2dThczQcYbWsuea9zv8YbrotbpZWzCZyf5JLsR4dIEE2rp/cbcImFYk62t+o
	sbShhqVwKuCNbNor6LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoVO-00000001g8b-3WHd;
	Mon, 06 Jan 2025 14:54:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoLL-00000001cYR-47qf
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 14:44:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216401de828so196142665ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 06:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736174674; x=1736779474; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
        b=Rlh/9xjXK2Dii6eJOv0At1o6MrcJZXqiaC9rM2aMSgJGN7m4N8/5IH4Ud1EfeH4E6R
         4LYJ75YJorOPgje+DQmHp9fvPPuMtHwTAK4wEO/jlGQ/RN8XXxS+NAB/juRwE0Dcwmgv
         7aztfE3DfKksNPIsYOB7cHQZGOuGjjPKhUVQ/yX5aqEP4x8iTE91YcQFTDy52jKBMnZc
         uAL0b/PK+GjB5KFeg65TfGBlT79bWSJtwIVOdETTmbEhqscVcyNGg6xIyWC2tGdJ6Nxb
         1/02sOVxL47qeg9T4H81kHDesMsGOKBVoc5SnOOQSndv/O3RHpR/6MDdGIhv2gwqWx6p
         k4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174674; x=1736779474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
        b=s6lLe2pLlw4H+Z93l8F3PceoyzR2lM2nU/2nxE/cF9yhXiYsExlabbocfazoTbrUQc
         aqtqmUg+N3RpSLjrpJxxL7pULd1qFt5JriO7ulaJGgOLX5AsQlr4w0Rg5Wo6W/yIh7Tq
         vUvlJjiArINzs4oBtCewkI2gUsvda5W+u/beq1z5QeX7hdL1EE5ca6hUPE/cEQpnLPIX
         ski5jRpkf/k5J/ncJQvT664PNnZnQPQNJgfRfQBJzYve0Y8TdgViysZyop4m0XkUgIgw
         nekKyeQ2R+jWmUlyCR4wuR9I8zxnSZpfcPyvUu2nwr2qLQYi2NE/j+EdPj1Ucwm7nTnw
         qAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpyh70cHvc7lI5R4GSdvr763aRTHOwCsmDXPSqS5ZGaxjzHiVOsnjsTeKT0G9P3gVM3fCrZBvf9CwePw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXxe0ZESXwYHydj/ltCGwX/al9iLfuJblfHQSHeMJqvgvt6Xsd
	UdP/4bLJHgLfpQVeMzr2wN5rvluhI0n8r1u55BW7hTjCoujpsgb/VJDaggrepd8=
X-Gm-Gg: ASbGnctTbCwVBns9CcLJ9YlaGG0VIfwhtfdSvgNDEM+Q1ZJULPXypn1osfT3jm28mmb
	kRcPgdGkR10VijWTh/Iq771k40ShTy+kjiqN6KV4Vt8751airO8+I94Kka1UdYSd3WJRxkE6MiI
	a8OonR35oAveprJkKGwnFn6oSFTsSR59bdZ0VGDbvF8dDv2e9lg5OOYLnlLAbyj6E74YhsjuAd5
	hM4fABwUqve8vMjFuaLFoU3w3XuqfPGoqXaDzRkxjpU5XxL4k/AehealtirrtRe17za+bFYQfDk
	usXG0cJ7D7Id+C22H+A2S0uhe/wW57438bQRmWwnHldgaiGyOZWZ
X-Google-Smtp-Source: AGHT+IHfRKlSBRBXUw7mHIW0SQFNESOEWbBrtQcBXd7/ffhetsdlBCZHRjeTrMJdIBfoDiMG7l+wRg==
X-Received: by 2002:a05:6a00:ac3:b0:726:f7c9:7b1e with SMTP id d2e1a72fcca58-72abddcadd6mr82367083b3a.13.1736174674262;
        Mon, 06 Jan 2025 06:44:34 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815804sm31532588b3a.32.2025.01.06.06.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:44:33 -0800 (PST)
Message-ID: <dbcbf4c3-f86a-4414-be52-8ac02dae5b6b@bytedance.com>
Date: Mon, 6 Jan 2025 22:44:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD
 to __tlb_remove_table()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
 <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
 <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_064436_974959_81F15BD1 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2025/1/6 22:35, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 09:34:55PM +0800, Qi Zheng wrote:
>> OK, will change the subject and description to:
>>
>> s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()
>>
>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>> PMD|PUD|P4D to pagetable_dtor_free().
>>
>> But pagetable_dtor_free() is newly introduced in this patch, should it
>> be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
>> strange. :(
> 
> s390: pgtable: consolidate PxD and PTE TLB free paths
> 
> Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
> freed - same as it is done for PTE tables. That allows consolidating
> TLB free paths for all table types.
> 
> Makes sense?

Ah, make sense. Many thanks to you!

Will do it in v5.

> 
>> Thanks!
> 
> Thank you!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
