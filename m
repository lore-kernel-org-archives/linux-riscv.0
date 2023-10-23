Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84433CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdXedCV9PbHAV5hHnH68b8h0GbWDlzJPl2/9H9R/MdA=; b=LB8C9egsVbRM6R
	EvVlFBQyJGvp7tm/wuY858cp8yO84ldPvuEt3CUTNonbjgHKAmkoHzYD5SyiT5n/NSh9xmMndsybX
	1Yeu/BlUYrOqe9yathBEKmsHMeyhXijVqQlYn5YbIMSYFndxJXTbxGs7VFfjIW3j0oqIpix6OpVl3
	kV+3UUgXQXyTcw54nMNWRGbxDqy2XBfqNO5wueCT2JPUG3hZ0lN/N1lhzB7QiCe6z2LgiCk2xHyY+
	g6w4PEiBx6vh3846C2NAXJP682DIpQ5rScNqdw6TOu6AnMK3FDnRQC/amqYuwPg3qdwN8QJz6vzyp
	lO0Y6DJoHC5DbtJG4vOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurn2-006zRk-1z;
	Mon, 23 Oct 2023 10:04:04 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurn0-006zQB-0y
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 10:04:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so453640266b.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698055440; x=1698660240; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zx08EZvgl0rut/KB9vhuv+Y1Cl0tPVpq0Bjph7cTE4E=;
        b=P368DxBSY3AayAYgAirh7A1poqg+hDiC9iG2RsWJfPOqW8CHTGmf+98Fku6mH3BYUn
         J/sWPat2W0MraMMvg+xAEdyR7JCSp3flYe1oXETiU1/td/5pNJk/18Ffrh15XCWBMi4M
         20R0wOLJ7wlbrN7vJkv//Z0VUSK1YA1ULCJhMsBkCQTeJS8GlxmPiY8QAxS3TfTdoQ4a
         khvBNTYHs1/5QXRynHZs9rmCboPMrPufPPCIDRPLpj74f3hBhuXFIjLgG3gj1jmOrast
         EqstVX8kIn/MrGWoHtyl3DRiwArdRlXdp9Z3iOMgx1zWFlIYQqXpxc4A41SFmSf62LlS
         gveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698055440; x=1698660240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zx08EZvgl0rut/KB9vhuv+Y1Cl0tPVpq0Bjph7cTE4E=;
        b=Uma26iWZT0zK0MfZXl4Cv8iTYvVhpoornQ8OpOM/dku2BPraCNu+WHQ4btPGVp6swD
         WMrMGS2vSp5txBatx1PzvIYmLLizReqhmon3CJFAt6yLHkFnIsOSaSTzvts9cEShzEm1
         hSy+4b2P1UiOhJDAjQZ3QcVC3BJG24zjDhaWuTwFXIH/DOkW1lsiJdVwYtKfokZs/FzJ
         BKYMU3qHqGNy1WSiZ8egP37/1jo7DNXyJFXqzvk/m9FYuPFFJ+zrgzCIP4BMn1bajsI/
         G5tKw4lMXrN/IYduoXkvX1LrMnSfHMy4KA+eIPYixV4FnQxG49i/r6F584hd04K+f5BC
         a9cA==
X-Gm-Message-State: AOJu0Yw6CEOiS6aIDWkL/EYG2DORCOTrn2hPBOc0EikGoBsQXX9+PeLF
	FgY6qITW31NUpjedOo7+GQu4fA==
X-Google-Smtp-Source: AGHT+IG3sS2mYytSxxYKysZeeec9WpQOjDiBbVsMrjyLfRgQIGoY7P02CFsd+W2kTdU6GUmUHdU71w==
X-Received: by 2002:a17:907:3f17:b0:9be:77cd:4c2c with SMTP id hq23-20020a1709073f1700b009be77cd4c2cmr6056230ejc.28.1698055440453;
        Mon, 23 Oct 2023 03:04:00 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id pj19-20020a170906d79300b009ad829ed144sm6355041ejb.130.2023.10.23.03.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:04:00 -0700 (PDT)
Date: Mon, 23 Oct 2023 12:03:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 5/5] riscv: kvm: use ".L" local labels in assembly when
 applicable
Message-ID: <20231023-c9629db3ee7d3e845030bc26@orel>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004143054.482091-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_030402_336343_B1502D0E 
X-CRM114-Status: GOOD (  15.35  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 04, 2023 at 04:30:54PM +0200, Cl=E9ment L=E9ger wrote:
> For the sake of coherency, use local labels in assembly when
> applicable. This also avoid kprobes being confused when applying a
> kprobe since the size of function is computed by checking where the
> next visible symbol is located. This might end up in computing some
> function size to be way shorter than expected and thus failing to apply
> kprobes to the specified offset.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_switch.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
> index 8b18473780ac..0c26189aa01c 100644
> --- a/arch/riscv/kvm/vcpu_switch.S
> +++ b/arch/riscv/kvm/vcpu_switch.S
> @@ -45,7 +45,7 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
>  	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
>  	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
>  	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> -	la	t4, __kvm_switch_return
> +	la	t4, .Lkvm_switch_return
>  	REG_L	t5, (KVM_ARCH_GUEST_SEPC)(a0)
>  =

>  	/* Save Host and Restore Guest SSTATUS */
> @@ -113,7 +113,7 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
>  =

>  	/* Back to Host */
>  	.align 2
> -__kvm_switch_return:
> +.Lkvm_switch_return:
>  	/* Swap Guest A0 with SSCRATCH */
>  	csrrw	a0, CSR_SSCRATCH, a0
>  =

> -- =

> 2.42.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
