Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7684EE6FE49
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcnJ0oakaYfkK+rQk0cpaym95voZJKHFY4WdfQwNnQQ=; b=Ej+8KiKE9EZrh7
	Eol4jCaYbiz1lwPJr+k7tz6th94wW1EcFgfPsBTm0rnezFHMBXi6vPPE1/YYhtHBdrzRrN2NAXZ/p
	ZYTlwy2foTeNFqHkHEkLujOIImG3UMcB8+a3cTMy+TNBLq4ig2txNE1mRsAdbDz8uRJBRLVRFmEOP
	DLaK+iNVEqQJuliwaKk4ADdyZoD0qYr655wsIrMNlb2vbZcv5biwpnJs8VSDWy3Yt6VAw+fmX4lSl
	e9wOU+K9nPlZaRXSZj/xGnOeEjWi+UxZb+KAUSRKQh1GOMkdepuqFVkrKYYJjvgHj45TrnsQEq1Ez
	gyK3Qhn22by7wL/q5UgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZD2-00000000v0L-2Gu2;
	Mon, 09 Sep 2024 07:53:16 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZCO-00000000uqF-0v8d
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 07:52:38 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488EGkuL028493;
	Mon, 9 Sep 2024 07:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:in-reply-to:references:date:message-id
	:content-type:mime-version; s=pp1; bh=moBXgB70de3lqjGc3xvwz3nwGd
	M+kLX4K4e1CtqCfZ4=; b=sdc1ZcbQ/8Uu30BI3hll/ZZKmpbCvKSUaQBgtC4Oft
	h0CbuIuk2EVJzTcp492wfWrPk+jbTSvpPq768JHxnPo5xBp4UsSRsmPXtNAPxLDU
	4vRfRwV3AqB4MypjtDPSc9HjovscGDk95GuElNQxzX7ihpdQcNqbROwxKp4tV/Fo
	YFDpniTP5gt7xwrD3pqXvXFo8oxDE903tv5OY1exvkteLz7QBzO3jAb6U3dnm/yB
	WJ1BJDhtg7msCVnZNCfL+Ptm0r2LpLnWrhwk4BtUygvaVU7f7wHii6mBOUk/ponX
	X/Z/XydQbXbkckwbVTi3IcBAUb3387hkOODAsvH1iKuw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gefy8dw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 07:52:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4894XkfN027333;
	Mon, 9 Sep 2024 07:52:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41h3v2w2dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 07:52:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4897qLQu22217104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Sep 2024 07:52:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBBDB2005A;
	Mon,  9 Sep 2024 07:52:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A018320040;
	Mon,  9 Sep 2024 07:52:21 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  9 Sep 2024 07:52:21 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Rutland
 <mark.rutland@arm.com>,
        Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>,
        Paul Walmsley
 <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 0/7] add function arguments to ftrace
In-Reply-To: <20240908222830.01a01b10d62d59ed73dcb676@kernel.org> (Masami
	Hiramatsu's message of "Sun, 8 Sep 2024 22:28:30 +0900")
References: <20240904065908.1009086-1-svens@linux.ibm.com>
	<20240905111620.5211d9f8@gandalf.local.home>
	<yt9dv7z9l2zp.fsf@linux.ibm.com>
	<20240906100738.2526cffd@gandalf.local.home>
	<20240908222830.01a01b10d62d59ed73dcb676@kernel.org>
Date: Mon, 09 Sep 2024 09:52:21 +0200
Message-ID: <yt9dh6ape022.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jS8qGd1Kag-0cgWKKAQwQPih_Lh8MSWc
X-Proofpoint-ORIG-GUID: jS8qGd1Kag-0cgWKKAQwQPih_Lh8MSWc
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_01,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=765 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005236_643850_8B33F6DB 
X-CRM114-Status: GOOD (  16.69  )
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

Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:

> On Fri, 6 Sep 2024 10:07:38 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
>> On Fri, 06 Sep 2024 08:18:02 +0200
>> Sven Schnelle <svens@linux.ibm.com> wrote:
>> 
>> 
>> > One thing i learned after submitting the series is that struct
>> > ftrace_regs depends on CONFIG_FUNCTION_TRACER, so it cannot be used
>> > with the graph tracer.
>
> Yeah, this is solved by my series [1].
>
> [1] https://patchwork.kernel.org/project/linux-trace-kernel/patch/172398532480.293426.13232399076477198126.stgit@devnote2/
>
> So I think this series is easier to apply after my series, which
> passes fgraph_regs in return handler.

Thanks, i'll rebase my changes on top of your patches then.

Regards
Sven

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
