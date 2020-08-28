Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38698C433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 04:57:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E6420848
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 04:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1R2Frz5C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="gpMTcbpl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E6420848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u2QPwC+cIb3sA+LAE1qCNCcOeUHF57PIlBq7AxKkq9Q=; b=1R2Frz5C+Sw+FDi7TGadat/Sv
	vSSJKuPR/20Q55r1mxZmiLEZ7WaaID529qPygA7dJlmhCiJaCWmoheEq1fOxpwChdV/pbmt97NbOf
	4D36w0hb0gRHrWUsKq3Z7k4mgvG00mB/IYozupQ/A9RdgqKyT9jTMzFZS/fQXStVFAKeQDtwpoTrb
	6iVOl6ZFscIy5KEKIN7XIpIgaQ9IsXV1DEPxDtcw3hSHzfy7DznpCGHPtzlToSdGudUzoAUjEX7GD
	XEGmBWZqWxhUDkH5IPx7YIZiJZprFRQhSGSa/Xzo5/iwKVkG4adRDBb4TLqlOTrx4O1b0cbWIiCdu
	NETl5y2YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBWS2-0001fI-NH; Fri, 28 Aug 2020 04:57:22 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBWRz-0001eF-EO
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 04:57:20 +0000
Received: by mail-pl1-x643.google.com with SMTP id v16so1356756plo.1
 for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2020 21:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3EeBnzl55KhlznFGrhdw4wiCgK95KqATQ83rC/nkZT0=;
 b=gpMTcbpl4/LN0p/Roic31wTiMY2eUFarLAXop4+im+qllDOfxyjQyOgske9U78MIsz
 7b5/Z9Plh7i+IUCnuJs3xxHlcQ5Mqmkq3odbq4FQfOGUkYxgzO+G6y48tw4mvJ349sNr
 W1EATwnMZoXRC94aHfKUHgdFR+18slX19mje7G+6R4yAatxZU4/P4GliSt1ZDO0Vuv0q
 t4STmH5dVvVnJE8cmQIQWZYAYKIfvr62Ihc9poxPhPOWcTv2CqIB6kvuDZLU0fDUG2PO
 2noPdsy2ydKpMra9XUm0/A65slQOjYRltyLJCq/uwtJEuf/z+WrpVYDINuTrI+qnNMx0
 EIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EeBnzl55KhlznFGrhdw4wiCgK95KqATQ83rC/nkZT0=;
 b=cA3R6Z9xb/tIfWgTZ3NX8YBswKMP4FBXdnRMt2HrEIRxQTWyBU7tvsqHv5IjkEbn8H
 soSwu4vDWo1v10sEFdpm0krT61mXKkI7k/NLZspdi+rhQ9mXW4lQNvf/LOhHYRPhoFVU
 QI7o5XmtDAFHc2zhj/EL4jW6+qiXiV0TZzXi63A0fkghXz5dy213JWVXXczcAUvCoU48
 AWO8qG+O2h8pq9Qtd0WQyKABOZqCtd+GeyMfGjz+vlaSvitbqxTbz0HUit2Cy+/VNDok
 PstKJClHyAhan/wZbFV6gelgtGHxeCh5Z42J2Cc6VI4+eNv+pulp+A4INwtqyLVIxEp7
 Rwig==
X-Gm-Message-State: AOAM531b7ctnElr6qYpOdXuacacirdFnqDzvMbHs31Mkw0qA8VLY0ypj
 hd945xOfdNmU2pLbIwJ8GOLunZzwqX9lRHxT0s1nqg==
X-Google-Smtp-Source: ABdhPJxLo7vrQLUhTi7CAJ1QiiyZWein+ivOd8qafBnWQxI56Vc3pCvlOZ2oTlRXck0fsNFr8fIGigFt8sJIz/vk4+Y=
X-Received: by 2002:a17:90a:fc98:: with SMTP id
 ci24mr84381pjb.101.1598590637116; 
 Thu, 27 Aug 2020 21:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200724085441.1514-1-jiangyifei@huawei.com>
In-Reply-To: <20200724085441.1514-1-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Aug 2020 10:27:04 +0530
Message-ID: <CAAhSdy2qtr4EpYjFM=REigrC7DK_Fo26P-SGhVC6n21FewtFvw@mail.gmail.com>
Subject: Re: [RFC 0/2] Add risc-v vhost-net support
To: Yifei Jiang <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_005719_550950_AD01C15F 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 KVM General <kvm@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 limingwang@huawei.com, Atish Patra <atish.patra@wdc.com>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, wu.wubin@huawei.com,
 "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 2:25 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Hi,
>
> These two patches enable support for vhost-net on RISC-V architecture. They are developed
> based on the Linux source in this repo: https://github.com/avpatel/linux,
> the branch is riscv_kvm_v13.
>
> The accompanying QEMU is from the repo: https://github.com/alistair23/qemu, the branch is
> hyp-ext-v0.6.next. In order for the QEMU to work with KVM, the patch found here is necessary:
> https://patchwork.kernel.org/cover/11435965/
>
> Several steps to use this:
>
> 1. create virbr0 on riscv64 emulation
> $ brctl addbr virbr0
> $ brctl stp virbr0 on
> $ ifconfig virbr0 up
> $ ifconfig virbr0 <virbr0_ip> netmask <virbr0_netmask>
>
> 2. boot riscv64 guestOS on riscv64 emulation
> $ ./qemu-system-riscv64 -M virt,accel=kvm -m 1024M -cpu host -nographic \
>         -name guest=riscv-guest \
>         -smp 2 \
>         -kernel ./Image \
>         -drive file=./guest.img,format=raw,id=hd0 \
>         -device virtio-blk,drive=hd0 \
>         -netdev type=tap,vhost=on,script=./ifup.sh,downscript=./ifdown.sh,id=net0 \
>         -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"
>
> $ cat ifup.sh
> #!/bin/sh
> brctl addif virbr0 $1
> ifconfig $1 up
>
> $ cat ifdown.sh
> #!/bin/sh
> ifconfig $1 down
> brctl delif virbr0 $1
>
> This brenchmark is vhost-net compare with virtio:
>
> $ ./netperf -H <virbr0_ip> -l 100 -t TCP_STREAM
>
> vhost-net:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    100.07    457.55
>
> virtio:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    100.07    227.02
>
>
> The next step is to support irqfd on RISC-V architecture.
>
> Yifei Jiang (2):
>   RISC-V: KVM: enable ioeventfd capability and compile for risc-v
>   RISC-V: KVM: read\write kernel mmio device support
>
>  arch/riscv/kvm/Kconfig     |  2 ++
>  arch/riscv/kvm/Makefile    |  2 +-
>  arch/riscv/kvm/vcpu_exit.c | 38 ++++++++++++++++++++++++++++++++------
>  arch/riscv/kvm/vm.c        |  1 +
>  4 files changed, 36 insertions(+), 7 deletions(-)
>
> --
> 2.19.1
>
>

I will be squashing these patches into PATCH7 of v14 KVM RISC-V series.

I will also add your Signed-off-by to PATCH7 of v14 KVM RISC-V to
acknowledge your efforts.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
