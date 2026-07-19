Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D571DC4450A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3021wp68k8aSvAyc5kMlWKSKYOuN564nHqX/+7unTuU=; b=WOpI3mk70HsdwaFAToKeyujE3n
	pBvfaqcKaTZGpJm1CvYK5gz5rBZAKOpYW9cPYGDI8Lcm9uu2pvYEs75u4mr7Nz8isHCO/XBIU1089
	9WbTDnSQ9qLyZ+tToOqtk9YTbFTh/Y2ZjvdU5wmanEoaBIGpKz3zGkYt9H/+4o50Emyn+5UI2Eg5V
	wzf95/oQrlWJO8Xiaww3sPwPbybYI6wwuWnUpaPcP+FAaTpGvVDZxS18N96vYhkWprJCEjoX82EAN
	QgneSZJuNPluTCFKj/Dw8YHrSuRkvHLpP/g0uwWt3XgxXauAw/cIr3k/8Vz4bJ0YU3wjNW8m+uV1n
	Pdzzd5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlUfT-00000005BOY-4B1a;
	Sun, 19 Jul 2026 16:47:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlUfS-00000005BOQ-2Ojw
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 16:47:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A68A560051;
	Sun, 19 Jul 2026 16:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5C21F000E9;
	Sun, 19 Jul 2026 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784479625;
	bh=5IjSBqSA9D05FdCZSbOOv6I82RhIwY84PUjA5LWUEt4=;
	h=Date:From:To:cc:Subject;
	b=YlFBgeaiCW48Vc83LSQcQAXQpVwDkNdDyxEUpIa5V0ixWok4j45zK5AiLyX13QBtU
	 42iFYIA1YtOcYrRLnpdjg7ETo2OorR6+w7SKDfwTwIJgiid4SlGoh8NSBKlBhn1VQa
	 IZ69PW9ERyjbchK9L2uoYpQ/4QeH4JPqTt5/zdNyfnpljDU9jc44eFAee9lX0y5nig
	 F5Srx9HeAS5GIY3hRMG8S1Aa+GYYUhbvTZwXpzY9jCnojJiuYT1D01CTUwVz5lnb3u
	 /Aihld6tDHXUmQINMg0LlxB0tL3WkG4BaOskvi3UyHeBCO3o5+rkaykcEB2tf902Lr
	 7KS5NFav8vrgQ==
Date: Sun, 19 Jul 2026 10:47:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.2-rc4
Message-ID: <ad692ed9-a217-5d59-3bbf-fdd7649056ba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-621511485-1784479625=:1159082"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-621511485-1784479625=:1159082
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Linus,

Please pull these RISC-V updates for v7.2-rc4.  From a maintenance 
perspective, there's a change in common code to now call 
flush_cache_vmap() after setting up new vmemmap pages on configs using 
CONFIG_SPARSEMEM_VMEMMAP.  This is to avoid spurious faults on 
microarchitectures that support caching PTEs marked non-present, such as 
RISC-V and PowerPC.

Otherwise, not much to note.  In the event you notice a significant kernel 
size reduction on RISC-V (below), it comes from a fix to relax function 
alignment constraints when dynamic ftrace is disabled.


thanks,

- Paul

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc4

for you to fetch changes up to 5caae1deee89a6582c761d5dcd4b924b744426cc:

  riscv: hwprobe: Avoid uninitialized read in hwprobe_get_cpus() (2026-07-15 11:12:40 -0600)

----------------------------------------------------------------
RISC-V updates for v7.2-rc4

- Call flush_cache_vmap() after populating new vmemmap pages, on all
  architectures.  This avoids spurious faults on RISC-V
  microarchitectures that cache PTEs marked as non-present

- Disable LTO for the vDSO to prevent the compiler from eliding
  functions that are used, but which don't appear to be

- Fix an issue with libgcc's unwinder and signal handlers by dropping
  an unnecessary CFI landing pad instruction in __vdso_rt_sigreturn
  (similar to what was done on ARM64)

- Avoid reading uninitialized memory under certain conditions in
  hwprobe_get_cpus()

- Save some memory and I$ when CONFIG_DYNAMIC_FTRACE=n by avoiding
  our four-byte function alignment requirement in that case

- Avoid clang warnings about null-pointer arithmetic in the I/O-port
  accessor macros (inb, outb, etc.) by ifdeffing them out when
  !CONFIG_HAS_IOPORT

- Make the build of the lazy TLB flushing code in the vmalloc path
  depend on CONFIG_64BIT and CONFIG_MMU (since those platforms are the
  only ones that use it)

----------------------------------------------------------------
Aurelien Jarno (1):
      arch/riscv: vdso: remove CFI landing pad from rt_sigreturn

Mark Harris (1):
      riscv: hwprobe: Avoid uninitialized read in hwprobe_get_cpus()

Rui Qi (1):
      riscv: Gate FUNCTION_ALIGNMENT_4B on DYNAMIC_FTRACE

Thomas Weiﬂschuh (1):
      riscv: vdso: Do not use LTO for the vDSO

Vivian Wang (2):
      riscv: mm: Make mark_new_valid_map() stuff depend on 64BIT && MMU
      mm/sparse-vmemmap: flush_cache_vmap() after hotplugging vmemmap

Yunhui Cui (1):
      riscv: io: avoid null-pointer arithmetic in PIO helpers

 arch/riscv/Kconfig                    |  2 +-
 arch/riscv/include/asm/cacheflush.h   |  5 +++--
 arch/riscv/include/asm/io.h           |  8 ++++++++
 arch/riscv/kernel/entry.S             |  2 +-
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 arch/riscv/kernel/vdso/Makefile       |  6 +++---
 arch/riscv/kernel/vdso/rt_sigreturn.S | 10 +++++++++-
 arch/riscv/mm/init.c                  |  2 ++
 mm/sparse-vmemmap.c                   |  2 ++
 9 files changed, 30 insertions(+), 8 deletions(-)

