Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C00ACD37BF
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 20:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhgsHSWwYE+AJAvCgsuLaujv5DRjJZ+yiOoelBzkR3Y=; b=0ZIh3xkES9s9fL
	3Pqye9MJximiqi/tOt7uR7YWBPDW8VZnQYOsgvjUaW1CUx97woIE2bBdhv/V68MITAIqEjwbk5VGy
	PUjcOVnbHT2Mo9eM4+pSWswG6j0w4EOvT6mox0SD8H6ClDHyzba3VcVKrRKNOcqENppFY+OY1VuLU
	OKgwRHDjhmE92z9r9fFog7l47FHaYbG25Fyk+1793/1COo6rAsuQlCne8ngJlvke+RB9Hglr11Xo/
	ZfzZ7QAZvP07Ythvnpm2SEFxmg37SsPONz4jGOMV7fKN8t98HBwsFzMFWgu0Lj7xD347wy5pj3oB1
	WNTGyhhhptxQdg633kEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH4I-00000009SIP-3qwx;
	Wed, 12 Nov 2025 20:03:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH4F-00000009SHB-3wln
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 20:03:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85823445D2;
	Wed, 12 Nov 2025 20:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9848C4CEF1;
	Wed, 12 Nov 2025 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977827;
	bh=yPtrlmY0IQVG2j8kOjS21draicu9LupkNCxZyl2KJs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pseUIglzfH77wCOtINpw4wNljlqAXfilMaf+ELGuMA4dE9ngP9hIwCAr6f0booGAI
	 KGS3ahcwI3EKsfa02eyAbS5hdRtWdzVsGzXuxWciW0c8UB91X+lv73569lka9lXOjo
	 9UgY/UZ53h5zs9LLLMTLHGLG9gOXpN139PBlV8xn7dIvZkyWvDK0YfN3HF4VhLPRpY
	 F1ii9M1+Rt8t25qp/G5CL+NO2XGWqVT3q1gZiL7tZmIyG9UAiZL2XLfrk9wk5wTFm5
	 o50YhE0QEdM1vOQMLJ7P4GtSyESJbHIrkZHgt2Nei0dWtoOsa/+sLdTKSJBLe+T8dj
	 puB2ZKLo9xyhA==
Date: Wed, 12 Nov 2025 20:56:46 +0100
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
Subject: Re: [PATCH v2 10/10] kbuild: simplify CC_CAN_LINK
Message-ID: <aRTmfreiEEMez2gs@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_120348_000438_BD64BECA 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 03:05:25PM +0200, Thomas Wei=DFschuh wrote:
> All architectures supporting multiple ABIs have been migrated to
> ARCH_CC_CAN_LINK. The remaining ones do not require any special flag,
> so simplify the logic.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile     | 11 +++--------
>  init/Kconfig |  3 +--
>  2 files changed, 4 insertions(+), 10 deletions(-)
> =


Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- =

Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
