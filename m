Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8CEC3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVtumj4tGqUbAAJB+vTQGQSaq36KVZKgn7SHXz3IptI=; b=zS1Sh9vPgtaeWX
	H2tq0PPQ+zRIhOq4YKw9qAMB8aQLwJeJGUs5eJk6FBoE10npwGB6tjZeO0P83TWhrjUhTwJwGh2Ak
	08MIscKS+/qbgfIEXCxchFPiB3OEjT6q/5uFTnuN5zrVYJQ8jc0iBvLdg55qLCDINCmtwe7kZdUqJ
	KFTN3WEZWPw+qgQZBDdpFc8GmV1ErCSk8LwjNOA+YYGkbVnPcalgwJTrNEFSDX+m+593R3/JpJPfN
	7pFbWOZPquooP+8xK9+t2RTkGLe1B30+gjQBepvz5pULH0L8qduV+doYGjN5sEcxzY0DZu4y8p7xf
	sUyXUjNzzSuARbig2DFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXHRd-00000003Tlg-03KF;
	Fri, 26 Jul 2024 09:41:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXHRB-00000003TZA-1aVQ;
	Fri, 26 Jul 2024 09:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5FE54CE1349;
	Fri, 26 Jul 2024 09:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9535FC32782;
	Fri, 26 Jul 2024 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721986830;
	bh=/W5kbKWSvcsVRYIH6lNhUURaeOalcNxprGj7xwqXc8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erbBnHVtheMUAGs7sb6st1OpVR9FaIVHYj78yec90OKFphlkSZV5k/wAOzf9v7bHw
	 qD/B4sk/oLODwsgv3p0XiErsiTqRDrNBJUfunPPt2ly/fcLhz146SfXfrJeznvLkZe
	 U5MzHL6oELYwecQ5CE2FRGA7zc5ak6Om4kOHFE+xDor4Bpwaxj+6BMtxs9zpKRb0zj
	 t0frO2fOt1mK8tuZJlZLn78/gGZpvARM3U+4DMaFSKK7j8fCZBwVSU2h9+v0uuhWmf
	 doJp2N540bOFVoqeMi8DgOk/gCs4xM/TGYVOkNqWaGGBNobmAGDB5q2iYuCtHTHaiN
	 kQwqqR1cv6trg==
Date: Fri, 26 Jul 2024 12:40:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 00/25] mm: introduce numa_memblks
Message-ID: <ZqNu8zwjhiTkbpIB@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
 <1D474894-F8AC-427B-8F90-5A6808E77CC5@nvidia.com>
 <6336C276-113E-4D93-A09E-13420A6438D8@nvidia.com>
 <231F6DF6-96C8-4149-92CF-4FC03C9FE357@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <231F6DF6-96C8-4149-92CF-4FC03C9FE357@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_024033_784567_BAAF8A30 
X-CRM114-Status: GOOD (  35.23  )
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

On Wed, Jul 24, 2024 at 10:48:42PM -0400, Zi Yan wrote:
> On 24 Jul 2024, at 20:35, Zi Yan wrote:
> > On 24 Jul 2024, at 18:44, Zi Yan wrote:
> >>
> >> Hi,
> >>
> >> I have tested this series on both x86_64 and arm64. It works fine on x86_64.
> >> All numa=fake= options work as they did before the series.
> >>
> >> But I am not able to boot the kernel (no printout at all) on arm64 VM
> >> (Mac mini M1 VMWare). By git bisecting, arch_numa: switch over to numa_memblks
> >> is the first patch causing the boot failure. I see the warning:
> >>
> >> WARNING: modpost: vmlinux: section mismatch in reference: numa_add_cpu+0x1c (section: .text) -> early_cpu_to_node (section: .init.text)
> >>
> >> I am not sure if it is red herring or not, since changing early_cpu_to_node
> >> to cpu_to_node in numa_add_cpu() from mm/numa_emulation.c did get rid of the
> >> warning, but the system still failed to boot.
> >>
> >> Please note that you need binutils 2.40 to build the arm64 kernel, since there
> >> is a bug(https://sourceware.org/bugzilla/show_bug.cgi?id=31924) in 2.42 preventing
> >> arm64 kernel from booting as well.
> >>
> >> My config is attached.
> >
> > I get more info after adding earlycon to the boot option.
> > pgdat is NULL, causing issues when free_area_init_node() is dereferencing
> > it at first WARN_ON.
> >
> > FYI, my build is this series on top of v6.10 instead of the base commit,
> > where the series applies cleanly on top v6.10.
> 
> OK, the issue comes from that my arm64 VM has no ACPI but x86_64 VM has it,
> thus on arm64 VM numa_init(arch_acpi_numa_ini) failed in arch_numa_init()
> and the code falls back to numa_init(dummy_numa_init). In dummy_numa_init(),
> before patch 23 "arch_numa: switch over to numa_memblks", numa_add_memblk()
> from drivers/base/arch_numa.c is called on arm64, which unconditionally
> set 0 to numa_nodes_parsed. This is missing in the x86 version of
> numa_add_memblk(), which is now used by all arch. By adding the patch
> below, my arm64 kernel boots in the VM.
> 
> 
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 806550239d08..354f15b8d9b7 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -279,6 +279,7 @@ static int __init dummy_numa_init(void)
>                 pr_err("NUMA init failed\n");
>                 return ret;
>         }
> +       node_set(0, numa_nodes_parsed);
> 
>         numa_off = true;
>         return 0;
> 
> 
> Feel free to add
> 
> Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> 
> after you incorporate the fix.

Thanks a lot for testing, debugging and fixing! 
> 
> --
> Best Regards,
> Yan, Zi



-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
