Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E4EC001DB
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Aug 2023 06:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Zovi+AmB//R+S40Zh4IyD7mEEjeH04xm/tyzFI67pk=; b=XxTvL1PzEpilat
	RlE3PuTrPYweKn3WWdEO4Ls3hYMWy3Fm3vS9fdTDiQclosMWaTkH8TCxc/SoVguIxSNdJX0Is6vo7
	mkVDrhs4+7eoawo+XXEDCGEcXk2y+wJX6s+zd7JUhk6xetpoXa74g6dixplRvmY6bKTWGh4k0w+1z
	dKYjcfnIolb5xpClM1DPUa8xkMt/IsAfcyEobHOQy6pmzB5x7R8zDUU1h8E0Fzt1IWDcmGNTgkDV6
	lDlTxOu07k5T6NYa4DzMxqm79bVdaXkGgo2uCrMgB+6L6ufzc1Qa2+4tWKqisf33jQ2p63Peg9Nbu
	PRoCATTYXTVcI6f32b/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV4Pa-00EXza-1Z;
	Sun, 13 Aug 2023 06:17:14 +0000
Received: from out-108.mta1.migadu.com ([95.215.58.108])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV4PW-00EXyQ-32
	for linux-riscv@lists.infradead.org;
	Sun, 13 Aug 2023 06:17:13 +0000
Date: Sun, 13 Aug 2023 16:16:40 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691907425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGW+uEtQIIiysgEl4d9oH5pQEw9oqmQWs9ZMkCRYRdg=;
	b=tYs+F4/7NlUNIjNBlMNFZeFTyU4zkuLFdyt1mSh2AcPir3KGnaEsZ86DOtOF7rfyRUEyo4
	JCue7/Tc1C6asomXlKZ5uR4db7svbba65M8FgzmnkXWTZCe+qVhTkprcepOVrwkpUQN0jw
	Ee1m/redEKiHt7mql3UekWoqKKo/pCaApbHC2Vue81crqfEbhP6LWCXHssm6EG427x7KWx
	bmc1fwoOYIqxqdgjAY0kfx5ZD62AQLhELM1nVrHBmLBQnkDzDvek5Vbpbp5HT/clHJj26o
	i8K0tx1pQQzpwmeOP9cLBN7fAbwBLlqAj7b6jMN8huaTC2LNWncN7Fl0Bzj4uQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <ZNh1SJakNFqPLrwa@titan>
References: <20230807191952.2019208-1-contact@jookia.org>
 <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
 <ZNhau0j_tV3EXGxl@titan>
 <CAGb2v647FoATnjk43GKqVihX-FtZN+7XrxMMRseuqap0MBg2FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGb2v647FoATnjk43GKqVihX-FtZN+7XrxMMRseuqap0MBg2FQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_231711_694220_D8CF2291 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 13, 2023 at 02:14:42PM +0800, Chen-Yu Tsai wrote:
> Applied. Please check here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?h=sunxi/dt-for-6.6&id=f05af44f691351bfd954f39ec376666dc5e1b869

Looks good to me. Thank you.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
