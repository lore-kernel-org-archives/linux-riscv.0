Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8758C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WP2/HpQ3zInRfWxJobCxGFAzMcKpSLAdxu503baBvSg=; b=VIfkwLU/MrkcQ+
	db5gA4N2DA5v08Eeh1BEbMJR+foznWjcmb4iDkoLwpOm3iJKo/gVKiu3/KbXUGkiGAtjxmzcwX9lz
	exNeGwXcaoP329ZrtYkJJHTI6KfvTQNxaRZjzGH0UuY0In1KUglmBpzoMeoFC+ZZLpFi+Se2Oh5Uj
	sgiben8ygCAr3V8qCVVruT/DBKMieqM86epNMjDwtR+QjPvh/rmOrG0QAFgEzjnYQBJ8FdxtsV14F
	s/sy3RNkuVDjDFfqmUK9CnjeDhPAjHtAS6INv3kpS6BRlaZsCgsEZmzpJ9i9IBRHQOCIMiU2wQwCH
	C5k2w1179brsGwH546yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q64Ik-00EUkt-2W;
	Mon, 05 Jun 2023 07:06:50 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q64Ig-00EUj2-1q
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 07:06:49 +0000
X-QQ-mid: bizesmtp68t1685948709t0hdsv4v
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 15:05:08 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: OFQdrTmJ2CQhbplmT8464RTU9RxGWO3Kw3No1opfWzZH7Zxfd+SQf/zCI/8jA
	0OD5hugEKHGAd2AcaRlNrPRLaqnz7hsclaHKVSrHCvZ+igZofhh/0KFX5FKNuTIubQhLUfg
	qjyHhhjzPKSrKefFylb5NVNvQrHj5q/jW0D6nGDeB3EXdS7ylej2rj3remKaojhuxZoIju+
	i6eHd7dRdEE2IFPrnyIjqt5ft9tPppa6qFv3gb9t2C0NXlA90wJ26hrgpXwWVP7l3ypaL8S
	vrHcEKu9MrupV5qwrGRgITGP488xmeehnZ8BkW76B6ilaErZE2wUPMCj6u5MZnGypA7YCnO
	MbK0H1tEaqXX9bX2kIvPVzDVi595oRaynbtLLHC8vBwkt300dycQEXnDZCq4plr5a4Cvub4
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10052685616247688945
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH 3/4] selftests/nolibc: always print the log file
Date: Mon,  5 Jun 2023 15:05:08 +0800
Message-Id: <20230605070508.153407-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZH1ioKUVOYGgDUj7@1wt.eu>
References: <ZH1ioKUVOYGgDUj7@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_000646_928034_6459F7C6 
X-CRM114-Status: GOOD (  13.65  )
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

> On Mon, Jun 05, 2023 at 11:57:44AM +0800, Zhangjin Wu wrote:
> > This allows to check the other issues of the output file manually even
> > when all of them passed.
> 
> Till now I preferred not to see it when everything was OK since it was
> useless and permitted a quick visual check in the reports. Do you
> really think it's useful ? If others prefer it that way we can change
> it but I purposely added this test to "improve" the output (for me at
> least). I'm interested in opinions here.
>

I planed to add detailed potential issues to check in the commit
message, but didn't do that eventually.

The potential 'issues' may be:

1. string alignment, I found one character offset in the user-space
   'efault' handler patchset
2. duplicated print, the one like '30 fork' we have fixed up
3. kernel messages (may provide some important info)

I did add this manually several times in the past weeks, so, if the path
is there, I can simply copy it and cat it, hope we can print the path by
default ;-) 

The commit message may be changed to something like this:

    This allows us to check the details in the log file even when all of
    them passed, from the log details, we can check the string
    alignment, duplicated print and kernel messages.

Best regards,
Zhangjin

> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
