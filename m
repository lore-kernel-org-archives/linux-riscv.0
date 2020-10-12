Return-Path: <SRS0=BUIi=DT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC60C433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 04:29:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23D8820735
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 04:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PsM/cEfR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hKc2bG10"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23D8820735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2qLLc5Kp4XYMPyHaCnM8t6X3W5oyMVyUTR6yf+3dpQs=; b=PsM/cEfRfm2ymqwB8ox+iSnnf
	6xEfVBuQF0oaYkdRhznzqdnbcu8uOKQP8gocgmeWsI+R78x7hIqJ/CZo8KwaYmZ0YCZD+uNCdrumd
	veqa9BlrnuKlBbG0MsqrglUXHkMWyc/lDkVXUEaPc+/R5RBomUXxrm7hT0CIMpeTUtqUM6RICDN6v
	oqyipBLp7xdbLM50uCDBV8j8QkTOTwBI1KSCNiYX/V9oaC1IMAhtoAUVl7d3ehWCNs84oXxhVLke8
	QxRhhKSuAoJTvswGvlzmennSaVmlWulIsbQW/WlpGqG8aQPdB+vTvBuqywE39Hpdi4IAvA0ejeT/7
	ASJ84g/4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRpSr-0003p4-Je; Mon, 12 Oct 2020 04:29:37 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRpSo-0003oH-JB
 for linux-riscv@lists.infradead.org; Mon, 12 Oct 2020 04:29:35 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09C4DLkQ093147; Mon, 12 Oct 2020 00:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=tpBQx1/o/qXftcxhMitB9KioMpDajyAdOcQuMq8tycw=;
 b=hKc2bG10YV99YiEYQhlsl0nD0FkT67cenqb7hGIHRBs4iQhTzqkx3Pypv1iBQIQJsOoP
 bUppPIDhfKeEbXz+iBEfIuXFR49lSxOPvc06F5GtCjl0gWv1HAAP37D7kB4kwqVgxdaB
 xCBzu9zv7xRSHbRaRFjYFeFJ7a1v55Kr7a08tojvuv56nBLVLsLgWO+A+uXcU5E6yOe/
 M5zqNmgZPjFen6Q2Dc/Odf70/I6o1cK548QXNjS+YajtHVKftmYbL1Jso21Nzy1pYTLl
 RxXtYyRWQcP8wSPqG6WgWBqNxRuNQ+dRKxa6wbDHzC6rzvGX2AmbKmiJFg4G6nUVlFnd pQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344fx488aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 00:29:23 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09C4MQrd030991;
 Mon, 12 Oct 2020 04:29:22 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3434k8r74u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 04:29:22 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09C4TM6k49938800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 04:29:22 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14D63AE062;
 Mon, 12 Oct 2020 04:29:22 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DCD5AE063;
 Mon, 12 Oct 2020 04:29:19 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.212.9])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 04:29:19 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 13/13] mm/debug_vm_pgtable: Avoid none pte in
 pte_clear_test
In-Reply-To: <20201011200258.GA91021@roeck-us.net>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-14-aneesh.kumar@linux.ibm.com>
 <20201011200258.GA91021@roeck-us.net>
Date: Mon, 12 Oct 2020 09:59:16 +0530
Message-ID: <87blh8xe1v.fsf@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_01:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=230 priorityscore=1501 adultscore=0 spamscore=0
 mlxscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010120034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_002934_707613_60CE1522 
X-CRM114-Status: GOOD (  19.77  )
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, mpe@ellerman.id.au,
 linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Guenter Roeck <linux@roeck-us.net> writes:

> On Wed, Sep 02, 2020 at 05:12:22PM +0530, Aneesh Kumar K.V wrote:
>> pte_clear_tests operate on an existing pte entry. Make sure that
>> is not a none pte entry.
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> This patch causes all riscv64 images to crash. Reverting it
> as well as the follow-up patch fixes the problem, but there are
> still several warning messages starting with
> 	BUG kmem_cache (Not tainted): Freechain corrupt
> I did not try to track down this other problem.
>
> A detailed crash log is at
> 	https://kerneltests.org/builders/qemu-riscv64-next/builds/523/steps/qemubuildcommand/logs/stdio
>
> Bisect log is attached.


https://lore.kernel.org/linux-mm/87zh5wx51b.fsf@linux.ibm.com

This was mentioned earlier. The RANDOM_OR_VALUE used is interacting with
some of the riscv page table accessors. 

-aneesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
