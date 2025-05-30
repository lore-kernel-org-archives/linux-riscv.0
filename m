Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492EAC5AD49
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VUKASqRAHwfKGYZCZWiw0ZAfTlVOJ6UIL4NGu3Xayg0=; b=bZgUDPHIdeq9Rb
	85od8A5Hmpqk+MwRzraOEmcfe6K2EsIZIrMMlLCmguwVf7hPb5+KDK5Z/lwGNpmBxDieLn0NY72k8
	PrYZVoPoIrVb5qi80sKsmowjY/qBA823sl/hhPkd0r5YwafmQ78K10kqP6LehOZFRLdIRocfZj/X7
	ASLYa1F0DyfAVA3dV2RYSxcyVjj4dSXsk0Woo03VMRaUs+40fqK6VF2cjnTaQk3tbVNCP0mN24s8L
	hxclSskp0nlFTTgSzMd3AQDE/bJJkUn6arTyX9CiKj/p9kNUYI7cIItXDZv9AoNKxx5Fbp3HK9+VY
	xuA8p+Lq0mS8R0RxLyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL75J-00000001uGu-0pcF;
	Fri, 30 May 2025 21:16:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL75F-00000001uFn-2qyD
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 21:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748639768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4WS+08nhlV2WvmMYpXsg6mUntZyrMxoHBLo5IU6IzGM=;
	b=EDN9cBnmTICioge0Mr9uXf7nhqwe6DrLfdFJHNG/mxGJjXc7poO5JoERR31y62t1zhc7w5
	RPZI8wDkeZpPGeR+HQH+eRNyP0Ze8j3PK9lKsNxSVBO/9VLyrCJvLXKPBf5nimHvqjWVrR
	nQQysDU0BAXK/hEDy7v42IQ26HTztUc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-ZERTgFPFNLKm7W_AXbw61w-1; Fri,
 30 May 2025 17:14:31 -0400
X-MC-Unique: ZERTgFPFNLKm7W_AXbw61w-1
X-Mimecast-MFC-AGG-ID: ZERTgFPFNLKm7W_AXbw61w_1748639670
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F32241800360;
	Fri, 30 May 2025 21:14:29 +0000 (UTC)
Received: from laptop.mht.redhat.com (unknown [10.17.17.210])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1596030001B7;
	Fri, 30 May 2025 21:14:27 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	Charles Mirabile <cmirabil@redhat.com>
Subject: [PATCH v1 0/1] fix riscv runtime constant support
Date: Fri, 30 May 2025 17:14:21 -0400
Message-ID: <20250530211422.784415-1-cmirabil@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_141609_829344_84D6B45C 
X-CRM114-Status: GOOD (  15.21  )
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

I discovered that something broke basic booting on riscv64 for a nommu
kernel with a minimal configuration running on qemu between 6.13 and
current master. The symptom was that the kernel would hang and print
nothing instead of booting normally. I bisected my way to:

commit a44fb5722199 ("riscv: Add runtime constant support")

Analyzing in a debugger, I was able to conclude that the bug was occurring
due to an invalid pointer dereference in `__d_lookup_rcu` trying to access
`dentry_cache`. That variable was at 0x8040f480 but the upper half of the
actual pointer value it was trying to access was filled with garbage.

Looking at the disassembly I saw that in the patched instructions that a
`nop` instruction had replaced both the `lui` and the `addiw` that were
supposed to create the upper half of the pointer so the register was not
initialized. The code responsible for patching does not ensure that at
least one instruction is not replaced with a `nop` if `val` is zero.

To reproduce the bug the following minimal config and initrd can be used:

$ cat ../minimal.config
CONFIG_EXPERT=y
CONFIG_NONPORTABLE=y
CONFIG_KERNEL_UNCOMPRESSED=y
CONFIG_RISCV_M_MODE=y
CONFIG_PRINTK=y
CONFIG_TTY=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_OF_PLATFORM=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_BINFMT_ELF_FDPIC=y
CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_SYSCON=y
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
CONFIG_DEBUG_INFO_DWARF5=y
$ cat ../init.s
.text
.global _start
_start:
	li a0, 1
	la a1, .Lmsg
	lui a2, %hi(.Lmsglen)
	addi a2, a2, %lo(.Lmsglen)
	li a7, 64	  # __NR_write
	ecall
	li a0, 0xfee1dead
	li a1, 0x28121969
	li a2, 0x4321fedc # CMD_HALT
	li a7, 142	  # __NR_reboot
	ecall
	unimp
.data
.Lmsg:
.ascii "Hello!\n"
.Lmsglen = . - .Lmsg
$ mkdir ../rootfs
$ riscv64-linux-gnu-gcc -static -shared \
 -ffreestanding -nostdlib -march=rv64i -mabi=lp64 \
 ../init.s -o ../rootfs/init
$ cd ../rootfs && find . | cpio -co > ../rootfs.cpio && cd - >/dev/null
13 blocks
$ export CROSS_COMPILE=riscv64-linux-gnu- ARCH=riscv
$ make KCONFIG_ALLCONFIG=../minimal.config allnoconfig
$ make -j $(nproc)
...
  Kernel: arch/riscv/boot/Image is ready
$ qemu-system-riscv64 -cpu rv64,mmu=off -machine virt -bios none \
 -nographic -no-reboot -net none \
 -kernel arch/riscv/boot/Image -initrd ../rootfs.cpio
...
Run /init as init process
Hello!
reboot: Power down

On current master, nothing will be printed and the qemu command will just
hang (kill with control+a x), but with this patch it will boot normally.

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>

Charles Mirabile (1):
  riscv: fix runtime constant support for nommu kernels

 arch/riscv/include/asm/runtime-const.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
