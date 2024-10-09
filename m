Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62910CEFC5D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LJ8DC4BFfjHFHPkywvaDibQ9hqtCU9RRWk9+K1G4JY=; b=1Qk9Q6I0oMDlsk
	/vmC8FFE27bXg4UUO82oXtCVFMeKzIadZJGe6/FVPOEob8i6rvWQPxUN8qOsm4jjjUwana/XoPwDF
	fpkR3/WnQbT4m3Ogd+BooEp5yVSTYhze3M5kLZHYAebGEgSJFmvacpEx5RHGs7kohTU9ltaS7C9wb
	kur7ctB9/t2PVdjJqxZzLv1BElmq64Oy5DOgbE1FPI4aNqDJEQ1m/IpLXC+7EBuC/k6/5i29k9zQ5
	xQUjRGLNQd7seHLorTzie3cWA/yL8erDrM1LQ8iIg6sMgUfpOerJtHH/MOhKmvCoq35QRKkrAclb1
	7JpdCZU/Ivg5LaUwksYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTAM-00000008iVd-0iwC;
	Wed, 09 Oct 2024 09:39:34 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syT8K-00000008hww-0QUK;
	Wed, 09 Oct 2024 09:37:29 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4998JupJ031939;
	Wed, 9 Oct 2024 09:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=pp1; bh=4ZVfjGhflHfGjMb2cztN4jQiMEI
	BwPHrnxrWordVKqU=; b=U0AoDelLqaa44EBW6dZqg7AEFYaJPvCLUSy9tLId0aj
	8JlOE51Kc0a5MDLTOpaQwd4KEqGQiPTv5M1061XfehcubMUVaUdYLT6GlfQFSeQN
	5Z8zpgxWEIZD/ouh32gWknvVLyjVttNgWGzL+wu/swygksnBBJvmieePN9zg7aNY
	oLLDiUjOBOdSmTyImlaqZLpkZK5tCVJt1IFWtDkAGEJEz0CXDL4H1mNC7GbyYC10
	WcWHAl60sy5ONQwo/gbWzpBA45OIXsCWSDmVjh29j9ID1gUeSfplamA/ws9yi1Dp
	oNcIw3bsqjZnzxpkdwSkU7unRupCKSGanvdR5mS7J8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 425p7r0be8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:36:55 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4999asFg016952;
	Wed, 9 Oct 2024 09:36:54 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 425p7r0be0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:36:54 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4998OOFt022844;
	Wed, 9 Oct 2024 09:36:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423h9k0whg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:36:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4999anT753870968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Oct 2024 09:36:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65FDC20040;
	Wed,  9 Oct 2024 09:36:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7B7220043;
	Wed,  9 Oct 2024 09:36:48 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Oct 2024 09:36:48 +0000 (GMT)
Date: Wed, 9 Oct 2024 11:36:46 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 1/2] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241009093646.8007-C-hca@linux.ibm.com>
References: <20241008230527.674939311@goodmis.org>
 <20241008230628.958778821@goodmis.org>
Content-Disposition: inline
In-Reply-To: <20241008230628.958778821@goodmis.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _7FZ0KvUpdA6UuJ2HyHknE4GFnL1BOSc
X-Proofpoint-ORIG-GUID: JL2StsfsDLVSiBmGN94Yy7wadDz9WkZF
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_08,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=560 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_023728_153873_70AC1EDB 
X-CRM114-Status: GOOD (  18.46  )
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

On Tue, Oct 08, 2024 at 07:05:28PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> ftrace_regs was created to hold registers that store information to save
> function parameters, return value and stack. Since it is a subset of
> pt_regs, it should only be used by its accessor functions. But because
> pt_regs can easily be taken from ftrace_regs (on most archs), it is
> tempting to use it directly. But when running on other architectures, it
> may fail to build or worse, build but crash the kernel!
> 
> Instead, make struct ftrace_regs an empty structure and have the
> architectures define __arch_ftrace_regs and all the accessor functions
> will typecast to it to get to the actual fields. This will help avoid
> usage of ftrace_regs directly.
> 
> Link: https://lore.kernel.org/all/20241007171027.629bdafd@gandalf.local.home/
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
...
>  arch/s390/include/asm/ftrace.h           | 23 ++++++++++---------
>  arch/s390/kernel/asm-offsets.c           |  4 ++--
>  arch/s390/kernel/ftrace.c                |  2 +-
>  arch/s390/lib/test_unwind.c              |  4 ++--

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
