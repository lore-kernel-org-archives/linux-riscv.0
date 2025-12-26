Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B45EE8FDA0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJsmoOCh6aHlxL9qzryaq7e3N80mWw7MlE7IzhAyvY4=; b=kgdYWIdX0q7s+y
	uv2GJ3AZVmxbkNpn9AEFsPNFDHB4s4FFtVOeAYGKDtZXAcrugVpBoQm9eu4Zhn0+S/IA5FVpe4c3F
	EO5R6CafptjiZkkN2lLNiux8VgnagYYnxE1l2IvLFsWAI3oeMi/hD7VGYds4lvg9sFUP+UBRpPZyz
	FswqgRLI4y2NrOaZMl96ypdYsUiZ+uPLEs4KxT5JlGQ9ZqVfP7q0YruJ9cCKxT8cUKZZLWgoggI7X
	qNQX39Vl5UJ5IScZb38KfNxmrpKFu7VDY9FP887oqBTN/vRV61zjxJUD6J/qabfe78+duFNkrK/cY
	+lEuagUxaQ0YHsHRWpXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ2eH-000000010tV-0rlF;
	Fri, 26 Dec 2025 07:54:09 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ2eD-000000010s3-3l9z
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 07:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766735582;
	bh=5rqzRz+DAZpWWro/FXmO/xzVSv2PlwUs0gKPEOGz7hE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cdYNSvpRt2Endd4lQxXEpMMNt9ITTaLhvpAg5ERsa5f0hYLtYjnaOqejPhX07MGyV
	 h+/yzCWLkSO4EYibfy1igM9rsE0bvgknmo08m+MNLBduwJNj8GsU25FdYyoYqlq3fJ
	 c2AnfNkWfoipMTSnWaLOUTMAvDFZmc38pcSS0fXY=
X-QQ-mid: esmtpgz12t1766735574tec301483
X-QQ-Originating-IP: A4Tsnl5JTI7DzEsZRGnZiXX+NSH/kdjq4a+YWdmnzZU=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 15:52:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6635047226762412195
EX-QQ-RecipientCnt: 13
Date: Fri, 26 Dec 2025 15:52:52 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mf2c2cXG8XEigeMabfrexd3DMjAQPofMXRXdqz9J/jtmeegkGJ2HNWF7
	SAHH7rF1i9va7PNDp9KiIp7vW7W0zlsBcUC+4li6O90WXkv3i60Z32TEJdT4X7wUTZ+tDPg
	NTd5j9c+tiFfq/HNohfVKJCj5zK05XwQJDDZf+1+S3l1V5T9XLGdOrpImh2/EZp7UV0rZzH
	2aA2cOi6n644hFSegaTU7bXhfDIzjImRzH3dkqo1xIZCr8Q3laMdg8gh9WbERITDmCQovum
	K29yOQCC2iBwZH5upwnPBrGzkdqm5CWZPNVuwofCZMfU32FpOIsWftKURuv4+Z9bkvYjtpy
	9rxIDW3rixjCHiyrDoE0I48xJRnI+JY3UC6Jqiu4EL0JKcAUiVqJSmqfAK1hKA79VEtvd4o
	DnJ4X5gYbG0FH2B+9mufXUkR10RhBN12w2VxK5YtL+L49AJ3IrFYex+mcfQEjdS1Ht1ZI6t
	AuhWW/OJs0Ug5cNvIMS7RxOkebS1l4kZDPKqf/cqWd6egkGWje1DYlQCX+5umG3O9W4zx/2
	UHM8b3rovYEU4tx7RQO7z6rnGI2RWncxhFMmuHE1S8kfe/A5DOGDz9F1MXsYxzx09V7LyjV
	Rx0ND+Fls+JDkWnEP9hnI+WKGHG/zM90i68zcO00vpPe5eJ6X+Z5/1dcm9Y8V/TKHuiIHM4
	kG3H5QH2bbFEJffP6Q5xRZHe9k6CYrMgBJxjj+LP4KNyzEiOHYsZljPTWH2HGOcxbfnBSl5
	c5eZWNf44ROA9ET9ub8pqxExjRfyR/Yxwp2vZoJ9l5KGd4VKAK2Bj+PTMQMd9wBi1x8y1TE
	R/Xm7SsiGUBFQALgWEUH82qrPJ3ZadofzSYFyDrHY5RDyY2LzSlwERzzzAfrVRZFkDaH6QO
	Lp1T/LJPUoUMr9emhOP2J0GHmNQDTO3WGNHDh+qTEITXkfDNdzi/sydkkxXsUECGT7e+kx+
	ecTORDNs1VPyNKuytqbQ454Qp6uKr1Dwbq+dRrpUgIqZaPikvWkdHnQIAYPcSg6sXweRFZh
	n8M4wp1RsPU35sJfzLAB1jEDWTY/ozRQVwJIVVyNl7vnTRvat3ne48SiqEdzI=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_235406_416949_863FCA3A 
X-CRM114-Status: UNSURE (   6.62  )
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

> > > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > > +				     unsigned long parent_rate)
> > > +{
> > > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > > +	u32 lv, lcr, mask, shift, max_lv;
> > > +
> > > +	lv = DIV_ROUND_UP(parent_rate, rate);
> > 
> > Would DIV_ROUND_CLOSEST() give a more accurate value?
> I'll test it.
Same result. So I'll keep it.

                        - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
