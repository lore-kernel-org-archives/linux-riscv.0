Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437BDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrv3EmeNxymGhG/EXOi9TIKKxISgj/2mcDnZWxskGLs=; b=LlvHFIiz088dji
	f1UywabiTPaaUBIgoKICphEIVcnUmv7GAmroBXusSHx87sl+UB5+liT+CI5757kSyxVHWKBCcIeiL
	ayoVC76kf/t56uY1UJ7jK66LJg9DvzF/2Z7Ky3ql9j6wyw1/zlZ+nqii7h7F2fwpFiFxJ2SFcrQkh
	kem6kugWIgEC1xyErqNcRBUSxoKioCZuwpcVf8PPiclbxUlTW5YAP/nl6NChKM3MewTIukqSQDiqK
	+YJ5Xtuvp5BGoQSFINuCHpIXz/DL0LPNo1mIQDKHOmPeLLP9jNDhso4xE2FUsLSlNFxQ5vWh2Y8o0
	PwatHW11axpRc1KrjDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqjd-005XAh-0s;
	Tue, 31 Oct 2023 15:32:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqja-005XAG-1P
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 15:32:51 +0000
Date: Tue, 31 Oct 2023 16:32:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698766364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlA4swY68f8oH5LxcLt1xk9Sy2+shWdr/fI+rR3tSjo=;
	b=KebwSY/Ofro69mMl3bAogskXWbvTG76jk83V1e31CDckX3wPm+7IvX76Ev3L3W5aKvHnSX
	mbv2Otp0mHyhokKXF87nfr2/YqtZSI41+hZFGBPzMknG+qifdhNloRnuyhzdMgVjYFPSzp
	LdFB2679gXJC72mXI1fEY1FdQNNzq/DHTGX03AY36HGiVM3sYhYvrar67m4zkPWC1Eh4R+
	ia8IRpVbk67h3+xJ4ltDil/RWNyKbSd0xe0y/mdHSbw6NC8cAlWhekb6vtieVRlX/Grcam
	HtnqI6CVR8QUPXKQqZg9GhloYbHT/0DLN2pHhgLrMGzqy+PuHNRZn754Z/LMxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698766364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlA4swY68f8oH5LxcLt1xk9Sy2+shWdr/fI+rR3tSjo=;
	b=NE6lGopV6ah5fIYKfm6I9ZlYUKFHXVgnnxAmlvJXfjWFGBqut4OCz2gX1vlrFF+V3HHGO2
	wkGupA9vl0okfrBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231031153242.k9tLdSby@linutronix.de>
References: <20231031143521.441-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031143521.441-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_083250_612764_6A3DCFF5 
X-CRM114-Status: UNSURE (   9.79  )
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

On 2023-10-31 22:35:19 [+0800], Jisheng Zhang wrote:
> This series is to add PREEMPT_RT support to riscv. Compared with last
> year's try[1], there are two major changes:
> 
> 1. riscv has been converted to Generic Entry. And RT maintainers has
> introduced PREEMPT_AUTO, so its support for riscv as well.
> 
> 2. three preparation patches(patch1/2/3 in [1]) has been merged in
> mainline.

There is no third patch in the series, right? If so then the amount in
shortlog is consistent with I received.

> Jisheng Zhang (2):
>   riscv: add PREEMPT_AUTO support
>   riscv: allow to enable RT
> 
>  arch/riscv/Kconfig                   | 2 ++
>  arch/riscv/include/asm/thread_info.h | 2 ++
>  2 files changed, 4 insertions(+)

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
