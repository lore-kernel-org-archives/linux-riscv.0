Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02F1C2BBCA
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 08:02:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420E323356
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 08:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 420E323356
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3FQTGOXfMC2hI/zqRdPTEHIBznzUnGCqkfqXfASWmP8=; b=Y6NlJNn4LQMxQ4m5JUHpmRkSB
	BeB9l5Dk+LZ4m+vnbSTW3BlkmpDT/XoNXPhg4aERQ82Lse82pMp4zGNiY/19dR6a651cl73CrqPkg
	ilxzPji1fDfdR/VppDtzV3jmmi/SF/0pz/prdeBx0oeM2LdqE6P3ZCaXqtYex+anKNBt0hbMj1hza
	2ex9xap6jXw5lW8ih8zeh7SMCCzHdtqtTlwUFRL7De+2+L4XDnZxVtzlhq0OnzcFFArsfGrIGA3Ow
	tbmrf1ZfvdLgcGVMdbOBK7Blrlg1cEOd9U3EFjUrCiPjmRgb4o3YDQzzllS+nmr3YX7Du7kbmELJJ
	lrQgYRvSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpRky-0002AO-NG; Wed, 16 Dec 2020 08:01:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpRku-00026J-99; Wed, 16 Dec 2020 08:01:54 +0000
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CwncL4gcpzVpnY;
 Wed, 16 Dec 2020 16:00:34 +0800 (CST)
Received: from dggemm751-chm.china.huawei.com (10.1.198.57) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 16 Dec 2020 16:01:37 +0800
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemm751-chm.china.huawei.com (10.1.198.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 16 Dec 2020 16:01:37 +0800
Received: from dggpemm000001.china.huawei.com ([7.185.36.245]) by
 dggpemm000001.china.huawei.com ([7.185.36.245]) with mapi id 15.01.1913.007;
 Wed, 16 Dec 2020 16:01:37 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Anup Patel <anup@brainfault.org>
Subject: RE: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
Thread-Topic: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
Thread-Index: AQHWyW7J7KJ3/h39l0SdrqVdkwzNb6n403kAgACcZuA=
Date: Wed, 16 Dec 2020 08:01:37 +0000
Message-ID: <70bdbe9c25214e9483950a0a0efb4305@huawei.com>
References: <20201203121839.308-1-jiangyifei@huawei.com>
 <CAAhSdy2zdwfOGFUtakhbeDUJBapz6fWPnQptT7nCdyFMSoLyGg@mail.gmail.com>
In-Reply-To: <CAAhSdy2zdwfOGFUtakhbeDUJBapz6fWPnQptT7nCdyFMSoLyGg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.236]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_030152_872703_DD26D260 
X-CRM114-Status: GOOD (  20.87  )
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
Cc: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 KVM General <kvm@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, yinyipeng <yinyipeng1@huawei.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Wubin \(H\)" <wu.wubin@huawei.com>, "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


> -----Original Message-----
> From: Anup Patel [mailto:anup@brainfault.org]
> Sent: Wednesday, December 16, 2020 2:40 PM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: Anup Patel <anup.patel@wdc.com>; Atish Patra <atish.patra@wdc.com>;
> Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Paolo Bonzini
> <pbonzini@redhat.com>; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
> KVM General <kvm@vger.kernel.org>; yinyipeng <yinyipeng1@huawei.com>;
> Zhangxiaofeng (F) <victor.zhangxiaofeng@huawei.com>;
> linux-kernel@vger.kernel.org List <linux-kernel@vger.kernel.org>;
> kvm-riscv@lists.infradead.org; linux-riscv <linux-riscv@lists.infradead.org>;
> Wubin (H) <wu.wubin@huawei.com>; dengkai (A) <dengkai1@huawei.com>
> Subject: Re: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
> 
> On Thu, Dec 3, 2020 at 5:51 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > This series implements guest time scaling based on RDTIME instruction
> > emulation so that we can allow migrating Guest/VM across Hosts with
> > different time frequency.
> >
> > Why not through para-virt. From arm's experience[1], para-virt
> > implementation doesn't really solve the problem for the following two main
> reasons:
> > - RDTIME not only be used in linux, but also in firmware and userspace.
> > - It is difficult to be compatible with nested virtualization.
> 
> I think this approach is rather incomplete. Also, I don't see how para-virt time
> scaling will be difficult for nested virtualization.
> 
> If trap-n-emulate TIME CSR for Guest Linux then it will have significant
> performance impact of systems where TIME CSR is implemented in HW.
> 
> Best approach will be to have VDSO-style para-virt time-scale SBI calls (similar
> to what KVM x86 does). If the Guest software (Linux/Bootloader) does not
> enable para-virt time-scaling then we trap-n-emulate TIME CSR (this series).
> 
> Please propose VDSO-style para-virt time-scale SBI call and expand this this
> series to provide both:
> 1. VDSO-style para-virt time-scaling
> 2. Trap-n-emulation of TIME CSR when #1 is disabled
> 
> Regards,
> Anup
> 

OK, it sounds good. We will look into the para-virt time-scaling for more details.

Yifei

> >
> > [1] https://lore.kernel.org/patchwork/cover/1288153/
> >
> > Yifei Jiang (3):
> >   RISC-V: KVM: Change the method of calculating cycles to nanoseconds
> >   RISC-V: KVM: Support dynamic time frequency from userspace
> >   RISC-V: KVM: Implement guest time scaling
> >
> >  arch/riscv/include/asm/csr.h            |  3 ++
> >  arch/riscv/include/asm/kvm_vcpu_timer.h | 13 +++++--
> >  arch/riscv/kvm/vcpu_exit.c              | 35 +++++++++++++++++
> >  arch/riscv/kvm/vcpu_timer.c             | 51
> ++++++++++++++++++++++---
> >  4 files changed, 93 insertions(+), 9 deletions(-)
> >
> > --
> > 2.19.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
