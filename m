Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A35C388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10B520853
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JYhfWApy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XBIiWh0W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10B520853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CVASfVMLv3NjZeiamKGN952JAfNlgg/REZEnOIFT0pM=; b=JYhfWApytL7vP+kvW7f58u9wB
	eD6iXk4CPHPiDfu9WXb4wSC/yJsKXqWiLg0P9v/vSTvWS8l1HI3+gzC10F+WrP3gHooq47Jq0wCy8
	BtpNi6crozZB3Cc4FoUxM3OG4ngXPIS11nP4b4NEJAbx++syKJu+saMqFJLrtjWpnKGYO6bUpkWea
	yrIpwpYo7ZNRhRnu0Pwtb3bxE5MtFsQuL9pahjrd+97HqnoP5QqrggWaWb10ujRTeitBCFVPvwQxL
	kEvh+FHtQ3q233q1Af6vrF7mPgKEteUi5XPVp4a6QVeKLJDyf2mMIVNiqvzBHulV6wNN5UEyzRiAh
	+DsFhfD6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8i8-0000km-VN; Mon, 09 Nov 2020 15:04:01 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8i6-0000kE-Hb
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:03:59 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9EXJ3S007393; Mon, 9 Nov 2020 10:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=z5oC/8a+GTxhWeb+ZbLr8Xr4K+9R59YBdDdSSh5RKRM=;
 b=XBIiWh0WE20556srxE4tLXEI6LHTLU0XOZ47YJ+y5FuzrW6vuf5w3TIr9w02PGtl0Vm2
 DuyXTJVwYsCISKNILJK+M1iFuUbShIE99Jq3DvQ0X1oX8LTGL34og77coACb+wK/HnCR
 AVRIlisnmRGpjCYnFi2E9U+kSrjh53XqIuAVfOxVS9IbINjiz9ouXPIQfH7yUyevg9fc
 0cuNK+RY6Rh+1w1zFDzDYDLhR8XfzoI7LW78lTBKqQts2p3iPmUCCyCpGOO1FeUilMD3
 8ctNR0S83H168re3lA8+p6vac/432WdtO2v2czqxzZ5czK9JDYTlY7G1LjWXEnXT8HFU zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34q5urdbxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 10:03:25 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A9EXd3B009077;
 Mon, 9 Nov 2020 10:03:23 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34q5urdbtv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 10:03:23 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A9F1mKL012969;
 Mon, 9 Nov 2020 15:03:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 34p26phjpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 15:03:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0A9F3Gqd55771522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Nov 2020 15:03:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8080BAE055;
 Mon,  9 Nov 2020 15:03:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9050FAE051;
 Mon,  9 Nov 2020 15:03:15 +0000 (GMT)
Received: from osiris (unknown [9.171.58.192])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  9 Nov 2020 15:03:15 +0000 (GMT)
Date: Mon, 9 Nov 2020 16:03:14 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: YiFei Zhu <zhuyifei1999@gmail.com>
Subject: Re: [PATCH seccomp 5/8] s390: Enable seccomp architecture tracking
Message-ID: <20201109150314.GA16690@osiris>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
 <0fbe0c14d598e18effad3b648ab4808f9cd95eba.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fbe0c14d598e18effad3b648ab4808f9cd95eba.1604410035.git.yifeifz2@illinois.edu>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_02:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=859
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=1 adultscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011090098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_100358_913783_B8BF465E 
X-CRM114-Status: GOOD (  21.64  )
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 containers@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 07:43:01AM -0600, YiFei Zhu wrote:
> From: YiFei Zhu <yifeifz2@illinois.edu>
> 
> To enable seccomp constant action bitmaps, we need to have a static
> mapping to the audit architecture and system call table size. Add these
> for s390.
> 
> Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
> ---
>  arch/s390/include/asm/seccomp.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/s390/include/asm/seccomp.h b/arch/s390/include/asm/seccomp.h
> index 795bbe0d7ca6..71d46f0ba97b 100644
> --- a/arch/s390/include/asm/seccomp.h
> +++ b/arch/s390/include/asm/seccomp.h
> @@ -16,4 +16,13 @@
>  
>  #include <asm-generic/seccomp.h>
>  
> +#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_S390X
> +#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
> +#define SECCOMP_ARCH_NATIVE_NAME	"s390x"
> +#ifdef CONFIG_COMPAT
> +# define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_S390
> +# define SECCOMP_ARCH_COMPAT_NR		NR_syscalls
> +# define SECCOMP_ARCH_COMPAT_NAME	"s390"
> +#endif
> +

Acked-by: Heiko Carstens <hca@linux.ibm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
