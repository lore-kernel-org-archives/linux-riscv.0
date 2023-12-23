Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A8CC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 02:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3v5j6rKAAjTOgP9nuV4bBKuo3Zok2BJjjhlEShTOUE=; b=spRwwQTZIRenUY
	TdJF4KRsUTYFyQZEQiTlIr4OIy/hfrXdgYkqlyWOtvnV4ys8mYifxI6Ln6y44JVUIh3zpwEPfbsfu
	Kb/5ObNvSp1ek/+tmqo8e6u13Z4Lhyso0HDRvv8pLR312d0Swoxr898puzofO1WmiLM+VYAT3ZXEg
	T9KeJ6avsh5vCFT6awr0DdGrZ/92TUUMaDiPDsCz5AbSxCdLoPtgmehFQzsSbnXEppbPIl6hm3v0I
	hJdyYEX1JK2wyhoxkQ4fr7+QBn5pHWnnnebTyZi5DE5cTEta448Vg1MAnA1kRm1mRCvTdQLQmiLd1
	Nyv80vxm06aQmzsbG1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsDL-007DrO-0Y;
	Sat, 23 Dec 2023 02:58:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsDJ-007DqY-0h
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 02:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703300288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7/gIS0dmThAjHMew85bTo42lIhhQ7TiHTigvXZh07g=;
	b=EisaBF7ZlwS71aaiR2UxjWLbgBnUxaYzFoQ0ISy8M0CRN6GL7IRuA3wKMBjsvgkncJg+eO
	gGuL19msv4ZHVUn/J+X60eBU/GAiVaH+6nMCX+ARevRCeLDnTABMBYXIbzuDGpawEccjgQ
	SQ7e1m0az0F3rKk6aGh1zYiDQEP6Wms=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-66PKXtxEOd-44dQMClNgPg-1; Fri, 22 Dec 2023 21:58:06 -0500
X-MC-Unique: 66PKXtxEOd-44dQMClNgPg-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5919d9e57a3so2667062eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 18:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703300285; x=1703905085;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7/gIS0dmThAjHMew85bTo42lIhhQ7TiHTigvXZh07g=;
        b=mB7JDt22HU+d5iq6n+N9Fuovjowe1ExRfkfVGSa7dwNmk+8U+/1IB1WLMza2n0NoFo
         HLRRklEp4oeYWb4kVMaPKzKwDsQDIjzoOsteRPdiFfu9jHCiyjq5kO50Gog0KtHtWQfG
         w+gtTNt/WnI8wn9joO6QK+rQUjcB4vZpJTaLB/rJzS/gN08ZQoCkeAyAx1qsJBy9jQ/O
         RYhNsa2fpp6kb5xaxAM+EO9SERzWmAd4fY+Tdc9rjxYSOfPlaKK6a1GE1LOvCZ9dVeXh
         JUUDCEb1j7X33EWxhtbuwxq9rKBBHR/r5eETp5T4IrkDq7HSa6ByfInvjfCUZPK1L+HP
         Zkxw==
X-Gm-Message-State: AOJu0YzIsrrGC/vSmVEIMik8cMzXqpD1KFIiKInmElSq/QQcIKwW0Ow7
	o5XOFYhQt9S67PDvuc8QlTXqfF6tOX9kuoRgd+GKzNdIq1sxTRuIjaf1lLuNJhVUpslhwE1xHlJ
	uDhYpqqAJZVbG9RuyPsU/OnWyhz5NTDH97hbB
X-Received: by 2002:a05:6358:281e:b0:172:b539:3fcd with SMTP id k30-20020a056358281e00b00172b5393fcdmr2520772rwb.53.1703300285393;
        Fri, 22 Dec 2023 18:58:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp/Z1JKa0hiVBtqCwmkFA7+oaDvqiyyXhUWFWFs5CbKJ6sOloXd7Rb4vykiapW96ln36Ga+w==
X-Received: by 2002:a05:6358:281e:b0:172:b539:3fcd with SMTP id k30-20020a056358281e00b00172b5393fcdmr2520762rwb.53.1703300285090;
        Fri, 22 Dec 2023 18:58:05 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ed:60ec:45a7:dfa:5e5:9eed])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090aae0800b0028c2b4f5f32sm335968pjq.3.2023.12.22.18.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 18:58:04 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH V3 1/4] riscv: mm: Fixup compat mode boot failure
Date: Fri, 22 Dec 2023 23:57:54 -0300
Message-ID: <ZYZMsgL9Bcz1J_Bd@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222115703.2404036-2-guoren@kernel.org>
References: <20231222115703.2404036-1-guoren@kernel.org> <20231222115703.2404036-2-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_185809_338601_E6E5FA69 
X-CRM114-Status: GOOD (  20.44  )
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

On Fri, Dec 22, 2023 at 06:57:00AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> In COMPAT mode, the STACK_TOP is DEFAULT_MAP_WINDOW (0x80000000), but
> the TASK_SIZE is 0x7fff000. When the user stack is upon 0x7fff000, it
> will cause a user segment fault. Sometimes, it would cause boot
> failure when the whole rootfs is rv32.
> 
> Freeing unused kernel image (initmem) memory: 2236K
> Run /sbin/init as init process
> Starting init: /sbin/init exists but couldn't execute it (error -14)
> Run /etc/init as init process
> ...
> 
> Increase the TASK_SIZE to cover STACK_TOP.
> 
> Cc: stable@vger.kernel.org
> Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index ab00235b018f..74ffb2178f54 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -881,7 +881,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  #define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
>  
>  #ifdef CONFIG_COMPAT
> -#define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
> +#define TASK_SIZE_32	(_AC(0x80000000, UL))
>  #define TASK_SIZE	(test_thread_flag(TIF_32BIT) ? \
>  			 TASK_SIZE_32 : TASK_SIZE_64)
>  #else
> -- 
> 2.40.1
> 

I am not really involved in the issue this is solving, so I have no 
technical opinion on the solution. 

IIUC there should always be (TASK_SIZE >= STACK_TOP), so by itself this 
is fixing an issue.

I have reviewed the code and it does exactly as stated into the commit 
message, so FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
