Return-Path: <SRS0=ZoRk=QE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600B6C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 05:19:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2697861A09
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 05:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2697861A09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMqmsthikqcjljy2Lcfc7dCgR1KgXahVr0ctcpMVTuo=; b=i3TYdcrth9SvuU
	3kP4qBr9aTZfrWAremlwlWKP5kNLEdbTxNWa2LCzrHnmOPzI1D8E2ApnSGKlafP3iHwv+YpGsVfOi
	E6c7vsAaQBlkwwt0+ZSm2RHwccEhd/RMh8Wi8m7fpyTlGoFIed7ufJnDb8eXfzFFd8QL3danuxeFc
	kFJnkc9TqKWwIF/RffA/q9vj2o0aFyNNDLG/IUuj0OqPpZFlv4i8F1qu78dO9E1S53XjxyQl5XMts
	rvSUNuJ3HQunyP9REFFF8jYS8x2KXU4vdxcpb8AGnitc5sagl9y1R2LT1tzJIBtjJxPq5crCEKIMQ
	IqGFudocE8NYSKyFzIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnDLx-003LNp-AS; Wed, 17 Nov 2021 05:19:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnDLu-003LML-K4
 for linux-riscv@lists.infradead.org; Wed, 17 Nov 2021 05:19:24 +0000
Received: by mail-wr1-x433.google.com with SMTP id d5so2187303wrc.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 21:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1d/5wtm71BxoVBGiN8Ljzm4+t2qVpUjd2wk4O1QdlZM=;
 b=is70FHBLk+aTfX+yq501gaOQXJHxBX/bHha7TNgjAQrDphwxIgoK4Bc53VhkfQwYL+
 ZW/d5b0vzyJ+IYLi0KnBNKGiCkB+36HIxZxwDFwRymp7y5EVdQ5Bo9owDCoRM5110bvV
 a2kExAtzJgPUaW5Xr91KxEHQaCuMFLRgSDwZ5gksGWkPIVY3swFg4wzEoYy86SWG9cUY
 zigjkTuLzGpEnGojvRm07sdTY2gueOOqQTBQ/5az7MVXSJnPoChlFYrpXUXcdW50jWnv
 GOiZP6C86ssD9cXEXbcJELdOxbP0xPNUNDDxYKIHBxducQO05aPHmcXYkwLw62Jz3yoe
 PAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1d/5wtm71BxoVBGiN8Ljzm4+t2qVpUjd2wk4O1QdlZM=;
 b=UzvdzaDZmi5i92aVni0Y2Qem9mtnDIN//mqKaW22yY8e2nCpPCB2uAnYTYjVCDu5W/
 TJIsXk1NtLEICiNQPsSRO3kjZO6Czo8UriGVgzSkYXFg8D9pi1H1XiSHsfq9KmuOwucy
 CVAKsGxJFDahZ/SgX1jbt//bakiEuOqthFB53/xgd2Q8j26qacYdBq3O20xwB4t6gmi+
 Okh6WVV4AxTWp+1TOn6HdsBiYh2fqMMaAv4DsXf1ZtR3VcTvqC1A6jFAsfzERHR26Koe
 CtgrMTQ0GhSNNuR8Nbu1/9Zs58lX3Q6ZNXkJZFklTh46f7FeADb7JHxMWF1apSORM6ND
 bT1w==
X-Gm-Message-State: AOAM530MAzM06uT3JVMiSvOEAJUxNubIaB8uQRl8vwMxrXofCjhZGXxW
 Bu1bdFsO60x8HWIC2dUToDlHhsIzveD1dbq4FqfAHA==
X-Google-Smtp-Source: ABdhPJyX4D/T4vRXx/HipXx4SprKAXckD0tm/8XOGI5AS8e44ypJEyDGyO3Mwf5JU3a7gaQ2ZR/pHy5q3RZ5nBLhh9A=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr15955941wrs.249.1637126360414; 
 Tue, 16 Nov 2021 21:19:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637064577.git.mchehab+huawei@kernel.org>
 <32b3693314f3914f10a42dea97ad6e06292fcd4a.1637064577.git.mchehab+huawei@kernel.org>
 <34e691ec-a58d-c86b-a2ef-6fa4f0385b69@redhat.com>
 <CAAhSdy0JRTwmr+EdSEr3ng1gfDpqnF7m3ejC2AydjAgu0mEQLw@mail.gmail.com>
 <8a762a6b-4ad8-211f-f350-ba65f8e77b64@redhat.com>
In-Reply-To: <8a762a6b-4ad8-211f-f350-ba65f8e77b64@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Nov 2021 10:49:08 +0530
Message-ID: <CAAhSdy1ZijNE-JDj62KU1GbNjxu4UQQbpuz4P0wK+1orOyBMKA@mail.gmail.com>
Subject: Re: [PATCH 3/4] Documentation: update vcpu-requests.rst reference
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_211922_684512_F41223B7 
X-CRM114-Status: GOOD (  17.93  )
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

On Tue, Nov 16, 2021 at 11:35 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/16/21 15:01, Anup Patel wrote:
> > On Tue, Nov 16, 2021 at 6:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> On 11/16/21 13:11, Mauro Carvalho Chehab wrote:
> >>> Changeset 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> >>> renamed: Documentation/virtual/kvm/vcpu-requests.rst
> >>> to: Documentation/virt/kvm/vcpu-requests.rst.
> >>>
> >>> Update its cross-reference accordingly.
> >>>
> >>> Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> >>> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> >>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>> ---
> >>>
> >>> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> >>> See [PATCH 0/4] at: https://lore.kernel.org/all/cover.1637064577.git.mchehab+huawei@kernel.org/
> >>>
> >>>    arch/riscv/kvm/vcpu.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> >>> index e3d3aed46184..fb84619df012 100644
> >>> --- a/arch/riscv/kvm/vcpu.c
> >>> +++ b/arch/riscv/kvm/vcpu.c
> >>> @@ -740,7 +740,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >>>                 * Ensure we set mode to IN_GUEST_MODE after we disable
> >>>                 * interrupts and before the final VCPU requests check.
> >>>                 * See the comment in kvm_vcpu_exiting_guest_mode() and
> >>> -              * Documentation/virtual/kvm/vcpu-requests.rst
> >>> +              * Documentation/virt/kvm/vcpu-requests.rst
> >>>                 */
> >>>                vcpu->mode = IN_GUEST_MODE;
> >>>
> >>>
> >>
> >> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > Thanks Paolo, let me know if you want me to include this patch
> > as part of the fixes I have collected.
>
> I think Mauro will handle it, but you can pick it as well.

Okay, I will let Mauro handle it.

Thanks,
Anup

>
> Paolo
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
