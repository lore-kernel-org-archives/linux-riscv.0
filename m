Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4CFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 00:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijQF5GYHU6ZYcdb6uCU04IPW85TCT+C7cu98CNfo3E0=; b=Cjpxx84wf0UdEb
	9MRllNPG+Ti5dd43xA1YXsqchIPF5c1wrggz9+nxKj7MyEnxkUiWLZ8jVfJc+sJmxB+/QT21t13pr
	KyaGezQIkwdY+P6Vpb7Q4IvAsRIpIb/ofxgBKNOmje0npFTvu3IN7TVWkS+TOvrUQUYlxz8Ti8LHa
	PYSy02y7wUlFjE2eogbYFevzYirCdLy2a4diCLxgGn6um/BRz1bmP1fQpY8G1VvHrQf4jEJ2DEYe6
	w3D6FT/ACugT6BanJnN//MU5Xp7pafKV+mjIv44txbs2frAOALbuuts9B3eo8A62HTm8BLwgd95eF
	BWHWZDRKbwLrr2CBvWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJllz-00HNFi-Aj; Tue, 15 Feb 2022 00:32:51 +0000
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJllv-00HNEw-Pq; Tue, 15 Feb 2022 00:32:49 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJll2-001pbW-H6; Tue, 15 Feb 2022 00:31:52 +0000
Date: Tue, 15 Feb 2022 00:31:52 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 will@kernel.org, guoren@kernel.org, bcain@codeaurora.org,
 geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de,
 nickhu@andestech.com, green.hu@gmail.com, dinguyen@kernel.org,
 shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net,
 richard@nod.at, x86@kernel.org, jcmvbkbc@gmail.com,
 ebiederm@xmission.com, akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 05/14] uaccess: add generic __{get,put}_kernel_nofault
Message-ID: <Ygr0eAA+ZR1eX0wb@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-6-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_163247_850464_F9EBF3A1 
X-CRM114-Status: GOOD (  11.83  )
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

On Mon, Feb 14, 2022 at 05:34:43PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All architectures that don't provide __{get,put}_kernel_nofault() yet
> can implement this on top of __{get,put}_user.
> 
> Add a generic version that lets everything use the normal
> copy_{from,to}_kernel_nofault() code based on these, removing the last
> use of get_fs()/set_fs() from architecture-independent code.

I'd put the list of those architectures (AFAICS, that's alpha, ia64,
microblaze, nds32, nios2, openrisc, sh, sparc32, xtensa) into commit
message - it's not that hard to find out, but...

And AFAICS, you've missed nios2 - see
#define __put_user(x, ptr) put_user(x, ptr)
in there.  nds32 oddities are dealt with earlier in the series, this
one is not...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
