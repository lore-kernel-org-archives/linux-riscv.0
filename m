Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59F4C83F34
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oAGNbUV+wIzK5KUSZNG23iZ6zLboHc1lT+jneP7RP8=; b=iZnxeNrKP5GBIs
	Z70+ix7S5MlXeDQd/vmkBK2gqVzZ9M+yvp4pqU4G5sjOKUj9zyfbsIcRqgN1KGWPvreKiBkoj7a9y
	ykjQRxRtUxX/kBBoW0eeeNG0BnMvHvB8WeLHIxNWkHHD1EMx5gRx1tpUcNXD1o/HFcyIPBN87NgDH
	nNb/V6s7WWAmgIzhTzjvrU+bfnt4o76HMQq52WrN3kUeImNh8Kgr9K57iS04Mh/r19hMG4qj4QlTl
	6KkQtyEWomEHbQ0f5XyRSMnmc9RE2jf4Kf0xED79WDIB3uDldioZ0H415UMUOOzpjdzuondZHod/F
	kXhRU2b4qlazoIK6UwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qblKz-00Fd2H-2E;
	Thu, 31 Aug 2023 17:20:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qblKw-00Fd1d-0U
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 17:20:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf5c314a57so8124355ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693502405; x=1694107205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNkpWxc8EG1HJhPkvrSCUMEk5PqcVCiqbl8jL5JExIk=;
        b=P6u/dIAO3jEUlISgxtgZKF+aNl+R+VtgRlkS0Tn88DDVFVNem3sdKbV0Zj961472yo
         jcMwymOGFKxZdUK2gDqKhRE4w/JhPoDcsgLZtFQuMEraL61yfrC1eQgNrWWLxIsBiusF
         IXtBL28YpL/HGA2e0J3neF+7eBzvkxFcg2Ufb3IUA0SXHhPsWJIzZhMG24fFok5p/Pz7
         S2jYFqUTWPa6EmXYN10I+mUzKT/dY8q26Cu0rl8nXMR70vQXW5r7QdDzAcPGfm1zJfs0
         MaVKHOTf0ggMVKHl0F8Q0uuGFEGGW+45qop4+zriYWNgi0oUYQX2HLwEoGKT6juU+9+W
         Ly8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693502405; x=1694107205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNkpWxc8EG1HJhPkvrSCUMEk5PqcVCiqbl8jL5JExIk=;
        b=Ii16Lt8R5DukBQQkOhlovzKVlBeiamu7PUHbnh/qoqnr7Yv8fTqkBQ7leq9WH/dZpG
         LHxymef09d+fVWeAFBimw65u1jBbBkMq5oV5bj3Mtnw9wANvsOWCyIORdz5KVc8BRnym
         BWt48j872MzycmhQrNznaEDE6toWqzYWserlTHv++4DzNtr1PjoIq3lYVOeUFUUQju5/
         L383S4pNAwbtARB1cb8BQWDIBhQvMnor4SNu3QqY1nJOEreLO1cWlc/ZtH22Kwxoh7Ha
         Ka4ETPF836B52JMtE2fjrPnqHV89nWGZ/Z+OXNzEaL6gPwNXO74hhfeCLgpDcS5V194M
         n94Q==
X-Gm-Message-State: AOJu0YydccE6VXYpYJ1endlLJh0Gzt6HwSK2dDnTwhs7Ly8WeRCMGw1o
	XwlRCI2OvxR5osL832OWmrpNyQ==
X-Google-Smtp-Source: AGHT+IFxC4z8Yg9XUp5M977JX43ADpIP8JLembbFQ9Xu6KLcNa91b4AcO7UeN5Ap6FxAaGH9gGiy0A==
X-Received: by 2002:a17:902:7c98:b0:1c1:fe97:bf28 with SMTP id y24-20020a1709027c9800b001c1fe97bf28mr262957pll.31.1693502404898;
        Thu, 31 Aug 2023 10:20:04 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:892a:3b04:5286:6211])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902eec400b001b246dcffb7sm1491949plb.300.2023.08.31.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 10:20:04 -0700 (PDT)
Date: Thu, 31 Aug 2023 10:19:59 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: andy.chiu@sifive.com, linux-riscv@lists.infradead.org,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] RISC-V: Remove unused "size" in ptrace
Message-ID: <ZPDLv3el++xUqGkI@google.com>
References: <20230830203754.24940-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830203754.24940-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_102006_192113_8E35BFB2 
X-CRM114-Status: GOOD (  18.96  )
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

On Wed, Aug 30, 2023 at 01:37:54PM -0700, Palmer Dabbelt wrote:
> Looks like this just got lost somewhere in the respins.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308310306.tOrkoBmI-lkp@intel.com/
> Fixes: dbe46b094026 ("RISC-V: Add ptrace support for vectors")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Closes: https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google.com/

> ---
>  arch/riscv/kernel/ptrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 9a87e5d490b5..2afe460de16a 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -120,7 +120,7 @@ static int riscv_vr_set(struct task_struct *target,
>  			unsigned int pos, unsigned int count,
>  			const void *kbuf, const void __user *ubuf)
>  {
> -	int ret, size;
> +	int ret;
>  	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
>  	struct __riscv_v_regset_state ptrace_vstate;
>  
> -- 
> 2.41.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
