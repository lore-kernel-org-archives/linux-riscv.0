Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03725C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXEpOdCon0X831bp+DhiIw3+sfJI/WJq1yyqnn0uVAc=; b=czRm/VCX4SGGwA
	lK8hU0tVK8sz83mf+/yzzDdOfrs8Yw7Nxe4LnntWriDjXcLCxbg2C9Psm8aC8GxJyLJcghcRFzNPy
	epLJ4aO95xSetRC1/qlrJvKlc9KKbUKjm6Kh1WD1VTZDVJAmScXBqaKhdFpBerZWnUidBEVIGzF4Y
	NMgI8j0UJOE3faOm3ZpD1qYuFtIOPwnF1E+WbBo0VC+BatCidUqEQXE5JjGVp8XYQas99yO/Tgb9F
	bM3nra77rmjCQxjW+h8Wy0EYCLKrvEYTPIjOyNJszh91l7ix7UKQ/4KP4VRn7adWdbFzzl1o7vr6p
	LG+SZdcKNaQkT8lM20RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcVbU-00000003Byb-1dvE;
	Mon, 27 Jan 2025 20:21:04 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcVbR-00000003Bxd-3jOt
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 20:21:04 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 311C392009D; Mon, 27 Jan 2025 21:20:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2A26392009C;
	Mon, 27 Jan 2025 20:20:56 +0000 (GMT)
Date: Mon, 27 Jan 2025 20:20:56 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Charlie Jenkins <charlie@rivosinc.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
    WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
In-Reply-To: <Z5aSMVZLMwmyCp9k@ghost>
Message-ID: <alpine.DEB.2.21.2501272017140.56843@angie.orcam.me.uk>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com> <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com> <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk> <Z5aSMVZLMwmyCp9k@ghost>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_122102_085152_F6061873 
X-CRM114-Status: GOOD (  10.92  )
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

On Sun, 26 Jan 2025, Charlie Jenkins wrote:

> >  Wouldn't it make sense to save a jump here and make it a tail call, i.e.:
> > 
> > 	la ra, ret_from_exception
> > 	tail ret_from_fork
> > 
> 
> I don't believe so due to the return address stack. It was shown in this
> patch [1] that a 7% performance improvement can be seen on existing
> riscv hardware by performing the extra jump. Doing tail calls should be
> avoided on riscv since the hardware can be expected to predict the
> return address incorrectly every time if the return address is manually
> changed.

 Fair enough, thanks.  Though no link to said patch given.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
