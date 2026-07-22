Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57819C4452D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/xgvtXjRFTLaWyxeory6w8X59JKvfp9XAGSwGmPDGg=; b=4MngzvwwPlzNQC
	Pg+QlcUyeV0E9RQ017UpZ2VhF16Wiu6+Tfw+06h637c5RULWIoI/3DiRiFMcasgxC0ey2abYM0Twr
	6ptmPFX+Ri48sL/PiCM8LBew3PPp5o0L9jSE2AtW7GxaYyiDEqWORgxqtE/ZOUh5sccVHlt4uGO5T
	FSbg9fekiYVE/SrePXQERr+JvXYmmHVXR9UiO6pbBZXtTVE1YdFLXc8cPx2H59P7S/dn8UCVTN2PB
	dspZaD/UPjtn2FS4HTr8xyGcABqFYsOlSoXWxlNP9cTfeIgZ8xaGYq3lVZP0Shs/pKVEp12+UJ5i0
	zGLSLLf20GlWFFpabtRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRnR-0000000BBTi-2aPi;
	Wed, 22 Jul 2026 07:55:17 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRnN-0000000BBKp-2Kd3
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 07:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784706893;
	bh=ob3qR/e2vsX+1qjsXoG7FAFSH5W64ceTqvxJxmOmCUo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QKp+JNpZ85QW5ioAKzxWenfnv2R59MLgaiUEE9IzcpQRlgzWNCem8akyfTIRqvJhF
	 yRmOH7MlrW1uyRBDAIYjGMeNy31kjruVcNsgGpvqnnA5eA0RCjLYfEhdqbYYBDs7nc
	 VXkQQsuEcR9EToojHp1QjYwi28w5z84pjbXC6+5E=
X-QQ-mid: zesmtpsz7t1784706885tf937dd1c
X-QQ-Originating-IP: lTD3ycMX/Wwp32bRf60m3b1xQMLcYAzEX37sN8hX1YM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jul 2026 15:54:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7589895340956616953
EX-QQ-RecipientCnt: 10
Mime-Version: 1.0
Date: Wed, 22 Jul 2026 00:54:41 -0700
Message-Id: <DK4XSEPSTY3I.O9ZFCZ9BJGNW@linux.spacemit.com>
Subject: Re: [PATCH v2] thermal: spacemit: k1: add shutdown action and
 reorder registration order
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Pei Xiao" <xiaopei01@kylinos.cn>, <shuwei.wu@mailbox.org>,
 <troy.mitchell@linux.spacemit.com>, <rafael@kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dlan@kernel.org>, <daniel.lezcano@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <1967d2bcc8fede6fbd25fc8eee07f2873fb41472.1784184867.git.xiaopei01@kylinos.cn>
In-Reply-To: <1967d2bcc8fede6fbd25fc8eee07f2873fb41472.1784184867.git.xiaopei01@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M4EB473hmYa3VkLIpdYraaUyE41H4rPeW2jcURyl1coWEmil6ER8NctQ
	eQW6Ad+zsIIguNXv0cBLUrXDznyXKYkd3SNbnTY3zTitTywF4tV0QYw38FDWHmwV/5GF/GA
	Q1tD+Tlr48iNKpEjS2MIBdMSvqn/w3/PdFC0XBHhKUjGnQ10qZHcGVYHLSFt8GdM6kXgSTJ
	rwhKpcsjsaOG31ojG2aNZTwOUk3IwiKOJ1pSGns5hvYn9Iy0I6wufz/jH5iF5yTGt/hTzAB
	PAzsil8bK94gDYUg45iHhHL3wUFp58COEqJsVbPpb/Wc61nfG1yBPD/BQ1Co8LPJ90jQrZd
	00if9Umsq5qfDUtUk+/8yaeZzUzORFWY9tOvMnXtOHi8ESReG6REO3H3DQC6FJlvStfEpCQ
	YMn5+5BWmMxaysPcCHzzHT+NsWhV8+mLju/1ttkRPR8yyzNp5YwliFzahUZ+nEaHTNCCb0W
	nGvx9D9LzEygJy/1+mYWnrnTDYBqgwcgXDFe3aSHP0ZA3fOJR/N1n0faBh3TxsbEgj2ylX7
	BSotYi2AWOBPYgQ59K+AePZw7xBiVnspvSX6W5HSkxolc8W+4x0gRIotDRBukpNLyZX5gID
	QXLy+iMIkc5Xg1GQiy2/US2/M2bIZBEu5eODNXdCnyAsesBW2+sc3qNvM/coknyl5erKkfI
	R0MYOv6Srr+LzInVdoqjnh1I1qZ2yw0AfCoVVjUANn47jCS5dNRQe9Ax0Pa22ffuVuNflUd
	4i+hFxrGo36S8ytY+weu6fKPo2vFnd6pgPxcDnoFK6Jizx+wGRXRHBqIsnRLOjcdsAR2tvj
	oI9ZWlcn7Pm3TjGsV5v/ngad50G3tDc6DJq0MZ2tLcCLySnKcQmyIn6FAmqU95KkYVims4O
	gzBEwqvGDb8HUngJE71MJDfMEr8ueN6jMhtwCtRCuSMZOIoI/BECGin/hOzKiwHA8VoahJH
	FBs26iyJVqXuw6BNYyiIPFrz3QjeJE0AWTrpUHgSXbckRD9nNhfm5drL03SNqGeZNeROAX8
	z+bPDqQmTJdWOHScOsFz9nueF6ORVFDuNfn/MYuuvKyM3AE8LzyrP/0iI2nZ4=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005514_422956_452C8782 
X-CRM114-Status: UNSURE (   6.10  )
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

On Thu Jul 16, 2026 at 12:04 AM PDT, Pei Xiao wrote:
> Add a devm action to clean hardware interrupts, sampling, and control
> registers on driver unbind, mirroring what k1_tsensor_init() sets up.
>
> Reorder the registration order within probe(): register the thermal
> zones first, then request the IRQ, and register the shutdown action
> last.  On removal, the hardware interrupt is disabled first, then the
> IRQ is released, and finally the thermal zones are released.  This
> avoids the IRQ thread accessing an already unregistered thermal zone
> during devres cleanup.
>
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
