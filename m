Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC4BCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RX8x2mu7sOPSt9/iqrnNYdZ192nYYNY3XxjvIcHzanc=; b=F68bijhXoO/jWc
	pvEwRCFvmrOzCUGiBjqrLyIdYxPpi9F+7Bmy96KmKIcL0atJ0P3i+8GaANS7uuavqYMmu18Df0L50
	OLBAEkjHdxvLtx01nqMWn90S1cuAFOc/QQM2dpHxf5ln7/O2O7TaJsKIkjJvZ/jpufx3OSHSLbWG9
	bzK294DxHPEJY4wAM62onXbE8ROgrIsBQFmD1eF8Xgqmq1EYLGXj8RnQ1gZMMnYTmA9nh422VTlKE
	CZkeJOp47AILkOMXD85lWw6JxkK21FZCj9aKf1jWpY4gDa64Qn8BAIkJKufi9QGSLaf/BkZnZyXYw
	XzCQWdHZaROErWpR9hog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIrh-008p5S-2r;
	Mon, 16 Oct 2023 08:22:17 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIrc-008p2l-2R
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 08:22:16 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qsIrU-00043l-Hx; Mon, 16 Oct 2023 10:22:04 +0200
Message-ID: <18b15c5b-da86-4abf-8501-b50bac69e247@leemhuis.info>
Date: Mon, 16 Oct 2023 10:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [bisected][regression] rustc userspace crashes on riscv in
 kernel 6.5
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, Vineet Gupta <vineetg@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andy Chiu <andy.chiu@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 matoro <matoro_bugzilla_kernel@matoro.tk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux RISC-V <linux-riscv@lists.infradead.org>
References: <49a92f24-bd70-483c-aaaa-49d00c339b12@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <49a92f24-bd70-483c-aaaa-49d00c339b12@gmail.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697444532;b4b52cce;
X-HE-SMSGID: 1qsIrU-00043l-Hx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_012212_962140_EF67A930 
X-CRM114-Status: UNSURE (   6.77  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.09.23 02:02, Bagas Sanjaya wrote:
>> Since this commit:
>>
>> commit 8ee0b41898fa26f66e32237f179b6989c65600d6
>> Author: Greentime Hu <greentime.hu@sifive.com>
>> Date:   Mon Jun 5 11:07:11 2023 +0000
>>
>>     riscv: signal: Add sigcontext save/restore for vector
>>
>> running rustc on riscv produces output like this:
> [...]
> #regzbot introduced: 8ee0b41898fa26 https://bugzilla.kernel.org/show_bug.cgi?id=217923

Fix is now in mainline (thx Palmer!). Contains a Fixes tag, so will most
likely end up in the the next or the next but one 6.5.y release; if not,
please speak up.

#regzbot fix: 14a270bfab7ab1c4b605c01eeca5557447ad5a2b
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
