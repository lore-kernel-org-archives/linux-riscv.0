Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D21C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 23:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L412r7d29tpO6D4HAl9BzNqaMAXqvqO+ON31oqH5hk4=; b=FQldEOJ9a02sPO
	Lxc0rGQvD9IgawYVuXrtzy/ZX4qbXKm0/T2JHb+TNqZx2VaDiy4KQ6RgEL0zFo3ZnlwAJNzabuTpA
	eBUAMtUV3W/uUq01LuwDbrrLgdXnnJ8I5e8Zq0zwU1qx8Ei1ccBKN8EqB6vLKQhxF18f7ZfIPYOpl
	NOINlDj1MFYXmfc1u9IgJcL7/fuZHAuU5rBhpdUFrd6e03UxW4vTSZrmDVFxeNeQe9V1hvppbp5Cj
	9c57CtagKgFja7aSX0bAYWTuqS10MHsfZbg5oVDrHf5mxyvI4Lk5Zk+ZRrNlCd0gMEES1rY4LB5kV
	JvkZJc4b9y8LgrYM6XKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRgZS-0000000C3de-0EGf;
	Wed, 10 Jul 2024 23:17:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRgZP-0000000C3ca-1w5a
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 23:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CDEF7CE17ED;
	Wed, 10 Jul 2024 23:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC90EC32781;
	Wed, 10 Jul 2024 23:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720653473;
	bh=67AV/g+XqsyhDAFqbAi12LGCJ7fOFWXjzSEQ2K49hOs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nefAygc3iGJngyPBt92Z+opttJ4pacy7p94Mca6aQ5dkVGqItLy2nbdt21J4IgNfm
	 fn3+TnIohJNmhpurRk/T+vtr1w7mtn2zyFJQh2Qk36+aMO+822V5H0fVFNjKcXsrIc
	 NyJjzNAbM6RSyzDd6q0FkdmB9ck5ogeMhXsf5IpvF/EKQVpvGJMA8ly4YXcgxqbIOt
	 dfTHBaSLRTUHwqdVn1qHmZ3q4fyKzOjTPbjp2bSZ0o5SOjgE0e8bfXyD7+F2OWoID0
	 2i4j2IM2Ud/3yvWwscI7+6o7P7n0ThMklJErgg7Hmd8DiNULJiXJWBIT3XeRMtets6
	 T1QD6f/6uvgCQ==
Message-ID: <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240623-th1520-clk-v2-1-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com> <20240623-th1520-clk-v2-1-ad8d6432d9fb@tenstorrent.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>, Conor Dooley <conor.dooley@microchip.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Yangtao Li <frank.li@vivo.com>
Date: Wed, 10 Jul 2024 16:17:50 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_161755_696485_B25239B5 
X-CRM114-Status: UNSURE (   4.98  )
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

Quoting Drew Fustini (2024-06-23 19:12:31)
> Document bindings for the T-Head TH1520 AP sub-system clock controller.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> Co-developed-by: Yangtao Li <frank.li@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
