Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02D7FF885A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 07:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJEaHI10thwdHqezX9650yd0+bw/eF+lEK8N/HtEMCY=; b=Kec3nLFwCgFlFb5zk4skjMcNwe
	oPfKl1rsLOindbE7UpHdqGSY6TOUDhqgvO25OYkdjWfCCCXZ16FHoR0h6Xjw4KP4LgyJnKw9RNTCE
	/hpL0cMsV/XluRIQ0W/sYeq3fVeaAKjwsokjlusAxQMNxharrWA2QdUbv43SFdL2eulUBeFEv1xaT
	v69VyzfN0wSbT31IkOswMNvFxOdNUnple3J1ArtY69rGk0ylruWMXnXYUWzO4JpOdaBcB5kfsx3wK
	vSTVVHY+1pDttkBiCt7dUX/ZZqtMqRBLpu84J0kbFzaCdDJgQ3SYFLLt+u1J7G05CzTtuigtrwieC
	S3TAZFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA4j-0000000FOLs-3dU3;
	Tue, 05 May 2026 07:20:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKA4i-0000000FOLX-3ZEh
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 07:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49DA96014B;
	Tue,  5 May 2026 07:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E591EC2BCF6;
	Tue,  5 May 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777965612;
	bh=Z0FXQFs0XgCitklm42p+eFCRXoSwhNl8YaZgF5P9pKc=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=AZxWbBvYjHzMwBGYAn0U/L+Y4nNRwAOnQ7QKBncZ5DofsMttNhg1rsqFqCAox2z4/
	 VLC8c51H6eGo4up2Oc9WzaBpVdjqlowLNCCdtrbnljiGBQOVebgMS8cmbhe4lEoUOR
	 YOUd4azIaiomeZtl+96K3UoRYPsTZCtUEYVtgzTDr47ziJI9XzLSYAno5EeSCiFszF
	 I0bFBlGGW91/979neAvZamO6efbThBqQq+v1advRIdvH24/vBNcixvmB4Ru5RePWTW
	 fTQkhHnQa+GFAtYyExdmfSAVa6wcAcfYaOQxhKk7LvgTC5vEJdzwI0EBfhAIJcGSDy
	 iIAYNNRsm+sqA==
Content-Type: multipart/mixed; boundary="===============8001377551619871004=="
MIME-Version: 1.0
Message-Id: <2b13d3da553b3d2b09d94c046e80281f972d997b3e9037a0b215d6663135711a@mail.kernel.org>
In-Reply-To: <20260505062026.91724-2-cuiyunhui@bytedance.com>
References: <20260505062026.91724-2-cuiyunhui@bytedance.com>
Subject: Re: [PATCH v4 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
From: bot+bpf-ci@kernel.org
To: cuiyunhui@bytedance.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,dennis@kernel.org,tj@kernel.org,cl@gentwo.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,bjorn@kernel.org,pulehui@huawei.com,puranjay@kernel.org,thuth@redhat.com,ajones@ventanamicro.com,ben.dooks@codethink.co.uk,rkrcmar@ventanamicro.com,cuiyunhui@bytedance.com,samuel.holland@sifive.com,zong.li@sifive.com,conor.dooley@microchip.com,tglx@kernel.org,debug@rivosinc.com,seanwascoding@gmail.com,andybnac@gmail.com,menglong8.dong@gmail.com,cyrilbur@tenstorrent.com,wangruikang@iscas.ac.cn,atishp@rivosinc.com,apatel@ventanamicro.com,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,linux-mm@kvack.org,bpf@vger.kernel.org,arnd@arndb.de,nathan@kernel.org,nick.desaulniers+lkml@gmail.com,morbo@google.com,justinstitt@google.com,qingfang.deng@siflower.com.cn,linux-arch@vg
 er.kernel.org,llvm@lists.linux.dev
Cc: ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue,  5 May 2026 07:20:07 +0000 (UTC)
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8001377551619871004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 09bb5f57a9d3..6f5d70313c83 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -56,6 +56,8 @@
>  #define __io_pbw()	RISCV_FENCE(iow, o)
>  #define __io_paw()	RISCV_FENCE(o, io)
>
> +#define PCI_IO_ADDR(addr)	((void __iomem *)((unsigned long)PCI_IOBASE + (addr)))
> +
>  /*
>   * Accesses from a single hart to a single I/O address must be ordered.  This
>   * allows us to use the raw read macros, but we still need to fence before and

Arnd Bergmann raised concerns about this approach in his review of v4
(https://lore.kernel.org/all/3720c3a4-cc0d-4ba8-97ae-35def0189e2e@app.fastmail.com/).

He points out that the NULL pointer arithmetic warnings are actually
useful because they indicate real bugs - NULL pointer dereferences that
will crash the kernel if the driver is ever loaded. The proper fix is to
ensure drivers have 'depends on HAS_IOPORT' in their Kconfig entries.

He suggests removing the custom RISC-V PIO accessors (ins*/outs*)
entirely and using the asm-generic versions instead, which already have
the correct #ifdef checks. This would be a cleaner approach than adding
guards to suppress warnings.

[ ... ]

> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index ca5a1ce6f0f8..d799e5ccc943 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -1205,8 +1205,12 @@ static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
>  #define ioport_map ioport_map
>  static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
>  {
> +#ifdef CONFIG_HAS_IOPORT
>  	port &= IO_SPACE_LIMIT;
>  	return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
> +#else
> +	return NULL;
> +#endif
>  }
>  #define ARCH_HAS_GENERIC_IOPORT_MAP
>  #endif

Is this change necessary? The function definition here is already
guarded by the #ifdef CONFIG_HAS_IOPORT_MAP check, which should prevent
it from being visible when CONFIG_HAS_IOPORT is disabled.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25361792504
--===============8001377551619871004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8001377551619871004==--

