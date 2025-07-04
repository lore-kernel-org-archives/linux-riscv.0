Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B779C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHzWrT0uwl7WctEH6kyT14JSlZzVi9g+Ojtx6hbLFjk=; b=PjT1nUNMdcC8Hr
	vuEMbevouA5F/qXRoMAm/UXGCDS7yaV8ENbXYBXyKzl2tweUnBIwZauroc5MXXaomfjiEOVhZcb/I
	GPwm1BbdiJVM8ETEi0j7G8mmbrhO/45v/T7DKShH6KFLlOgLt9RDxejz5PfvfL2U2VLlcaXK85+rM
	U71m1UXw1xMt/0sleA5euppKyd6kRjc6oYTVAONNxFcK6pf33krRP4W5uIYsz88XYdKZbmG/e6n0L
	G+ZYtGp6b7xypa9l8SACSsQ5+eGkkN6H/IzWAmgyBuDbSVd/yxxGLl37xXsOO94MM61C1PEbmjMxI
	2Kxbh+dtqEvJICK3eS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfkD-0000000EPqs-3wGx;
	Fri, 04 Jul 2025 12:42:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfkC-0000000EPqJ-37Xy
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Jul 2025 12:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=umaIK1M8/yYpjA+tQ4iI4mIN5efEWzCk7U4+ydrdDCM=; b=TcFhX1RzZVaIajTGFjtkwsjoM/
	em5Nn6RbBC9mYsPU3tM+sYucQ8BQg/yKF8y0CeP1AGMPLxnyqtw2ElMA2zR9iTR6ftvdRCW9LIKLX
	qDNaRvuw6mRw5TH3AP6ceQ+tNm60wMM+l8dIpXqlSaaqG8cqANuP6LZTSphGOB5Wkyjo9v5Foo5Dr
	pE1TAgSJtXzMjwYRDsG7utZ+/bZTRLfT3phPnjRBNHiHuIEEgnrK35omwVChV+9pvnUUC/f8zKDkx
	16RAHjmCA2TxquRvD2nRPAgZdrU0PN3HCeThyAznhazy2qvaEpWjp3tHWcJXsgrGk9td7gBpUl6ju
	kSQJn7gA==;
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfk7-00000007yl1-1bh0
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 12:42:19 +0000
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 5B07D140BFE;
	Fri,  4 Jul 2025 12:41:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 8031960016;
	Fri,  4 Jul 2025 12:41:46 +0000 (UTC)
Date: Fri, 04 Jul 2025 08:41:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Miao Chen <chenmiao.ku@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_riscv=3A_ftrace=3A_Fix_the_lo?=
 =?US-ASCII?Q?gic_issue_in_DYNAMIC=5FFTRACE_selection?=
User-Agent: K-9 Mail for Android
In-Reply-To: <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
References: <20250703084502.394406-1-chenmiao.ku@gmail.com> <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr> <20250703114018.6fab0b8a@batman.local.home> <5ac2c90c-5907-40ce-a31e-05cb6d88fa52@ghiti.fr> <CAKxVwgeDcqo83ZV+xBcHwNuMk6yeU+yp7RYo22OARAVOBgrsJQ@mail.gmail.com> <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
Message-ID: <8800ABB4-8A14-46E4-90D1-7F121205AF78@goodmis.org>
MIME-Version: 1.0
X-Stat-Signature: ixmdqxxrgnhoouzhxnkw99mtnxooxira
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 8031960016
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/MhaBri32Bw54W6u2p0Zn8VPzRsDfcHLs=
X-HE-Tag: 1751632906-632877
X-HE-Meta: U2FsdGVkX1/TAFbx0NIrciBh27+SNmLwVSW2k0Rv0aRarae54Ng83H3ZBUcRpjEoZ7OFy1qgKOt2bQmjv1xjwu6TlD8CQa3uCMFD/S01geJ44lasN5R1ycfd+THZNSdzUkZ923ZSvfautxhVvCn6Ihy2TAtlsZHeKWoTcwwZEfbueKSSQsVVaLuFmFvL1JiSPgLINaxZco5JMtqmmbJYqF/i0ms/FZkfSysl6WKYH+HKktV/LHSSWwD9meM2oSMiC68qBDYNLxGJLebUC6QRXFtd87mSM5SGqIk4gKPqPOJ8Y+vPxAXkSGt6opfxgR2iOfg5IUWPvqX0NEyPFHEfFgruOYegBuZ0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_134215_775339_1DE6A5C5 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
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



On July 4, 2025 8:28:31 AM EDT, Alexandre Ghiti <alex@ghiti.fr> wrote:
>Hi Chen Miao,
>
>On 7/4/25 04:06, Miao Chen wrote:
>> Hello Alex,
>> 
>> Should I wait for Steven to finish his work before starting mine? He seems to be refactoring a lot of CONFIG logic, which might cause conflicts.
>
>
>I would say no, don't wait for Steven since his work won't land in 6.16, we need a fix to prevent build failures for this release.
>

Agreed,

-- Steve

>
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
