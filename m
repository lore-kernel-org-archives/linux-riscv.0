Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB8BC98318
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 02:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCO0ymMpFfrymOmFyugI+m4VXvgs9QYm3KjEti4l8Ik=; b=KelzGuHK05deur
	M0ILuINgH2g/Xk1Qfb0y3TEFp/safibpKfcqN2ZTWy6cHJmjWaDMj4OdlvZgBJnDoze1QZdzO4LZN
	QxI+3jLCsB0bestkXBTk0QjkkLjeR21dUBoFhJqflqj99ZfHsPfnZwfTkyon+9oQFR8GV93Wn7BmL
	AyLyFOFOoIfOywVHEZuti/43hGhHavAPBj3BxjmnIsjj5GxTmVaGi/c6Y5KdgEW2biaitr9eFQFOK
	/owyPMcJ4Rw9zd4SdSqzw7bexxQmp1i8tkBPRyrj6qvCDUGjkQjUQ5rofVmzbh9JrwAR5o7svrOAX
	kAzdZCXeYgpvIZ+BKHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vNZ-0000000CWxf-30Rv;
	Fri, 25 Sep 2026 02:09:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vNX-0000000CWxY-3nZA
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 02:09:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E7BC6022E;
	Fri, 25 Sep 2026 02:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A196E1F000FF;
	Fri, 25 Sep 2026 02:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790302174;
	bh=lEL7RjYejIrWAwKkZbGHqb91M2mSRkyiPtdwFTRkUfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NjvVMfzuQCo1u9YBX0Kqq6OQK8qMet0GOlgyftH8Xn5HAFe4a19psJzg8db7IDl3y
	 MGfBw7+mCm+4acLgm2C+IyYsVAgZO+IVOwWLOWiqndh0FzfEoJriPO4mA+p7yy7l+t
	 78DGZRlhCVkcSpqEUxCHKCv4eAwpJSEsyehM/qmNIGbPy0PtYDGdFqPHf9NXzAdoFv
	 8eBbH3r57ldzviReBBmTK2h7yx9stzZ51ReVF+ZJ5c6eDvYJYpZPxx9gM+yaRJ71Rd
	 ekx61NS913qmU4GdoXSZ/NFrDyCSY4BIX+k9wa8QYLnpw6CiS5Qo3SCww98BF2wS5F
	 vqkZjsszoFDKg==
Date: Thu, 24 Sep 2026 19:09:33 -0700
From: Drew Fustini <fustini@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Brian Masney <bmasney@redhat.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] clk: tenstorrent: Fix refcount leak on shared gate clk
 enable failure
Message-ID: <arXX3RkaFvEwTySN@thelio>
References: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>
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

On Thu, Sep 24, 2026 at 10:31:51AM -0500, Anirudh Srinivasan wrote:
> atlantis_clk_gate_shared_enable() increments the refcount for the number
> of clks requesting the shared gate clk to be enabled always. It should
> only do this when the enable for the gate took effect in hardware. It's
> possible to end up in a situation where the gate enable failed, but the
> refcount is incremented anyway, so subsequent requests by other clks
> that share the same refcount get ignored and the gate enable is never
> retried.
> 
> Update this function so that the refcount is not incremented when the
> gate clk enable fails in hardware.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/AS8P251MB00013BD9A093C06D2D60E10EC8B42%40AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
> Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>

I will apply this to tenstorrent-clk-for-next.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
