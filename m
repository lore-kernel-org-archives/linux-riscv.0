Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2554DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 12:12:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 824C5206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 12:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WQXfhKpu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 824C5206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fit.cvut.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zTbuhZKGPqywCCI4tXD/BVa/hxFALYlFEjEWJClAkfY=; b=WQXfhKpuQYCxTE
	p+S22FJQ4ivpCcQLXTfz4F6svIJu5CeSiN7Jemfo2RKnrVF6sCNQ7+JAE8YN93Ty6Ihqr5iyi1f48
	EPb9AYW/wFBv7tm5ks+mdek4qwRSZltTd5fpSguVKjGnon6rNzECY3PtOyX8DjtJ5AnSHUQZ15l1s
	+jGFa9Mq+a9W2dELLKYwTm1sB1QCFOcwjGwy9y0f8Bz0i57INO2nbU3RL+eAPFhXv8vRoS2YK9gTQ
	Tr146G7HTNnGyOaVGrC54gLrERFUCgz82eYW51c5GaG5GlTgXzSNCydr3nT9Ag63msXKzhd5I7j3h
	fyrGXH0xsSLq/4i4uGMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghvfj-0003h1-EJ; Fri, 11 Jan 2019 12:12:23 +0000
Received: from relay.fit.cvut.cz ([2001:718:2:2901::237])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghvff-0003fT-Tl
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 12:12:22 +0000
Received: from imap.fit.cvut.cz (imap.fit.cvut.cz [147.32.232.238])
 by relay.fit.cvut.cz (8.15.2/8.15.2) with ESMTPS id x0BCCCk6034774
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jan 2019 13:12:14 +0100 (CET)
 (envelope-from jan.vrany@fit.cvut.cz)
Received: from sao (027906ee.bb.sky.com [2.121.6.238] (may be forged))
 (authenticated bits=0 as user vranyj1)
 by imap.fit.cvut.cz (8.15.2/8.15.2) with ESMTPSA id x0BCCBVE000475
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Jan 2019 13:12:11 +0100 (CET)
 (envelope-from jan.vrany@fit.cvut.cz)
Message-ID: <69e7b1cae1168ac2d8c0e477183be9fae95b8cc0.camel@fit.cvut.cz>
Subject: Ethernet performance issue on HiFive Unleashed with kernel 4.20
From: Jan Vrany <jan.vrany@fit.cvut.cz>
To: linux-riscv@lists.infradead.org
Date: Fri, 11 Jan 2019 12:12:11 +0000
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_041220_262028_A6BDBCFD 
X-CRM114-Status: UNSURE (   6.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Boris Shingarov <boris@shingarov.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, 

I'm trying to get Linux 4.20 on HiFive Unleashed working. With some patches
it does boot and runs Debian, however the ethernet is slow and unstable. 
ing shows ~20% packet loss when Unleashed is connected directly to my laptop 
ethernet port. With 4.15 kernel I have no issues: Also RTT time is several orders 
of magnitude higher than when runnin 4.15.

Following is ping output for 4.20:

    ...
    64 bytes from 10.42.0.136: icmp_seq=15 ttl=64 time=986 ms
    64 bytes from 10.42.0.136: icmp_seq=16 ttl=64 time=1920 ms
    64 bytes from 10.42.0.136: icmp_seq=17 ttl=64 time=1000 ms
    ^C
    --- 10.42.0.136 ping statistics ---
    18 packets transmitted, 15 received, 16.6667% packet loss, time 165ms
    rtt min/avg/max/mdev = 287.276/1249.659/2292.006/550.116 ms, pipe 3

If I take interface down manually (after being brought up by DHCP during 
Debian boot) and then bring it up again, it stop working completely
(cannot ping it anymore). This makes it practically unusable 

For comparison, following is taken when running 4.15:

    ...
    64 bytes from 10.42.0.136: icmp_seq=7 ttl=64 time=0.145 ms
    64 bytes from 10.42.0.136: icmp_seq=8 ttl=64 time=0.171 ms
    64 bytes from 10.42.0.136: icmp_seq=9 ttl=64 time=0.155 ms
    ^C
    --- 10.42.0.136 ping statistics ---
    9 packets transmitted, 9 received, 0% packet loss, time 202ms
    rtt min/avg/max/mdev = 0.108/0.140/0.172/0.028 ms

The sources I'm using are here: 
https://github.com/janvrany/riscv-linux/tree/users/jv/riscv-linux-4.20
config is here: 
https://gist.github.com/janvrany/a44b955eff75453ffb7aac524a5b7fc8

Is it known issue? Does anyone have working linux 4.20 running on 
Unleashed? I'd appreciate any hints how to fix this.

Best, 

Jan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
