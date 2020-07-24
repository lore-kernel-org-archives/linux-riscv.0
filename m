Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7774FC433F1
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:55:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB052070B
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rf5jdjus"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BB052070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q0sRWGf5CNajbIKbJkwSrMBYVnrfWGYZSKtIsYJwfOI=; b=Rf5jdjusAIgxaeztn5Itk7IyBH
	wTMAgASYC/n81iY89GbmG4RG6zwOvXcDQIoritoGLkRKs1itI5D+2jmJ6Qz6kZkCnBwuxlns3wqFG
	OwJDDdUgNHxS2kuIuYbGgMw88h+HXFxKONp9KlWzL8iZXzbAFdIIe9tijF0mPnRTUts7dlZ6esSTn
	wktwX/JEfDgHB39VyGLuRCY19g42y+MLohSkgC5x0dcvk4X02UMgN9zObQs1uRXp78paxJaNhQV6j
	93kZm5/pqxC6MC2J41LzW/wDwUzHYsx3uA1G415cMKYtupxUGyyWsqy1wAL/aZcGqm5Hnvc3W2wQ/
	AVeidOhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jytUa-0003r8-Os; Fri, 24 Jul 2020 08:55:48 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jytUV-0003mA-1P; Fri, 24 Jul 2020 08:55:46 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D3DA38FE8846B0F92B8C;
 Fri, 24 Jul 2020 16:55:33 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 24 Jul 2020
 16:55:27 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <pbonzini@redhat.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>
Subject: [RFC 0/2] Add risc-v vhost-net support
Date: Fri, 24 Jul 2020 16:54:39 +0800
Message-ID: <20200724085441.1514-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_045543_388431_95319FDF 
X-CRM114-Status: UNSURE (   5.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: victor.zhangxiaofeng@huawei.com, zhang.zhanghailiang@huawei.com,
 kvm@vger.kernel.org, anup.patel@wdc.com, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, Yifei Jiang <jiangyifei@huawei.com>,
 kvm-riscv@lists.infradead.org, limingwang@huawei.com,
 linux-riscv@lists.infradead.org, wu.wubin@huawei.com, dengkai1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

These two patches enable support for vhost-net on RISC-V architecture. They are developed
based on the Linux source in this repo: https://github.com/avpatel/linux,
the branch is riscv_kvm_v13. 

The accompanying QEMU is from the repo: https://github.com/alistair23/qemu, the branch is
hyp-ext-v0.6.next. In order for the QEMU to work with KVM, the patch found here is necessary:
https://patchwork.kernel.org/cover/11435965/

Several steps to use this:

1. create virbr0 on riscv64 emulation
$ brctl addbr virbr0
$ brctl stp virbr0 on
$ ifconfig virbr0 up
$ ifconfig virbr0 <virbr0_ip> netmask <virbr0_netmask>

2. boot riscv64 guestOS on riscv64 emulation
$ ./qemu-system-riscv64 -M virt,accel=kvm -m 1024M -cpu host -nographic \
	-name guest=riscv-guest \
	-smp 2 \
	-kernel ./Image \
	-drive file=./guest.img,format=raw,id=hd0 \
	-device virtio-blk,drive=hd0 \
	-netdev type=tap,vhost=on,script=./ifup.sh,downscript=./ifdown.sh,id=net0 \
	-append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

$ cat ifup.sh
#!/bin/sh
brctl addif virbr0 $1
ifconfig $1 up

$ cat ifdown.sh
#!/bin/sh
ifconfig $1 down
brctl delif virbr0 $1

This brenchmark is vhost-net compare with virtio:

$ ./netperf -H <virbr0_ip> -l 100 -t TCP_STREAM

vhost-net:
Recv   Send    Send                          
Socket Socket  Message  Elapsed              
Size   Size    Size     Time     Throughput  
bytes  bytes   bytes    secs.    10^6bits/sec  

131072  16384  16384    100.07    457.55

virtio:
Recv   Send    Send                          
Socket Socket  Message  Elapsed              
Size   Size    Size     Time     Throughput  
bytes  bytes   bytes    secs.    10^6bits/sec  

131072  16384  16384    100.07    227.02


The next step is to support irqfd on RISC-V architecture.

Yifei Jiang (2):
  RISC-V: KVM: enable ioeventfd capability and compile for risc-v
  RISC-V: KVM: read\write kernel mmio device support

 arch/riscv/kvm/Kconfig     |  2 ++
 arch/riscv/kvm/Makefile    |  2 +-
 arch/riscv/kvm/vcpu_exit.c | 38 ++++++++++++++++++++++++++++++++------
 arch/riscv/kvm/vm.c        |  1 +
 4 files changed, 36 insertions(+), 7 deletions(-)

-- 
2.19.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
