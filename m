Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569C7C4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 08:01:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A6AA24196
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 08:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="li4shjH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A6AA24196
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QXTszhhGp/ryzSlSgfenYsbCjaekga2MuPHHx78RxE=; b=li4shjH5qYbSa/Apu6I1XUGabP
	M/r+L2sNNX2CQdn6Q8FBumq2vNe0Onj4oFN4y8xN0BLca5r2MvUIe3c4hiSPS8UQniyRfTVaO7qkE
	85xJoxAQNwOlOSd9hhTryP9cE8W0HY3HFcLO5DtB3HBFviu3egF9VrfZbtDTlmC5bRv4+Fqo5SVmH
	Ke5RxTf+MMrIq/Pc4TkdAq5hTgt9K8NETxzwnTRQ+g455rcTo97dlpRv9eoO/Tf/6s+CQpIBRSlMQ
	VRbEG5Xzfii12mZ8rZJ7cNcahQMWTJ+nyT/ukZy1uWU3QpQBu5r5L3lv6P9R/+GT0/yWvmu8oP3La
	rEQLtH3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXgOm-00060P-Hq; Wed, 28 Oct 2020 08:01:36 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXgOg-0005zW-Ow
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 08:01:34 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06982759|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0592398-0.00711041-0.93365;
 FP=2159615626208367594|1|1|11|0|-1|-1|-1; HT=ay29a033018047199;
 MF=fuyao@allwinnertech.com; NM=1; PH=DS; RN=11; RT=11; SR=0;
 TI=SMTPD_---.IpTlbWf_1603872080; 
Received: from localhost(mailfrom:fuyao@allwinnertech.com
 fp:SMTPD_---.IpTlbWf_1603872080)
 by smtp.aliyun-inc.com(10.147.41.138);
 Wed, 28 Oct 2020 16:01:21 +0800
Date: Wed, 28 Oct 2020 16:01:20 +0800
From: fuyao <fuyao@allwinnertech.com>
To: liush <liush@allwinnertech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, penberg@kernel.org,
 akpm@linux-foundation.org, peterx@redhat.com, vbabka@suse.cz,
 walken@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: fix pfn_to_virt err in do_page_fault().
Message-ID: <20201028080120.GM9517@g8Exdroid64>
Mail-Followup-To: liush <liush@allwinnertech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, penberg@kernel.org,
 akpm@linux-foundation.org, peterx@redhat.com, vbabka@suse.cz,
 walken@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1603716368-29896-1-git-send-email-liush@allwinnertech.com>
 <20201027025952.GK9517@g8Exdroid64>
 <20201028023137.GL9517@g8Exdroid64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028023137.GL9517@g8Exdroid64>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_040131_586252_51731BC5 
X-CRM114-Status: GOOD (  18.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Shaohua:
	sorry, i read it wrong. this patch is right.

On Tue, Oct 27, 2020 at 10:59:52AM +0800, fuyao wrote:
> have you seen the main line?
> 
> it already corrected.
> 
> On Mon, Oct 26, 2020 at 08:46:08PM +0800, liush wrote:
> > From: Shaohua Liu <liush@allwinnertech.com>
> > 
> > The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.
> > 
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: liush <liush@allwinnertech.com>
> > ---
> >  arch/riscv/mm/fault.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> > index 1359e21..3c8b9e4 100644
> > --- a/arch/riscv/mm/fault.c
> > +++ b/arch/riscv/mm/fault.c
> > @@ -86,6 +86,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
> >  	pmd_t *pmd, *pmd_k;
> >  	pte_t *pte_k;
> >  	int index;
> > +	unsigned long pfn;
> >  
> >  	/* User mode accesses just cause a SIGSEGV */
> >  	if (user_mode(regs))
> > @@ -100,7 +101,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
> >  	 * of a task switch.
> >  	 */
> >  	index = pgd_index(addr);
> > -	pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
> > +	pfn = csr_read(CSR_SATP) & SATP_PPN;
> > +	pgd = (pgd_t *)pfn_to_virt(pfn) + index;
> >  	pgd_k = init_mm.pgd + index;
> >  
> >  	if (!pgd_present(*pgd_k)) {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
