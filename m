Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC9CCDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 00:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRK+hBaaqtfQAfDQhTfNSXqkDLoijbg8FjJzXn6rlIg=; b=TQm+RQAhPr8huk
	37CO0i4QorSgYNA98fqB5XLNs0BG9EIm+Qbok7hV3PsqM274530YGn0DOQ2jtPgze3U54osY2b2zF
	f6j5lYObIr0siGMZQKaOsrYL3hS4N/TVGlbUck+kC5XFe4QIY+vWN7tgCJcMcB+ordImFei59LYE/
	duEeuUArZhv/tKIk7hOr93H3ikxDOUjUQzGEBVUe5FSQ6bW7aYvmSp5eNsJDPaapKVAj8/utYZohl
	9z9ntTHwopy2TfEuynwWVhiF8JS5j26a3wjRr0M2qJ1CfksgRdeXdJLvDacAhI3iG37jLgr8aCllU
	2+7wcsL0IKALoiRB0QkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr67Y-002BVi-2x;
	Fri, 13 Oct 2023 00:33:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr67V-002BTx-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 00:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697157210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16ake0/JJsC/X6fPrpFm7y1Me9MIldtPbCM7XyBYJoE=;
	b=Bn06tV+PShpy1Vh8bqdN9fsFltxSE5aEMowLMmtpZNmkmXXQ0ChI3/kmx+NjwXs6j7rbj0
	hPW0rlSkDQjyILyGizj+iID9TmlwrJvnjGBjibWAJcoHNiKfaeD1LouZRVZi3OeosnHAf9
	BFVru4HfZf2qFeTL/arJ7zqgWvsfrro=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-jsGili0QN4uVFKgnC2WNsg-1; Thu, 12 Oct 2023 20:33:13 -0400
X-MC-Unique: jsGili0QN4uVFKgnC2WNsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB823C0C10D;
	Fri, 13 Oct 2023 00:33:12 +0000 (UTC)
Received: from localhost (unknown [10.72.112.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1F712157F5A;
	Fri, 13 Oct 2023 00:33:11 +0000 (UTC)
Date: Fri, 13 Oct 2023 08:33:08 +0800
From: Baoquan He <bhe@redhat.com>
To: palmer@rivosinc.com, Chen Jiahao <chenjiahao16@huawei.com>,
	patchwork-bot+linux-riscv@kernel.org
Cc: robh@kernel.org, aou@eecs.berkeley.edu, zephray@outlook.com,
	alexghiti@rivosinc.com, thunder.leizhen@huawei.com,
	bjorn@rivosinc.com, linux-kernel@vger.kernel.org,
	conor.dooley@microchip.com, palmer@dabbelt.com, jszhang@kernel.org,
	paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
	akpm@linux-foundation.org, ajones@ventanamicro.com
Subject: Re: [PATCH -next v2] riscv: kdump: fix crashkernel reserving problem
 on RISC-V
Message-ID: <ZSiQRDGLZk7lpakE@MiWiFi-R3L-srv>
References: <20230925024333.730964-1-chenjiahao16@huawei.com>
 <169714322507.23371.6628705957236576989.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <169714322507.23371.6628705957236576989.git-patchwork-notify@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_173337_616902_27BFA19D 
X-CRM114-Status: GOOD (  18.44  )
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

Hi,

On 10/12/23 at 08:40pm, patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
> 
> This patch was applied to riscv/linux.git (fixes)
> by Palmer Dabbelt <palmer@rivosinc.com>:

This patches fixes a regression of one risc-v patch which Andrew picked
into his akpm tree. Later, Andrew merged those two into one patch, now
it shows up in next/master as:

39365395046f riscv: kdump: use generic interface to simplify crashkernel reservation

Maybe it can be droppped in risv-v git tree so as not to cause conflict
when merging.

Thanks
Baoquan

> 
> On Mon, 25 Sep 2023 10:43:33 +0800 you wrote:
> > When testing on risc-v QEMU environment with "crashkernel="
> > parameter enabled, a problem occurred with the following
> > message:
> > 
> > [    0.000000] crashkernel low memory reserved: 0xf8000000 - 0x100000000 (128 MB)
> > [    0.000000] crashkernel reserved: 0x0000000177e00000 - 0x0000000277e00000 (4096 MB)
> > [    0.000000] ------------[ cut here ]------------
> > [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/resource.c:779 __insert_resource+0x8e/0xd0
> > [    0.000000] Modules linked in:
> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc2-next-20230920 #1
> > [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> > [    0.000000] epc : __insert_resource+0x8e/0xd0
> > [    0.000000]  ra : insert_resource+0x28/0x4e
> > [    0.000000] epc : ffffffff80017344 ra : ffffffff8001742e sp : ffffffff81203db0
> > [    0.000000]  gp : ffffffff812ece98 tp : ffffffff8120dac0 t0 : ff600001f7ff2b00
> > [    0.000000]  t1 : 0000000000000000 t2 : 3428203030303030 s0 : ffffffff81203dc0
> > [    0.000000]  s1 : ffffffff81211e18 a0 : ffffffff81211e18 a1 : ffffffff81289380
> > [    0.000000]  a2 : 0000000277dfffff a3 : 0000000177e00000 a4 : 0000000177e00000
> > [    0.000000]  a5 : ffffffff81289380 a6 : 0000000277dfffff a7 : 0000000000000078
> > [    0.000000]  s2 : ffffffff81289380 s3 : ffffffff80a0bac8 s4 : ff600001f7ff2880
> > [    0.000000]  s5 : 0000000000000280 s6 : 8000000a00006800 s7 : 000000000000007f
> > [    0.000000]  s8 : 0000000080017038 s9 : 0000000080038ea0 s10: 0000000000000000
> > [    0.000000]  s11: 0000000000000000 t3 : ffffffff80a0bc00 t4 : ffffffff80a0bc00
> > [    0.000000]  t5 : ffffffff80a0bbd0 t6 : ffffffff80a0bc00
> > [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> > [    0.000000] [<ffffffff80017344>] __insert_resource+0x8e/0xd0
> > [    0.000000] ---[ end trace 0000000000000000 ]---
> > [    0.000000] Failed to add a Crash kernel resource at 177e00000
> > 
> > [...]
> 
> Here is the summary with links:
>   - [-next,v2] riscv: kdump: fix crashkernel reserving problem on RISC-V
>     https://git.kernel.org/riscv/c/1d6cd2146c2b


> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
