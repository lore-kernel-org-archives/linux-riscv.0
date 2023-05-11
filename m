Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03780C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 23:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BqFyk+RwGpuRaXHDiuLPJKpcXT2H6JVaDSDofGjAVn8=; b=EPoEIYj+VOw+yeCWKLemi9SfB7
	6zCFYpd9gnA++zsDywGjG+PBaO0GnjBgz/UBUOJPW2NKz1NbmHuLfKZCTYs8DkHTKBaqitbWMI9L2
	tREk9q+trrmYQuqfs063DCzOkC75sHn7zmSJKnDeESXZ8PFtpUbcvmIXwnvYiawBQZGF9bzp659XP
	PYtuyTu60CEoiCG0/LxO/FHLYwPBtCJNJIRxqxZPe4yJGLFFFiFvx71OAmQwp3rfWTPPdfbqV5b/D
	dOxYzhLcvNPjM+mb7bpEluNN7QWL6HbZZeHq595R5hOI1EsfnwdjlOHdjmi4z/hdeROIa+sVe73QP
	y62mZltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFtP-00ANna-2x;
	Thu, 11 May 2023 23:40:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFtO-00ANmI-0M
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 May 2023 23:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=vtFyDOMAJKBRcj1XAUfvXhteZXg5akh7Zy9dXQt3a3Q=; b=Mr6cMbPRDqrLx3/ojQ7mvCq++O
	PjEVXvjHwCIU2QryZ9Xr4MdJT3eac6RRVIV0kva/IqunYiVnloHQtzJtTW/J1ZR3mDQsR6Kfq9GIM
	lghTQ2PzsVA8dBflIiB3RekX4XSbvjhr/xag3S7Muu2lyQZxb9OuA/1XdY/YYUIBqCVr2ClKJm9ze
	g7lFVZ/7ya53yiAIJeeD1uBWLejiM4YlOPl8gVWswE31g4I0k/cuTGGSqG361xMERW8SB2rBCE+aq
	/LRDfZOOX6THlb5gPzuNgCo8wUjZC+AqTt+Hwm0Elafz1K7JdE7TivcI1pAum0SyMSOdE3GK0uFV3
	spf122ig==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFDJ-008QD5-2j
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:56:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-643a1fed360so5379966b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683845802; x=1686437802;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtFyDOMAJKBRcj1XAUfvXhteZXg5akh7Zy9dXQt3a3Q=;
        b=lQXEBe+tOsrYFmOsOhUZIKXGTfkBBB/YxSqJ/uBorrQPanAQLS2mqM5FbXwivEGSfj
         C+X5O8owg4/yQcskNIUrXRwrlDrzBK06HHulvB86eAVPHbvbvgKUMdL2uZGw//Ygjpsc
         qSE5/aZ+yotnbIJGifHcAu8LmLAUSvbp+Y/gHu8DvBrf6up1unsfWzNTtuR3h8EggC3R
         yjwI6UcdiEV9aLWxOxBgAXjBK/5xq1tIx4wYBWscXGD6V5BFVzKgABCsV9ugwTnSiXV4
         XZrQB/KNTC4PPHcmiYzz3RdTXA62SJyuOxm5L9wltiHsf9UviSANewFB1trzT/uo7Zr6
         BbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683845802; x=1686437802;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtFyDOMAJKBRcj1XAUfvXhteZXg5akh7Zy9dXQt3a3Q=;
        b=HbxXUDha7hKufw43+XqB8kqwC0pNf4s6uc2y80hUESTPOHQWY13KxgL1W1jdpNZvI/
         FnFEkivYwD/wflgpQKS092HO8SbFjjqpfC7XSzG3/r5zQQDsIa1UFr4nzCPCBIyD8HY+
         FxqwV0VotIzYh6PO8thBDssMctwVSMaB9BGfo8Hb90BOhGSJA4qSTckc6FuSSTbkHwko
         k61XJfAA7ITBWLBHGxXR8SCNY2khFrDD9VQll46gbCtDxc92gnDGoBTnGguKfxFAPt27
         uEcoE9BIO6ZXkvEapiifrqCVvLwUljd3ACz63PKhK8S84N0tnCZc0RoT1qYuRd8xuutx
         AlbQ==
X-Gm-Message-State: AC+VfDzTUSVm/ZnNhbBZkkaBtFr+hW5QXw8e0j/pG0sr1YvcjD+n9+21
	aE3XYD+0fvH6c2DeMZmU9BpReBOec58Sl1Dcm/c=
X-Google-Smtp-Source: ACHHUZ4p58nUXiAutn3RZFWaoZPE20JAFxaCgTIyzGVhYL/h+LN8ohopawHpb7pbRssOBiXeTRh1CQ==
X-Received: by 2002:a05:6a00:1796:b0:63d:260d:f9dd with SMTP id s22-20020a056a00179600b0063d260df9ddmr31626200pfg.33.1683845801828;
        Thu, 11 May 2023 15:56:41 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id i8-20020aa787c8000000b006413e6e7578sm5804346pfo.5.2023.05.11.15.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:56:41 -0700 (PDT)
Date: Thu, 11 May 2023 15:56:41 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 15:48:27 PDT (-0700)
Subject: Re: [PATCH -next v19 07/24] riscv: Introduce Vector enable/disable helpers
In-Reply-To: <20230509103033.11285-8-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
  kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com, andy.chiu@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu, guoren@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-52a1b4c6-da8b-4f8c-8587-efd8fc294aa8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_235647_687094_B8635E0A 
X-CRM114-Status: GOOD (  14.51  )
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

On Tue, 09 May 2023 03:30:16 PDT (-0700), andy.chiu@sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> These are small and likely to be frequently called so implement as
> inline routines (vs. function call).
>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/vector.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 427a3b51df72..dfe5a321b2b4 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -11,12 +11,23 @@
>  #ifdef CONFIG_RISCV_ISA_V
>
>  #include <asm/hwcap.h>
> +#include <asm/csr.h>
>
>  static __always_inline bool has_vector(void)
>  {
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
>  }
>
> +static __always_inline void riscv_v_enable(void)
> +{
> +	csr_set(CSR_SSTATUS, SR_VS);
> +}
> +
> +static __always_inline void riscv_v_disable(void)
> +{
> +	csr_clear(CSR_SSTATUS, SR_VS);
> +}
> +
>  #else /* ! CONFIG_RISCV_ISA_V  */
>
>  static __always_inline bool has_vector(void) { return false; }

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
