Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B938C3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 05:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFHc2wPYpdEygeiflsnxi7jjEui2BXXWgLS+GOkOzX0=; b=adb46dKx6BSp2j
	RdlNmKJZh+Dt2SSj2P/gdsrD3aK18caE1DCJrEaNTVxZu5HN6SYhB+lGyFZN+FGte8T5fGthhflHb
	ZN9UysOfGysAEwaI780nnuEsaoQUBaDb+9g0F/9+p0a6tWramKYTTkQ673RRtEvw4gWeCm6G5HIq6
	R9LL4YuhagQX/c2rtCDKX0xMH8rLPensq8EFXI9spXMAaqZ+SmoPQpDDdVAItNROSeZ/8KggtlIJs
	Wxo3Lc3nMe6+OcrB8J+daSvIr+Jx0Yauq8i3IJ4VlfTQo/QS94oHxx13IuiJz82aa0k1euR8x9rit
	5lyhdgNnhKNdq4SlG6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEhn6-0000000BLuI-0Qgv;
	Tue, 13 May 2025 05:02:56 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEhn4-0000000BLtr-1rzU
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 05:02:55 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id A2F3B12FB43C;
	Mon, 12 May 2025 22:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1747112573; bh=pmGvFHuiA36wKd6QquoJOIas6H2vuUJqSpbTefp3dbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGs/vfV1iC52O+WkyE/wYDMnLrJ3APRv4bTF+gxydJtWry/9ShYrlF+lp4d2bryAt
	 B0mI49+HtWdxvnbXHFY1AgZJZTInRE6IIEq3ahR+mqOMCCM7pEdYGpXUb4nFHvBjyZ
	 K3+nUgC7av0W4ReGkm/Q8SK7DHQWdE27rpY869Vdp4pm3wdj6PTVyrqPr/EfnxrFmo
	 +UiBTvewauOW2Oq4jpZ4kZBcQR7ZhFXH272aP0hUQ9vjOUS7x4zjo6Klh/gtWIjJXG
	 fn/uQUBMp9mpMRx6PQ2bfX/E77ddq68Pm+50V60+ny1BA9cce8zmXJe51fZ0pUZmO8
	 WiBCZF+BrA2qA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e67-jXa9ihwv; Mon, 12 May 2025 22:02:19 -0700 (PDT)
Received: from ketchup (unknown [183.217.81.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id CD09412FB430;
	Mon, 12 May 2025 22:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1747112539; bh=pmGvFHuiA36wKd6QquoJOIas6H2vuUJqSpbTefp3dbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMSinbuvmBlIB3o55y//CuXRRaaeUjcWmLfx3o4KOUTWfjyFaaYjVN+fPv5KX1yFt
	 NagZC9lR1Lhm0wjyx6quKhNsE3NoYMuM8p3Sp/i8JoKcw7UWG2oRI042Z+U2qFfugy
	 GNNTQCoDF5Kh5AI13q0VJiSY5GaICGMnEE+tmFonykLKhTn6uXB0zxn+CH+0B+dsfR
	 K0L7Mvpishm3Shk99WFEbHEaEz7hMVH+Olab9dj0pLfOqN1xIREMo4Di66kLv1YL7j
	 ZTCzzEkRqborJ0Dk7rCDe9hr6JcV+94wyJxgYHXy3AujGXtaJZuAjxutbHYOATk7dj
	 TbBQY4nFYRpBQ==
Date: Tue, 13 May 2025 05:02:12 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] soc: spacemit: create a header for clock/reset
 registers
Message-ID: <aCLSVB-AIF-fg_2a@ketchup>
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250512183212.3465963-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_220254_504966_500B1F31 
X-CRM114-Status: UNSURE (   9.51  )
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

On Mon, May 12, 2025 at 01:32:07PM -0500, Alex Elder wrote:
> Move the definitions of register offsets and fields used by the SpacemiT
> K1 SoC CCUs into a separate header file, so that they can be shared by
> the reset driver that will be found under drivers/reset.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c    | 111 +----------------------------
>  include/soc/spacemit/k1-syscon.h | 118 +++++++++++++++++++++++++++++++
>  2 files changed, 119 insertions(+), 110 deletions(-)
>  create mode 100644 include/soc/spacemit/k1-syscon.h

Reviewed-by: Haylen Chu <heylenay@4d2.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
