Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882F3FDEE39
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKZe5oF9m/3uiH8eY9v6hGvbGAfDf8r0P7q5ho8biZc=; b=X7FjCl6WY8hEUO
	LFe0QYnKQo4owBJSmKk77GpgAvWu5IXknGe6+rQjDRXa/qhf1zklFbu8L3/b0vshmJM+pAbe/UcJn
	HfBNPX6V8ceupVrZM7sUDyp6nMjrY5K9UbW1DgU7heeV0SY69yz5HI/1CrgBSGSvEDvjZOLlpsbDX
	cqSR4OZihajN2Q2uvV6hYMrAi5heRorKbEm8iJC1zgLnm8jO6/y6QJjtS7VlsmpmlYTrIWYfAb/KP
	LQ4vd3I1GEvqBJlkdXGk5p2wn2h3WGzYQoYCBdjlC5qldiTImNK1OjPfgPDpPHYbeurZMFZllZdat
	bzADDO6VcZIdNuwCcvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG4Ta-0000000CRll-36wA;
	Fri, 24 Apr 2026 00:32:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG4TX-0000000CRlS-2vqe
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 00:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E645B43987;
	Fri, 24 Apr 2026 00:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52C1C2BCAF;
	Fri, 24 Apr 2026 00:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776990773;
	bh=DJG/pKHyLxElCYAoVVI4MUfA2QkkYYoHGQCULfEX+Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyhhXCIDbLMGTRMnvBDeck5N704Nt+x4ifO5bCq2cx8/S9iHpcRjD9S5U0T49YJnp
	 6c23F//UtqN5u80NSM0yQ2ANQa9l1wrw83s6g6mzSV+4LGTSxg4elIh66hq6v9fXfH
	 W06acqlGbAm1cSjm4CUdTH6XZuLS+zZWG3ynXX7JVHok482bFY6C/huaw8I6wY/hfd
	 E4xo1BJdPGVaFVYIOlsyu+7tp3dKW7rbYcbGM1ikRNSwIVS32t2/GLNSASbhhKa6On
	 HysCyiVbZE0a9DcNMRVbalAC8Y+WLjMe+VxtFQMyiCKRMpHhiWxQQyCK+GIO71ucfQ
	 PSeHkxPqyVzdg==
Date: Thu, 23 Apr 2026 17:32:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v7.1
Message-ID: <20260424003249.GA2985598@ax162>
References: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_173255_761953_9063D47E 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

Hi Paul,

On Thu, Apr 23, 2026 at 06:07:29PM -0600, Paul Walmsley wrote:
> Nam Cao (6):
>       riscv: Clean up & optimize unaligned scalar access probe
>       riscv: Split out measure_cycles() for reuse
>       riscv: Reuse measure_cycles() in check_vector_unaligned_access()
>       riscv: Split out compare_unaligned_access()
>       riscv: Reuse compare_unaligned_access() in check_vector_unaligned_access()
>       riscv: Remove support for XIP kernel

Please note that this series is broken with CONFIG_CFI. Please see the
fix I sent and consider applying it sooner rather than later:

  https://lore.kernel.org/20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org/

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
