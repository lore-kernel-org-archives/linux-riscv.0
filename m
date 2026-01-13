Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A012CF45D4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 01:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSnvo9iTTMZgbW83i2sv28ivDl7jYcybSyDbkojyjm0=; b=NvSEcXiI+O3GIQ
	Sv2WIMSjRWR8nG5bP/60W2keVQZWji4ppEsZWhpLemO7OTdY4zMkzjJkm2cbQCbp8dFSRTase36El
	gwkrxeGgr25P5YCbBhNQYosqN3ZRLZIWjBuDuZ11mVybF4Z4lybqH9RrWVvYPn8aVqyRIUNuoY6Zd
	en0UchtLNZ3B95pFjeMaMjL5XleFtW8sUmqjMPzz6sHDYim2EaVavOVUImLw0dcVpSsp9ADx3tjmv
	HcsCfiYhIM4z8iP8ht0ezCWtBUNij0cMKwfiZpBC7CYSGi0vfwWJncXQ/0DjmbeT44F8+Wz20KVV/
	vQIJ4yAgcXzs2myOr5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTZa-00000006Ovn-3aWl;
	Tue, 13 Jan 2026 01:51:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTZZ-00000006Ovg-1mu6
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 01:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 602046001D;
	Tue, 13 Jan 2026 01:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168AAC116D0;
	Tue, 13 Jan 2026 01:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768269112;
	bh=jqyuwK6rVatG5SgEyHj8Jgxvss1mk94ml+mkdOlelwI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U0WmTyuSCqAnqH3aFvsMV5z9wqf8M8aCsqMf1cZJMztZ83fyCz4dkS4vedTwKjkBE
	 JOFzYZ94+KvLMSHCzaS0X/+UT0EmbcG6X6kyQcKN1TQ7B5x1x3dZ/lkEYeLUeIhlre
	 qpI5ED79kAwui4V7xdCpcul+EQmlzMEE5PNk+/GxmBVZC7FPBN36kiSgnjtD3pEF2D
	 O/hVXLuc6MM+8LNP1MTJSpS3S5Nv0fyKir9FsrPJF9NdOzMfm5e3x/bq/QCt3sbgTj
	 QFsUbr/I4LyZsew56MA0m7bzsC4HP3wjjKySpVhjoMNpOaV2DPkeGLvZNlurJIX2ud
	 fRc5A12MdKtuA==
Date: Mon, 12 Jan 2026 18:51:48 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Bo Gan <ganboing@gmail.com>
cc: Lukas Gerlach <lukas.gerlach@cispa.de>, bpf@vger.kernel.org, 
    linux-riscv@lists.infradead.org, tech-speculation-barriers@lists.riscv.org, 
    bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
    luke.r.nels@gmail.com, xi.wang@gmail.com, palmer@dabbelt.com, 
    luis.gerhorst@fau.de, daniel.weber@cispa.de, marton.bognar@kuleuven.be, 
    jo.vanbulck@kuleuven.be, michael.schwarz@cispa.de
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
In-Reply-To: <b39e9af7-bdbf-4e02-ab7e-ec24626cada4@gmail.com>
Message-ID: <65f1b958-e420-c517-9a60-86f9085de702@kernel.org>
References: <20251228173753.56767-1-lukas.gerlach@cispa.de> <b39e9af7-bdbf-4e02-ab7e-ec24626cada4@gmail.com>
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

Hi,

On Mon, 12 Jan 2026, Bo Gan wrote:

> Please also check out Ved's response from the Speculation Barrier TG:
> 
> https://lists.riscv.org/g/tech-speculation-barriers/message/21
> 
> I think the best way forward is to wait for the TG to clearly define
> speculation barrier instructions, and use them for future cores. 

Waiting for the speculation barriers TG to complete their work is 
unfortunately a non-starter.  It seems unlikely to do so for quite some 
time.  Even once the extension is ratified, it's likely to take years 
before these instructions enter silicon and are widely available.  
Meanwhile, there are already newer designs in silicon targeting use cases 
that will need mitigations.

> For existing HW, emit a warning and do nothing. 

Can we really assume that this use case is the same as everyone else's?  
So far the Linux approach to microarchitectural attacks is to implement 
mitigations, with the expensive ones switchable, and then to give users 
the choice as to whether to disable mitigations for their use case.  Is 
there a reason for arch/riscv to take a substantially different approach?

> I don't want to see bpf doing fence.i universally for all riscv.

I think there's already agreement here - 

  https://lore.kernel.org/linux-riscv/20260106084410.94496-1-lukas.gerlach@cispa.de/

> Neither do I like it guessing this and that specific core implementation 
> needing fence.i or not. We simply don't know how each vendor design 
> their cores. Let the vendor tell us what's the best instruction to use 
> for our existing HW.  E.g., for JH7110, it's really U74 from Sifive, so 
> we can ask them to fill-in

We should make sure that the sequence used can be determined per- 
microarchitecture.  But if there's no guidance from the vendor, then the 
community should implement something that seems to work.  This should also 
encourage vendors to engage with us to make sure that the most efficient 
workarounds or mitigations are implemented.  That hopefully should also 
encourage vendors to design hardware that don't have these known 
vulnerabilities.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
