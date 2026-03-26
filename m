Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0CD10AB82A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfwhTPw7/yx2dtRVp7l84gqxlaM7NIKBkEYyEZte9GM=; b=HeDCHdS9coyQux
	6kun+N+PHLQPGumo94bBA6CqjsjBOvV//WHDQBVVmdX9ny5H/Q8ll0nfb+aoKl0/vnaqVxqw1i9hl
	gPnwRjar4/uHl6gS6K4d/HvZmEFLI/u4po8ASCOxLIPOjkGUFsmA8261FX7uWmDBcVLvdffqAwyuW
	gHymjPfJyhqa2hcwKquObDfRAUs5aXwhbyyzzMoFBqaDk0H0Yo7muExO9hJIommGfuA9ZsT0yCUAh
	nubpXrd5+nVsgGGA68JtDPbsrCyXNd9YZKpumT6kkccXCyLKcjXkQbBgHY6UNo9UQjQcOIN38QShO
	WQmt8XxgQ3uVwWVIxqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5t61-00000006JdV-0WMe;
	Thu, 26 Mar 2026 22:22:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5t60-00000006JdO-2WV5
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 22:22:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9804760121;
	Thu, 26 Mar 2026 22:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81441C2BC87;
	Thu, 26 Mar 2026 22:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774563751;
	bh=QFvbS0GhFnRlo+56h6KYVqI4hNKBx9LjI/HgLWKtYxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQBepmYfZMV5yL7Sh4QV7gumKup40c8mFrfl+1n6NpvgQvcctZVNa5Ntt6lk5EbvF
	 bvGmDlsWBHCQM1xndpWifoWWcQ0gIMYn+C4jNeythO3zJEpGS3G7Tt/G3EfrMA1ZsO
	 afuwMqKvlhxMNNUzw4WkV72eMNtLyK6ux3LFsmKQ6y1zs1U/Z+S2UtLCie1ryn9FIU
	 ZPUTlq8AaTqPufMsL2wXPVWE0ekM17D3yDOy1syUlRqxXSQou5ZNLBi7Wsa9SgsTfT
	 JOteDq9En2aG/C6XTUwMPJm9iNEtOWjKKfHhJ8zzDpeCs92z0pqsRK3hRNky6qRiLU
	 J12HHeapLDoAQ==
Date: Thu, 26 Mar 2026 23:22:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <acWxJNK_vZca_xCZ@zenone.zhora.eu>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-2-78f29c83d9ac@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260325-02-k3-i2c-v1-2-78f29c83d9ac@kernel.org>
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

Hi Yixun,

On Wed, Mar 25, 2026 at 09:49:25AM +0000, Yixun Lan wrote:
> Populate all I2C devicetree nodes for SpacemiT K3 SoC.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>

this second patch does not apply on my i2c branch. I'm missing
some other patches on k3.

Can you please rebase it on top of my i2c/i2c-host branch,
otherwise I will need to wait for the merge window to open in
order to take this.

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
