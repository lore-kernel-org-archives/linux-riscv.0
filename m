Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A84FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2NlnShRV7RWHviXVwT4K8580CHvnf3EcE6Or7Zhsr8=; b=aDriJcNwJqfbHu
	KrQbvanBiqCnJU4af8s6O8IM82XGy7GoPvp88FoCzngKtG59n3nFuiLPwIXort/SmRn57TgbKo/o0
	SB7vYsmqJ2lCo6t75keQ02q+bPrQijq2yi4D/MBODLA6BeG2zgtEETlf+FWawjcjmU1l+7SVQkvwT
	kupObwij6RTgGLu2qE0acY5Vk0sP9f7VosHn2ixR9SO5g0EHl++mj2C8kSuk+iFrW3srpi8hvR7vx
	b5Sxq1GPRzz2afUFCGTdByl+0ybL8jFcZH+7QLK+VLpca0omeP99UiNIYMWoYHYruGVpAwR0OMSeG
	Q012uEy8anzPtst9SRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEvLN-00CkFU-Of; Tue, 01 Feb 2022 15:45:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEvLB-00CkCD-Py
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 15:45:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 f80-20020a1c1f53000000b0035399b8bedcso2000716wmf.0
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LCcU9g3LWk+Ni1MDTb90PSlSH2Ejv1l38RdD5isGmzA=;
 b=dNCxlG7n/ZWCDBHispxymrFtrSs4c9YqEglHxbiG1ucYsKtBOTQqyfDQwy3eotCMjP
 uLM2L/H5EOfuyuixCibGBeRPuEqC7JcUChO4/5W88/l97mdNAgNvT/xqYmtLFgbKxh5n
 w5nISZOS0HKXiiexKQd+CqHtqM0kejpiHufa6rVenmJHxnYBkcSCvAZ+K0lfDvYe8v8/
 paGmxHQs3RqMpJLOQQe5QQ5vAOhsHvaHBxJGkYOele0OKszptBqf8ga7cK7KXkXhM0iv
 Gsb4gJ97geGtk3lJlPWcjuPmCn1m0Qbge+0Fy+Y8HGop/fCzxMmzbROs7ofYWtG8VEDd
 mjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCcU9g3LWk+Ni1MDTb90PSlSH2Ejv1l38RdD5isGmzA=;
 b=XVxk2548yRFw5RirA3WuKPYJwAgvzVlbG8NnCX06w3apeeh0iWBQ544IWRz61/iIm6
 AbWxGGEZrYv+nhY5qyE86CHbHQUzpaH3rVfY7hPwEmXVlC9eQ4ksxpOuGB20t/ZCA1pm
 sMNSDdLZ2n6oc1peqQWPvRe4D36bDnJUrn+a6uPyTZzi+2WnvLedNKSas8Hdtd5zxw0w
 ATMwtvZnZt6AvjFECTgDBSZ9eVGcDyzI9JAlxi6bw9/b9BoUv/Jh/Ea0Dq3nE13eQn3G
 dgJ9H3ReUrS9brfmwapJNGnJUboifTHrFRGd1OboMgBvZOHwmF3eV8RKItZ7+Lc31/Q4
 EvJg==
X-Gm-Message-State: AOAM531rw3ld0+RsYDBEVeimqQf/GrjFwNohB2mqKFQx3Sbn+RRwecZn
 xEwEZUAPJqzWH9CoY50DfuwW8wEoX/KgETvMhYuFEA==
X-Google-Smtp-Source: ABdhPJzLJXIjzEoU+zr9xqvCLUKq64QKzCzT5/D/E4v9iXKOT2PZW4bgO0vZKGKExLFNyrBqW6Lzx4h6BrcWo4/kvAI=
X-Received: by 2002:a7b:c929:: with SMTP id h9mr2237691wml.176.1643730307764; 
 Tue, 01 Feb 2022 07:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
In-Reply-To: <20220201150545.1512822-22-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Feb 2022 21:14:56 +0530
Message-ID: <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Guo Ren <guoren@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, x86@kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_074509_900450_29BDCB60 
X-CRM114-Status: GOOD (  14.71  )
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

+Paolo

On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Current riscv doesn't support the 32bit KVM API. Let's make it
> clear by not selecting KVM_COMPAT.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Anup Patel <anup@brainfault.org>

This looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  virt/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index f4834c20e4a6..a8c5c9f06b3c 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
>
>  config KVM_COMPAT
>         def_bool y
> -       depends on KVM && COMPAT && !(S390 || ARM64)
> +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
>
>  config HAVE_KVM_IRQ_BYPASS
>         bool
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
