Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB91CEE356
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 03:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TutE5+X1W7C+9V+IgMWQBp6lLf24EXIQYwz3pB1gVE=; b=DlRKlBCiDlP2hL
	y3f2uYpXyrGsuTC6K1Zbf3P9xI7QGzcbf1taFN0VmNnZiCAzfy6/OSsL4ZkdxHSZs2JciZKAuIYEs
	Z9RXp3z1gt1vGgf9tfdzekcPQbd13SyKKdzfqS95KltWkVYi25KlQ1BOmp+F4VTPbgPEwTGS2ptpw
	4T8/qQlJjGzXLMx49GXoXQZ5KeahZvnVfdDRtvCH5yiaMMzHwptQbTpK+lzXj3WLeXkiAJJVa7ob2
	OSeW8JeocfrwhdQ21jwh+zdhFjVcwx9KKLI3YIPUpoqm23zt4xId19oosUdRVeiTTy6Pnrs0l8WV6
	EbLxP7W3srYIO8XJh4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYSm-00000001R9U-0ULa;
	Wed, 19 Nov 2025 03:02:32 +0000
Received: from smtp20.cstnet.cn ([159.226.251.20] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYSi-00000001R8w-4AQU
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 03:02:30 +0000
Received: from xujiakai2025$iscas.ac.cn ( [210.73.43.101] ) by
 ajax-webmail-APP-10 (Coremail) ; Wed, 19 Nov 2025 11:01:42 +0800
 (GMT+08:00)
X-Originating-IP: [210.73.43.101]
Date: Wed, 19 Nov 2025 11:01:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>
To: "Paul Walmsley" <pjw@kernel.org>
Cc: "Nathan Chancellor" <nathan@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, namcao@linutronix.de
Subject: Re: Re: Re: [PATCH] riscv: fix KUnit test_kprobes crash when
 building with Clang
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2025 www.mailtech.cn cnic.cn
In-Reply-To: <bd82855d-4a80-58fb-c949-b968569ef1e2@kernel.org>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
 <621798fc-68bc-504c-755f-0a2f1f83d1c2@kernel.org>
 <108ac2f0.17c6b.19a8fc4d1ca.Coremail.xujiakai2025@iscas.ac.cn>
 <bd82855d-4a80-58fb-c949-b968569ef1e2@kernel.org>
MIME-Version: 1.0
Message-ID: <5b293e31.1dde8.19a9a0f91bb.Coremail.xujiakai2025@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tACowAAnEOgXMx1pcvsCAA--.33051W
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAcLCWkdElSICQABs7
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_190229_391299_A8CBC65D 
X-CRM114-Status: UNSURE (   6.04  )
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

Hi, Paul

&gt; Looks like you're using a mail client that sends HTML in what should be a 
&gt; plain-text E-mail; please fix that.

I apologize for that oversight. 
I will make sure to use plain-text emails going forward.

&gt; Not all of it, but some edited summary is appropriate.  I've queued the 
&gt; following revision for v6.18-rc fixes, under the theory that it would be 
&gt; good to get the test working for Clang users while the LLVM folks 
&gt; investigate.  Please let us know ASAP if you think anything in it should 
&gt; be changed.  I plan to send a PR out later this week.

Thank you for your review of the patch and for the time and effort
you spent on it. I fully agree with the modifications you made to the patch
description.

Thanks again for your guidance and support.

thanks,

- Jiakai
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
