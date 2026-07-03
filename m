Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E0EC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JC3xego4uvi/erT3zxoLbz0LU+Y9H7MNd7VrwlV75A=; b=tBRHdyXNlSc2wK
	MF5YVprajjB6Y2v6VT8/FCXT2TfadNoUc6zm3rUrYWEPGa41J1a4lwkHYeuzUurHZq36LFis4hHJn
	rFCUigfwKbFUVPHMW6f8psXpdLtW6BrdpB0chOwKFqYH8Tp+QIkc7hX7RJuTHEQoc6LBnqhHgilKt
	NxqCSVR5BK0iHAmMfu262DP3aWLNX4IF1JtMk0XfphsgX+dgcu8ZEqC6KBmOq/xCULlwcydJtapn9
	6J42XZMPv/Js0iZFkQji1FhSsnjkuNlGLVl3bcLE9BbXlIDRKNnB8vzYUPF9P3MsX5BX+aeDpy5cf
	W2mHImlTJhTj4nhyCTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaBD-00000006Tvw-0imY;
	Fri, 03 Jul 2026 09:27:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaBB-00000006Tvk-2mPe
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 09:27:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8017140465;
	Fri,  3 Jul 2026 09:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9809D1F000E9;
	Fri,  3 Jul 2026 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783070844;
	bh=QuasMf+Z9Xub/CzQGz8vCZq23/KL14xhcuPnFpaaICs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OczjT20v15qvKEkXq5ZHLpZYNZQbovIf6GEuPtND2QuFezSfQYQeZgytKgqGJBzBr
	 B/jp4SWOj8u567yywz+pCgFHT+1jxob9zbEppMKh6/CEdrWFR/R55FZPUnta67mUb+
	 m3TbZnSVzp0CFisk1WJPySMlAQjUMxUqwWaMnBMsgJO+20nwPVsHNeNOf4yF2r2KpS
	 j3CHRJ6QYQa0gaj/f3FSiryAtMLoKRmQ4vEf+vp5e8tYaIU+a3OkLLl9qtKy9X+TNj
	 EsAtb4Bwg5hiVNKlW+NG6+ZS5AuqKREn5z6ilhF+RiuFF2ddQJWJzDmlhoNddH2HvW
	 KKjExXgWni8bA==
From: Thomas Gleixner <tglx@kernel.org>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Andy Lutomirski
 <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>, Mark
 Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Ryan Roberts <ryan.roberts@arm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mukesh Kumar Chaurasiya
 <mkchauras@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Zong
 Li <zong.li@sifive.com>, Nam Cao <namcao@linutronix.de>, Deepak Gupta
 <debug@rivosinc.com>, Lukas Gerlach <lukas.gerlach@cispa.de>, Rui Qi
 <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
In-Reply-To: <yt9dwlvca8rn.fsf@linux.ibm.com>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
 <BA7CD91D-C0E5-47A1-B49C-BC6AF6604182@zytor.com> <87h5mhnjsr.ffs@fw13>
 <yt9dwlvca8rn.fsf@linux.ibm.com>
Date: Fri, 03 Jul 2026 11:27:21 +0200
Message-ID: <87ldbsmnie.ffs@fw13>
MIME-Version: 1.0
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

On Fri, Jul 03 2026 at 08:26, Sven Schnelle wrote:
> Thomas Gleixner <tglx@kernel.org> writes:
>> It's less than obvious and I have no objections to clean that up and
>> make it more intuitive, but I still fail to see what Michal is actually
>> trying to solve and what the magic flag is for. If s390 requires it,
>> then that's an s390 problem, but definitely x86 does not.
>
> The difference between x86 and s390 is that on s390, regs->gprs[2] is
> used for both the syscall number and the syscall return value.
> That was a design mistake early in the begin about 25 years ago, but
> it's ABI now, so it cannot be changed.

Cute.

> When seccomp decides to skip a syscall, it write a return value into
> regs->gprs[2]. When syscall_enter_from_user_mode_work() returns, it
> returns this number. If it's negative all is good - the 'if (likely(nr <
> NR_syscalls))' conditiion would just catch it and skip the syscall.
>
> But if it's a positive number, the code cannot distinguish whether
> that's a return value or a syscall number.
>
> So I introduced PIF_SYSCALL_RET_SET when converting s390 to generic
> entry. This flag tells the syscall code that a return value was set in
> ptregs and the syscall should be skipped.

You also could have added a 'syscall_ret' member to pt_regs, operate
on that for the return values (seccomp, syscall...) and swap it into
gprs[2] right before returning to user space.

> I'd like to see something like the change from Michal going in - cleaned
> up of course. It would allow us to get rid of PIF_SYSCALL_RET_SET.

I have no objections against cleaning it up and making it less
convoluted.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