vmlinux size differences in bytes (from a13c140cc289):
  text    data   bss     dec    hex  filename                             
-52032     +96     .  -51936  -cae0  vmlinux.defconfig.gcc-16             
-55224   -4000     .  -59224  -e758  vmlinux.nosmp_defconfig.gcc-16       
-51598     +96   -64  -51566  -c96e  vmlinux.rv32_defconfig.gcc-16        
-49942     +96     .  -49846  -c2b6  vmlinux.rv32_nosmp_defconfig.gcc-16  
  -175     +64     .    -111    -6f  vmlinux.nommu_virt_defconfig.gcc-16  
-47958     +96     .  -47862  -baf6  vmlinux.defconfig.clang-20           
-45794   -4000     .  -49794  -c282  vmlinux.nosmp_defconfig.clang-20     
-48052     +64     .  -47988  -bb74  vmlinux.rv32_defconfig.clang-20      
-46754     +96     .  -46658  -b642  vmlinux.rv32_nosmp_defconfig.clang-20
  -179       .   -64    -243    -f3  vmlinux.nommu_virt_defconfig.clang-20
-51822     +64     .  -51758  -ca2e  vmlinux.defconfig.gcc-15             
-54878     +64     .  -54814  -d61e  vmlinux.nosmp_defconfig.gcc-15       
-51306     +96   -64  -51274  -c84a  vmlinux.rv32_defconfig.gcc-15        
-49928     +64     .  -49864  -c2c8  vmlinux.rv32_nosmp_defconfig.gcc-15  
  -175       .     .    -175    -af  vmlinux.nommu_virt_defconfig.gcc-15  
-51546   -4000     .  -55546  -d8fa  vmlinux.defconfig.gcc-14             
-54146     +64     .  -54082  -d342  vmlinux.nosmp_defconfig.gcc-14       
-50974     +64   -64  -50974  -c71e  vmlinux.rv32_defconfig.gcc-14        
-49990     +96     .  -49894  -c2e6  vmlinux.rv32_nosmp_defconfig.gcc-14  
  -171       .     .    -171    -ab  vmlinux.nommu_virt_defconfig.gcc-14  
-48012    +128     .  -47884  -bb0c  vmlinux.defconfig.clang-19           
-46590     +96     .  -46494  -b59e  vmlinux.nosmp_defconfig.clang-19     
-47570     +64     .  -47506  -b992  vmlinux.rv32_defconfig.clang-19      
-46914     +64     .  -46850  -b702  vmlinux.rv32_nosmp_defconfig.clang-19
  -179     +64     .    -115    -73  vmlinux.nommu_virt_defconfig.clang-19
 +1340     +64     .   +1404   +57c  vmlinux.defconfig.gcc-13             
 +1380     +64     .   +1444   +5a4  vmlinux.nosmp_defconfig.gcc-13       
   +16     +64   -64     +16    +10  vmlinux.rv32_defconfig.gcc-13        
     .     +64     .     +64    +40  vmlinux.rv32_nosmp_defconfig.gcc-13  
  -171     +64   -64    -171    -ab  vmlinux.nommu_virt_defconfig.gcc-13  
-48100   -4000     .  -52100  -cb84  vmlinux.defconfig.clang-18           
-46248     +96     .  -46152  -b448  vmlinux.nosmp_defconfig.clang-18     
-47328     +96     .  -47232  -b880  vmlinux.rv32_defconfig.clang-18      
-46848     +96     .  -46752  -b6a0  vmlinux.rv32_nosmp_defconfig.clang-18
  -179       .     .    -179    -b3  vmlinux.nommu_virt_defconfig.clang-18
 +1272     +64     .   +1336   +538  vmlinux.defconfig.gcc-12             
 +1360     +64     .   +1424   +590  vmlinux.nosmp_defconfig.gcc-12       
    +8     +96   -64     +40    +28  vmlinux.rv32_defconfig.gcc-12        
     .     +96     .     +96    +60  vmlinux.rv32_nosmp_defconfig.gcc-12  
  -171     +64   -64    -171    -ab  vmlinux.nommu_virt_defconfig.gcc-12  
-51446     +96     .  -51350  -c896  vmlinux.defconfig.clang-17           
-46236     +96     .  -46140  -b43c  vmlinux.nosmp_defconfig.clang-17     
-47106     +64     .  -47042  -b7c2  vmlinux.rv32_defconfig.clang-17      
-46356     +96     .  -46260  -b4b4  vmlinux.rv32_nosmp_defconfig.clang-17
  -179     +64     .    -115    -73  vmlinux.nommu_virt_defconfig.clang-17
 +1276     +64     .   +1340   +53c  vmlinux.defconfig.gcc-11             
 +1396     +64     .   +1460   +5b4  vmlinux.nosmp_defconfig.gcc-11       
   +16     +96   -64     +48    +30  vmlinux.rv32_defconfig.gcc-11        
     .     +64     .     +64    +40  vmlinux.rv32_nosmp_defconfig.gcc-11  
  -155       .   -64    -219    -db  vmlinux.nommu_virt_defconfig.gcc-11  
-13158   -4096     .  -17254  -4366  vmlinux.allnoconfig.gcc-15           
+40288   +2908  -128  +43068  +a83c  vmlinux.allmodconfig.gcc-15          
-11930  +12288     .    +358   +166  vmlinux.allnoconfig.clang-19         
 +3980    +856     .   +4836  +12e4  vmlinux.allmodconfig.clang-19        
--8323329-621511485-1784479625=:1159082
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-621511485-1784479625=:1159082--

