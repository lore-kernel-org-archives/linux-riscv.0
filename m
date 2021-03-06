Return-Path: <SRS0=GCH+=IE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79BCC433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Mar 2021 12:12:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E578C6501A
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Mar 2021 12:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E578C6501A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZMGjMujd6cKtWFM2Z5OBd/PWEd+UMgaubUnDXo00Ldk=; b=GsrdlF0cZ3x5gmwQq1DsvXO26
	K+dsBFnHZ+IgnjfDj+e89fhJXG6jCqN7ETSBlA+izgHhRA7GbIDHArZPdNneLLoQzLQxICfXa72ie
	rc7rXWs2/NIrhr5No3QRDJaHUCjIbQ69QezK3ILEpNToW+15vriFiV94GmQue5X0t/ASGy7ISgPt6
	dXpADz1XSjhLVlumZS/r70atlG0k/8FhMrc+RxOkHBoAIQ0X+SxYz0t2V3DVKQnpciS+3YtqSFaPx
	vkzoIVsdGbETUM6CqpbRt3P3YuEX0HjtdesdJa9d0jWBKORxSQijniB76JgM714axM84gqo3QcTjb
	e8gA6jVwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIVnB-0030B8-Q8; Sat, 06 Mar 2021 12:12:21 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIVn5-00309o-TB
 for linux-riscv@lists.infradead.org; Sat, 06 Mar 2021 12:12:19 +0000
Received: by mail-lj1-x235.google.com with SMTP id u4so7905561ljh.6
 for <linux-riscv@lists.infradead.org>; Sat, 06 Mar 2021 04:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6SCt4Ui+oWB0RLaz7Uoac380htVeaF4ZyeG6ZlsBEco=;
 b=qfWkCZuD2BO4ofIxVsNQP5WrvWYTObPEsUcMNlZWxwwg+35XoltNPXcJPnjtSKJOoK
 dQaCUQ+zt9CnUXReJXpUGv/8CsURgGFdc/Qybwmon/0K2QU6hOo9VAVQ1DtR6EllPJS1
 R7lwXk7y6mo4J3GyAjeRJ61XM25j7uVNUI8wqrGr6noXL/dwyzEDmLjizZpVk5bQGcyo
 KcodKupdksLk3XKqFtpJezNxReg0J2DDGMAlcsjlYddCX+iFoTVms3TiK4VER2pTPOXK
 RfCYgmWGRFHDcAYLPTduWQTGooNMSxQbbJaecWotoXv3/i0nj9jC2pGRsozckKhfU4QJ
 oYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6SCt4Ui+oWB0RLaz7Uoac380htVeaF4ZyeG6ZlsBEco=;
 b=brBQfT5WAzzZozH6CzPTdveXdVNclos84PTdQ6ywKDGBg6d7OY3l7UWFcYupII3TQ+
 McySDJMBYqeGvdu6v5VPdstSIss5kLX9HQi50CiUIdkcd0DKyMasANVkzdH/Vz8fEYr7
 6s0CJX0Va0atWp2h2fSDShFgjT9h2jQcekLO1oboxhdhVAUjHzoMnqy89jsr0WuZZIyT
 U7xGC17Ufsoe6ChCm4P6wJmmBkIfGliGpqn6tOuoBKufKgQaUrXTqr+Dk7stXKR+5mDa
 wrBOCZN9X4It1n53whYUZ7CPf1iGM0vIO/5cz87UfP1JeNJnllANb+rLEL48rfD7w5iC
 lNwA==
X-Gm-Message-State: AOAM533LmXSOabfhDiL71IQJ1OBTjKiCGKXWdezjuJzojk4Y/PACwRYK
 ARn47/L9j7BPqM6V6vtCB2NXarv3+A9vlTLPq4uqeg==
X-Google-Smtp-Source: ABdhPJxPpRrEZQliL+YGDZbV1sZiRba3nFEAEVdEh/J9SksORZ6w0Sev0ZM9XKRdfSOGSEAhN8lREi2We5AiXXbZj6k=
X-Received: by 2002:a2e:9250:: with SMTP id v16mr8217453ljg.162.1615032733450; 
 Sat, 06 Mar 2021 04:12:13 -0800 (PST)
MIME-Version: 1.0
References: <20210306054801.18263-1-xypron.glpk@gmx.de>
In-Reply-To: <20210306054801.18263-1-xypron.glpk@gmx.de>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 6 Mar 2021 17:42:01 +0530
Message-ID: <CAAhSdy08=ffPe+fYWX9ds4wNSMU3uzT8OENk0o93xpfZOKtYig@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: correct enum sbi_ext_rfence_fid
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_121217_320080_82C7E70B 
X-CRM114-Status: GOOD (  16.03  )
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

On Sat, Mar 6, 2021 at 11:19 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> The constants in enum sbi_ext_rfence_fid should match the SBI
> specification. See
> https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc#78-function-listing
>
> | Function Name               | FID | EID
> | sbi_remote_fence_i          |   0 | 0x52464E43
> | sbi_remote_sfence_vma       |   1 | 0x52464E43
> | sbi_remote_sfence_vma_asid  |   2 | 0x52464E43
> | sbi_remote_hfence_gvma_vmid |   3 | 0x52464E43
> | sbi_remote_hfence_gvma      |   4 | 0x52464E43
> | sbi_remote_hfence_vvma_asid |   5 | 0x52464E43
> | sbi_remote_hfence_vvma      |   6 | 0x52464E43
>
> Fixes: ecbacc2a3efd ("RISC-V: Add SBI v0.2 extension definitions")
> Reported-by: Sean Anderson <seanga2@gmail.com>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Good catch.

I guess we never saw any issues because these calls are only used by
KVM RISC-V which is not merged yet. Further for KVM RISC-V, the HFENCE
instruction is emulated as flush everything on FPGA, QEMU, and Spike so
we did not notice any issue with KVM RISC-V too.

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/sbi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 99895d9c3bdd..d7027411dde8 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -51,10 +51,10 @@ enum sbi_ext_rfence_fid {
>         SBI_EXT_RFENCE_REMOTE_FENCE_I = 0,
>         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
>         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
> -       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
>         SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
> -       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
> +       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
>         SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
> +       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
>  };
>
>  enum sbi_ext_hsm_fid {
> --
> 2.30.1
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
