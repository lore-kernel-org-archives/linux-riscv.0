Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE94C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhnWFndo6rCUFIjrieW1o8EyDOQrqkxmfkM0ymjEjWU=; b=WviOeh0QN8Xx2p
	ndzp8LbEoHSrX/PWKpomms79ezZw+EFhFkj5aF9VJ5ubGGZFv9Bh92cKC4+j5LlEa2Pmkn4F2h92p
	5NVcxYZTS83WNuud5P5/ofkaADhA4kz6JiaX4YMvfTxNe2s1x17g3Ajmw5cZW0WmCJUAV4ceFmGiY
	NA8UVpvsae4Zj+d0Tn5viwx3N1G1KtVUkLMVnafFgG4ZlhOZoSRWncmoUiOyMnGg8/GcClXejH0bx
	JrFePF+bfsVwML+e1gGUbwK48ZTtDcAgqeorz7FNMOzm/u5MnKgQFntonvrjyFOm2eR9FBwLZ0LBY
	b0yk98pbsKMpb19I+S9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmvoS-002pWR-BG; Fri, 06 May 2022 11:07:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmvoF-002pOx-UQ; Fri, 06 May 2022 11:07:46 +0000
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Kvnkp1P18z67DYv;
 Fri,  6 May 2022 19:04:18 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 6 May 2022 13:07:29 +0200
Received: from [10.47.86.119] (10.47.86.119) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 6 May
 2022 12:07:27 +0100
Message-ID: <7b8d7c1a-58c3-4ba9-a4f0-d0e051f3ffdc@huawei.com>
Date: Fri, 6 May 2022 12:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Arnd Bergmann <arnd@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Yoshinori Sato <ysato@users.sourceforge.jp>, "Rich
 Felker" <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, "Thomas
 Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "open
 list:ALPHA PORT" <linux-alpha@vger.kernel.org>, "moderated list:ARM PORT"
 <linux-arm-kernel@lists.infradead.org>, "open list:IA64 (Itanium) PLATFORM"
 <linux-ia64@vger.kernel.org>, "open list:M68K ARCHITECTURE"
 <linux-m68k@lists.linux-m68k.org>, "open list:MIPS"
 <linux-mips@vger.kernel.org>, "open list:PARISC ARCHITECTURE"
 <linux-parisc@vger.kernel.org>, "open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:RISC-V ARCHITECTURE"
 <linux-riscv@lists.infradead.org>, "open list:SUPERH"
 <linux-sh@vger.kernel.org>, "open list:SPARC + UltraSPARC (sparc/sparc64)"
 <sparclinux@vger.kernel.org>
References: <20220505195342.GA509942@bhelgaas>
 <157602011a72061dd31f92bd699e8c1f9a81c988.camel@linux.ibm.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <157602011a72061dd31f92bd699e8c1f9a81c988.camel@linux.ibm.com>
X-Originating-IP: [10.47.86.119]
X-ClientProxiedBy: lhreml726-chm.china.huawei.com (10.201.108.77) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_040744_296462_5F90E397 
X-CRM114-Status: GOOD (  14.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 06/05/2022 10:38, Niklas Schnelle wrote:
> Another argument I see is that as shown by POWER9 we might start to see
> more platforms that just can't do I/O port access. E.g. I would also be
> surprised if Apple's M1 has I/O port access. Sooner or later I expect
> distributions on some platforms to only support such systems. For
> example on ppc a server distribution might only support IBM POWER
> without I/O port support before too long. Then having HAS_IOPORT allows
> to get rid of drivers that won't work anyway.
> 
> There are also reports of probing a driver with I/O ports causing a
> system crash on systems without I/O port support. For example in this
> answer by John Garry (added so he may supply more information):
> 
> https://lore.kernel.org/lkml/db043b76-880d-5fad-69cf-96abcd9cd34f@huawei.com/
> 
> .

That issue is that drivers like hwmon f71805f use inb/outb accessors 
with hardcoded IO port addresses to probe the driver. On archs like 
arm64 or powerpc - which do not natively support inb et al - this may 
crash the system when no PCI IO space is mapped [0]. Indeed, when PCI IO 
space is mapped, it is preferable these those drivers still would not 
access these ports.

So this series from Niklas could be used as a basis to solve that 
problem, in that we could also introduce something like HARDCODED_IOPORT 
[1] to stop those drivers being built at all for arm64.

[0] 
https://lore.kernel.org/linux-input/20210112055129.7840-1-song.bao.hua@hisilicon.com/T/#mf86445470160c44ac110e9d200b09245169dc5b6
[1] 
https://lore.kernel.org/lkml/CAK8P3a3HHeP+Gw_k2P7Qtig0OmErf0HN30G22+qHic_uZTh11Q@mail.gmail.com/

Thanks,
John

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
