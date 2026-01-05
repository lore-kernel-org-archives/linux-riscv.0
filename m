Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0506CD0423
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 23:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zf0AeqJpdYRlefagm9L3f4tdMD+I3RNn8IHYqzvSwqg=; b=Ln8BHkeLPqPWrL
	cGVL5FjVIk/9bjdC44RTY9DKEGvELbM27b2DREqIAIOAjzx3cSkOh5oSryFNkPqA//4VbRUYMubKD
	6Hc/0/k7dGS7EdNykZJf8U6dJ16DMkBHj+HJBL/1Aa6dRXsfrHX+NMa4uBbcyhsfDduHPRWgKiiqX
	IWSbO3D2ZqplUfthNcmiwtkPWXe2cKIQ9VHOztqu+UZHo+hdLoaDOgz6f26n6NCOqfPrNdA3d8u+c
	rdzXdY624IQ41hdfMFrFeNErcXWTU8mkT+gm3tLdUlLsfekfTU1uxOXHhjNQ1gslgLm8Gu8N5/eqO
	Doyyeqp6GazqB0P8TQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcu00-0000000CEoH-1lz3;
	Mon, 05 Jan 2026 23:28:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctzy-0000000CEoA-3sNz
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 23:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C2E26011E;
	Mon,  5 Jan 2026 23:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CB0C116D0;
	Mon,  5 Jan 2026 23:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767655708;
	bh=U21q/lDfx/BO3V6IyHv1qFtq6LrV83MbndFcW6vb1iE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YBicwwFzKdQXs1oEo7+hTDN44E9akaBi1P6qzgZZ7ykFOIOIENRi/AUeYoB0abnC5
	 W6RoAVYi9u+ThqIORZR1n44jS/C/idBwlwD+NffY6w9CLCSrtj8+JHWoCyc5HOxUEu
	 jEoc5Y3L5NEyUSQ1XXB82g3JMUPm46U6u5y24E82AZuElxP1ni1a8BznNjrm40imXW
	 FqAP+P6sPBhPjV0f/8+B8IEg9UDIdpN61wdimxpjay+oIrufL6WUYRGYdS9CTQDMO/
	 lOFP+0uBdgfBpmWwC7DLFo+u9PNNQkFrKM40ZfMCzxE1V33Yo98uFwGHspIDeeEKWr
	 kwzuRHrI4dkmw==
Date: Mon, 5 Jan 2026 16:28:26 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, bjorn@kernel.org, 
    ast@kernel.org, daniel@iogearbox.net, luke.r.nels@gmail.com, 
    xi.wang@gmail.com, palmer@dabbelt.com, luis.gerhorst@fau.de, 
    daniel.weber@cispa.de, marton.bognar@kuleuven.be, jo.vanbulck@kuleuven.be, 
    michael.schwarz@cispa.de
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
In-Reply-To: <20251228173753.56767-1-lukas.gerlach@cispa.de>
Message-ID: <83981ed7-9d36-a47a-cf73-9010fceba5f1@kernel.org>
References: <20251228173753.56767-1-lukas.gerlach@cispa.de>
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

Hi Lukas, 

thanks for the patch,

On Sun, 28 Dec 2025, Lukas Gerlach wrote:

> The BPF verifier inserts BPF_NOSPEC instructions to create speculation
> barriers. However, the RISC-V BPF JIT emits nothing for this
> instruction, leaving programs vulnerable to speculative execution
> attacks.
> 
> Originally, BPF_NOSPEC was used only for Spectre v4 mitigation, programs
> containing potential Spectre v1 gadgets were rejected by the verifier.
> With the VeriFence changes, the verifier now accepts these
> programs and inserts BPF_NOSPEC barriers for Spectre v1 mitigation as
> well. On RISC-V, this means programs that were previously rejected are
> now accepted but left unprotected against both v1 and v4 attacks.
> 
> RISC-V lacks a dedicated speculation barrier instruction.
> This patch uses the fence.i instruction as a stopgap solution.
> However an alternative and safer approach would be to reject vulnerable bpf
> programs again.
> 
> Fixes: f5e81d111750 ("bpf: Introduce BPF nospec instruction for mitigating Spectre v4")
> Fixes: 5fcf896efe28 ("Merge branch 'bpf-mitigate-spectre-v1-using-barriers'")
> Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>

Have you been able to measure whether this change results in a performance 
regression on cores that might not need these barriers, for example, 
in-order cores with limited speculation?

Am thinking that we probably should make this conditional using code 
similar to arch/arm64/kernel/proton-pack.c - and avoiding the fence.i when 
cores that aren't likely to be susceptible are detected.

Thoughts?  


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
