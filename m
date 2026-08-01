Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8B1C55173
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 20:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GufbZ+aWGXIUgeMPo4SEWDSnq7SjlVu6nfbdylEAuI=; b=DRe7kFlB2ZjEDz
	j5BEZohOrPxFtzmV5A2MhKPPTFCvlDOMZyEd2k+Wa5cq7k2frjS7thx2rsauSwmndBUFQbeyRFj22
	G8IMoHqmmHXyUa2GwekmT+crHRaNku5qSMMtonx8Z2FP5KQhYHN2oIR8oqGZWJUkYaqtkFQQtcFQj
	V3i+BvseVMUqOa/pScKemQqE2PIknGnraFqITN5zln5jEDiV5bTJl4fJZTsrwZ2aMeMqDhUsnw3kq
	htRrWAJ9TbalmtGta96gJc7pSLuytDULJHEWEKC7sQLoP1vBcm60G2MqTQ+8b9WxuNa8B46haef7t
	dkAPk4LA+vimKT/OiOZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFy5-0000000F1uv-2ago;
	Sat, 01 Aug 2026 20:06:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFy4-0000000F1uU-23n9;
	Sat, 01 Aug 2026 20:06:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 69483600BB;
	Sat,  1 Aug 2026 20:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 96D7D1F00AC4;
	Sat,  1 Aug 2026 20:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785614759;
	bh=o45YvK+S7OLeve9Yx/dzHWbAcWKWifTwkY56jWeeVrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c6dNkhwM5uKM18Qer5XP+tW/4CrLiuLTGCy9FyARO7A6UjJ04jlRC4Qmzl2oCSh/K
	 7cC9x7476wW6hLiYqkai7A2GftMybhQYzVPv9zlZiKy99ypB7E32TEf/eG++UlALEE
	 Ifi7AeGaaZDa4fT1rEA0ePzz2tw9jnx6Xz6w22UHxTBlZLSVMvhDjdJ+0D8DJclM0m
	 fdDFWswAV4KpvS5YhCjwMeX/W4gyflkz4R+YdLn5AjmHD73af5JVRXG8ZWtcmYe1ml
	 z6Tc+WvYbABNifglg9On52MZDCkQ6ogEhTKXR1eBP4ZZYUTYOA9lW1aUdLZ3cyy1Cd
	 BwQ7cjuQsaReQ==
Date: Sat, 1 Aug 2026 21:30:27 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 1/7] kbuild: support generated asm-headers in
 subdirectories
Message-ID: <am5JU9IBVzXABmsK@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-1-ddbe447be860@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-1-ddbe447be860@linutronix.de>
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

On Fri, Jul 24, 2026 at 03:36:18PM +0200, Thomas Wei=DFschuh wrote:
> Extend the asm-header stub generation to also handle subdirectories.
> An upcoming vdso/ header refactoring requires this.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  scripts/Makefile.asm-headers | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

For kbuild:

Reviewed-by: Nicolas Schier <nsc@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
