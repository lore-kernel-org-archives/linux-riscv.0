Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D39BC55838
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5g7Cs2YIiUxTEMf83f4p+KMH7X/abVk5YWG6OFjjwA=; b=pfCoS8vByMYNKH
	oCp5W81B58MNiIHDMnVsAMMA0b5bfWJlZRgACU++QjGjJ4QSgVRUqHZNuImHnsIqXm/9ZzRLM4mXV
	BSZ0TzZqmCKmSlRWhuo1mmY04VfE3D4E5Oxn0U6J0OLa19fzgMfDDGOL3+JLJRGZ+g7kWIQDO53fn
	+6Be1JrKBxHKtGcqCMIhjCsVxg/jv+O04bVS9VM7S1lihLNmIICKVJtWwHc9rv3WHirokn8IVmbow
	9jwYUu/lI3votaOoTwEy/PQNehAbzj5hi6+59gvedHLVHp9xwDeMrDt3g73QWCvKpVt9+BTlgtGpP
	mUxvJi2ASnrN3gCDnbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsoh-00000005AYA-3UOD;
	Thu, 06 Aug 2026 07:47:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsog-00000005AXn-1yRI
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 07:47:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DF3F43389;
	Thu,  6 Aug 2026 07:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EF61F000E9;
	Thu,  6 Aug 2026 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786002421;
	bh=wMtX1g4kQRvpe1oyjMd1Y98xwvIKo8+2Xvfan9kHoZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G9k7hpxsq8xdO4+APUQWizUbYHmbvUum1id7Upke5bpFAZdY7TJ29WvAlemc2yWs6
	 kiu6B4db3jetW628b90l0cwlX3dyAPIUkYcDCcDFEFVA7Ws0oPN1SN9XO/7gSPAWxp
	 BQhjmWjWkvwWS+6JPfCT0prmpcT4tcNtY42m0sGP6VxkE7vIkdGrU5mO1bT2NOGjes
	 a/HFUlN4mQKPIoJWY8DT258ZFy2EgcicmK2dbsjvJYSnfOUJGay2tR017BQlVfPElT
	 4g9L3nRApPNnZ8RxEIzBVr8ALqE2DoL9tqsAz2oD/Lt90AsJnh5kU2QH94nE3qVBq6
	 4vJZUKcB6G69Q==
Date: Thu, 6 Aug 2026 07:46:57 +0000
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jennifer Berringer <jberring@redhat.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
Message-ID: <20260806074657-GKA229492@kernel.org>
References: <20260806-08-k3-ufs-support-v3-0-037fb322acdb@kernel.org>
 <20260806-08-k3-ufs-support-v3-1-037fb322acdb@kernel.org>
 <20260806-prudent-vole-from-valhalla-3eae39@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806-prudent-vole-from-valhalla-3eae39@quoll>
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


On 09:05 Thu 06 Aug     , Krzysztof Kozlowski wrote:
> On Thu, Aug 06, 2026 at 02:56:18AM +0000, Yixun Lan wrote:
> > Document the compatible for UFS (Universal Flash Storage) Host Controller
> > which found in SpacemiT K3 SoC chip. Its features are listed below:
> > 
> > - Compliant with MIPI UniPro v1.61 specification.
> > - Compliant with M-PHY v3.0 specification.
> > - Compliant with UFS HCI v2.1 specification.
> > - Supports up to 2 Tx and 2 Rx lanes, up to HS-GEAR3 5.8 Gbps per lane.
> > - Supports standard low-power hibernate to reduce power consumption.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> 
> You keep having the same failure for every version, no? Never responded to it...
> 
sorry, I should respond in previous series

for the Unexpected 'CLK_APMU_UFS_REFCLK' error, it depend on UFS clock patch[1],
also I've sent a PR to clock maintainer for inclusion to v7.3 [2], It should be
solved after v7.3-rc1 if all things goes well

Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-2-cf7521d1d0fe@kernel.org/ [1] 
Link: https://lore.kernel.org/all/20260802014217-KYC2734409@kernel.org [2]
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
