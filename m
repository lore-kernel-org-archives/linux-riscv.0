Return-Path: <SRS0=vd3C=BQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DBBC433E1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2020 12:16:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0079E204FD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2020 12:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KbFl2+bb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0079E204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MlctToZyh99Zh+hgfIq36EH9nvEL//+hKKQfLi+Hgo0=; b=KbFl2+bbr000yBwWmiqCzuzXD
	8zuz/C5IjhVTTu/dHvq14JO2D7J4Pk2dKxVU9N451Z/TFx4k1D4HMmaVIm31KcXwSEe6CCCjl8CNm
	AlrGUlOzz5cThU/oK42rldRdeaL1x0KstfgfYPkA6Y4wA8k5dtnKy4yOCsf/WfGu6l2icQ4rfdvtL
	alKsfuwMZDyWrRbXnXxxg2kAAz4l8uHRcIyjqYt3doep2C3PDvsWAPeexnFYevHGahgwmGcWOmAQr
	FmRMC51QhNbfCtnGBt5SdNkQPFEZP1V6bD2+hKwWVy22xGMgYli61KkeIiTPnUg4jJkNaBOCh+BcD
	XiuAvFl0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3dnu-0002ek-JY; Thu, 06 Aug 2020 11:11:22 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3dnr-0002dl-5P; Thu, 06 Aug 2020 11:11:19 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076AX2Zk023945; Thu, 6 Aug 2020 07:10:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rdt2n6mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 07:10:47 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 076AeeeC049571;
 Thu, 6 Aug 2020 07:10:46 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rdt2n6ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 07:10:46 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076B7Jv2015021;
 Thu, 6 Aug 2020 11:10:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 32mynh5cuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 11:10:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076BAf3t30736750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 11:10:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2F7CAE05A;
 Thu,  6 Aug 2020 11:10:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CDD7AE063;
 Thu,  6 Aug 2020 11:10:38 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.24.39])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  6 Aug 2020 11:10:38 +0000 (GMT)
Date: Thu, 6 Aug 2020 14:10:36 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v3 1/6] mm: add definition of PMD_PAGE_ORDER
Message-ID: <20200806111036.GJ163101@linux.ibm.com>
References: <20200804095035.18778-1-rppt@kernel.org>
 <20200804095035.18778-2-rppt@kernel.org>
 <20200806101112.bjw4mxu2odpsg2hh@box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806101112.bjw4mxu2odpsg2hh@box>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=997 clxscore=1011 suspectscore=1 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_071119_262559_9C960969 
X-CRM114-Status: GOOD (  29.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 06, 2020 at 01:11:12PM +0300, Kirill A. Shutemov wrote:
> On Tue, Aug 04, 2020 at 12:50:30PM +0300, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > The definition of PMD_PAGE_ORDER denoting the number of base pages in the
> > second-level leaf page is already used by DAX and maybe handy in other
> > cases as well.
> > 
> > Several architectures already have definition of PMD_ORDER as the size of
> > second level page table, so to avoid conflict with these definitions use
> > PMD_PAGE_ORDER name and update DAX respectively.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  fs/dax.c                | 10 +++++-----
> >  include/linux/pgtable.h |  3 +++
> >  2 files changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/dax.c b/fs/dax.c
> > index 11b16729b86f..b91d8c8dda45 100644
> > --- a/fs/dax.c
> > +++ b/fs/dax.c
> > @@ -50,7 +50,7 @@ static inline unsigned int pe_order(enum page_entry_size pe_size)
> >  #define PG_PMD_NR	(PMD_SIZE >> PAGE_SHIFT)
> >  
> >  /* The order of a PMD entry */
> > -#define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
> > +#define PMD_PAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
> 
> Hm. Wouldn't it conflict with definition in pgtable.h? Or should we
> include it instead?

Actually I meant to remove it here and keep only the definition in
pgtable.h.
Will fix.

> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 56c1e8eb7bb0..79f8443609e7 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -28,6 +28,9 @@
> >  #define USER_PGTABLES_CEILING	0UL
> >  #endif
> >  
> > +/* Number of base pages in a second level leaf page */
> > +#define PMD_PAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
> > +
> >  /*
> >   * A page table page can be thought of an array like this: pXd_t[PTRS_PER_PxD]
> >   *
> 
> -- 
>  Kirill A. Shutemov

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
