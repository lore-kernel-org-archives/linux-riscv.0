Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC57EEB64DB
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 06:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAoZuQDBuA26L07Lis12yFbRzUeN7HvKB4FRK0oc6+o=; b=eeJgUQIu8WS0Gg
	JWqo5Ey3sO0xjRrii3u3Gmrac88jiFKvtM2KOVPcSqC2to/hUtm/Zmg4SMz+dM8rgjYQLgRbaQ0n0
	gZcDLCiIbuJ8sMyRBhrrSBq8o24QEBFsNDUQpl4Y0UriS7SQers7Oq3eVX1E74mJOHnxzDrgOHL5k
	pFiIUs/W3xK8Y7isMTJnt0qgkJTU5ow9KWXYCUqn+JD6QCVlHDlOLVusbBn97Fo2e/RVkjs5GXUew
	AuknqRhGKLU93jjHWkQIKN0Kxm7GM4vVV+lu+HjeYZ//4HgJc+6wr8VEbaV2XRV5t6SH7gBdytxM2
	TAX7g9vgaL1hMVaoTiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPo3-002w6q-2O;
	Sat, 17 Jun 2023 06:53:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPo0-002w4f-1B;
	Sat, 17 Jun 2023 06:53:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF07561087;
	Sat, 17 Jun 2023 06:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C22C433C0;
	Sat, 17 Jun 2023 06:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686984783;
	bh=s5IbUS/R9FUeza7Uno3Hll+WeqZYFms0rCFRllsd4i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0jdChYvxLTPBx1BOB1xElON4yTO54jJpqqtDjBH7kzjTk7h8ut1Zvwg88nJSwHD5
	 dR46BC1yX4kfsB9fmhzM3g5FAiBBJ7EopEe68OhToY9ZvFD0H28XYCChSftyR0QUBZ
	 RDI9hk6abzU7ADT2Mp8RObMy225YcvgqAzj8bWooQ/IUkq2S0z3QH97xrM4q9eh/eL
	 W9Ix4DLih/xlZ3Zq9c6AydZXL5tY2UznK8+LjAqeaAIVsE4aQyWtPv0n7kE5DQG+KX
	 YYFIH+XCs7DhkCWkawXBSwV8RH6HWXBuasnHhsf1ZYp1zsYvUdnbybweDJ02yKksNs
	 +4CfHcBEs1MPg==
Date: Sat, 17 Jun 2023 09:52:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 12/12] kprobes: remove dependcy on CONFIG_MODULES
Message-ID: <20230617065216.GS52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-13-rppt@kernel.org>
 <87r0qbmy14.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r0qbmy14.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_235304_445097_6739AA21 
X-CRM114-Status: GOOD (  16.52  )
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

On Fri, Jun 16, 2023 at 01:44:55PM +0200, Bj=F6rn T=F6pel wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> =

> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > kprobes depended on CONFIG_MODULES because it has to allocate memory for
> > code.
> =

> I think you can remove the MODULES dependency from BPF_JIT as well:

Yeah, I think so. Thanks!
 =

> --8<--
> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index 2dfe1079f772..fa4587027f8b 100644
> --- a/kernel/bpf/Kconfig
> +++ b/kernel/bpf/Kconfig
> @@ -41,7 +41,6 @@ config BPF_JIT
>         bool "Enable BPF Just In Time compiler"
>         depends on BPF
>         depends on HAVE_CBPF_JIT || HAVE_EBPF_JIT
> -       depends on MODULES
>         help
>           BPF programs are normally handled by a BPF interpreter. This op=
tion
>           allows the kernel to generate native code when a program is loa=
ded
> --8<--
> =

> =

> Bj=F6rn

-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
