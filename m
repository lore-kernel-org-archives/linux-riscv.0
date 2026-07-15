Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3E2C44501
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lHVnEoGJZLxjJrY8KMFwSwJhPdRdeTKkHnF5X1MDt0=; b=zST2T9p46cV920
	uXr18rX3ud7uvc2BkxpPF/DYv8uVHKFOSQQSfyVCh/eiJz/7xNQ5bpbniiOKVEumUw6thagVK2Xm9
	T4b81eMP+BDgyEPB/urXM2YO5JHFd7Lv8lpJjNdT+utsJI+jZG/k/ES1RKV9/LGoLGGFrP0+kafe9
	8ost+37yJGSABxGIk45r8KpJPY5qs+VLgpQ7mgppxy5Yd289ztKlr+ALihAkHW9p6VhUlbmpP6qm5
	t+7JbqrLJ4+8tsaObQJlbvy7E3gQxmun+cH433TWbe74rto5pvvFEzo5k7rx3Hu9AzqqYMKg8zPbN
	qg73II+z7UuoFcVPB86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwwz-0000000ET0S-3h3k;
	Wed, 15 Jul 2026 10:34:49 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwwu-0000000ESxx-44VS
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 10:34:46 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c106c38e99so1637963e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 03:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111683; x=1784716483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BcTdMoZv6JVy6M/fO3WdP9FofoXGw30zAP9bsFgIqfs=;
        b=SyDApsNQXs/ONKUVVh85QNrRHgdlXx5KclZHeObGXIjxdw8KdRjDgZcHcBrVui+2II
         aICZDJ7wLF831rvc6HH1Bcohh6fMEDgApGxVdO+JLiKISgiCz/88z4axP7E2uVcNdl3g
         Cjv6w5vRu+GF1i6ZoONQaHv9bqggKONlEKRm2G9NUxewKa4pFDizldpbpgws3iHkVOd2
         y5Nal1LO/s9CjvlVu/O3yzE0d7rt12nTnBgLlKUVnT/7smaqpVLDi52EacM11xP1TKgB
         sdHF9QrW7UcYeDZSgfxL/jRO2cHhVL2Lm6rQox4A9Lx+3eOPh04i/uZnSm/T39QKeGKF
         bCAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoF4cL48z9y1khIFJlZ1/jOCrs9GPzmWk96gCrFJtqBU6NGk9+imWQ4057fobFUy8n9OpIVUgAt+Hj+uw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwchbdEF9IOHzU2qqAaypEj2g9zYk8y6BbMUylLHOHyp99UhptZ
	aJOq84Gg1M+zokXv4Hcoz7euxXJUUbugBvb86o1d+BZ73O6Ig7MLxxfiM170jWpdxx8=
X-Gm-Gg: AfdE7ckRPF89IOLTolTnV07vMV8GU3ESPJijiVcB8zlnR2GfEQ8m5164ELvNH9/dgbO
	AhX7AKC1rcdNVU5SXMrawene3ziAG0wKbroQj/nsXGVADb64tH1d7Gy2nVgQ4JdOXEEwbSohmyH
	GB5z+5uITQnLzxyBP+DQTYJe1zdyxePBsknKYm1FVTcbxwE6uBcloUTATqUgMUQ104z3n8ZNFkt
	1Rp0wout2cEaU/NYePi1AIFyL2mCbT7J+g9kqiu8YRKtOoY33sVnTh/Q5UgDoL4C8ZxoRXaPxef
	FOOA2Mj1jJVFgoQAiIeKf4Ict3hHBgHdBu9z61za7GBnFQbUSMHgv5TpSfVJF7fKarmdAdbFi3P
	6L2kVqKvGGPveIARDtyy5JvISWb0uGBuS23VMFDJHZ0xMmBqZZtt2HAj/vyZOoWtDIYVh9bTi30
	LNBYFaMQz1GNBxNfZtlfSiJi6FNNsMxRVLtEGk/rqrgBpEkgvimSQUWZzh62w3
X-Received: by 2002:a05:6102:5a88:b0:737:8ff4:147f with SMTP id ada2fe7eead31-74533d96437mr10245240137.17.1784111683571;
        Wed, 15 Jul 2026 03:34:43 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6deb1aasm12248590137.7.2026.07.15.03.34.41
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:34:42 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7396940aebcso1677964137.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 03:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr5hhFduYMz6sYsSo0WVZMdIoAtZ6C0bUEY8oiy+fOALS+YXai3ydwzMHPZ+8lLimDfUT/ecqSOk1cbJw==@lists.infradead.org
X-Received: by 2002:a05:6102:94c:b0:730:db02:1d08 with SMTP id
 ada2fe7eead31-74533c1eae8mr11245328137.10.1784111681255; Wed, 15 Jul 2026
 03:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com> <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com> <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com> <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com> <alZo9feSrSB_StfO@e129823.arm.com>
 <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com> <aldV23PwIXnFloaN@e129823.arm.com>
In-Reply-To: <aldV23PwIXnFloaN@e129823.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 12:34:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
X-Gm-Features: AUfX_mxU0lxjO-fzCeQeNX344H_SVkvovWXaE8EEgaGKFYO5e9NLd2LkTofC79k
Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux@armlinux.org.uk, akpm@linux-foundation.org, ankur.a.arora@oracle.com, 
	rppt@kernel.org, linmag7@gmail.com, chleroy@kernel.org, klarasmodin@gmail.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, kas@kernel.org, 
	zhangtianyang@loongson.cn, wangyuli@aosc.io, tsbogend@alpha.franken.de, 
	ljs@kernel.org, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org, 
	kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com, 
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org, 
	guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk, 
	dinguyen@kernel.org, schuster.simon@siemens-energy.com, 
	wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev, 
	vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org, 
	djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com, 
	Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com, 
	liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	shorne@gmail.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_033445_025857_D75A1E9A 
X-CRM114-Status: GOOD (  21.73  )
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

Hi Yeoreum,

On Wed, 15 Jul 2026 at 11:42, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > --- a/mm/ptdump.c
> > > +++ b/mm/ptdump.c
> > > @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> > >         st->note_page_flush(st);
> > >  }
> > >
> > > +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> > > +{
> > > +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> > > +               return false;
> > > +
> > > +       if (mm_pmd_folded(mm) && level == 3)
> > > +               return true;
> > > +       if (mm_pud_folded(mm) && level == 2)
> > > +               return true;
> > > +       if (mm_p4d_folded(mm) && level == 1)
> > > +               return true;
> >
> > Is this order (... && level == ...) the optimal order?
> > On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.
> >
> > > +       if (level == 0)
> > > +               return true;
> > > +
> > > +       return false;
> > > +}
>
> It is. since the purpose of ptdump_pt_level_first is designed to be used
> in the *callback* of pXd_entry(). IOW, if we check level 0 first,
> it always returns wrong return in folded case.

I meant the order inside the if () conditions.
E.g.
"if (mm_pud_folded(mm) && level == 2)" does the expensive check first.
"if (level == 2 && mm_pud_folded(mm))" does the cheap check first.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
