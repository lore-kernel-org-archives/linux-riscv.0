Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD73C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87FHxb7dqy3dqY6Jyca/bS2b27FnvOc4TlJp+I58LC8=; b=HzSWm5f4wMShsJ
	/qY6Vz09IGI0KxfbJRQMPkP82XbeCyLt14I+v5WKVXt4TiVHP1bpTw5WTuhkPrVTzBu0A15tSZd9m
	M/X7C5s4axWJqk5e1prcZs8kMpC/FuazsoFaP1wQ8TnZ0LXdX59P2g0KoDDr5JaLHpKmEpPnR7acU
	oZ790tP27n/3L3hc9fonMezL/GkzcCts8NO/ZCJkR8sHHmD0SsrKqTP7t7RmLylH7hfIaTQ4fBEC0
	andL0Y4H/CgckrPCgQR4oXo3Nzg7EUcsOwBmWdQj28mCBUZW6EvevDXd8lrOohJ8NmMb13IzlFO0l
	YvMAOhMWYf2/iN6YXGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRICW-005ni9-38;
	Wed, 02 Aug 2023 20:12:08 +0000
Received: from 18.mo561.mail-out.ovh.net ([87.98.172.162])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRICU-005nfV-0B
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:12:07 +0000
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.143.109])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 45288268DF
	for <linux-riscv@lists.infradead.org>; Wed,  2 Aug 2023 20:11:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ngzf7 (unknown [10.110.115.108])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 51E9F1FD5C;
	Wed,  2 Aug 2023 20:11:57 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-6684bf9d7b-ngzf7 with ESMTPSA
	id /o/REI24ymTfJQAASXnxfg
	(envelope-from <andi@etezian.org>); Wed, 02 Aug 2023 20:11:57 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R002b9c406f2-25d1-4ea4-a4b2-02c6855a5449,
                    0C641BB37B7CC30D107EA61C426C60CA54BC1A77) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From: Andi Shyti <andi.shyti@kernel.org>
To: brgl@bgdev.pl,
	conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Zhu Wang <wangzhu9@huawei.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH -next v2] i2c: remove redundant dev_err_probe()
Date: Wed,  2 Aug 2023 22:10:36 +0200
Message-Id: <169100562785.1919254.291391952713888023.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230801134814.247782-1-wangzhu9@huawei.com>
References: <20230801134814.247782-1-wangzhu9@huawei.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13298848225985038919
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkedtgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_131206_240596_0C3E73CB 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi

On Tue, 01 Aug 2023 21:48:14 +0800, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to print error.
> 
> As the comment of platform_get_irq() says, it returned non-zero value
> when it succeeded, and it returned negative value when it failed.
> 
> 
> [...]

Applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: remove redundant dev_err_probe()
      commit: 6a07ab839a9c14df82ba2fe0b5dd4faa85a64d89

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
