Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7282EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CUFSC9VUcccdQC0dAIkN9jKx+GrA2NhPD54udFfFlo=; b=MWGCIJ6LyjXFfr
	iYXM4k1V+kkzWTACybf2IPmR3513D2phcxHiXAfvAaPMSQlyyrNMwgwfuUNUeiTTQWDNveQJH8HCx
	BqiAFbqdRKsNoYihyaQJBVUii27J+5raYgC2RWWnEL9kYmWfQOBXOKsFDuyWb6zlQZHsaE0ZHsflL
	2odxDLZrTdCsP6GJeyeZUPUdZRzYP8o6pbdr+0u5+98CzdhNSqOvAktBcjIOaAL1hhXaR81f7qqnx
	G84g81bbjmRjDn1UK96QIf6E4YLobrUbw3UqzPaqXtBiICnpwSefpwagJWQ3IOCkUqnpbAcedYNvw
	E/xy2pbaQhTGcoW8e3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9i1G-00E7ZD-2s;
	Thu, 15 Jun 2023 08:07:50 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9i1D-00E7Ww-2O
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 08:07:49 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 7239622384;
	Thu, 15 Jun 2023 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1686816462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mP4cVRtg1Zot55n0E8/s57K6td9e+eRW0Qf0nPD1Puw=;
	b=BVHS5z7riMfLlFWJBxKJqLBmf89d1jTwJx+4T8dCuEmV7DQb+ZeKILBUIfUhB3S0yUr8oY
	1g33oCoV4gG6iEM8qP9bQ8pbW/Pv70eHExTt+Oc3SbOqKd0vDdIXdfs9nRaJyf5DgQ7exb
	mEpX3Js72X8/uECyoIezrCo9VJw79+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686816462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mP4cVRtg1Zot55n0E8/s57K6td9e+eRW0Qf0nPD1Puw=;
	b=8gtEFc3JYefULzfkiyeMTf+PGnyUpEtqxxUpIYO8Z6dyye8tCwUlgTUi/IH6mCgeOB9/jN
	EOE4SoIJ2rFtwVDw==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 4F3212C141;
	Thu, 15 Jun 2023 08:07:42 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 411914A037D; Thu, 15 Jun 2023 10:07:42 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  jszhang@kernel.org,  ajones@ventanamicro.com,  aou@eecs.berkeley.edu,
  palmer@dabbelt.com,  paul.walmsley@sifive.com,  greentime.hu@sifive.com,
  zong.li@sifive.com,  nylon7717@gmail.com
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel
 module
In-Reply-To: <CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
	(Nylon Chen's message of "Thu, 15 Jun 2023 15:52:27 +0800")
References: <20230615072302.25638-1-nylon.chen@sifive.com>
	<20230615-unvisited-deceit-9beab8ce987a@wendy>
	<CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
X-Yow: I'll eat ANYTHING that's BRIGHT BLUE!!
Date: Thu, 15 Jun 2023 10:07:42 +0200
Message-ID: <mvmwn052lo1.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_010747_923517_51BDF25A 
X-CRM114-Status: UNSURE (   4.88  )
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

On Jun 15 2023, Nylon Chen wrote:

> I mean, when we use the flag "-fasynchronous-unwind-tables,"

Why?

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
