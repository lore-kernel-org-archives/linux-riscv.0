Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEAAECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXCCFjhgAyJ7p/2w8JJ0+3GnUmEeSfGCTocTPdYMi6w=; b=F97IqzFARG/uRc
	Ge9XoIz/sIB+1imWc2oxdjaW7Q0lKI3TQ5F3mgBT1+vgWlPDPmmuhdlj38nq4lDV0PLHs0rpooeim
	KHY8Q8uHWCqq+a+DNlB6/mYQy2QAWG8qu/n6FKDP/ArbGdAy76RWbid/F1HLOkBReHgZx6I+6fJHN
	hM0EnWu6WSdvC/kPoDx6xwa0M8uOzQUkaSi938m+eZRUFrTnmXq/NOyvXSX/pkrrDZEyr/gtfMqWC
	cI4HuD4nzpnZFSITlqdHzexSy5LCcz37h7bziNuFeQa+Cu9jMhqr0ul7wlednwHd1QtEIK1KXYnMS
	cnqpkp/xLbe0RfYPFSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtjb-000OfU-KX; Mon, 24 Oct 2022 09:27:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtjX-000OeA-9P
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 09:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666603618; x=1698139618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vX0ZrGoOesTgoaEnsAdldsG4YphzsUDAEg+i05TK0CQ=;
  b=L7mBsSxF9L8AKPswD51eYk4GeCVoLbpX7Mkfc8fjf2Rpj5LDzWCGxNKc
   X59hfRaO4nGV4cHYsYHpYhr8JNU/dBcHNsZM9BE2x7KTPVqDFpWqxB1OM
   0JaJllr84IOyKJbqQt689w8oA8b5wsX/3TxOiuGEry7ieYXr5GXjBxIlJ
   JaxXVjy1OooE7v1oyOTGP5NNA1Myc+lNokx7rIBcEMKKEQ3aN+3kQn1ff
   VBsvALx7sDkRx7WyEA1PqkqOFNXlJKOzT3n5nHNztKI7pwIumVyIPt+l2
   4LQgPeR4ZLrIvWYVmXvD5MxON2Pbcmla5vJkxSKOs9TeGmLdKJbHt0jpg
   g==;
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="186099133"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2022 02:26:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 24 Oct 2022 02:26:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 24 Oct 2022 02:26:53 -0700
Date: Mon, 24 Oct 2022 10:26:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Anup
 Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <Y1ZaTHGXCoLrSH5I@wendy>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-4-ajones@ventanamicro.com>
 <Y1WYT97IQy3Q6BhF@spud>
 <20221024070935.ff62bcjl6z7i4flh@kamzik>
 <Y1ZKLjC/ZnnjSNy2@wendy>
 <20221024083522.fgwej6saqhbvumfj@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221024083522.fgwej6saqhbvumfj@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_022659_395031_2A54B312 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, Oct 24, 2022 at 10:35:22AM +0200, Andrew Jones wrote:
> On Mon, Oct 24, 2022 at 09:17:50AM +0100, Conor Dooley wrote:
> > My initial thought here was along the lines of "why care about the
> > issues when it's not enabled", but I went to get some caffeine before
> > replying and had a change of heart.
> > IMO, it'd be good to tell people that their DT doesn't describe their
> > hardware properly when it's gone wrong in a way that we cannot really
> > spot via dtbs_check etc. I'll go away and have a think about whether
> > the DT checks can force cbom-block-size if zicbom is in the isa string,
> > but I'm not sure if that sort of conditional is checkable.
> > If either of these error cases are hit (regardless of whether you set
> > CONFIG_RISCV_ISA_ZICBOM) then it'd cause issues for KVM right? That
> > would imply printing unconditionally to me.
> 
> Yes and no. KVM won't have any issues as it won't see Zicbom in the ISA
> bitmap and therefore won't consider offering it to guests. However, it
> could have offered it to guests, if only the DT was fixed, so I agree,
> it's best to unconditionally complain when we see something wrong.

Yeah, that's pretty much what I was getting at. By "KVM having issues" I
meant that without disabling Zicbom, as your patch does, KVM would carry
on & offer Zicbom with the "bad" cbom block size to guests. Following
that line of thought, we'd then want to disable Zicbom & complain no
matter the state of the kconfig symbol so that there'd be info there for
the folks running a non-Zicbom kernel but trying to use Zicbom in their
guest.

> 
> > The level at which to
> > actually emit that is beyond the scope of what I care about though ;)
> 
> This stackoverflow.com thread indicates I should use 'error'.
> https://stackoverflow.com/questions/2031163/when-to-use-the-different-log-levels

Yeah, on the basis of that thread error does seem appropriate.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
