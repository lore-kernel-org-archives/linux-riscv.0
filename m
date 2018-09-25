Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20FAC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 06:17:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A901521480
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 06:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O0Wsm1Hu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A901521480
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnq7aho/mOR8G4LZLLx8BxqhHtfa6qYmYDpz/xUAZnw=; b=O0Wsm1HuM0I5bn
	88x3ZiCHVYFfNp45ql6+e/guZq0vKyrlKi+2fjFdMce/0mCV2zz8nVK/p/6MMKycWBS2NRwDfxsZh
	1EuHGzG34CBaoedJZJH2uM7ym3N80NNoHtk2du3BH/h2mn9tlGvWubYy6D5AMvnj4z4VbsCD3y3iT
	YgBySwnEENH6YGcztPLkGx7JF+zsyEat5BSd9urFK5Z0E7sKqfVIVzxh15aR+X5/LwrN7NYVlUkKZ
	Ge3/KQls0ArTlrbglkB6Ry+uFZ4+e3eNWVn2/hCJ/yULm1/GNua/z2Xzj3aNrPy0L49BtvKEX/jVS
	11aJFpSIdnP7UDbx6uRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4gej-0004E8-PX; Tue, 25 Sep 2018 06:17:09 +0000
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4geL-0004CC-Pm
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 06:16:48 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id E739C40061;
 Tue, 25 Sep 2018 08:15:55 +0200 (CEST)
Received: from armitage.lysator.liu.se (armitage.lysator.liu.se
 [IPv6:2001:6b0:17:f0a0::83])
 by mail.lysator.liu.se (Postfix) with SMTP id 708D740060;
 Tue, 25 Sep 2018 08:15:53 +0200 (CEST)
Received: by armitage.lysator.liu.se (sSMTP sendmail emulation);
 Tue, 25 Sep 2018 08:15:53 +0200
From: Marcus Comstedt <marcus@lysator.liu.se>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: mmcqd/0 stuck at 100% CPU
References: <q3worc5qfj.fsf@armitage.lysator.liu.se>
 <CAK8P3a3h4eBBWk0WTo6=b+Q0Q33M_6tQQyrwGorgYDNrBj3AwA@mail.gmail.com>
Date: Tue, 25 Sep 2018 08:15:53 +0200
In-Reply-To: <CAK8P3a3h4eBBWk0WTo6=b+Q0Q33M_6tQQyrwGorgYDNrBj3AwA@mail.gmail.com>
 (Arnd Bergmann's message of "Tue, 25 Sep 2018 07:48:14 +0200")
Message-ID: <q3pnx2kspy.fsf@armitage.lysator.liu.se>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (berkeley-unix)
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180924_231646_062381_BC7BF16B 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925061553.sCiPYdoAAWId1K4AN-IMVh4Y4weWSeswxWvCWBZm-bc@z>


Arnd Bergmann <arnd@arndb.de> writes:

>> I'm writing this mail to inform about an issue with the SDcard driver on
>> the Hi5Unleashed board running Linux 4.15.18 (riscv-linux-4.15 branch
>> from git + patch-4.15.18.xz from kernel.org).
>
> Can you try a newer kernel version?

Only the 4.15 branch supports the H5U, and there are no further patches
to that kernel line.  I can try this unofficial mix between 4.15 and
4.19-rc2:
https://github.com/atishp04/riscv-linux/tree/4.19_fedora_success_sep11 =



> This part of the mmc stack was completely rewritten in 4.16
> (after many years of not changing much), so the results will
> be very different. If there is a bug in the driver, it may show
> in a different way though.

Ok, worth a try then.  Thanks.


  // Marcus


-- =

--------------------------------------------------------------------------
Marcus Comstedt                          Lysator Academic Computer Society
marcus@lysator.liu.se                    Link=F6ping University, Sweden   //
----------------------------------------------------------------------\X/-

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
