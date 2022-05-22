Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE0EC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 02:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VH5FqyP6tnID3pgdvalyz1yyjECfXiwjytfkYmzWcvU=; b=A1u2/LkzYbKvZO
	cNjl9eRtWvOP8tDzWMC1GyhBxVyG9FV8SKFs4XO8JmFUlIUddwm3kdIHFgp1gJNDhQHmC66LzDGa1
	LrfTXp+1144zPNB9u4CK/kwOI0J5xwbum7U/4XJjCkO/brRGvpQiUUeSv8vOZkkV5pR6+U6+tI1+4
	Q3sAVqsBUFm4rkuFMMuIt5ltCC9krn1Dtn3s5dzh2JTo/lU+43tlu2NkA2xn28nS5Vtwd9evvY7SH
	bUqLQFnrLwl1D/vdaWucmxmWvyWxd+30kUE9iyRFKQaQqgKjax7t31z9xuRSp9OvarQ7rtPOgqUyO
	V/w925gsYHt5Oa3zDN2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsbUI-000OEL-SW; Sun, 22 May 2022 02:38:34 +0000
Received: from smtp83.cstnet.cn ([159.226.251.83] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsbUE-000OCt-BO
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 02:38:33 +0000
Received: by ajax-webmail-APP-09 (Coremail) ; Sun, 22 May 2022 10:38:11
 +0800 (GMT+08:00)
X-Originating-IP: [124.16.96.42]
Date: Sun, 22 May 2022 10:38:11 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: Re: [PATCH v1 0/4] riscv: mm: add Svnapot support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <mhng-5b55d692-8996-4ae1-9a83-a28b09c108f6@palmer-mbp2014>
References: <mhng-5b55d692-8996-4ae1-9a83-a28b09c108f6@palmer-mbp2014>
MIME-Version: 1.0
Message-ID: <4647d799.21b42.180e9a11b39.Coremail.panqinglin2020@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: swCowAC3O5gUooliQykIAA--.377W
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCwcNDFz4lExAtwAC
	sE
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_193830_796148_E7AD59EF 
X-CRM114-Status: UNSURE (   4.70  )
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

Hi Palmer,

&gt; 
&gt; Sorry for being slow here, I got pretty buried this round.
&gt; 
&gt; This generally looks OK, but we definately need dynamic detection.  It 
&gt; should be super easy to do that with the new framework, as we essentialy 
&gt; just need to check for Svnapot on allocation.
&gt; 

Thanks for your comment. I also have the idea to detect Svnapot cpu support dynamically
and will do it in next version.

&gt; Aside from that, just a minor comment: it feels like Svnapot is simple 
&gt; enough that we should be able to fit it into the generic mapping code.  
&gt; No big deal if it doesn't work and I haven't tried to do so, but I think 
&gt; it's worth a shot.

Ok, I will try this in next version too.

Yours,
Qinglin
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
