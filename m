Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BCDCD4841
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 20:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skh9tsE5VUzN1zfIHvRf3TCriyR/+FdswpRsHt2Nwik=; b=mR0EL0okfNJo6b
	v5ExgQINmBIlJLaxMxWsbjMqzSJ663ypvyT7mtqkPFfnFCNO97s6ZYnJUwi2osLdtJimTXkinEfax
	Z4/yiGMFeMVfZhO8z8P6p1MuZgwpwoZFBGQy31qJZZ2x4pMfMXezZfJd/I/NrDjmyJDOmRlrTz+gR
	JaiJIY1ulb/3T0F+IpIwQmmjHDCjBlIol6poTHTkKqitd2lF3qGOhBX1PkBcnVpVaowUSSAIWy9TY
	1EtBaO94d8eT6rbxNy/wMWQepIfxx5ct5OfEstgxsn3yW1lR0FVQwN2F7sdpDl9swqmFKVa4zvrti
	vVhaFW/Zd48L2cFZNUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH48-00000009SDz-439L;
	Wed, 12 Nov 2025 20:03:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH47-00000009SDr-3K9a
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 20:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C8BA601AF;
	Wed, 12 Nov 2025 20:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88134C116B1;
	Wed, 12 Nov 2025 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977818;
	bh=zAvG1Qo2HuWOnUmKk3EcMjBeNxBNM8ZFtr9UpT/34Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJlDjxq7IfTUQQ7KUoqeZvLJ7e7liS62fkRaIr+cTAEO3z6jy+mhhshvOmd3bh8vc
	 LKQO04khJh2oTe+f9rb+O0G37uBzgRuvleSSc1k+8vfLQQV7cKjeurjC9gI6nKycv6
	 PtFT/rC0/q2cqD1G9etafq9EthszRCQfMIRlsYu7HBTVjs9du5ebCl4+i2pradypdg
	 uuGbRqvggNZ1Vq8SYiqLM6ZaYk0XhBHTie0iiVMSMc61PWlcq5ZLMdJpdkHbN/3sxg
	 o1Sg+B3yFgDuYTpbiL1bDCgFQIu50KZMRUyF2kc3V/3zdo4GQF+AkhnVV8Fo5aIP9W
	 TUrrjnu0wLLlw==
Date: Wed, 12 Nov 2025 20:55:55 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
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
Message-ID: <aRTmSzzOmdhBy_lO@derry.ads.avm.de>
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
> ---
>  scripts/cc-can-link.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =


Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- =

Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
