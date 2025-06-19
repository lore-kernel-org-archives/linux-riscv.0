Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F6C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 11:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+aAeqBrC/iR1j1X0xhzThNCA0+UB3eKWoj9CDU6tqM=; b=KPU1oHdjJkZGJ0
	jZsAckHBLffwxoj0eXiupBIam/IwTuGBMXcq/RlHRika5wQngTT14WSjT4OuQcoSyIAYMF3E2DD/M
	hkiFgVN72Y9+T+guVanhprNv5+c6LZAVK2GDxjaHXyh/pQF2scXBb/rjuz1Ci5iMrhn3X4KiimQSL
	+TtvZTE14/YTU4ll629pU+jiroz2D+d2jbArCnOE8lqCQjByNE1W2W63MqNYfS6yORY86dSQKJdQE
	7p9QJYu/4m2wzXBZh2Z1nY03VMoFXx5yWjEwpPZwTEwJrL5uX1hMNv5BDvQvBwGXILmOZEgf8hepk
	okp5pvdvHPiYdZyuNyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDPW-0000000CrOM-2hJq;
	Thu, 19 Jun 2025 11:26:26 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBfR-0000000Cd0x-0IHW
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 09:34:46 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-60be827f2b7so321263eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750325684; x=1750930484; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GEM8aSdK4BbpZsaiGvekI/zZkHOT0NsV54eIKTj0uc=;
        b=NXmtkq725I/0Jjy9gU+HvWWbgweVDv85Vq4Zq4/q4D4PCMalpZYXzrS4zk4r6ulU74
         LX/OjgP4/3oWSWmI/2M5SrToFDUN2cQsFzhL11XcnK6YA43AvUOSlBlckJqIucxcsgOP
         MEHG/yMNnnAvc5BCed8Id1nyCXa95LMOn1v96UuiUVZ9rCXybSl5wNgXakLBqkBMwUaO
         JTqIxfs6E2NofOp7l+vOxH193bcTDBZPcrLZ/lTHETxPh46JR2GKP0r/2Nz4ZrBWu14r
         LVP3W28B1krvEhN2yFbhyysBbCTXFE0l8Vz5WnHxcsngjRMN0QXWfdK86ZyvP7I8h2kU
         RoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750325684; x=1750930484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GEM8aSdK4BbpZsaiGvekI/zZkHOT0NsV54eIKTj0uc=;
        b=pCDabxs8z1a8gm4x3kcPu8gKBptbZocfe/o5tKOz6SvmTIAHXBldj+/RU5BJ2iwCwj
         x0m8ByMQYNxGEH5KX427GwiBv4IQ30UFbe5MVDBvxPONsKyM5M6HtGKI+nE5p8PDubUA
         5kUEBdwgtcBlE7yVliDAA/Ts8R7wsMqM9Wb1hrQJxLR23/zyDFxKCBJivyOMfw3JjH08
         CjP4Gzpf7NKZNRwwp3e2YDFiuIDe5MtCY0z49nsM210dKy19Z/gYLgugv1JmlPh27nYO
         qhi24KCPFTEYbc4MssTP6+XN/u19EavDmEqp5xOyt7wVe3csgCjK026z6NejIeKzvMgK
         G5lg==
X-Forwarded-Encrypted: i=1; AJvYcCVJhzMASZ5SeE77F9UZ/GZPeOCzTFB7khsfrMrVVpPux8cG6x09GQUq817c8qz5yZ5g63DMofjpgBhavw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqy33sDK51jMO8Lk9c7eEA2m4aDX6lEf87OoBlqmGAGNzCbYG9
	hq+b9+GW+3BRLwwwkaPekkal6GVg8Kt2eR9Awv6YCySRhMUfxcJcXGBEif5SevlrQ5hzSctNe5d
	HlQPBxMDpIoDaG126IFwodqPp8I5arEg=
X-Gm-Gg: ASbGncthDENWmWdyXVBV4V92CkL0T5xiEKT2StovQDcBiOpoCjLG4B8TkOkQuz/3Rst
	C7t8mjc0/vt+YPAq1ewygXI4nbt84c4k9LtrQTO+Lmpsz6A6Z/dDpQgkX6dV1EupM2Zktr+GLfE
	fNz4g1YDzg9WHuGlrzqCWIoXGSMlL8IOyrXyoHUFgFIYLAa7yR2zaw2SKmovt2Mpy6PSEyCurAz
	Ww=
