Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A033CA5FC4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 03:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSUORcFFWZ0fVbMs/IlbjeilJRT5ehg7L5OPv/Uv8W4=; b=daiCPTGpfleCGJ
	wchBGw31AyWuQW1kAzoVvp8D+5AyTbSC1bHgImruH95MRka5C9mhZnpJBA/5hlzQr+VMhd6qC6Btc
	nMdFdJkw7BsN0OUf2rPXvV8V2RqzDELGzpk/8Aa2WJ1DVnDj0f2zFAk9RJH4h9yhL/K4mPbpOLJuh
	1LabY3ylU73FWk6GMoKnbkc2oPVrZTil+Y8zSC0HMuuoD1ofgr1OFfPrneImG8CQ7FhTeXSnUGPu6
	+jkwdZVxwXwVv3zbfUqr4ZID1/ySDgV+B8m7mdoGVlTA+B+xPyivOgitIRdL9buQTCqI7QVAflcYp
	PMXlRnqrnct0/an1Stig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC73v-00000007dWQ-3ffs;
	Thu, 01 Oct 2026 03:02:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC73t-00000007dWC-3mIs;
	Thu, 01 Oct 2026 03:02:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ACA640416;
	Thu,  1 Oct 2026 03:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1291F000FF;
	Thu,  1 Oct 2026 03:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790823741;
	bh=ESWOgs8pthL4jmbP6/5JXBqu6W3vx75aJI4JxJVxXSs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=R6AEfScXRENdXKHujYsvSw3LlfeLTXBYuicWRQquboXNP+FZy7yZuMNEkbGSkqX66
	 mI8wLVbX04wVCmIcG+mvgiVrvk5VSG7VIG4tVnkX7tfnCEt5kPEw4H8mvn6hFO64l0
	 bAqB/oLjNMhYXHGrkMy3ddePs1ynWeccpeHtOTavExBBiDSlmiUYZILjWV/o2C4BRf
	 XPoVhTelNYsSJh5/lluiUXssDVK9UEL8DzInBsHwiobgQVauUwGiGZJ4KQIoIzFYq0
	 uDlPfPOVNIKzG8cJEOxmtnRQ51tpyY+Jz86BWzKeydMvWPDS+EohKcYOKxJfGHq3go
	 a5D9SPkUpLCSg==
Date: Wed, 30 Sep 2026 21:02:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
    kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] RISC-V: Clear HSTATUS.HU on CPU initialization
In-Reply-To: <20260924-hstatus_hu-v2-1-7e970f5f1d8d@sifive.com>
Message-ID: <9e3dd333-2747-45dd-6880-2b83a3778f66@kernel.org>
References: <20260924-hstatus_hu-v2-1-7e970f5f1d8d@sifive.com>
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

On Thu, 24 Sep 2026, Yong-Xuan Wang wrote:

> The RISC-V privileged specification does not mandate HSTATUS reset
> values, leaving the HU bit potentially set after hardware reset.
> When HU=1, hypervisor instructions (HLV/HLVX/HSV) can execute in
> U-mode to access guest memory, which may cause unintended behavior
> if not explicitly controlled.
> 
> Clear HSTATUS.HU during CPU initialization to ensure hypervisor
> instructions are only available in HS-mode, preventing unexpected
> guest memory access from U-mode code.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
