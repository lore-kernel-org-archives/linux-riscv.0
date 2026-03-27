Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3DC10F2848
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OhF/X33CU31hSdZkcM9VDoF5eadJMLJrS/8qDP0Cvc=; b=FMvy7Ogu4NzDfZ
	r/ih69sA5XrDsBTh/Un16nbCqhz/Th7Ktw+iR0NcyczePzfENbszMP5TGFzcIrgw78yQHQOYUNh59
	O4wZUrDFbRriD/b3xLs3oAVPbQle7KHvIchag1PVGAHUPUUr1Yrm1Y2UpbFNaUCL6XnnpLSxXMpbx
	37EMNAHnfjR6fFE3daayRorj24l2NtTxJj24mtTDnFUDaKdLRA5c1CspDU5b7fm9f0RJyVj6L51Iu
	ahfPGOtUqgQk6l46wCEiyyIGnicSqZuBZ35DTarAAr9PkYl7k6cB66GwwiJtsNyALKnhCDkNplApe
	gX+Flxq0alx9gY/UBctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69QR-00000007inY-0F1t;
	Fri, 27 Mar 2026 15:48:43 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69QO-00000007imn-2IOR
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 15:48:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fj4n20nQszlgqw5;
	Fri, 27 Mar 2026 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1774626506; x=1777218507; bh=daYKBfZtVRE0Up+JvW4epS91
	zfI0bi2LU/4qn3ihDck=; b=y/CwjrgZaYZ8yuyWAm7DVpesBmImJ3qmESbF7Oph
	7bcSW56maohK9flTVqvLGyUEPvzPHCsVBaSRD5PgFlANNFQ6DetOqlymgFOyuKvS
	G89BGNB0HUcVwyVUe46i6iHpNQlkj5DsVwoGrohq040AglGJ3JeqHX/MMontyRBJ
	65d0Fcz2pHeDO8DjVZeswp9C1voPLPXmsJsVY91BEF/Gd8SJHnUrsy48ZWUH/Tan
	DFRKTzh13diapZrM5bsErlqCXq8j5qrB9X/68kkcaBjRZqmpN7atVfy9TfuTbcRU
	ZW/e6waW9YBYz7gNn3Afjj1xTwahBjjBsBMu0LamPIoevA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id XR9mbTQNfkjy; Fri, 27 Mar 2026 15:48:26 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fj4mf33mJzlfwHS;
	Fri, 27 Mar 2026 15:48:18 +0000 (UTC)
Message-ID: <91bacd7d-6ec0-4888-be0d-f11a6607f38f@acm.org>
Date: Fri, 27 Mar 2026 08:48:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/2] block: Introduce a BPF-based I/O scheduler
To: Chengkaitao <pilgrimtao@gmail.com>, axboe@kernel.dk, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev,
 Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20260327114741.91500-1-pilgrimtao@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260327114741.91500-1-pilgrimtao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084840_604732_8248902D 
X-CRM114-Status: GOOD (  11.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/27/26 4:47 AM, Chengkaitao wrote:
> I have been working on adding a new BPF-based I/O scheduler. It has both
> kernel and user-space parts. In kernel space, using per-ctx,

Does "ctx" perhaps refer to struct blk_mq_hw_ctx? If so, please use the 
abbreviation "hctx" to prevent confusion with struct blk_mq_ctx (block
layer software queue).

For what type of block devices is this new type of I/O scheduler 
intended? This new type of I/O scheduler is not appropriate for hard
disks. To schedule I/O effectively for harddisks, an I/O scheduler must
be aware of all pending I/O requests. This is why the mq-deadline I/O
scheduler maintains a single list of requests across all hardware
queues.

Additionally, this new I/O scheduler is not appropriate for the fastest
block devices. For very fast block devices, any I/O scheduler incurs a
measurable overhead.

> I implemented
> a simple elevator that exposes a set of BPF hooks. The goal is to move the
> policy side of I/O scheduling out of the kernel and into user space,

What does "into user space" mean in this context? As you know BPF code
runs in kernel context.

Thanks,

Bart.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
