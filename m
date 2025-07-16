Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05344C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXbIPSAj8ymqJumgMT2KS2/PaHKG7CF625aZ2atAxrA=; b=yKvbMbmH0AAanw
	Ab+8JdvPlg9+EyHKx3hGfsQ92VYjrBL05CAV5VGWRb8mem89rsKn20AyvQ2SgTSycAf5GMlCW/oSg
	H7u5ZXzFo443SvRGreTyd53QHnyCfdsPICHUaerqu6xNXcDxmwVYhbQUbTcyrjcjcfDd1zp4cEUA1
	9mwsJz2S8w+qr8cDX2Lv7YhN13RcSIYyzQz0lEy+JcsMAv+/o5EqwqxpssXwu8Ec6Ekqf7Dnfv2Dh
	SEwLr0Xofmo5EbZXYPRmYtbj9I/Bt1/acFOiAHxzbGDXzWlZZ0/t9P0pnuturfKa7narFcKZcOiZC
	mt5AjoNPRdb1+OMyu1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6gL-00000008NCO-48Rx;
	Wed, 16 Jul 2025 18:16:41 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6gI-00000008NBA-0wGh
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 18:16:40 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate-4.ics.forth.gr (8.16.1/ICS-FORTH/V10-1.8-GATE) with ESMTP id 56GIGLX13571809
	for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 21:16:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1752689781; x=1755281781;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0ljLNE0A08ufOfVOct9leqOd9AI0knnSRTMa6TKqoGY=;
	b=f1G+fqPDSAtrpryUUrJEZQoPz/MRDgjbNkwh5/PuAaqwn2pQATPYGq2xyES1oErE
	VZRIToOTVHnJKcfWmbMw7q00AXqJX53N0mNvGfOx/Tk0dnQSPvUKshHKIq/QH9wE
	Ib67ZhmNlkwAm+Eb8av7vQgO14SM19AygQVU5I0tFIJ5wC30HbbE2IWHl6pcR60R
	A+1eVWPrrfIUhhf/2D/vlmGycPzuIF3TKEtOIJLO/TkNvig7knT0mPs6GI8H+5vC
	0eEXFwCr5TtPY2ESbcxja8rx/sGL05P6Afptd0dyFoVlFJ5CRep08kUIGYu5w8XS
	KLY9cJRtra2kYZkXrbQ0yg==;
X-AuditID: 8b5b014d-ecfdd640000bbd64-b9-6877ec75c1eb
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 46.DC.48484.57CE7786; Wed, 16 Jul 2025 21:16:21 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <b0fe6b34-ab18-4c29-a357-9829d6d3c740@ics.forth.gr>
Date: Wed, 16 Jul 2025 21:16:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Fix for riscv vmcore issue
To: Alexandre Ghiti <alex@ghiti.fr>, Pnina Feder <PNINA.FEDER@mobileye.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Simon Horman <horms@kernel.org>
Cc: Gregory Greenman <Gregory.Greenman@mobileye.com>,
        "bjorn@rivosinc.com" <bjorn@rivosinc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
        Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
References: <20250409182129.634415-1-bjorn@kernel.org>
 <20250630112309.97162-2-pnina.feder@mobileye.com>
 <87jz4txsjx.fsf@all.your.base.are.belong.to.us>
 <MRWPR09MB80229B89C8D4B4865783B3D78F43A@MRWPR09MB8022.eurprd09.prod.outlook.com>
 <bd2bca3b-2b23-40be-b81b-f842b7afb10e@ghiti.fr>
 <MRWPR09MB80220E49BECD4D18E4AEC5C38F4CA@MRWPR09MB8022.eurprd09.prod.outlook.com>
 <MRWPR09MB8022F4714CF3B62DCCA683D68F54A@MRWPR09MB8022.eurprd09.prod.outlook.com>
 <7207e208-a70f-4445-9acc-d910c4da745c@ghiti.fr>
 <MRWPR09MB8022AE6B2BED3373D55E31DB8F56A@MRWPR09MB8022.eurprd09.prod.outlook.com>
 <75604cd4-65bc-4ff1-9537-92b9cbf06e77@ghiti.fr>
