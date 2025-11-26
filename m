Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B22FD10F5F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnemEG+T2OalXIApD2MGdh5KQ/iU9WvcmJN9H/kxGkY=; b=T+Bm3b8BJceqmE
	nT/Dxj4B7LzyVdg3GSSRxquZtlF5+3wpq2vd4DnHDp0IJGsVZVhKmOx1fT93ODkjio/S4UJHk11rm
	jtqlGxrm5T8XEca01IvMUb59wwTioUAwoUtmz/BMwRUQ+Xw65N9fW8fXS2lN9GfjG/Hfxnfq9hzxI
	sQxGxIC4yr2ce9d+Qjf9h3c131f/s46vmh1p4843WuSscs09BSCDO6vuqQg+6BcfhY+Z0xwtq5Edu
	gHu5fkMC77e3Ky+qfhOpEMcpI4N78QbHKEGCBP93V2i2CoytZWAeywhNOx6SumSsFGyJd2qz1KOB6
	VsXvcGYGdG+dBA4dHP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHkH-0000000FCjL-2M7w;
	Wed, 26 Nov 2025 15:47:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHkF-0000000FCiZ-2ZMT
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 15:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9F9F439AE;
	Wed, 26 Nov 2025 15:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8D2C4CEF8;
	Wed, 26 Nov 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172070;
	bh=Lb752BiCA/EqAjW2BAoQTm961QUYQ0BrJ9YL9ZNR8Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJee7PBP36gfGimlAHsY6NQW2RlbUzjd4oQ/pOnUNu78WzRVkW75bZK+EEhoCp2cM
	 SJ1i6EI4+LJZeqcJXcOb3hfZAEjBP6q7jtEcSgvDExB0xnf8B1SjvymuAcpZaF/ksX
	 GM88PgxyCfkAl24G/O9MUSuQkP+ZYTKwLCgpslW4lRK3KJF04UlkXqNKGFDL9oS6IM
	 p7Lu6Ck/lJ/lCu/eBHsOgUmJ5Wxl4NHsHi6MDIvU7UkFlRoTu6NK9LaWQ/OoOuPZBT
	 Xwli7k8T3Olrf/HEQnOvipuKEE4tQri7rcMOKu/YwYnaZ0QDWN/ZWKweyP1TvSBchA
	 i2+cvLnrckLYg==
Date: Wed, 26 Nov 2025 09:47:44 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 5/7] clk: thead: th1520-ap: Add macro to define
 multiplexers with flags
Message-ID: <aSchIJ7hp1hBuahM@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-6-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-6-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_074751_685828_0555EBF1 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 20, 2025 at 01:14:14PM +0000, Yao Zi wrote:
> The new macro, TH_CCU_MUX_FLAGS, extends TH_CCU_MUX macro by adding two
> parameters to specify clock flags and multiplexer flags.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
