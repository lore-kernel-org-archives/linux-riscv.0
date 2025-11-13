Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE4DCD6E55
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ey+5PGWZkoPiKz/hBB7VuaEs6g7pjm7HFXIhlheONI8=; b=OQ0geyDibW9ulM
	7dt4QKD98n9FOKye6xiAMAHs7lEn1rKHaKzJVkaVR8N251iLfT+FdBfIs7S/bL8rdX0yeDCZu/F4w
	SHskPEPN2HKtFY6OoROg3mYEqxi7lLbWxcgC11q+cms7Fm/JvXRGS0YCfh+puX0LkH+oOxphPfkBl
	IQ4DwLnY9JMPPsj3MezgJ+UMyNFlX23CRLRAKPkdvF8pCYUglCBnCS3Jc6B7B81jrL7RZ29Xeis15
	9TLFocmkML7rUDCNo/sn6O4vJ9lwSVbLlnfDpoLgtrkQSBpT8C40k2Nq+GpsgCwNo3S3dgQ12UTKv
	D4NLHrMoKwYhFKk+k3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXfp-0000000AZX3-3HLs;
	Thu, 13 Nov 2025 13:47:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXfm-0000000AZWS-3ji1
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 13:47:40 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763041654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bfgjqdkl3nu+9pQIon0tTsyOOqARcFrleejnJYi0Q0Y=;
	b=jWTVc56KxZbmXe1taBYMHCSbYo4zm6D8AMfU9tX91XEPf6g5UD5IRvOeCmomfvjUeLu7M8
	uislhLoNSyvnqbsXiiP+33KMUfjI1QsUQViGSqDVOyOWvYO9zTwImczrBPGXsaih/yQ/WM
	c7isNeTMdOryAgpnH/tXXIy8QPuvS7v7CoOsUXBT9b+nUhe6Cj+1MJ3wqzI2M3neLjtC9o
	r7AbSAR4udD0cHlilyDezZOYnHjoSOZtNKrS3f5qD3VCVnpfntjweoaYDs41rxIQ4B3THC
	EaM5rZl9N2jDSETZh4dSSi5paMEFGM0qXHl8h3WW9HvjdWPse6AhNL2gkj0KIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763041654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bfgjqdkl3nu+9pQIon0tTsyOOqARcFrleejnJYi0Q0Y=;
	b=ELhvdV3DeaDjKc8cHTwMQnDebj60FfxKN7bQU8V3vR275fxFNvyqtY0HMVONFr70k7firl
	yMY4pxLjHNGHjnDQ==
To: Troy Mitchell <troy.mitchell@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Troy
 Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v2] riscv/plic: assign context ID based on hartid
In-Reply-To: <20251027-fix-plic-amp-v2-1-f077b9439112@linux.dev>
References: <20251027-fix-plic-amp-v2-1-f077b9439112@linux.dev>
Date: Thu, 13 Nov 2025 14:47:33 +0100
Message-ID: <87bjl6cadm.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_054739_091801_EC44D234 
X-CRM114-Status: UNSURE (   8.87  )
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

On Mon, Oct 27 2025 at 15:03, Troy Mitchell wrote:
> The PLIC driver for OF-based platforms currently assigns 'context_id = i'
> within the context loop. This implies an assumption that all harts are
> numbered contiguously starting from 0.
>
> In Asymmetric Multi-Processing (AMP) systems, where Linux might boot on
> a non-zero hart ID (e.g., hart4), while other harts (e.g., hart0) are
> running a different OS, this assumption is violated. This can lead to
>  different system inadvertently sharing the same
> PLIC enable_base register. Consequently, this causes configuration
> conflicts and incorrect interrupt handling.
>
> Assign the PLIC context ID based on the actual hart ID provided by the
> OF node. This ensures that each hart context maps to a unique enable
> region within the PLIC, thereby resolving conflicts in AMP setups. This
> change preserves the correct behavior on Symmetric Multi-Processing (SMP)
> and Uniprocessor (UP) systems.

Can the RISCV people please have a look at this?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
