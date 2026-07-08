Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDD0C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 23:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTeGg4W+N5RcUBfEhqacZHAOlYWtiS9l+TWUrfbd2g8=; b=Sf5VdRW1v/SMyx
	Kbn7bNp1DfFwQlC4mNcyv3Axo5Q+0OILcQFlPxzJVad2XSMcOovWPkWpZ7Hmr/GeuOf8q3Eio1cfm
	QEeqfa9jh9kQ57dkUk/CwV3xowOKMXF38kn1nf7ERAsU/Z7ZB5OspIdIQ5IVoBDdMSrSI1uEh4+5k
	TE7Eivn1lrrBdzZ1QuWYFDpE+WrU0SYjwmzQViz72fIAYWKV5IQ27LOlAFj4TcCSO+NdRQrv2HvjZ
	r1cPz5+M7lBBPQBBCP9scMpbT5g38zwDNqSJq9ie8h4EbHV+0102jqIyn0fQotDpsZxMRFNU2JyAm
	xEcslgYJAhpo6o4NOV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbKj-00000000ZtK-2ity;
	Wed, 08 Jul 2026 23:05:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbKi-00000000Zt9-0lBr
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 23:05:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CCC1600C3;
	Wed,  8 Jul 2026 23:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548651F000E9;
	Wed,  8 Jul 2026 23:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783551935;
	bh=IQw8Fmyq60Hd93Fj+TzQiJzIQ3vI9pEs45BmOecGf9Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Dya7nyRRTuBslB+p/TsWw7zZcOhWHzgKIIwPb2YT7ucCHpOmXS9+bk+2OgvBT7lYu
	 Q40PAZgcaBLTPbN/9AaAdmpr7XHolSCU/K1WyvJh4JCIQljF1/CATw9mVrut8Vb8N9
	 Jtdv3Tx1NbVypq99qB7ubYoeO13CsHjhayb49AffwHk40tdUDuwcr/0pYJgMPMnQsg
	 Dgu4gsi4uAvjC/oc5iI6eqGtfv3XoZP/mo04kGwm029YGnNehetoFjcoHB1u+AU/wc
	 40IVffo8Gzg23/ygelihPQ2Viq3mE7xc4kSeej34ryNdt3mPmbxM1maY5z7BeSBXjj
	 V+C+BGlci8hMA==
Date: Wed, 8 Jul 2026 17:05:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
cc: mathieu.desnoyers@efficios.com, peterz@infradead.org, shuah@kernel.org, 
    paulmck@kernel.org, boqun@kernel.org, zhouquan@iscas.ac.cn, 
    ajones@ventanamicro.com, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] selftests/rseq: Fix a building error for riscv arch
In-Reply-To: <20260707082348.36896-1-hui.wang@canonical.com>
Message-ID: <073d4140-ac91-1b5d-26a2-f519d6a2792b@kernel.org>
References: <20260707082348.36896-1-hui.wang@canonical.com>
MIME-Version: 1.0
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

On Tue, 7 Jul 2026, Hui Wang wrote:

> RISC-V rseq selftests include asm/fence.h from tools/arch/riscv,
> but the rseq Makefile only adds tools/include in the CFLAGS, this
> results in the building failure both for native and cross build:
> 
>     In file included from rseq.h:131,
>                      from rseq.c:37:
>     rseq-riscv.h:11:10: fatal error: asm/fence.h: No such file or directory
> 
> To fix it, add the matching tools/arch/$(ARCH)/include path in the
> CFLAGS and derive ARCH from SUBARCH for standalone native builds where
> ARCH is not set.
> 
> Fixes: c92786e179e0 ("KVM: riscv: selftests: Use the existing RISCV_FENCE macro in `rseq-riscv.h`")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
