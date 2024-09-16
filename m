Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DACAC3ABCB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 03:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1KbqjOVRln9hsEOvf4zkBm0MLoA9I6A9OFDw/6vj84=; b=K3M7j/sbRWlRzy
	Yzho335bLrb/k1/hZXCNRmjc6Fqeb9rYyUaVb4/PziYA7rrljhU/bs03B9hoKPRQE8k5AYSxt+hGt
	LC5dXLFZvoj7KiwMnKdAV75DdMHz/QhZKNuUB0S+HonqiIQXUTne2lgYR4jzoi/1faLfTPqJnSRB6
	MlZlYXagQlssB8vMFxe7UTUUQhE4lcZOX50m2hJY/fyRQmVTawSn+gLpZq4Nw259rNgFdnROwEphR
	Xb4INWh5bmlz/ogrHjgS2HlNuvFl4BWp8KffX/xK7iQoF9pBAcNjujIHYS34gZsIvz0AmrcpUcrgI
	nrOw6zMvDB2di2zrTMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq2r4-000000031hk-3Vpk;
	Mon, 16 Sep 2024 03:56:50 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq2r1-000000031f4-49OS
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 03:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726458990;
	bh=uQeCiuqofbp7VBgWJBHIBiFbeaUu9Qm1y9Nz4rNP4v0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nO0eOJO5KWXwyCVueVDt4D9I5KPTJD0sKVmtao8eRjcHWafxPvmzooU09JaV93uwX
	 eX3f93sxxtk7dxw/1a5h3q3dH+tcpn/UaF6T2fT/KIhX1LTPGnTNLh59HtdSkvwtk4
	 A8mnxB2KsRJ+93TfcjmFHPqctyrVKSQzPwa3QicA=
X-QQ-mid: bizesmtpip2t1726458973t9xfue2
X-QQ-Originating-IP: 4+X9rNC0rfWCVm+jTaZrmC9K3XSZNEdwwr0L1XVgKWM=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Sep 2024 11:56:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14186944467596871158
From: WangYuli <wangyuli@uniontech.com>
To: christophe.jaillet@wanadoo.fr
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	gregkh@linuxfoundation.org,
	hal.feng@starfivetech.com,
	kernel@esmil.dk,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	robh@kernel.org,
	sashal@kernel.org,
	stable@vger.kernel.org,
	walker.chen@starfivetech.com,
	wangyuli@uniontech.com,
	william.qiu@starfivetech.com,
	xingyu.wu@starfivetech.com
Subject: Re: [PATCH 6.6 v2 1/4] riscv: dts: starfive: add assigned-clock* to limit frquency
Date: Mon, 16 Sep 2024 11:56:10 +0800
Message-ID: <87764635B0614447+20240916035610.64002-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e2d7ed77-827b-4b7c-800c-9c8f3bcb6b5a@wanadoo.fr>
References: <e2d7ed77-827b-4b7c-800c-9c8f3bcb6b5a@wanadoo.fr>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_205648_511866_155C48FC 
X-CRM114-Status: UNSURE (   3.02  )
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

Since this commit is already in 'linux/master', changing its title for the backport might just make things more confusing.

Thanks,
--
WangYuli

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
