Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5927DD591A5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNBd5mp1NK3FWW71xoNiVS7lT7WKio+ZMPPTKO7XTC0=; b=zqvK2Xjq6infcw
	uS4wWT7pPu+Z20IJrtknDVzqS7DlS+jouEdriUa/vUlKrDozo4iY7JB4m5gNlo6I1uvrK4KEmhbgC
	RAUeesFvEGUz/n8DGogeBqp3yvIl15PwdmkyxDFvidEvh0VI8/gZBpeNyiZePrr7LEoeOoJIM9zlF
	d9187mh+N2uypvWXBxG5anjhqP1Nx1p3emOPQ+2Mz2yetrt+wbzUerNMdOz2JWwIXx747lpFbKi8w
	fRienIWz6Ymn9mUlzxvgop7+YOEanJRDHg+TqNnlX6+Y/ualxLcswcyb8UXPBXQKOU/dCrKH4JfzB
	HBnwIVRUtJhvwdHx35vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4v4-0000000A6sb-2PtP;
	Mon, 18 Nov 2024 16:48:10 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4u8-0000000A6ct-005L;
	Mon, 18 Nov 2024 16:47:13 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3CC8340E019C;
	Mon, 18 Nov 2024 16:46:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id c6v2K22B5Tnb; Mon, 18 Nov 2024 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1731948411; bh=rPDV0OJuPMZjYOAxC/88k5DmzxXHqcjOOoFuf/a7xM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cc9tbCWXLsXSrJi7c1OfRXsQ2qSLXZmGyrD6Ue1nlLUTcaY/vtPzAd8MPRX5vxnmb
	 9ZPBWH22VFOSy107g8yT7ZaHuJaiBzgNuSySoZ2LvQ8Iz/mv5q0cQzkGrILcMx3tpM
	 N5u/p2XCUd7YVYW4WMtcUwToF86Sw8IbCNA6AVzOMCEsPWEXhZg1P2U8MFPk9sBZTl
	 TiPhEeHJh27yOHn8ghqJ2Ph/aMgEDBxGB7NFxSsOQE3oPf8d4ntpH3Gw1Dm4PP9qSE
	 H1mHy8auOJQYKFPFAZsnr7lug81DkxaDgkg/wJO1jsHNud9MxEfHEgUEA//v14tV40
	 I5N3K5PWKjmhbEWdDlRCcEF2GXQNiMu0rZ+GBH3OPXkwAYP6XR/VB1rBeu4o60p7By
	 OOBUtZeL9JVb8w4kwMRllAUQ0VZxDq1Fq0Z9XfmV6Hg+hU5vSAEFf5OxuvswXuMihj
	 YILuCMQ6eyThHcDMGwKPbRRei+FexB+brIHyWwX8yG6OMDtGSHd6jCGM0Ug9aK3vT/
	 2yjMZu8Q42ewHmKMKqPf2daKWoZbiyDN+PqwhsiaAXS2nCKMKjY/TVPvSivoQcvZOE
	 EkMDd+mSyQnvE4qJBtHrURoQqMvMjvfOH488j6ZRiVpzI5AwQkR90P0uA5jRlcA6QF
	 xw5MBqcn5hwajMKsV0d1eX7g=
Received: from zn.tnic (pd9530b86.dip0.t-ipconnect.de [217.83.11.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 47B9840E0163;
	Mon, 18 Nov 2024 16:46:22 +0000 (UTC)
Date: Mon, 18 Nov 2024 17:46:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kai Huang <kai.huang@intel.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Russell King <linux@armlinux.org.uk>,
	Samuel Holland <samuel.holland@sifive.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv2 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_084712_184705_B5A03AFF 
X-CRM114-Status: UNSURE (   7.33  )
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

On Mon, Oct 21, 2024 at 01:57:23PM +0300, Kirill A. Shutemov wrote:
> It fixes crash on kexec in TDX guests if CONFIG_EISA is enabled.

Do TDX guests even need EISA?

"The EISA bus saw limited use between 1988 and 1995 when it was made obsolete
by the PCI bus."

Sounds like no to me.

We usually simply stop coco guests from touching such legacy ranges:

f30470c190c2 ("x86/boot: Skip video memory access in the decompressor for SEV-ES/SNP")

so can you do that too?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
