Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD4FC388F9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 21:30:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC56B241A6
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 21:30:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y5Hz+fK9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC56B241A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:MIME-Version:Subject:
	Message-ID:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DRV938JXNEcizp4Xs71zIo33REP2XFRfRYCRW1tCWbk=; b=y5Hz+fK9VszO0MGdyjpyomtg/
	R7Fu5wVjCjaOhsOfRk/tNu2W6RySCdw/H2GAfGjoCnd/erU5+6CBqfVOlaHHhJ5/9agxkMleiM10B
	R2YC1k6e81u1yH6+mnRQLMmdQso0RrB62xKywJfhQEuGRgcoUehxT4Os7O6OlEkGBnrKnzlUGNzsF
	9O+boQjaAoHVgbajPrPq7M89Vz33IXIdqlAt8vcR22ndDGDCrQ2epQLW9p6+yAK2Y3aezr3zhXTxj
	h50oSg5YuHqF8M+LruyJsHrDL/J0i5Fz141xEQNQBmjA7fL8AeZmMJpbg59IgcC29u00AC/9//TUP
	zMivrQugw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kViA2-0008WG-7D; Thu, 22 Oct 2020 21:30:14 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJB3f-0006Mr-VD
 for linux-riscv@lists.infradead.org; Fri, 18 Sep 2020 07:43:53 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1003472|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0438238-0.00273133-0.953445;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07440; MF=liush@allwinnertech.com; NM=1; PH=DW;
 RN=12; RT=12; SR=0; TI=W4_5948689_DEFAULT_0AB101D6_1600414937784_o7001c71t; 
Received: from WS-web
 (liush@allwinnertech.com[W4_5948689_DEFAULT_0AB101D6_1600414937784_o7001c71t])
 by ay29a011140100202.et135 at Fri, 18 Sep 2020 15:43:39 +0800
Date: Fri, 18 Sep 2020 15:43:39 +0800
From: "=?UTF-8?B?5YiY6YK15Y2OQlRE?=" <liush@allwinnertech.com>
To: "Christoph Hellwig" <hch@infradead.org>
Message-ID: <ca550ec0-73f2-485e-84fd-036eacd0bcd9.liush@allwinnertech.com>
Subject: =?UTF-8?B?5Zue5aSN77yaW1BBVENIXSByaXNjdjogZml4IHBmbl90b192aXJ0IGVyciBpbiBkb19wYWdl?=
 =?UTF-8?B?X2ZhdWx0KCku?=
X-Mailer: [Alimail-Mailagent][W4_5948689][DEFAULT][Chrome]
MIME-Version: 1.0
References: <1600327549-3995-1-git-send-email-liush@allwinnertech.com>,
 <20200917152518.GA8930@infradead.org>
x-aliyun-mail-creator: W4_5948689_DEFAULT_MzYTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2zc
In-Reply-To: <20200917152518.GA8930@infradead.org>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_034352_327569_29C9D3FF 
X-CRM114-Status: GOOD (  13.36  )
X-Mailman-Approved-At: Thu, 22 Oct 2020 17:30:12 -0400
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
Reply-To: =?UTF-8?B?5YiY6YK15Y2OQlRE?= <liush@allwinnertech.com>
Cc: aou <aou@eecs.berkeley.edu>, linux-kernel <linux-kernel@vger.kernel.org>,
 peterx <peterx@redhat.com>, "daniel.m.jordan" <daniel.m.jordan@oracle.com>,
 palmer <palmer@dabbelt.com>, rppt <rppt@kernel.org>,
 "paul.walmsley" <paul.walmsley@sifive.com>, akpm <akpm@linux-foundation.org>,
 walken <walken@google.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 vbabka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,
> On Thu, Sep 17, 2020 at 03:25:49PM +0800, liush wrote:
> > The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.
> > 
> > Signed-off-by: liush <liush@allwinnertech.com>
> > ---
> >  arch/riscv/mm/fault.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> > index 716d64e..9b4e088 100644
> > --- a/arch/riscv/mm/fault.c
> > +++ b/arch/riscv/mm/fault.c
> > @@ -212,7 +212,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
> >     * of a task switch.
> >     */
> >    index = pgd_index(addr);
> > -  pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
> > +  pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP) & SATP_PPN) + index;

> This adds a crazy long line.  One nice way to clean this up would be to
> add a local pfn variable, as it would also make the code more readable.

Thanks, i'll modify it in next revision
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
