Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9807F109C047
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FVyxTCxey+CAU6I4cGpJrDeXM9TdPM8w7pBrfiCNGo=; b=X90tBhw141vmm0
	qpHtWOs+WNB8IZoPBFKbMVy5qtIV046U5uTH+SJ4hq/TpVfM8woKr5ijAamjBhvagMo9/byh0ZQlf
	jrHXGtSbqmO6x1PDdtB0BFt1W/4elcG3sEJDVRDgzM8igJ3Ev+XBV8potPIlWSIU87sJoWaNv7XmX
	H8IDhtRgJSb6xc+L1sxDbAImmf+Nl26aye99Ou8uQujhMoVlos03wnCNlydfiEOgHwepjozjuWCY6
	D6iZRGJB4th2XOdDO6TB6QeB+IurVcCJL8e1hJSbWlKs9hDnVkAn/xbchQxYKMSal4WJkGacmJhyH
	S4vxpbNwtmUOEfcJyACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f8O-00000004vk6-1P87;
	Thu, 26 Mar 2026 07:28:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5f8L-00000004viE-1n4u
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 07:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B43260130;
	Thu, 26 Mar 2026 07:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA48C2BCB4;
	Thu, 26 Mar 2026 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774510080;
	bh=w6bpMofaVIfUfpdCyZUipXkkuDkxq39ED9TKBQJNgu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiVgwS511+pR6Ojx6jhNRTBzk+/zVt5jMh1FNAnXe75DJrYvgxT+Nz9H78h/tUwEj
	 5odxiIoYv/QMzJ8IzdL1lN6HL/4fN15uHZAdmeO5Vg4HQTGFlTnoFDRQRIL1hzIJxx
	 6Y5Y4NO5fPv0oBFKkDebPl7FXIf3mBCnut1yT3LFqHKz1KEJWNOWWlzo2sop6PHNY5
	 oPg/mv8oWBSy5WvPC3nfy/c5HqZvGzUeUrxwpSsQbSmiLa+svuLpt0OBF9+Bitau2D
	 Dt1Fw+yPyC5LekiUkORJ6o2oRaH43yw93AzqIT37Fs2wI9XsG2fV7456uj7seD4hlp
	 zGw+RDgiff8TA==
Date: Thu, 26 Mar 2026 15:27:57 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Message-ID: <20260326072757-GKG777612@kernel.org>
References: <20260325-02-k3-i2c-v1-1-a793776b88bc@kernel.org>
 <6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org>
 <20260325234835-GKA777612@kernel.org>
 <2d0ef51c-c0c1-4670-9221-e0b62ca75fae@kernel.org>
 <20260326071405-GKE777612@kernel.org>
 <4377b748-9604-4470-931a-3b970e213735@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4377b748-9604-4470-931a-3b970e213735@kernel.org>
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

Hi Krzysztof, 

On 08:15 Thu 26 Mar     , Krzysztof Kozlowski wrote:
> On 26/03/2026 08:14, Yixun Lan wrote:
> > Hi Krzysztof, 
> > 
> > On 08:02 Thu 26 Mar     , Krzysztof Kozlowski wrote:
> >> On 26/03/2026 00:48, Yixun Lan wrote:
> >>>>
> >>>>
> >>>>> +
> >>>>> +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> >>>>
> >>>> This is even more pointless because there is no user. Dead code.
> >>>>
> >>> reg_aux_vcc3v3 is used by various devices, but I can drop it too,
> >>
> >> Which ones?
> > To be precise, I should say reg_aux_vcc3v3 will be used by various
> > devices in future, but not in current device tree of mainline, e.g, 
> > USB2.0, PCIe, 10G Ethernet, Audio..
> 
> So it is not used by various devices. I just wrote - THERE IS NO USER.
Ok, I got your point, thanks for the review

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
