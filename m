Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF60C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 07:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fn3uPcK/LpGFCV0hrEV4mzjgbSnlXZzC5ZQkjkJwKhY=; b=k4PbaUT00NAADn
	6zcnpS2ZOKnzXD5FpWfp4M84BgS40lTJoJvEYf6YzXNo/2kG2Z8Y2sA2B6jjtoIWlhIUhqG5tFPu3
	kbRMAVTD0jlHYjgN9fZ7B2jSDEN75AEWexFKPvAQ2CmkNi3PT/XFSS98OLjJcVKTAo31ZIRw8cOF2
	vzQS+ZZUhrc+JU/aeU4wA7uHFBT8fmgPbB/sML+ZHylFtE287KtaOauv54LlVf/FL9mlLJ+Kuio2O
	KvJ/ebqpnyH54TTKsatfqxaYX4Eca6RnNpVcWgnIC9ueEPa1YvGl9zt7CCi6Wx4vyw4vkMdR+SKcH
	367a2iotxSiYeHJ0x/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpNXK-00000007mqL-3nPh;
	Wed, 27 Mar 2024 07:17:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpNXH-00000007mpo-3a31
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 07:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2080CE24E9;
	Wed, 27 Mar 2024 07:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABC6C433F1;
	Wed, 27 Mar 2024 07:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711523841;
	bh=xyQ3ZK+hiMYuRYnTpsz6pSIKbB4/60zOWfr6MnQ/X8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DprLV1YLawP0EOlRt7GxEvJwPKI3F0zNLQGKZDH7o2CYgPJm+l1Hs9/w3pEgga0Oq
	 bcmEtWTLQsQIrHiFEv4Gvuvs2aN/Yc2OrriUFNzDRqlCYx6c4Ns431RPsFiSfTgchL
	 DzXStZ1t86IcWM816wNw9G6K0XeXcqMwn2J1kb5E+3Ah53Ks+AfZ+UL5Ptl4AgAbe/
	 rPsiOpCGcdNNUTzEOBl/AXnObjgiHlxclOatbS3I5Z6cRGu5gj694fIJIyZAX9d2Z9
	 y7fC9OPF/XaIWENxEyLrqu57LbbVcRDhuSOD+aqhhFUjY2Dbg8BfVGz8eH80/RgM9B
	 lGnpP8HcyZy7A==
Date: Wed, 27 Mar 2024 15:04:05 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: Fix TASK_SIZE on 64-bit NOMMU
Message-ID: <ZgPE5e7FzB5H4MnK@xhacker>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240227003630.3634533-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_001724_097868_F6D471E4 
X-CRM114-Status: GOOD (  14.83  )
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

On Mon, Feb 26, 2024 at 04:34:46PM -0800, Samuel Holland wrote:
> On NOMMU, userspace memory can come from anywhere in physical RAM. The
> current definition of TASK_SIZE is wrong if any RAM exists above 4G,
> causing spurious failures in the userspace access routines.
> 
> Fixes: 6bd33e1ece52 ("riscv: add nommu support")
> Fixes: c3f896dcf1e4 ("mm: switch the test_vmalloc module to use __vmalloc_node")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> 
>  arch/riscv/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 0c94260b5d0c..a564a39e5676 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -882,7 +882,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  #define PAGE_SHARED		__pgprot(0)
>  #define PAGE_KERNEL		__pgprot(0)
>  #define swapper_pg_dir		NULL
> -#define TASK_SIZE		0xffffffffUL
> +#define TASK_SIZE		_AC(-1, UL)
>  #define VMALLOC_START		_AC(0, UL)
>  #define VMALLOC_END		TASK_SIZE
>  
> -- 
> 2.43.0
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
