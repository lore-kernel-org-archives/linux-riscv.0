Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865E1C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DlYPSKBBmjabJxBlFWXKXo3TMSShGS9Jqep2wm/hvw=; b=XCSvmYD0sxgctv
	a2jT/0fjaiY8FPXmaDfLPbfsv/6iI+qgkHV173PttBSiOLsLl23X0jyOeOZBFB276ieu67TkdzI/9
	fufJZEwYZ8PM93AIKJDcOQMj04j891kbCcPiqsHDESVaZ9xNMIDFHsvvCjU7FRFiHTfH6JCXsNG/b
	QRTT6ro4cwUO9F1XgpOZMMgWILnugmOYj1/TJHBQZTjpoHnZuwHdg3g4ZAMQmZhVQo/fL8ezdOP5l
	wvdwVEFZZzZRWLDKYQaESVCPFbmqAsk5zuiQj2fuVYmqe+qMQCYnoWGTar2U/ptspo1K0Zq+VhZg/
	y9+T/mXOE3en8jrV7LsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXS96-00000006hig-1B4W;
	Mon, 13 Jan 2025 21:38:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXS94-00000006hiA-0CtK
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 21:38:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C24F6A413E0;
	Mon, 13 Jan 2025 21:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A49BC4CED6;
	Mon, 13 Jan 2025 21:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736804328;
	bh=w6tQer2H9E5lAytTcn54eiBAQkRiDegka1BvhLsS1QA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Madu2NgzwsBgKlCfASeAakm1vHbNb+kPyeEDLv1dGbiobFq78YFAS+SPZ0ZFmfO6l
	 HM9T76Pbg39Okm3uyMkLVjoIBOD8uRnCEGXEIb99HL9eZZQpW9hgyVOI79fBNZLAZ+
	 WUt+wkMUGtvoeA7yjLOQgDRdhHMcTwRoSkeYLpr7wlPWS1p4lKt18/p8foiA9D1nIG
	 PSUSJq0Sl0zlpJkWZpP7cXsS9UXM9Er8KnwalWFv8QX3RYx/XKF+/nhz3HvEyrXijC
	 NH5nhxN109IKUBM6EbFv/rUdwFGqU6MxmYWgTkYGv2ssMHjHnqN8EsrzsKTAOqH9bW
	 ZlwHzyB0D0+Fw==
Message-ID: <e731844816fc1b6b067229189e033b7e.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-1-0b08fb813438@tenstorrent.com>
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com> <20250113-th1520-clk_ignore_unused-v1-1-0b08fb813438@tenstorrent.com>
Subject: Re: [PATCH RESEND 1/2] clk: thead: Fix clk gate registration to pass flags
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Yangtao Li <frank.li@vivo.com>
Date: Mon, 13 Jan 2025 13:38:46 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_133850_151055_C8908760 
X-CRM114-Status: UNSURE (   5.82  )
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

Quoting Drew Fustini (2025-01-13 12:31:24)
> Modify the call to devm_clk_hw_register_gate_parent_data() to actually
> pass the clk flags from hw.init instead of just 0. This is necessary to
> allow individual clk gates to specify their own clk flags.
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
