Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A166CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EUyXT9ZW6irbQDw7wvWokOnzYH3plhPh97AHvlmk20=; b=Ci4dXFij1wb1hd
	FXGxScUhgHYXZEvPK0N+K6G0TRtN20phxK8mZ8tToE4b+/abqAqfWNgo3/z7XeH3dgVjQz8e6pgHE
	GQet2Ds/hLyoxXIOEDvNkwfu7FHYuMXDacZTiFIh1JIiTWObDbqC7lEUq4npuowY4z8DD0i8va7Ae
	7ELvo0RsdpEzKGDTCZbPORzfvlAn4YnzZ/f3/fWFDhA6YxnulU6uCBn/eJNoTD/JXtOqbzohY3cDr
	fqCVz01sA3EH9DJtU2qFsJ65lN3bhLWSIFw+mQwoVDlbmC934PTWc2Vsm/31cck/SGl6A9jTnmJXw
	+BQz4gRsfzFGTBrgJbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSan-00000002kEs-47UV;
	Fri, 22 Aug 2025 14:18:09 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKoZ-00000001ddm-1cRc
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 05:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=muTL
	R+uO1apVyAZkBbYYZe6gE3Jd5HWWcO3c7R6cA9g=; b=CD4BCs1PRkjTCCYhPycc
	34kdjEOjYanOh4U654+aGn6BZHBbuPF+jcC/cv2aS8DWV8Jct4EOIkwCUOs0WgHR
	seR6tPavlBgjL3wwmOISzO9W8uvnhAJHNUDRBxm9pN1dgVA4fdyTjunEhDCnUokO
	tB00CVhfMFWHhQFHD9kg91SWyAdPqZ7J6pkoslduLsz/z0M74LR7DRpikfxMuYt2
	q6OmOHPTWk+doXL6W57nrnVLbA53X+sSSnl1a/j0gTKB8/gaEo4t6+3HReiK0Rjj
	pSHe2u2FILIEH55eX2T0BF8My1ZxsW2P74nrg0vyNFnzpHHZUKfn4Y2OEMkK3JDt
	2A==
Received: (qmail 3778719 invoked from network); 22 Aug 2025 07:59:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Aug 2025 07:59:46 +0200
X-UD-Smtp-Session: l3s3148p1@KHGr6e08GtDUtcd1
Date: Fri, 22 Aug 2025 07:59:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/21] clk: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKgHUXzK_iSfjP7Q@shikoro>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
 <aKeTq1lJ549a2jnQ@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aKeTq1lJ549a2jnQ@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_225952_307607_4F992658 
X-CRM114-Status: UNSURE (   7.43  )
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

Hi Brian,

> These all look good to me.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>

Thank you!

> Should drivers/clk/sprd/common.c also be updated as well?

Yes. I wrote in the cover-letter that a few occasions couldn't be
automated with my coccinelle script because of the indirection. I will
fix the remaining few ones manually, but I didn't get to that until now.

Happy hacking,

   Wolfram


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
