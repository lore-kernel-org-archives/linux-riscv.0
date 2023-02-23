Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0700AC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tdf9fQVfLD3B7tobIi8WftlFtdZhNEpETBr2LT5GOGs=; b=j3VmDxDrT3KS6b
	K/zlJd4P2/LGGAS2FBPgWwTx3tyW5EHIQarLHbVDSHIQWGF4AK2X8DEleDq7qDcPPZYHN9g6cERvg
	IFk5uHPWHPC1KWOAtpXZReGuEMg2tp5oCESQSUJObqW7Fo2tuSN4FxkVbmpcLHrlU6X9LKlv3zGSS
	53Yd9kfvi659fQtBnraNKcauJU2UB6Pk4ryDP2PuOQfYbAeJ/CzEiUPQ3ikFNkCDCkkVIZj1JHPYt
	Ee7TJqfAeYpXBB1q/F/13ASBUeNwWo1b4ChBRa4bwPLo4S2QZEzsvMmu6AlC6TKzJEPQe1QijbYuK
	zdnyjzV56Qg5J+anr0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8JX-00FnrK-2g; Thu, 23 Feb 2023 09:54:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8JE-00Fnfc-4x; Thu, 23 Feb 2023 09:54:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8B881B81993;
	Thu, 23 Feb 2023 09:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4C9C433EF;
	Thu, 23 Feb 2023 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677146077;
	bh=tzlp0We19KInWirh8J/R3X53YBq02wyMg36MmcYZucg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWHav/x5svyAQ2Kiupi0qIMdQsQIRNHbVu7V7cvhIG+FB2Ab9YOZbznomFKNVRU5c
	 dJGp13n1+5gUWl60lh8PHfPhiLUUzRx/jkZWhR2U0IJ4QwSkA71R1sHDBM1LDZoGSQ
	 K8nl4u6N+AgQlSy2sBaBWuu95IVveXkXHttSWa9s=
Date: Thu, 23 Feb 2023 10:54:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tom Saeger <tom.saeger@oracle.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Rich Felker <dalias@libc.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Heiko Carstens <hca@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 6.1 v2 0/7] Backport Build ID fixes
Message-ID: <Y/c32nwwcfmqZqbc@kroah.com>
References: <20230210-tsaeger-upstream-linux-6-1-y-v2-0-3689d04e29fc@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210-tsaeger-upstream-linux-6-1-y-v2-0-3689d04e29fc@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_015440_361848_A95260ED 
X-CRM114-Status: GOOD (  14.11  )
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

On Fri, Feb 10, 2023 at 01:17:15PM -0700, Tom Saeger wrote:
> Keep 6.1 in-sync with Build ID fixes.
> 
> I've build tested this on {x86_64, arm64, riscv, powerpc, s390, sh}.
> 
> Changes for v2:
> - include 1/7 2348e6bf4421 ("riscv: remove special treatment for the link order of head.o")
> - include 2/7 994b7ac1697b ("arm64: remove special treatment for the link order of head.o")
> - rebase  7/7 c1c551bebf92 ("sh: define RUNTIME_DISCARD_EXIT") from upstream
> 
> Previous threads:
> [1] https://lore.kernel.org/all/cover.1674876902.git.tom.saeger@oracle.com/
> [2] https://lore.kernel.org/all/3df32572ec7016e783d37e185f88495831671f5d.1671143628.git.tom.saeger@oracle.com/
> [3] https://lore.kernel.org/all/cover.1670358255.git.tom.saeger@oracle.com/
> 
> Signed-off-by: Tom Saeger <tom.saeger@oracle.com>
> ---
> Jisheng Zhang (1):
>       riscv: remove special treatment for the link order of head.o
> 
> Masahiro Yamada (3):
>       arm64: remove special treatment for the link order of head.o
>       arch: fix broken BuildID for arm64 and riscv
>       s390: define RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36
> 
> Michael Ellerman (2):
>       powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
>       powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds
> 
> Tom Saeger (1):
>       sh: define RUNTIME_DISCARD_EXIT
> 
>  arch/powerpc/kernel/vmlinux.lds.S | 6 +++++-
>  arch/s390/kernel/vmlinux.lds.S    | 2 ++
>  arch/sh/kernel/vmlinux.lds.S      | 1 +
>  include/asm-generic/vmlinux.lds.h | 5 +++++
>  scripts/head-object-list.txt      | 2 --
>  5 files changed, 13 insertions(+), 3 deletions(-)
> ---
> base-commit: d60c95efffe84428e3611431bf688f50bfc13f4e
> change-id: 20230210-tsaeger-upstream-linux-6-1-y-06c93fbe5bc8

Now queued up, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
