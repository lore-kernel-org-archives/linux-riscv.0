Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26706CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xMrdzQigIRglnfIvA4Ca+mkBTJE4s1DovQ1AOHiqIA=; b=Y2Uft7z6UwMxh+
	uu70OOfGlbdZZR9zyEO8/Wq3gXNAPeV1rLZtO+J3JdliLTiFDNli5MJoixy2qAvjXj5LUbOCNlrQZ
	dBain67aCoA/gmQwaum5k9y5hNQGNouFFMLT8tCyorNbn//85Le1KcyorWQWWpKEDOG/IxEmNWZnQ
	a6V0CVbBxmDRmFjRPm/LAg1cz56vJjlR0fKx0Mv8C/E7LzSf+HwQ9Rggq3bvCbVRoSx/mW+U4U2NI
	Ilx9qryNgS+maIwYXyAsymfUlQ75kU30PIvYv8gWzaLC/zhHw/+9Jh+p22peHeOqT53xHa8fv91h4
	ashsuo+qot1m22qv/vNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st8Oi-00000002pM7-1KEf;
	Tue, 24 Sep 2024 16:28:20 +0000
Received: from shrimp.cherry.relay.mailchannels.net ([23.83.223.164])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st8Ms-00000002oz2-23Jt
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 16:26:28 +0000
X-Sender-Id: dreamhost|x-authsender|matthias@kaehlcke.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 19D8148629;
	Tue, 24 Sep 2024 16:26:24 +0000 (UTC)
Received: from pdx1-sub0-mail-a261.dreamhost.com (trex-8.trex.outbound.svc.cluster.local [100.99.104.27])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9873B48567;
	Tue, 24 Sep 2024 16:26:23 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1727195183; a=rsa-sha256;
	cv=none;
	b=HFqeqapJ9owPzlOB2dWy8IE6bvvGnBP6UTSBdMtWDOqgnS/8MDUfzGN39f8eBgN1lrAqMq
	4We9rdNqHUKFdt8wcl2ZArrU+bkpf4NQa8RUL3ZhfvKC6vFHvO/Jcs2gy0/ELbV8QQZrGE
	oclwm/V48+K0Et/m0DL0I44fjxCGEcCuWdVv7eriERZZiOL/vaA1O8grMkhk6gTwHm8K1N
	nPaYuazJ8GS9JREn9zjKKbbmnobQItZmlAAo/YbdF2wzItirYoxU4wq+lXKK29wTTRDBEm
	9vm9nRYk+fkY+8dDw8P51b9thw89U+ebilNknMpOzi6hSS1xZEet5en1V6yNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1727195183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Av61wivpiKXZjT8Fw53JLo9cG+2oIzCa3ZDTt2rhlG8=;
	b=8fcPh0eJf0UPe8ywVhbs4viVl+sjcEGbUH5Ai096+vs4M66M35fZwc02PEbQKpHsd/SlaK
	9X2VPqgmbpgX2dfYOmKybylNmLIfXiKXJcuXL1MIqAsjKSaw/eVKelR57o9fq2Pvh1+JY+
	vVHFCxWPYAswY2YrQ0CkAa7RQzuG0O6X7r51Rty+L/mwv9BKn4Sdqu2sQxXo1fgdG2mIrU
	D2+MjMbxMnqewdkuLowpLkAaNTDYk5Kdm2H1JkBVWQDDz5+PMgIiNsOWzmbhDScOVHrZEi
	T3gck4yXRn24+7YoMrQmDIwgkOJaS0Z2lM0KcUWvDWs9V4FkIU++VhKftq9Brg==
ARC-Authentication-Results: i=1;
	rspamd-5b46bcd97f-cgxsc;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=matthias@kaehlcke.net
