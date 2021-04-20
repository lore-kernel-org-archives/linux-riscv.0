Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239B8C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:29:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E9AF61003
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E9AF61003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rhZy9JBWcZryJcF8PHgCwIpEFwIAcpsVKpx0wIwN0P0=; b=DdZ4gb/HGjIpy6RkFOPopL1q6
	sK0h985SYoTjnF19oTj+JGhKFok9rEHvfJtNbdfg9GW7KLmwXBUdfApSmw9iPOqoJVSk/13dJ2mES
	khuUoYXojhUQckKLpwNgWn1jqZOngvTRq8FnF+CwZy9saPaGsDUHOE43jYr1hZZ2s2wREiK0z8chm
	ft0t0v2fbBmDU6otD8ohrvQykSeNsvwxGhKNesi/W10Oldqw3CrzOvLtXqbOxI8NYm9xAwcrLgHHj
	0ZEXEqCSdRWEbPez03tiGkTZq0iJ3suH6kP0QuaiGa14ASZpbpKRLThdKAEar8bid8TcuZwag3adH
	4373l/k0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqR8-00CDbw-UJ; Tue, 20 Apr 2021 13:29:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqQt-00CDXF-H5; Tue, 20 Apr 2021 13:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r7qXV4Ucbak5vgyd7ROLcIVKBZPYTemDw/ykiqY6SYg=; b=f8aZuGGiTXJ3bycdCdttChfBjV
 efgcexE9jINx1AojGBa7GOZ/0Z5mgj5s7MT0JFFkdal0iZJHL+PeRnePuzoSeWFCHZuDRWtGH7PW2
 xsf7/seh6i6rbr00jAE6UznYzbnwV5rP8Ymif3F3E55vIemWM7xRGDY67LONyJvwi9PlpULBR9C5s
 lkrF+mkX8N51OfWEQ9sndgmgO7yc6+gR+ilu6iRBKGorKy4OGMmCRQUrjpdj+SS6qKZQibC7lsHcy
 xOhniZc+8gZZW8vruvjCVsvWe21VhRyDAcR8h0WAu9nvncVOa2FrYYpqt26CGrjWzeoYT3KzOmzYq
 7syN/afw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqQr-00C9Co-0w; Tue, 20 Apr 2021 13:28:50 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KD47xG166663; Tue, 20 Apr 2021 09:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=r7qXV4Ucbak5vgyd7ROLcIVKBZPYTemDw/ykiqY6SYg=;
 b=rPwYaU9qq29kTTv0X6zWH+Y9QoAMMR0r066osBDtHrVhZOYmI9YInWAOQ/heN4U1jksZ
 P6nrQ47gkG3vD1J0wFYkrV2iqUGVA5SkDHNnXKeA7nfYj3wuYwVf1qby0QapVz59LSxF
 PhK/2/kDgm3LSaspO1FoGmtFbeNbrT10viQlZ/MsS3Zm6BS79kRvTa1uuficT/8p5SOf
 UxC4pdex+SKH5QcWFLfR3DOTsrZ+Mw+4/iz+JUDojr2v1sLxGemMCDPpHf+OpmL34ZqX
 QxsxUmF0n55SOkaBzgzvZRsRH1qa/IebOfOACABu8ZikMuRL/2zvH6BbZOg4Pcp6s2/K fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 381y7x9dvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 09:28:09 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13KD49if166797;
 Tue, 20 Apr 2021 09:28:09 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 381y7x9dtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 09:28:09 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13KDR9YH006552;
 Tue, 20 Apr 2021 13:28:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 37yqa88xvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 13:28:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13KDReOM28508444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 13:27:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ED9F4C050;
 Tue, 20 Apr 2021 13:28:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA5B34C044;
 Tue, 20 Apr 2021 13:27:58 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.82.136])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 20 Apr 2021 13:27:58 +0000 (GMT)
Date: Tue, 20 Apr 2021 16:27:56 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v2 1/2] secretmem/gup: don't check if page is secretmem
 without reference
Message-ID: <YH7W3MBR+XdyxlA7@linux.ibm.com>
References: <20210420131611.8259-1-rppt@kernel.org>
 <20210420131611.8259-2-rppt@kernel.org>
 <95b7fa81-f72e-c63f-0456-4c25dee8a5eb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95b7fa81-f72e-c63f-0456-4c25dee8a5eb@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: umV0ysjUL103wxbfICo-4xhYTSyDzIUb
X-Proofpoint-ORIG-GUID: dTV5P955knNPQLGIoMCHqafXwNzdKxMI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_06:2021-04-20,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxscore=0 mlxlogscore=682 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_062849_083552_5084CD08 
X-CRM114-Status: GOOD (  30.62  )
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

On Tue, Apr 20, 2021 at 03:19:56PM +0200, David Hildenbrand wrote:
> On 20.04.21 15:16, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > The check in gup_pte_range() whether a page belongs to a secretmem mapping
> > is performed before grabbing the page reference.
> > 
> > To avoid potential race move the check after try_grab_compound_head().
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >   mm/gup.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index c3a17b189064..4b58c016e949 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2080,13 +2080,13 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
> >   		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> >   		page = pte_page(pte);
> > -		if (page_is_secretmem(page))
> > -			goto pte_unmap;
> > -
> >   		head = try_grab_compound_head(page, 1, flags);
> >   		if (!head)
> >   			goto pte_unmap;
> > +		if (page_is_secretmem(page))
> > +			goto pte_unmap;
> > +
> 
> Looking at the hunk below, I wonder if you're missing a put_compound_head().

Hmm, yes.
 
> (also, I'd do if unlikely(page_is_secretmem()) but that's a different
> discussion)

I don't mind, actually. I don't think there would be massive secretmem
usage soon.

> >   		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
> >   			put_compound_head(head, 1, flags);
> >   			goto pte_unmap;
> > 
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
