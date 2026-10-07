Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C765CA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QYbFDYREowQ/IA53fKVJ47dpHz/n8JmccAqn1BueIM=; b=Sbx9YlY0S1oh58
	DMD0f3Dos5ShKQpMlQaSbXWZFzd7IXmNkvV9nFzD04taXGjc9tKeFVE0ct+Jp+XfqQfK557se0G/j
	2RcqTJSInEux6OrjXLRD9G/Wru/LPsp5J6JtCRNv7u53MpkYZ4sED+B68FwNVTA8ycgkU21sMdYl0
	u0ABF03/DgJsaQUSwx9lE3sMFfF68ExtnRr0S9we+JXsIXRGG7P0K22rvJ+kyovBxYJRtzm5bRk7D
	OH1gpu/xL0Rx0tBZjMeCEKwbriDV9a5C1Dip16t73dnzGz1bLXfXuVrWrf8otz3NV5ZLvCuo5PAsv
	I42y6KgbzV46n9Xgr0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETIm-00000002gdk-1dlj;
	Wed, 07 Oct 2026 15:11:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETIk-00000002gde-1jt1
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 15:11:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C97DF4160B;
	Wed,  7 Oct 2026 15:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28B51F000FF;
	Wed,  7 Oct 2026 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791385885;
	bh=JddtNEM6goEHGBJSj2WoyIxr3Xm40ZzTJFU/GODnDUg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=jKV3S2ngpMBgIicHLl5IIJQn7FDOFWATwz7suVFR80ZWriS1jjgad+CyKocwqAxm/
	 /a9j+0WttA4AG4v7k8taVcsm1nXgN2TRvxWskm+aScG6D5BmgZn+qKSWfJSr8vQdmd
	 1n47CHttreGS9qwySjCKYwgaJ5W3dRPGp7wBjJnj8VlL6MS6wPFVvSlWEPHtvP4Zk/
	 Ca3WKxiwVBV/2/vsslBFu4Duxn9l7qZ9XRJOkb2/UNwKGBZLeo4wpagGrs6DN5Pem+
	 skfxkEN1Muz5s39d2fY/rgWR/6ZGKo9KQCWIq7VyZ0wUg4QedmX5EUg5fOTO5YZ+wW
	 kjhGXKHsxUpiw==
Date: Wed, 7 Oct 2026 09:11:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Leo Yu-Chi Liang <leo.liang@sifive.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, wangruikang@iscas.ac.cn, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: fix NR_CPUS range leaking 64-bit default onto
 32-bit builds
In-Reply-To: <20261007045229.36114-1-leo.liang@sifive.com>
Message-ID: <3e8a895f-f5d3-bad6-0a34-d1d716ef3a26@kernel.org>
References: <20261007045229.36114-1-leo.liang@sifive.com>
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

On Tue, 6 Oct 2026, Leo Yu-Chi Liang wrote:

> rv32_defconfig is built in two stages:
> 
> - the generic (64-bit-oriented) "defconfig" target runs first
>   and resolves a concrete NR_CPUS value using the 64BIT default.
> - then 32-bit.config is merged on top via merge_config.sh,
>   which does not touch NR_CPUS.
> 
> The final "make olddefconfig" pass sees NR_CPUS=256 is still within
> the "2 512" range therefore never recalculates it against the 32BIT
> default of 32, silently keeping the leaked 64-bit-stage value.
> 
> The NR_CPUS-scaled regions (percpu areas, ...etc) of the resulting
> CONFIG_NR_CPUS=256 on a 32-bit build bloats and does not fit in the
> percpu/stack layout for rv32 and hangs early boot on QEMU's virt machine.
> 
> Fix this by explicitly specify the range for 32/64 and SBI_V01/!SBI_V01.
> 
> Fixes: 0fa749771993 ("riscv: Raise default NR_CPUS for 64BIT to 256")
> Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
