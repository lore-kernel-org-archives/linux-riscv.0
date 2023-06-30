Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE3AEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6xAKQMEpqS6PKpKUfJMLWLmejut+D8pIjzDTYbN6FE=; b=ohwA0yBxFduHjt
	EcD8OQLLExj4X2w+VAhznMo8LhSUbKqQ8n+j2VISDo0ISEJ43Tx8paI8ir8czWVOkKBsfRyr6RSEe
	60J3qkYmDP2QesJONUvSQ/4Ea3naxg2pCBbxIRosQYmgSEJnqqNxVhmg4FX+Em0AV/7ZJ49NjZQhe
	qeVruT45/5cp35VkXYaZO7PMEjZmUI4pcIR/AEfhDL2MMF+MN2rko6DJZr11tfrfVnOCYONL7r/RG
	wyHPbuvBgploZ54vmtfvsCPl/oj204wA217bCYzsK6eDa4knEzS007FzO6n7VyvJBUgOXFB0+G0u8
	lNX7h5lEc1XBrDuNeNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIpp-004Ijx-06;
	Fri, 30 Jun 2023 18:27:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIpm-004IiT-0r
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:27:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-67ef5af0ce8so1844744b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149621; x=1690741621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+MGEKuy4Nf7dornYLukxVhbDcETcom+zcGjM3plM8Nc=;
        b=cVGunLYeWmUQGAQf3lovWRGWSR0TcbBHb4Y8apc2gLvK2jKN3WraWLIx+i1wC7syM1
         xNp3c2Dw0mxqK0Q9d7EstGXylZE3FY9I+IdulRH17Mk2q2T6pbCLQOIh/RNvpHiRWcbP
         164iVzp+JOTtRaP2xNJchQVZEjpiZaPGl+qRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149621; x=1690741621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MGEKuy4Nf7dornYLukxVhbDcETcom+zcGjM3plM8Nc=;
        b=ltZXbinJBJmsXpSoRCNJApOnuaa8jIOZinIXWNmLYJJGCZYnfF7/I0Px6YVjaNADSY
         A19eiX4egl6YtrHbS9S/HG6SM3/27YfJustwybeR25ovgFRqJAwzLgBP/ot5IkFnIB8U
         CBalJnQ2jSFlxe5UVQuh1BwqnQ1UEMbZ+iyLBijL/z6NL7/vtHVVtZL0WBBiXPYUsIQU
         hLs3E2l5RlkEajCehNCeBUP1tozTYdqL0qdVBQi6uz0GnwBHD+lKRJokHJkGmA88ZVzx
         taws1lmQ873ybIDR6os8TctX2/ZbfO6Bg6vYtBx94fNyJAmRJL/baUEpS8hIOh8O7yw7
         9gWw==
X-Gm-Message-State: ABy/qLbdR//5GqTdUgb6cAulbfRRjmwQlXG/PIAceOSx95bfPOzEWfaN
	/cVtdA1ATDWplViyWD0LbllR1g==
X-Google-Smtp-Source: APBJJlEUOk6Acl3a1g9AJCQfsFvKOayNdfseye6ROPl1IEsyWrEGF0ii1Iv4vcSYKV0m9f3h3pWsgA==
X-Received: by 2002:a05:6a00:2d12:b0:682:4ef7:9b0b with SMTP id fa18-20020a056a002d1200b006824ef79b0bmr4322828pfb.0.1688149620695;
        Fri, 30 Jun 2023 11:27:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v15-20020a62a50f000000b006528d9080f6sm5450990pfm.9.2023.06.30.11.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:27:00 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:26:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] riscv: Add CFI error handling
Message-ID: <202306301126.D7EC815A22@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-12-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-12-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_112706_305552_00AF91D5 
X-CRM114-Status: GOOD (  12.29  )
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

