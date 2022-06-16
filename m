Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425BCC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 05:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0d5VK/PsTXB2+pR+Zn1WZqIsrUf4awqF96/7yeqRfyQ=; b=PxVhaL0pVKMsT+
	dWSbWNA95fG8ncYSG7uBbKMyTqE7XWUxbOpIhxTqD1xw+wE0LyN6vsMX1C0z5zISRXJxEb55diFf0
	fIhCiMMf40a10TduCMGmnW+bjG9N6w0R0VmuvtXeJ9bY0NPwnmhkEzFTPi6yEuiCi/r75aZZD8Ieh
	tWgPewWmjxtlPbkMmubMCvk/HjNUljqK8U72CvmarKQXpUkbgNutA35YPmkKICIY1JVn359s85RTd
	qsCnxkmy6SECfUAdoxEZms9TRkwLm4i2Lw2+lxLXrEtItAxmiouAVhinpZ1yj1MttQBkzqLxuW3J1
	oU2IB465G2qAXKvDEBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1iT1-000eYo-3i; Thu, 16 Jun 2022 05:54:55 +0000
Received: from m1524.mail.126.com ([220.181.15.24])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1iSw-000eWf-DC
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 05:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=TGNnE
	bgER54kno8uDuAkCA8vdekRFZ7/trMUSYHqvqQ=; b=IUfc4qgjpBpoP5kuZQmg8
	jTEQzFxleena42Hp6/tFgCaKBXHyU+B6q7jETb62bb2G60os1f5rXTg4fY0Cxyib
	eqiInswgCH/N7+8Oiwk7JK6+dokA8Ymd0cBwblFQ6HQHbGFUKG2m7y5KtQXhsvC9
	0Z0eYRa6eyq3JGz26qK2X4=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Thu, 16 Jun 2022 13:54:38 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Thu, 16 Jun 2022 13:54:38 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"kernel test robot" <lkp@intel.com>
Subject: Re:[PATCH v2] soc: sifive: (sifive_l2_cache) Add missing
 of_node_put()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <20220616044915.3978097-1-windhl@126.com>
References: <20220616044915.3978097-1-windhl@126.com>
MIME-Version: 1.0
Message-ID: <28cd6700.3e2d.1816b13f1fa.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowABHViafxapiUgE3AA--.30098W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3B8iF1pEDuvuPAAAsf
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_225452_054410_C3D70260 
X-CRM114-Status: UNSURE (   2.43  )
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



At 2022-06-16 12:49:15, "Liang He" <windhl@126.com> wrote:
>In sifive_l2_init(), of_find_matching_node() will return a node pointer
>with refcount incremented. We should use of_node_put() in each fail path
>or when it is not used anymore.
>
>Reported-by: kernel test robot <lkp@intel.com>
>
>Signed-off-by: Liang He <windhl@126.com>
>---


Sorry, please ignore this version as it still has a bug.  I will have a strict check and compile the code before my next commit.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
