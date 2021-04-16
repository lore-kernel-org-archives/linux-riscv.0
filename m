Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB490C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 13:40:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58F8B610FA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 13:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58F8B610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dg8fhdWbXFmJae8qGHmXVkbqzbGQ7eVdgRC6cDMOdw8=; b=o2jEsSnqyGM9FVBM+NzklOrou
	xFJBQOlgj/sDBYLVP+4qLMYMJoRjHxFlm+9xo/NLAO/pJClUmJ0/ES7wr1Mf7VYqQIrmCjy6S4Spx
	IPXFY8VxHQusewJ2b9VK7fwK9ufnfy5p9f4T6XtPd99XtYbJxDAVrpI99XMq10X3DnCxou5g4jGoD
	i71/MQbIUsj4HeaASPjek38f0GQkuQ+8Kxfz2zt9uaYpBepMdrZvEr0Lck8Tenqw8OikG0Cz18yfy
	fobj4FzS54o/KRl15oalzoFh8m9zCOy2nljkI/3mzqum8oqkXYbicfpVBheby7Svqi+4hEjAhx6SF
	xghqPgacQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXOhJ-002GnS-Dv; Fri, 16 Apr 2021 13:39:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXOgP-002GRC-Gb; Fri, 16 Apr 2021 13:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0mHucleBm3GX7Z1SOPiFjIocZZ3cy927o5LfpjbehY0=; b=xHzAUwJ47Pk2lsiHIAYDMd4o1H
 +dwQz00CeBsMjqQqBud97aSod00HxSyRCEMPG5TtwTEwP2igWfyLMVNrHo5jKq8xvfNv7sc3GVZBc
 sCTB+j2IMCkq17Vc/oV25Q0YSANh5bBV5YNZslzIkgLtDcT5yKz4yPV/XmCmpYNPJj2KacS3o/kSv
 Wof4GvmAGsGnnZOLqY4veJwP1wOB1SxqtqEsKPf1URbmNbzMx5DDadFPCL9qaQouLTYceVEG+PD1j
 uOtPowwubbtbnZbVu0QKF/okxFDShfDHOyxUIq07dgIgwoPjK++qpsRHtpcFAuHkYbhW4vP9MQiDK
 2DrjKBXQ==;
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXOgK-009PGE-4F; Fri, 16 Apr 2021 13:38:52 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id x8so24995611ybx.2;
 Fri, 16 Apr 2021 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0mHucleBm3GX7Z1SOPiFjIocZZ3cy927o5LfpjbehY0=;
 b=LHOOZCdmhtYRgZeIr5lEhO6KXFFYOEi/8AF39AtF41E0Kj5ox6YUrLbD1vh18P9Lgw
 sAVjw8PPsAkREA+eH+IscJhlq1h6M6yaFa7D2Ul9LpLgbbeOdwpmPXCeDFpcWsTP6nHq
 SCI7Oj+YXaVgCPpr7CLkYRTDlBDXPOunOileWzKluP9csVXr0LkmjxeyoNNj/y0KHa8o
 m1iDnTxmuwSUOqb9QqmuJjAcD1igAGYaIOj4rbRGNsMZcZ9Vp6C8Phtn32KKQWyVGS+x
 HZbKvd+3/cmY7P4s96LQpYPFB1lT9xTMKroDuLgw++dQkCoTbyaprK8bjyaAEOyDTD6R
 ve0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0mHucleBm3GX7Z1SOPiFjIocZZ3cy927o5LfpjbehY0=;
 b=Bm+hyWnMKnUNmFudnc0OpFw1LjQ5+9Rd9kavADTnPqEdH7ijnAaZqnww/hnHyp5yIb
 UmKNUTDac5BG92+mL5Z4CKuhjEawR/EC55DOnjRxJ5HNCFehnADSrlr/VXHMA3KXsheF
 gCxih4ymvuE9A7ua7QZCtKP40fyzsyhzFPCPu4a1CBQ/pN8bZv5UMk8BvnFb3LOcH9fl
 yiuTtfhb3VnNg18mZTXb+1apvK0/OBbRv7GzMV/+eXCUyV1OQPeoNyldOYKoZK/tIrap
 Mq4qb6+Z/qJpbjhMG74B1vy4D69NYfRZLqeMfSNcfuLE+Nc+v3+/iPiww9uGWgk50tKd
 RoVA==
X-Gm-Message-State: AOAM533OcPvMuIPuAG689UtOEQJlmJHo3DEXN2y66cE72+pEhUTl/x7g
 0RFVFAgKPnhAaUxHUpZfGPEMPHN/9wopWu4ODQI=
X-Google-Smtp-Source: ABdhPJw5sY0mgMHNVNaARBdH4/XL7aCQwPNekTw5pB2njQeJlgreCNQsgFDRpI0R7ZiYJLGMXF7BF2idqTBCgkAwAiE=
X-Received: by 2002:a25:7004:: with SMTP id l4mr12503620ybc.304.1618580325409; 
 Fri, 16 Apr 2021 06:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
