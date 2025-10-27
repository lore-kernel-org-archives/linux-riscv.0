Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C164CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8W4YC++U1DyERueB5xJFnV3c7OBhFM1upSpsur53B0E=; b=EiyG9MT71+tMn8
	f+RSoVqEuKvoGgmKp1wWlU4PjH3HLt6ejq5/LKzkW9ZMR/wIQ5IFYu4byigtfC0eC4EO2xFQ6Z+G8
	FYY0s5urp7rrQqPk5x73UqZg1Mu03R7+/e8SzlHqAmrrUBuYlsQZaxlWeTmyKfPelPPMTYMR+USpy
	TPCXeZLV65L2aepSuSjKMkw0kW9FGzKAbjw0h/v6OOOE1TLls3u4qNd5nxf0aOGYvh3+Bnq6SDz7f
	M2r5AzcJ7QrWwdbkxc8i6MOKAdnfIYvBy4qT9xPndLnrWYZWE3RE5J7L+sZKAoQUfreSSHSbf0q0Q
	W8GqRNmB1w6eDTqyomqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNfb-0000000E5qQ-1OcK;
	Mon, 27 Oct 2025 13:53:59 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNfY-0000000E5pD-1pCh
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761573157;
	bh=3kzLSOuCsNwd3PzYAldLRKtwAf4LDDOP8IpojHoSDqA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=oSjrzR/Y31GQ8Je2z2krqEdS/g/jxabnCZS1DXdHwX0JKlLy1K+Rn3eVlg24KZ0SL
	 I4wBxxiuNl7YjUxf0/nqcpRKJnP+S8VwvSIV81q73gH8dYPpA+Qd5DcU+0DnT9lnz/
	 3smiuUg4bTCGjmiHSfcEIPlGoobkOXgYK+HQ2sms=
X-QQ-mid: zesmtpip4t1761573148td27e7fff
X-QQ-Originating-IP: UrvBgtWjK2nHPKDaDc+5eztGAGq+puoGJrqONWDB7do=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 21:52:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3589194371110630699
EX-QQ-RecipientCnt: 14
Date: Mon, 27 Oct 2025 21:52:27 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <DE3BC758D99A2110+aP95G3ppc_mZaDpq@troy-wujie14pro-arch>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
 <aP9IVckJT-k2_O4K@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aP9IVckJT-k2_O4K@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mh0xRtMdhgZRanLwuwAVcqmp1P5pal50KAfMbD3eUBhbrg5PthVOPmEf
	sGCN4jmRdbbe5xpLy1i2t+h30110rqU3JDOIWeHHzRRD60R2HH+2BHxviT2E0WSmyEwlnId
	CC0jO8m1mZ/IBWmmc5+6nERrwOOdw+eHvVboDE+E2Gm21uXExF9vHLiV+62SCxpZBFp6nKF
	onSpJLykJBQnVJ0IglQ/pe+ngk1wkw2+8N76DVd7W0c7Ho3ak2oxLpgxRPowcq4+9CPj9/n
	6DENo9CAn6S+3yrMXpnuQEZEGeY6BY8fo12HTF7vKHq4zkAqOnoNgj1igiwpVhxhz+zWtw5
	1VApAhZD1W80QnYqz7ZOJOx+v/RT+RaA1SRjUbRJbmSUOBfq4TcIdp8DVGMLsErq79dlGeN
	8Pu26+hhV1+YTtJpLOuGNRhsa7PFC3/y8l9+ueD3dPVxcFZ4YX0rP/jfK8m0Jk5TQsh2M4n
	R/G9DGS3LvBzj3nzlcJfVvgOk+l+LZCiSsGOt/GHQg6ec2NjBL6Xuj3gviWnnmviyupOEVN
	qzqUvYy/NAhgJ6HwNQ+Jqqwtb2P6Q0hp/DpFW+Ke+SNCnuZ+eNZlmLDcrymbM1KUHV9TxYf
	RHxFbhLw4KD3V9xzNNz22a+HfDST0HzhMQZi+YCDdnkn1io1r3TybjQCCHUCiVE4+sIV69F
	V9sO4pIRinHvLbIj3x9WLT6UWl/z6rLx9SgEgsIHYr1qoPbT1nMaB/VprXxq7wKKH2gjU0I
	/8E6NLCir7Of0PZiWQ/rh7EeqD3/N2clFkDdmC8FWMcevvrWI41xAdUfZPpornXRyM0+sfD
	bWptv9DdWT/yo8yi6o0Lbjreu5OT8XKxuwpdtsSDCO1A8/IU7yEUD7wtAj2lYe3bO8wwhxG
	1QgNzitFphMUzcFKn1efkit0E4kFrfFKIsaVIOuJGgUduzkaZIZG0ovBhLx7ZDphrJunTNm
	oe8aYjAEekfdG7ZLnjm1e9GGvqx2gqgZuEAmsyn76Twb71DMFzCIGFruu3YFM237WIsbk47
	JheZa21s+p/n7/YhbEVzJavzd0pbtJdyKZGF/yrzAkgzn5jqpMBD7pemfRgH8ivUMbcbL9B
	CQTufCOfcne/7aJsNllQ3asTFYIBG4Xjg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_065357_067896_335B0ED2 
X-CRM114-Status: GOOD (  17.58  )
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

On Mon, Oct 27, 2025 at 11:24:21AM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-10-27 13:48, Troy Mitchell wrote:
> > Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> > merged, the driver would fail [1] when COMMON_CLK was not selected.
> > 
> > This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> > patch has reverted by maintainer [2]). In addition, the Kconfig for
> > P1's two subdevices, regulator and RTC, has been updated to use
> > 'depends on MFD_SPACEMIT_P1' instead of 'select'.
> > 
> > Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
> > Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> I think this series misses a patch to add a default value for 
> MFD_SPACEMIT_P1. Otherwise it doesn't make sense to define a default 
> value for the ones depending on it (RTC_DRV_SPACEMIT_P1, 
> REGULATOR_SPACEMIT_P1).
Yes, I forgot that. I'll add it in the next version. Thanks!

                                  - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
