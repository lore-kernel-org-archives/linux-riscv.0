Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6263DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpGEW2hhxrBcgyqHMm1QEZ3JhSM5ETskFk4RwG5nuKo=; b=TP3rSOGUHbW/IB
	ganXjSVqQYpyijX/Qp6LaMNzJiBQ0YBpierCDmW9Y3cbd814DKCv5nzAbAdvQfdwUblghHehJmtYc
	SFBWjHtgiekTr3/zR+p5GbBk5PsJGH5bUwaRUCI14c5cD1YRLyC1ouWRJ2xP0KUJRI2NTGq4V5I/C
	U3uNpHBio4awsM66BkwFw899idYnKy68sYtO7RB9UWFgNoAdFpB7g7V11shYyt+SZDEiniAOaYx53
	Btio88F740XK3xZb9QM7qeIG8fPg3dHb5y6KAZrYwjwArMMZW2n7ee65tw+0lwLNR1uxer+SPAkNU
	T9fDEe2q43im5qTR0kuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwde-00CPuz-9H; Mon, 07 Nov 2022 07:33:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwWr-00CMG1-Kz
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 07:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667806005; x=1699342005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5pWR/2lH42uSW94u2o+L9YjVlm+F/RrGVfPj8XIu9R4=;
  b=pOFC1d2Dx6RHBBfJpb0RIX0pT8J3Lf0tO4PveGrkE2mGJJrzwz7/Owvf
   6KvyfFDZk16DHdA+UCk3MGaZc3H9Uym2UOV+arSG/1+WdBJHr4aiOu+RS
   ++QGZzX2SX/L52bvEy+4GHbstV5TdKCKFMukfpMPHf08Cv4Bdd44IMh8/
   4UrY0CIq3CqZyF9j6QHVDMk9O6mImM9tL96ClHttKUavrS5nWatYxMp54
   Zsrt8Oe2o0m04ftW1V5NgRebg8MlgKhpEDkTQmqbLFSOE9BI4RpyAUKNj
   DUSbzHLJrejJkfdES1HhCAoiJD8/OxVTDsJoWok9VmJsCUa21kbYus9As
   A==;
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="185649310"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Nov 2022 00:26:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 7 Nov 2022 00:26:40 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 7 Nov 2022 00:26:39 -0700
Date: Mon, 7 Nov 2022 07:26:23 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
CC: Conor Dooley <conor@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [PATCH] Documentation: riscv: tableize memory layout
Message-ID: <Y2izHzwaYLDCOECc@wendy>
References: <20221106100239.53704-1-bagasdotme@gmail.com>
 <Y2eY+LulWaKm7MHl@spud>
 <aebae1eb-ed56-00a9-101f-c4e5ab0af91a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aebae1eb-ed56-00a9-101f-c4e5ab0af91a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_232645_799163_EDF9F6E0 
X-CRM114-Status: GOOD (  11.38  )
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

On Mon, Nov 07, 2022 at 09:55:31AM +0700, Bagas Sanjaya wrote:
> On 11/6/22 18:22, Conor Dooley wrote:
> >> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> >> +   |    Start addr    | Offset  |     End addr     |  Size   | VM area description                                      |
> >> +   +==================+=========+==================+=========+==========================================================+
> >> +   | 0000000000000000 |    0    | 0000003fffffffff | 256 GB  | user-space virtual memory, different per mm              |
> >> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> >> +   | 0000004000000000 | +256 GB | ffffffbfffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical      |
> >> +   |                  |         |                  |         | virtual memory addresses up to the -256 GB               |
> >> +   |                  |         |                  |         | starting offset of kernel mappings.                      |
> >> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> >> +   |                             Kernel-space virtual memory, shared between all processes:                             |
> >> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> >> +   | ffffffc6fee00000 | -228 GB | ffffffc6feffffff | 2 MB    | fixmap                                                   |
> >> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> >> +   | ffffffc6ff000000 | -228 GB | ffffffc6ffffffff | 16 MB   | PCI io                                                   |
> >> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> >                                                         ^
> > Will these numbers remain right-aligned in the formatted doc? They were
> > aligned before in the text form & no longer appear to be.
> > 
> 
> These numbers also become wrapped in their cells.
> 
> However, in order to fix alignment of these, custom CSS is needed, similar
> to one in StackOverflow [1].

Hmm. In that case I'd be inclined to agree with Akira that this should
be left as is.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
