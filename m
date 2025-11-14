Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB47CD4F49
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 04:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hz21a1EahY23dsHZEKJ+ZYdpzfudcZ1f1wRBgVuJP+8=; b=pGAB4BDufMdtMy
	gZKmHKJoLxkMOThLjgKSi6MBfllIbPF6kD1fzlJs0evHJF2HfWEjvQDbgkzrMLop9zsA7R8UAZTFC
	N4CUxNIkj1LK+gxXJc0h3jJY8lLjyghwHGjbJzdAtTdL3jgNFmAmMEczUwbIkQLsr46F6+K/pRzCh
	phrRJ1RlIA29bqOdEkp9x6qHR5RoXP6miH9w+k8WJVivgUtg+6xDGR6aZpV+HduSejrb8MxIubfJ/
	trubVQiC5qfH1fyopb04g1dIIOTeuxloomqU1eBkcQJLN85YE21P0ohVWhEPgcefJaPc+KWu50foW
	Te6rmojXyC914NJXvHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlPe-0000000BXYB-3gay;
	Fri, 14 Nov 2025 04:27:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlPd-0000000BXXc-1D4z
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 04:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E48F60128;
	Fri, 14 Nov 2025 04:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDC3C113D0;
	Fri, 14 Nov 2025 04:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094471;
	bh=BElALngLN2nFhaInsP852/aGs6CMGw4etVXE34fZIjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MChFGhE2l/mEBBnjKokUFr/WJR+V2WR/BNdIXlxZ7F4DWvd5LlA7WR+SbIsNd6T5p
	 XLohdaztk3jTypiLtJViRiMzBcBEj4n3u61lZ6DVKQTtmI2nc6sPXuyui+8eNcpWNN
	 z60MjTf+BRU/qYwxJnNFL50DT9aK3PSZWE+/UaN4vh2keuunX9DvbkE0d6uIt1rQMB
	 9xtjhrNA3YvSgTCuhcIYETlamknRCv8pQYWFIIS1hLgub5xGEWBnRrHhH8O0ZTPbG/
	 6xQOdNn34QRyl9zXUWZ0wi6BB2LZUX+YSZOVyfuQZfrBYX1Qz6BNc1cHvt3eCmgh/P
	 ND3ELNyp2KMPw==
Date: Thu, 13 Nov 2025 21:27:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Message-ID: <20251114042741.GA3582402@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
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

On Tue, Oct 14, 2025 at 03:05:16PM +0200, Thomas Wei=DFschuh wrote:
> It is possible that the kernel toolchain generates warnings when used
> together with the system toolchain. This happens for example when the
> older kernel toolchain does not handle new versions of sframe debug
> information. While these warnings where ignored during the evaluation
> of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
> will later fail.
> =

> Example warning:
> =

> .../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
> error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
> collect2: error: ld returned 1 exit status
> =

> Make sure that the very simple example program does not generate
> warnings already to avoid breaking the userprog compilations.
> =

> Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assemb=
ler")
> Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

While this makes sense as a way to immediately fix the problem and align
cc-can-link.sh with the other test functions like cc-option and like, it
is rather unfortunate that this particular warning causes an error since
the rest of the userprogs infrastructure does not care about SFrame...
I wonder if there is a way to avoid it since I think this warning does
not point to a fundamental problem.

> ---
>  scripts/cc-can-link.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
> index 6efcead3198989d2ab2ab6772c72d8bb61c89c4e..e67fd8d7b6841e53341045b28=
dc5196cc1327cbe 100755
> --- a/scripts/cc-can-link.sh
> +++ b/scripts/cc-can-link.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
>  =

> -cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
> +cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev=
/null 2>&1
>  #include <stdio.h>
>  int main(void)
>  {
> =

> -- =

> 2.51.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
