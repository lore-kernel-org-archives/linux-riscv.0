Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521BFC87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0B85QceiBNQffCPMPs4m4HuiM11AVJ/nBiPAx3Z4zTQ=; b=iaxEdTpv2dy00N
	mXtQNal4zI4qF5XKcUbc7GKcutVgTRI+HsGO2DRHvdmAtFVwJ0hZKXXJKNsiqSKborLQQrq/v1zyk
	p87Ky1u6Ptiz0pFPk75SIPcdM2tNlZDM4DThXccbk/AmpCfPkf1hUnBbcEtT9bYAm2NJKwTBFA7Vl
	XTqkOMjZCaN+TVsQtvjtA+SrmkX5Rx99C4SxaZQ5AtTHzbyqawPeequx7p74J56DjmIKfaT5T+ikP
	JhRxb+X36j8KZp2ivSrka7w1LYyQ9qp6s9mL3QX6YyTUNqfQN4t517lTLuW+9E14R2FVfv9BDLG3H
	Sk+CYg5F7HzCXCX0x52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCHM-00000009C6Q-2RlD;
	Fri, 25 Jul 2025 06:51:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBtF-00000009A7B-0uE6
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 06:26:46 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E4C1D3F942
	for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 06:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753424803;
	bh=i7Z45Di1DKvPrIvb2/CHdBXTyeDYviINQxq/IZOTBeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=v7Tjns5sD6mCbcC9bkQSV7leVBBvPpvtt3CSuocamVImiqdXosoRsHzyGhfrlGIqb
	 k+u1jI+KoxsIJObWsVddIouGUv2ufC4LWI35dlvWAuZiQDJG5wmyxAMkce25lVK7PA
	 o/Rb8h9IEQJZjOXcpMVeLYp5/Nq/OhXlkfDNsocyzABFLL26Pfj3wZr8zJdW94JCYF
	 hGF+L5K3+0QlMZce6fcNJ2QHaD7aGveRItSwHqaAXf0pNipFtuAsYvtIQw36SqeYTV
	 U4MftAq0fJfVDCY5iDSdSge5xHkNYy15sthHzX5CZHPFfS3rOG6eF/y8kg2KGZu09A
	 rXadJynCgT31Q==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so1035383f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 23:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424802; x=1754029602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7Z45Di1DKvPrIvb2/CHdBXTyeDYviINQxq/IZOTBeg=;
        b=T4HDQ5In3HBge6QXuoaaCx85oljizHZam21EFe3vjXFH7lcE1Uex3aBPFlJ5N8qexS
         dTa5ObxCNGvw9me33JK7vXqpuFqgdYau9sWxi+7Os23gW6i8g05i9ssrVUEv9eMiwngJ
         9rcc4LpghrOdEqElcqRkcfzBbDIRD+tMEb4gGSscO02EMpH4KwhkoaM4H1DzMTmb4kT4
         E3I0RQtsAlpZvl1fMv0BVEEwQ2nz3G4ywh6fXP/mhb8Flyc4H7N2CnjrskeDFMtbh4T/
         7vrqWIeGq+RHii7UjxSEj5qB2OnC5DxLaDDympSz5bERYkJA4UL+9rr6v751YBeEwCd8
         NR9Q==
X-Gm-Message-State: AOJu0YzOVLz+pkqR2cNRseec0/tlGmFDKKoBj20Ons1AJDYDXDTrvc7N
	7/YG7nBqShgGSDIAe4/bKjs6RjaU2oMZbuUOgSXDYVn8OS0+ai55bdDWabN2C46/0ZQnHU2f6EZ
	AXt0+P4XLmwKzTkbkhBQ8Y2/FHC5c+5J3QjzRU2pRY4O3z7hkqDz7VYq8MHQAr5kaG+Qtg/NFUk
	GwkPZw47mKUw==
X-Gm-Gg: ASbGnctNLOzba/AwRDMcotncrumC+7AsR/Y/xl4GLDA+hKLBpaIoyfuUHmQ9siEOr+9
	PQDlGwkgOp49UOi7KNPmFvBaytl9Iq76gguR667KX4dzV0lv5uFPG9LdIq+jefROn5sTM0O5FHJ
	ohmdZ8LtckRTfXniMhMLatseXWYI3HmEhPfHn/9zouEE+7Tr2mGZOtTvj4yYJjGOJdiEd1UMjK2
	rUy5NM67YuWvNr/ZhNQPLb3O8B52Tuq8cSlIPNHVJku4h3DTpdqevQc1KKzMJ338/2p4piodLZ/
	/dvurlsZUCEwN36iM6x3rsOwpViNCJefWr0UwrEOxwe0tjwb5xfmDwIXFalAnNSCUasg1Lmf3/I
	dNX6WvQcvfiCc6gseKCkM9psWWXxg5knu+Lko
X-Received: by 2002:a05:6000:1a88:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3b77671592amr538343f8f.1.1753424802540;
        Thu, 24 Jul 2025 23:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTcbhP+qpBUFcpUqfk2Wp/N8FXB7Xsc01E0wuMcV6UBfsne+SnFue51uathOre6C5p/D/OcQ==
X-Received: by 2002:a05:6000:1a88:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3b77671592amr538323f8f.1.1753424802160;
        Thu, 24 Jul 2025 23:26:42 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcacf0bsm4109538f8f.38.2025.07.24.23.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:26:41 -0700 (PDT)
Message-ID: <0532c555-1876-449b-89cb-36ce5394433f@canonical.com>
Date: Fri, 25 Jul 2025 08:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] riscv: indirect jmp in asm that's static in nature
 to use sw guarded jump
To: Deepak Gupta <debug@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_232645_395444_C8E9CD2F 
X-CRM114-Status: GOOD (  14.03  )
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

On 25.07.25 01:36, Deepak Gupta wrote:
> Handwritten `__memset` asm routine perform static jumps within
> function and uses `a5` to do that. This would require a landing pad
> instruction at the target. Since its static jump and no memory load is
> involved, use `t2` instead which is exempt from requiring a landing pad.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/lib/memset.S | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index da23b8347e2d..c4a318d8eef3 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -56,12 +56,12 @@ SYM_FUNC_START(__memset)
>   
>   	/* Jump into loop body */
>   	/* Assumes 32-bit instruction lengths */
> -	la a5, 3f
> +	la t2, 3f
>   #ifdef CONFIG_64BIT
>   	srli a4, a4, 1
>   #endif
> -	add a5, a5, a4
> -	jr a5
> +	add t2, t2, a4
> +	jr t2
>   3:
>   	REG_S a1,        0(t0)
>   	REG_S a1,    SZREG(t0)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
