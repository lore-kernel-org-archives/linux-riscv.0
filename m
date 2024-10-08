Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37C5CEFC21
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwlCuvwVnbEWi1K9/0vswVMHS5TytvM4Js38/gaJu6Q=; b=D+eHtFxD/wfV5t
	6hxa9hr1v6dc5mDD1G+YSGuenLJp0LK8NvmjeL2oJ2BY5Yxn8XdAKNccIPquCm+HerPmVkC989iG1
	ZQCiMJidmtDG/hkhRzuAH5tSVa3YPDROCPIAQn6SD02V95i8xIzuSWP6a3nB91MUJE0xH22zkRdke
	quzpdBOIn9FWJxQMslRQZDPBEwELw1v6qcLT0WptgaW7s7UiVJ8nurVLQ9cheH0hq1lEWKRWgJ5UE
	A3jx5xgzNAMo8ysV3A8vB1tOyeVEJEePyMtBN0SJp4euK/3H8ffr1uStlfN/FxxkZqWCC9/qkyeoA
	1hmd97fBY7ivh8rkYdaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syBoZ-00000006JBR-0MBf;
	Tue, 08 Oct 2024 15:07:55 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syBgX-00000006HTA-0izp;
	Tue, 08 Oct 2024 14:59:38 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498AnhDi003703;
	Tue, 8 Oct 2024 14:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=BQI8GJBzvYzMZY9guzB38AAkQep
	hutvxTMxerY22j98=; b=r9CRYLuq87IoMuZlkQ0Ni4dlH5oab8oUZHdJ1O7eW/f
	ASY5wTgBmrRdV197eKYTzRIgFr9QF/X/3sGswuCcNpP4Ra/xeM/rqwS7VZxYkOmc
	FEOukCnltW7eFV5Iw1RtzWtn+BYigF7m66Uv12aF2Yf65bknIsb/IWpigr3apkpT
	fP6/5nmpiI8n5/dTZAbyLf7Md7VQAfeKilpLeNbpwAHp2lkfFbpelSgIrDv0Dqt1
	L6b6y2EFRDszfq1Bb+GSYImWr34yTiNS8khAMGgSk+R+OjdHtNwo/v+WwPvZ4T7+
	OKNMuUWTzzK5Ar+C4fVeDFQEEQDZP3sk4gYojXB9i9Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4253axshkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 14:59:00 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 498EwxvT020967;
	Tue, 8 Oct 2024 14:59:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4253axshkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 14:58:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 498Ccg58011524;
	Tue, 8 Oct 2024 14:58:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423g5xn1k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 14:58:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 498EwsmQ53805504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Oct 2024 14:58:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 963E92005A;
	Tue,  8 Oct 2024 14:58:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFF592004B;
	Tue,  8 Oct 2024 14:58:53 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  8 Oct 2024 14:58:53 +0000 (GMT)
Date: Tue, 8 Oct 2024 16:58:52 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
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
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241008145852.27223-E-hca@linux.ibm.com>
References: <20241007204743.41314f1d@gandalf.local.home>
 <20241007205458.2bbdf736@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007205458.2bbdf736@gandalf.local.home>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rpCzCkGFqxcT_39UaFTAgq0pycf5z52K
X-Proofpoint-GUID: r9NhdoWBAoOlbu5hPW1yGJhlEeNksSe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_13,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=9 clxscore=1011 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=9 priorityscore=1501
 impostorscore=0 spamscore=9 mlxlogscore=101 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_075937_247317_912E2BC4 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Oct 07, 2024 at 08:54:58PM -0400, Steven Rostedt wrote:
> On Mon, 7 Oct 2024 20:47:43 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> #define arch_ftrace_get_regs(fregs)	({ &arch_ftrace_regs(fregs)->regs; })
> 
> I may send a v2 (tomorrow).

Could you also write against which tree this patch is?
It doesn't apply on top of Linus' master branch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
