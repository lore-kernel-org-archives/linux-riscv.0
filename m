Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDC4C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAaHcNc6Zy+W1ljO7SqgMoNcVNxaVHDU4HSzIFc5h7s=; b=CQhVHcPi3q+ICK
	xtWOTDrRfzSg2pXGCHqxTUoCLm1ngoVFcJnTDW9ZTLPG2r6pCXnIBxHWlk0bmZLulRv96r0yEbt8i
	WV2bvp7P71lNS1BZB0NZhHNJ7YGGBQpHIKPMUAS8S5B+ceaLj/DlWgqo1KX01UZSTRCx2vskUenz6
	5IDaC68N94aQgDuf2bis6T2N7/74T4pKb6pkvCgBwYhpwBtk+ClayyLLEgWiP50GG+YlEO05cBAyS
	h1t4vlGxwI251yrzVX5cMSvo5KtPhWY1kM/iYftyaAy1rLvSTNcR6NfjkICxByZB6NH7bKPb1a0A6
	PX7lqxopuT/LCZf5fg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKmn-0000000A94s-3kRx;
	Mon, 13 Jul 2026 17:49:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKmm-0000000A94m-2vCM
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 17:49:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B64E160008;
	Mon, 13 Jul 2026 17:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C661F000E9;
	Mon, 13 Jul 2026 17:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783964983;
	bh=dGy4xA7VBrH77+dnE3wGOeN0tFiTv5YW0W3wU8tF+5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=QGavDvgiJfS+BebQFG3SQ5Q/pvOKfYsBgwhR+Sgb0uZCIY5fP4/IzcD00buyPBpWl
	 x+dWFVvczrCExOr7qXwhh5sLQdtAKrmB3MZS5DQA2Y62xFiHZLi/TxByA8oDUszHRv
	 0ZmVp/kPukI1Dy01EAKNhVHQKy4NqR+hulZETuUHaw4yFqzvNjVpS7bS9a7PCHIBu9
	 HUiOiIr3UT/3do4poqXhCsQj+eQJbKC5txQNoN/mbE08v6XkaNKzwu1YybtjbK5eTz
	 92QoYOAW1dN+AC4BzV/SIG0LrLO2+u1xiwU6131Y7rpK0vLJmesdC4maOpOUd3PJ1w
	 jiiEPPDxsq2BQ==
Date: Mon, 13 Jul 2026 11:49:42 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
cc: Paul Walmsley <pjw@kernel.org>, paul.walmsley@sifive.com, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    apw@canonical.com, joe@perches.com
Subject: Re: [External] Re: [PATCH RESEND 1/2] riscv: mm: Apply svinval in
 update_mmu_cache()
In-Reply-To: <CAPYmKFt3t0C0R4iVea=MRf0zu4F9gkkanPsepqC+XEJLAT8ecQ@mail.gmail.com>
Message-ID: <7a82645c-504e-2db6-165f-c4593982f04e@kernel.org>
References: <20250901114141.5438-1-luxu.kernel@bytedance.com> <20250901114141.5438-2-luxu.kernel@bytedance.com> <dcd61aba-8622-b14d-6466-44a7f0dc0615@kernel.org> <CAPYmKFt3t0C0R4iVea=MRf0zu4F9gkkanPsepqC+XEJLAT8ecQ@mail.gmail.com>
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

On Mon, 13 Jul 2026, Xu Lu wrote:

> Yes, it makes more sense. Go ahead please.

Great, thanks, I queued the two split patches for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
