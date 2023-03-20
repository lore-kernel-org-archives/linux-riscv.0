Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32146C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PByF5hf3FpnQh4mi5vPtA8TFDOMpdxF/ycgyhyzGPtc=; b=dGibQajQwbCUuF
	cjvhETcsN+ZalBcgzSXVdBvqyDO9FyVEbK+vGUOJGJT8sB0O+TlUiNPCFq29pniWvSR9s1n7ldlkX
	cekvi5nUnU2tNDKGIxhGMr2bgsnmkYy4PLaH0xCG/v+TXt7xf69+3qzb8WtKKFoU9RAOef0fQpVYl
	g2Fj39Bq1OPwrTYGKgv9LWyU3KMDTUk+LomJrItql4kY7/PwHNHhWzgjT/fvadFcE+Uu0TDlrwtoP
	3hk1ljTRoa8Asju1bvO13lsA6rj1blg9jMRzRgzdV2fqDJSqxhFtLDfC5cagBSx+ZVOBzDC+1FC1g
	3L5Z9EO2g+VPOTS7zRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peEnK-008zAf-2J;
	Mon, 20 Mar 2023 12:39:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peEnH-008z9w-2m;
	Mon, 20 Mar 2023 12:39:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D1C0614CB;
	Mon, 20 Mar 2023 12:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE693C433EF;
	Mon, 20 Mar 2023 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679315958;
	bh=4XG5NumHQKLf7FXfSZYEUp83adPFqOHQkgN7kVusg2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZ4FwmPJRa87abfQt+BW5QGgP2z4Fn9mlFEqZdMmW7gioonSgMDl34Vn2nFf1FcRJ
	 eHqbSNDDbWVk/8f50Zsf1ijUinjooB9Pngpmc1lUjg1c1osv6iuaTDzuADL0tRbQuJ
	 +7Hrwx2TKF9vmLBaWdzR7B43dxl7w7kagGNtKyXIUDfzPoKZNg5u0I0TINRkb6Oo3K
	 eWweZDcup8tHiets3d3n3NzNHbaXhFk0HE7MJGJzJWG1fpis5UE+bqNGy+s744LsNX
	 PSCaUz0mz5S4nM2QbvyxsXULT1ehPK+4LG6jNqT69HUht2QDShQbCiVDs+Uaj9soIb
	 uHc7PTATmHIYg==
Date: Mon, 20 Mar 2023 18:09:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add JH7110 MIPI DPHY RX support
Message-ID: <ZBhT8tpBhdFugurm@matsya>
References: <20230223015952.201841-1-changhuang.liang@starfivetech.com>
 <7e525c7d-d534-adba-4aea-a485ba37bcc7@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e525c7d-d534-adba-4aea-a485ba37bcc7@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_053919_936023_D1E0AB12 
X-CRM114-Status: GOOD (  15.40  )
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

On 03-03-23, 14:05, Changhuang Liang wrote:
> 
> 
> On 2023/2/23 9:59, Changhuang Liang wrote:
> > This patchset adds mipi dphy rx driver for the StarFive JH7110 SoC.
> > It is used to transfer CSI camera data. The series has been tested on
> > the VisionFive 2 board.
> > 
> > This patchset should be applied after the patchset [1] and patch [2]:
> > [1] https://lore.kernel.org/all/20230221083323.302471-1-xingyu.wu@starfivetech.com/
> > [2] https://lore.kernel.org/all/20230215113249.47727-4-william.qiu@starfivetech.com/
> > 
> Hi, Vinod and Kishon
> 
> Could you please help to review and give me some suggestions
> for this patch series? Thank you for your time.

There are already comments on dt-binding, please address them!

> 
> Best regards,
> Changhuang

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
