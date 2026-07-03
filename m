Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F35C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 11:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgQFzp3jgVEWvK+I6PWyraY+ovNLhP+F2EnVxUEfCtg=; b=nQX3lksIeOWTQD
	JhA1ucYFrEGcIDwGdWQ4pEMQejJXhwDj2GZDIjK+HVp7lR8P4JO3OUcMNKeNN8jxs9LqAZKnl0zfl
	aaaLxKmvi6+2tBLWKfX+7DYGc3nctPYKOnXrSiEoQf/N7Rww4GZlbdQWGfGkaEdHhz8is5AIdIj2+
	giHuwlRi55a0jYbZ2DjaN+Zgf1LMWdK7EwMRMB1EKip3JeJ47DtYpdmLr9pJQYZfH6/u+aPNneic7
	iWgNSeGz4nRQ8KEB0AmaoAwlnF0UMdSxU+JjgHnwTzUWoeFBJS3hsVGbbaEkOZZ3ARCJsZFI1pA1j
	Y/MmkJW6wsp+PUNxpElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbuo-00000006nKs-2Ndg;
	Fri, 03 Jul 2026 11:18:38 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbul-00000006nKG-3ZXh
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 11:18:37 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636IMko1869578;
	Fri, 3 Jul 2026 11:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=e3mIWjjPHC2jQGnOFC7thY24OHya8W
	IvxXeqyT6oGSg=; b=Q0aJJYF9dtwlsNKEBBNOApaRq3UFcjJIegWMprn+NgB/wN
	BhoM25+LA2sJJ23e+alaRH4BbHzlJUvUbNRRw3NI6OjJ6ziQf8PbSiXxByYHOkPm
	M0BBWn6oIE6QWGT0iUtPbwxhz3QGmMSZ3PTkYDdenp5D6z16I8/M8aUjfwvIXZj8
	1E/cxtJ/yCUF7ZiCLz2H/pMYT9UDRItYBL6oMAGn4OAxsqoI7FX5uXsdnBcnT+4/
	icBw2B6l9tZrBPp7zFoyE1qkubKZNzNfz6Nn3Td6BRGKxL5U/757mVQ716D0CpZv
	YG/aM+H+uSET89IoLrFRkEVMelpOL77EkbJG0l7Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n66xjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 11:17:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 663B4c22019342;
	Fri, 3 Jul 2026 11:17:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2uhyr95v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 11:17:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 663BHI5E15794466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jul 2026 11:17:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7DA120043;
	Fri,  3 Jul 2026 11:17:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D5D320040;
	Fri,  3 Jul 2026 11:17:18 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.87.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  3 Jul 2026 11:17:18 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet
 <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Madhavan
 Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Andy Lutomirski
 <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov
 <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Mark
 Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Jiaxun
 Yang <jiaxun.yang@flygoat.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mukesh Kumar Chaurasiya
 <mkchauras@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, Zong
 Li <zong.li@sifive.com>,
        Nam Cao <namcao@linutronix.de>, Deepak Gupta
 <debug@rivosinc.com>,
        Lukas Gerlach <lukas.gerlach@cispa.de>,
        Rui Qi
 <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
In-Reply-To: <20260703105718.GO751831@noisy.programming.kicks-ass.net>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
	<BA7CD91D-C0E5-47A1-B49C-BC6AF6604182@zytor.com> <87h5mhnjsr.ffs@fw13>
	<yt9dwlvca8rn.fsf@linux.ibm.com> <87ldbsmnie.ffs@fw13>
	<yt9d5x2w5r84.fsf@linux.ibm.com>
	<20260703105718.GO751831@noisy.programming.kicks-ass.net>
