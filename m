Return-Path: <SRS0=aNP4=OO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CC2C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  5 Dec 2018 14:44:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA6420878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  5 Dec 2018 14:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OfTRwIJq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FA6420878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqPl+LhXWpCFh+JlWWlRkImDNUomRWOoqtwuYxWG0v4=; b=OfTRwIJqpZqemY
	ChrLW5HNH7i+P4MZEootMWK04MMsJ1ae0r4sdK7jUdPAK1izrsM8jUhhWPz3UJCVM7dKsfwMLwGaU
	/tzzNGKb44Oncji74q6AIMzhXUtfenxXzvtwW0RuvK4eEIkVyc4aHEULjol/7nDj+BZ6fB8zbV0Mr
	K2UsmPgGnCqY/ltw5YTWTEJafwNFwRr/fqkEskNJ7N9w4jtB0RlY8RLy2ntI6I64vTEJxrHLJVU5b
	nvqZ75YU89KLUq95xKP2JJk+fqXAJJrkuKV8C2J9nhaYLRVn4m/cRjCZPD/V6bsoWd3c2rQncbDI+
	+afMp1IPsIlXLIbrfeHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUYPx-00082u-Rf; Wed, 05 Dec 2018 14:44:49 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gUYPm-000829-8M; Wed, 05 Dec 2018 14:44:38 +0000
Date: Wed, 5 Dec 2018 06:44:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 3/3] arch: remove redundant generic-y defines
Message-ID: <20181205144438.GA30692@infradead.org>
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
 <1544009286-15705-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1544009286-15705-3-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 Alexei Starovoitov <ast@kernel.org>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Hendrik Brueckner <brueckner@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Daniel Borkmann <daniel@iogearbox.net>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-xtensa@linux-xtensa.org,
 Mark Salter <msalter@redhat.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 nios2-dev@lists.rocketboards.org, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, Richard Kuo <rkuo@codeaurora.org>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Borislav Petkov <bp@alien8.de>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 05, 2018 at 08:28:06PM +0900, Masahiro Yamada wrote:
> Now that Kbuild automatically creates asm-generic wrappers for missing
> mandatory headers, it is redundant to list the same headers in
> generic-y and mandatory-y.
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Oh, that is very useful, especially as maintainance of those
generic-y lines has been a mess!

Acked-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
