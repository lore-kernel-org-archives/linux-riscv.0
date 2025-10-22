Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B596BCCD1AB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 04:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qewI5v84cRCyrrI3vBILwfycxOzJ0ODZx+X3K68RLE4=; b=2kzMraf2Fk58VA
	UgQB8sh8Nid38sgIxfbHOwP9+aW7EGteRRjCuBr7SboLJi82szBDwJK7NXgQkBLFxaD8vPstedBOH
	QZ/y4KpbeIyOkOJbXQ84/J8LKAFWPy6++JgAL/XWcSXv55oDAlUQ7BK9kR2e1hWjDbTh20NYxNH+S
	vpmLD7F/YJT8aO79tAnb5/C26auP8iV/Oa6ig+pggjj4tZcmBUcLH097mWgwei44Le8dYvVW+HgyZ
	avZ7wsXvtcNQyBRlWylXxCGioiNrP9J2kKrDS9lDhZucTlaTfP+0+Oy32F4780Yo4vS3AvuKSBKZB
	05Nbzp1R4OCPFSoRNk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQf6-00000001ScG-3F1N;
	Wed, 22 Oct 2025 04:41:24 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQf3-00000001SX1-2UsG
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 04:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761108031;
	bh=JQDFvf5I1dyCH/Y7blrGy1YqVRXPt8LzOkgRdqckuY4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=YX77/iKkMUbuT1N7NzTa6XHHxtoWSTkoTHeAztc/I26FJ7uqhOcSy5zxVUqOi3Irq
	 NMecrlL4UHm8g/NNl99tngs/LnvA/QmZEiT6wf9qRInIFHQ/9noA3fxYuDsBnzcX+Q
	 UbjH+73FoU+kG8b1EO6lUHJfD9Cp24bzGuhcFV1w=
X-QQ-mid: zesmtpgz6t1761108025tcd8e51e8
X-QQ-Originating-IP: K+sLGzXws9S2GyOVegV1iBZp/fosgcrzaZzr8htxs/o=
Received: from = ( [14.123.255.147])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Oct 2025 12:40:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2474559367131974335
EX-QQ-RecipientCnt: 8
Date: Wed, 22 Oct 2025 12:40:23 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mfd: simple-mfd-i2c: remove select I2C_K1
Message-ID: <579629FC3E61E9E6+aPhgN9kIRsEhuGE1@kernel.org>
References: <20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com>
 <965a6f1f-37de-4029-ba16-cfd2de7895ed@riscstar.com>
 <6DB8C5F20B3FAC2E+aPhfoRXlJtJymlB5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6DB8C5F20B3FAC2E+aPhfoRXlJtJymlB5@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWLpwLZrMWrIXaUnIu+eOoYfTeDIdQXogb9/0HskmIISGz7pfvwOwke3
	GZeLpIMcg2dgA4iKudrnkAbqsnShkI9MyTbiVDgYvY7GcWf+Py9ibsw/KhRsNQbWm99Blh/
	oriize2GCjs4X+UcbRv3Sjxly8fGGssNzFyODC27h5XWOUNy09WVVAaEnTcRpJdnLASenMo
	I//XFmfwDtI431rh7fSsyPCKQULevD6RWJpnK3kJR/DHADf/LvqpLZZIVXTRcqK76iCTzSs
	+nffx8pBThWhaJDnIiuMjx3OfYZD8OeuC2LwdsA6S9yVUenXx/LI2tf9nrigYGywgWg6Gft
	2vd5QFvib6Jnf7/68s18+L20QfW77q7lwX/oanWMHa3GV94K9EcKG4loENINQwwwaer2WLG
	0yq+oO9m4FJAwJRP7eTTDUUZgcPAtIqI29uhQ1O9uvF3PmeCprsI5dkc2NcNbH6X2W7Zuww
	fN3QbbFHUe0dTLquFdieDbDCBoclxm+8yk+TfloT8eqZZD649ZW2bqwRvPnY4uK9vRKiy8Z
	jrq010ewSlyjyw+/VVQ4No76X3Y93dQZWA8SRtSe8v3QpgJYDACi8nZZpKg8TkwWaalLyqA
	1eJdlpS8kQEL/v8ICm2hDRmqmooF2RIzg2IZKHPhT8U3z0CRS7R+Q1bOhVvNcvRjr6N1h9I
	3izQkjgVAikFCeXIXDsMLX8MlOqjkF2YknXCzZzQp2DoMGQHjFTnHtx7VCJEU1mYmeJKxX5
	4ABpBNJ9KWhW0n0km+Pn0owrrd1++3CkLVfZkKyxcKcCdqFJeZEC56SHSFKYE5l+ld4XUam
	WJlOk1stZDa/hX9mTV3BiUHe12LOHhsCFfdmsCGfSoAseWzY3SFbdLh4Qhz3xVAORZgIyFf
	kllAaSECQUgTAApLkPkd5IBXKkUgILf+3zywybWAg8iHZv8MVfR9rChJx+wflaAZxRTuDJ6
	JcYFRpve0ZDF4sXOIL4lSIeLErPUE8bnmfCdRLwwRwLKlrc0xp7rhUbjhp+iCZi+xIp8yIK
	BpaFw84cMPovy4liD/L7E9u28DNFmg3ODw66XSdFUkoNx68XkGu/29kDfIlNu5vADCSIh6g
	w/3YIAXEtASirT+7+R167A=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_214121_985367_FC3A8AB1 
X-CRM114-Status: GOOD (  12.75  )
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

On Wed, Oct 22, 2025 at 12:37:53PM +0800, Troy Mitchell wrote:
> On Tue, Oct 21, 2025 at 11:30:37PM -0500, Alex Elder wrote:
> > On 10/21/25 8:58 PM, Troy Mitchell wrote:
> > > select will force a symbol to a specific value without considering
> > > its dependencies. As a result, the i2c-k1 driver will fail to build
> > > when OF or COMMON_CLK are disabled.
> > 
> > Should config I2C_K1 depend on COMMON_CLK then?
> Yes, this patch [1] registers the ILCR as a clock.
> 
> > 
> > But you're right, the selecting config should ensure the
> > dependencies of the selected one are satisfied.
> And the config REGULATOR_SPACEMIT_P1 select MFD_SPACEMIT_P1(RTC same).
> Should we change it to depends on?
Yixun has suggessted here[1] and I think too.

Link: https://lore.kernel.org/all/20251022004830-GYB1522542@gentoo.org/ [1]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
