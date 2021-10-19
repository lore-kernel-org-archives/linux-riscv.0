Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62644C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 09:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A5476103B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 09:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A5476103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Adgmx7GY+/56HznwkVNbd66CApWkQjBl6a43eoVxyYc=; b=ApWSgcnzeyWvw0
	9+eWs8D2So7HMeoJBFAV0UcarmOTXZ1HW4PRtqhR3/cwyrGcMVvSxkRWC/SnpDqgYbakpnhJqXyoC
	GVf9B+dsY5YmCXhhQcvlEaX89PGTpp7RDcJL4lR/WTeIE8901jlfMeW/sfHpOISpJks0x99R64EBS
	OT/Cs4HOk4CEws54Ddj8DWQJ9g+rSxuyDSU8kSvrXVl5KFK7Tej/emA8+5kDsAC8yScHmbXHDw0jL
	sJ8InGkIqEPqXJit5WSjazuNFEgBOrUNusolEwEOuOZKwzQBJTRVwRmTOANk95vSyBjkfykprUw+X
	tR9n/fWkOAkpb+IP/VNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mclKU-000eoK-R4; Tue, 19 Oct 2021 09:22:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mclKS-000ema-7o
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 09:22:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id v127so11216879wme.5
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fptJv6XvoZk9YouChC4oUHOD/enMQbUqo6YfTUG11j8=;
 b=qHoQS2s76kBlprES0oGRziR9C5WQdcSO2SRygtuQ+41hE/s5IDtpq3tEADGZHIJ4+U
 VVfBkwLBJhtJHMEu+eftbbpNpZoD8Ja0+GL9GkVPJfgdFUJOhcZWpg3xINz7Yx9vMHbl
 M45X0oYiL5fFJI0xwYBz93K8WtjDVBNuHNqF4E79yiViVTSce7jJLYc/DH1eumrLWG/V
 puPNq7f0+ZyREiB6mbuhxEeYkrptIs6uLKgKdiKHp0mDZmbTkXzbMSy9mjz+3/7zH1cC
 APzCsqUddfIGZ72pHIJThOZTJ/iK+1/0LiCiD3zcBeFYmdorAkDWA8HVqnijqW2g5hAc
 /lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fptJv6XvoZk9YouChC4oUHOD/enMQbUqo6YfTUG11j8=;
 b=e8GCoxxkaV551Z89rH/rxGXidtVifqcXUVw8MgML83cPvrK9YGirwyTPXSfCBFg+ki
 by7411KSvuZVt/b/BLU3niH5lti9jw8gB3wk+l9D9SE6b7jYGgSkTscbBgHib11qQrPp
 qtGcxCuqB5vTXgNA7BmfEd9tmp/FVSBBQQaoSzYicDG5mY1AVhW9vODdQqHxpzmQXNkj
 m4Q6J29deLaOKZpIZyUDM2cNvCgmQV4LSG6Pwb+bcIsAmv5keDiTq9e182VWfBO89mGB
 eAW1NAKYddx3wEuyO7/CIZRXYBIQP5BA9dCyBoC32Ubi0QU/BHFw12DqZrOliiqe2l9/
 CN6w==
X-Gm-Message-State: AOAM533WnQG6QZ4gec0dGgX5SjfBdSj0h+MYQDhpxVfgtdwdywa3pthW
 jblNMRdJr2MYC2dAgUSQqSQwrLTyy5RSIMyMAKcmdw==
X-Google-Smtp-Source: ABdhPJwQXDbqWUPeLTbC5CeRI9I3z7fchT4UiWD2mQAInmdDfeB1n/lMV05DAx2AdM1cIee8iuAMlgLiMMne7h40TPg=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr4817048wmq.59.1634635357474; 
 Tue, 19 Oct 2021 02:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <1f62fdbd0dd9298a19c491447a4b415a8ef3bd69.1634630486.git.mchehab+huawei@kernel.org>
In-Reply-To: <1f62fdbd0dd9298a19c491447a4b415a8ef3bd69.1634630486.git.mchehab+huawei@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 19 Oct 2021 14:52:26 +0530
Message-ID: <CAAhSdy0Rp8gf_OHy-qi1aDhCouMXYe_4qcFUUZkZCs2BCRPNog@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] Documentation: update vcpu-requests.rst reference
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_022240_343456_EE3C3A40 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue, Oct 19, 2021 at 1:34 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> renamed: Documentation/virtual/kvm/vcpu-requests.rst
> to: Documentation/virt/kvm/vcpu-requests.rst.
>
> Update its cross-reference accordingly.
>
> Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

>
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/
>
>  arch/riscv/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index c44cabce7dd8..260ce0779a32 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -912,7 +912,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                  * Ensure we set mode to IN_GUEST_MODE after we disable
>                  * interrupts and before the final VCPU requests check.
>                  * See the comment in kvm_vcpu_exiting_guest_mode() and
> -                * Documentation/virtual/kvm/vcpu-requests.rst
> +                * Documentation/virt/kvm/vcpu-requests.rst
>                  */
>                 vcpu->mode = IN_GUEST_MODE;
>
> --
> 2.31.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
