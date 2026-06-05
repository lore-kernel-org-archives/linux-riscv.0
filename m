Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26A5CD6E7B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdOhHYkK3LhrdkZkgrVhOPENnIIIxzfhemR8MuRwWCY=; b=c/q+pdYSclENfr
	mhoVojW+yD5umdCJEJ5DxbiVIiJOBw/xEBbxtu3Ha3S10rt/M3SFVNFy0BiqgXziyVlINAMFO4Zdj
	H9QuGM8z/pqK7JbB4qYJTIyev+x7GbLaNP6ODXO7Gfof3z/ZpXUbNh45RFhruCl1hM8NxHxfaZzjE
	WROC7f9FeDigONvrWRtdIWYGCiDpXghaIKla4DuXlFKp5dlEXoTYG+8JExsjRBXVE0fzEPs5X/nJi
	/aVg9dkuZrTy+pQQMykqsmKAlCo5QU7my4VjNhZFwz/Bc38DyNrazz5qSG91OnHtXm/8webxsOByL
	FJ+eTNyt0PIAUAXquw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVacf-000000018Na-2iNm;
	Fri, 05 Jun 2026 19:54:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVacd-000000018NK-3zs6
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 19:54:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65AFD600AE;
	Fri,  5 Jun 2026 19:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86411F00893;
	Fri,  5 Jun 2026 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689267;
	bh=OguNSdFeLPKIR70OO/fJW07A7wzpAlKA0gio56u2hpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGrMEv/gePwqXp9QOjjBnsrYcpF/qK3OaieIhDzY2AZ77P/K1fvPf6IXHMQNWpGJP
	 ggLhXnWmC9+LMU+QevlUHlPq35+ThPMt6itCIWEwGvedoEz/Omyme5Yf0izsyhkqZ3
	 BEOuPwqdCWEYESmZqEuzGoXLk8ySrk8OEbivY7fSozpKgDjFyvsMwutSE9s6rtR9El
	 KSSeDU/c/QF1HvvB4XWRWzixkGaOab+6i8WrRqzj79OZw3Wrhk8FhGYrwiu/D82mcD
	 utLzJYWR9oSBpSKUTc7XToUBZn+z4Bi7sOMSh9EMsvLhf03/hSrjwZF2SBEZzjzKG1
	 Y1lQs+viFhgOQ==
Date: Fri, 5 Jun 2026 12:54:25 -0700
From: Drew Fustini <fustini@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis
 compatible
Message-ID: <aiMpcbgFRHHY/Cy+@x1>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-3-joel@jms.id.au>
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

On Fri, Jun 05, 2026 at 12:09:48AM +0930, Joel Stanley wrote:
> Add compatible for IMSICS in Tenstorrent Atlantis SoC.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
