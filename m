Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E61C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ot5XzjNQ4cy90F7VXGX7dmE7vBJfzfifjwzRAMbsUfI=; b=vfhM+6ZUHt7PoC
	iFrZ+sEfVGT7B6XsRJlG9we68iA7hBk5ahjD8bn8OfSE5k/1lKf4m5h7AF1o3zElDnisJBvdqEx9N
	gk7RddAfzqm1DrQkCYkI+U11WBZxtmSS2E9cTVD8ZOnHQdBm7wOTbhHZxdZg9SKoWUj37Cp3vElNG
	JEqHKcc7UpoFsn7oKhlFpDpIiXgYkKnTUHoChv2punKVDWMPUaXSA8C7MlwNksPk13KUVKp7Zu895
	wSnSU3S+pL5+OXfvexT1F1jMeAHJGMiyy/m+N0HqMkj+FUctERcV91TtDK3NHBifclVtOQaxrFUmt
	2vtNE8YKtLxpGhPNKWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEvqP-00CqMf-Cm; Tue, 01 Feb 2022 16:17:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEvqC-00CqIv-4B; Tue, 01 Feb 2022 16:17:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D60ADB82ED9;
 Tue,  1 Feb 2022 16:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB24C340F4;
 Tue,  1 Feb 2022 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643732229;
 bh=tXC6QnhULfDX3AZU8FS9vMXtAGqHkE62Trq7DiDQG+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WJwwKHQP2bQp4H+CbO5qOL36XV8TdcUQG/3UyMIqqA9B0Hwm4ETCJEY3lHVClFDXF
 TLDjmG25OjAf2nWbeEIBc7t8N6VE6PYypR1RiqaNALAFRjmNGja8nlfdih+bKRqoXa
 6iwO5cLgem5/buaDb/tp+Lpy7o2qEqI1/UGsUQSKfz+TMPo3z+mSnz3cG8BYoXAAbi
 +TGuHLaymkpv5tyOnUYoe58IArN1k0mbH+FEHC5NNnewgR/sbHx2qa2lZX/kI6lLTq
 KC7FQoHP9N2fB3arkAzwfzPk2f0PAVZIsC9IjuCJdCCr1g3uteH/QlaN158hB2ZU0/
 Ol0fY9iB4pcnw==
Received: by mail-lj1-f179.google.com with SMTP id c15so24827469ljf.11;
 Tue, 01 Feb 2022 08:17:09 -0800 (PST)
X-Gm-Message-State: AOAM531EL0SJtbVWC5yqR9mJQaT+un60zsryHCxBTwlYqFCGya5auAk8
 9rxM71jGTwecfczuC1g33IYunwf+kxu8y5Evgi0=
X-Google-Smtp-Source: ABdhPJxXcBxe7hc9p5AvEq+x7+VhWiTcTDw0Bpv+4IzlGIScnrvZJUOiEvnRa3Lc9ryY4B1x/+EnE7mJkMbtxGuSWBE=
X-Received: by 2002:a2e:bd82:: with SMTP id o2mr1407770ljq.454.1643732227579; 
 Tue, 01 Feb 2022 08:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
 <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
 <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
In-Reply-To: <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 2 Feb 2022 00:16:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQj2vE-1LC5iUa594zSqBt1yMFjiw8pBPTbWVYp7YoitA@mail.gmail.com>
Message-ID: <CAJF2gTQj2vE-1LC5iUa594zSqBt1yMFjiw8pBPTbWVYp7YoitA@mail.gmail.com>
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Anup Patel <anup@brainfault.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_081712_452208_407DF890 
X-CRM114-Status: GOOD (  16.98  )
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

On Wed, Feb 2, 2022 at 12:11 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Feb 1, 2022 at 9:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 2/1/22 16:44, Anup Patel wrote:
> > > +Paolo
> > >
> > > On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
> > >>
> > >> From: Guo Ren <guoren@linux.alibaba.com>
> > >>
> > >> Current riscv doesn't support the 32bit KVM API. Let's make it
> > >> clear by not selecting KVM_COMPAT.
> > >>
> > >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > >> Signed-off-by: Guo Ren <guoren@kernel.org>
> > >> Cc: Arnd Bergmann <arnd@arndb.de>
> > >> Cc: Anup Patel <anup@brainfault.org>
> > >
> > > This looks good to me.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
> > Hi Anup,
> >
> > feel free to send this via a pull request (perhaps together with Mark
> > Rutland's entry/exit rework).
>
> Sure, I will do like you suggested.
Great, thx.

>
> Regards,
> Anup
>
> >
> > Paolo
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
