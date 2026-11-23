Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022A606A331
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zl9yy3qv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dk2QAjiR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a61EtpMawzelDpA7AYkNIBqTZfFox7oykdNBCqUoZzs=; b=Zl9yy3qvA58Jvq1ZTu+BZ7mz79
	fOLZ3K2bsHG1UZb9q1CGYETzj/XFPCtiihm1VqPNLlbMpSaLFtkrnH67RFj3rXQ64dkCenHoenypf
	jeUOtUI0AxYPvHouw+TuRYo4ebNniNBOUUsIQlNGb//B30BsZ4Sjsn5SXYRx1x+1eakAsqMCbUtZO
	LtV2Nw9PYBz/FMuhoTQwdmrq/+SXbMPyAXNp2RAKoRE0hg2s3mvty+U3xeZOkHxsVNSpWV+6EG2Ul
	kNg/e3L4W7WRbyn6FWPsmfdnUSldAn4+21EPQf7fGmEIfyq6Uj5cvg5eVnVwv3MwIOYxNz+CNvdv7
	glqjLeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSrI-00000003Hw5-3qxX;
	Mon, 23 Nov 2026 12:09:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSrB-00000003HsJ-49bp;
	Mon, 23 Nov 2026 12:09:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56A7D620B0;
	Mon, 23 Nov 2026 12:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82331F000CF;
	Mon, 23 Nov 2026 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435752;
	bh=jVlva3tLXdBvj0xTe4FKUpeZOW8lUXKWogIklw4JJwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dk2QAjiRAqck4u5mgcf43nHan6L+gOBuX9pht3YrjJTiNTsU9Zp1iVx94SEsBM5wt
	 ELbvLjdSGKZSLvTL6UAhw9MMMH247X6kI14+OIKt6kBsgbBn4NpNBKRA/AUnwdw9c4
	 KzCpgReRLOEfXyzQPS0VRCbjaw+RiI62FG5hD9hu/9j0QXNRHDOcyTG5+IyDvN6Upo
	 HwaP0VL+MyB1O8afnqzeAAPVyFPoOEPVJ6jEJV0BQKfFh1eSBp4ENpoLrrqJKsNU+i
	 LJp++Z/x/IEO0zTGIZDswSK6OFFbSUlHCGOpQJug7tXCr3Z9UoNWU4g2L1du3qONWK
	 Xw65fHkoW6bRQ==
Date: Mon, 23 Nov 2026 17:39:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Byron Stanoszek <gandalf@winds.org>, OOHehir <oo.hehir@gmail.com>
Subject: Re: [PATCH v7 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI PHY
Message-ID: <awQs5JgFZko9rTo9@parshuram>
References: <CGME20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb@eucas1p1.samsung.com>
 <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
 <b6dc6c36-9ce1-49dd-bae5-245d983610bc@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6dc6c36-9ce1-49dd-bae5-245d983610bc@samsung.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20-11-26, 14:43, Michal Wilczynski wrote:

> Gentle ping on this series.
> 
> Is there anything else needed from my side ?

Can you please resolve the shasiko issues reported

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
