Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D28CC05052
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnsdtTRatQuUYbjRIL43cESFyBXXyWd+bR1AyudXbRY=; b=0q/j8tVNPSLYkK
	NyfhgCxfFihpgzvJe+2ILziXHxVI6+aBjEyopvbqIYThiFq0ewF5seL3d7VMRo7NoZbZLODzfzebb
	pEwOJlQGET2VRIFnAzSLad3Ce7rbgCQlgHcrG+C0qVdYDWp9IoQHSyZXoRjyjCfvY0htt8BBQLt0s
	WGFz1tQd6x9TuSSSpnFxtfdqkCqRktZyh30K99QEk6M7gFId2I8AQDC3tZWiP5fRr0qPu/IrDbJBP
	eQ6LcvJAi6XIwVAIvEwz0OOVdcityyGF18BSk5g5ew9knjHGIAydnuWisuWtNUgIJvyDHlfJWDaqD
	H8NzvLLjnBc1BfYWcb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWtwR-007skA-0t;
	Fri, 18 Aug 2023 07:30:43 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWtwK-007si9-2I
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 07:30:39 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-99bf3f59905so70938766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1692343834; x=1692948634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nu5vRU+Ls6TvII7Q0Vdpj5U5jSrG/Osoam5r9jWleL8=;
        b=lXKHqegRZrlMfU5dvc9HqWRFicSIRCIvlo/PdAjhqUmjfqRK1rz0adpwnl0+BLHqfn
         1K1AfFwDMb9CKR/arhqO7ELjP5UK17fL588gxsJVLPksFDvVvh5zbclm7dk+Y5dEVbqD
         OkY6nD7yxVXJPg1lvEf/rGgFusJJ0pa7IK6GkAHHqlau2FGtZQnSx3Y9bhkVG5LHelTL
         Vc8Qh/4+p7lwdGJZXi6opSR1jAXmg6TSJDUhy8sMGYBSLCb9TOK1r67D48WAIlh45SbU
         m2IUgviDZ0aQUlFQ5+AzfUuw5VTOrI0aRqhGBMnmuneYZxLM0jDLyR8cIbcAUnitT7q5
         176A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692343834; x=1692948634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nu5vRU+Ls6TvII7Q0Vdpj5U5jSrG/Osoam5r9jWleL8=;
        b=cApNkjJkRzhPBZdJkh+NIeKH7KidOyk6WzuBAtikHGUNvbM7DszNbQ0lI39CMb4V2t
         W9UEy/K4UTFa7SmKqyMPcs8Ja+mdTKptcgCL++kF11JQOW7kvzATgGIt/XMiEVToZwmS
         Ho/osKmqXccegOgoNmAWsZT43j39NsSdsJFWlmVV06rMWdPnLBEO7D9hFlA0uiE4XhXP
         MBfVwMZDtiTc7Pgv8f4KoibXy0jhCN1tEQ76SA6IcZcOTgDDzsj9/SOa+/FYbf8al9PD
         ruS9Cdu81RcY5+Zle6iGrzuuc4st2SPAVYbSMM8BjxZjb8Z271FHH0DfTA+QFG0ZX5eN
         ppPQ==
X-Gm-Message-State: AOJu0YzWCzaFBPowahMR2nXr6jJBYft9+BbfZdRkE6FiUcxqDxs6ejJ5
	1K+6JY+vRysAr+TAA5YQnGIbBw==
X-Google-Smtp-Source: AGHT+IEsV5M/B1UbYyCeo0WYS5DT7wyD++pmpVV6vSVnEq/FsuPf4jkdM8SM0RY0TL9ZO5reeCNthA==
X-Received: by 2002:a17:906:10a:b0:99c:441:ffa with SMTP id 10-20020a170906010a00b0099c04410ffamr1431712eje.29.1692343834051;
        Fri, 18 Aug 2023 00:30:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709063e1400b00992b71d8f19sm838014eji.133.2023.08.18.00.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 00:30:33 -0700 (PDT)
Date: Fri, 18 Aug 2023 09:30:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, jrtc27@jrtc27.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, bpf@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, Ard Biesheuvel <ardb@kernel.org>, anup@brainfault.org, 
	atishp@atishpatra.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	bjorn@kernel.org, luke.r.nels@gmail.com, xi.wang@gmail.com, namcaov@gmail.com
Subject: Re: [PATCH 00/10] RISC-V: Refactor instructions
Message-ID: <20230818-63347af7195b7385c146778d@orel>
References: <ZN5OJO/xOWUjLK2w@ghost>
 <mhng-7d609dde-ad47-42ed-a47b-6206e719020a@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-7d609dde-ad47-42ed-a47b-6206e719020a@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_003036_753487_535AB852 
X-CRM114-Status: GOOD (  11.95  )
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

On Thu, Aug 17, 2023 at 10:52:22AM -0700, Palmer Dabbelt wrote:
> On Thu, 17 Aug 2023 09:43:16 PDT (-0700), Charlie Jenkins wrote:
...
> > It seems to me that it will be significantly more challenging to use
> > riscv-opcodes than it would for people to just hand create the macros
> > that they need.
> 
> Ya, riscv-opcodes is pretty custy.  We stopped using it elsewhere ages ago.

Ah, pity I didn't know the history of it or I wouldn't have suggested it,
wasting Charlie's time (sorry, Charlie!). So everywhere that needs
encodings are manually scraping them from the PDFs? Or maybe we can write
our own parser which converts adoc/wavedrom files[1] to Linux C?

[1] https://github.com/riscv/riscv-isa-manual/tree/main/src/images/wavedrom

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
