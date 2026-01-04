Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF0AC2A069
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 00:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74CmYau6RVdCGFrHM5BypPCsH1wqM+2N6Hijttc8NRU=; b=XZy1Ifgg7AvBwN
	hhDLg6k/Oj49RH6t1AwRZyLBsdmd0lKQ5755cSeZvi7TlbaCy2jX1zvz1zzx8CBzJLj1zs3Z6dpPi
	axtK55py7aob9IvPkYQiwjcpQLtmAO5peBWuAYXW/Fu9THZ7yiiJVaNsF2Zid3Iwkkv4ztLflGRGN
	HBkU9WLQPKGmAovGJlesL5KbHVQV3g5dtyyuOuD4ieTtrNil+qGxtufV/5PY9CmDeuFUuGb1oxPf1
	VZEjkt8RFyTBvzuDf4LVGVW4rXqa+IxlhTMVNsZTTwUniDBzEqc8rcZuFG7Wy52bqvh9J2qrtXsRq
	u+/Mdb8ZvrC3cfjf97BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcCNJ-00000009vH4-0z8K;
	Sun, 04 Jan 2026 00:53:41 +0000
Received: from smtp20.cstnet.cn ([159.226.251.20] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcCNF-00000009vGG-1KL9
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 00:53:40 +0000
Received: from xujiakai2025$iscas.ac.cn ( [210.73.43.101] ) by
 ajax-webmail-APP-10 (Coremail) ; Sun, 4 Jan 2026 08:53:21 +0800 (GMT+08:00)
X-Originating-IP: [210.73.43.101]
Date: Sun, 4 Jan 2026 08:53:21 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>
To: "Paul Walmsley" <pjw@kernel.org>
Cc: "Jiakai Xu" <jiakaipeanut@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Nam Cao" <namcao@linutronix.de>, "Alexandre Ghiti" <alex@ghiti.fr>
Subject: Re: Re: [PATCH v2] riscv: fix KUnit test_kprobes crash when
 building with Clang
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2026 www.mailtech.cn cnic.cn
In-Reply-To: <5cad53b9-e6f7-d8c8-8c54-c4e5af035bbf@kernel.org>
References: <20251226032317.1523764-1-jiakaiPeanut@gmail.com>
 <5cad53b9-e6f7-d8c8-8c54-c4e5af035bbf@kernel.org>
MIME-Version: 1.0
Message-ID: <30edddae.8142d.19b867e943f.Coremail.xujiakai2025@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowACHn+ICullp3dMEAA--.53828W
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAcPCWlWjT+CcgABsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW5Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_165337_744407_B76D160B 
X-CRM114-Status: UNSURE (   0.17  )
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

Hi Paul,

Thanks for for fixing the formatting.

Best regards,
Jiakai
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