In-Reply-To: <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
From: Jianlin Lv <iecedge@gmail.com>
Date: Fri, 16 Apr 2021 21:38:33 +0800
Message-ID: <CAFA-uR8H2MMy_vjQ_ZL96ifKcVg2goK3nozOFavN+gnJ+=V6Rw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Jianlin Lv <Jianlin.Lv@arm.com>, bpf <bpf@vger.kernel.org>, corbet@lwn.net,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, 
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 illusionist.neo@gmail.com, 
 linux@armlinux.org.uk, zlim.lnx@gmail.com, catalin.marinas@arm.com, 
 Will Deacon <will@kernel.org>, paulburton@kernel.org, tsbogend@alpha.franken.de,
 naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com, mpe@ellerman.id.au, 
 benh@kernel.crashing.org, paulus@samba.org, luke.r.nels@gmail.com, 
 xi.wang@gmail.com, bjorn@kernel.org, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, iii@linux.ibm.com, 
 hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, 
 yoshfuji@linux-ipv6.org, dsahern@kernel.org, tglx@linutronix.de, 
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, 
 udknight@gmail.com, mchehab+huawei@kernel.org, 
 Dmitry Vyukov <dvyukov@google.com>, Mahesh Bandewar <maheshb@google.com>,
 horms@verge.net.au, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>,
 quentin@isovalent.com, 
 tklauser@distanz.ch, grantseltzer@gmail.com, irogers@google.com, 
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
 Network Development <netdev@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_063848_180863_57A97FE1 
X-CRM114-Status: GOOD (  32.94  )
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

On Thu, Apr 15, 2021 at 10:38 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 4/15/21 11:32 AM, Jianlin Lv wrote:
> > For debugging JITs, dumping the JITed image to kernel log is discouraged,
> > "bpftool prog dump jited" is much better way to examine JITed dumps.
> > This patch get rid of the code related to bpf_jit_enable=2 mode and
> > update the proc handler of bpf_jit_enable, also added auxiliary
> > information to explain how to use bpf_jit_disasm tool after this change.
> >
> > Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
> [...]
> > diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
> > index 0a7a2870f111..8d36b4658076 100644
> > --- a/arch/x86/net/bpf_jit_comp32.c
> > +++ b/arch/x86/net/bpf_jit_comp32.c
> > @@ -2566,9 +2566,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> >               cond_resched();
> >       }
> >
> > -     if (bpf_jit_enable > 1)
> > -             bpf_jit_dump(prog->len, proglen, pass + 1, image);
> > -
> >       if (image) {
> >               bpf_jit_binary_lock_ro(header);
> >               prog->bpf_func = (void *)image;
> > diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
> > index c8496c1142c9..990b1720c7a4 100644
> > --- a/net/core/sysctl_net_core.c
> > +++ b/net/core/sysctl_net_core.c
> > @@ -273,16 +273,8 @@ static int proc_dointvec_minmax_bpf_enable(struct ctl_table *table, int write,
> >
> >       tmp.data = &jit_enable;
> >       ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
> > -     if (write && !ret) {
> > -             if (jit_enable < 2 ||
> > -                 (jit_enable == 2 && bpf_dump_raw_ok(current_cred()))) {
> > -                     *(int *)table->data = jit_enable;
> > -                     if (jit_enable == 2)
> > -                             pr_warn("bpf_jit_enable = 2 was set! NEVER use this in production, only for JIT debugging!\n");
> > -             } else {
> > -                     ret = -EPERM;
> > -             }
> > -     }
> > +     if (write && !ret)
> > +             *(int *)table->data = jit_enable;
> >       return ret;
> >   }
> >
> > @@ -389,7 +381,7 @@ static struct ctl_table net_core_table[] = {
> >               .extra2         = SYSCTL_ONE,
> >   # else
> >               .extra1         = SYSCTL_ZERO,
> > -             .extra2         = &two,
> > +             .extra2         = SYSCTL_ONE,
> >   # endif
> >       },
> >   # ifdef CONFIG_HAVE_EBPF_JIT
> > diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
> > index c8ae95804728..efa4b17ae016 100644
> > --- a/tools/bpf/bpf_jit_disasm.c
> > +++ b/tools/bpf/bpf_jit_disasm.c
> > @@ -7,7 +7,7 @@
> >    *
> >    * To get the disassembly of the JIT code, do the following:
> >    *
> > - *  1) `echo 2 > /proc/sys/net/core/bpf_jit_enable`
> > + *  1) Insert bpf_jit_dump() and recompile the kernel to output JITed image into log
>
> Hmm, if we remove bpf_jit_dump(), the next drive-by cleanup patch will be thrown
> at bpf@vger stating that bpf_jit_dump() has no in-tree users and should be removed.
> Maybe we should be removing bpf_jit_disasm.c along with it as well as bpf_jit_dump()
> itself ... I guess if it's ever needed in those rare occasions for JIT debugging we
> can resurrect it from old kernels just locally. But yeah, bpftool's jit dump should
> suffice for vast majority of use cases.
>
> There was a recent set for ppc32 jit which was merged into ppc tree which will create
> a merge conflict with this one [0]. So we would need a rebase and take it maybe during
> merge win once the ppc32 landed..
>
>    [0] https://lore.kernel.org/bpf/cover.1616430991.git.christophe.leroy@csgroup.eu/
>
> >    *  2) Load a BPF filter (e.g. `tcpdump -p -n -s 0 -i eth1 host 192.168.20.0/24`)
> >    *  3) Run e.g. `bpf_jit_disasm -o` to read out the last JIT code
> >    *
> > diff --git a/tools/bpf/bpftool/feature.c b/tools/bpf/bpftool/feature.c
> > index 40a88df275f9..98c7eec2923f 100644
> > --- a/tools/bpf/bpftool/feature.c
> > +++ b/tools/bpf/bpftool/feature.c
> > @@ -203,9 +203,6 @@ static void probe_jit_enable(void)
> >               case 1:
> >                       printf("JIT compiler is enabled\n");
> >                       break;
> > -             case 2:
> > -                     printf("JIT compiler is enabled with debugging traces in kernel logs\n");
> > -                     break;
>
> This would still need to be there for older kernels ...

I will submit another version after ppc32 landed to remove
bpf_jit_disasm.c and restore bpftool/feature.c

Jianlin


>
> >               case -1:
> >                       printf("Unable to retrieve JIT-compiler status\n");
> >                       break;
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
