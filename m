Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAD2C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 07:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=driav+7IA8Hb+8vXHuVan93pVw7LO9qDCIF2OHETikg=; b=FU0sDkGd3FZmDn
	ua2Ph104484pIjN+Pby09hcJamrCf4HbK8BUA8IbfkClbU3zTvu3oeZjNDZqiB/L+sqEYJKMcOerb
	I0o6XUGf2utHD41v3WUdXyRlGLYokRxwgBuTGAq+zrkCX8ov2cfoF38lyfh80lQKM7mD9zx1/d0ld
	ReX972t3TCDRyJAOgWnwT26Y6JGMKiyAgE+0Sb5b8Z6MqUtytIqANHuF8TkJy8sxSGq+NRxnDSPVX
	RO+y0AV0FLeATtnIIbth63cz9imn9QorQfPx8IaZE7itoigTH+319holAQTKWbHAot/rEWMFfy8+V
	eKlew54FKebLcpUeVhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBWcm-0018qf-2g; Wed, 13 Jul 2022 07:17:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBWck-0018pi-6h
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 07:17:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id z23-20020a7bc7d7000000b003a2e00222acso1795080wmk.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k5kXHTDFVYMTb/KL6d64TfSYQCRtszFFm4Qkgo8IFPA=;
        b=iG+Kn4OTzlr03gdOLCLpqpkfea+kNa7p6xYpZ4zgWe9fvBAOuxydUSO2PcKfXhXYKs
         zfjHkJRgPW6w6YHjaNiJzD8uLQP7wt4v9nkrWCMm1EIzv83N+gBr1oOLkH79CzgVLcKW
         ZO5AYiydzTAKTQ3Xe1qXKatG0VPafTarY370XoBwFaOwLJCEI9TPZfE8nvCwlLGjzhAJ
         SC+0fwmU/ShGcMHnah/LCLL33d7zd2isB8ksB6a8iHJ4/pa47WR1twLicaznfXeGEyKL
         B9gdEi+Qm49XUeD1W36tJJY3dLYo9zQHd/HLexg+yHACdb7gCDqq9ezxnVlIMZ6ACvXk
         A/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k5kXHTDFVYMTb/KL6d64TfSYQCRtszFFm4Qkgo8IFPA=;
        b=8HT3SQ6WyLLMG/rXsvNl02tGQlT1/+ksZBpzDY+aWUvPyNeWobgo4oV2avy1uXWi5S
         iMOFvxjiNK+NrK6zbwRS2/v3p/wRjsJnFsn2dJjF+ADR5o51dlevFtyQr9c55tdeOgCw
         K1exe9JjzgZOI1msUpsJMjVpJieS88y4IRE3O4FcbrqjecxQBiHow4fxouHaZfzrfNyp
         aJnAwlK8PsEBvrQJ2DJaqMW5jbbXUP8uXTHPo8w75mv9YUMxlLcOnQzSiUa9y/12fnPQ
         66ofOXLTuPhRd2oXrsoOCR9hLOlTDlrNkDP9GAD0Sd+p0z2fFk+qEpda8MAW4+W6hHjV
         LE1Q==
X-Gm-Message-State: AJIora9Ym6LyjHTi2k23hchbChqcBKSvVBqT5etfY1sc907YOdMA7pgW
	0qFe+YANq7f7NUmOUjs4a9L5wmx/rpAVjOlENhoV8Q==
X-Google-Smtp-Source: AGRyM1sLwfh1MtLyuU3g6EG1RA2AjYloTJaZd5DKoJkcEqB2mUlYxiEVCUjUHjE30edeaLciJpQVCTeFPojxDs+AHX0=
X-Received: by 2002:a1c:6a0a:0:b0:3a2:e61e:e3ee with SMTP id
 f10-20020a1c6a0a000000b003a2e61ee3eemr7906065wmc.108.1657696645588; Wed, 13
 Jul 2022 00:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
 <01ec025d-fbde-5e58-2221-a368d4e1bb3a@redhat.com>
In-Reply-To: <01ec025d-fbde-5e58-2221-a368d4e1bb3a@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Jul 2022 12:47:13 +0530
Message-ID: <CAAhSdy2gR3dtBHO0Q7+1xgMCytYkJgmuT6xiQ+WQiorQPMRUXA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 5.19, take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_001730_252881_ABEA6AAD 
X-CRM114-Status: GOOD (  13.26  )
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

On Wed, Jul 13, 2022 at 11:30 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 7/13/22 07:47, Anup Patel wrote:
> > Hi Paolo,
> >
> > We have two more fixes for 5.19 which were discovered recently:
> > 1) Fix missing PAGE_PFN_MASK
> > 2) Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()
>
> Pulled, thanks.
>
> For the latter, my suggestion is to remove KVM_REQ_SLEEP completely and
> key the waiting on kvm_arch_vcpu_runnable using kvm_vcpu_halt or
> kvm_vcpu_block.

We are using KVM_REQ_SLEEP for VCPU hotplug. The secondary
VCPUs will block until woken-up by using an SBI call from other VCPU.
This is different from blocking on WFI where VCPU will wake-up upon
any interrupt.

I agree with your suggestion, we should definitely use kvm_vcpu_block()
here.

>
> Also, I only had a quick look but it seems like vcpu->arch.pause is
> never written?

Yes, the vcpu->arch.pause is redundant. I will remove it.

>
> Paolo
>

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
