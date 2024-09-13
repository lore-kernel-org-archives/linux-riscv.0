Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185CAEEEC1E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 06:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss0os1ey+zmaJswx+LrwcUITt+tfdIPxN1tlenDZzls=; b=dEUICB+A/8kNoB
	SouNsuu9Boy0kUzZ4b9oLpqdnEmRoEDGlYMKZX3DArLKsNVEXgFeQewapeFWgDdqN4Q5Crw9JwSCQ
	DYWUcuo37QPcHq46LqNzX9hMc4fot8hnbkIWrQIdjAFx63+Iuk5guedX7ZIJI9ehtKlsmFhBJ/5l2
	r8oRe9Fjimt6XJ312P27E/vbL1EGhtq+m515rFlwdUHURPd/wT1VFsu5lYjBbTWXLNP3Fi/d84HX9
	jCIL5xQAyZYKTXGSG3LRN9QZVyIr8vzOkfbo/AJ8Z2car7o+qG4xPO03wQKbCEgIayeVPxIVlIQf1
	TJ7ni4g7Li1ZPS3J2XUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sozPe-0000000F1C3-0Z9N;
	Fri, 13 Sep 2024 06:04:10 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sozPb-0000000F1BO-0GCJ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 06:04:08 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CNo6ej022644;
	Fri, 13 Sep 2024 06:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:in-reply-to:references:date:message-id
	:content-type:mime-version; s=pp1; bh=w8Yaj17rePOkc2oA8hmd/PPLMU
	G7M8Thql5tfawg9RU=; b=B7TwvFZ6cvkbhvnMBeO26n0h86Qnr6mIB4wCl18lm0
	EDaynUwRx2yqEcTSkUnj7vX74bkzHD3IMnTMobTf5JdYtniKUo+uMsIld0szlLM7
	j65sy82ZM58HKeVZbDERZZ0RNiUWY3uVAwLFE9/Hq6NPsq89hFc0hb3Qh36sptaO
	mPIv6Hq2pVeWW89ZrB2ONk8Q+0YXrb7ldbCFBznlshCnsaS2b3sstgGqUXGfKEKy
	JiUhLGk/W3V9Ve7hWCxkoQAy/WTzB0Sqhz5NCbw3qLvhZd1VTpRIyqUgEc7sLfqX
	P0N+c6XYNbAW6HSYnhjxrOeQ8A6MORxHZIS2wSqigMaQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gebaqxgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 06:03:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48D2035B010729;
	Fri, 13 Sep 2024 06:03:54 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41kmb6yv6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 06:03:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48D63qmC46203320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 06:03:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 563AF20043;
	Fri, 13 Sep 2024 06:03:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AA1020040;
	Fri, 13 Sep 2024 06:03:52 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 13 Sep 2024 06:03:52 +0000 (GMT)
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
In-Reply-To: <yt9dh6ape022.fsf@linux.ibm.com> (Sven Schnelle's message of
	"Mon, 09 Sep 2024 09:52:21 +0200")
References: <20240904065908.1009086-1-svens@linux.ibm.com>
	<20240905111620.5211d9f8@gandalf.local.home>
	<yt9dv7z9l2zp.fsf@linux.ibm.com>
	<20240906100738.2526cffd@gandalf.local.home>
	<20240908222830.01a01b10d62d59ed73dcb676@kernel.org>
	<yt9dh6ape022.fsf@linux.ibm.com>
Date: Fri, 13 Sep 2024 08:03:51 +0200
Message-ID: <yt9djzfgccoo.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7nToZDWGKNT9QZOOlyB71xBhYhClmsHN
X-Proofpoint-GUID: 7nToZDWGKNT9QZOOlyB71xBhYhClmsHN
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_03,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=858 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_230407_349402_CD91D778 
X-CRM114-Status: GOOD (  16.12  )
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

Sven Schnelle <svens@linux.ibm.com> writes:

> Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:
>
>> On Fri, 6 Sep 2024 10:07:38 -0400
>> Steven Rostedt <rostedt@goodmis.org> wrote:
>>
>>> On Fri, 06 Sep 2024 08:18:02 +0200
>>> Sven Schnelle <svens@linux.ibm.com> wrote:
>>> 
>>> 
>>> > One thing i learned after submitting the series is that struct
>>> > ftrace_regs depends on CONFIG_FUNCTION_TRACER, so it cannot be used
>>> > with the graph tracer.
>>
>> Yeah, this is solved by my series [1].
>>
>> [1] https://patchwork.kernel.org/project/linux-trace-kernel/patch/172398532480.293426.13232399076477198126.stgit@devnote2/
>>
>> So I think this series is easier to apply after my series, which
>> passes fgraph_regs in return handler.
>
> Thanks, i'll rebase my changes on top of your patches then.

While doing so i noticed that i completely forgot about arguments
located on the stack. The current patchset tries to read from the
current kernel stack, which is obviously wrong. So either the tracer
needs to save the stack frame in the ringbuffer (which would be quite
a lot of data), or ftrace only prints arguments located in registers.
Also not nice. Opinions?

Thanks
Sven

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
