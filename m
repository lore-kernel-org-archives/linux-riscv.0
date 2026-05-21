Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83B6CD4F54
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 02:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EiiVtRue6GwnvVDiKE2829xXufJls569DufwBTM3QpI=; b=srkgdkK3oigDNZ
	xods+LOiL04/r43Z0urxGeX85MgtVkNqRTL8JgQp1AOQN4DAqy7ZO+Zc+Q5vhhpEXgml0r9QwzGiK
	gLMzXeGOLqOuBp9S06+W5R7snIYULJOMmKz2aZBBNRQqiqnEqcje+0VwPAi8puSnL4eNov+O6GflW
	GnbyzabhEfzS2sZ/YpUu20pao8wjCODRFSKOaIVFm9h4oQ1bN22hNiWqHvwpFtG50iDAnY4KhqNVk
	2PzlWlR7uPrVc7boA5Z2IQ9OMliznVD395UyPp4Bz5xRmiyS4UhyvsbYnlI4kjrw2lUXiWrzBOEkV
	bXWSLKFIO9znjELif30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPtIO-00000006Tn6-3eGd;
	Thu, 21 May 2026 02:38:00 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPtIN-00000006TmZ-0rp5;
	Thu, 21 May 2026 02:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779331064; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E5oWCZIybdeNyISXzzZVKehJxZXDCQabRMC6IEAO8/5SXUS45j9OGdfN8KLNldnLBXYHMNq+prgG7eCKNvZcR3xw+cbu9aGb0cDSQ3chJmE0bVMcugFwSrlz59LQp2+H0K6wD6NEGsXW/myxeP7l8DheUjJ8kqvcfgwCNY7vpbQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779331064; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MyVARbUM1IuwTJO5a05pcpY4gz3lHi6U1SRewVObKCw=; 
	b=RQCKhWHGZJVRd3/x6zPCWgh/7BUGqJ/ZgalB92AskqXyYCBfb37CPxXxBTjuev4X8IXYM6qC4jWoPXZ0LkVMS5UYCkIkwH1bYJEsf8Rafk74f/afX3tHPSl8jWRfBU/JCd93ebuoetESPla0T9xLb4lrZ1AYhB/snR5fC/ZtEAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779331064;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=MyVARbUM1IuwTJO5a05pcpY4gz3lHi6U1SRewVObKCw=;
	b=nfZg/cGnLpxw+/LfxHpl+LQn3+5QDWrkapRi3zFJ6ii/xRd5Ji2BcpQlkwTbwGVr
	aPRGF2nKgB0tE7Iz0LSk5teAx3f310MkmoxhvWFl0ZKDCF1TLJ72WupXzjl7LP8iilt
	RNf+80p41rPP1Xi8aKv0liWpM1TQWXc5P3tbV78I=
Received: by mx.zohomail.com with SMTPS id 1779331062268454.53335231037977;
	Wed, 20 May 2026 19:37:42 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 21 May 2026 10:37:30 +0800
Message-Id: <DIO07RWUBUJH.34HYMR8R5C61I@pigmoral.tech>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "open list:RISC-V ARCHITECTURE"
 <linux-riscv@lists.infradead.org>, "open list:RISC-V SPACEMIT SoC Support"
 <spacemit@lists.linux.dev>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 4/5] riscv: dts: spacemit: enable SD card support on
 Milk-V Jupiter
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Aurelien Jarno" <aurelien@aurel32.net>, <linux-kernel@vger.kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0
References: <20260519041458.3287843-1-aurelien@aurel32.net>
 <20260519041458.3287843-5-aurelien@aurel32.net>
In-Reply-To: <20260519041458.3287843-5-aurelien@aurel32.net>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_193759_296312_DFCEF864 
X-CRM114-Status: UNSURE (   6.63  )
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

Hi Aurelien,
Thanks for your work.

On Tue May 19, 2026 at 12:12 PM CST, Aurelien Jarno wrote:
> Add complete SD card controller support with UHS high-speed modes.
>
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with pull-up
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
> - Alias it as mmc1
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Both UHS-I and standard high-speed cards are tested successfully.

Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
