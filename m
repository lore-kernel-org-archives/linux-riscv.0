Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1988C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Dec 2021 04:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h83Eo8W2McMyS4+pumCOjCeuswAzrs96ikEPbRNVZSw=; b=fuY4qp5E2x160S
	87S4qyNQpNl2qsvkoKfnIzOekRMcS6xH9l9Jos+rmdLhyxAo1EqRi2FLvIidD0Lpj7zLlm6/K6imb
	6urG3RvbPLQSYEeSH9hv90oRhRJ4GHdhKtydGUQ6uqLkKY9A8VhVNsi4ISW1lInE91/mmhCsSmCXs
	HRb6m0hazh6QGEpKgbyCi0gwACiysSshDN0q3GqlPr0sLCUfrkWVTOdSCPK6rhQ9gb4KjVbkUkRt2
	pTnBnEucL/U76WTi1jv/S8h4t1lg5yQLeKHpuNsPiw16Qj1VxQCxbUSqqosrajZzhssYCyq2PjQrQ
	dkyG11Cp8LGhX8AxdZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Qye-002FBJ-2p; Wed, 29 Dec 2021 04:54:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Qyb-002FAd-8n
 for linux-riscv@lists.infradead.org; Wed, 29 Dec 2021 04:54:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id d9so42200940wrb.0
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 20:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rlm3vUo0MQD10Nfuop6R5xGZgij7EsZMZoiT0qnEXeI=;
 b=m3Do4SYz25wMSmHOG/TeKjXZT6c26hqjY2mLYV5UsPibZetcspnPPsrHAUp8goZ5eP
 po7g/w7mxGzCKvo0U1FBF0MvAEHqhPfBxv9sECO33A7wuwK9QhxumMJAEcJ2kS8SR2Op
 C1E3rV8NUlhugoBssiPfJRRExiVBVKz3GHmLdQAudRxoeYLD8Eq7jqerUMOmwd+x+Iqz
 U+tVrjG4MWmUGle4Ruj5z2kcFIn/VFzDNoCjg/b3QddXgOc3FTxItOn0RqwLa0ch/CMv
 xFDasyvXBGT85monbxSNANnqEDHI8FwE5aopzq1WMfdiJ5lnKssT06PPJFGzqPD6zrzm
 3cgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rlm3vUo0MQD10Nfuop6R5xGZgij7EsZMZoiT0qnEXeI=;
 b=Xphqelnv9kdB+WV7eHgIKqvl7PjKC6jSb1Aggi2dWwGzh8XnCowGNofnx5jwGqXWX0
 k9TK6VNaDPBaWeRnQVEjTrxazhHqMcw0K6U3cRugUeEkkCp5fNMAtC3O0SpwCtJyakwO
 +6L60OdZ17LNK7cBaCdUTKyVP8Qz0RdiIJJYHRgfYCbKuryuBq4FvoAy5Z99m9TDAIaF
 0UPEXAXru3XVvAO9c6YcVpqs0JCyfA6oIrxgj0Nc2nEF4YpmhcLswWKbZ7IH2mM/HZCe
 lSHsaD8DqED4WusXMbpnnVf57HTPDBjtuH1V2CZ3Bg9XkW20/vMQoOTWLmkfiTrNS6wI
 H8kA==
X-Gm-Message-State: AOAM533KVZ7uOWHPMZgLUitnjE/6t0YWnmfz2j36IBx4NTl0Z5BSenoa
 ossSKzXKRG4l8QQOeXNp7CbKAczjhuUtc/qidtWlJg==
X-Google-Smtp-Source: ABdhPJza6zQ+oZ2vS4W9y5rWE9BNHGM9ItmCRwxboZtnUPrXcJvuzhyneUXfl3Z8+PFJfAloUC7RQS810ccctrqnPV0=
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr18893358wrd.346.1640753651613; 
 Tue, 28 Dec 2021 20:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20211227030514.1426-1-vincent.chen@sifive.com>
In-Reply-To: <20211227030514.1426-1-vincent.chen@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Dec 2021 10:23:59 +0530
Message-ID: <CAAhSdy08bkEDp7xzgzeSjJx6sCZRHaym5ZJS2u=82=LqVTrxCQ@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: RISC-V: Avoid spurious virtual interrupts after
 clearing hideleg CSR
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_205413_399120_F5C118CF 
X-CRM114-Status: GOOD (  17.55  )
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

On Mon, Dec 27, 2021 at 8:35 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> When the last VM is terminated, the host kernel will invoke function
> hardware_disable_nolock() on each CPU to disable the related virtualization
> functions. Here, RISC-V currently only clears hideleg CSR and hedeleg CSR.
> This behavior will cause the host kernel to receive spurious interrupts if
> hvip CSR has pending interrupts and the corresponding enable bits in vsie
> CSR are asserted. To avoid it, hvip CSR and vsie CSR must be cleared
> before clearing hideleg CSR.
>
> Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Queued this patch for 5.17

Thanks,
Anup

> ---
>  arch/riscv/kvm/main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 421ecf4e6360..18e7a979740c 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -58,6 +58,14 @@ int kvm_arch_hardware_enable(void)
>
>  void kvm_arch_hardware_disable(void)
>  {
> +       /*
> +        * After clearing the hideleg CSR, the host kernel will receive spurious
> +        * interrupts if hvip CSR has pending interrupts and the corresponding
> +        * enable bits in vsie CSR are asserted. To avoid it, hvip CSR and
> +        * vsie CSR must be cleared before clearing hideleg CSR.
> +        */
> +       csr_write(CSR_VSIE, 0);
> +       csr_write(CSR_HVIP, 0);
>         csr_write(CSR_HEDELEG, 0);
>         csr_write(CSR_HIDELEG, 0);
>  }
> --
> 2.17.1
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
