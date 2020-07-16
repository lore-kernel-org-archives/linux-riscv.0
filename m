Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AC3C433E4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 17:53:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B6B42070E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 17:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZoP8MKO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B6B42070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IhO1aNhGY9acjGqDGw78Uv6XI8XjVt9+w9/xueSnTZk=; b=kZoP8MKOVih2wOiEreZk6ofdv
	MI2tkhsxJvzIJ6WMCVZw3BngVxQ0sG/R3iRS+65Fq2110xDrGau1yzrgMMnfgNC5iimaJLsX+ktQ5
	Nvgznnt7fMfmlk9HxJX2TntzVeCIwClzJZuqumMlZBFB3hLT8qIoN3X0r1YD5SgQ2Dl3bmNsbSQRq
	Xyfw7c8F391fzrglg0pwsYmPVWFhqhk7l2MARsNBDtDKCKuvZXFVDjKO2wtX91dYJDE9bRCj+4u00
	gtr+eIxVRIIvHzxsZb8KQJvf3X9ASj0pODthqIrepY/3cplj/RLSK57ttQmEtoecl85NFTYJvXmtT
	IdyjnfuuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw84N-0002bH-NJ; Thu, 16 Jul 2020 17:53:19 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw84L-0002aU-78
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 17:53:18 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4B720q4LPQz1qsbC;
 Thu, 16 Jul 2020 19:53:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4B720q3PjMz1qtx8;
 Thu, 16 Jul 2020 19:53:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 6HQLcwjP34qN; Thu, 16 Jul 2020 19:53:14 +0200 (CEST)
X-Auth-Info: +DmN6RtqXURMvxWNpMFss7VGeVevvpeWJ0MkNILNJc4odk9CiRUkhP45NvOoW3s7
Received: from igel.home (ppp-46-244-175-239.dynamic.mnet-online.de
 [46.244.175.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 16 Jul 2020 19:53:14 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id F30102C28D5; Thu, 16 Jul 2020 19:53:13 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: Patchwork for linux-riscv
References: <CAEUhbmV=rThbdZnjY_cbkKBeuRYNL0O2QLoJQGFPRc90SZjHoQ@mail.gmail.com>
 <CAEn-LTqnsygh40cqMf4Z41FuZh-tOO2bubNv7vqZUgMbWJT+RA@mail.gmail.com>
 <CAEUhbmW2UHRFJct=Ftizdb5zgib0ZRCwEot=sT0skrhoJtWLJg@mail.gmail.com>
 <CAOnJCUKygJk9E2c_Ye2s+xkAa-Ah2naK-YD=8wFGud+JYXhirA@mail.gmail.com>
X-Yow: BEEP-BEEP!!  I'm a '49 STUDEBAKER!!
Date: Thu, 16 Jul 2020 19:53:13 +0200
In-Reply-To: <CAOnJCUKygJk9E2c_Ye2s+xkAa-Ah2naK-YD=8wFGud+JYXhirA@mail.gmail.com>
 (Atish Patra's message of "Thu, 16 Jul 2020 10:36:25 -0700")
Message-ID: <87d04vwdme.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_135317_378400_0D8A4725 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 16 2020, Atish Patra wrote:

> I will check the patchwork admins about this.

Most likely it just needs to be resubscribed.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
