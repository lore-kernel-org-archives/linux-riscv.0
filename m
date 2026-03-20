Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3DD1093179
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 06:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9ikGE3WxNeF6dLtxEz88mzVbqnQ/sh9Dlglf8YehlA=; b=D1mLif1xRFsw6x
	9Rx1RgpVoFsAqJnt24jIfL9MbApdLXgCvHjXKjLJkeYKnVPRPetlx/H9RaFfYZkbsP8IgB9z3cAt2
	DSC2RBa5VBWGCPElC0f1NEmjSU5REjQ7vUDfBCPJJRJMHZ4uoQmcmT0tpX14BOOVJ4lLueiJaU2FL
	6oTGONY37g9JzClmQMtLLjgYJycP378a+0yDj4A91riW15u9bXoOeN30obKhC9KnoVP8ihOLQjibk
	VvCZOY8pnUbCKyynT6ZQGepLsQOSJNTDlM5gQnCO/68tP7HIKoOiylETG+zqG6LcXZbhvMgfNSImd
	z61xDqdi4Ckr5VXeZzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TTZ-0000000CBSl-1qJZ;
	Fri, 20 Mar 2026 06:36:53 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TTV-0000000CBQp-2CQw
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 06:36:52 +0000
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37ab6ebd9;
	Fri, 20 Mar 2026 14:36:37 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: thinh.nguyen@synopsys.com
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Fri, 20 Mar 2026 14:36:21 +0800
Message-Id: <20260320063621.1204038-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319214633.cyzr7silffbzisot@synopsys.com>
References: <20260319214633.cyzr7silffbzisot@synopsys.com>
MIME-Version: 1.0
X-HM-Tid: 0a9d09f5d00503a2kunmb2a75f031e8640
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSBkdVk9MHh5NTE1NTkMdS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_233649_732635_23C20618 
X-CRM114-Status: GOOD (  12.99  )
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

Hi,

> In my previous response, I noted to pass the name/id that best match
> your platform in the dwc3_generic_config. This structure is passed as
> private data corresponding to your k1 platform compatible string. That
> should solve the naming issue (i.e. you can keep the name "vbus").

Thank you for your suggestion, I will change it to match compatible.

> > Do I need to check if it's in host mode?
>
> Is your k1 a DRD controller, and that it can operate in device mode?
> If so, does it save power to disable the regulator while operating in
> device mode?

It is a DRD controller that supports switching between Host and Device
modes. I will change it to enable regulator only in Host mode.

> > > Also do we want to disable the regulator on system suspend? If so,
> > > we may need a regulator handle.
> > 
> > I'll add it if you think it's necessary.
> >
> Same comment as above, but this will be more involved. E.g. you may only
> want to disable the vbus when remote wakeup is disabled and power saving
> is more essential (disabling vbus will disconnect the device).

I will consider implementing it in the future.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
