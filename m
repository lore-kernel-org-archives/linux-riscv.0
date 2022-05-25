Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C94DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 06:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHZJku9TeehD+kKwgkQwP24St5o4hjnU+0Fx5uXeDxk=; b=lT97lQKf2Qhfwf
	W1inlENckdA6RyV+6jzx5NgSxbUSlvxoWzmt1vX/EtgV7mcE9+hmhdvL7GQx9hpDYB741cJ5haR9A
	R/hd3Wa6PXsub9YexGinvrBK3Id1+6iXGxza97nl/fn1mLy5h55AxUaysjRhW2uGaD6ElJAe3nwut
	VUXbpYGR/S1wDTvaATAXMXBO8iCkE4OpD4EXCIPC9yV7wv06n7pAfQISk0bHdxV4yeZlzoKaWFM18
	zHQir0QTvsEdrflJla/P2IrsSokPVaykpb2rQa4NYvy+TJ6PVJnG0Zpw+stXs0RZCqx0kmctaBCN/
	ejbh/psDPs2CWIeGiOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntkRF-00A3up-Tn; Wed, 25 May 2022 06:24:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntkRD-00A3tk-4F
 for linux-riscv@lists.infradead.org; Wed, 25 May 2022 06:24:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52D10616BA
 for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 06:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86ABC34114
 for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 06:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653459842;
 bh=8JeSY/sJW0TChA7xKBf64BJ4OLClx1fdn0a73g46m4A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dd2exBhd4iziobSgWVVc4i2DZ2clmpTQMzE6Kg7Xg3XcT+Cn8/vgC5stKzx0EmdpI
 OKFu8LN6mYB4ww8q4C+RjlOulNKcz11p6xp6F6XR7eqWmQJiKnA4yiDwlz7xs2PInt
 ZcyQB7HV1V9tROXCcwz/hx8qsJBWKSi5hlBgU2Q9qIAIIx3cMyIs7Q3AE3ShCc22ld
 tly/twutxjFXMD5oF73TYh9Vz0Lh0iJVKFs3JmKeD1XHp6jvIJk/yxOQTnOyf57Ll4
 JXf8URnQit6COQ3p7XaZnWWd1klI34CoiPpaeWcESV67GBY47THY1bGiTNIOZBFUHo
 E6YULeCjYKzAQ==
Received: by mail-ua1-f49.google.com with SMTP id m18so7010088uao.9
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 23:24:02 -0700 (PDT)
X-Gm-Message-State: AOAM533csuS23D6/iqUAat9QFHNbPl/z+OwWH/1EVR3Zb3ufefb16vR4
 4Il0yl0BJ96NWuIbQH0T/lQ8wq73Cangv1Dxwbs=
X-Google-Smtp-Source: ABdhPJwuCM250IKJvWb9N4Igtg/fl/O3mlCxq3BqoJ3ItwbOfg0xvWQxiVKJF5CgbSheKVFn+LMtxgRwYLbR35+o1rI=
X-Received: by 2002:a05:6130:90:b0:362:891c:edef with SMTP id
 x16-20020a056130009000b00362891cedefmr10463434uaf.106.1653459841603; Tue, 24
 May 2022 23:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220525014424.20717-1-liaochang1@huawei.com>
In-Reply-To: <20220525014424.20717-1-liaochang1@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 25 May 2022 14:23:50 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS9_1D+K-ok2vxQpbq6B7zxv1K-t8cfcu1hFjF=7a5yxQ@mail.gmail.com>
Message-ID: <CAJF2gTS9_1D+K-ok2vxQpbq6B7zxv1K-t8cfcu1hFjF=7a5yxQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv/kprobe: reclaim insn_slot on kprobe
 unregistration
To: Liao Chang <liaochang1@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, 
 Naveen Rao <naveen.n.rao@linux.vnet.ibm.com>, jszhang@kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_232407_285744_B6B8D493 
X-CRM114-Status: GOOD (  20.28  )
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

On Wed, May 25, 2022 at 9:46 AM Liao Chang <liaochang1@huawei.com> wrote:
>
> On kprobe registration kernel allocate one insn_slot for new kprobe,
> but it forget to reclaim the insn_slot on unregistration, leading to a
> potential leakage.
>
> Reported-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
> v2:
>   Add Reported-by tag
>
>  arch/riscv/kernel/probes/kprobes.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index e6e950b7cf32..f12eb1fbb52c 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -110,6 +110,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)
>
>  void __kprobes arch_remove_kprobe(struct kprobe *p)
>  {
> +       if (p->ainsn.api.insn) {
> +               free_insn_slot(p->ainsn.api.insn, 0);
> +               p->ainsn.api.insn = NULL;
> +       }
Thx reviewed-by: Guo Ren <guoren@kernel.org>

You also could give a fixup patch to csky, thx:

diff --git a/arch/csky/kernel/probes/kprobes.c
b/arch/csky/kernel/probes/kprobes.c
index 42920f25e73c..661da54b418f 100644
--- a/arch/csky/kernel/probes/kprobes.c
+++ b/arch/csky/kernel/probes/kprobes.c
@@ -124,6 +124,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)

 void __kprobes arch_remove_kprobe(struct kprobe *p)
 {
+       if (p->ainsn.api.insn) {
+               free_insn_slot(p->ainsn.api.insn, 0);
+               p->ainsn.api.insn = NULL;
+       }
 }

 static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)

>  }
>
>  static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
