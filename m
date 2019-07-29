Return-Path: <SRS0=e5eF=V2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012F3C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 14:03:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C968A20578
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 14:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oPUqwhlY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C968A20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tie0yo+m3YuQBzs9aTKRIjsNRuP6iznwgltICcP4kbA=; b=oPUqwhlYl32EaG
	YYWS7OoIEpmHvxRUEI5u3ilQqB8tb/ROjyfPAQxAgw2vkGHj06BRK1QHqfGAyixknTcW69HdP2oim
	wKygYs1iEnT+R8/6kVbkEQnGelxJN0FExB1Qhy7MWOt4ooQh6GJ2IVf7y41LN18mgeBhpt3Bhmlvd
	bjt1ukSbjLUXLBf/O41O0plL6BWaBoOBmgRs4vaxaZmWT14YErDmKiSCMkV07Y1sA9l2TpoaetyBz
	hPhNJ/Z0LtdVF80DODyfh6PmQpQeVJeJ1rK12D8jT8g7a5UT5+D/lW0+7pVVCs/YuDGSZxaBHR6KL
	WjQPUzswOUXIXfecWO+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs6FV-0004Wy-8N; Mon, 29 Jul 2019 14:03:37 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6FS-0004WJ-64
 for linux-riscv@lists.infradead.org; Mon, 29 Jul 2019 14:03:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11049AFE1;
 Mon, 29 Jul 2019 14:03:32 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 3/4] RISC-V: Support case insensitive ISA string parsing.
References: <20190726194638.8068-1-atish.patra@wdc.com>
 <20190726194638.8068-3-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1907261346560.26670@viisi.sifive.com>
 <a8a6be2c-2dcb-fe58-2c32-e3baa357819c@wdc.com>
 <alpine.DEB.2.21.9999.1907261625220.26670@viisi.sifive.com>
 <MN2PR04MB6061790AFE4E0AAA838678028DC30@MN2PR04MB6061.namprd04.prod.outlook.com>
 <alpine.DEB.2.21.9999.1907270043190.26998@viisi.sifive.com>
 <CAAhSdy0Eycc0ORSnh6LJeC_D_x9yLOkoc7OkPNuN6qOcZEGVWg@mail.gmail.com>
 <alpine.DEB.2.21.9999.1907270108420.26998@viisi.sifive.com>
 <CAAhSdy1pqZP+M27idvfOB8eB8zhPD_7hx9S60FpOmWRHs-R2qg@mail.gmail.com>
X-Yow: Did you GAIN WEIGHT in th' past 5 MINUTES or am I just DREAMING of two
 BROCCOLI FLORETS lying in an empty GAS TANK?
Date: Mon, 29 Jul 2019 16:03:28 +0200
In-Reply-To: <CAAhSdy1pqZP+M27idvfOB8eB8zhPD_7hx9S60FpOmWRHs-R2qg@mail.gmail.com>
 (Anup Patel's message of "Sat, 27 Jul 2019 14:19:58 +0530")
Message-ID: <mvmy30haqfj.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_070334_374221_5343FCAD 
X-CRM114-Status: UNSURE (   6.27  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Johan Hovold <johan@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 27 2019, Anup Patel <anup@brainfault.org> wrote:

> So, using strncasecmp() in-place of strncmp() and using tolower() for
> each character comparison is complex for you ?

Apparently too complex for you.

+			if (tolower(isa[0] != 's'))

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
