Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4FDC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkSugUmUsUW5UOmiiRKjingPFmm5ptdjaxMiHkBRhLs=; b=Xjz4G45LINx40U
	HZHaqJY4IF4DH2wPujkkcEe2wwnZ0k85w9ywyeeflfHlOlDxkEPY3kruT9Z7ELcVec4unkL0FbKsv
	jv4EcF/3Lx1Ls/WwySNYVFLKJP9bwxWU9MfGtnR8j0FN7wQa52ZIbop36w0hmSyTADAlgnz3Se71x
	4rUxYOc24FBeYak3w2DaeheR4CzfgEQqHxugWBpDCyb6b6arCYaisP0nnWcKYSMqgouChvD9nK31G
	4CygLCjZD0bk+e6BTErSz735u+m4/AR10OMXXMiSgHdUCCj5o1p4oacl95toGAGr6FGHEuoQJSqJe
	aNkEj2H3hN2wmf6cAfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVHq-00F1pZ-JJ; Thu, 02 Feb 2023 08:49:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVHn-00F1oX-A6
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 08:49:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id mf7so3906112ejc.6
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=scOOV9S3a4QBlzHpx87cDvuev3VEso20BNEexdmKlT0=;
        b=O3nVgV9gtylTwn60p8kK9nZJZAoCc9Ha3iSF7VeLPJh/boPlEGgsEPEHEFjH8JnJwd
         6tmiA7JTfitRNVs4FO8C0pxnMHwq4vv6sZceQKNZJwi7VUaSVMVWPFml6hLKnt9kcd+Y
         uLwneuso9EiX+opusRuUOkRANvzQqcZqDc3idsjXEGt2My08V6zhbGslYIXHKccK8Pcx
         c8LZpp9pOB0rQT6HQaySWrbs/EMBFWRMArEOPwlGuHPcBgu1CNCVBt8RIc8hVREJ0uMB
         /HdDYcwEVvfwxdLlcgZK8Q72tKxZ7W2tfRsQDTne3VkaW0T4ir1YHExTH9YtstvtmoAW
         ocVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scOOV9S3a4QBlzHpx87cDvuev3VEso20BNEexdmKlT0=;
        b=ahyCsIHwksJQCZT6PoQqvZOAC0p0PJS1ho+Oa/qgSt4VwRbxBDo1+y1n1zmlVRxUQk
         k82uynQVd5lXirCNCLO6YxAhwggz+2RV1nQy3ILOlN4MvPqF0w1CbJ4M12bfAcc58a1k
         aLwlCx8KyYxXXJKYBmJpZ/62YtF1NjQSK9B0/+BQ3nWUVhR/CiabQ/8Gy5wbJY5EmHSD
         EbMTJNfYaujQxCTC2xOVj2TPwu8MlTHeGtVGSFQ0tAWsw3qUPUpNRo4pniKRW5A7n6kr
         uBNMAE2EJoTGmh9bWs3lENO/scTdUQ58Z+/sNa+qFV1zcPcBaP34iXxhmY/jJpMowjIq
         ON/w==
X-Gm-Message-State: AO0yUKX2EMG7rq7DjagIouKRkDTCmYdAcsxkFl9HH7buGt9vAdjxxZkS
	SvAVZ/E+ovgttijB5qE6CMLMpsAfk0jFlkzxB33ZLQ==
X-Google-Smtp-Source: AK7set8SjP7qAzOcTogP1InH1AzFV1lpTeuCw9CVQKwooWB2cjtaB7tzWyOwcOgZfvqWksth3Uyd9cPPqpbjKz4stP0=
X-Received: by 2002:a17:906:1653:b0:88a:7cf5:5d33 with SMTP id
 n19-20020a170906165300b0088a7cf55d33mr1792317ejd.100.1675327774906; Thu, 02
 Feb 2023 00:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20230128082847.3055316-1-apatel@ventanamicro.com>
In-Reply-To: <20230128082847.3055316-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Feb 2023 14:19:23 +0530
Message-ID: <CAAhSdy17dUdhn3ijVzps4J0k=_xH6GWC16CHHJPN_2E7xBwdbA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_004939_600215_9D85442D 
X-CRM114-Status: GOOD (  14.52  )
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

On Sat, Jan 28, 2023 at 1:58 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The kvm_riscv_vcpu_trap_redirect() should set guest privilege mode
> to supervisor mode because guest traps/interrupts are always handled
> in virtual supervisor mode.
>
> Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Queued this patch for Linux-6.3

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_exit.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index c9f741ab26f5..af7c4bc07929 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -160,6 +160,9 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>
>         /* Set Guest PC to Guest exception vector */
>         vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> +
> +       /* Set Guest privilege mode to supervisor */
> +       vcpu->arch.guest_context.sstatus |= SR_SPP;
>  }
>
>  /*
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
