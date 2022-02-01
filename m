Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E40C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evWqZyXLZUt82ZXtcireI350Kpsk7kGe86ljJUU2WKQ=; b=D3a0oX7QLitGI8
	G3D6G1m9gOJSXndZnRCMosi23eD69FcpeJ2ko860V6x4UQuM2qzhsTUT3Hc8yujK+BRoWaDRiLFWh
	cjDWVIRSC2vNllmgK2FzGcbVh9y8IpHT7+1UzKh0aE1bwH4guhuWrZMr+Ck2DcxBckqFJ3hLdNg/u
	LttgvlXR340oriq2+83yWlOTeUWiF8iFBJXCKbEetEw9x7wcZePP36MT0FCkB8uXhPZvcQl1lNokr
	464rJnu2tI9a1soBA7qCjSYn5QRliTnoUUZ8C/VuYkXC/IGPzOXyZUEJYPJrzmKn+/E1oiAxZBFwX
	U8dLleem1y+uigQkyhVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEvke-00Cp3h-4P; Tue, 01 Feb 2022 16:11:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEvka-00Cp18-I4
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 16:11:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id v13so32922581wrv.10
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 08:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DUcPfG2jvk8soPrh/GXSOclq4tBhWSCtwAZfbfPfsxI=;
 b=Q39c2YdTI6tt8Mw9qweDpEUlYSsHqIy+Aj9hBDLyopqZWjD1N9HO4MNtFEGyKEShRw
 s6vHsgbK3CIrTZ7cEq4bjXDQgRcZ4DJUv2B5ylPjzFQTfnZNwni5kZZM+mwkGHymGYWD
 +KK+YVnOK61brOsQEwZ2Hv2T7Usz/dKjg8KlDCmNz98g2UGkt351ZVCbDAKCLGjx/wYP
 Zfb5Uyum8DJ1pizAWMHv1uU2Zg7Gdjx3H6Z9PF5EfQisOsO3MNW5sgYc6VMiytZXZGvL
 NB7QGOlXeVHr/VUMxLbVj7a/A8P88NZy5rCD5bIga2SgmncsXNxFRzHJTJ6nV6kCmuu2
 h7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DUcPfG2jvk8soPrh/GXSOclq4tBhWSCtwAZfbfPfsxI=;
 b=O6BRSJlflm4veZXzfrSXWGWLqCQrXhT8aukcXmfo/zMkofpzwjlCOpvbPePzK7uTzd
 FBWhjHdPgPRr8iXaDJsVy9p7kUI9kJ7cPowXrs8uNnmlSWd18zdVNUGr+LMjZt9E9MwF
 3Q/FFjMJTovIkRt56+fUu+VzWDJtgvdEn+PeOn5yzK4MJjD1tlXpiPeEYZgJ344zKO7W
 kJGSDiSHtEp7BatsFpEU0e4fWoJSMSpSypt57d6fxBa+RWyinKmnKce+9Zd96upjzbvD
 Br6pjzOglfThElWkcZxiXEQqeZfTDO7g7E8xL6DldZcLUuv2PsyVmYfzTeYbdtiUEkuf
 mK2Q==
X-Gm-Message-State: AOAM532Weo4+V+qNwA4Xbbp6somCglOXvWl46ZfyIUhAc4wstINTL8Vz
 6jiteMujhN+YP4LtlISsBUcv9ylZFCRA9XOPMSxW0g==
X-Google-Smtp-Source: ABdhPJxRdu3koNSPRx51iMYR6D0s+iKeotnR/bbkjDDTVNuZlVppZz9dPxmoqMgZz1gJ1RxiMb7ruVkHSMMs7QbxGSk=
X-Received: by 2002:adf:d08c:: with SMTP id y12mr22519591wrh.346.1643731882701; 
 Tue, 01 Feb 2022 08:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
 <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
In-Reply-To: <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Feb 2022 21:41:11 +0530
Message-ID: <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, 
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
X-CRM114-CacheID: sfid-20220201_081124_655984_6D9E539F 
X-CRM114-Status: GOOD (  12.10  )
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

On Tue, Feb 1, 2022 at 9:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/1/22 16:44, Anup Patel wrote:
> > +Paolo
> >
> > On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
> >>
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> Current riscv doesn't support the 32bit KVM API. Let's make it
> >> clear by not selecting KVM_COMPAT.
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Signed-off-by: Guo Ren <guoren@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Anup Patel <anup@brainfault.org>
> >
> > This looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Hi Anup,
>
> feel free to send this via a pull request (perhaps together with Mark
> Rutland's entry/exit rework).

Sure, I will do like you suggested.

Regards,
Anup

>
> Paolo
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