X-Sender-Id: dreamhost|x-authsender|matthias@kaehlcke.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|matthias@kaehlcke.net
X-MailChannels-Auth-Id: dreamhost
X-Dime-Bitter: 24513f152aaa5c04_1727195183933_302722891
X-MC-Loop-Signature: 1727195183933:3524963969
X-MC-Ingress-Time: 1727195183933
Received: from pdx1-sub0-mail-a261.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.104.27 (trex/7.0.2);
	Tue, 24 Sep 2024 16:26:23 +0000
Received: from curie.home (unknown [79.116.59.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: matthias@kaehlcke.net)
	by pdx1-sub0-mail-a261.dreamhost.com (Postfix) with ESMTPSA id 4XClbz19Gkz6t;
	Tue, 24 Sep 2024 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaehlcke.net;
	s=dreamhost; t=1727195183;
	bh=Av61wivpiKXZjT8Fw53JLo9cG+2oIzCa3ZDTt2rhlG8=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=aGNiBOvroj3D/7SlmHNiYCLyyGBkTS8vBv+WHsJsNMmzpvXWFasFhlmgA6QtG+2Z6
	 eIlXu6vSZqwnBhE2oORVNZjLaNcx5ICeKYu2qyqHdbZ/Cn/Oyy4uV1F0zV+p9wJs0L
	 Ex639wf6cyzgQBn/11Q2TqYi9Ieaa6hE0Gi9e/pwIArKAeb/MaarYXp1pU+Iejqocd
	 tkbYvWI9SGD3kDoeP9p0Rrm/OpfvOw8s3cQehktGFV0P3P5+dFgyoAOxHW0jxo19YB
	 IxxfypW6UpTNpjpWWni0JKYjl/GoiTpeY0eQ4jOp/6kDEFtHjVyTeiOdieX9NEkzuE
	 udTBwIvGI4hgA==
Received: by curie.home (Postfix, from userid 1000)
	id 0E119102310; Tue, 24 Sep 2024 18:26:20 +0200 (CEST)
Date: Tue, 24 Sep 2024 16:26:20 +0000
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, mka@chromium.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, wentong.wu@intel.com, oneukum@suse.com, 
	javier.carrasco@wolfvision.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, git@amd.com
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: introduce new config symbol
 for usb5744 SMBus support
Message-ID: <t4ghbba233fsrq5ec42dbwjzirtmxtmknu6xnenqgizrcqjm5u@w35ssjatzxgb>
Mail-Followup-To: Matthias Kaehlcke <matthias@kaehlcke.net>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, gregkh@linuxfoundation.org, mka@chromium.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, wentong.wu@intel.com, 
	oneukum@suse.com, javier.carrasco@wolfvision.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, git@amd.com
References: <1727187551-3772897-1-git-send-email-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1727187551-3772897-1-git-send-email-radhey.shyam.pandey@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_092626_716442_8CDEB67F 
X-CRM114-Status: GOOD (  10.36  )
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

El Tue, Sep 24, 2024 at 07:49:11PM GMT Radhey Shyam Pandey ha dit:

> Introduce new kernel config symbol for Microchip usb5744 SMBus programming
> support. Since usb5744 i2c initialization routine uses i2c SMBus APIs these
> APIs should only be invoked when kernel has I2C support. This new kernel
> config describes the dependency on I2C kernel support and fix the below
> build issues when USB_ONBOARD_DEV=y and CONFIG_I2C=m.
> 
> riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o:
> undefined reference to `i2c_find_device_by_fwnode'
> drivers/usb/misc/onboard_usb_dev.c:408:(.text+0xb24): undefined
> reference to `i2c_smbus_write_block_data'
> <snip>
> 
> Parsing of the i2c-bus bus handle is not put under usb5744 kernel config
> check as the intention is to report an error when DT is configured for
> usb5744 SMBus support and kernel has USB_ONBOARD_DEV_USB5744 disabled.
> 
> Fixes: 6782311d04df ("usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support")
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Suggested-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409140539.3Axwv38m-lkp@intel.com/

Acked-by: Matthias Kaehlcke <matthias@kaehlcke.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
