Return-Path: <SRS0=lw90=JS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CB7C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 08:29:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6A561421
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 08:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6A561421
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+8v6pclTI0VCa4KViKUpju53wKSTj4lbu0d4k9oL6Y8=; b=CpAHGX3k2Ou67cBriiwYnKOwf
	VUucuJBa7oBJEQlTQup2y/fE7HMzFyAButTv96y6uAMFfaymlQG/h4Ru5u6vrx5Cwbbj1CEqBa8Hb
	bvAZEL/mbOn2TqgXcX1bvSOBsjPECMkEtOIs08ALgL+nqeb1Fa+nMBUZjKh3N6OWhbvzwd23AUu/i
	+TnYbiCpyr7wZWxLQ+W9Oqfpy2X8b+1i5p5ZnsgRsrtyUiPgoqhfZenAUDJpw0D8FR8AouL+BTGoh
	dyYwEqQ1zzyazMLvgl4ZInd8Yi0nTu8yXVcWYU1b9ArIguN8QnL6lmndaKvsZiGwp7sSMJvG8jbRa
	bxxRLsE2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8ER-00DyJB-6y; Wed, 21 Apr 2021 08:29:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8EK-00DyIm-Sh
 for linux-riscv@desiato.infradead.org; Wed, 21 Apr 2021 08:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FsUV5LJ7+pUqOwMDYLlCO4PcECIQ5kcpI16vPnHvNr0=; b=1Ew5HP8930sxz8NM7ZQ8WCiYsH
 TqycoK760WtJvPmH9SmvHQ9c/9wLc1BDAa9OOAwR18JMPDcA/UlIeb0dGYxmd3qAkkGBnPxnxbQ+K
 rmYZVI5wi96yY/AEcSCKNwgjGYeqs7wkPo/zsKrEaRbbDdEkq5pDA4G/1pQMj7KIgjIVOlBiYXQ75
 7698oZoLySPo+5GK2aDZTkSYdIj+MCr55S7MJ2jBlyczgpcjKhPKLyRfOOEPJc8kVJZxH40lZFr9P
 9oVM7TbRDtpAgo5m9y81GkDnO/mPTPfrvVF0Y9Or2Traei3UrDtQgr26P82uhF+uyjT4ao4R/LYq4
 6Cd1wNhA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8EI-00ChzC-4i
 for linux-riscv@lists.infradead.org; Wed, 21 Apr 2021 08:29:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84BEC60E0C
 for <linux-riscv@lists.infradead.org>; Wed, 21 Apr 2021 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618993741;
 bh=PlDQaFaPk/kK/krQ9Bde4x/76KoZ9JGgl7x0Ep6sHVk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pO4njqXE6uBEbx7G0wZlpJqd1p67dfNA7DkA542Htbybn2qZOAeINQEBvtbR0yfD+
 +laEtyvzotfzONDY7GUxCcU+DfEaGDwy3pIK4fuPtZtCKsnYphOKhPjJyNP8zbL8i6
 0oJAxKrvFMkrd8JSevVqFzmQA4JD1q2vehc35jNjw/dXeDuMwHScKLsll2gnDWjQtm
 UtjkQCqY0xXSPnYT5heGL8ZZgifqb5n2DWESfobdYjmTtPJAC+6N5wxQhHL+VTfEQ+
 2uvhALFQZNX+3ztsJ/2yAuILymkQUThB6HBxQQcfuP7I9MmRGCkKT5gFlGZPxqLZxb
 AXABIwbNdIhCQ==
Received: by mail-lf1-f42.google.com with SMTP id j4so26142857lfp.0
 for <linux-riscv@lists.infradead.org>; Wed, 21 Apr 2021 01:29:01 -0700 (PDT)
X-Gm-Message-State: AOAM530piNQPnvsDwVEaJICZVLkJqabLFVpEQnH9wbO308+HXizss5YT
 LmFeQbCTj+qwa71iTUZREYgKNL0fg4WNyq62J3k=
X-Google-Smtp-Source: ABdhPJyLGHbOYUo5kuRuRui9Du9S01mLmss+HOmeO1VcFN20rB5jfa8IKdI3kVIvvkC7cLrIhIA+yBJKbfVJGWJ89/A=
X-Received: by 2002:a19:e34c:: with SMTP id c12mr19212590lfk.555.1618993739734; 
 Wed, 21 Apr 2021 01:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <1618925829-90071-1-git-send-email-guoren@kernel.org>
 <1618925829-90071-2-git-send-email-guoren@kernel.org>
 <CAK8P3a1aNDomNiX7W1USWnmdw1VR21ALX7NvJYGW9LBO+jvA4A@mail.gmail.com>
In-Reply-To: <CAK8P3a1aNDomNiX7W1USWnmdw1VR21ALX7NvJYGW9LBO+jvA4A@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Apr 2021 16:28:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ7LPW7tb-Q+mPVnVbfqUCaBotqOQhwk32N7tr59HZU9A@mail.gmail.com>
Message-ID: <CAJF2gTQ7LPW7tb-Q+mPVnVbfqUCaBotqOQhwk32N7tr59HZU9A@mail.gmail.com>
Subject: Re: [PATCH 2/3] nios2: Cleanup deprecated function strlen_user
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_012902_244228_E85499D4 
X-CRM114-Status: GOOD (  12.58  )
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

Thx Arnd,

On Tue, Apr 20, 2021 at 10:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Apr 20, 2021 at 3:37 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > $ grep strlen_user * -r
> > arch/csky/include/asm/uaccess.h:#define strlen_user(str) strnlen_user(str, 32767)
> > arch/csky/lib/usercopy.c: * strlen_user: - Get the size of a string in user space.
> > arch/ia64/lib/strlen.S: // Please note that in the case of strlen() as opposed to strlen_user()
> > arch/mips/lib/strnlen_user.S: *  make strlen_user and strnlen_user access the first few KSEG0
> > arch/nds32/include/asm/uaccess.h:extern __must_check long strlen_user(const char __user * str);
> > arch/nios2/include/asm/uaccess.h:extern __must_check long strlen_user(const char __user *str);
> > arch/riscv/include/asm/uaccess.h:extern long __must_check strlen_user(const char __user *str);
> > kernel/trace/trace_probe_tmpl.h:static nokprobe_inline int fetch_store_strlen_user(unsigned long addr);
> > kernel/trace/trace_probe_tmpl.h:                        ret += fetch_store_strlen_user(val + code->offset);
> > kernel/trace/trace_uprobe.c:fetch_store_strlen_user(unsigned long addr)
> > kernel/trace/trace_kprobe.c:fetch_store_strlen_user(unsigned long addr)
> > kernel/trace/trace_kprobe.c:            return fetch_store_strlen_user(addr);
>
> I would suggest using "grep strlen_user * -rw", to let the whole-word match
> filter out the irrelevant ones for the changelog.
>
> > See grep result, nobody uses it.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> All three patches
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> Do you want me to pick them up in the asm-generic tree?
Yes, please take them.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
