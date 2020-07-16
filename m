Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0B4C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 07:24:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E682067D
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 07:24:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCOPBcNI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E682067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=944+dwf4jMXKx6G7oCTf5je4IyGfVWqVhxEJooK+NdA=; b=NCOPBcNI2C/IDKLlZpoh35KlY
	FittlJvbb2yIu08IP5ogqlYdeVWpB+IplXhjluv+6ZP46JmQhovU1ERinL382gwaFy5EqFAwYYqU/
	tfYiSwlcCiQWTXg1Pa1ZggF+FldrUbhjRhg/jZS7ZrA+crTdgS6dd8s1lZn9l7hUJtHcTnK909s3r
	FN0pm1HjfOdB2Vk+t4v7fQ0j12sLXSyQnBFBUgaG1DIUQzzBKdIIp1q3gw3A+pVXH/yts2bG3b2eb
	upEXgfaAM3Qq4f2rTL0VN8J+vx2hX6GffXGgAtR8khs+cQ8tiXFMgLbniVypEOvVO3xuzfaAMibPv
	/oVqKOGXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvyFv-000708-F0; Thu, 16 Jul 2020 07:24:35 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvyFs-0006zN-GU
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 07:24:33 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4B6m3J2gbWz1qsZw;
 Thu, 16 Jul 2020 09:24:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4B6m3J1lMtz1qtwB;
 Thu, 16 Jul 2020 09:24:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id J70jrAzaypsO; Thu, 16 Jul 2020 09:24:27 +0200 (CEST)
X-Auth-Info: +GkvJW+U7a1jkwpYYtwvJGW4qb6pdIBqEmyMYF7EgbvcE/fEsu3c4+4SqZRjkrRE
Received: from igel.home (ppp-46-244-175-239.dynamic.mnet-online.de
 [46.244.175.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 16 Jul 2020 09:24:27 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id D5C4F2C28D5; Thu, 16 Jul 2020 09:24:26 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 2/2] riscv: fix build warning of mm/pageattr
References: <cover.1594880014.git.zong.li@sifive.com>
 <28365b581b04d0237e127363a63c1ad72dbea683.1594880014.git.zong.li@sifive.com>
X-Yow: I just remembered something about a TOAD!
Date: Thu, 16 Jul 2020 09:24:26 +0200
In-Reply-To: <28365b581b04d0237e127363a63c1ad72dbea683.1594880014.git.zong.li@sifive.com>
 (Zong Li's message of "Thu, 16 Jul 2020 14:15:27 +0800")
Message-ID: <87sgdrx6qd.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_032432_655414_A17D7832 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 16 2020, Zong Li wrote:

> Add hearder for missing prototype. Also, static keyword should be at

s/hearder/header/

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
