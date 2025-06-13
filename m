Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23608C71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nj0zB1cyFNPPfV8v667x/DaxQd2sKYgBrcQ/GAuwXrw=; b=skz2wA8oyuefXK
	7Dg4F4Au13BsC6DJlXOiVxlMH0BILaxEcFFenJbudZCLH3EvjfPuh4FFhwd5pENV2+/14To9ECtuQ
	GKbe65RZcWDojTHq4K/Ify4/MqUwkGt1HtqdfX5w8FeA1P/ysWJApQgUNdrpXMcWBQ4i5VySOPL/e
	9meejyzI+sS9EKqeLURU+yRXAIvwJJEMc5cxQamfv0j6vC6z0+Ii6b4Igbz5rSTS7cgFhuqKnFuwh
	G9A6mwnv+SB/wg9z32UCJSrsA3gx1TDJqaBdhmsxEcloXUpNijVHJGT73pJXKRNVmp/RmNjwi3pqX
	YnzexW1s7saBKZU0GPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xv-0000000HGpz-00Er;
	Fri, 13 Jun 2025 18:17:23 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6qq-0000000GzV9-2KFN;
	Fri, 13 Jun 2025 16:01:57 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DATE0P029060;
	Fri, 13 Jun 2025 16:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=dxMSfWlJLSP1Q2CznlmbgSk8Q0tBnI
	ErVGASW4hTcD0=; b=Zhfihg3QYV80iCtJFIZNXzwNsO28/CBzBPA1NW4+cP5VWr
	k5l0f/92cmSa5uH4HyGSN7MW6sSZu3gD2JREmvkY9IWiDksFl/haBc28Yev1eh2p
	fR3cqw2RD+tVrXIr7ijzmVyteuDmhjWOR5YkS2N2qTSLKs3rs5KGToPoP9lOHn28
	Zc0+P608Mn4Oofwq9OObNNP0q5WFKuFHs7VgiBgMYGALGpI5XLkpWYhrNGGVAIJg
	CsvXGDatoWJVdD4D+XIN/bR1Z2kVnng6dv251wWZwQ5XqU8LCwiGj9YrhbE5Yqqs
	c0WIsVuRjG1it6BmiiXjCc1Dtc3+1matXW8Zfx8g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv8225n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 16:01:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55DFim5F019573;
	Fri, 13 Jun 2025 16:01:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4752f2tec9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 16:01:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55DG1irx33227464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 16:01:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3311620040;
	Fri, 13 Jun 2025 16:01:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4533A20043;
	Fri, 13 Jun 2025 16:01:43 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.81.121])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 13 Jun 2025 16:01:43 +0000 (GMT)
Date: Fri, 13 Jun 2025 18:01:41 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 09/12] lib/crc/s390: migrate s390-optimized CRC code
 into lib/crc/
Message-ID: <aExLZaoBCg55rZWJ@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <20250607200454.73587-10-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250607200454.73587-10-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oqxWeEseK0qommY-tA52lM8_yDgYBZ8b
X-Proofpoint-GUID: oqxWeEseK0qommY-tA52lM8_yDgYBZ8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDExNSBTYWx0ZWRfX2SFXW8bIydO8 QijS4XnzPyWGv7hUAVPhEsrOB00xE8g+gtnZ5TKc3xm/6m22RAo7pWDdkAUOPF1K6LO6qJEf193 PxiDvBNjb2KojolH7uIG4xIF5aoOVAuWCvsnLPUnzUljRW/4dT+d6yR8TGdRxod4wQd7u9oXLyt
 960X1pKDQBdkA9i2fSfl/dxiyGZuXG6X5RlU4ZS8JXRnJlDwSVv11Yh0NZ3so0jxjPrI/YVMcT2 6jW8eHHK29fMPvF4SWZi3ZgmFX9oL1/VYz01noMZpHwwtcEMmmSVoqdhzy0/dmzN0+Go88V0p57 Weg2+fyKZ+PNLuJB+wyFM7SDDMfP0OJ1UZqOon8sp39ETo2dKYj4MRErDeC122oOtE8J8jykSry
 lFdOt02pLQfhwmo1MyS48Be/xFyI96QJGhA1Fc1zghsJy38d3Mb+b7BSNKN7KQSA+ld6RejI
X-Authority-Analysis: v=2.4 cv=CfMI5Krl c=1 sm=1 tr=0 ts=684c4b6b cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=1XWaLZrsAAAA:8 a=DtkNC_JpMhehFE-g-C8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=403 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_090156_784467_BE2B8785 
X-CRM114-Status: GOOD (  14.29  )
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

On Sat, Jun 07, 2025 at 01:04:51PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Move the s390-optimized CRC code from arch/s390/lib/crc* into its new
> location in lib/crc/s390/, and wire it up in the new way.  This new way
> of organizing the CRC code eliminates the need to artificially split the
> code for each CRC variant into separate arch and generic modules,
> enabling better inlining and dead code elimination.  For more details,
> see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
...

Hi Eric,

With this series I am getting on s390:

alg: hash: skipping comparison tests for crc32c-s390 because crc32c-generic is unavailable

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
