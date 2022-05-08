Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60369C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  8 May 2022 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNb8XFM97AxntF/oop1muQ2tm0H4J7oGFX+o0XCqUi8=; b=CPQn3Oqdnq7XGv
	RY601vRUrAx+2qn65pc23YOArEDdObcK/t9LDkhRzsSRITozXLp4fP9eiDAlIdyMJ/j6hNb6QqPJE
	05v08Ka0Q3nBsVMKWqbEHREqSfbUyVzx8oppF5O+sTca5Js2MGwnTRbuwR+Aoa4H8kZ7lDhQKeLRV
	51ax1ysQz/mkDQOq3DjbeIjNLJyloV+qLG8kE2vnPqTP87gf9kbPtxfZLFIOSQ/+vO1XFTqqc37LY
	3jKvQpSbOw6lGiPSAHFCkU6A7NmXMhiJVEQ+eIP6zcXFrWW8rlBMRtZl4rJau/aPaXdAsg6lStGKF
	PyV8Mhc7IDBAIkhg8khQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnUaY-008e6j-PL; Sun, 08 May 2022 00:15:54 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnUaN-008e4u-AQ; Sun, 08 May 2022 00:15:44 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BA7102B01A5E;
 Sat,  7 May 2022 20:15:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 07 May 2022 20:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651968936; x=
 1651976136; bh=hBCmJbIqgEytzYwa8CW7BN7wQ9FjoZGR5Pq0KkOSgR4=; b=a
 Fd+8vokQcvbA4GWW9owApfwSeCCmripmwI1V8BhLeK5KaZNhXYioKWO7gI/i4WS2
 7k47a/ZWVbS9L9Tb94YqvYOtS7N7Odf5y1vj4JNgmK7LNQqCWISAKcO+P4rj0UMi
 q+RtVMiTD2S0odWphzabgNOzrXhZiGf5nIMLf0LKorYXqpXkyhAyhpWHbDYXh7SC
 lIsqVRz6rHiSoRmYVbBPXTr50ooseR0KbMmjBLcBybt5kQU3VX6Uv3BlsayvPX8K
 rT/CABNOI5QNmto+53M1TPT98lstPKrnj3wt67ZKWi2d0IKDKzkcno0YDJCen2gb
 pvOvYx7XyUrz2lynIGXHQ==
X-ME-Sender: <xms:nQt3Yu2EHi4ipuqnh-IQxeR3-pYmafCL0ycLmbVR9jkQSZuwwhMCTw>
 <xme:nQt3YhGj3WbJjLWRninJPo0UdIhOCVOzhNulF-SivW5rfLH6ZZQyRpAgUojPbF8-C
 5lTRDk0I_hwK1GBwHg>
X-ME-Received: <xmr:nQt3Ym4M7PXyIjFTVPJSxyNTs6iYk-KiuVj0c9xbLZnPIwKKKX3pbGagQ0aMJCEstBpD08vkytiENlEH1oJyJPG-juBdv5xk6po>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
 ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:ngt3Yv2K9-Zw_Jv6Z_K6SmuSI0Dgy56dsjusRgWQOeGaH_9LVHsGyA>
 <xmx:ngt3YhFAxYHvfpVbkpFftwsm7VPnoe1hEExANO3zwqFSWMnA4ZPxbQ>
 <xmx:ngt3Yo8pHsdl-eEhvlnevon6M7vqHjCeDigA6J9OPD9hPyVH2q_GOw>
 <xmx:qAt3Ym7_mrm_1RQ5vAt6Czfp_u6IruN66F4H7V-seVcfOQQjEYOJyLnz_fE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 May 2022 20:15:23 -0400 (EDT)
Date: Sun, 8 May 2022 10:15:31 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Arnd Bergmann <arnd@kernel.org>
cc: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <6f33385-5612-7042-e1b3-aa32895e91e0@linux-m68k.org>
Message-ID: <e01fac8a-7568-14b6-84-affc4a40c6d@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas>
 <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
 <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
 <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org>
 <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
 <6f33385-5612-7042-e1b3-aa32895e91e0@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_171543_470474_2C31FA48 
X-CRM114-Status: GOOD (  11.68  )
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


On Sun, 8 May 2022, I wrote:

> 
> That suggests to me that we need a "bool CONFIG_WARINGS_INTO_ERRORS" to 
> control -Werror, which could be disabled for .config files (like make 
> allmodconfig) where it is not helping.
> 

I just noticed that we already have CONFIG_WERROR. So perhaps something 
like this would help.

diff --git a/init/Kconfig b/init/Kconfig
index ddcbefe535e9..765d83fb148e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -150,6 +150,8 @@ config WERROR
 
 	  However, if you have a new (or very old) compiler with odd and
 	  unusual warnings, or you have some architecture with problems,
+	  or if you are using a compiler that doesn't happen to interpret
+	  the C standards in quite the same way as some other compilers,
 	  you may need to disable this config option in order to
 	  successfully build the kernel.
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
