Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C904C44512
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 01:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJ44fwU+idJV1LOukhZ6fLC6hV5bVoKNXTvydlh18Y0=; b=RIU7rW5pbC5SSG
	O4uIZPg9C8f2JeR4lh7fiHH8uyWkdhpNC+FvYNAc4Ng5F8Uiro1wAYxQ1LRU8qMAqY5PFa6pC/uJH
	tj80XXuYm/HiVEUSu+5yM5QyWD1pm6LmxpYdZZPxNzSYkkO2+7vPugBW1vgSsxyBCkQ7S/mbW43M/
	KT0e9rv2Du739evAjODP+49epSYti6VS6GZj0w1i9bQtzlZe47wnWXntaLia1AohPvwCEwdvLM2LV
	OOajUK3P+gW/I4HIh7vqMoK3cTA6l8ESWjRVZGrfmD/DwLAI/V7e/JyZADwdbwYoV8jRQAS791c+T
	13ps+NNZwWP0pyWPhyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXWY-00000000ubF-3XZf;
	Fri, 17 Jul 2026 01:37:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXWX-00000000uaD-1kS7;
	Fri, 17 Jul 2026 01:37:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8313A60A6C;
	Fri, 17 Jul 2026 01:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CDB1F00A3E;
	Fri, 17 Jul 2026 01:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784252276;
	bh=HQWHI05VLoFmTDGLD/8BrEB9TvW9zVg8VbA2I33LjSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SIjUb8AeamEEXIjQWPL5g2nKM1WJlVr1ofaI2WGxaJ2yDbrytsFrAgMPqwGwBmtN3
	 7NYI8KEj2LUXkZvvOcs+bda2TUbTbPvjTA7U1Y/MJWyTSy0xhHYiM6XypYjqBoEgSv
	 SoQy6esckD/8rVLNhc+/4l4BIaFbBXn2ntmmt+8PIZ5PL7qeD/6FzvfVqrC9fz07Iy
	 9Kq1WenZdQeSgIToBYH4qXZFlG+/zUqILKX9TbDrN2bbIbHrebV464VadK2s1PDePJ
	 TKQF3Ppf4apxHj75gEcdvUJfgJxACGi8UvkwbliDGtzXVH5rf/40F/QNKhMPldv+Xg
	 J4GYyJpJDbt9w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: Re: [PATCH 6.12.y 0/6] cBPF JIT spray hardening
Date: Thu, 16 Jul 2026 21:37:34 -0400
Message-ID: <20260716232340.0007-stable-reply@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-0-d8585a9aed80@linux.intel.com>
References: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-0-d8585a9aed80@linux.intel.com>
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

On Wed, Jul 15, 2026 at 02:27:39PM -0700, Pawan Gupta wrote:
> These backports harden BPF JIT against spectre-v2 class of attacks. Without
> a predictor flush, execution of new BPF program may use stale prediction
> left behind by the freed one.

Queued the series for 6.12, thanks.

-- 
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
