Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D7DEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiwyVe6hVatb9gV5rxGjfru8Uv3xBJrhMzgr4LrXNIw=; b=cw/TYaOuGzo+Jp
	bgfiWIyo/hPOxf4Rw4RwwV5Y6gf8fv5KfqWavNMrR3YCtaJCFo/7osrGa50DrH6pZnnzpe01j+WG8
	YE3dtlp4Qh3nZIK9xZpN+RAfyKTDEAW0OkywXPuH+gZbN4lJAiR9qAusBfkazrC9Z+LvH4tGAxR43
	sWGRZyF5e7zrOjmPt8Cez2oTpad59k5d5xpl4X1kazT4q2OeTrPMm44GBDUJstrmMfwAn8bWgfBdX
	wJlBrOslxvT+NVblZNfEFdHpieXLu71Z+q48DXZjpdRgDBLmjem7i8gO/4gGFpYMD3ROwhPKvKLBT
	xzNaRgfRo4TVJYVOybJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9SNj-00C4X5-31;
	Wed, 14 Jun 2023 15:25:59 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9SNg-00C4Wb-2G;
	Wed, 14 Jun 2023 15:25:57 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EFHC42024294;
	Wed, 14 Jun 2023 15:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Om5Yu00za5SQnR9XNl0dCFHkT+3j0DnvxU4aKZaBl94=;
 b=i0xvHbzPRVblfoKAETw3pELjqmoaC79qm0W8kThnpZpUd8FjIppGfOjrvdnf7lNY+H3U
 EsXrbamQx67n1emRXUXnqndjpZHDUBtfpx6mS2RU6mSjvBRh0mxXF4jql/eZxBvLRsfN
 6hBzE/q9VEbJggSpKbW+2IaXNMu+gmm5Uepw/lgYkHbv6gK8hqHw681Mrc/veZtxi0GD
 OkWnKSu27AXDQbLUPHlwe6m1gAJTfOC6gfI0xEfqsbKTlDTSq1guVJyyEeA88qKbteDv
 yhoEfUDOX03r/Za4WbMRI7zbdxbmD/ktzBAF74dlSxBx9+d0gkBGM3+/CdLUUhqotNHq lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7g25g7hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 15:25:05 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35EFIvfT030568;
	Wed, 14 Jun 2023 15:25:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7g25g7g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 15:25:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35E30AGC029037;
	Wed, 14 Jun 2023 15:25:02 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee2y5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 15:25:01 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35EFOwME52298032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 15:24:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 649442004B;
	Wed, 14 Jun 2023 15:24:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F80D20043;
	Wed, 14 Jun 2023 15:24:56 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 Jun 2023 15:24:56 +0000 (GMT)
Date: Wed, 14 Jun 2023 17:24:55 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org,
        paulmck@kernel.org, peterz@infradead.org, frederic@kernel.org,
        akpm@linux-foundation.org, ardb@kernel.org, samitolvanen@google.com,
        juerg.haefliger@canonical.com, arnd@arndb.de,
        rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
        sebastian.reichel@collabora.com, rppt@kernel.org,
        kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
        ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
        mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
        xin3.li@intel.com, tj@kernel.org, gregkh@linuxfoundation.org,
        tsi@tuyoix.net, bhe@redhat.com, hbathini@linux.ibm.com,
        sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v1 01/21] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
Message-ID: <ZInbx5cof4STvrZl@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-2-eric.devolder@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230612172805.681179-2-eric.devolder@oracle.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fvzzxoXdLwFO8Aa8-sXweKR-gD7bRn23
X-Proofpoint-ORIG-GUID: TWFZBsQ0SDtxswDHR3CwXf0L-3XIaKgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_10,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=839
 mlxscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_082556_750083_AD66DECA 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, Jun 12, 2023 at 01:27:53PM -0400, Eric DeVolder wrote:
...
> +config KEXEC_FILE
> +	bool "Enable kexec file based system call"
> +	depends on ARCH_HAS_KEXEC_FILE
> +	select KEXEC_CORE
> +	help
> +	  This is new version of kexec system call. This system call is
> +	  file based and takes file descriptors as system call argument
> +	  for kernel and initramfs as opposed to list of segments as
> +	  accepted by previous system call.

Which "previous"? I guess, "by kexec system call" would sound clear.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
