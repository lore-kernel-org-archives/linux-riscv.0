Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0390AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1Ro6X0q4cHMkGgAohbMnzcBU/C5JP6SoF++EtBHi3c=; b=MX5CypyOB5R3g/
	a/j71z94+x3Hlbw5EmT9h41lroruGyq0rCadDNZwxEw3zSyA4pwPIYEkOXAGzFPTzXI3VCUXeWp+L
	u4CeR6YSQSvZ2mkkWTcXOXLWrgY0PCehYtFMWMTmEPy21fhXSO2YhtAmRU3x2uzCvNFgFY2w8y3tq
	0VDMXOe1XwMxGkbmqWPUTTa8tePpxePEbBrdw7BeOl2T++idMrVlk8yTAMbUm15b7vqfj/a/kPrQ6
	O6ZX0Zg2ByXiPaW+XHVreEql7xHQMpaw4NhdslfDVnKdGKuGHAW7b/ybvlz8DB/Upt5XahLzUSMEO
	HXh4vk9C0mZIHiQVOB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lP3-001Xk6-HN; Thu, 16 Jun 2022 09:03:01 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lOh-001XRr-HV
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 09:02:41 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 111-20020a9d0378000000b0060c2db66d44so601122otv.6
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hLpIJMUp2EgCicymUGZqnu81fHsqYbfpy5eQDxg1Sq0=;
        b=itFDuu5ajS1fTe2Zx/Li0ern9pX26yOwm7aw/E4vS0VvjmDaSqZRxfAS3YLIPnqZXN
         N81bqrHRFfKgTRN22nSmEmpVhg/Quc7YnzwAmAiB4EtPOiopjnVVgmQZXK/35Bdra0Rj
         RjViKziv9eOrwVaKQ71u26Pf6jp+a902Ho3NZPwZTGrnidPDDUwUf2vSWAXSq97CqL8v
         HUiCskQw+d3jRY01YTW7Ugnjs18lzWP/c0zTV+FE4rJ4a0ABqzfUVHB4scvA9Ryq+qun
         xoQ4/7VzPuaSCdNiQ7DfdqHPJU3jz6xofOFgKRSoeS6dVw4vcVr3ywuZ64FdeIbdwXgO
         hFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hLpIJMUp2EgCicymUGZqnu81fHsqYbfpy5eQDxg1Sq0=;
        b=SmHL8jtAxDBL5wDIQF179u0Cus9d0p96WvlKcN6HcNbOx772Es7guY2tWpegm/4aHo
         Bdtn67j5D5tx3VmGA0scP18qDcQ8ffE9ucgZFsSfV19q8IH+ATr01j3ihOJIjnjGd4sG
         Xy/0jlRvVptO0/3lZqH/UC/nPzHAlAwqs0+f7Et8mUz0rr9ZkZt68nUD56qYekkX2MKH
         Qs7wfRNdLns0W05zvqXLkL3YeONHlBOmKuiwYv3eLc4mn2dR/bjRPKuJCF2CxdfLsoeN
         WYRsKBONnk+E8aZ1MObcyVCWaUZumB1Pw9qxJfyK4c9P15o0yNSgQhV5Z7gRUNyxh3Ku
         E5LQ==
X-Gm-Message-State: AJIora91utSpboEjXmM7M1XPZCq273NGk8LfcAWkYDVbHHHMFo0w5Nwa
	8n0o/6kwK+0yNp4RjWzV5MhLJ1jwdY3TpNsUgmjFbw==
X-Google-Smtp-Source: AGRyM1uIk/++onhgtbD0CMn+4y3KPKdz1Du6NXE8IJbbjEB/UXs3R22yiCGxo4rcMQoRvUTlMoCNomK983Vd46/8loo=
X-Received: by 2002:a05:6830:1bdc:b0:60c:4044:1741 with SMTP id
 v28-20020a0568301bdc00b0060c40441741mr1532719ota.297.1655370155656; Thu, 16
 Jun 2022 02:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220609071833.1051941-1-andy.chiu@sifive.com> <20220609071833.1051941-5-andy.chiu@sifive.com>
In-Reply-To: <20220609071833.1051941-5-andy.chiu@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 Jun 2022 16:59:11 +0800
Message-ID: <CABgGipXim3KvTxrjnga8vgn45-92z+X-8e+a8SP9SWX_63RsjQ@mail.gmail.com>
Subject: Re: [PATCH riscv/for-next 4/4] riscv: ftrace: do not use stop_machine
 to update code
To: aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, rostedt@goodmis.org, mingo@redhat.com, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com
Cc: Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_020239_613618_5A14A8B1 
X-CRM114-Status: GOOD (  12.98  )
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

On Thu, Jun 9, 2022 at 3:21 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> Now it is safe to remove dependency from stop_machine() to patch code in
> ftrace.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/riscv/kernel/ftrace.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index a6eb1b1ac093..a00326b41795 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -12,6 +12,11 @@
>  #include <asm/patch.h>
>
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +void arch_ftrace_update_code(int command)
> +{
> +       ftrace_modify_all_code(command);
> +}
> +
>  void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
>  {
>         mutex_lock(&text_mutex);
> --
> 2.36.0
>

Loop in: Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
