Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88118CE7AB4
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 06:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCykshBHZEZ428zI7fbaXC6JUJ2tD4ze6dO+5fqCmQ0=; b=Ic1w9Vy1XvNwAf
	T/j6C8w4gKcoGrIlbLTbewZp/zsWPtI0HaNuP2dmL5VoEp/NMWYM8znbOxi9390hoOMyhC/vhY+97
	f6dFpqGO41S7TPCnryxa54/PTUvYDBtKc/O4HwkABOy4iZ6w9Ykj8Bzn5Le8st1NSmFg4N5Rn+38P
	iyl++Me85RlDBh1J5IYrigmF+JFFaT4fraozvtPlJUNqTv2MEYd++P6J/PUPkjSWcTMFl6r8wohgq
	XBKLR2we/mChHr2TsYb+60jZmR60S1eSDNAn8E5uZ+qUUxXDlroC/cBavcQ7GVN6jSOK/DaFKSqaJ
	W+8+GF4LPX0H1WxzUrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smSIX-0000000ApyA-0rOj;
	Fri, 06 Sep 2024 06:18:21 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smSIU-0000000Apxg-1tDk
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 06:18:20 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485Ial4i024911;
	Fri, 6 Sep 2024 06:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:in-reply-to:references:date:message-id
	:mime-version:content-type; s=pp1; bh=pXh4KMsNoth6jF2dSYpp3yqFfl
	BIDerbakAwgupiRLw=; b=VfOzTIWgR/8gAXldOamiqVNBMRn7cRZEnbhh7+tapy
	PiaEE+/FVrorh3AgGeZs5ddqgpfoERFrGSxjPrDKbPSp9LebiU2vxWE7DxDpCP82
	YGLsS4qVT9E4FjxHohhDpaeiIfEN4W+Fy6Qu3DcxJJ0h8CFidVdrop1cAe4N3UV1
	4BMAzEtM/zUb7+4CSgECdHAxtKC92i7IKSK1fB9wCgYYy01ZgJu/r9CEgVOvLKH6
	b3I6ViIdyfmW9sp17h63UmdzBWJqLzELewzuLQNBc/g1JBJQvYJpmxjIF+n3DXIH
	c6MHWj1p10ipLcAgHwMkzodoIjypyjriLdK1lHnHsO6g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41fj2r2fxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 06:18:05 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4863YtH4020011;
	Fri, 6 Sep 2024 06:18:04 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41fj3xtadm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 06:18:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4866I2Nr36372896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Sep 2024 06:18:02 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEC8420111;
	Fri,  6 Sep 2024 06:18:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E4C42010F;
	Fri,  6 Sep 2024 06:18:02 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  6 Sep 2024 06:18:02 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland
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
In-Reply-To: <20240905111620.5211d9f8@gandalf.local.home> (Steven Rostedt's
	message of "Thu, 5 Sep 2024 11:16:20 -0400")
References: <20240904065908.1009086-1-svens@linux.ibm.com>
	<20240905111620.5211d9f8@gandalf.local.home>
Date: Fri, 06 Sep 2024 08:18:02 +0200
Message-ID: <yt9dv7z9l2zp.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Tkl4z5YWPGumm21CId0URXE-6X-XwY2g
X-Proofpoint-GUID: Tkl4z5YWPGumm21CId0URXE-6X-XwY2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 mlxlogscore=882 bulkscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_231818_853556_3D863D3A 
X-CRM114-Status: GOOD (  24.31  )
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

Steven Rostedt <rostedt@goodmis.org> writes:

> On Wed,  4 Sep 2024 08:58:54 +0200
> Sven Schnelle <svens@linux.ibm.com> wrote:
>
>> These patches add support for printing function arguments in ftrace.
> First I want to say THANK YOU!!!!
>
> This has been on my TODO list for far too long. I never got the time to
> work on it :-p
>
> Anyway, this is something I definitely want added. But I'm going to guess
> that there is going to be issues with it and I doubt it will be ready for
> the next merge window. I'm currently focused on some other things and also
> have to get ready for next weeks travels (I'll be in Prague for GNU Cauldron,
> then Vienna for Plumbers and OSS EU, then to Paris for Kernel Recipes!).
>
> But I most definitely want this in. Hopefully by 6.13. This may be
> something I can review on the plane (if I get my slides done).

Thanks! It's been hanging in my git repo for quite a while, so no need
to rush.

One thing i learned after submitting the series is that struct
ftrace_regs depends on CONFIG_FUNCTION_TRACER, so it cannot be used
with the graph tracer. So either we make it available unconditionally,
or use some other data structure. Would like to hear your opinion on
that, but i'll wait for the review after your travel because there
are likely other issues that needs to be fixed as well.

Thanks,
Sven

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