X-Google-Smtp-Source: AGHT+IEkvgD+z2fKoSt3oTmo8zIn6oFWTRfRDG+GNL6TOsFM1snRFgZfvo9twtWiiM8jezGNxQE7BUh4k4/Cm+Jc6J4=
X-Received: by 2002:a05:6871:358d:b0:2d5:2360:4e7d with SMTP id
 586e51a60fabf-2eb9e94538fmr2120732fac.8.1750325683778; Thu, 19 Jun 2025
 02:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250619065232.1786470-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20250619065232.1786470-1-zhangchunyan@iscas.ac.cn>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 19 Jun 2025 17:34:07 +0800
X-Gm-Features: Ac12FXz3zKouUq1RGz_ibmj_qkiKm2C6OltBEmZ1_YCX4xaOcj7QnZw62n6NeT0
Message-ID: <CAAfSe-sQ9fCLR1ixhhJA0=U1EVLX=KiutieL9_rVTO0A_w144A@mail.gmail.com>
Subject: Re: [PATCH V8 0/3] riscv: mm: Add soft-dirty and uffd-wp support
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, 
	Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_023445_109935_87B0E9CE 
X-CRM114-Status: GOOD (  20.60  )
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

On Thu, 19 Jun 2025 at 15:27, Chunyan Zhang <zhangchunyan@iscas.ac.cn> wrote:
>
> This patchset adds Svrsw60t59b [1] extension support, also soft dirty and userfaultfd
> write protect tracking for RISC-V.
>
> This patchset has been tested with kselftest mm suite in which soft-dirty,
> madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
> and no regressions are observed in any of the other tests.
>

I also tried CRIU below functions and they can work fine with this patch:

- 'criu check --feature mem_dirty_track' returns supported
- The incremental_dumps works fine (https://www.criu.org/Incremental_dumps)

> This patchset applies on top of v6.16-rc1.
>
> V8:
> - Rebase on v6.16-rc1;
> - Add dependencies to MMU && 64BIT for RISCV_ISA_SVRSW60T59B;
> - Use 'Svrsw60t59b' instead of 'SVRSW60T59B' in Kconfig help paragraph;
> - Add Alex's Reviewed-by tag in patch 1.
>
> V7: (https://lore.kernel.org/all/20250409095320.224100-1-zhangchunyan@iscas.ac.cn/)
> - Add Svrsw60t59b [1] extension support;
> - Have soft-dirty and uffd-wp depending on the Svrsw60t59b extension to
>   avoid crashes for the hardware which don't have this extension.
>
> V6:
> - Changes to use bits 59-60 which are supported by extension Svrsw60t59b
>   for soft dirty and userfaultfd write protect tracking.
>
> V5:
> - Fixed typos and corrected some words in Kconfig and commit message;
> - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste
>   error;
> - Added Alex's Reviewed-by tag in patch 2.
>
> V4:
> - Added bit(4) descriptions into "Format of swap PTE".
>
> V3:
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V1 -> V2:
> - Add uffd-wp supported;
> - Make soft-dirty uffd-wp and devmap mutually exclusive which all use
>   the same PTE bit;
> - Add test results of CRIU in the cover-letter.
>
> [1] https://github.com/riscv/Svrsw60t59b.git
>
> Chunyan Zhang (3):
>   riscv: Add RISC-V Svrsw60t59b extension support
>   riscv: mm: Add soft-dirty page tracking support
>   riscv: mm: Add uffd write-protect support
>
>  arch/riscv/Kconfig                    |  16 +++
>  arch/riscv/include/asm/hwcap.h        |   1 +
>  arch/riscv/include/asm/pgtable-bits.h |  37 +++++++
>  arch/riscv/include/asm/pgtable.h      | 136 +++++++++++++++++++++++++-
>  arch/riscv/kernel/cpufeature.c        |   1 +
>  5 files changed, 189 insertions(+), 2 deletions(-)
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
