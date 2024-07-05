Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB825C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1swqFItxflejhrlMSuSGyNocFYGk6kMQj4Af17U5cho=; b=ITIzH8ezKV+gY0
	2HjpOH1WYfAiimpMkfhSq0Rjvaq4PPc7SSeQ4f3ED3/0PiKdA0pFePxzYg3tHAkrgB1ZmAxsSK7ar
	+W7aGntk0YV+XrAPpi2pwuTeRJ3XXCJeSXLMon9dmSLojuhQSHrrG7BjmWceir4onYsLQTnyzJSGp
	0D3W+g2+oPrTDvMYSAX6bS5hCuhl1qFxxVD1RPCaP/RfWGLtJ+oRrvck9sjkIG9OXoijJC5oOo9l1
	BhyPzyaF5HHcBapiEs3Pf1LwU0yCTH4esq8YeOMZsNNuGH/VywV8/VohO32kAZJgkwwu/9i6u2HD9
	RQ4oKkg3A59XiSiJEPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPhm4-0000000FsLV-1A2x;
	Fri, 05 Jul 2024 12:10:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPhlp-0000000FsGI-1uAc;
	Fri, 05 Jul 2024 12:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EC3E3CE3D8C;
	Fri,  5 Jul 2024 12:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A48C116B1;
	Fri,  5 Jul 2024 12:10:24 +0000 (UTC)
Date: Fri, 5 Jul 2024 13:10:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 09/17] arm64: convert unistd_32.h to syscall.tbl format
Message-ID: <ZofirWrl3nAuOQb_@arm.com>
References: <20240704143611.2979589-1-arnd@kernel.org>
 <20240704143611.2979589-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240704143611.2979589-10-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_051033_704337_4DB8C28A 
X-CRM114-Status: GOOD (  19.89  )
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

On Thu, Jul 04, 2024 at 04:36:03PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is a straight conversion from the old asm/unistd32.h into the
> format used by 32-bit arm and most other architectures, calling scripts
> to generate the asm/unistd32.h header and a new asm/syscalls32.h headers.
> 
> I used a semi-automated text replacement method to do the conversion,
> and then used 'vimdiff' to synchronize the whitespace and the (unused)
> names of the non-compat syscalls with the arm version.
> 
> There are two differences between the generated syscalls names and the
> old version:
> 
>  - the old asm/unistd32.h contained only a __NR_sync_file_range2
>    entry, while the arm32 version also defines
>    __NR_arm_sync_file_range with the same number. I added this
>    duplicate back in asm/unistd32.h.
> 
>  - __NR__sysctl was removed from the arm64 file a while ago, but
>    all the tables still contain it. This should probably get removed
>    everywhere but I added it here for consistency.
> 
> On top of that, the arm64 version does not contain any references to
> the 32-bit OABI syscalls that are not supported by arm64. If we ever
> want to share the file between arm32 and arm64, it would not be
> hard to add support for both in one file.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
