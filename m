Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3031C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Mar 2022 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1CFwo8HZXKFF7Qxl8DpcL9jysuvJBrGA+iLDaFl7eU=; b=N50IiqEOdqe4Wp
	7jU/mtgeF0c4mnrGOQbf4O6JYm2czc3qJai107+gtfRF7wRCsGVZD/BJL3JhTU0JnC7SesNnqafXm
	c46S3+Gbl9Dt0Aig+Bd69Jb/vqSyznKD6NfarEAhEZToa0zScxIxvHxIGajVhRiWIqzja9wK7t/xf
	n1FTPuZM26xZeBxGI7MHghF1fLyf/Zk/zr/y6bIn2QKi4ZrAy0VSyWnZfp6ohKC69Ko5efK8rWVAF
	QqxIp5Tu2Zc8xXezyLABriF1MA3jcZ+eneaIkSuzHFWjg7hhEQ0UhzXse7WM5NtWuI0ADxw2Lvyba
	f+FDNSbA3T9+FZ9zKgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTJGA-002OiB-D1; Sun, 13 Mar 2022 08:07:26 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTJG7-002OhY-SK
 for linux-riscv@lists.infradead.org; Sun, 13 Mar 2022 08:07:25 +0000
Received: by mail-qk1-x733.google.com with SMTP id q4so10418365qki.11
 for <linux-riscv@lists.infradead.org>; Sun, 13 Mar 2022 00:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6ajKY1YqMlkGanqNAhqSycoWS8C+k2srcf3gUvvcgkY=;
 b=fu9fFdZlg3Qi/N2ooY6PidW6HwYNMT3dVV27fOq6ZaYQlSzPbPYsU/d0vg2xbqRcKI
 Nyzs75aDHGxURPRM56U5RDmDtFgKiMeAnZ7xxMsJm+paYNm4kyNFuaUmmIM0JTl+5PQL
 sm+24tmMqhhkAV5EUc87s5yoKCiSWEQvuelWraafWUpQUQDFgZPy/hifponydXDzRwSH
 2RAwkBwOqO4kK597qElU6TObE5/CTKQS3zex/vw2bQHp+rR2YxMMCEKRZJ3ICD9ifPSC
 lEleLRw0duOrmCaCC9TYFfJhZ1EVy0iNmFfgTU9zCbGQ8CKfPOruZDyqLt+rSaVcBbgL
 zcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ajKY1YqMlkGanqNAhqSycoWS8C+k2srcf3gUvvcgkY=;
 b=kMQTRin8DLE7EFgAoyWltnUmrc7O6MrzQDtzrlVQ8hcLgpSP9idtlyMOj5eRnhOPoN
 zW/OnWtvS1+86bZYFSCEBR3zuVAob7pkz+WtT5Q3n4xZ1MygnpgYOF58cUhuXlZiS38R
 hb1DMWB+QI/8YhIbPE+ICGovlVpEvOZTCk6Cjy5bB9pMwftRXLf/PIY/X0xMjnd+Ca2H
 5rb2kE7YadI4mIHQVlNdaheacDdSoiLJEDOhOi2SYXX8KbZBZ21QjOxC+aeGh1w33mlb
 3iQUVW4//lGSrPtRYmA5fDMDDtTM9hkYVH8v1whsXqa0kV1QCBbYGAEoj+4twW4N9m4q
 3zKw==
X-Gm-Message-State: AOAM532rZ7jeOJgxh1WzuxKpLQtWTb0qJmZspIwD5Lk+kPWxzZIt7M6w
 lUJ7WzBMjwuTG7ZHMHxMUy0=
X-Google-Smtp-Source: ABdhPJxlAdB8WxySBLebs3HdxsKJVyls2z3NviBOw5EWywuPO15ZdLmQc/AxmNG026Nx2XL0Y6z7bw==
X-Received: by 2002:a05:620a:24c8:b0:67d:c9f4:8271 with SMTP id
 m8-20020a05620a24c800b0067dc9f48271mr243927qkn.96.1647158839584; 
 Sun, 13 Mar 2022 00:07:19 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id
 x6-20020ac86b46000000b002e02be9c0easm8879802qts.69.2022.03.13.00.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 00:07:19 -0800 (PST)
Date: Sun, 13 Mar 2022 16:07:11 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ftrace: no need to acquire text_mutex when
 executed in stop_machine
Message-ID: <20220313080711.mrzsgtxpbycug2vm@mail.google.com>
References: <20220310045454.672097-1-changbin.du@gmail.com>
 <20220310092742.4fcc7131@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220310092742.4fcc7131@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_000723_972675_C917A4EE 
X-CRM114-Status: GOOD (  13.94  )
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

On Thu, Mar 10, 2022 at 09:27:42AM -0500, Steven Rostedt wrote:
> On Thu, 10 Mar 2022 12:54:54 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> > It's safe to patch text segment in stop_machine. No race is possible here.
> > Besides, there is a false positive for the lock assertion in
> > patch_insn_write() since the lock is not held by cpu migration thread.
> > 
> > So we actually don't need our ftrace_arch_code_modify_prepare/post(). And
> > the lock assertion in patch_insn_write() should be removed to avoid
> > producing lots of false positive warnings.
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> 
> Ideally, RISC-V should try to get off of the stop_machine approach, and
> move to the breakpoint modification.
>
yes, that's a further step. I can feel a obvious stall to enable ftrace running
in QEMU. (maybe qemu-riscv tcg is too slow...)

> -- Steve

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
