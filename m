Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8068FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 04:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Up7m/wAbTDsvdZQ1jVdjREHe+nTMYrxNJakpL4Gx6O0=; b=b5En3DVWejQPa2
	RoSQ7OqL6UR0ki6t5/yLu2gtH25qg04P4OfggGF1eCgTtCfiW0Y/ilzpobDNr/mqxpfPOXk/yux1A
	KwuRkHn2gp4N1IKMs+hIQvADp4bW+19Ram0pmId5t1D48wmMYXWkUW4Ukzxo7KZhCn0XB6WuT5Q2I
	CtR+ikI8ZMA7YpC4/r5Gy074gK9q3QnINuEInqnWOXRcWLgAr+7YkqOHb9m7TJKjoJrAw3HuJxReK
	PVFwYu/gkaguaflpKtwTxwQ4Q6hsGvRUvyPrbmv53ZZ7fImRL7oZbgoPcGkrTQ4KseNYig8Olzz/E
	vUmObt7gn46XSMBs1ERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9UL-00GAB0-8t; Thu, 09 Jun 2022 04:09:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9UI-00G9oo-CG
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 04:09:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q15so22618917wrc.11
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 21:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qr3m2Yddcj/9rkP9P1MqPdJ/Rr6E/RCde4JzQwq0ygk=;
        b=jjA7kaTwlPG+8lAJw8aS2qYkTELSRhTtioIkasP3Ua7Ncb8/Um8F1OEZyiGbMI6SeO
         ETd1KmKAR6a+w/PaNJyt8tzy4HP7ptThXmSP4ZLLdG/HPw9N535qzDqZ/aaVsB6mpgs4
         ekokUA+HBIacx6iBplvxFX5b4YM3ZxJ9X0ffgyTEb8LkEJlwYpfaYJOrYnc5ZaefX82u
         xXximfYvyQtlDROih7T+K0lvuvtzvkPaB9YyinAkRhhjbudH7UkKve6UtSpzaLWj3IEH
         PgmYE6GWpSDDrFh2H+0Anhh0sjG9TVGHn0ycyusXPfTXgQT5l5+hSgm3wUfg3mh0tas3
         xbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qr3m2Yddcj/9rkP9P1MqPdJ/Rr6E/RCde4JzQwq0ygk=;
        b=krHVdRkpM+egmmitNq2gkzzYNbSKPZbe3hXcDJJBnIjhj/A7Z8ZU0ISeyiSXco6KY4
         TAEOelMaPoIMHJJs7585jytLDmhESOU/v660l0ANpVSzEiyNukTI0jxe5DP6Zsb/P1G1
         jt5X9gCo0ATYO4uFvkb+jXc22BrTG10z1vwtTyhW++cesXAnpVumFaGReI/Hrp5SGamR
         DoJmwbbnELR5Hrz5bAYt233n4kCaK4jeB3Jy8oSLJLop/zabW1iky8QkckUiGwQbSYJA
         hyPi1q+eYImOJhrAjhIYIFYNcB9ahexJJzgRlLe+D8pcMNl4T8saTq8Bqh7If/CRDRq7
         dMGw==
X-Gm-Message-State: AOAM531wOPp3UJNFwmovwMJHk5q2GXvWdOuUw6rAfdnN52SMGyGJMcG9
	zz5sq7QgMuHKCBb+bYwaAbScMIBsiBf0YyCB0ZA0yg==
X-Google-Smtp-Source: ABdhPJzATZGYNXOEfNeC1xjFpQoXzH0chk3Mdxdc6eyXuvY61inSv66u7opI40j6F9/vdCRh2cJ/4vUkZLFYNZGRkY8=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr36664559wrz.690.1654747767939; Wed, 08
 Jun 2022 21:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220430191122.8667-6-Julia.Lawall@inria.fr>
In-Reply-To: <20220430191122.8667-6-Julia.Lawall@inria.fr>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Jun 2022 09:39:15 +0530
Message-ID: <CAAhSdy1kEPYJQdK+f-6Dkb92ScV9fG2m0J2rJSeWjfNFUtjVwA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: fix typos in comments
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_210938_449190_2C05FE66 
X-CRM114-Status: GOOD (  15.90  )
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

On Sun, May 1, 2022 at 12:41 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

I have included this patch for 5.19-rc fixes

Thanks,
Anup

>
> ---
>  arch/riscv/kvm/vmid.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 2fa4f7b1813d..4a2178c60b5d 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
>                  * We ran out of VMIDs so we increment vmid_version and
>                  * start assigning VMIDs from 1.
>                  *
> -                * This also means existing VMIDs assignement to all Guest
> +                * This also means existing VMIDs assignment to all Guest
>                  * instances is invalid and we have force VMID re-assignement
>                  * for all Guest instances. The Guest instances that were not
>                  * running will automatically pick-up new VMIDs because will
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
