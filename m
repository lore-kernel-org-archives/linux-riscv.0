Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAACD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4lH88hfFDIrIWOQWrMV4uS22d37MNylI6ji+TL1Zmo=; b=AD3jH8ujRAe7lY
	HIdpYcG9+8RMjpSGE677SN/fGwYvXtOHUFd3ZnNj9jtNy6HohKiryysmnUN+pGrM00ggaIBwTLD0G
	S1ozNRM8ixiFBArrKyZMwpYmh0uD3sOV+dfvCVH4YkF128SqZje0SQe/Cvv1tR1EkAdRb1cCJxIH5
	L3wVaz/gzLm5PDhnmql8XFI8KFS59hL7waMyUF+ayl9TuVUky0X9vlnLeMskkeezb+DD19B/kD51o
	jKMN+4/G3ZKYcRfPnNCLST7weXeW97HnJ1ZSNeUBCWbyg1vY8K7j8euwkWYvOsfEYztdaaClAqGUE
	iLmcpbM558xT8T/wBQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6De-00000003Lxy-1H0x;
	Tue, 20 Jan 2026 07:32:06 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Dc-00000003LxW-1bsg
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768894324; x=1800430324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OmF9ROhAwoFF0+L+lPu8M2077C2feF/Mm1H4FmoZKdg=;
  b=cf4dGhGsIH1yS09nL2BBobEdzeSQ3+d32IMHUSgdvS1F154G5Wdbl3Hb
   0GV/I2bP7IsoC78x6vSnZjcqX3qwCVFu6RwhoWnJwa5g9BbqeSIv7FTQK
   aA5Jq+hRrp/FAP6U0cEJboPsbTy4z1wyutNSX2LJB39fpWKbSezlF3444
   u/6/VY2RAXCFTyEUuaEcQ/6WmqwQRG6bU7CFFj+QDvAlvunHN7EykFt4n
   ajU+KukR+OebuVSpwlmcUC/kexNzczAvjst+VSXhMqgLq2IhOojbXOuu6
   /1l1Kuk+8JAcK+Zb0W+PhFBbfYV0pIH6wLILkvhFX49pMCzmCkPIz+0hz
   g==;
X-CSE-ConnectionGUID: eXie2PPQT3ewZ57ywPMnwA==
X-CSE-MsgGUID: LeMKRN34QHaZe7heJxcWNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70147520"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70147520"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:32:04 -0800
X-CSE-ConnectionGUID: etsXmKX+TWObLJHg8Be6ew==
X-CSE-MsgGUID: TU+1hW09QCm6DrHHEKu5FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210893899"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:32:00 -0800
Date: Tue, 20 Jan 2026 09:31:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, kees@kernel.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	ardb@kernel.org, charlie@rivosinc.com, conor.dooley@microchip.com,
	ajones@ventanamicro.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 7/8] riscv: lib: add strchr implementation
Message-ID: <aW8vbXlk-vXVQ8M_@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-8-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-8-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_233204_431618_4348B19B 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jan 20, 2026 at 02:58:51PM +0800, Feng Jiang wrote:
> Add an assembly implementation of strchr() for RISC-V.
> 
> By eliminating stack frame management (prologue/epilogue) and optimizing
> the function entries, the assembly version provides significant relative
> gains for short strings where the fixed overhead of the C function is
> most prominent. As the string length increases, the performance converges
> with the byte-oriented scan logic.
> 
> Benchmark results (QEMU TCG, rv64):
>   Length | Original (MB/s) | Optimized (MB/s) | Improvement
>   -------|-----------------|------------------|------------
>   1 B    | 21              | 23               | +9.5%
>   7 B    | 118             | 126              | +6.7%
>   16 B   | 200             | 208              | +4.0%
>   512 B  | 375             | 399              | +6.4%
>   4096 B | 395             | 401              | +1.5%

> Suggested-by: Andy Shevchenko <andy@kernel.org>

Wrong tag.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
