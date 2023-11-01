Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7908BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woCB8KEzQeEvwpAPDgJeOuBceIC4o40AUzkJZqupAFw=; b=F06AEWPq9G2QXy
	PuxsA0Se7KiIWE2zIEznrEWsT9k8H+nnnmZMf/Uyp/9guHA0z9UPq8ckB3Iu+DuUEm9ai/2YnF7NE
	IZjfq/FkdZv0QQ2uYQA5q6WbCnpD2hqnIgQ1fqAM1ceQE25N6Kyp5F7SOr5ie4cIwmx7zJ6rvXEoA
	OZhCxpFAQwVGurOISKUY83tyTMi/ZrvCHOR05G6uxsWU3dkW4X51O1vbMq6FZ5nUv2YZgQ0Fanj13
	9mOOov/4icPuK0EWgTglXTv2zeGaY7DHHlMA8wc7dnQGrl+nYYFt2VYxrO065nPeB/q1mwsiMLMXV
	egBhEE1ZRTmBB4n2gnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyGfq-0080Yd-2z;
	Wed, 01 Nov 2023 19:14:42 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyGfl-0080W3-1U
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 19:14:42 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AF6A75C0209;
	Wed,  1 Nov 2023 15:14:30 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 01 Nov 2023 15:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698866070; x=1698952470; bh=Cy
	q7i6EaGgil28Xl5F/guM0LpGPiNQiaA+bO7M5w6ZI=; b=INM1HKJwabC3A1jeJN
	SVm82M0rXMmci4dXowbsR7aGUDKLj3VlikAYGG8ZozK6hAuJNntjuGI0DPQ8lxmT
	xW95NsvkU5rLlUvlaCKQ8qzx3mxUtk8k6K522+EHyl6AWnHJhJirOvwkQORvEqpM
	XbocrgQ9E0D90hLUqLtE1g/wdfQR9jdbecMotlmXBOEWSAgCOvmXK/di06MrjlW/
	c4lZOjgTUkpLXY6BTxYeQXbalTiYLuHDmWt+NmhS+z5phRQgf0XodcB0k/CqBOYn
	l7LJ8jzz9U2EDm4gIruiQydd9SXyOIrfcd7JG3wY1uLV7YpuMhTUqVUUjis3a5iy
	ATMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698866070; x=1698952470; bh=Cyq7i6EaGgil2
	8Xl5F/guM0LpGPiNQiaA+bO7M5w6ZI=; b=dpQ8IFe5Ybpf0ckmqJ6zj1t3Uib0k
	2IHBDD8rKSUNAPVBge1lB+hTf1DM1/6XDdaxwGwwsGp2dCz4sWVOYW957PoQtmcw
	qUpzmRm25UA0KYrtMtqxF/4kEOfh0IsAqq4uG+ET0m/GJoQKFSzSyV9a2RnhfBNu
	6YCi0xaeQp67wt68qmKshfGI1SK8Ch3anX+qLvWLOF3us5Z9oOB/gQNgnJkUD4U6
	v4HEDig7Sh0OKfxsUkcW5UYxwQBjILMZpoU3WWmEdXNm00+C9VMPlZJF2acpx8In
	2Km2EOMw9cX7JnMX1GlLQbjMphdRO8ZfdTs3Zd/NbP7af8HY15k9bBx9A==
X-ME-Sender: <xms:lqNCZZ2cI36jOjIVjmRsCta6aqNW9vxE7_qfNtI0AfnPcLGwmEFfPQ>
    <xme:lqNCZQHZkILq72HZMew8ODZhY_gfVe7FS6MaU4iW4RooivjH4V5VIZsGZI22_Ma3O
    hKAAgPDlGLMmUO3EqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtgedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:lqNCZZ6j75x7Tm3vMGEzC5KQHpMXaS_WCHbWfI6Fdh-xBZMA72PJ3A>
    <xmx:lqNCZW0KlD2LvlSsQf5eKPBEWzwVIQBMg_wHPCP708EL_wqUImOD8g>
    <xmx:lqNCZcEiJph1WKGyeKawt180YBLtmInIg-kiTod-NjqYM-pOIF6zMw>
    <xmx:lqNCZXCgJIFktVUXLcFbg4g0YlUHbF9a_7w6hNwfpIPZGRqcsda-cg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F1B42B60089; Wed,  1 Nov 2023 15:14:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <be85f9cb-25cb-4d58-a0db-9b85af240bba@app.fastmail.com>
In-Reply-To: <20231031-optimize_checksum-v9-5-ea018e69b229@rivosinc.com>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
 <20231031-optimize_checksum-v9-5-ea018e69b229@rivosinc.com>
Date: Wed, 01 Nov 2023 20:14:07 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Conor Dooley" <conor@kernel.org>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "David Laight" <David.Laight@aculab.com>,
 "Xiao W Wang" <xiao.w.wang@intel.com>, "Evan Green" <evan@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v9 5/5] riscv: Test checksum functions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_121437_582661_38273971 
X-CRM114-Status: UNSURE (   8.92  )
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

On Wed, Nov 1, 2023, at 01:18, Charlie Jenkins wrote:
> Add Kconfig support for riscv specific testing modules. This was created
> to supplement lib/checksum_kunit.c, and add tests for ip_fast_csum and
> csum_ipv6_magic.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig.debug              |   1 +
>  arch/riscv/lib/Kconfig.debug          |  31 ++++
>  arch/riscv/lib/Makefile               |   2 +
>  arch/riscv/lib/riscv_checksum_kunit.c | 330 ++++++++++++++++++++++++++++++++++

I don't understand this bit, what is special about riscv here
that prevents you from adding it to the common lib/checksum_kunit.c?

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
