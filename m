Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2719C43461
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:54:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F407D20732
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G5pFSENm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F407D20732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cri8ydTCw4NsaDgHd2aP1rWE1PvuPz/ttsplKLe5Xh4=; b=G5pFSENmaR8nlaBKRiL3PjkO6
	XP2PqNhUVLjq8f54RMHmihE12FZX2eI9z79z1CpSwB2a2CfZssxKO6XfJkM9F3Y6UoEJcpKmBykL0
	d0K+x337mJnfwPCLxPQTNwoZ5+0c5E6bZrKwwhd51d7DjIKBhuE/h9E6xvvokhOCwsMpG+iTAA2+0
	AI1JA6kJ6PjpD6mLGhIe/rW9ufBKg1ENaMwPmJVlapO/5iBj5NpWbt5ELQ5gLAJNhr5sb2YHeKggU
	esVte6SLiSngwSRDtpJmWsHsJrNqKi605xAKnpC0bKD4yqx7ThAjtOWZ90qjoy+/M72KUGD1OKKO7
	JtzBKVxjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFA6z-0003dM-QD; Mon, 07 Sep 2020 05:54:41 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFA6u-0003cz-Ar; Mon, 07 Sep 2020 05:54:36 +0000
Subject: Re: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
To: Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, palmer@dabbelt.com, 
 paul.walmsley@sifive.com, bp@alien8.de, mchehab@kernel.org,
 tony.luck@intel.com
References: <1599457679-8947-1-git-send-email-yash.shah@sifive.com>
 <1599457679-8947-3-git-send-email-yash.shah@sifive.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <697413e6-8f44-8db4-6434-0f22984bdc9c@infradead.org>
Date: Sun, 6 Sep 2020 22:54:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1599457679-8947-3-git-send-email-yash.shah@sifive.com>
Content-Language: en-US
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com, rrichter@marvell.com,
 james.morse@arm.com, linux-riscv@lists.infradead.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/6/20 10:47 PM, Yash Shah wrote:
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index 58cf8c4..f41d8fe 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -7,4 +7,10 @@ config SIFIVE_L2
>  	help
>  	  Support for the L2 cache controller on SiFive platforms.
>  
> +config SIFIVE_DDR
> +	bool "Sifive DDR controller driver"
> +	help
> +	  Support for the management of cadence DDR controller on SiFive

	                                Cadence

> +	  platforms.
> +
>  endif


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
