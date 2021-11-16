Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C3EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 14:02:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4A661A64
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 14:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F4A661A64
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOZu5Atm8XWiUZqmpelGJ2GAR60XAGxSacVoBKnk52M=; b=l6CHbYfdPMMwZo
	CTHpXs3+vWzDXjAKzwtYYK8Vp5GivDenaG+eIMiKGlJPUOuU4x4DWsur1ZXZ9PDzqrTyOQFAqTteo
	StR3ygLPeEROhME0Y+lslEDTVWStb16YnAFYgylv4ibIVNG2rRV48f5LdOk6xNX5w1Qvhz807yubj
	q1thZBe1iPV/X4llxFo3bcYVwy+18MwVAfEutRQzsj/Dc6X4gfCeDGPQwbcJ6N80YgX6nvbgD4HkL
	z/e7JnJOrerU3BCS7d9LvL85ZwtlFDqxNBD0G8j2stP+VXFIUU5bdoYhHFpkk5s1BgiI9QobYRl6W
	O8Pwz7wP90BfLjoA9kew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmz2F-001qvz-7a; Tue, 16 Nov 2021 14:02:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmz2B-001quO-VH
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 14:02:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2469044wmb.5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 06:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJGGjf3T+PZQTjojKZjYUj8YP2BjQYLRmzoH80vh2D4=;
 b=HGu9J9unVEfaFzrS1inJxtPCHbq+4e7eG5GGS70QWjR2etpwCAYB+f+ciwX9R4GY5w
 HtPMoGdHvirMix0SV2Y5OuosDTtzuQTNm1W9qOUtM4xVGWRh1guUaf0FvxC+Cr7vZwbX
 Mwzy2bPjgIuxg+UApKvdQZ0ad3Hfrk16sXb67CKMEQxf7vKMTXK1xoPsNuRmZoRA8ni4
 U+VFSSWEfTLtUzmb6/ZyJlRefUTbOnqxUJEshlul5IMTHGa4MVQ6BkOWd4f1m1DqKo4y
 BXR4A8VDq+RkbGncMzLzTjA3LpMjBI8HFjvyvg78asjnHekNZeQpdpz6sDMw5KDt+F6N
 5Arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJGGjf3T+PZQTjojKZjYUj8YP2BjQYLRmzoH80vh2D4=;
 b=qgJur3dsig7/zsG+ePqHjuDiFqxx58DVdU43SDwx21rVFpvwKAbNNr0rZvKyv6Q7kW
 INN1NKVNrRAVdV3uwOlpfR+O1s/45tCwKpOWJ5/GbvOuutCNHLebhcl3KdixHeh+9xKY
 h5nsgBx/xx+Zzb1cs4zPH9VkiotY05IGYCjvGbgSqBixpT/T28rRVEnzLi5ysMtVbDTm
 7QyU1RLr1So7FbLEOjLsAOHt8bfvY/bu2VK2b3ESVDjDem765QCdUfGtuQ/xVOsFmk4Q
 jATkxU0XBTYB8Tne/YtCMSGFtWyJhsndS+Hdc8aRrLhZbVJB334x1YwWgUZbefIpsLJo
 ugjQ==
X-Gm-Message-State: AOAM532KJwSzRLBacmdapYOo9VMabaLCOE8MHqK4tiDy7YyDFgns5LNK
 QcmA4+vdeNplz6HLd9VQgZLfH+5my2MZ7WP0V0TBdw==
X-Google-Smtp-Source: ABdhPJwXP7n5uxNvnq5f4cCWx2AEFTHhYlXt1jDKuL8pqxOWNU2kElA9mxGgQrMUZUrxev9XFvBmrQNsueDq+5IDYp4=
X-Received: by 2002:a1c:20cc:: with SMTP id g195mr8125788wmg.137.1637071320789; 
 Tue, 16 Nov 2021 06:02:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637064577.git.mchehab+huawei@kernel.org>
 <32b3693314f3914f10a42dea97ad6e06292fcd4a.1637064577.git.mchehab+huawei@kernel.org>
 <34e691ec-a58d-c86b-a2ef-6fa4f0385b69@redhat.com>
In-Reply-To: <34e691ec-a58d-c86b-a2ef-6fa4f0385b69@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Nov 2021 19:31:48 +0530
Message-ID: <CAAhSdy0JRTwmr+EdSEr3ng1gfDpqnF7m3ejC2AydjAgu0mEQLw@mail.gmail.com>
Subject: Re: [PATCH 3/4] Documentation: update vcpu-requests.rst reference
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_060204_017425_0DB49E58 
X-CRM114-Status: GOOD (  19.02  )
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

On Tue, Nov 16, 2021 at 6:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/16/21 13:11, Mauro Carvalho Chehab wrote:
> > Changeset 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> > renamed: Documentation/virtual/kvm/vcpu-requests.rst
> > to: Documentation/virt/kvm/vcpu-requests.rst.
> >
> > Update its cross-reference accordingly.
> >
> > Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >
> > To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH 0/4] at: https://lore.kernel.org/all/cover.1637064577.git.mchehab+huawei@kernel.org/
> >
> >   arch/riscv/kvm/vcpu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index e3d3aed46184..fb84619df012 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -740,7 +740,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >                * Ensure we set mode to IN_GUEST_MODE after we disable
> >                * interrupts and before the final VCPU requests check.
> >                * See the comment in kvm_vcpu_exiting_guest_mode() and
> > -              * Documentation/virtual/kvm/vcpu-requests.rst
> > +              * Documentation/virt/kvm/vcpu-requests.rst
> >                */
> >               vcpu->mode = IN_GUEST_MODE;
> >
> >
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks Paolo, let me know if you want me to include this patch
as part of the fixes I have collected.

Regards,
Anup

>
> Thanks,
>
> Paolo
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
