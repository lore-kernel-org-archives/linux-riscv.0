Return-Path: <SRS0=0HVj=JV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28232C433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Apr 2021 14:53:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E3461425
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Apr 2021 14:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E3461425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KKx/GkuyE5TY79/w9zlitm7RPcNYncNJmkzlBe0sS7c=; b=L+tHFeAgzHH5Ck5Ho734BhnOP
	Ticd9NAdfM80E68bv3z9S8hk8arFTqvG1Z0or7Q+40G6ZxsA7shHBdTUCRPOvEGvHJj0Cb7pt7Ovx
	l9ZFBC/9oJtWEBeJyVp1daWeGJM6HK0O0R+ovGMu+IUqDz5Z1G4GpGAkTrLsnOC+bHbu4sB+GpRpH
	EA6QZDO/OxwTTZ/n5cuWvp1GYkf39wjUj5Xo+4n5DIqdWEBA03LLtDN4D9izrzoeGjYqlJXTyDCLE
	FxXEuaYIbu8jOJlkZR/0ddsFt9KQxoaljBLMo+vJg2FgWDN3bnGX+foYhHtrpRBD6LJF/hepU6yRL
	xwxSelw/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laJeV-003zoS-4O; Sat, 24 Apr 2021 14:52:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laJeS-003znq-Cs
 for linux-riscv@desiato.infradead.org; Sat, 24 Apr 2021 14:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RMSJtaAHljPHWIgA5eXWHY4jUU8kVnxr1/o96vxGPvc=; b=YBFnR9qFV00319S4n+XF6jWlwt
 eDxfYVL5ms4WyT5HeMh+FNndCX96+9+qJ607FYVRY0syjPZaO0X2+ljkfM6/a2cGcEkbrCDAFdRdO
 y2OS/d9eYE42gwVLBR6Mt2x+cxaABnx3xzhuUEc81dXL2HWQ3fMKY89D3ZfF6bU96+Q5c2eorqkSu
 35d4+Cfb0a7aOx7NqFlOkVXgiOhrOrVnZE/mJbJBd2wY1jxkrmnOiucMKUiDhgMENHywobYgjZUAl
 OB4CLbWbYR8RbPeuI7wrEnRPNklYmOQWBfz5Gvo50R1dh1Y+JuXd2eJmSE3d971Vp4HeCSuoT6saW
 LrjyMEBA==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laJeP-00F3Oj-Di
 for linux-riscv@lists.infradead.org; Sat, 24 Apr 2021 14:52:55 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso2802589pjn.3
 for <linux-riscv@lists.infradead.org>; Sat, 24 Apr 2021 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RMSJtaAHljPHWIgA5eXWHY4jUU8kVnxr1/o96vxGPvc=;
 b=jwVFj7fFi04Uih5yN7dyCcSkNWQ9KZYO2uLF+dc5/x2665s4Zmzwgd6VOXVSxPRDO3
 J8ByLiQl0kpbJjm+BO6dkwT1ztPipgR+f8pDY8jGkK5lCJwiBS6vOHxPNn9KPesYC0uy
 Tfh3j3LA1xTSvksA3O/w9vYqFPVU0n5EtxlDxoVZaX1uzUMr2ug+ca4T9/2YimV6N5/2
 WHggJzFQQhykN3t+C6JKF607YhZ3n0DZB+OupuajsJEk780zCpbp2dHgSYbPUNVJya83
 SVvR0De+1ZR/lvSaM+Q5sIk/+doMx5hNFSBGyLqOpSvHcVFob+azM/sp6zHgAEvav+Cc
 7hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RMSJtaAHljPHWIgA5eXWHY4jUU8kVnxr1/o96vxGPvc=;
 b=uS29qDN0yJH7RLLHniGJ54j/8tuKGv1Z1E63Rrttj8SS7Y51FzF7AMM9mheSfE8czL
 041S1/fsfE2RKVj9TWrCVX5NjVN7GaxlZFin8+TJw8Y8NKi2Eo+Rw4EsaHoRnNRgvxXi
 ZEvwUbZEmZXeCiAqL1hJbT3zNf6iIJtxMZTbkS4XqHf7Lx+sEn0hEhKYkAp9Adwh+MCP
 q0mIgrL6A1S69b4ByMDC2AQ8eE2XAyZJkZ3v2jnmWkbWen7TKMV2ye6Uh/cPfmHWJnCn
 CDoFVvHGmJ3pq8rbRU+b9njeCcirKuNrz5pAyvAYtzwA+yNDWOdTdiZrc6Cn3OufoPb3
 55Vg==
X-Gm-Message-State: AOAM532NV2AbeBK+KQyHdAk4SFToYpYwRCGZ+oqqlI73IdD2CWpMoqZe
 k6H4RMdvomEQcsPDDv98ld4=
X-Google-Smtp-Source: ABdhPJyUzsgfNHHoGwE1pWlcUUULlzKI2lEw4N+jvpKQhcnfsoPUnXeg/CKR+rnZvJlf5q0IsqVvpw==
X-Received: by 2002:a17:90b:1646:: with SMTP id
 il6mr11713235pjb.27.1619275972061; 
 Sat, 24 Apr 2021 07:52:52 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id w134sm7712902pfd.173.2021.04.24.07.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 07:52:51 -0700 (PDT)
