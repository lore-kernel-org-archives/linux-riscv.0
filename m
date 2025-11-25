Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B97DCFD37B
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 09:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQWJhcxS25XvDXsVnd78vx2xfy5iXHbUjdxGjqPf/xA=; b=b9I7fWODyKfzKg
	/n6wYoSnZFOtsKI60DI4ARUekDM4d5kL4eecQbYDUPTGYC4tIoVWpWaYt4HlrHAghEXieIHoto37M
	WgEk/JR6edsgE7VQpW+fDQfDYTY0knD/enC8zcAX1jM/dy5ARKFsz9pNnSL7RQ83mlMd8bxcMwxIp
	R1XQ0ZhNLEp/Y/D+dRSx07oSMEXT4fTxs/o6YyTJ28ohGNLGshuiuktrdBDpfyL69Dy1nL1XW/l8C
	7Vmdq6jDog54SBQUIjowFp34ay4T4B9QDJLi+9jy2FTvRNyAO8/Q3TbBosFqUST+gYhEl1Q6eUC94
	oCbWLmb2UIrSt0x3GFcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNppC-0000000D43d-1152;
	Tue, 25 Nov 2025 09:59:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNppA-0000000D42q-06AS
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 09:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6500843A5C;
	Tue, 25 Nov 2025 09:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06445C4CEF1;
	Tue, 25 Nov 2025 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764064743;
	bh=XxAMXvyH5fzNpfsZKBBpvtjMc8ctLq4zXPB4D3u9O9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uf73l42xdAJzRwhkVXMQXaBqMmFMBB52yezSTlRn3jlgvFkS/N6c+AiiinA+cQOxu
	 Kr1XdSp0eixjycByxsOH/vuCkKEVpPYDIh+XOJJ8M6WdJPQ28AaIjZoK2RKr/gbCEb
	 KWHfycM8Br2vJKp01INl9xSxusNqJXA4F61U2hJx8DoiaES3PRy3uTzKHWRRFnzMG3
	 KGV+lJKIDQv2ZiKq3vzQCq9goNJEO+tl+se8fW6bqRGwXZMsS9YHmTiBat5LEyEkNh
	 bapIaIldAFpg24VLIgmC3HDwfvNAEeAFtw5vUGC29QwJv/lVr5CVMH6VxCOzrpxDPA
	 ZaVVlcTw1MGjg==
Date: Tue, 25 Nov 2025 02:58:59 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Conor Dooley <conor@kernel.org>
cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
    Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v1 4/4] MAINTAINERS: degrade RISC-V MISC SOC SUPPORT to
 Odd Fixes
In-Reply-To: <20251123-reactor-jubilant-36551b0d8143@spud>
Message-ID: <129e2207-040e-9eaa-9e81-b145e18182ed@kernel.org>
References: <20251123-shopper-stunner-c3c5ff00b0ee@spud> <20251123-reactor-jubilant-36551b0d8143@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_015904_077696_D0B849B4 
X-CRM114-Status: UNSURE (   9.81  )
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

On Sun, 23 Nov 2025, Conor Dooley wrote:

> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The SiFive and Canaan platforms are not being actively looked after at
> this point, but fixes for them would be applied if/when the patches
> appeared. Since they're now the only things in the RISC-V MISC SOC
> SUPPORT, mark them as Odd Fixes. I don't believe this is a functional
> change, it just represents what's actually happening - particularly
> since the Canaan k230 never built up enough steam to get merged and the
> new SiFive demo chips have been done in partnership with with other
> companies, e.g. Eswin, and will reside in their directories instead.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Paul Walmsley <pjw@kernel.org>

- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
