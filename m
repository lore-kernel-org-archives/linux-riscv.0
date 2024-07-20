Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88237C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yh3NsyW3RzMRqSBwTuIqYFcPaBydONmzK9LMy3F7i6g=; b=OKi6LG5W7WRmAr
	z7OBFq0V02c5lYS0VMEG8/FMkFSvaFtMzGfajG00QuyE5EljEZatfDHbIWyvZk8XNXgWLEUPzKwJ5
	ZOfiw4uK8XCyV2mbJJmHD8/qGfJl2QQCKF9Pf3fhyW85JDoSV6KyRuTeAEcqpII+K02xn4SJh8Q9X
	MjdrY02FHzQs3RXjvP9+CcDJuYZJgAs5v8Om/g3+qzmOkFlMOyGA8ZXZ2D1irss9HOEc4qtTXBTaa
	cAy6zMVH18S/nyuEayIC65w5sT+Y+unXmP7Mf0Cx5d1enPP5M8mnK+wHYfe6VSfuT+CWAlSoZ58CQ
	WwQ673bybNILlBWqF6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV9Co-000000055Ut-2j6Y;
	Sat, 20 Jul 2024 12:28:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV9CO-000000055K9-0BfD;
	Sat, 20 Jul 2024 12:28:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EDFC9CE01C5;
	Sat, 20 Jul 2024 12:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F9FC2BD10;
	Sat, 20 Jul 2024 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721478503;
	bh=/mmf7KEQ2fPqMset/cgfJzrTW1VPxx9MyxonZ+AyPQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXNTwVKG4a4xYLw48OLtatEkRdqIGu8Mf+G1aUXiTTPTpT78IYUQ1/wzw0qcFGQoR
	 EepLZpsfpjbXKbh/xfZLM3pDZgCx3YVNfQ8PYWZH73ncdrVoIJ9MY6uDPyRIVyQIRs
	 +mD0V5quwhKhuRIUn7YWWcUOTpwaW7OpiJS6ob2EzbfT+pcMNhHQp3Wq1wCk5+tueN
	 cPKdYI9XDCq7cwRj9VCCE2OjNxFU7Ln9GS8efdMPhwguntvnlAzgrDRV9PZkgruXop
	 kgltilDaq6nb/4rY0NbgAzNLz0ekUP2swIpCx5HMEf1sL/wDuc2020z2LPpHNdvHa/
	 VhAS6LNc+rmag==
Date: Sat, 20 Jul 2024 15:25:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 13/17] mm: move numa_distance and related code from x86
 to numa_memblks
Message-ID: <Zpusq94oFVrygufA@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-14-rppt@kernel.org>
 <20240719184842.000030bc@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719184842.000030bc@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_052828_264685_B78A9A89 
X-CRM114-Status: GOOD (  14.74  )
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

On Fri, Jul 19, 2024 at 06:48:42PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:42 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Move code dealing with numa_distance array from arch/x86 to
> > mm/numa_memblks.c
> 
> It's not really numa memblock related. Is this the best place
> to put it?

There is a dependency of numa_alloc_distance() on
numa_nodemask_from_meminfo() that relies on numa_memblk but I agree that
they are not really related.

However, I'd prefer to keep this code in mm/numa_memblks.c because
node_distance() definitions and related code are different between
architecures and having this code outside numa_memblks in e.g
mm/numa.c would be way more involved.
 
> > This code will be later reused by arch_numa.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