Date: Sat, 24 Apr 2021 22:52:26 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Changbin Du <changbin.du@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: patch: remove lockdep assertion on lock text_mutex
Message-ID: <20210424145226.ky74umiehhqgkjhc@mail.google.com>
References: <20210417023532.354714-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210417023532.354714-1-changbin.du@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_075253_508678_1738CFDC 
X-CRM114-Status: GOOD (  21.01  )
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

Ping for review status. This issue makes ftrace hard to use on riscv.

On Sat, Apr 17, 2021 at 10:35:32AM +0800, Changbin Du wrote:
> The function patch_insn_write() expects that the text_mutex is already
> held. There's a case that text_mutex is acquired by ftrace_run_update_code()
> under syscall context but then patch_insn_write() will be executed under the
> migration kthread context as we involves stop machine. So we should remove
> the assertion, or it can cause warning storm in kernel message.
> 
> [  104.641978] ------------[ cut here ]------------
> [  104.642327] WARNING: CPU: 0 PID: 13 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x166/0x17c
> [  104.643587] Modules linked in:
> [  104.644691] CPU: 0 PID: 13 Comm: migration/0 Not tainted 5.12.0-rc7-00067-g9cdbf6467424 #102
> [  104.644907] Hardware name: riscv-virtio,qemu (DT)
> [  104.645068] Stopper: multi_cpu_stop+0x0/0x17e <- 0x0
> [  104.645349] epc : patch_insn_write+0x166/0x17c
> [  104.645467]  ra : patch_insn_write+0x162/0x17c
> [  104.645534] epc : ffffffe0000059c6 ra : ffffffe0000059c2 sp : ffffffe002a33c70
> [  104.645580]  gp : ffffffe0019e5518 tp : ffffffe002a232c0 t0 : ffffffe01295e8a8
> [  104.645622]  t1 : 0000000000000001 t2 : 0000000000000000 s0 : ffffffe002a33cc0
> [  104.645675]  s1 : ffffffe000007f72 a0 : 0000000000000000 a1 : ffffffffffffffff
> [  104.645716]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000001
> [  104.645757]  a5 : ffffffe0799e45c8 a6 : 00000000000ca097 a7 : 0000000000000000
> [  104.645798]  s2 : 0000000000000008 s3 : 0000000000000f72 s4 : ffffffe002a33ce0
> [  104.645839]  s5 : 0000000000000f7a s6 : 0000000000000003 s7 : 0000000000000003
> [  104.645880]  s8 : 0000000000000004 s9 : 0000000000000002 s10: 0000000000000000
> [  104.645920]  s11: 0000000000000002 t3 : 0000000000000001 t4 : ffffffe000c615c8
> [  104.645958]  t5 : 0000000000007fff t6 : 0000000000000380
> [  104.645998] status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
> [  104.646081] Call Trace:
> [  104.646147] [<ffffffe0000059c6>] patch_insn_write+0x166/0x17c
> [  104.646280] [<ffffffe0000059ec>] patch_text_nosync+0x10/0x32
> [  104.646317] [<ffffffe000007d0c>] ftrace_update_ftrace_func+0x74/0xac
> [  104.646352] [<ffffffe0000d338a>] ftrace_modify_all_code+0x9c/0x144
> [  104.646387] [<ffffffe0000d3444>] __ftrace_modify_code+0x12/0x1c
> [  104.646420] [<ffffffe0000c4c2c>] multi_cpu_stop+0xa8/0x17e
> [  104.646451] [<ffffffe0000c4474>] cpu_stopper_thread+0xb2/0x156
> [  104.646489] [<ffffffe00003645e>] smpboot_thread_fn+0x102/0x1ea
> [  104.646524] [<ffffffe0000311b0>] kthread+0x132/0x148
> [  104.646556] [<ffffffe000002e02>] ret_from_exception+0x0/0x14
> [  104.646657] ---[ end trace ccf71babb9de4d5b ]---
> [  104.647444] ------------[ cut here ]------------
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  arch/riscv/kernel/patch.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b552873a577..6d2ed9c15065 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -49,19 +49,18 @@ static void patch_unmap(int fixmap)
>  }
>  NOKPROBE_SYMBOL(patch_unmap);
>  
> +
> +/*
> + * Before reaching here, it was expected to lock the text_mutex
> + * already, so we don't need to give another lock here and could
> + * ensure that it was safe between each cores.
> + */
>  static int patch_insn_write(void *addr, const void *insn, size_t len)
>  {
>  	void *waddr = addr;
>  	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
>  	int ret;
>  
> -	/*
> -	 * Before reaching here, it was expected to lock the text_mutex
> -	 * already, so we don't need to give another lock here and could
> -	 * ensure that it was safe between each cores.
> -	 */
> -	lockdep_assert_held(&text_mutex);
> -
>  	if (across_pages)
>  		patch_map(addr + len, FIX_TEXT_POKE1);
>  
> -- 
> 2.27.0
> 

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