Date: Fri, 03 Jul 2026 13:17:17 +0200
Message-ID: <yt9dy0fs491e.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX+GNM28+S+q9l
 BELxjBAoq445y2QzzawGDGTJnfcushe8WtNdbK943ny9NKE9ccogdJOweW7qU7dT3M4wh6xeTZ2
 9j0ES01oU7QHwBbtk3kxceW3j0L7gka8hesV9iEUwiS7IrhlcoyoXPn6D9M4YBmfsGUWqJYZhvS
 rBKS//NHCeJjSMprX/w+2dkOv2fwXe5YwFus3H269xtP21LtFBS2e2LYktOi3tP4xwQ/SzqQmSF
 ejA1BdS8PnfP9UNhylqYxGbV4+3VNTfalHI54uBKd3RxBbLNEr9QYMG3sM6Hi5qY2PA2OgZk+xI
 xW+hJk9T76Lrd7yvboD6tYlVWnJOI/QUTPtCh0o2ztrHG1x3xGWW4ug/jbapz9tGsYfBqDtF7kX
 OnLh2AMPUj9ARSKzkDyf5LWLGMROyeuPG+HDyyqZSprV1dEWAJxQi86DIquBxokqux+bzAgfhTJ
 wydMS0XQgiLUKVlaiig==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a479a44 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=IYs4laj69N0MEcrddxIA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: vjWAsFjipWIcsqbC3S0UJbl0ElSd3xj0
X-Proofpoint-GUID: lNTbQLoMpIDPD-mC7hdc6d8owZUnyE9i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX4W3vH3nW8N0g
 t+gRTNsRJlxprPVE4e4+aJTbgLOxvxtHRQcQi/xR4F9B3cuyrkwZu7Kay7tjS9rFbLvk+ZB4Ift
 NBBGs0M613OeI98iKRYcpBjizl1eX5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_041835_902729_44787988 
X-CRM114-Status: GOOD (  31.92  )
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

Peter Zijlstra <peterz@infradead.org> writes:

> On Fri, Jul 03, 2026 at 11:59:07AM +0200, Sven Schnelle wrote:
>> Thomas Gleixner <tglx@kernel.org> writes:
>>
>> > On Fri, Jul 03 2026 at 08:26, Sven Schnelle wrote:
>> >> Thomas Gleixner <tglx@kernel.org> writes:
>> >>> It's less than obvious and I have no objections to clean that up and
>> >>> make it more intuitive, but I still fail to see what Michal is actually
>> >>> trying to solve and what the magic flag is for. If s390 requires it,
>> >>> then that's an s390 problem, but definitely x86 does not.
>> >>
>> >> The difference between x86 and s390 is that on s390, regs->gprs[2] is
>> >> used for both the syscall number and the syscall return value.
>> >> That was a design mistake early in the begin about 25 years ago, but
>> >> it's ABI now, so it cannot be changed.
>> >
>> > Cute.
>> >
>> >> When seccomp decides to skip a syscall, it write a return value into
>> >> regs->gprs[2]. When syscall_enter_from_user_mode_work() returns, it
>> >> returns this number. If it's negative all is good - the 'if (likely(nr <
>> >> NR_syscalls))' conditiion would just catch it and skip the syscall.
>> >>
>> >> But if it's a positive number, the code cannot distinguish whether
>> >> that's a return value or a syscall number.
>> >>
>> >> So I introduced PIF_SYSCALL_RET_SET when converting s390 to generic
>> >> entry. This flag tells the syscall code that a return value was set in
>> >> ptregs and the syscall should be skipped.
>> >
>> > You also could have added a 'syscall_ret' member to pt_regs, operate
>> > on that for the return values (seccomp, syscall...) and swap it into
>> > gprs[2] right before returning to user space.
>>
>> That would likely also work, but I found it easier to read and
>> understand to have an additional flag with a descriptive name than having
>> yet another 'somehow-related-to-gpr2' member in ptregs.
>
> I find this very odd; I would think that having both syscall-nr and
> syscall-ret in separate (virtual) registers for most of the normal cycle
> would be most obvious and less surprising -- given that this is what all
> other architectures do.
>
> Entry either grabs a copy of gpr2 and preserves it in orig_gpr2 as the
> syscall nr, or as Thomas suggests, you keep syscall_ret and copy that
> into gpr2 on return to userspace (and ptrace and signal and whatever
> other surface bits are affected).
>
> Either way around you then have separate values for the entire range of
> at least the C part of the kernel syscall handling -- just like every
> other arch. How is munging things in a single value and a flag easier?

Looks like we have different opinions on that - I find the flag way
easier, and we don't need additional space for a long in ptregs and copy
things around.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
