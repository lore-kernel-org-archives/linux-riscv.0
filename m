Return-Path: <SRS0=G9WA=NZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AD9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Sep 2021 08:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B9960F92
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Sep 2021 08:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64B9960F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iki8YS60PFOpn/sS4SvxEeWKBCWpVVQZIGqn9muzxDk=; b=t38wQC37IBXbZw
	on4SQBn6WgFUAGz9rdWATD54zH2jS79C34aAVECIX2B9k5JhkNIUXVK4GRHZznqXObUS6/YsjnnVp
	ZYmaumCFiS0SEAzAV2EJgUyCZQ1hHeuaIPHvSZebgkypmFLlVo6HbJAvRlb4zhM8HR1pqwwriFGku
	Kja0kBFwn1CJVjjwLYOgndME9+TFPSI+Z33aReQ8aWNUt5N73ZsQ3ldtANDNT7pdpWwHmIfhladH/
	6prTetgd3diVNLTIF+TJfDt8C5sK584Fm4/SutoaBITY4PxW4x+ZZ3jjpdQ31lAqj8CAdOdrKmICe
	FeqkRbLRujbvGcIemPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM4U8-00BFJQ-3g; Fri, 03 Sep 2021 08:23:40 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM4Tv-00BFGu-2i; Fri, 03 Sep 2021 08:23:28 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18384kVk094606; Fri, 3 Sep 2021 04:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=yvn3uRltpD6qua2hyp0D2c7Lx/IW7lVKvIh+1+hY8jc=;
 b=sxqFHGBuVldPs6+5K/rqtVS9JHaQU11EacvwcMXWaBbncc1l8OOnAuO55qpy/Yz7lvG8
 fHBGcdKnfMjUhSSKgEXpC9tfhTNXhCD4RL1rLoTx+ouZqYUheCwxI6sQQRKrEw+MIkfP
 NvtrSkjS+pOzrkJLiM4WrfcV3fsDP5VKqrtC2E9soOQhjwnWHr03qec/WayDpr2td3x+
 3dJLfkNMsgjwswwo311zitvpYu/rAJHq1kjaBUQjEZ5HM8L/YTyT0zKUTr/71/uf3dON
 n8LL5RnLa43g60fHv/kVumN2Z4k8oa5+mK/9XJPoCXZpMKfS4mcMm6AYJ7LnhFAdfrNc 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3auftc8fse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 04:22:03 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18384pMm095198;
 Fri, 3 Sep 2021 04:22:02 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3auftc8frg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 04:22:02 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18388C9c028085;
 Fri, 3 Sep 2021 08:21:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3au6q74x6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 08:21:59 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1838LtB930671224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Sep 2021 08:21:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50DCEA4054;
 Fri,  3 Sep 2021 08:21:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5A24A405B;
 Fri,  3 Sep 2021 08:21:53 +0000 (GMT)
Received: from osiris (unknown [9.145.159.114])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Sep 2021 08:21:53 +0000 (GMT)
Date: Fri, 3 Sep 2021 10:21:52 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Weizhao Ouyang <o451686892@gmail.com>
Cc: rostedt@goodmis.org, mingo@redhat.com, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org,
 monstr@monstr.eu, tsbogend@alpha.franken.de, nickhu@andestech.com,
 green.hu@gmail.com, deanbo422@gmail.com,
 James.Bottomley@hansenpartnership.com, deller@gmx.de,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
 dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH] ftrace: Cleanup ftrace_dyn_arch_init()
Message-ID: <YTHbIMVw2EhNpDwO@osiris>
References: <20210903071817.1162938-1-o451686892@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210903071817.1162938-1-o451686892@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v7gSly151gMH4jiswwJLQJyae83ofpqz
X-Proofpoint-ORIG-GUID: 5AAR1uAs7Bex_EJmpFQlQUops1ZiOFiF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-03_02:2021-09-03,
 2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=634 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109030048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_012327_165279_6EF3AFB3 
X-CRM114-Status: GOOD (  15.68  )
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

On Fri, Sep 03, 2021 at 03:18:17PM +0800, Weizhao Ouyang wrote:
> Most ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
> 
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> ---
>  arch/arm/kernel/ftrace.c          | 5 -----
>  arch/arm64/kernel/ftrace.c        | 5 -----
>  arch/csky/kernel/ftrace.c         | 5 -----
>  arch/ia64/kernel/ftrace.c         | 6 ------
>  arch/microblaze/kernel/ftrace.c   | 5 -----
>  arch/mips/include/asm/ftrace.h    | 2 ++
>  arch/nds32/kernel/ftrace.c        | 5 -----
>  arch/parisc/kernel/ftrace.c       | 5 -----
>  arch/powerpc/include/asm/ftrace.h | 4 ++++
>  arch/riscv/kernel/ftrace.c        | 5 -----
>  arch/s390/kernel/ftrace.c         | 5 -----
>  arch/sh/kernel/ftrace.c           | 5 -----
>  arch/sparc/kernel/ftrace.c        | 5 -----
>  arch/x86/kernel/ftrace.c          | 5 -----
>  include/linux/ftrace.h            | 1 -
>  kernel/trace/ftrace.c             | 5 +++++
>  16 files changed, 11 insertions(+), 62 deletions(-)

For s390:
Acked-by: Heiko Carstens <hca@linux.ibm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
