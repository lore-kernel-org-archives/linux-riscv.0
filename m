Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5DBC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1b9N5IOgluGz8oYLL+4l1ICOGbjrlDFE0lC432EgcxE=; b=xjmFryZSHsCXlc
	yKYqpJgaaVRTsZcDH3lPKtKAEnvdqj7SNqHOskyXA6YGg/6+nPIilVAdY3Xo+9YZfrWnTqS0k0Hzb
	v0HMV9irRfMhmYKsjerSxeJ/PQjM+WgY3WkfyivGhGMaPs1XsFKy8JslyP/0ZZ9qFLjbkMiPT4Snl
	xmN7NcokSKJINng1O74HBlKzkNpFk8V/RVhtujyPiug9cRY6Ppz9sYFAqaeFOefQ8e/YWuzDrmxOa
	UVshUgRVKN8AQ4oElXVUKwvZNaUde7HCjplh6aBKHXulf9tsqboxEeuIPw0dZ3uH6UpJi49U9J6z/
	55XW45L9iVXIixQNY9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmF4-006oD1-IF; Tue, 31 Jan 2023 08:43:50 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmD8-006nNi-5m
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:41:56 +0000
Received: by mail-pg1-x536.google.com with SMTP id g68so9514602pgc.11
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6BBDoy6ggwb6qGNiyOkTSoxV/P1y2lqshZx72I60wlo=;
        b=uIaXYVGWKnxZc25C7CLiMyGFtVeByyD1QJsgjdJXwB9VvmoQaFybtvyRapC8CYSQGK
         PtbfFjN/JBOlpYrmNdzMsZY+oNnTPWdkJNyjZthniC2L8ym/4AjIMlfVE71P00O6DloV
         82i2+z839gMZd41eyaCTC2aJYQyicnCHKnAYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BBDoy6ggwb6qGNiyOkTSoxV/P1y2lqshZx72I60wlo=;
        b=HxjNKJjcMDLYtrdHqu2PbJMuoSv7WHFW6wxG2k8F5XdwrnJFWwhZTBQpkJ2HQvWiGW
         Onf6Ulzr3kYvUnmTa7BnoLTPiX3NEfGe1d/wUds5a3Y1n6blZ6TVMDwvu0o5LFuno1RD
         ne3RRTZmCXUJPglGj2CdmB7zAHwa4EEKhfEzuPxkATNpEOq3n1Kj4eNNknNtnATE2ohB
         uPEPmOxDDwgDtaM32wW7R442iwoQhl4As921G0W/IAM4bkkk4H4hWQ8NywE4zf9vPsV5
         obtpV2vac0zQ9vfMmbWQW013K5wy3OPu4NQxY7DIUD+2YEUQtgiVUnUm32qGDbGIGeBD
         98GA==
X-Gm-Message-State: AFqh2krGXMOM5kYAbfRWeXJ+UxA0ABUf2r9UJ7qoj5Bq3vTKoPIWO6xY
	KIGXW6yU/PxD2OhjIra6U07QmOgB/TxbSh0TEqY/
X-Google-Smtp-Source: AMrXdXtZxYxyLa7B2DvS3Eia4Iejwao+ygD4HHLiTQho/V+PX7kCCCat31riNZKHj49IR33cbI1qEhMhFE8AQHL+KTY=
X-Received: by 2002:a63:105c:0:b0:483:f80c:cdf3 with SMTP id
 28-20020a63105c000000b00483f80ccdf3mr5731341pgq.70.1675154507255; Tue, 31 Jan
 2023 00:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20230128082847.3055316-1-apatel@ventanamicro.com> <20230128082847.3055316-2-apatel@ventanamicro.com>
In-Reply-To: <20230128082847.3055316-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 00:41:35 -0800
Message-ID: <CAOnJCU+77AG55TTpekDKYVeeXjpR5QPw-CJ1zQq0ogB_rtP8dg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: Redirect illegal instruction traps to guest
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_004150_485882_4608D166 
X-CRM114-Status: GOOD (  16.36  )
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

On Sat, Jan 28, 2023 at 12:29 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Andy Chiu <andy.chiu@sifive.com>
>
> The M-mode redirects an unhandled illegal instruction trap back
> to S-mode. However, KVM running in HS-mode terminates the VS-mode
> software when it receives illegal instruction trap. Instead, KVM
> should redirect the illegal instruction trap back to VS-mode, and
> let VS-mode trap handler decide the next step. This futher allows
> guest kernel to implement on-demand enabling of vector extension
> for a guest user space process upon first-use.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_exit.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index af7c4bc07929..4ea101a73d8b 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -182,6 +182,12 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         ret = -EFAULT;
>         run->exit_reason = KVM_EXIT_UNKNOWN;
>         switch (trap->scause) {
> +       case EXC_INST_ILLEGAL:
> +               if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
> +                       kvm_riscv_vcpu_trap_redirect(vcpu, trap);
> +                       ret = 1;
> +               }
> +               break;
>         case EXC_VIRTUAL_INST_FAULT:
>                 if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
>                         ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
