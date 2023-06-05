Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D63C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 04:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLeiZkvQXs/GBVJfKKZjzOKy/Eg7DUwBk5W2ysNNrWk=; b=L3FS9Wx5wJjbxh
	f05eW39gWHN80fV8Lt2MK78zb5p/0HGn7yseR570Zt5IdgH8hdsidhxOngtsrpR1yCNhzUZKKjgv7
	POnj0yPT26QJK8nDqdjV8gj3TVvzjDTnMx1g29FUZmXqEJCG0f/ItNZ2lWHbC9Qv51Bl6j27Nj47w
	acNVeuoiVD4O9UFftpBC31DY0XfhqLfkIPv8b5DwuAyNczjuy/O1e4dl4IjYvE6g6mAoAS1cmWwdP
	2B7xPABjyQZWHEwzGft7DQPi4r3rFcfxrnj2xrexobdMgz8T7KkKUyQX+77lE/9U9OZPVpTKHd/eT
	UyESe4EdVsnU42IUTrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61i9-00E4Ac-1z;
	Mon, 05 Jun 2023 04:20:53 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61i7-00E49m-02
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 04:20:52 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3554KmJM005449;
	Mon, 5 Jun 2023 06:20:48 +0200
Date: Mon, 5 Jun 2023 06:20:48 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH 3/4] selftests/nolibc: always print the log file
Message-ID: <ZH1ioKUVOYGgDUj7@1wt.eu>
References: <cover.1685936428.git.falcon@tinylab.org>
 <835e118943d257b7a83066fb4fb77c0e5cf71534.1685936428.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <835e118943d257b7a83066fb4fb77c0e5cf71534.1685936428.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_212051_341525_733A7173 
X-CRM114-Status: UNSURE (   8.22  )
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

On Mon, Jun 05, 2023 at 11:57:44AM +0800, Zhangjin Wu wrote:
> This allows to check the other issues of the output file manually even
> when all of them passed.

Till now I preferred not to see it when everything was OK since it was
useless and permitted a quick visual check in the reports. Do you
really think it's useful ? If others prefer it that way we can change
it but I purposely added this test to "improve" the output (for me at
least). I'm interested in opinions here.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
