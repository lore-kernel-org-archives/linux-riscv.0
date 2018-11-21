Return-Path: <SRS0=BHV5=OA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0E2C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 15:15:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BD820878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 15:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOi1pvIS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="khcwjnN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2BD820878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCbCcKzuamBNHQ7qnlh/cQDE+dCDqzkxUu6ueu8P4aY=; b=NOi1pvISMz4dIT
	bjYwcl4e1sJ80+S/nQgD4Vn2FNceNyTgVIBTBIN7c6prAm6bD4Qarq9eQs7cfUPc38QnJJBGOHK2j
	aJYrDpgJSgYFlXpQ/ln3lUjDI4BuqAAndBiFj8f5aKJXU1uUkcJZcZ5nD9G1SPOGONiZKhLAThybE
	fs9lD6ubzj9qJ/yWsWgkW5sp1fJyIkLbWqoAvYM/hmCc2Y5hQZWLrSh5xVIVvf8nLZUaLbwBtl6VL
	NYRNi0URlC1I5n+wTHSU1zhwB5PBVXrVIaaSyovrbW0C1/1pOpo/fpoFLtdE2JofkjIHO42dy1A9f
	0BWLXxbRXzBzipJv7p+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPUEJ-0005SO-1g; Wed, 21 Nov 2018 15:15:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPUE9-0005Hw-F5
 for linux-riscv@lists.infradead.org; Wed, 21 Nov 2018 15:15:43 +0000
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7DD022419
 for <linux-riscv@lists.infradead.org>; Wed, 21 Nov 2018 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1542813329;
 bh=kpH9lcQ8P8XV+NLvUJEbt/IT04dFbPXjvuI1ObcBYAw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=khcwjnN3W8oiolVzWdkYwOXyQRAs6P6ySgIXzjCPjOfIH1gHQVWNjJgtidXHIgPRn
 CwCuMol6mW0iA++aIbUocbisf9NKWSLOFkbGX1rEZ7ryIkIhgsKBtW6vWIB93TttT3
 WJlKpw3MsAUNHkwWqZMq8hXPUuneSjETHOFSDLJU=
Received: by mail-wm1-f42.google.com with SMTP id q26so6095148wmf.5
 for <linux-riscv@lists.infradead.org>; Wed, 21 Nov 2018 07:15:29 -0800 (PST)
X-Gm-Message-State: AGRZ1gJbsV/FAnB9ynoDIKEmuNloxlQ+WbB/JBr4B+0eAjOMT/yydE20
 OUYWwg9cS4lPTk3XPwwxOWkSg9k9RbWHRzuF2pxK7Q==
X-Google-Smtp-Source: AJdET5fCl28jWGxXnQdRFKVSpliKHyZtnaunTTizhHy0FVmzumF0Lqgw2R8mpyFkm2xs/3yb8DPm2VruOfQ2rmi5vtI=
X-Received: by 2002:a1c:f112:: with SMTP id p18mr5957608wmh.83.1542813327926; 
 Wed, 21 Nov 2018 07:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20181107042751.3b519062@akathisia>
 <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
 <20181120001128.GA11300@altlinux.org> <20181121004422.GA29053@altlinux.org>
In-Reply-To: <20181121004422.GA29053@altlinux.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Wed, 21 Nov 2018 07:15:15 -0800
X-Gmail-Original-Message-ID: <CALCETrV8AJPkZF7TzhXSte_wJgNXH+-s7-tPM-8xjcAfYgzdhg@mail.gmail.com>
Message-ID:
 <CALCETrV8AJPkZF7TzhXSte_wJgNXH+-s7-tPM-8xjcAfYgzdhg@mail.gmail.com>
Subject: Re: [PATCH v2 16/15] syscall_get_arch: add "struct task_struct *"
 argument
To: "Dmitry V. Levin" <ldv@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_071541_527161_5DB15E3A 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Paul Moore <paul@paul-moore.com>,
 linux-hexagon@vger.kernel.org, X86 ML <x86@kernel.org>,
 Eugene Syromiatnikov <esyr@redhat.com>,
 Elvira Khabirova <lineprinter@altlinux.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Andrew Lutomirski <luto@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-c6x-dev@linux-c6x.org, linux-parisc@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, Eric Paris <eparis@redhat.com>,
 linux-audit@redhat.com, linux-alpha@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181121151515.Qno7FvmXuJSJIEjO7QCGdLKDLf3xlf8bXJa6655Y64U@z>

On Tue, Nov 20, 2018 at 4:44 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> This argument is required to extend the generic ptrace API
> with PTRACE_GET_SYSCALL_INFO request: syscall_get_arch() is going to be
> called from ptrace_request() along with other syscall_get_* functions
> with a tracee as their argument.
>
> This change partially reverts commit 5e937a9ae913 ("syscall_get_arch:
> remove useless function arguments").
>

Reviewed-by: Andy Lutomirski <luto@kernel.org> # for x86

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
