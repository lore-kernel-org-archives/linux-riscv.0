Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A4BC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 14:55:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3218206D5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 14:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3218206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7i71fnPLw8c8wSiEag4koDbPBEonUjBwaWZiiIz6ePk=; b=0PKq6U56bU9IZR5Um7u9lSVwx
	Tq/2Y2PQVT+NaKQtyijXYuN4rpeA0n5WAfQl640/7L9+RmJrduckxkCFp8SDrijyRtKKDxJVQwKl8
	YbvjZ1Dw4BxKD2ZuPiCMdEhr+YogKPqtTsCZ45ObVEy+hcypyy8RMOC+IWUHxLWRb+VtdN8Pi1igv
	MCiPkhb50al9UUTMd3s1Xx2j1jsosS1xZTjZcpF5o9RMgORqdWaVLU5BWPoUedchpq3MN+seAY1ag
	r1y6d4wC5dAEnUpIcAhSvAJoZnoipj8bTLycWJ3eSsEtXJw+T8SlVbHVKStXusbKRifKGOYy5VnDU
	BZjplGbBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkq0c-00059u-LV; Thu, 03 Dec 2020 14:55:02 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkq0Y-000565-Pd; Thu, 03 Dec 2020 14:54:59 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3Eexhl182531; Thu, 3 Dec 2020 09:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=aTanWXDu6GDQOgBiwV6VCa4+Gz8xmuiEnuHmxtcgxPE=;
 b=JqgdPm8hiRdcgHmP2Asq50K14PiR4++DD5Vd+nt7oiR5rd0dVWxNV+CyaTMf2v55XBpe
 s+gVM1OtIwF2Xnm6yZRH5aEnHoH29g2Yy8k/Ydrh+57AZhG9ihxP6O/ACCzsKz7KkpOm
 9uS4eAhzbs0Rj2Rj4AMToilq6M0k4MDriKFj72s90FNSX+Q9/pCO+3fSr2ZGQr23vN8l
 GYsZ4WHeDjYTuCodVhHapE4fIyykKImPmGci1Z/T4XpayaYDLVLAdQj2574h9vrX3CRA
 fq8QCuZA7L9FqVJdEZDAIvcQsl+YOkjb9kuPNJCT0dbuGMlFlnmoHAfQVay2BAazStvv tQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3571nssyg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 09:54:49 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B3EppGY020571;
 Thu, 3 Dec 2020 14:54:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 35693xh8ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 14:54:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B3EsjwT26083698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 14:54:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDC8C11C054;
 Thu,  3 Dec 2020 14:54:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F8A611C058;
 Thu,  3 Dec 2020 14:54:44 +0000 (GMT)
Received: from osiris (unknown [9.171.50.208])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Dec 2020 14:54:43 +0000 (GMT)
Date: Thu, 3 Dec 2020 15:54:42 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.9 27/39] sched/idle: Fix arch_cpu_idle() vs
 tracing
Message-ID: <20201203145442.GC9994@osiris>
References: <20201203132834.930999-1-sashal@kernel.org>
 <20201203132834.930999-27-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203132834.930999-27-sashal@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_07:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1031 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_095458_968760_CF10A7F4 
X-CRM114-Status: GOOD (  20.60  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-csky@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 08:28:21AM -0500, Sasha Levin wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> [ Upstream commit 58c644ba512cfbc2e39b758dd979edd1d6d00e27 ]
> 
> We call arch_cpu_idle() with RCU disabled, but then use
> local_irq_{en,dis}able(), which invokes tracing, which relies on RCU.
> 
> Switch all arch_cpu_idle() implementations to use
> raw_local_irq_{en,dis}able() and carefully manage the
> lockdep,rcu,tracing state like we do in entry.
> 
> (XXX: we really should change arch_cpu_idle() to not return with
> interrupts enabled)
> 
> Reported-by: Sven Schnelle <svens@linux.ibm.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Link: https://lkml.kernel.org/r/20201120114925.594122626@infradead.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This patch broke s390 irq state tracing. A patch to fix this is
scheduled to be merged upstream today (hopefully).
Therefore I think this patch should not yet go into 5.9 stable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
