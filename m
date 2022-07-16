Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57598C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1WE4C/DA3ZAJ8yF8sPxNcRCl9VaMSETVrSN+D7EgSw=; b=1Q7Nay3hKxEyga
	7+iOexqnaVc3WqUH3/jhRdXOffIYNFBLV7qRIDBKrKiTLsFhqHMeqCg4sp8sGiDWzd9RUYiC7bEiV
	UixPskuhz7biTtcAPCneugtS8OA/zlIznveL7o5O5UGOZXdh5LyTaj7uQKnYTBi7uGVMmavuqa1CM
	D42fIKoA7LT7t0KCDKvFD6f4lC48d+UjsaneQy1qCYkswxib9MMue160AmdUIGzuX/xnY+x20lh0m
	3n49u28v75MRh8v+q0oIfTK6Fql77MNch1vjsR2jI8Zl7GS6wbSpmC2cXi7AFV9A96UfvI7VlU7Nz
	U+PHryUOqHtJoI/sLruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCi38-00GJrv-9p; Sat, 16 Jul 2022 13:41:38 +0000
Received: from smtp83.cstnet.cn ([159.226.251.83] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCi34-00GJoj-2U
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 13:41:36 +0000
Received: by ajax-webmail-APP-09 (Coremail) ; Sat, 16 Jul 2022 21:41:28
 +0800 (GMT+08:00)
X-Originating-IP: [124.16.96.42]
Date: Sat, 16 Jul 2022 21:41:28 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>
To: Conor.Dooley@microchip.com
Cc: jszhang@kernel.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: Re: [PATCH v2 1/4] riscv, mm: detect svnapot cpu support at
 runtime
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn cnic.cn
In-Reply-To: <7292971d-9048-2b83-40c5-29c0a930d094@microchip.com>
References: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
 <20220716085648.4156408-2-panqinglin2020@iscas.ac.cn>
 <YtKwjmbQmIMm4gEo@xhacker>
 <7292971d-9048-2b83-40c5-29c0a930d094@microchip.com>
MIME-Version: 1.0
Message-ID: <6bb47d92.12c94.182073e1feb.Coremail.panqinglin2020@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: swCowABXXmIJwNJiGHELAA--.7517W
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwIJDGKY1lCqdgAC
	sm
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_064134_500736_F90DE1E0 
X-CRM114-Status: UNSURE (   4.77  )
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

&gt; On 16/07/2022 13:35, Jisheng Zhang wrote:
&gt; &gt; EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
&gt; &gt; 
&gt; &gt; On Sat, Jul 16, 2022 at 04:56:45PM +0800, panqinglin2020@iscas.ac.cn wrote:
&gt; &gt;&gt; From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
&gt; &gt;&gt;
&gt; &gt;&gt; This patch add two erratas to enable/disable svnapot support, patches code
&gt; &gt;&gt; dynamicly when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
&gt; &gt;&gt; option is set. It will influence the behavior of has_svnapot function and
&gt; &gt;&gt; pte_pfn function. All code dependent on svnapot should make sure that has_svnapot
&gt; &gt;&gt; return true firstly.
&gt; &gt;&gt;
&gt; &gt;&gt; Also, this patch modifies PTE definition for Svnapot, and creates some functions in
&gt; &gt;&gt; pgtable.h to mark a PTE as napot and check if it is a Svnapot PTE.
&gt; &gt;&gt; Until now, only 64KB napot size is supported in draft spec, so some macros
&gt; &gt;&gt; has only 64KB version.
&gt; &gt;&gt;
&gt; &gt;&gt; Yours,
&gt; &gt;&gt; Qinglin
&gt; &gt; 
&gt; &gt; hmm, this "Yours ..." should be removed in commit msg
&gt; 
&gt; And while they're at it, they can drop the "This patch".
&gt; 
&gt; I might've said this on a v1 (I know I said it on someone's
&gt; v1 recently) that having "Also, this patch" makes it sound
&gt; like this should actually be two patches and not one.
&gt; 
&gt; Thanks,
&gt; Conor.
&gt; 

Thanks for the hints, will do in a newer version patch.


Thanks,
Qinglin.</panqinglin2020@iscas.ac.cn>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
