Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09169CD37BB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 20:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2cDa2L3MvqEb8IrFHaNs3XC6EooOIRbB509kdKJ9dc=; b=04aO5BB2IYqziR
	+C3tI6jBeU0o28Ap+rFlQQg0phwBvZZnvF0ZmdFqEXf52Y6cXZvgrGsU46Azs5d2IguroPIOJrbU+
	dzWeaSUpMb0ePxbVRA0fu/Xa7EmGjJFqvBi5AH0IDsp8Ow1MCg74b0FVOTVGt5vPmxE0lwCH3kFgi
	DB81rV6u1slE5SXFUB74JG6ZM8ihDbk4nTNpb3CA0aPE+e8klwmFRJRjcxAysmGgbuElhjWX13ePI
	cjeBETsiiLZt5y7wHWNkNE9LfqlyOX2+W5ewZ8s6xyYIWYNiKZq7HZcpzfFPN5hDKaJ67jkMB90zf
	9D6e3DWcylVP2EFDO5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH4D-00000009SFb-1BOm;
	Wed, 12 Nov 2025 20:03:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJH4B-00000009SEG-01ZT
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 20:03:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E7F2445B7;
	Wed, 12 Nov 2025 20:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB406C16AAE;
	Wed, 12 Nov 2025 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977821;
	bh=Krdas9AzGSECOCFA2WfUlzdX75hmmwim4vrl3G2LHP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccIrzsBu2sfaHL8EwE2+XzXAm+mSMhbBgAeiXJyPaOGTProGPgOQ81EjsiD/vkuJ4
	 QzAsAniJY1RexfM/F66rsQeFRzK77ivQC547WLrUhU8Q9ShngnZe61HJpkojC3tPRa
	 frNdTBKI3g29VGiHlHHpmGxYVkdiDL5WEO8y7NyaWL1P3XoB2S0lAlUQPcJ8z+K2b5
	 16pXiKl/FScrxzrW3onwGDarm71eUAIrMkkdyfOQItHCaDiHooPRUBdvhi+DVScKO0
	 ZuMkWCnzSMioRC9My5WYdAJlMCScrRC+w9btXbUu1NxxmHhehoQjfNJ34KdLNchkTv
	 Gqbh3kbJ/tMzQ==
Date: Wed, 12 Nov 2025 20:56:04 +0100
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
Subject: Re: [PATCH v2 02/10] init: deduplicate cc-can-link.sh invocations
Message-ID: <aRTmVAcGpqcyjU26@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-2-faeec46e887a@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_120343_066277_81FDCEA7 
X-CRM114-Status: GOOD (  11.48  )
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

On Tue, Oct 14, 2025 at 03:05:17PM +0200, Thomas Wei=DFschuh wrote:
> The command to invoke scripts/cc-can-link.sh is very long and new usages
> are about to be added.
> =

> Add a helper variable to make the code easier to read and maintain.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  init/Kconfig            | 4 ++--
>  scripts/Kconfig.include | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> =


Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- =

Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
