Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA0D148A0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDCiTnM402lwZ3LUVx1+lfcMQCmdmNjsYZa0Kpk7AjA=; b=izUjne+cy6XqI3
	XOxqimVfbCyKEPErdrlxMHat5Q3Xu2Y6b8Hp9bCr+roNXPjQpcwxWVYN2MTsHFgljg3D5mpdEibdF
	AvqnBcPBGGqixKHI/EDsiAAJ7Ky4zG95YEDzF/jNCvl1j2aLDZ8ea1t8pboOHFJxRmk3Se5peFdvi
	1awoQmkkNfvW1PYDVnLN7L/8Lg+xubnskiWWxBPKDvZExltxl4+ypz6P59pMpD0+XaBqKrGl7KOHY
	Lr/d2aJRsf86BpQp1Pk1BKdq8wxu6rqU7TUXKwq+q4s4rlOau0QDxkr7ybAhqgU6I9zqCfCQ3JkaM
	yw6gegL49QpwP1YlXPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdj9G-0000000FyGo-1Hqr;
	Thu, 08 Jan 2026 06:05:30 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdj9B-0000000FyCW-2gDx
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767852296;
	bh=Kb5K0iHmhVo6j8LIgQJwjRVhLZwxwVD0tXIimEEYGb0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Iqvu07/OMbvyV0bzDliIc/xPa9f/6yVQtZw+ol7kseaqR17G34lZEUsHEbK5eZDzj
	 leFVxvggLW/zCLHPqSHhqBcuFF4UCywJ9NdUjA/IiQc6d9Aa2blYXW4D0JbKJQwh9F
	 TOacrv4rT/Z7H/sFKXV0cFF412kfTfhOh8rehnoQ=
X-QQ-mid: esmtpgz11t1767852294t43f90bb5
X-QQ-Originating-IP: HffZ7RlcyMDrYxCv2ae82zj8z6cmAht2vrfhsveVQHU=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:04:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3767647049890093468
EX-QQ-RecipientCnt: 16
Date: Thu, 8 Jan 2026 14:04:52 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Message-ID: <16661E5F43A23979+aV9JBP2EbX0iBE9T@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
 <20251227-lavender-turkey-from-camelot-ab6aec@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-lavender-turkey-from-camelot-ab6aec@quoll>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MHmS+iNcn8JXoEY7+Ai5LGVVDFRVb0VaCxkV25WDazznTQmYn5fkvl+E
	cPqJcKLq+AkNHfuNJ/kmnbKpHd8ipHSsQXZ8cheexYrwjX/LOXgrPdbZwxkrnMhHufa6XlJ
	AsxsjOsWyRs+zNGwpEds1zxzmGRpi8DGArLd0R7HGGpfEzkTl05MhquN/bF/Dl9uZbFl7VN
	hfSTmCkKsS4m6owZPmPQfCJEueh1ALUqXK07CvTmtDKRIKYHbq8IG2cnWh0XNdMy2Aohv14
	1IwyJp0MuySWikmwNrfnDAdR3aIoRnImoUvxqvB1hQg6FvN0Q0e42iNpttggiTUFnE3s9zr
	6I5+5iwNgiELfbASmyEMQIgJUIHxlfxWiNASlyTGTPmemowSQevDiRvveyt1JcIVchcVKI2
	LuoVEmyVBibLhzC/T4rIdRJ/eo4w5MabRZc0hgiBxp+Y9ZRHX13eRnb4/NCqQmW6iK7P04N
	2i2Y9RDnV62VPHYZ4qIs3JskzAvt+91PmifOKBlXjEXjh+uW+B2ctSOBz0TmoaZAQ+3dCpS
	XnvZddmgpHLoOf6CiHIVltrQAbp5Ts2MXMgLs6eG3gU+vJ2/1MyBlzpxH5W5jay6Iqv+zSp
	8QnSFAuh04qpB7f8wEXUGHf0pI9Q+hQyrhpLhOe6ZA11U7H3thi75ycJ4IMmVjVJlDqdTAg
	t+pmZkcaVEIRXW5nHLvCADvhEw2+iDYCpOlcnzc5Bg0v4U4mOcdMyVvvcrbfekS8MXSZ15u
	xgrBo/95GT4rkwDcf5qMxQwq0vE28ehz19irc1GUipzmi4ZyoXaw8BGX/+l/FBsSoOe+8H0
	3PYTgXZQczmYeajs+nR80sr1ertJaFz7B4HXaEzauYshitgRKwKXcMrH27OHuzW32NCjtt2
	6UFVC57j9KXaAX2YT0dOZq0W7yZOzF7wO1NxDfIHPJUav3+A/Y0Qwfjl5hnRozcCU+LGSt7
	l67AUw1xtk7duPnjn+BvO2nJ2ii4Q4N9VLD36QmtVrxgcZDETjVRXbgH5z2m+byDRfzu1i/
	O6G+o6PzOAcxg4qskWiDpNtY1V+OIMX6zYXcVIftap+AxgZsNXY+93XdiF+4DuoY4qhBWtZ
	6tMwluFAmX2nDmFrl4yDSeYqE/QWDKeuA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_220526_214974_0886F830 
X-CRM114-Status: GOOD (  13.79  )
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

On Sat, Dec 27, 2025 at 01:58:52PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Dec 23, 2025 at 05:11:11PM +0800, Troy Mitchell wrote:
> > In order to access the protected IO power domain registers, a valid
> > unlock sequence must be performed by writing the required keys to the
> > AIB Secure Access Register (ASAR).
> > 
> > The ASAR register resides within the APBC register address space.
> > A corresponding syscon property is added to allow the pinctrl driver
> > to access this register.
> >
> 
> Also:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> You are not adding syscon to all pinctrls.
I lost "spacemit" prefix. I'll add it in the next version.
Thanks!

                        - Troy
> 
> Best regards,
> Krzysztof
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
