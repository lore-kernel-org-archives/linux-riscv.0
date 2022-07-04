Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E04C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CV3tOSfpF65DEm3d261D1/ETOPgPUnHd+0v0pS+D8Y=; b=y8R+nF1S6RKI9o
	+DfIqkD8NuJLk+TG4lWkpkD5ifrcyW2C2YlkCXb1GMv2bXXgvY0tJjELgs1lWg4GF2dSpEjMZPSfu
	/UIrSHglizV1uGAALZdZF4r6giqdYPbCYCaVFzrV5XI7wQ9WqnJnhGAYWhUXlgTlAjd7n11wSRBrb
	ChWdfqhjHGvmCoCYnlIygg0jvPLGr49pxM+D1rtp7EFmySf0sFVkbK0BiJmyZz2neiLqlm9THXvgJ
	JOhd6fzMqKfvCXPY5ISMO91izMjO3N7Hs55GyopEVBIIfKCFhM52XED0VUOAllSM5EA8VGrjFdTlY
	nCfzAoa2miqhnAPLDQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hs0-006CMg-Jb; Mon, 04 Jul 2022 08:55:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hro-006CGG-BJ; Mon, 04 Jul 2022 08:55:41 +0000
Received: from pwmachine.localnet (lfbn-lyo-1-1062-211.w86-248.abo.wanadoo.fr [86.248.131.211])
	by linux.microsoft.com (Postfix) with ESMTPSA id E029320DDC86;
	Mon,  4 Jul 2022 01:55:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E029320DDC86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1656924936;
	bh=753qn467Cvr3a726KRzN40H4B1Qt8gfmorjxcMHm01U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QAWKkEo+MgU2vTZ6nDAebIE5KigE7o0wa5xBZNtvBHLwbkMzo70bNZD1jyQ+L6Vx9
	 v0pABJBglhYShgrDn7NRCfSRMrwGj7MBVLW5KxZ9PPYKJIppjohWOq5dQvymuqaMYG
	 vYh7z4MAHuno6Ql6JZ++J51KhWYCHi+R18+PM3q0=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: linux-trace-devel@vger.kernel.org, Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, kernel-team@android.com, Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Peter Collingbourne <pcc@google.com>, Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Daniel Kiss <daniel.kiss@arm.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 0/1] Remove forget_syscall() from start_thread_common()
Date: Mon, 04 Jul 2022 10:55:31 +0200
Message-ID: <2636542.mvXUDI8C0e@pwmachine>
Organization: Microsoft
In-Reply-To: <165667517849.792239.13818767623596011011.b4-ty@kernel.org>
References: <20220608162447.666494-1-flaniel@linux.microsoft.com> <165667517849.792239.13818767623596011011.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_015540_455531_AC55C569 
X-CRM114-Status: GOOD (  10.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi.


Le vendredi 1 juillet 2022, 17:41:28 CEST Will Deacon a =E9crit :
> On Wed, 8 Jun 2022 17:24:45 +0100, Francis Laniel wrote:
> > First, I hope you are fine and the same for your relatives.
> > =

> > With this contribution, I enabled using syscalls:sys_exit_execve and
> > syscalls:sys_exit_execveat as tracepoints on arm64.
> > Indeed, before this contribution, the above tracepoint would not print
> > their information as syscall number was set to -1 by calling
> > forget_syscall().
> > =

> > [...]
> =

> Applied to arm64 (for-next/misc), thanks!

Thank you for the merge!

> [1/1] arm64: Do not forget syscall when starting a new thread.
>       https://git.kernel.org/arm64/c/de6921856f99
> =

> Cheers,


Best regards.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
