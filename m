Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51098D31A15
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 07:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vec2k2PKjWMqSxhFuuGv7HV+gZdOtLcW7v8CdArEgeQ=; b=twAF8hnqIK7Dr3
	/ln6C4/TJPvL2sm4cOmRKEH0Cw2QUSyGItC0+RmcZhU9S0ZIYcLWfu5F/ulOiPiQkx8cvkh9AqQhJ
	zt9AhCLJ3fRhaeAe5GQxWs9KfmqpbcJFiBU9cDBVACHlGc2WkVknp5oHi3dmBP3lbRIY2ATaCa4XM
	y7AUFkLwxmrJtQGlxsvAlJ4pRHaO8C/esV2XMAYKe9o60SkSKRuNnxTKE8Rwuvyk+ud1ioHtbzVIG
	ysYVwHnmaKBYiCgQ+Aouem7D/1YsQQZPeqq2BNH+aRNhpxT2MmXlc6RHS/xFzxyp75O+jbL2Y2I9c
	Nzqy/s2bO5yionAaWkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvVn-00000008DmL-2vS5;
	Wed, 14 Jan 2026 07:41:53 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvVk-00000008Dhm-2WtZ
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 07:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768376437;
	bh=Y3hzIqe64eTNPZAr7HNM5Jzs/tphW9qIwXZhK18bDVM=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=FaQLCIja0GDbUuIoZRS8YGTtPKNKvpxQawxnrUpxfSTFcYIymfyz1A7YyGkn+v3zM
	 XYzL4ijzMz8xaGMFjmaKfVFQnPTKzf4l2GLA/Q1g/PzhRjrqEyycK8iINXcwAPM6Zl
	 DbysDgD3Hx/3nxVArZiG2Fqh8ATReeI1rjE3mPCU=
X-QQ-mid: esmtpsz16t1768376428t13e77d3b
X-QQ-Originating-IP: 7aawJ3yx9b6VmjulJJNVsFBb2N3t4qxK6xGf9s1FjQk=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 Jan 2026 15:40:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16254600035269256280
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Wed, 14 Jan 2026 15:40:26 +0800
Message-Id: <DFO54J7CRS8U.1D9XZAJHF57HM@linux.spacemit.com>
To: "Lee Jones" <lee@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@gentoo.org>, "Alex Elder" <elder@riscstar.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-i2c@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] mfd: simple-mfd-i2c: add default value
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>
 <20260113124241.GB2842980@google.com>
In-Reply-To: <20260113124241.GB2842980@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NQvpx3reNVf3WhyFtnskoYMLYvgG5oU62ujRS8JtwR9vHStSzynh41GG
	OXMxYql2bohvBa6JWd06cX4JKPrE6fPg9EbZ0g21wCh2zVKOHaR36UYqhRhYsSiw82gjcSI
	6dYEYn04C24cLRCd/pCnxabSN1IxDxPE9y8aq3Iuf7IrWNkH2sktsi1rQuUXIzb+U1G9874
	9+3iSk0OFK3O3+X360goBWmhA7bz/rpag8wFTZDsqxfXal8W26vSb0GAoYhmINxFC+pfrhq
	6iP9bA29sYXmqt9ZVuu1Y4eaGw9NPAMLPqJw8mdIRtVGiA7h7R+acUoFy0kjhj+I1Z0zM6T
	1c44ggGLPCcpbIgc+nlGIC0KAOOxmNQAlTbACKx0apXgRzqEhHMV7sjU3C82cmqAeJEDTJI
	2RiXgE9P+pw+SLATpDrsrCS2FmBuEpxcb2kbXkREvbvNYe9qU/dQDOPu4uovdmsL0iHkh7L
	cmDWd1XxdwUwyo3rcxgRnQktvDwStwtcFVF4DEyWNjzWZf1f6WemlRLBri8V1+tg2VYpHes
	cfttwAXToZuuYfD6GX1pDnzQFuE5ZorcHpymtUl7TT2DOk4DuWVQBnv4I3uf5Cti611jsD6
	hbnwGxKTqsvF4TZXd6mcHsTCNSBDmLl2pj+ZsKsv76xNrMRcbnstWDVIMZfYdPOQpa62JXB
	kW98a9Xt3UhxUuEL31gPwZEpus8/h7GJy2TYPiWmKde7rHRZDWVN5dUWJIsYAWz+7d7znbH
	pPG+PKMDzvvHvAAsXxpadL5lKIq1nHwEbtrVVhCISeVJO2NcOkMv2bKnnHaXL4ZQ+RUwBjl
	RGBTsk3A8PeE9OqXtbKgBSkgLW10Cc4by4cjEmJV46JvK8AktB/FMt3LEqf+cV5CTP0pKAW
	8rwSeEddoq2CH1TnumFFmMW8jhkpMfGJtFbH7i24uX2WcLWolfpM4wDf1o0zPTWy4FDIyjw
	A+gojymMAUzXGVSTZzZ53U0IeAgu+egoeU3GEJiyRK3eIRIzX/neY1jzVwtIWY6JRTlm4wo
	Oew21UJ1zIhHFVmxuU/dZEMjzah/uLZfiXIpk9MF8tZHKK+AFcj9kLdxwwckivTjfBz/kGM
	RUVOlfIo01A
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_234149_118608_E53B7728 
X-CRM114-Status: UNSURE (   9.99  )
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

On Tue Jan 13, 2026 at 8:42 PM CST, Lee Jones wrote:
> On Thu, 08 Jan 2026, Troy Mitchell wrote:
>
>> The default value of the P1 sub-device depends on the value
>> of P1, so P1 should have a default value here.
>> 
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Change log in v5:
>> - nothing
>> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com/
>> 
>> Change log in v4:
>> - default m if ARCH_SPACEMIT instead of default ARCH_SPACEMIT
>> - Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com/
>> ---
>>  drivers/mfd/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index aace5766b38aa5e46e32a8a7b42eea238159fbcf..c757bc365029dc794c658fc5b10084a0f29ac9b6 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1276,6 +1276,7 @@ config MFD_SPACEMIT_P1
>>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>>  	depends on I2C
>>  	select MFD_SIMPLE_MFD_I2C
>> +	default m if ARCH_SPACEMIT
>>  	help
>>  	  This option supports the I2C-based SpacemiT P1 PMIC, which
>>  	  contains regulators, a power switch, GPIOs, an RTC, and more.
>
> I already applied v4.
Apologies, I missed this.
I will remove the patch in the next version. Thank you for your work.

                    - Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
