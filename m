Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083B2CEFC5D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFAJG8x85fJqUO3859XhPYM9RT907ZpZmFV6auTlPso=; b=VbgHWgcNt3lFFz
	um47+t657A8hb75iBiom5EnLib4ZUBIMvRRJzTfCTv7u/d7gs7B24T51MLhtt0HGINP5Tx4GufxfZ
	QpYXrlDbwzZ0rIzQ20FdQNXsoKwCGADyc5EMKOt7Kt1q8bxvid07P8exTCrzrg20a/a/gvBSHfyKK
	wgE5X4wU4Ew6vIi4bNRtWUp6gqz5q+Hh0C6eLd/tAPq6NXbuBCMUquWJln2HwXWBdup9Gpv3nUE/U
	qZc+TOWCRFVm4k66Y6PlfRW4WugbL7fvQx87OfRfv4YRUGGzBOUsgQjsT3G4kLeRWYIP7abpyzom6
	EOSI7+ak2micDMqK8QjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTBd-00000008imS-2Uu3;
	Wed, 09 Oct 2024 09:40:53 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syT8c-00000008i2o-34fW;
	Wed, 09 Oct 2024 09:37:47 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4997QMve028472;
	Wed, 9 Oct 2024 09:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=4fNQ+8RmglCqVKBxGrAojCBFjWc
	qgWspkWgdbNioFLc=; b=kcXD4bIEySVjicPnDmfzdEHWme2X+EHygcgQfb9Qm65
	hwM7abq+fXHcrZYXDD+AwHBJmFNpM/QCzKQVsMRW4V+BF/M+1gBS9KOoTVVGutQr
	QRMjg12z4gmfnmURH+nAyZzREFJoW1U2vhzVCWDsxb7G4KP5/jBtk0J8S3EOI49X
	uLwzvajfTPBHCO9AfpcQQpLpx6PD61mhcxlc9kx896ZDIZdXD+/a+z6Ujh2x1yxK
	I99Gux9E6xwA3MV2VajYUxDIFzjHCDD+1RqKRkhDoWMzqMy8DONzGv4f6mgJKX0x
	DNsGVdk51O11jjkqSP9ziktsv2GPXtjDUP8gJGwo1Ng==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 425nefgjhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:37:23 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4999bM2T011033;
	Wed, 9 Oct 2024 09:37:22 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 425nefgjh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:37:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4998VI50022847;
	Wed, 9 Oct 2024 09:37:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423h9k0wk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:37:21 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4999bHUW53543356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Oct 2024 09:37:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61DE920040;
	Wed,  9 Oct 2024 09:37:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 951412004B;
	Wed,  9 Oct 2024 09:37:16 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Oct 2024 09:37:16 +0000 (GMT)
Date: Wed, 9 Oct 2024 11:37:14 +0200
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
Subject: Re: [PATCH v2 2/2] ftrace: Consolidate ftrace_regs accessor
 functions for archs using pt_regs
Message-ID: <20241009093714.8007-D-hca@linux.ibm.com>
References: <20241008230527.674939311@goodmis.org>
 <20241008230629.118325673@goodmis.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008230629.118325673@goodmis.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TFXfZJBKt3TXi7mhFzxQ8d6YDbWPR-O_
X-Proofpoint-ORIG-GUID: zEXZbVUipOyj-zc2RijPGpZTAs11IO_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_08,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=386 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_023746_784324_3BFAE7FE 
X-CRM114-Status: GOOD (  17.32  )
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

On Tue, Oct 08, 2024 at 07:05:29PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> Most architectures use pt_regs within ftrace_regs making a lot of the
> accessor functions just calls to the pt_regs internally. Instead of
> duplication this effort, use a HAVE_ARCH_FTRACE_REGS for architectures
> that have their own ftrace_regs that is not based on pt_regs and will
> define all the accessor functions, and for the architectures that just use
> pt_regs, it will leave it undefined, and the default accessor functions
> will be used.
> 
> Note, this will also make it easier to add new accessor functions to
> ftrace_regs as it will mean having to touch less architectures.
> 
> Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
...
>  arch/s390/include/asm/ftrace.h      | 26 +--------------------

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
