Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9626C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PByfwzw+o5YNLMTuq7b6K9E27+KaiNL/OHdGtpH+UFc=; b=Kdc/nO8cUiqjVD
	66qlpaoRnDzx4q5gRYiRWfPBD0TSG41uIidmN4Kjd4FbgkQN3ti97LwISYbDkjlal7nvx79TT4EBg
	bSMGTH8SJm8rU0TzmCZdMj1GffXHX8GeKTCWiK/Phdk3xU20kEspJSzOrSZadvkMDyD1SkAIdqu5y
	VTH6D0cMlnBJG8ChArNp9hXbx0oIG7x/pm53aurPBX22y/TDt1+wqrO5gqRKL914hFxnMoHa0WQcg
	A/8AzvyXkPVTo/JYCWoiOw5cWAwmpuZGn1p1dYRw7KVJDgsShDCVjdU80v/iVs65Wg/CS7dBHJj8R
	yqFStKl7+EXZFX4IKqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFLK-009beo-0s;
	Wed, 17 May 2023 11:29:18 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFLE-009bdO-0S;
	Wed, 17 May 2023 11:29:16 +0000
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HB7BJC023902;
	Wed, 17 May 2023 11:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=NDNDo483NWCxuBgC62EmEkRd88RyM/bkMdaCrqWiEjU=;
 b=VRtGkAflt6Ne1p93gyowlWX7j5boLIQ7h0nC9VIo7uX3bwTrUs3t4FOkk1lJTYXqc25V
 9FamFmiSWFwwyWa1DKrOu9DcxLjGAv2i0jSAymPQgGQf5P0M1OluYrFgT26OhkCmT/su
 BOKQtACZlOM4qdl7albr+SCOM7HzolGHsX5OPk132gsH5r9G7psINiKU8nGXVgkrlm0G
 JFTSinpEe96JQbyAanKB2Lfpy9cfYcMtNW6I0KolKOl1iMwgb7HevQZDAfJyxXafubsX
 7gBNmSwaGFu7ct5RonhF3KWLIHQEwZVWECGZeI9L5VSTs6GPXqMDDHdOU4895qB3OFQc 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qmw5v1gq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 11:28:14 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34HB7Pi6025529;
	Wed, 17 May 2023 11:28:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qmw5v1gn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 11:28:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34H2RRIs022653;
	Wed, 17 May 2023 11:28:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qj264t4u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 11:28:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34HBS6QC63177030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 May 2023 11:28:06 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 203902004B;
	Wed, 17 May 2023 11:28:06 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CE9620040;
	Wed, 17 May 2023 11:28:05 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 17 May 2023 11:28:04 +0000 (GMT)
Date: Wed, 17 May 2023 13:28:03 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 16/23] s390: gmap use pte_unmap_unlock() not spin_unlock()
Message-ID: <ZGS6Q9jb/Rjwi4Rm@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <5579873-d7b-65e-5de0-a2ba8a144e7@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5579873-d7b-65e-5de0-a2ba8a144e7@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tSWvl9C0MlO4O_EzCFOjF_JcbOB8NztS
X-Proofpoint-ORIG-GUID: NWm_n_tm0YYcdEmwRmZvkdtWX-DujuzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=780
 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305170090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_042915_588229_AB0AD13F 
X-CRM114-Status: GOOD (  18.18  )
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

On Tue, May 09, 2023 at 10:02:32PM -0700, Hugh Dickins wrote:
> pte_alloc_map_lock() expects to be followed by pte_unmap_unlock(): to
> keep balance in future, pass ptep as well as ptl to gmap_pte_op_end(),
> and use pte_unmap_unlock() instead of direct spin_unlock() (even though
> ptep ends up unused inside the macro).
> 
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  arch/s390/mm/gmap.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
