Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7A0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 05:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64mekBCHP7NlUNGZb5RgJd6SQz6kCk94tHbup9r5Cyo=; b=HKQj1yvTvZSqyw
	TMvp62vCNmx4apFzSzqhVSPpuT/p0f6Zz6mXwlp2d8itn/CZ0KT4e9MHjQC68cJShamxBsS9o2vGf
	evy78Vo43HRr17rrDTSY28YVcnY1V2IXDMcblmRdp+n9n7Z33f1kklIuReEtXBSusAnjaTi7xd060
	T3ik1WwrjSBPA2t9eQQ+P+b5ybH6KSwjRdu+mIN90hYn3NU/0+7sxEYSa1LvuLNsHDcb8ghNsDRis
	HjMCnBe+bfgBlyIyV5Z4vBezFyNRqqyksRwcsMhQqDc8hO1A4DyEbF4kuIqI3sDajwVn2m/UO1a+z
	lW0/GKlztANKEVTTqpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfEGH-008cO1-0K; Fri, 15 Apr 2022 05:12:49 +0000
Received: from smtp83.cstnet.cn ([159.226.251.83] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfEEE-008bKf-1o
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 05:10:45 +0000
Received: by ajax-webmail-APP-09 (Coremail) ; Fri, 15 Apr 2022 13:10:36
 +0800 (GMT+08:00)
X-Originating-IP: [124.16.96.42]
Date: Fri, 15 Apr 2022 13:10:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>
To: "Anup Patel" <apatel@ventanamicro.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
 "Paul Walmsley" <paul.walmsley@sifive.com>, 
 "Alexandre Ghiti" <alexandre.ghiti@canonical.com>, 
 "Atish Patra" <atishp@atishpatra.org>, 
 "Alistair Francis" <Alistair.Francis@wdc.com>, 
 "Anup Patel" <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "Mayuresh Chitale" <mchitale@ventanamicro.com>
Subject: Re: Re: [PATCH] RISC-V: mm: Fix set_satp_mode() for platform not
 having Sv57
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <CAK9=C2V0kiV1_12kMDxv6d4nsQZ81-9W5=JifLhNaiZMoHJyuQ@mail.gmail.com>
References: <20220412033335.1384230-1-apatel@ventanamicro.com>
 <4c4c7a.17284.1802b8c14cc.Coremail.panqinglin2020@iscas.ac.cn>
 <CAK9=C2V0kiV1_12kMDxv6d4nsQZ81-9W5=JifLhNaiZMoHJyuQ@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <373ad9c1.173d2.1802ba15993.Coremail.panqinglin2020@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: swCowABHcM5N_lhik6QBAA--.12846W
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQgRDF02bFOZcQAC
	si
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_221042_520662_9C6A36BD 
X-CRM114-Status: UNSURE (   0.06  )
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

Hi Anup,

&gt; 
&gt; We can't assume that it will be the same pgd_index for Sv48 and Sv57.
&gt; 
&gt; For example, some hypothetical SoC might have RAM starting after 1TB space.
&gt; 
&gt; We should ensure that early_pg_dir is cleaned entirely for detecting the next
&gt; mode.
&gt; 

Got it. Your idea is really more stable. Thank you for pointing out that!

Yours,
Qinglin
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
