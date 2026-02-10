Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3840AEA3F0C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Feb 2026 05:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/7eT5KEXsu1YE4ZVIX6mHh2ZMjFWL9jEt1j7Y3deTA=; b=u+6uNcx2azFsu7
	xeJ0jvWAbtPcKDNCM7Y5PXwlKFrqH3JA5bJBVG9Zdq51KL32swLljvEFYLBugg1n3un0/T2EIrEvw
	nGkzstSBEngTZiu8KH3KTLb+4dCyY2SjZ2goqHl06dZtUBNTG+a+uLG67PlX8iNPRdMZ4qbRTfl71
	yeev6NGZ2rC+NqM2RYqzB4lcxuchrYYqMkRs1SfAhwzpdGuhBs2PmqhDYFVTq6DVQprqG7RlI4c+G
	rBWET1a7XTACWULDmoRLNkD+fqmitjo/5AIoTFRQiMugkxqZTrzEczYFMCYPudQ5ys55duUuncgio
	e7oo6TLAftFyf9mWNOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgeR-0000000GUxg-22zz;
	Tue, 10 Feb 2026 05:51:07 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgeJ-0000000GUwb-3uOW
	for linux-riscv@lists.infradead.org;
	Tue, 10 Feb 2026 05:51:06 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770702646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFqUNAJPbfntakYgXlVmPUWBmjS6ZT274Op0DauQgpg=;
	b=xKmyqxOKd8/xaTlxkb/W4z+DNBVpe10MC+GteYSStR81VuLNbYcB6DflytOpkoJuxjQ2Xs
	hFJylvG0GlZX+PsWuqAFBimHqkTKy4nDG2A4ekGUXZwZM8x2CM6bK61Dq9rQOgHuUQvk6v
	LaWj+8VwT1xRY8X7PeIl3xiSEy19iOs=
Date: Tue, 10 Feb 2026 13:50:32 +0800
Message-Id: <DGB1P3K6I14J.1QCMDY84ZR7ZH@linux.dev>
Cc: <broonie@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <dlan@kernel.org>, <huang.ze@linux.dev>,
 <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <neil.armstrong@linaro.org>,
 <robh@kernel.org>, <spacemit@lists.linux.dev>, <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support
 to K1 USB2 PHY
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <krzk@kernel.org>
References: <8c3835c4-3602-4cee-9631-0551b0341918@kernel.org>
 <20260209064016.1176056-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260209064016.1176056-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_215100_862327_D4641CF9 
X-CRM114-Status: GOOD (  12.50  )
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

On Mon Feb 9, 2026 at 2:40 PM CST, Chukun Pan wrote:
> Hi,
>
>> Plus, if this was a vbus regulator it would not be called "phy"...
>> Even more confusing.
>
> Sorry, I didn't consider that this naming is confusing. Other
> platforms, such as Rockchip's inno-usb2phy driver, use the
> "phy-supply" property. I continued with this bad naming.
>
>> Bindings are supposed to be complete regardless what driver does
>> (or does not).
>>
>> You must list all supplies with proper names.
>>
>> If this regulator was missing, then what else?
>
> (...)
>
>> Please start describing in the bindings your complete hardware, not
>> your drivers.
>
> It appears Ze Huang described the vbus-supply property in
> spacemit.k1-dwc3.yaml.
>

> So I should enable the regulator in the dwc3-generic-plat driver.

No, we will enable regulator at port level.

>
> Sorry for the noise.
>
> Thanks,
> Chukun


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
