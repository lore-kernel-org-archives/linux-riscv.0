Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C11C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZzINf4Ru/ssAk+TQnfTvVw9rH4acWve0wlyLwa++s4=; b=S/BlYVdKNmbI81
	JXD8EXes0QF7QqKIr1fKPp5AEyQXAKux6WJ05++Whrj5359dauUOp0QCoctIXTn9i+RBSOI8Bo4R0
	PbEdR9/vwBLCAZXuiDQjmKH9uczf0HDStkFqTiWqMxQhBfDjAZbwjzTxBr44tYMCp7pt0l1xZ0+a3
	SH0jyEzGY2E0F3oziNWxy2XcQEyye+kbCU0fGz6PVFEXx5qhgZ2UUuGfrbGRKSmnxtus9MqQcs/Qn
	i42JtJeJEffxcPMKmUk3PMsv6upasokJ8LfaLhjhNxAYYlRzizejL4vMKbjxiMHs2eCcC6rXQbona
	nFdOuNOqwf+otOWz4Gkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxlgS-00FmCC-AD; Wed, 23 Nov 2022 09:04:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxlgM-00Fm7K-LX
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 09:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669194278; x=1700730278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gAQRuYWg/Tk+lKUpTo8FpAd2y7tRkY04gj36jj3Nf30=;
  b=Zt9GcLHEiG02gTj2CkZHgXWV+wbvynLKPCSecgk3UHgF2Mq9nAShA2QN
   5Hm4L7acD7DhJ6tJorVhdo37gg0j/C5fOGitegLz6PybruQSP7Jaq1Sk9
   EUALjLG413mb9mm/SPsa5TGHE7jREYrezwLT0j1wDQn1MJJStxQW3ESRn
   akCxz3qLiLDE8sIgHZC4AMvu0fgHRVKN3OYuV2CDkDKb62LEVZdCNHrvS
   aoJCaJQpa7goC4cQVVDq45W7iG2JO8ymLgNSU+SW6fph/3+4BL+7jfoHJ
   Azr5+/gajqytVE0awgLiwXMd9gLutln7TD48hHqC2Zak6EkDYiqVVlvtu
   A==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="124738248"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2022 02:04:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 23 Nov 2022 02:04:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 23 Nov 2022 02:04:31 -0700
Date: Wed, 23 Nov 2022 09:04:13 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>, Anup Patel
	<anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, <aou@eecs.berkeley.edu>, <atishp@atishpatra.org>,
	<dmitriy@oss-tech.org>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] Revert "clocksource/drivers/riscv: Events are stopped
 during CPU suspend"
Message-ID: <Y33iDVTuSglaN0O4@wendy>
References: <20221122121620.3522431-1-conor.dooley@microchip.com>
 <a218ebf8-0fba-168d-6598-c970bbff5faf@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a218ebf8-0fba-168d-6598-c970bbff5faf@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_010438_801140_3DAC638A 
X-CRM114-Status: UNSURE (   9.40  )
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

Hey Samuel,

On Tue, Nov 22, 2022 at 11:49:49PM -0600, Samuel Holland wrote:
> On 11/22/22 06:16, Conor Dooley wrote:
> > This reverts commit 232ccac1bd9b5bfe73895f527c08623e7fa0752d.

> > To fix this, the x86 C3STOP feature was enabled for the timer driver -
> 
> C3STOP isn't inherently x86-specific.

I think I originally had feature with "s around it & meant this as a
tongue-in-cheek reference to the header, which describes it as an "x86
(mis)feature" or something like that. Think I decided against that but
forgot to drop the x86 bit..
Could easily do s/x86// and it'd still make sense.

> > Fortunately, the D1 has a second timer, which is "currently used in
> > preference to the RISC-V/SBI timer driver" so a revert here does not
> > hurt operation of D1 in it's current form.
> 
> typo: its

Good spot :)

> Acked-by: Samuel Holland <samuel@sholland.org>

Thanks!

Perhaps the two minor commit message bits could be fixed on application?
Otherwise, I will send a reworded one in a few days.

Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
