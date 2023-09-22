Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF528CD4F49
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxRKGvxtY2G0/eN1kG0yrTNsZwt4MqrkhD31m5G0jg0=; b=aqU60igcbJOJva
	gvXQvOsA1C3GJf393RKjlr8tcA/9oismrKithNV7wOvnXS62lbvweFXEvCX478mI6roNOA7SYGjZd
	Zt3AdiM/tof9b6CO7V1KH6+8KaCMHnOjt+GR+uIl3QuM38XrkNV41PecEENLppFCi4D+PJR++JgKK
	KxlrC3WwZQhhWgaf2HDbiLrU0OfIIT7ZjEYjBF6kg6u/ik4RC+10xcqC0hyZ4BEARFC9PsLpy+x84
	f89+8MyIoUgSKOLmIdNAdOs4rDLPdnzrPEnCBI5pXKCcJBuSA/VKtVoko0ykZDkn6EfuLZfSwHsgF
	EOAvXJC9m4gIKhZEXPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdOs-008rAh-0N;
	Fri, 22 Sep 2023 10:28:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdOq-008rAK-0E
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695378517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ncEFTKmOctQzbh/NrWetlUFTCq9f4mLOYEczx2dd7dw=;
	b=SFv34D24XCbEstLnKRPE5YBVu/Dxo8FRU2lir4KA/YvSlo38sA5zBGvf8n7ylD7LpEJOo2
	FPkgpgxpHyPdesUksSgnKn9ukgGnf6rs3kKAdNb+jbmsQ96CCR1ILCjq2gwgvbDVT0c2UM
	4xUdot+J4y6By5Xvc5ByFPS2RZ2+kTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-8NF42pJKPOaI5Cuo1sMl-Q-1; Fri, 22 Sep 2023 06:28:32 -0400
X-MC-Unique: 8NF42pJKPOaI5Cuo1sMl-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0545F803491;
	Fri, 22 Sep 2023 10:28:32 +0000 (UTC)
Received: from localhost (unknown [10.72.112.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC10371128F;
	Fri, 22 Sep 2023 10:28:30 +0000 (UTC)
Date: Fri, 22 Sep 2023 18:28:27 +0800
From: Baoquan He <bhe@redhat.com>
To: "chenjiahao (C)" <chenjiahao16@huawei.com>
Subject: Re: [PATCH -next] riscv: kdump: fix crashkernel reserving problem on
 RISC-V
Message-ID: <ZQ1sSzUueObu7KZH@MiWiFi-R3L-srv>
References: <20230922030722.708267-1-chenjiahao16@huawei.com>
 <ZQ0/aK6cg8oNloA4@MiWiFi-R3L-srv>
 <c590ac5d-91b9-ec3b-6899-a18c16c9f980@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c590ac5d-91b9-ec3b-6899-a18c16c9f980@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_032840_202490_8C035C7D 
X-CRM114-Status: GOOD (  20.52  )
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
Cc: robh@kernel.org, aou@eecs.berkeley.edu, zephray@outlook.com, alexghiti@rivosinc.com, thunder.leizhen@huawei.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, akpm@linux-foundation.org, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/22/23 at 05:33pm, chenjiahao (C) wrote:
> 
> On 2023/9/22 15:16, Baoquan He wrote:
> > Hi Jiahao,
> > 
> > On 09/22/23 at 11:07am, Chen Jiahao wrote:
> > > When testing on risc-v QEMU environment with "crashkernel="
> > > parameter enabled, a problem occurred with the following
> > > message:
> > > 
> > > [    0.000000] crashkernel low memory reserved: 0xf8000000 - 0x100000000 (128 MB)
> > > [    0.000000] crashkernel reserved: 0x0000000177e00000 - 0x0000000277e00000 (4096 MB)
> > > [    0.000000] ------------[ cut here ]------------
> > > [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/resource.c:779 __insert_resource+0x8e/0xd0
> > > [    0.000000] Modules linked in:
> > > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc2-next-20230920 #1
> > > [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> > > [    0.000000] epc : __insert_resource+0x8e/0xd0
> > > [    0.000000]  ra : insert_resource+0x28/0x4e
> > > [    0.000000] epc : ffffffff80017344 ra : ffffffff8001742e sp : ffffffff81203db0
> > > [    0.000000]  gp : ffffffff812ece98 tp : ffffffff8120dac0 t0 : ff600001f7ff2b00
> > > [    0.000000]  t1 : 0000000000000000 t2 : 3428203030303030 s0 : ffffffff81203dc0
> > > [    0.000000]  s1 : ffffffff81211e18 a0 : ffffffff81211e18 a1 : ffffffff81289380
> > > [    0.000000]  a2 : 0000000277dfffff a3 : 0000000177e00000 a4 : 0000000177e00000
> > > [    0.000000]  a5 : ffffffff81289380 a6 : 0000000277dfffff a7 : 0000000000000078
> > > [    0.000000]  s2 : ffffffff81289380 s3 : ffffffff80a0bac8 s4 : ff600001f7ff2880
> > > [    0.000000]  s5 : 0000000000000280 s6 : 8000000a00006800 s7 : 000000000000007f
> > > [    0.000000]  s8 : 0000000080017038 s9 : 0000000080038ea0 s10: 0000000000000000
> > > [    0.000000]  s11: 0000000000000000 t3 : ffffffff80a0bc00 t4 : ffffffff80a0bc00
> > > [    0.000000]  t5 : ffffffff80a0bbd0 t6 : ffffffff80a0bc00
> > > [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> > > [    0.000000] [<ffffffff80017344>] __insert_resource+0x8e/0xd0
> > > [    0.000000] ---[ end trace 0000000000000000 ]---
> > > [    0.000000] Failed to add a Crash kernel resource at 177e00000
> > > 
> > > The crashkernel memory has been allocated successfully, whereas
> > > it failed to insert into iomem_resource. This is due to the
> > This is a warning, not a failure, right? Inserting crashk_*res into
> > iomem_resource has been successful, just the repeated inserting cause
> > the warning. Maybe, we should tell this in log clearly? Other than minor
> > concern, this looks good to me, thanks for the testing and this fix:
> 
> Thanks for reviewing. Actually this is not only a warning message.
> Since when failure occurs in riscv's init_resources(),
> 
> error:
> 	release_child_resources(&iomem_resource);
> 
> will get called, already added crashkernel memory will hence
> get removed. To verify this, I have checked but cannot find
> crashkernel memory in /proc/iomem when this problem occurs.

I see, I was mistaken then. Thanks for telling.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
