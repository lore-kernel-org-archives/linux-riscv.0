Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DD8C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 23:50:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14C961153
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 23:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F14C961153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P1pWYKosdZoC/Xl+UbYlPyDtAkhOOIu6nninCA1aAG4=; b=FLuP9tufl6ypHEYRN5ONSxq3B
	H0HUGcCsf8SVb+tj7N17g6x7ucENQju69+vYinuZl6VVsNCW5MH9Pxc9o5xg9oDRLvfVWjxpzW13W
	MXc5BJ2n72ImgtI6l7LTYEESuvodEuH1FFN07QxrrOYrR12bYNfmuvjyvhOMO6MUErSELpyA82ZUl
	plnoCIt7QKTSaj5iEqdVmkk/9kfzDSUkqJGrxLYQRRW3kUDnMHJvRMloWfTVLYhnsuNsCVbb7P+I7
	74MSBlZ4dju/5Y2aAENj8dM3U6g/5OnBgNPxAL656W8n3h9PAojZMQ/U9V8Fvi0LzdPkDb5Zx1yMA
	E3QqkQoPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXBkD-0009FQ-8B; Thu, 15 Apr 2021 23:49:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXBkA-0009Es-EU; Thu, 15 Apr 2021 23:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=93RaKIcPxj4ed/vj3/T6taZCo8gljqrXH2nCGhdkM1Q=; b=LORXtoRr7to8Q7OuCsXu04Piuh
 VdKCNjZu3Wu0ZdmG3C2tYdF2sgZuoyZYRG7h6NfzVgs0sKsbuuxVaOiZysWytrpSF3ETB1SAZjtAy
 8PbWUYJdjKS8nCoVQ/EisGc6nhaMfqMIsCY8iRBYJJ/s5HxtBObGo7+h1r7xk5WwzTcpn+o1bQNEL
 88HABcEIpiuhxDeniIZtvqg0NqJZgbR6EX7zs0bnU1bjlKUAbSnGw6ZSmFX5DfjTsr8fM0DvbK2c8
 74OB6OQLOTr3P84nmSecW7OEpJeB21nzXAbQTzeDTBr75Frc/AeWdSXmF+Pexan1FNmAcd/8evomH
 wic8Q3bw==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXBk6-008z8F-Dv; Thu, 15 Apr 2021 23:49:52 +0000
Received: by mail-lf1-x136.google.com with SMTP id x19so11490491lfa.2;
 Thu, 15 Apr 2021 16:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=93RaKIcPxj4ed/vj3/T6taZCo8gljqrXH2nCGhdkM1Q=;
 b=aBCM67HeOS1RQpmZ9d1xkBbfZ9OjHVKizD6JMJntC1jztjXCaMAD4PxLVP6PE65ty3
 cKPeKzgiEbgw3SQZ8eR83qtBjTP2OYUdbnqkzhUAbE0u+1hOdGsAn8xKem5MzABFlQgD
 mRXyEbRdJWemOBA5ZL1H2F5rm/kMfg/eeqCccq1PGYnduzRrD+ZOmE6Jc8ZifznL8idv
 FrDgLXsLKsMduLqpBFFg7xH0u5XmXHclHLbXV0TX9HDDr95c+SXlKyzlZoT5Ez5tEE8O
 yL7SLoB/UGXylkkP0jVvQUti3azG7QIpldbt+d5lTdgqR0VqbJM4y+Fb3QAjnu0TlNPa
 AWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=93RaKIcPxj4ed/vj3/T6taZCo8gljqrXH2nCGhdkM1Q=;
 b=LzSAxv2dVfkSM0iMmBG7y1FffHVfXGGKAUFGLMNqAmhze+BCpGhLZwZVs5xQjUr9T7
 lEjkmD+p0ZTmgl2R1ksc/28xjuG6xlHVwxpvMbMhlvhawobpwptrslXw1hXCAEZaGgDT
 9UKmV/6E+Ts6A/+5/aGzPOQ4VPP8BbfQL4lv8OX0txCvvaA+IvGWw4CdRVgyCer5zm8c
 4/xQaE4NGZv6j7ePuKq2l8g7svcZDudPnINSgO5nIRF1ljT/Suqp8wiwHzGqo/3v3I8m
 p4ig0kBjU0MH6qbpfKHH7wSbGQoxeeWe3UevmkQwRftceDFdELrZ2z9WqCtlvIdNaPzn
 64AA==
X-Gm-Message-State: AOAM531aMKPUBnyMMq71orzmDc6Vn4NhxzWG/e9sEtuwMN7LhhBi0g0X
 wnMrPRLAMoQ0avenyM82jfLQ0VWtMyXnOXRaQqw=
X-Google-Smtp-Source: ABdhPJyNhOogFP8g+e8x1hnSTCcEzJfdpg/9ifXfqOKSgpR6Q7EyYPjeRQKWzaeLUb3+uY3vv8XYIkkzgMMMfdz4tQA=
X-Received: by 2002:ac2:4d4d:: with SMTP id 13mr1106974lfp.540.1618530588068; 
 Thu, 15 Apr 2021 16:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
In-Reply-To: <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 15 Apr 2021 16:49:36 -0700
Message-ID: <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Quentin Monnet <quentin@isovalent.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Jianlin Lv <Jianlin.Lv@arm.com>,
 bpf <bpf@vger.kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Shubham Bansal <illusionist.neo@gmail.com>,
 Russell King <linux@armlinux.org.uk>, 
 Zi Shen Lim <zlim.lnx@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, paulburton@kernel.org, tsbogend@alpha.franken.de,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wang YanQing <udknight@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Dmitry Vyukov <dvyukov@google.com>, Mahesh Bandewar <maheshb@google.com>, 
 Simon Horman <horms@verge.net.au>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Kees Cook <keescook@chromium.org>, Tobias Klauser <tklauser@distanz.ch>,
 grantseltzer@gmail.com, Ian Rogers <irogers@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mips@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 sparclinux@vger.kernel.org, iecedge@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_164950_495870_67FEC662 
X-CRM114-Status: GOOD (  18.60  )
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

On Thu, Apr 15, 2021 at 8:41 AM Quentin Monnet <quentin@isovalent.com> wrote:
>
> 2021-04-15 16:37 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> > On 4/15/21 11:32 AM, Jianlin Lv wrote:
> >> For debugging JITs, dumping the JITed image to kernel log is discouraged,
> >> "bpftool prog dump jited" is much better way to examine JITed dumps.
> >> This patch get rid of the code related to bpf_jit_enable=2 mode and
> >> update the proc handler of bpf_jit_enable, also added auxiliary
> >> information to explain how to use bpf_jit_disasm tool after this change.
> >>
> >> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
>
> Hello,
>
> For what it's worth, I have already seen people dump the JIT image in
> kernel logs in Qemu VMs running with just a busybox, not for kernel
> development, but in a context where buiding/using bpftool was not
> possible.

If building/using bpftool is not possible then majority of selftests won't
be exercised. I don't think such environment is suitable for any kind
of bpf development. Much so for JIT debugging.
While bpf_jit_enable=2 is nothing but the debugging tool for JIT developers.
I'd rather nuke that code instead of carrying it from kernel to kernel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