On Thu, Jun 29, 2023 at 11:42:49PM +0000, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler injects a type preamble immediately
> before each function and a check to validate the target function type
> before indirect calls:
> 
>   ; type preamble
>     .word <id>
>   function:
>     ...
>   ; indirect call check
>     lw      t1, -4(a0)
>     lui     t2, <hi20>
>     addiw   t2, t2, <lo12>
>     beq     t1, t2, .Ltmp0
>     ebreak
>   .Ltmp0:
>     jarl    a0
> 
> Implement error handling code for the ebreak traps emitted for the
> checks. This produces the following oops on a CFI failure (generated
> using lkdtm):
> 
> [   21.177245] CFI failure at lkdtm_indirect_call+0x22/0x32 [lkdtm]
> (target: lkdtm_increment_int+0x0/0x18 [lkdtm]; expected type: 0x3ad55aca)
> [   21.178483] Kernel BUG [#1]
> [   21.178671] Modules linked in: lkdtm
> [   21.179037] CPU: 1 PID: 104 Comm: sh Not tainted
> 6.3.0-rc6-00037-g37d5ec6297ab #1
> [   21.179511] Hardware name: riscv-virtio,qemu (DT)
> [   21.179818] epc : lkdtm_indirect_call+0x22/0x32 [lkdtm]
> [   21.180106]  ra : lkdtm_CFI_FORWARD_PROTO+0x48/0x7c [lkdtm]
> [   21.180426] epc : ffffffff01387092 ra : ffffffff01386f14 sp : ff20000000453cf0
> [   21.180792]  gp : ffffffff81308c38 tp : ff6000000243f080 t0 : ff20000000453b78
> [   21.181157]  t1 : 000000003ad55aca t2 : 000000007e0c52a5 s0 : ff20000000453d00
> [   21.181506]  s1 : 0000000000000001 a0 : ffffffff0138d170 a1 : ffffffff013870bc
> [   21.181819]  a2 : b5fea48dd89aa700 a3 : 0000000000000001 a4 : 0000000000000fff
> [   21.182169]  a5 : 0000000000000004 a6 : 00000000000000b7 a7 : 0000000000000000
> [   21.182591]  s2 : ff20000000453e78 s3 : ffffffffffffffea s4 : 0000000000000012
> [   21.183001]  s5 : ff600000023c7000 s6 : 0000000000000006 s7 : ffffffff013882a0
> [   21.183653]  s8 : 0000000000000008 s9 : 0000000000000002 s10: ffffffff0138d878
> [   21.184245]  s11: ffffffff0138d878 t3 : 0000000000000003 t4 : 0000000000000000
> [   21.184591]  t5 : ffffffff8133df08 t6 : ffffffff8133df07
> [   21.184858] status: 0000000000000120 badaddr: 0000000000000000
> cause: 0000000000000003
> [   21.185415] [<ffffffff01387092>] lkdtm_indirect_call+0x22/0x32 [lkdtm]
> [   21.185772] [<ffffffff01386f14>] lkdtm_CFI_FORWARD_PROTO+0x48/0x7c [lkdtm]
> [   21.186093] [<ffffffff01383552>] lkdtm_do_action+0x22/0x34 [lkdtm]
> [   21.186445] [<ffffffff0138350c>] direct_entry+0x128/0x13a [lkdtm]
> [   21.186817] [<ffffffff8033ed8c>] full_proxy_write+0x58/0xb2
> [   21.187352] [<ffffffff801d4fe8>] vfs_write+0x14c/0x33a
> [   21.187644] [<ffffffff801d5328>] ksys_write+0x64/0xd4
> [   21.187832] [<ffffffff801d53a6>] sys_write+0xe/0x1a
> [   21.188171] [<ffffffff80003996>] ret_from_syscall+0x0/0x2
> [   21.188595] Code: 0513 0f65 a303 ffc5 53b7 7e0c 839b 2a53 0363 0073 (9002) 9582
> [   21.189178] ---[ end trace 0000000000000000 ]---
> [   21.189590] Kernel panic - not syncing: Fatal exception
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Looks good -- should the noaddr failure paths include any warnings of
their own? (i.e. isn't that unexpected?)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
