Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12901C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 06:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sh8Kc9bIgpsgglKqBW6mpO5o10bv88xliwBXQVa7nD4=; b=46qCH4DvzWm957
	RW5/YbtyfBc+xcKiVYqDMW4pkMAvPfpBJIeG8LBW/dHmkn3EGYE2DwWUyctOhjWnQKfA0iP4G8CJj
	mAMApMMQvCutHntInVwowRjgzmAe22Y+D/ObzZR+9BsOMU6zfxkgfkqGrXY+e7Eu9WceJ1MCxH6iG
	Ib0PiTRCjjSsEr46Uk0qRCCDPNudaiP3IOeW/H4ZdtMpeCYmgM9dNBYnlw61OuvWh7+U9orAdvFAe
	mUzApZwBy+DlIQEQ/5zlJKLRBwv4Mgck1Eu5jmhpfnNcic7AuFJRAITi5VztEKaZ9PpM5BA9ubZ9D
	Md+1eEzdfp4k6PO447mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDmR-00EHhF-21;
	Mon, 03 Apr 2023 06:35:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDmO-00EHgT-18;
	Mon, 03 Apr 2023 06:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8550AB811BC;
	Mon,  3 Apr 2023 06:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54299C433EF;
	Mon,  3 Apr 2023 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680503697;
	bh=wzluEvR07/Iehrheek73HbOQNPlcwZDSwVVMhYpLF/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+MzaLjuuylILtjgw54TNYfLhl5hpYOjQUiwdSE3anYeloxGna46S5TtmcRBpu12+
	 qxlU3s/6y/Hx/TqGBrGHafn3P0J7fev2i7kHsxCfBoOKClAO8259xknPzkZnKW6vXC
	 Jd4wIPzbtuL8bbRWuukNnsSLy73C8DcuL4vYDGCj1m2WEUOZaElpaPS3U2MWBbSqKj
	 5k9xuOujB5jYyI73LHF/CC6GcTO6w0t3PFuuhmUywRY1gX+bccudEn09QYd9GkDaYm
	 sOUY0L9G89XWvH9dbCt9R0mZjzyZN2d6rGz72fPCVWB6uDzJ85vlCQoDZovTddqwcI
	 VOboOEm215leA==
Date: Mon, 3 Apr 2023 12:04:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
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
Subject: Re: [PATCH v2 2/3] phy: starfive: Add mipi dphy rx support
Message-ID: <ZCpzjIrcKt4t93gn@matsya>
References: <20230223015952.201841-1-changhuang.liang@starfivetech.com>
 <20230223015952.201841-3-changhuang.liang@starfivetech.com>
 <ZBhTmTEcrV59oaw3@matsya>
 <2aa1bdbd-e37e-941a-9422-0908545c14f7@starfivetech.com>
 <ZCbloBdeffocT3Os@matsya>
 <d48ab612-213a-8d20-4b36-3f64f3d24721@starfivetech.com>
 <0dd5e35b-512e-41ed-af33-f94b7e2868c1@spud>
 <b07842e4-54cc-873e-3140-4a933e054802@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b07842e4-54cc-873e-3140-4a933e054802@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_233500_565955_200164B7 
X-CRM114-Status: GOOD (  16.88  )
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

On 03-04-23, 14:31, Changhuang Liang wrote:
> 
> 
> On 2023/4/3 14:24, Conor Dooley wrote:
> > On Mon, Apr 03, 2023 at 09:39:00AM +0800, Changhuang Liang wrote:
> >> On 2023/3/31 21:52, Vinod Koul wrote:
> >>> On 21-03-23, 14:08, Changhuang Liang wrote:
> >>>> On 2023/3/20 20:37, Vinod Koul wrote:
> >>>>> On 22-02-23, 17:59, Changhuang Liang wrote:

> >>>>>> +static int stf_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
> >>>>>> +{
> >>>>>> +	struct stf_dphy *dphy = phy_get_drvdata(phy);
> >>>>>> +	int map[6] = {4, 0, 1, 2, 3, 5};
> >>>>>
> >>>>> what does this mean?
> >>>>
> >>>> This is the physical lane and logical lane mapping table, should I add a note for it?
> >>>
> >>> Yes please. Also will the mapping be always static or ever change?
> >>>  
> >>
> >> The mapping is always static on the visionfive2 single board computer.
> >> Thanks for your comments.
> > 
> > What about other boards featuring a JH7110?
> 
> maybe add this mapping in the device tree, we just need to parse the device tree is better.

If the mapping is hw description then yes it makes sense

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
