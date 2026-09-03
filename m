Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7E7C61DD6
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 03:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IL/IvGFJu1Pcueu5K4x/n2emFfBrQ+tCJVfDKTad9R0=; b=d17l4hOloXxdis
	3JMvDR/Wzfx2m1fgTUcztUqjLbLhqmHVVtc5rXJYkth8HzQXIooOR+1SJ/YFiMsuZ4w3LoG6hSPbJ
	mzRLBvX7tdceTh4FRUh2wXxJiAfNQ5RzbZGsK/3nxMzKvNKUrAaj7A0k+JQW5ssGwEfp2+kZsya+f
	wx15kCHCfHtVR8l2RhRvvO6eDb1JCe/1a9eY7IihfJq0xrfWg8rlprploGnaU/pLHqQ2F3vv79wrX
	CtwfrQS17qCc7ThLRR45pnp1bPj0xoGSJX20TPfWF46HHa9S/w/DDFCqs6JhZJaxRDRBbTpUOGIFC
	R/BRfH3ndd0t+n1aqoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1y91-0000000GHQn-1sS3;
	Thu, 03 Sep 2026 03:29:43 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1y8z-0000000GHQ5-0DXR
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 03:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788406145;
	bh=WaEq0oRkEcYbCfT8ZdzPK3UROlgtnMIJUAo/u6CFD9M=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=C0JwSKyC4SeNkwYfy4C6jHlK58HJbQhNFNc3X1F3sbnzxOejOlvF4/qtbhnHbhVfX
	 oj3WYUAb/MsXqctZ2L9xdym6bd54SSHDVXT54Ve3+fXd5gxlJauBmNxY0qvqhZ8DB4
	 9spfEqq/hf0Nu6EsJcu7XlxyqANe7pabgcYlmtRc=
X-QQ-mid: zesmtpsz4t1788406143t032f900f
X-QQ-Originating-IP: LJ5LtijfxLyByKUO0WSeF4CNc/Be8prOeq+pDULPaqQ=
Received: from = ( [183.48.246.134])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 11:29:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17379667977984956232
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Thu, 03 Sep 2026 11:29:00 +0800
Message-Id: <DL5D2ETDDPX1.3QTJ53KUA3JED@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Ulf Hansson" <ulfh@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Adrian Hunter"
 <adrian.hunter@intel.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Long Wan" <long.wan@linux.spacemit.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] mmc: sdhci-of-k1: Set clock-frequency of io clock
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-3-4e7909cf4233@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-3-4e7909cf4233@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OdN5GnPEc47os4gKIHrz/0HHFqGuQido+5HViesow6Gy6cVF20GSt2pV
	5uuXrAZLrEDrA8o48XnnGTWlujm4/+pZqLp80MA1Tuofirkn8Pb1p84inEghzSRT55y1M1a
	HaF18NYNtY9iDK/8MVUvYvKd6Meb9D8UcgpyWF8nYT3N4C5e2o3Lh+vzgAszSIt2kCyyIM6
	HT4BuqPkeul639/tmr3BDxNVPhf8jz/A6EPtaUwpYuvyRRl5Rko5CFPgLpzdHC0Mj4LPBQw
	4ahRsUU7gh83lC8x1E57OpyUxrY+daLEneq9R5MGo2IeNpgKG89qsbdA7g/3PI/njW51u+P
	StB2Q7GN+uEJE4st0XBJ/cCLdoJLmFqMDadNCjagE6W2IZ6rjo1amhuDDyl8le4x/+otfKb
	Iaf04oM2PYFMJJ0Xz88RBblQuavWdryKbXSpvlO5JaPPYwdBr5YRLuIDwdlJnLHGmK6EUms
	C4hKlHPDVS6YCFrBA6ACYu+MoIJlG/2SADGdXcsKe+IgODemX5ANxKfrngu6b6U8lYjHm9h
	fNlrbZkuAHmspFJ3osICTqAeMjdfQUlCWxTdg5ahCSp7AZ+rjCglU3etd74/CpfQ5GcjFei
	+GCuhBIlMl3hntLhCsUzlKhM8MEsazJWiDco2U5EHgdn5VLK0RLR89Ygm15ZtddpBnxNK0g
	+1bg5GGa379o0Pmeq9/nwYjbIzZiVrkZ2r542530+OVfNeflFpxS85E4YVt5UXqfHTC6fd5
	ivfrcY7ZgjzWEATGm+l2AABLMluEdFkPxBC2S6mbrMNLWgkvHkFIU7c2m96WSRT8WKdPA25
	SWkuwkxpnkzba9sLzR6cDsL3JO8dpXf9BpUfSxZlxLc0UmfFpoTGBnOXJNUyXvvAg6DsFli
	80XFHDBxdZhSU5jvEvzk6WqYeYJ4O4OHIaAhZUvfL+M8aF2XLMXIP6cgxAYEUmVOi6k9Xet
	sTfKlQOon5W3ABKlChTFgZbfn4bpI3oJTKX+26Huu1lfotgtlLBx7jhkAUODN3S/VnbWgh7
	nI5sh0OxFQFQHrFI/J4ufoQdruWpJXNar8UextvPonSYfiL84hzbjuRtrL4CLcmBUF8iitr
	kTPOTDJUaxyQEuNeHlL0C7YnCaTpw+uJJ4juUWzxIV8hCQNGDUIdVE=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_202941_364054_19C87E5E 
X-CRM114-Status: UNSURE (   4.26  )
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

On Wed Sep 2, 2026 at 3:03 PM +08, Yixun Lan wrote:
> From: Long Wan <long.wan@linux.spacemit.com>
>
> Add a clock-frequency property to set the rate of io clock, for SDIO
> case, a clock frequency need to propagate down early.
>
> Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
