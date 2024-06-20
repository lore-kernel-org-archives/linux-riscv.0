Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD82FC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUYEh2OsK+Ay/VYZw7kOuUhU+wmJyoAOhouTXdTwWQk=; b=Y0x24It0ROsJpb
	aj2xS82xurjLGVrRNkuio8BQjDkGz5jXuBK+u5kg8P/K8i3yrnj9dDutvVf4UrUm6OtdLiXt1LNad
	n5UbyrHTqZTdWmekN8O/ZI5wM6clBH/1x8e8XkCQS9yXM5O+ishm/wcUZFrMwc2ZNK9H7dMdtaYPI
	HbdLWfyPe0s9PmPWLjhyNEjahGnLPYFtXlpO+jFrHko6G3QZvUV9CrnLqfyCwX5utQr0NLPtdGHEc
	3uHDBf7q4e1zhniZZeKkvSw09PaD/cpoW+rjv3w2RAhPe3OzBS6O7nQPRx2vm5FqmBy3G90k/TK4P
	z8xThPiWyhtXqw0yj7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKECC-00000004PM9-3VQ3;
	Thu, 20 Jun 2024 09:35:08 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEC8-00000004PKP-1r3H;
	Thu, 20 Jun 2024 09:35:05 +0000
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K7QMBp028247;
	Thu, 20 Jun 2024 09:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=pp1; bh=8yLhV3Q1jPtG9/ip4DkXHhmDylT
	rROEu81cZ82Q9xuc=; b=BJiiteA2XiDtMQ75ZRjOaiw4f1epm8QxEscalu4qt7T
	nPNAQeaUgqui/5Ew9u1FE/WbHLvjyhjSQsyO4JE+8nzlMNXNZonzs3iX1UxOdQW/
	fsUkQ5VknoEIe/1w1gW6RMISzyeQMynp/gr/O+wOwSA09FJUYw77QOEVF22vaEaC
	KT0RUnK6jB/QAwo1HlMzrIEVxfuJhSfpt13lThGW76AsBUxBSHAmwS6jQWDZX84t
	heLMI7jLBujWzj2FrEn7qhRjI5lS7tgSubgkEOlxr8WNZEQnjllg0u43tAdQoPUC
	ef1LTnODRdppx69V2wxNEgig0Z2eTy1AojP26GLef0A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvf6prg0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:34:26 +0000 (GMT)
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45K9YPBS031239;
	Thu, 20 Jun 2024 09:34:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvf6prg0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:34:25 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45K87Grt019567;
	Thu, 20 Jun 2024 09:34:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ysnp1mtfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:34:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45K9YIHY50069970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jun 2024 09:34:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F7592004B;
	Thu, 20 Jun 2024 09:34:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CF6620043;
	Thu, 20 Jun 2024 09:34:18 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 20 Jun 2024 09:34:17 +0000 (GMT)
Date: Thu, 20 Jun 2024 11:34:16 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yuntao Liu <liuyuntao12@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Leonardo Bras <leobras@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] randomize_kstack: Remove non-functional per-arch entropy
 filtering
Message-ID: <20240620093416.8127-A-hca@linux.ibm.com>
References: <20240619214711.work.953-kees@kernel.org>
Content-Disposition: inline
In-Reply-To: <20240619214711.work.953-kees@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nq2142b1zTEnF-2JrlN2ZBXbmbq493Iw
X-Proofpoint-GUID: Iy1wvgtfcOU06jkae57Q6f-fdZoagx5t
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=780 clxscore=1011 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_023504_616045_1FDD7239 
X-CRM114-Status: GOOD (  20.30  )
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

On Wed, Jun 19, 2024 at 02:47:15PM -0700, Kees Cook wrote:
> An unintended consequence of commit 9c573cd31343 ("randomize_kstack:
> Improve entropy diffusion") was that the per-architecture entropy size
> filtering reduced how many bits were being added to the mix, rather than
> how many bits were being used during the offsetting. All architectures
> fell back to the existing default of 0x3FF (10 bits), which will consume
> at most 1KiB of stack space. It seems that this is working just fine,
> so let's avoid the confusion and update everything to use the default.
> 
> The prior intent of the per-architecture limits were:
> 
>   arm64: capped at 0x1FF (9 bits), 5 bits effective
>   powerpc: uncapped (10 bits), 6 or 7 bits effective
>   riscv: uncapped (10 bits), 6 bits effective
>   x86: capped at 0xFF (8 bits), 5 (x86_64) or 6 (ia32) bits effective
>   s390: capped at 0xFF (8 bits), undocumented effective entropy
> 
> Current discussion has led to just dropping the original per-architecture
> filters. The additional entropy appears to be safe for arm64, x86,
> and s390. Quoting Arnd, "There is no point pretending that 15.75KB is
> somehow safe to use while 15.00KB is not."
> 
> Co-developed-by: Yuntao Liu <liuyuntao12@huawei.com>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> Fixes: 9c573cd31343 ("randomize_kstack: Improve entropy diffusion")
> Link: https://lore.kernel.org/r/20240617133721.377540-1-liuyuntao12@huawei.com
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/kernel/syscall.c          | 16 +++++++---------
>  arch/s390/include/asm/entry-common.h |  2 +-
>  arch/x86/include/asm/entry-common.h  | 15 ++++++---------
>  3 files changed, 14 insertions(+), 19 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
