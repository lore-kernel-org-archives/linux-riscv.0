Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DFBC7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHt8BhNsXcmf7LcXSnFDN8TliJ03oM7xJmYyr4RhaTE=; b=Q8F9KdsJF5Y/DO
	DFhRLe1cTThTDZxZwyK4x2Y6SD7mLMCDepb49+tLwvwA21QhWc5cPL8CCWXA6bGCGKL+5RJdWr2+B
	aujUnAHAlB99mbcW+azyHt+pMSYsg3fnx+7fAxOYYUdZzmTmEoE0pkSG1fsLWpgOokQmwpLzwaLN3
	20gq9/Z2cLLQqmPguKLr6e1gA9fjCBB5Pf0RxK7k1lTdzatAykmRBDrfz4YBan3iXoojpL+MOOEec
	UwfsAJ/Uew5AaIK3OjmSBV74MWXEacOBUflXscrKqPBTmOJrZX48efmoPAyPTKx+dEq6W7F298/VL
	Pmj1ckDtMJkUzUtBbuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5AhX-007m7l-0s;
	Fri, 02 Jun 2023 19:44:43 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5AhT-007m5P-2V
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 19:44:41 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 352JiC25026412;
	Fri, 2 Jun 2023 21:44:12 +0200
Date: Fri, 2 Jun 2023 21:44:12 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v2 00/13] nolibc: add part2 of support for rv32
Message-ID: <ZHpGjMHPzyRcEX3C@1wt.eu>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_124440_123635_0898F8C9 
X-CRM114-Status: UNSURE (   9.15  )
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

Hi Zhangjin,

On Tue, May 30, 2023 at 03:45:23AM +0800, Zhangjin Wu wrote:
> Hi, all
> 
> Thanks very much for your review suggestions of the v1 series [1], we
> just sent out the generic part1 [2], and here is the part2 of the whole
> v2 revision.
(...)

Just to let you know, I'm now done with my release and will slowly try
to catch up with all your series!

Stay tuned!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
