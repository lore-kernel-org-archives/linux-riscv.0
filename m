Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DB6C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BWJllpHcTh3BW1pKfE21dfm/z7wld33SmVMeQA0Lk8=; b=KZC3omN9MrignL
	TCwrKnz1CBlGRe0g4Rq17YpKj0undlGOF0LKc7hYliKzc0qf1izbTNuY8hiuGg5Un2ObzmdqmOUkK
	VDENJRMh8p5E667HbPKtDw+SM6/e8fxLES6xwlzfgXnmIvDNPUYHQ2uQ9UBcRtVB3Y4B4syYYXqn4
	j+PRbmtJUYyHElfMO7ZEed+UWH/4rb40qv9UdHsgAjin9L0+lBNebzn5woD5qzygj0udFnj4EHSJn
	kJ7R7AFKpOtcmC5jQBS7bzyvjSypImZUqoEbrSQJkYObx1l9F6fWLyIU86zkwmufPstBMUYlPdilg
	mEe13Ab+BWBad9njjuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTpck-0000000Bnvc-3EWb;
	Tue, 16 Jul 2024 21:22:14 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTpcg-0000000BnuQ-4BL1
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 21:22:13 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4WNsTQ2sHrz1sBpv;
	Tue, 16 Jul 2024 23:22:02 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4WNsTQ2Nm2z1qqlW;
	Tue, 16 Jul 2024 23:22:02 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id VZTn7ffMGOXt; Tue, 16 Jul 2024 23:22:01 +0200 (CEST)
X-Auth-Info: LwLgpV0XZe0fps6fpXFYhv9gG4dnAQpagpgGlzG9wF764h8ArvAai1okdSimrZg9
Received: from igel.home (aftr-82-135-83-7.dynamic.mnet-online.de [82.135.83.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 16 Jul 2024 23:22:01 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 60F122C21B4; Tue, 16 Jul 2024 23:22:01 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Daniel Maslowski <cyrevolt@googlemail.com>
Cc: linux-riscv@lists.infradead.org,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
  =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,  Daniel
 Maslowski
 <cyrevolt@gmail.com>
Subject: Re: [PATCH v2] riscv/purgatory: align riscv_kernel_entry
In-Reply-To: <20240716204047.7649-1-cyrevolt@gmail.com> (Daniel Maslowski's
	message of "Tue, 16 Jul 2024 22:40:47 +0200")
References: <20240716204047.7649-1-cyrevolt@gmail.com>
X-Yow: We just joined the civil hair patrol!
Date: Tue, 16 Jul 2024 23:22:01 +0200
Message-ID: <87o76xf2x2.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_142211_204927_35F953EC 
X-CRM114-Status: UNSURE (   6.83  )
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

On Jul 16 2024, Daniel Maslowski wrote:

> This has been tested on a JH7110 SoC with oreboot and its SBI delegating

coreboot?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
