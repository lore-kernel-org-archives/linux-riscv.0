Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0601FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiuQnF8BluOQTF1z+S7bOgU23XZqtR8zSEhrxkU89TM=; b=otZgxLBR0wMwb7
	dxZ99oZansUYx8Gygzp6K3T5aur+p643kI0kQPCzXIM+Wysm60+7kEfOUEeKsQj8RZu6YKC6W8ASK
	90D0+FnwmWIIsxs0GxWdUBkd0pGeYPRHTjARb4f2Rpv3vG41xNjsVbn1k6CGW0q4oXD3iSNCxJxym
	5jLsfOCF+4mCPujvRWeW+oL0ukT70yOmuO94CA9BfphUMlDKsBvUdv6v6IPaulw1z/XlZIAu8+unZ
	W30e37xBk7ILxbFnuECaRHVNMcIUO5J7AgbowBmz7aijQXnXrUsF8kyKQmaBcD4PZtK4/f6IAm44i
	kDEWvvPuvfRYb8Xpxv8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzoh-00000003CcO-0XtK;
	Wed, 29 Apr 2026 07:58:43 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzod-00000003CaS-3Z3n
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 07:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777449492;
	bh=uhX+w6XwKjqgyOER12UA6gBp12QqDAT2tbAmGEVGPNc=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=Jwm4w4xdU28CbAV0aS7Zd9moE07XnwMFgfzXJljgt8EncnviGaH12IpIHWaHmuVKV
	 7NJ6j4KeShzEbpWMuEOaTuNVWe6y6cp54fqdgmLZtYvt4KWto2lkoJY622dtv48/1g
	 UkWKr82AofTjY+g+YDQC97QOmGnK7KXZlmLgcdAk=
X-QQ-mid: zesmtpgz4t1777449482t561b6079
X-QQ-Originating-IP: oPNXQuoDaU4Aj7Z5fp42tnUZkv/5G9GUdVH0MXc01R0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 15:58:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13107283811911453677
EX-QQ-RecipientCnt: 15
Mime-Version: 1.0
Date: Wed, 29 Apr 2026 15:58:01 +0800
Message-Id: <DI5H97BVSHFW.1ICWSGU0NT7ZO@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/7] ASoC: spacemit: bug fixes, refactoring, and K3 SoC
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
 <afFtyCuA28042C3b@sirena.co.uk>
In-Reply-To: <afFtyCuA28042C3b@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ocns8ug84zPhhJGBtbT9J0Y30kBexwODTXLnrV3FNdn+3dJyR6ewgEP2
	BF/bcOuOdE7a16JjsijWq5uW3nZrbdiOuGW2IDFSity7UES9ma0nHygpwzj7c86XlOlbGIk
	N129rd33eVX8kYfD5h8f5pgvPwzD4NsTnBaaama8XU4w7zeU9frV9dOCEdyvZ5T3/Vz17gb
	UwwWwBamGjNq04K6oX1dnlzNVLlu85Clw6RwbQB0nwPNJxXD/IATJZgp/u5gPPGEfj2Gx8U
	LqxSZwtNp7xdMNAGvNG8ji+oPc+gPS6qWdmYLv/Mc87V0bWDBf4VkdDpCdL8UGNCXMfoUMt
	VPuJXkL/5fIQEsYYOSUvG6mKGK2Iv2l79Si7J7YxIbBP84UQ78xdeoe7mReU19QrcyZ1T7M
	Gu5mpfS05SWb3r8Ii/2B+wLdCKTbLiAonwYU7oLXa1/rFAURdujKh64mXBfa8KidvL7nzaN
	LOYEyM04WIYzYPSDznJd3zjpLn3ALrMBY7EIdEMqInFMv+uH1Crh3Hzv3xxOfC3syHBUufl
	U1q+MGsHioKv3ykgOlfUERHkwsgMm35Tia30a0E7Wj/8eCBD3WM1cIEHpDXEe5gRwlXYilN
	zeEuRsGI/6PM24aIeTnnOEWp395KAWNSoTEnfppuJBPOpLiBqQjYHUDIkMUZRAufZWrYuE1
	waJyG9zSbB+rOIrCm6J/xM39B+dU6KPdklYW2F25+0z/Mn//bvP8RUThacOAkJQQ/ZYJgOS
	DjljW+ywddFy+bsQhYu1GQ9p+3/YbyPHsBxxFlhaRduwOxtx0eDy729noFMPZNjF5TO5nDN
	23I1u0nEc5YkyclAhEX6fbTl6thhp6jr8k24JlglNrG47YjO8vcz75LJKEuY8XAflYgCefp
	AH8P9EtVnqgtYJ8HvykFOQAFxY6DTdEa2Uh9oxcHYfPeCQgl+gW/ka6JLWx+2jLKE8mDBDE
	7RFHWCISJKd6SejQG/I7/hOL294Vwx64rCQkLor2czPuiMNoCfaKx586zhmhy4fvqCovluu
	42FVmmDr/wbVZftQx5ggoZhoA2sICm7tr7w9QAPjAQciuhDXQXe47Rt7PFmL3DeesQPhdMQ
	A==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_005840_238548_8A58C9A6 
X-CRM114-Status: GOOD (  10.42  )
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

On Wed Apr 29, 2026 at 10:32 AM CST, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 09:38:45AM +0800, Troy Mitchell wrote:
>> This series fixes bugs and adds K3 SoC support for the SpacemiT I2S
>> controller driver (sound/soc/spacemit/).
>> 
>> Patches 1-3 are bug fixes and refactoring for the existing K1 I2S driver:
>>   - Fix RX DMA params not being set when TX is already running
>>   - Move hw constraints from hw_params to startup where they belong
>>   - Adjust FIFO trigger threshold to half FIFO size for better DMA
>>     efficiency
>
> Just as a general thing there doesn't seem to be any textual overlap
> between the fixes and the new features, it makes life easier to split
> things up - the individual serieses are smaller and it's easier to avoid
> dependencies that cause issues getting the fixes applied.

Since patches 2/7 and 3/7 have already been applied, and 1/7 is a
small standalone fix, I'll send a v2 shortly as an independent series.

                                - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
