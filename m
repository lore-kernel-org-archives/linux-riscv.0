Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F49EE14D4
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6FOsC8bs/ygOMZHfh/6Eplwywiuo8W1odieP7X0QYM=; b=3K2sf4GhbcW9Hy
	BErhzaZ8HCzXN3k1+9ZKqxBdkQLjwIVt8+VFBaVv/hzNbzN+iy2uPNE12C9Gy61rcZeJPgNhNSBJl
	AA5lCmFlHx+g4GweCIQqNq2X2xxbZakd33T7yOZE/0VYpL4jY8D5Z6yyi/u68qdGUP/n8uIvcIpTm
	p+zP9zzWmE4STSLeP2p9sioPrhyx2Ojz3a0bAIbjoC0UPlwN+Ke2cMPd2y15N/moPLZh+MNr/nBpZ
	6xbjKlt9m8SWLw3u4+R2Ky7k6USS5Pz3tl7cPJ+dxPM7y7WbDwgFH+B9gR6m0zrXtqJb8b9uUTA6V
	V4Vz6h9FrXHWeSIVyg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBsF-00Bk3M-3C;
	Thu, 07 Sep 2023 10:04:31 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBsC-00Bk2s-2H;
	Thu, 07 Sep 2023 10:04:30 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3879caOR000951;
	Thu, 7 Sep 2023 10:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=I6yKRPq+c/Elou32cUh1duley7ZNzCzx4dQ/LkpfUxA=;
 b=DHZPQ3XGt33x5GrsId/vXYrG/iE6E+gLrOKL+U/VBJeW1vQgM6j4lPAkPytg5yNyn4yC
 NnLZ5I7eNikiD1CNmPx8keD5poJzm+agENSTbS0nTQ9Suh3Z74JOzOoxlyxj6w4UuPDe
 6FGh3s703rP9WxKOILztdPuC6HHT3j0oU/XrJGheS6W5kfMlMLbcLsZNXiXPTIPa+X8k
 Dd/VnjBmIij+CBeIxHBAsYfT8aUL+BWpmN1xeapO8VO+rKi7r/QP2ks34gKCEgzCz+qQ
 l3l+d10nbE06eDslOYbDPbHR3lzBRFReLxGBevEkdsg3sN5IUhD94CoFPZFOVRgYkv+a Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sybvkrphg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 10:00:53 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3879cqIs002126;
	Thu, 7 Sep 2023 10:00:52 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sybvkrpe2-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 10:00:52 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3877lVZc021441;
	Thu, 7 Sep 2023 09:08:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfrytjyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 09:08:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38798JP624511186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 09:08:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24B6E20067;
	Thu,  7 Sep 2023 09:08:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BBF92006C;
	Thu,  7 Sep 2023 09:08:16 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.70.29])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Sep 2023 09:08:16 +0000 (GMT)
Date: Thu, 7 Sep 2023 11:08:15 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: j.granados@samsung.com
Cc: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org,
        josh@joshtriplett.org, Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Guo Ren <guoren@kernel.org>, linux-fsdevel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org,
        linux-csky@vger.kernel.org
Subject: Re: [PATCH 1/8] S390: Remove sentinel elem from ctl_table arrays
Message-ID: <ZPmS/zkAs66pLcum@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
 <20230906-jag-sysctl_remove_empty_elem_arch-v1-1-3935d4854248@samsung.com>
Content-Disposition: inline
In-Reply-To: <20230906-jag-sysctl_remove_empty_elem_arch-v1-1-3935d4854248@samsung.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GQagwlLX8g4Qk39DU96L0orHwbmZ3MCK
X-Proofpoint-GUID: zMgjc5iBGTBt0dXVXUPsKepJtgT9tqBy
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=794 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_030428_862606_BAF8AD00 
X-CRM114-Status: GOOD (  20.66  )
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

On Wed, Sep 06, 2023 at 12:03:22PM +0200, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove the sentinel element from appldata_table, s390dbf_table,
> topology_ctl_table, cmm_table and page_table_sysctl. Reduced the
> memory allocation in appldata_register_ops by 1 effectively removing the
> sentinel from ops->ctl_table.
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  arch/s390/appldata/appldata_base.c | 6 ++----
>  arch/s390/kernel/debug.c           | 3 +--
>  arch/s390/kernel/topology.c        | 3 +--
>  arch/s390/mm/cmm.c                 | 3 +--
>  arch/s390/mm/pgalloc.c             | 3 +--
>  5 files changed, 6 insertions(+), 12 deletions(-)

Tested-by: Alexander Gordeev <agordeev@linux.ibm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