Content-Language: en-US, el-en, el-GR
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <75604cd4-65bc-4ff1-9537-92b9cbf06e77@ghiti.fr>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsXSHT1dWbf0TXmGwa0pshbP7nxltdj6fhWL
	xdsbrxgtlvx9yGTxqP8Em8XlXXPYLLZ9bmGzeHm5h9mibRa/xZGOt+wWtxe9YHPg9njz8iWL
	x70T01g9Nq3qZPPYvKTeo23KRkaPG7MiPC41X2f3+LxJLoAjissmJTUnsyy1SN8ugSvj/5zb
	zAXX1CpurL7A2MC4XL6LkZNDQsBEYuHZPjYQW0jgKKPEk7dxEHFLic2fXrKA2LwC9hLH775k
	ArFZBFQlZje2sULEBSVOznwCViMqIC9x/9YMdhBbWMBYYkLvSuYuRi4OEYHNjBL3D8xjAnGY
	BTYzS/Rv3grmCAn8Y5E4Mb8HrJ0ZaOz8Z5vAxrIJaErMv3QQKM7BwSlgI7H1WghEiZlE19Yu
	RghbXmL72znMExgFZiE5ZBaSSbOQtMxC0rKAkWUVo0BimbFeZnKxXlp+UUmGXnrRJkZw1DD6
	7mC8vfmt3iFGJg7GQ4wSHMxKIryTL5VlCPGmJFZWpRblxxeV5qQWH2KU5mBREuc9YbsgWUgg
	PbEkNTs1tSC1CCbLxMEp1cAkZSDX3evvxf941pqzPt2+z9Zlt95f31a9xm1JRWmmUqeEopl9
	xYbTOrxp/o/XxfR/ucxx3KU3Lbd12fcKhapj/Osd5/hvDpS/8+q9/2QmpdMt24uPhf25ePVc
	1NPrNfu/OH6+9rLKfw2/2Z8ur+svg26Z/JXLnizs6hFfznB3XeSrSWrFq/vygs+wmM9caMz5
	58I+g6ltE7InzdFmqG5y94vPf1FyUirtsZSfben3jYEX479saW8PVhXWSflgtmNbSW+Vyarv
	xW1PepK+SfUy2myuu3LzhpLAuwYlXwnrbP87K3645x945GHy7YNe16vpO8TsN4kd5C06v4sn
	1fbXr+QSScarl3lULybknlZiK85INDI102IuKk4EAAKoD90LAwAA
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-4.ics.forth.gr [139.91.1.7]); Wed, 16 Jul 2025 21:16:23 +0300 (EEST) for IP:'139.91.1.77' DOMAIN:'av3in.ics.forth.gr' HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mailgate-4.ics.forth.gr [139.91.1.7]); Wed, 16 Jul 2025 21:16:23 +0300 (EEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_111638_965347_F6BA2D1B 
X-CRM114-Status: GOOD (  26.95  )
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

On 7/16/25 14:47, Alexandre Ghiti wrote:
> 
> 
> I'm still not in favor with this solution, that does not sound right.
> 
> I think we should not exclude the "Reserved" regions which lie inside 
> "System RAM" region. The problem is that we mark "nomap" regions as 
> "Reserved" too, I would say this is where we are wrong: "nomap" regions 
> don't even have direct mapping, so they should be presented as a hole 
> rather than "Reserved". And that would allow us to not exclude the 
> "Reserved" regions.
> 
> @Simon, @Pnina WDYT?
> 
> Thanks,
> 
> Alex
> 
> 
NOMAP means the region is reserved:

https://elixir.bootlin.com/linux/v6.16-rc6/source/include/linux/memblock.h#L36

* @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
* reserved in the memory map; refer to memblock_mark_nomap() description
* for further details

https://elixir.bootlin.com/linux/v6.16-rc6/source/mm/memblock.c#L1060

* The memory regions marked with %MEMBLOCK_NOMAP will not be added to the
* direct mapping of the physical memory. These regions will still be
* covered by the memory map. The struct page representing NOMAP memory
* frames in the memory map will be PageReserved()
*
* Note: if the memory being marked %MEMBLOCK_NOMAP was allocated from
* memblock, the caller must inform kmemleak to ignore that memory

This is also what ARM64 does btw:

https://elixir.bootlin.com/linux/v6.16-rc6/source/arch/arm64/kernel/setup.c#L230


Sorry I didn't review this earlier...

* In the original kexec-tools port I added a function 
dtb_get_memory_ranges that parsed the device tree (either through 
/sys/firmware/fdt, or a user-provided one) for memory regions, including 
reserved memory regions added there e.g. by OpenSBI. This works better 
than using /proc/iomem, since /proc/iomem captures the memory layout of 
the running system, not the system we are going to boot to, and also 
/proc/iomem is not a standardized interface, which was yet another 
reason I wanted to avoid using it. I can further argue why that approach 
is better but it's a bit off topic here, and since we now have EFI in 
play it needed review anyway (when I wrote that we didn't have ACPI/EFI 
support, things were nice and clean). The thing is I'd prefer if there 
was still an option to use it, the function was upstreamed but it's not 
called anymore, please fix that, not everyone uses ACPI/EFI or cares 
about it (actually almost all RISC-V systems I've seen in production use 
a device tree). In our use cases where we e.g. swap accelerators on 
FPGAs this approach is much simpler to follow and implement, than having 
to re-generate ACPI tables for our target system everytime (that will 
have a new accelerator in place with its own reserved regions etc, that 
we don't want to overlap with e.g. initrd or the kernel image). Also 
keep in mind that kexec is not there just for kdump, it's a very useful 
feature for other use cases as well.


* For creating the elfcorehdr for kdump (that ends up being used for 
/proc/vmcore in the crashkernel), we obviously need runtime information 
from the running kernel (the one we want to analyze if it crashes), so 
the device tree couldn't obviously provide that, the standardized 
interface was supposed to be /proc/kcore, but that's also a security 
mess and is considered obsolete as far as I know (back when I was 
working on that I remember it was considered for removal). Which is why 
I used /proc/iomem and /proc/kallsyms in load_elfcorehdr like other 
archs do on kexec-tools, to determine the address of specific symbols to 
populate struct crash_elf_info, and also exclude the range of the 
crashkernel allocated at runtime (which I also exported via 
/proc/iomem). I still used the memory regions from the device tree 
(info->memory_ranges populated via dtb_get_memory_ranges) which meant 
that everything was there.


* When the code changed to rely only on /proc/iomem, although 
get_memory_ranges was changed, load_elfcorehdr and the regions exported 
via /proc/iomem remained the same. In the device tree scenario this 
still worked, since init_resources exposed basically the same regions as 
in the device tree. It should also work for the EFI scenario, by the 
time we reach init_resources we've already called efi_init -> 
reserve_regions, so we'll add both reserved and nomap regions there. For 
the soft-reserved regions we didn't add in efi_init, we add them later 
on in riscv_enable_runtime_services as "Soft Reserved" resources. I 
don't see why we need to add an arch initcall to run after that on 
resources we already added (on init_resources btw, ignoring those added 
by riscv_enable_runtime_services). Why do we need to do that ? Note that 
init_resources does two passes unlike arm64's approach, so it should 
handle overlapping regions properly.

Am I missing something ?

Regards,
Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
