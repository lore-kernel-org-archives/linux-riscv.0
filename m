Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD6BC636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mB4ZtRtz0cqE/2FEyCP240dEemLX+xPKd34ho5K95Ec=; b=1H9NX4Du0kMpw/
	tXg1tdUnByU847J690QTqz2SK4zT57hK31XW9tslm4gNu6EpkZBZl2fW2g2lC55jpy8gBHrHedFcM
	cO4parYt2ykameqdLCdOlU41YKYjmUob+VumuQp6r0ry24pYWbBp4O7zxR/cosi+OCcjTumhJ4i9a
	BAcubACSbHJtqWVQnETCb5Hzc0XcRoJ395IxZEkBlrijAqSDBJLcOR+4baG1ncUJ+PqIFFINKaXLb
	VRvDP4jVNxSBAUbvAwXywEG0RjHTUwrFpsohaHigTgSXlbR29Y6u68pKMjM5fJIdNGM2EfMTcm8u5
	K75WZSPOKZ+aayAoowCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8FJ-00FmM8-FO; Thu, 23 Feb 2023 09:50:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8F9-00FmK5-0T; Thu, 23 Feb 2023 09:50:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9238BB818F9;
	Thu, 23 Feb 2023 09:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D17C433EF;
	Thu, 23 Feb 2023 09:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677145824;
	bh=6+RS3vKNtOBH6Iix7VuTmtdw51WghGYeiUtoXdjfsao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxNV593LF5ua2oXpyWhWw1CF8jqDWKRzFCBzYfUwdPB1+9vcs6TD9K2SlZipxjpQB
	 kV9faWEzrhPUEdIgV4eq1gA6XRO9nQrFwQ5KdKWOiyXk8WAIxeNisp8BiVE0gT9p4h
	 n5hwQSUaA3nqHXumhYz3HIspsumEAftd2BDgXNvU=
Date: Thu, 23 Feb 2023 10:50:22 +0100
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
	"H.J. Lu" <hjl.tools@gmail.com>, Borislav Petkov <bp@suse.de>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 5.4 v2 1/6] x86, vmlinux.lds: Add RUNTIME_DISCARD_EXIT to
 generic DISCARDS
Message-ID: <Y/c23lnfn42s5uCC@kroah.com>
References: <20230210-tsaeger-upstream-linux-stable-5-4-v2-0-a56d1e0f5e98@oracle.com>
 <20230210-tsaeger-upstream-linux-stable-5-4-v2-1-a56d1e0f5e98@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210-tsaeger-upstream-linux-stable-5-4-v2-1-a56d1e0f5e98@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_015027_221202_E2B1EFE5 
X-CRM114-Status: GOOD (  20.17  )
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

On Fri, Feb 10, 2023 at 01:20:22PM -0700, Tom Saeger wrote:
> From: "H.J. Lu" <hjl.tools@gmail.com>
> 
> commit 84d5f77fc2ee4e010c2c037750e32f06e55224b0 upstream.
> 
> In the x86 kernel, .exit.text and .exit.data sections are discarded at
> runtime, not by the linker. Add RUNTIME_DISCARD_EXIT to generic DISCARDS
> and define it in the x86 kernel linker script to keep them.
> 
> The sections are added before the DISCARD directive so document here
> only the situation explicitly as this change doesn't have any effect on
> the generated kernel. Also, other architectures like ARM64 will use it
> too so generalize the approach with the RUNTIME_DISCARD_EXIT define.
> 
>  [ bp: Massage and extend commit message. ]
> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Link: https://lkml.kernel.org/r/20200326193021.255002-1-hjl.tools@gmail.com
> Signed-off-by: Tom Saeger <tom.saeger@oracle.com>
> ---
>  arch/x86/kernel/vmlinux.lds.S     |  1 +
>  include/asm-generic/vmlinux.lds.h | 11 +++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index 1afe211d7a7c..0ae3cd9a25ea 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -21,6 +21,7 @@
>  #define LOAD_OFFSET __START_KERNEL_map
>  #endif
>  
> +#define RUNTIME_DISCARD_EXIT
>  #include <asm-generic/vmlinux.lds.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/thread_info.h>

Does this backport look correct from a style point-of-view?

Hint, extra blank line needed after the define, like what is done in the
original...

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
