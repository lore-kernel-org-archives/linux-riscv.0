Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C662D5B16E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjGxlI2wo5hkMZyKSckLyzV+0TL3kLyI6r3FQgYlETs=; b=TaMG1XunYDGRf0
	5oXNyTtg5L6Aj9gZ7sp833rQ8SwxrjEqXuNaSllYm6VomMijGy2USzHKfn6kcICX7iB0arPp0NXXe
	kwNLVJ8Vn0/4Q1qwFAAYSxMmOZSfivKrw02hJNlhgWHWmgj8FBCDCJgm0xFBcWf1b4T1J5cA0s3c3
	oHe/B9NV3n9+yfsxY2GALo5YBRpYT1ObutKUtgkbw0rR5HsCCnuWcGNOljG/G3dHHI2w5i8kM8eqF
	4Hof/ZN9AlyAB5rga8vKL09CGN+9kdyiMSW+Ab181+wJneFD8jlDJeG+WnhIuU4JBXt8reTJVpN0V
	Pgplu/qMhM6NT2n5o15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV89d-00000003esw-3uWK;
	Mon, 15 Dec 2025 12:58:22 +0000
Received: from mail11.out.titan.email ([3.232.242.252])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV89b-00000003esb-09Wn
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 12:58:20 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVKqY6KDsz9rvZ;
	Mon, 15 Dec 2025 12:58:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=RiuvV8doWIvI+LA/Gooe1GSm+xuIbthDxNBReRo2tDM=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=date:references:mime-version:from:to:subject:in-reply-to:cc:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765803497; v=1;
	b=btHMu4ZOZqZmz3/4qj/V5BIFQqr8Cc9S5/UaVgvlxgBKFcAdNPMJ+8umJSdecIbmeer5UDto
	+OPI8vUZhXaZcaagzxGX2Lt3UFYJbousox8n3hEUkFbetxdZYpbL2STCStcswmcQ8Ly4oCSoa+Y
	gL6ssj50X6GJqpPcGPHwuYz4=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVKqV6wxkz9rym;
	Mon, 15 Dec 2025 12:58:14 +0000 (UTC)
Date: Mon, 15 Dec 2025 12:58:10 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <aUAF4iNjuP5AWJaf@pie>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765803497717525709.21635.4362804983732486918@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=694005e9
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10
	a=FRBM4k6udOhyZSGeKOUA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
	a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_045819_162108_52AFB4A7 
X-CRM114-Status: UNSURE (   7.59  )
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

On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
> The OrangePi RV2 board exposes i2c2 and i2c8 buses
> from the Spacemit K1 SoC.
> 
> This declares devices present on such buses, in particular
> the at24 eeprom to store MAC addresses and the regulators
> attached to the PMIC on i2c8.

This series is named as "Attempt to enable MMC on SpacemiT K1 boards",
what's the relationship between MMC and PMIC/I2C bus? You didn't make
use of any regulators in the second patch, either (which seems wrong to
me).

vmmc-supply specifies the card's power supply. And if you want to enable
SDR modes which mandate 1.8v IO level, vqmmc-supply is also necessary
for switching between 1.8v and 3.3v.

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
