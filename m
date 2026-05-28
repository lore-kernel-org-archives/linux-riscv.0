Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B918CD5BC9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 00:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFdkxGcJF1+24HcyLEXv2i5e3+j4YWn1I6dg/bJwiQc=; b=zKbFXsYzU8s7tU
	a+X0yr3nNwYikfxrr7h8VVcQJ6AiHjsYjKlTpw5TwppHT0u8ovSmCvaEYJDHOOiMPs335pe0YxY/p
	EcqZxEklA5kSsYDypwusUoY2/dha+wf5cSWcBdRQpmrOLgXUd0X3cTIzjRJgVpB+tVPpx6rwlxW54
	kzLnv2gqnphKBP/Vkc3XFvC1DEOwtfgpODf6raIjq22qL4dROZ28nQ4N6Iyjk0oNeybZxALqUVLgY
	in6eYF0sZUvuBLw8BMttKZ+n+l1OXoxiBH+IbslTH4zz1b5jBs0e96KNupRm5oQZYYl1M8Qvo/L12
	x4t+QXLnGjGkytbplpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOZo-00000004rSs-3Xcb;
	Thu, 28 May 2026 00:26:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOZn-00000004rSU-0fJA
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 00:26:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE64A40799;
	Thu, 28 May 2026 00:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470D01F000E9;
	Thu, 28 May 2026 00:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779927977;
	bh=VqfZ9WMdjxj8/FGU70IdSGKs6hSYKYxzIqkpTg2PEqE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=iiHKZu5Fxrg98QzPSD2DPNIAGdeih+0v7TbrLEapGLmR9zzjsa/PMGsi8FERuXlwn
	 6G6O3z3XayisAKg9BIHAqbg6cpEnWaIy9WqDd0fKnKc15JP1D4N9SnNBQYfxtjiwmn
	 4zpyqdaPXxKPdD2AQqTm5COS/Rwdvi1vk1MWOOwKwVfy+LmupOhZSHiBxTS/+ua2Ep
	 3+6jxx+MaywgIk6kgBs0EOBh/IYaBTtjzWh+QiQR+pNuiWM0hf1WFXIG5ryHhz8pP2
	 IwwtQMoDlJeZ+LKHFiUbrYMVuM+zzdTpo/psE836xa2MXH7bpDy+9AYyzDmVQ52ZlH
	 raG5MItkc/8aw==
Date: Wed, 27 May 2026 18:26:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, leitao@debian.org, 
    akpm@linux-foundation.org
Subject: Re: [PATCH] riscv: kexec_elf: Remove unused pr_fmt definition
In-Reply-To: <20260525115159.100177-1-hui.wang@canonical.com>
Message-ID: <aede4c5f-b732-a1c5-2207-6eeddca6c21f@kernel.org>
References: <20260525115159.100177-1-hui.wang@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_172619_218593_4BF22396 
X-CRM114-Status: UNSURE (   7.70  )
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

On Mon, 25 May 2026, Hui Wang wrote:

> Remove the pr_fmt macro as no pr_*() calls exist in this file. The
> prefix string "kexec_image: " is also not appropriate for kexec_elf.c,
> if pr_fmt is needed in the future, referring to kexec_image.c, a more
> appropriate prefix like "kexec_file(elf): " can be added at that time.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
