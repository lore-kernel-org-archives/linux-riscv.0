Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79350FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 02:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mS1GWfm4/1qSq8WyzfXqCvWJcZgfXYE5kj2pW88hS7I=; b=zDyq6lQu5a84lD
	rTqLjdqk4cnQuEp0bybS5Cc4b8vZqQppN5s8/1VaaX4xeL3Iltqd04leNB4lJU06Qb3ceKEgUTnRE
	QWcnfh+jfn7c21/KahF75CIbj895fgIjF61mBbfB0vsGOAt4EDWwvRrTnVRME9BYSSqkU035845C7
	jr/zf4PwZgChh/DE7+FcSuxe/Re3Lh+h3tD2VSH5Z70Vf//nL8wk699e0dxeO3iVaHXSUaSp7U27V
	UPUCPpD0gHbAu1OvsXQ/wiGkmq6XjDuHZi9h8WShNw1xMNJrzqJYa0rD0LOnSl3SOyWfYoeIz0Sb4
	Oz+k03XEBxmO39gKWaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGlb-00000004Pn7-0Eef;
	Thu, 30 Apr 2026 02:04:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGlY-00000004PmD-43bG;
	Thu, 30 Apr 2026 02:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38DE46111B;
	Thu, 30 Apr 2026 02:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746D8C19425;
	Thu, 30 Apr 2026 02:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777514675;
	bh=a++YbQU7FRs0I4k/4YaT3TJqWIFkLlG6YRMDY9dCTQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STgN3oCruI6nLZgGJYguv7aaC8yIHWjXDkwuOm5EOsbfjAbK/Y7wX2fo5zVHG6dEz
	 4TrPuODwCZF9r88CI2GpMxTap5isMvLp5ztV95vFPT5u3kpvbnGgpmr2VVlFRi4NFk
	 gk3rfdTBQiB+qPUNHV2/aCUI9SHYukSfMSvvIXEuRm+34HxC6kJMAdQZeA7JIMpgys
	 yUVEyxrPyBD9jsHShIgkP+V+tTJuiBZRIItoHPPN87ozw+P1ZrO+pU0NqUV5KQ2HKL
	 yl6beHOEksT/+ttHAPwSg4GzO6iSVPjrlGiuOpH2D+E7TL7V7dlFdgvCSQIQEfW21j
	 tqwg4emlOmEmw==
Date: Thu, 30 Apr 2026 02:04:33 +0000
From: Yixun Lan <dlan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v4 0/2] phy: spacemit: Add USB2 PHY support for K3 SoC
Message-ID: <20260430020433-GKA3230719@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
 <20260326001443-GKB777612@kernel.org>
 <20260401130713-GKD976850@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260401130713-GKD976850@kernel.org>
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

Hi Vinod Koul,

On 21:07 Wed 01 Apr     , Yixun Lan wrote:
> Hi Vinod Koul,
> 
> On 08:14 Thu 26 Mar     , Yixun Lan wrote:
> > Hi Vinod Koul,
> > 
> > On 01:00 Thu 05 Mar     , Yixun Lan wrote:
> > > The series trys to add USB2 PHY support for SpacemiT K3 SoC, while 
> > > patch [1/2] implement a disconnect function which is needed during
> > > next connection.
> > > 
> > > No DTS part has been inclueded in this series, instead I plan to
> > > submit them later while adding USB host support.
> > > 
> > > I've collected all patches and pushed a complete review branch here[1],
> > > for people who interested to test easily, which include DTS and necessary
> > > changes, other patches may still need to improve, but sufficient for
> > > verifying the functionality.
> > > 
> > > Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [1]
> > > 
> > 
> > Just want to ping this, Can you queue it for v7.1? Thanks
> > 
> Ping again, I'd like to see USB2.0 support in v7.1 for SpacemiT K3
> SoC.. and I think this phy patch is the only dependency that waiting
> for, the USB DWC[1], and hub[2] patch already merged
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c05cf9d274daf72dc7e433480cf2e0e888f6bd89 [1] 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=00b4fe5be06aecd6426930de86b7cffc2330f4b8 [2]
> 
I'd like to ping inclusion for v7.2 cycle, checked locally, it's still able
to apply to v7.1-rc1 cleanly, so I see no need to send new version.

Many thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
