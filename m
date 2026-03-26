Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CF7109E52F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 00:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fWRiU+kwieA+HvQ0XI4e9vtBcbiK0uP6bx7/XrJODo=; b=BjGewQMAy2Stk6
	E/uZ2y967Tz5cnkgpQAJXbo1I+hnQ6wvw8voIb9Ogv0bli9wiPDjC7FRGjve+3xR7HCOdyL9BVMF4
	0qBzqERRPrVZdUI+fti8guPkfQ/UgxzNemQiOZJoOLpq/FF8DF0NXK1OfsRBgE95HjKQPRMTC0Mdr
	lYLzlY0f1t0i/dCGSFRveUTnV+nfVR9t7qInW9kg3mZBWEcs+JhbFDDcAOFqMyZOH6S7itysC6unn
	p8q3Nldus3FVG85ymI2DJBTV/fvxSQrnf5pf/QGdMmZF3EnVsOKCPt1HY17QuqTtBiQ+Y3qDKYBeJ
	99p2UJiCpqu3j4QvP6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5YN7-00000004Swt-1a8Z;
	Thu, 26 Mar 2026 00:14:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5YN4-00000004SwQ-35pz;
	Thu, 26 Mar 2026 00:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D690B43912;
	Thu, 26 Mar 2026 00:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADF5C4CEF7;
	Thu, 26 Mar 2026 00:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774484085;
	bh=/TUBF7g8mB34338ES/5O1dCvr9AmdaH2HsuPF9BFNDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcW6accb/PkHae4TeIC9U03nq4FvAa+PoKqsRDJCrNv8pNUCYvh9Heb0KwJ/x/jNA
	 DpFTn5iZ9UcxnGxfajphEQJ7nAVlx4N/fFr/QojmFQTUErB2+ayRVtcfCL6sxl6656
	 HdSE/mqRdkxEvsrj7/d93dhIV0ZbCDSjpzzN7Eju+SjOx9aPzKQ76X+pEk3B/DaWbG
	 DqmQnSiV9DMB7hFJ261R0JrhgnnVfUWv0lCi+Vwx8cyOKbmN29w9+rs+c4kJhTG0L9
	 ag2V7di+vHu7fo6Ds7p2NMyqprMu7dtOYqk0PjNkuJFEwGDpHyapka3hD2NGHBSdR8
	 UvYxzHgS3jbLA==
Date: Thu, 26 Mar 2026 08:14:43 +0800
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
Message-ID: <20260326001443-GKB777612@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_171446_796985_4DA7437C 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi Vinod Koul,

On 01:00 Thu 05 Mar     , Yixun Lan wrote:
> The series trys to add USB2 PHY support for SpacemiT K3 SoC, while 
> patch [1/2] implement a disconnect function which is needed during
> next connection.
> 
> No DTS part has been inclueded in this series, instead I plan to
> submit them later while adding USB host support.
> 
> I've collected all patches and pushed a complete review branch here[1],
> for people who interested to test easily, which include DTS and necessary
> changes, other patches may still need to improve, but sufficient for
> verifying the functionality.
> 
> Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [1]
> 

Just want to ping this, Can you queue it for v7.1? Thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
