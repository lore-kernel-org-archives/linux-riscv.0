Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25EACCD1AB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 04:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Exg+Q75JNeb4CCA/wHRDdtY7EgflL26FvHK/WGSC9OU=; b=ngHkz6IQh9xmfM
	+lprnqsYUrIMOSRh4RRj30/Gf5HHFLEElM9Fq4YLQyZyaIyVCppxK9MZvdD3zrCN/iRJt+4LRudWg
	T13JYqeucDnsqtQnfdrtyoxT6pFlwlICcC3dc10tmx2I6tjnVPNLjCqb2k3OLzXbU/L0q5cBK2XgA
	eSGDiu6YZ9BfTC4I8o0EQ4gb3SZlQ37anPOlfFti8ivzsP5ylksaMijd4HHX4/hC2m3n1LNo0g/v+
	bzJorj/eT1JC3bNWKwkfS1VY+nJjnc1biOm+RRTEa4KSDw1jMIlhzLjBCnACCM0byPdN4qQZbzi8C
	Rm3G8s/tE1SbiulJSNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQd8-00000001S6S-2Ajf;
	Wed, 22 Oct 2025 04:39:22 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQd1-00000001S5S-2Ow9
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 04:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761107882;
	bh=z3D6oLpRpC3uTJLuNajnamGCVKNxJO388PHfD5+0ZWM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=SPurPWPGk0RtUOk2yMXEJwXdtgahg869pn5+zOQQk81B9TJCwUqZ7PsvPJD2tDyE0
	 zHANUqYljEgiojmDjDgD5GsntIb83bV9mvRhZrKnptn82xeIhrw8sFXQ6Mdbylyga8
	 Zq/zQc5S5YZOV5YcDof/CKinaCYJ618huTgJS+dk=
X-QQ-mid: zesmtpgz5t1761107875tc65f3677
X-QQ-Originating-IP: zdumyoB0a58EQZUjbozu0JEFOJ2+w+6ADKhX/NG8DRQ=
Received: from = ( [14.123.255.147])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Oct 2025 12:37:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8598891312569528437
EX-QQ-RecipientCnt: 8
Date: Wed, 22 Oct 2025 12:37:53 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mfd: simple-mfd-i2c: remove select I2C_K1
Message-ID: <6DB8C5F20B3FAC2E+aPhfoRXlJtJymlB5@kernel.org>
References: <20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com>
 <965a6f1f-37de-4029-ba16-cfd2de7895ed@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <965a6f1f-37de-4029-ba16-cfd2de7895ed@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MxRSPV+z0HAoL+RR1zvyJJ8B6cAaVV32hiYxdg+wKFb5tUhs1E/P49S0
	bYt3vMXTh06xtXYdbLBBQ4Oq0hJulFhTMBW+OwvDFJycTredzhlKuC4uYEZK5HCWva0e8Q2
	KmL4kNN0SDolZMlfJelJLjr0QqUbGdi0OYUuJhuaIyoaJR143YJG2FuQrWgoYd2CCH51XfA
	LxeXky2IUoREeGoWgh66n9PvOeTkXfRWcy5373HpRtbwpnFngabDJfYi4ad4Qs0pFoopKtD
	pT8G3c9mW3Ms0a5Z4bCmiXNiwR6Psr1MbsNf/aYac2peW1hxmEOuBvysCncJAhzVtyj3I5l
	CbnIvvIXNootxREB/9Pyka5N8b1a9NRPrzokzvnx6SdOsu42hJeIjCl0ZwvJqbeOcZz/faG
	pjDkw9vXMm48wvTm/wqKFpwT35N0P7G2X6rfcCa0UaA8FdtTDZQ4WhAKbotvyywaACLu6nJ
	0xmvk8mmX6/2C7p9aJlD7+z4j1WYufqy/rtbBgVbS45CFe+cgImvmMywqENjEflsiJbQVOh
	REYJEEadMoPJrF09KZYu8eSUCL+kL0RWsDi7AJk12gcabwHQsTtW805pNqxIYyj1SYjFa2x
	F63/vTCWfNsJrtR6va8SMgmR07bf+AZXStmhKRRGX7IpUxib+iogLbqGLFFzDrFQj2ISQ0g
	QDyXmqOIH4i79sd+yjoFjGBN4fuAqdZlxVh/Vut1Gt+ExXysUMru6J6tLXwkrk+yF50ZP5W
	sOQphClz42QCG3LI2faoCVufGhYamVWd/bAV3FVKShQdsepm71YcaR2inzr8+0JSarStVri
	blu4Mpfna+SiPNCPaThSeOBWBeBvqDy65CcTK9pE5JmSpoycQRi+JlFL+gBFDm4uA3w+xO3
	tx8hV580ZLCdix0Rk00zOOPDvdPiiuTaIc3VSOz89k8Hkam9YjbFJXhoRDUXj1bcGedt+6j
	0+Y4e8ptJRDZUAoGEllltqDoIbxyDZrh1UX85TLtNWRWGSjX3HclQq85kJr4ZdtqiypWyqo
	Z7gciWsvYzB/OQPN+AW0pstK/ssNs+FTESK4kFGaBc/qQvNUTx1+msaOazkxavmhCp28wpi
	Jkvp3IPG7k67sQ7oS+OuNR2KVWx7UXgxhnOA3yONPRgXTvjNk/ZRIeFwkC7Hh5UCCqi6gq5
	VCkcCzKl6DmFamA=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_213916_356108_1D5B4EDE 
X-CRM114-Status: GOOD (  20.55  )
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

On Tue, Oct 21, 2025 at 11:30:37PM -0500, Alex Elder wrote:
> On 10/21/25 8:58 PM, Troy Mitchell wrote:
> > select will force a symbol to a specific value without considering
> > its dependencies. As a result, the i2c-k1 driver will fail to build
> > when OF or COMMON_CLK are disabled.
> 
> Should config I2C_K1 depend on COMMON_CLK then?
Yes, this patch [1] registers the ILCR as a clock.

> 
> But you're right, the selecting config should ensure the
> dependencies of the selected one are satisfied.
And the config REGULATOR_SPACEMIT_P1 select MFD_SPACEMIT_P1(RTC same).
Should we change it to depends on?
> 
> > The reason for removing I2C_K1 instead of adding a depends on condition
> > is to keep the possibility for other SoCs to use this PMIC.
> 
> Acked-by: Alex Elder <elder@riscstar.com>
Thanks.

                - Troy
Link:
https://lore.kernel.org/all/20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com/ [1]
> 
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202510211523.sSEVqPUQ-lkp@intel.com/
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >   drivers/mfd/Kconfig | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..ea367c7e97f116d7585411fff5ba6bcd36882524 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1258,7 +1258,6 @@ config MFD_SPACEMIT_P1
> >   	tristate "SpacemiT P1 PMIC"
> >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> >   	depends on I2C
> > -	select I2C_K1
> >   	select MFD_SIMPLE_MFD_I2C
> >   	help
> >   	  This option supports the I2C-based SpacemiT P1 PMIC, which
> > 
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f
> > 
> > Best regards,
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
