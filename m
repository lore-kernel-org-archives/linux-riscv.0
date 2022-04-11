Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94AFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngsZ6r69zFCiRuNNgg/XLOG2lt11zw6DE7rHU26xAqA=; b=KCl4R/KNJ8uvuP
	68NvfSglnNH99hbICAlJpmmtlJjPj2DCkmRixzSZEdkhnD+7MSlpFjqXpQh0wW10xWArg1o+3OzTU
	GZ1RAOxU8Vcw6DZcOie1sJ5eCVZhrN6zdhyX5BTx3SEqIl0ExfTxOLO3+wnChxMRBWygNxoE5Ci8u
	PKdlw8Tmf+Cf00RaU9cTq/auT/RNOiU1EyG6dGBkfXZg8VJA4vUCyXQCZOWLklG6Xwo2PkQByL0XN
	ZA+gKA/3Oc87V2TaMOtFj68DRj1rflLY+EjE4JIo+As/hqaZGEuc6Luf2co7t3PBRBgh287Bq4S3b
	wAyrbnDASKWpF5AdPqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndvCm-009PwZ-DO; Mon, 11 Apr 2022 14:39:48 +0000
Received: from smtp20.cstnet.cn ([159.226.251.20] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndvCj-009Pvj-4c
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 14:39:47 +0000
Received: by ajax-webmail-APP-10 (Coremail) ; Mon, 11 Apr 2022 22:39:38
 +0800 (GMT+08:00)
X-Originating-IP: [124.16.96.42]
Date: Mon, 11 Apr 2022 22:39:38 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v1 0/4] riscv: mm: add Svnapot support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
References: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Message-ID: <71b894f.7d4a.1801910e281.Coremail.panqinglin2020@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowACnr0+rPVRidJoAAA--.6990W
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBgkNDF0TgHl0BAAC
	sL
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_073945_585621_D8A24201 
X-CRM114-Status: UNSURE (   2.29  )
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

Hi all,

Sorry, a correction is needed here.

&gt; 
&gt; Qemu support for Svnapot has been accepted but still not merged into master.
&gt; So the qemu which we use to test this patchset is current in this repo (it
&gt; contains qemu Svnapot patchset):
&gt; https://github.com/plctlab/plct-qemu/tree/plct-virtmem-dev
&gt; 
&gt; Tested on:
&gt;   - qemu rv64 with "Svnapot support" off.
&gt;   - plct-qemu rv64 with "Svnapot support" on.
&gt; 

The Svnapot support for QEMU has been merged into master branch. Tests for this
patchset can run on it directly now, with cpu option specified like
"-cpu rv64,svnapot=true".

Thanks,
Qinglin

&gt; 
&gt; _______________________________________________
&gt; linux-riscv mailing list
&gt; linux-riscv@lists.infradead.org
&gt; http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
