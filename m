Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8176C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTf9Y+etXFN88W+IBgeQ5J3mUPzfXSBC+WNRlKT13WE=; b=ZeMNo7Wyhnu7A7
	NAY9mKEJWsbz5FOKOSqBzutXBDbS11Dz/RG5xrEzBU/YNTA2ZOwN32rNm/v1Eg8YA8WYFdiVQm+0J
	FlQS4MDUkdi5ruj7GqgUipnjo/0KwQi8tWMaL4qj4C4zCY+6gb0GXz02zFNDUT/Q1FcrM8YJAHBBo
	sSTXW6GTGt+a4mqqvfbFHbkdpItHMUTthjIL+8b482INcT5PaDQDsdBOzGrp5NywCsE1mZ6oehZJs
	h9Pkjqxu2xpxVEhRx2drMxeplWPy96QFMi8HCkdu5a6bnpltLS/qAIv7NkvUWsz/f0yh7q7i0cpwg
	MtpxnOarXY3tiGTfj6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZkq-009vGF-1S;
	Thu, 03 Aug 2023 14:56:44 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZkn-009v9l-0E
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:56:42 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a76d882052so399339b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691074596; x=1691679396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9hyFp+WOW+/vd01e2wQ2PJhYLg5FzB78DSPLaMZwJJc=;
        b=LM+vjonnFE2mN6DKBgGGnuIBMg+KyZq8ditO7F2DyWQOF9cbbMjPrISPG8/ISkAU2w
         /uU93H9qVn9Q1OOe54CqM3dsdI8DAQJpW6inYpLxDQ4mpAtiwDcQ9Z9rzlhjZ53QS4Fh
         TZHCI9x5zbiIRAjNWj05tsGo5+3jdHn5Z1MoYMxFaVyHuK9cpLupfKORwCUcAgUFtpJq
         7aPHeVsTrVKNFmy/KoTyS3GS9CtCwzl7B7dLXywap2r6PiGx1o3XYv59vCJumDvE+w+U
         bwiA8CZoLlhovg08C0F2ND5peG7dm/h8SnQp0IouxgdIlMCUPDREYYrM2rA8WMa7Ui/h
         rrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691074596; x=1691679396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hyFp+WOW+/vd01e2wQ2PJhYLg5FzB78DSPLaMZwJJc=;
        b=dm12zL9ToC8YqcmDTA9cTmIdXkBT/pE2ouICAGNHs9SKgawFPz2JZ5m9CXU4CykO6m
         n8omTb0yZTn4B6GvSPjolZtyj+DDHFXA05o5IaA1oW7DSL6PdZgx9jqSjjeYyd87QizB
         r97XfQoAznA9dHp+wiH4xrNZJAIwpfo0kH0Qc60UlEoT6H3ZV0Qf4/cq1uIBS/HB9vPM
         VIFgOYk5FmUFS0yJe3a6m9cgJieHuCbJ3lWEpocztmjyDaYVbMi7i+QRJZG/ndZ5gJ2o
         B6eAX0SFKtk+2JYxr+wdSkRCCoR19qgTITTaLab7YhX5+LKIVVcAoCrRHysXMsZvD+oN
         aahQ==
X-Gm-Message-State: ABy/qLboGtJnEFN3Xn8bBwn/1OgvUtfhdcqxcm4wmipWv5e0dJ8cKdzS
	/LvVZDQ6q0IxZEhUNwsZCirQrA==
X-Google-Smtp-Source: APBJJlEzXXI3/ZLMBVq6Rkf2ep5w01HsOd8PK0JmrTvxzzjQp8NND2XQF0tUmpYGZgDbswWqNYEcng==
X-Received: by 2002:a05:6808:1a17:b0:3a7:458e:3df4 with SMTP id bk23-20020a0568081a1700b003a7458e3df4mr12354106oib.56.1691074596615;
        Thu, 03 Aug 2023 07:56:36 -0700 (PDT)
Received: from [192.168.68.108] ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y6-20020a056808130600b003a7543bb635sm401034oiv.22.2023.08.03.07.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 07:56:36 -0700 (PDT)
Message-ID: <b7ac5ba8-63f0-ca47-aa64-cb634e0fb33b@ventanamicro.com>
Date: Thu, 3 Aug 2023 11:56:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/10] RISC-V: KVM: change get_reg/set_reg error codes
Content-Language: en-US
To: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: anup@brainfault.org, atishp@atishpatra.org, ajones@ventanamicro.com
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_075641_113788_56305EFD 
X-CRM114-Status: GOOD (  21.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/3/23 11:00, Daniel Henrique Barboza wrote:
> Hi,
> 
> This version has changes in the document patch, as suggested by Andrew
> in v2. It also has a new patch (patch 9) that handles error code changes
> in vcpu_vector.c.

I forgot to include a diff that Andrew mentioned in his v2 review:


diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c88b0c7f7f01..6ca90c04ba61 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -506,7 +506,7 @@ static int riscv_vcpu_get_isa_ext_multi(struct kvm_vcpu *vcpu,
         unsigned long i, ext_id, ext_val;

         if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
-               return -EINVAL;
+               return -ENOENT;

         for (i = 0; i < BITS_PER_LONG; i++) {
                 ext_id = i + reg_num * BITS_PER_LONG;
@@ -529,7 +529,7 @@ static int riscv_vcpu_set_isa_ext_multi(struct kvm_vcpu *vcpu,
         unsigned long i, ext_id;

         if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
-               return -EINVAL;
+               return -ENOENT;

         for_each_set_bit(i, &reg_val, BITS_PER_LONG) {
                 ext_id = i + reg_num * BITS_PER_LONG;
@@ -644,7 +644,7 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
                 break;
         }

-       return -EINVAL;
+       return -ENOENT;
  }

  int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,


I'll send a v4 including it. Thanks,


Daniel


> 
> Patches rebased on top of kvm_riscv_queue.
> 
> Changes from v2:
> - patch 9 (new):
>    - change kvm error codes for vector registers
> - patch 10 (former 9):
>    - rewrite EBUSY doc to mention that the error code indicates that it
>      is not allowed to change the reg val after the vcpu started.
> - v2 link: https://lore.kernel.org/kvm/20230801222629.210929-1-dbarboza@ventanamicro.com/
> 
> Andrew Jones (1):
>    RISC-V: KVM: Improve vector save/restore errors
> 
> Daniel Henrique Barboza (9):
>    RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
>    RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
>    RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
>    RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
>    RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
>    RISC-V: KVM: avoid EBUSY when writing same ISA val
>    RISC-V: KVM: avoid EBUSY when writing the same machine ID val
>    RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
>    docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG
> 
>   Documentation/virt/kvm/api.rst |  2 +
>   arch/riscv/kvm/aia.c           |  4 +-
>   arch/riscv/kvm/vcpu_fp.c       | 12 +++---
>   arch/riscv/kvm/vcpu_onereg.c   | 68 +++++++++++++++++++++++-----------
>   arch/riscv/kvm/vcpu_sbi.c      | 16 ++++----
>   arch/riscv/kvm/vcpu_timer.c    | 11 +++---
>   arch/riscv/kvm/vcpu_vector.c   | 60 ++++++++++++++++--------------
>   7 files changed, 104 insertions(+), 69 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
