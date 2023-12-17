Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFB3C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlbrPVxhtqmZPVcYBKyx0Nah6I9tZG8sLU2Z8BlQy1k=; b=ClZnYq3FcHRU/f
	C4z34NslY5idk2Fv0k0SkBghjmn08XEZ6OxJy48CXsrvpqop5XuEiELWFduOjVXKqX17TZYqgTTZ3
	CAFYCkTrS93LUe8QYmfWJKKiKVknQUosBdoVMfdhIUdY/bdpvDA5PVW6AMCt2A19ukyLzisdWAiiI
	lg+QvCv+FaChTxVlPBf4Z2XGBIPs0IhAs9KV7jeFqftJQRNl3raLiejMjuJ5NN3xzfrBnowUOk0xN
	u04xgqXsTlrkpoPSFU4wKjxC7sAPrUMed4YdVxK6TxuQNnxExc59fhp4bnlZt202wBnOzZ+/JP9SQ
	obsyJ8OW6m4gj0e9c/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEzvp-008bLw-2m;
	Sun, 17 Dec 2023 22:48:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEzvl-008bKZ-06
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 22:48:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7A25AB80CB8;
	Sun, 17 Dec 2023 22:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56DFC433C7;
	Sun, 17 Dec 2023 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702853294;
	bh=4k/K7LW2vAuBQPFpH+DX281lWsUDNFM+Oh8iKk4HXPo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SstXXnI3+v2NHVTPFPh/RJ6nqOHBYsHcznDz5gQ0cpCbdDgYUERYwSW5fkine7yit
	 Vq8lgJwYneoawYSgCI+QaD3rRMsEB2RqGI1iqKY/cnAujFDp0YFaF9xECgBaYkIrOM
	 hNkvhmw58xwqRmROm7pqQ2N/XKDyDhY8BL5/7Eok3dHMzdXXowLCWFs47zOMOcrOtk
	 QkVBmVMAgZELKD+awLjO4sMuwUjV6gNjFjBo313RJk8B8r6yb1qUbn9FkbgWBTJkaf
	 z7Oz51zBxcZDFqxOTUv+6N8SGGItrjyydI6smNlmoqQipAttIN9rfAxX9kD/JDJzRg
	 12MpTRzvBusjw==
Message-ID: <6b01be23781bc025f31bf733e366073a.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231214-dipper-earshot-72eef3059961@spud>
References: <20231214-dipper-earshot-72eef3059961@spud>
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: replace include of asm-generic/errno-base.h
From: Stephen Boyd <sboyd@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Al Viro <viro@zeniv.linux.org.uk>, Daire McNamara <daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Date: Sun, 17 Dec 2023 14:48:12 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_144817_218166_E9F3117A 
X-CRM114-Status: UNSURE (   6.22  )
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

Quoting Conor Dooley (2023-12-14 02:59:57)
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As evidenced by the fact that only 2 other drivers include this header,
> it is not a normal thing to do. Including the regular version of this
> header is far more conventional for drivers.
> 
> CC: Al Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> --
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Stephen Boyd <sboyd@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-clk@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
