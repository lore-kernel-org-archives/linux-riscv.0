Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF616CA5FED
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcv9dcXpmai6kJLMnXDMG16uqspO7O91O977Xt25bRg=; b=mLuAFrElHPtlpO
	432mWjqTdTsxWjyxZt0dv5gxpXft20ruu/7Io/J6mKBR2tNJTzE9OGnakgVReCImAnR4eshXjw25k
	MUGQlOUKbK6Q1NjkAnI1GMSbn8R8Z5y3ydgXIdBPHOzRGat+s0wn+WhDWlV35GiqABIy2OA0TmaCl
	OvMblVxY+93Zaj/A208ySJqwlh+fEwi7GO3Jrkw8H+e1BYmTprk2Mm0wYjIiXrRVmBuJti4TFNnOR
	uvhk1qROs0QR+PIanGFoNX2vdeAB5IGgvhV4zm2WbFVety7xY/lR/FREsku0R95//2fJctF/ds9WN
	GPq2pklUFv5ofTXvcV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3IE-0000000Dpcn-25We;
	Sat, 03 Oct 2026 17:13:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3IC-0000000DpcT-44PS
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 17:13:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65A8C40100;
	Sat,  3 Oct 2026 17:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44AB1F0089B;
	Sat,  3 Oct 2026 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791047580;
	bh=kAqQ4xinSUc4yXroGj7gCvZiryGMGvyGCvMOHkjDy00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvO8/u/AJo5x7NQgWTKQoTYjmgerBXtpVs2UYB3Bu2l1+mBxwSDC7LBTKTJnciR9k
	 bhDYswPucwQML97aQ/3FoydfM4DYLintp2HnQpPJ8oSK9DMOb6DIbepPKuufOLC3zi
	 7WZxBqQQVcgimuoJ+5Spsvvee5OXytw69WsuhNJZpAraPGVieLNUG5PgxUCbYa6q6n
	 /fxHUrQx94FRXqZW5kbTW2ENQR0FWiRf6EI+rhOMR5D8ke3HVcjMW9qesmC0IJ9Ax0
	 QbgkmBRSX/Jg95TtAwBvGQWMJTln4TSuUXAGTKIHuKPEpQ0BUOOc6pbhxGD+WKUHzN
	 wpHaSD6ZVZ0ww==
Date: Sat, 3 Oct 2026 13:12:51 -0400
From: Brian Masney <masneyb@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Aamir Ahmed <elb12345@hotmail.co.uk>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Peng Fan <peng.fan@nxp.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: tenstorrent: Atlantis PRCM fixes for v7.4
Message-ID: <asE3kwpkTGM7L1JI@x1g10>
References: <asCtllTmVqc1ZDBK@x1gen8.tail89d63.ts.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <asCtllTmVqc1ZDBK@x1gen8.tail89d63.ts.net>
User-Agent: Mutt/2.4.2 (2026-08-30)
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

On Sat, Oct 03, 2026 at 12:24:06AM -0700, Drew Fustini wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-clk-for-v7.4
> 
> for you to fetch changes up to c64b54ddb692c30b8fb139a2ead32eb4db7faef5:
> 
>   MAINTAINERS: Update RISC-V Tenstorrent SoC entry (2026-09-29 12:06:41 -0700)
> 
> ----------------------------------------------------------------
> clk: tenstorrent: Atlantis PRCM fixes for v7.4
> 
> Minor cleanups for the Atlantis PRCM driver:
> - Set the onecell .num before the first store into .hws[]
> - Only bump the shared gate refcount once the enable has taken effect
> - Use regmap_assign_bits() in the plain gate op
> 
> Also update MAINTAINERS: add Anirudh as M: and change T: to kernel.org

Merged into clk-next.

Brian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
