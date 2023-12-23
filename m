Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42043C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 03:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjGeGTB45clt/y8c+VjiAIvKF7SKoea5TkQMAteO4J0=; b=gHcNn1pE5RJjms
	OSLoXCK/0BpKySKGo0pShFFOjdrCK34KcTf0mrg87lv430F6513uGqgoHmuTCUMQUWyya9SBa836e
	EQ2h46tngAb0ckEI6Ov70xhe5LblXZS/i2SlaH4Dudwo9YUCFeNb5Cy/fyU58ULbVU9poRKcMZfty
	A1Sm1IM5v/6qkf3yPw2cCo45xjYX81ACooy5/8J3/eXPzknlWVRqwWHBCCatMaaryBsu4m3BMC1U+
	dr2kZcpDw/qe7zZ/vQMTvkkwo7QYW860Fz3WeynSc9pDzIqGe/sWw4cpneu8TRpT9ysOWsoA8haay
	tgX9F52+MsU04upUgdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsr5-007II4-0X;
	Sat, 23 Dec 2023 03:39:15 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsr2-007IHQ-2i
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 03:39:14 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-594361a3fd6so666461eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 19:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703302751; x=1703907551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwj8L7hiOAWlB8RKprTbYnCxIbCpgFGamvNe/uB4uQU=;
        b=bNYY/RoaQdAb+L15oZAbcHAaiWSPhgrG9rafg32o7CWuS4MDsFZ6h3PM88JFpqMjNf
         2RLiC5N2VqDrN31iEs3bFbPnrWm9MULGqgG9R6LK6NnFW8fU+5WSNwIZ0RaMVB51qV7f
         6Dbl8AkgeVU2Xry5RFNipPfXS5w1oSQippVWLBjuHISEl+gpCOvkCIExbhKVYnnf0X9l
         sFHa7lX0l0wa4JzU0NUF9rOk2jnw4Dhy02IrXEbACAizrTMYsGaBavCf7cDC2CT3Vaew
         r/U20tDsS8THI/bJNHrlBWY7kdRuK5//zmMRgSDqIbmA2mKkJNqpHmYGPvXbpifPvGDu
         hG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703302751; x=1703907551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwj8L7hiOAWlB8RKprTbYnCxIbCpgFGamvNe/uB4uQU=;
        b=d/5gq1/BRt9cLsQgtniuxT58iQIL6pj9PmRvtw16Neor/sjOIy+9quvuP6OWeIreAI
         +rfD1TBTZXPzyDM0IlcbO/rGWHDDhIvFVuApI52HPO/pk4XbitmJ8ITco4vkjqzfqry6
         wLPexlufOYTa9pJhQ52PWdDDaC5v5R74viSrdPuAZoOXWzoH+6uzIKQyWCO7+qhJv0Bl
         +jFEIXnOVxvFfdTKmnMHOOM9cw+BBhjMM2WJa5VQiWDhXbgVrkbwW9I3wfvALYWx5cOo
         qN6bKv4PE4GiFhS76fX7DMa/pkg06yvZ8JZxYUuBkzZXKd+pft7E+Tvvoyp1cfY98GvG
         V9rQ==
X-Gm-Message-State: AOJu0YyozjOt0xHDDpQ9h26zlKvRTcvBfywO2jjUX51IOblVsWQ9Zdo1
	LJmdsPl+mNZIb0uZ62xRg6/fWedRC9OdnA==
X-Google-Smtp-Source: AGHT+IGV7knx4f8lHnOC7V9FUkQIy8i9FV7aSDORB3Za7AEbrdfrH9pHxCNgo4060GBWclKCSX/g/g==
X-Received: by 2002:a05:6808:1441:b0:3b8:b607:13dd with SMTP id x1-20020a056808144100b003b8b60713ddmr1470549oiv.50.1703302751505;
        Fri, 22 Dec 2023 19:39:11 -0800 (PST)
Received: from ghost ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id de7-20020a05687075c700b00203af6ff47esm1235776oab.42.2023.12.22.19.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 19:39:11 -0800 (PST)
Date: Fri, 22 Dec 2023 19:39:07 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: guoren@kernel.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	alexghiti@rivosinc.com, xiao.w.wang@intel.com, david@redhat.com,
	panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com,
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org
Subject: Re: [PATCH V3 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Message-ID: <ZYZWW3373Zk1PRGq@ghost>
References: <20231222115703.2404036-1-guoren@kernel.org>
 <20231222115703.2404036-3-guoren@kernel.org>
 <ZYZLRNlEpVXECyq9@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZYZLRNlEpVXECyq9@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_193912_886320_939AE59D 
X-CRM114-Status: GOOD (  16.33  )
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

On Fri, Dec 22, 2023 at 11:51:48PM -0300, Leonardo Bras wrote:
> On Fri, Dec 22, 2023 at 06:57:01AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > When the task is in COMPAT mode, the arch_get_mmap_end should be 2GB,
> > not TASK_SIZE_64. The TASK_SIZE has contained is_compat_mode()
> > detection, so change the definition of STACK_TOP_MAX to TASK_SIZE
> > directly.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/include/asm/processor.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..e1944ff0757a 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -16,7 +16,7 @@
> >  
> >  #ifdef CONFIG_64BIT
> >  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> > -#define STACK_TOP_MAX		TASK_SIZE_64
> > +#define STACK_TOP_MAX		TASK_SIZE
> >  
> >  #define arch_get_mmap_end(addr, len, flags)			\
> >  ({								\
> > -- 
> > 2.40.1
> > 
> 
> 
> LGTM. 
> 
> FWIW:
> Reviewed-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
