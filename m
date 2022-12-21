Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3F2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGxebGcdv0wUFxZi20vWOMMGrJu8koV8mtKKY57YfOY=; b=xNeii65+zvDzCa
	qkMsCpeWQ2mltHK/9dOE/6yK5pnVuG1d9QRhaalDVVhaTCvwWfngJtX4mB1cCFFAwNPmreTAembId
	fL+GXD7IdRUHNkAVh6Z8jxRboUIboPH4vCwsyPn0GK/dVszmF2BerZq6gUigH2vSZ92p+oL/KcbVu
	VXcu6iSRcP53xXZBEKtRcniQouzWbW5uUtM1c22lR0EEQxna4V1sAMwAMpU2yg8kAZHfuK/HAgEGh
	3vRpaKOChefeFN73PqF6KIBxQNl7X7oHwiFG6fYccEXkjuykqBmllsnMzxzw1667dESELPKyFvo1l
	Xzak8BB+biWcQXFCSC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81n1-00Gy6r-11; Wed, 21 Dec 2022 16:17:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81mU-00GxpV-7T
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 16:17:23 +0000
Received: by mail-ej1-x629.google.com with SMTP id n20so38101375ejh.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 08:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jCNdpn8GFI0Is0z/59JOfTTLADKxyB9PigrVleL5rjw=;
        b=kT6xmphJO5ckl4v315yHsSmQHcwASgIJXMzJk2vYFXsiWtX3G5cNYoGZopxeEpgm0l
         j4u4NL6qZs9ltnFQXoZa0EulkCqDv7ZCWH2M3rgm2SubHiIkBAiv8qvsIuJG6CeZCkhA
         QA3A5j3KCBWimYhomSVUROCw67iuuJVNxZdxxMVn5aaiAatF+Rdy43Y26tgeL/7mspz1
         jj5HUxWr/eO1ErC6b1ZN8PoVLTH+jX+4qr8gu5Q2Wpr+CXplyNuPaQyq4XFg1XrcLc2v
         i2vOAOmhx5KNBsiX7BulEtV1H0o8Kk6mBFdvYFwvlHUOe4F5BOg5Z9RBIKpNQ3k8xgHH
         r5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCNdpn8GFI0Is0z/59JOfTTLADKxyB9PigrVleL5rjw=;
        b=spTNaMBu35VdVH584FsM/Er24NA+pNnW3POUVLd9htZehGHQ6Jy1TpHrMQYRFsWa/N
         S2Y0Ca9WrHHdLeKaMPppgNy4rtU4Yll65FMeGesVCeSIUkKFYIN0kSUd4Q+bEhG7F5L0
         6VxEQDsmUJjWMxnJyO1acL/5GwVBNstp8FvZ5x3nVygveCe5ktFVInSOxH6Dm/1laVLb
         nKYcf5g6RFlcc7/+85cqmgnTHi8VYozfAvtrdjxnlwGuHv2GVIYxPjQRueEOycbLyXCm
         O5gENZZ2WEsbkK2VbI4Ft/tNF5jmaitBHoybrwpYQgjh/ECBnz8qViKFnhCmyOQ6M7x+
         oKAA==
X-Gm-Message-State: AFqh2kr1LS9sVm/Gwmq5/xZaGB5tE96VcDjUcHKjzxqkx8vUw3hQ9yIV
	CI+hbRNnKheSPWCRfXOqVr8qBmuqwn1Oig5VuMs=
X-Google-Smtp-Source: AMrXdXufU0qozuoKGH10DXoaVrf/cwlEjKCmPjC3df92wjSI/A87tF6JB9gDwWTeTRvO8P9lVIxPXMLCiehSmhzeUtY=
X-Received: by 2002:a17:907:ca14:b0:7ad:d7f9:1f88 with SMTP id
 uk20-20020a170907ca1400b007add7f91f88mr135196ejc.217.1671639438585; Wed, 21
 Dec 2022 08:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20221216185012.2342675-1-abdulras@google.com>
In-Reply-To: <20221216185012.2342675-1-abdulras@google.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Dec 2022 00:17:07 +0800
Message-ID: <CAEUhbmUsFt0H-Dd3XHjuk6sUq0hrV9SFU=1jD2LQ10xywZOZiA@mail.gmail.com>
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
To: Saleem Abdulrasool <abdulras@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_081722_345434_46A2BEAD 
X-CRM114-Status: GOOD (  17.81  )
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

Hi,

On Sat, Dec 17, 2022 at 3:12 AM Saleem Abdulrasool <abdulras@google.com> wrote:
>
> The compiler is free to generate vectorized operations for zero'ing
> memory.  The kernel does not use the vector unit on RISCV, similar to
> architectures such as x86 where we use `-mno-mmx` et al to prevent the
> implicit vectorization.  Perform a similar check for
> `-mno-implicit-float` to avoid this on RISC-V targets.
>
> Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
> ---
>  arch/riscv/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0d13b597cb55..68433476a96e 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
>  # architectures.  It's faster to have GCC emit only aligned accesses.
>  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
>
> +# Ensure that we do not vectorize the kernel code when the `v` extension is
> +# enabled.  This mirrors the `-mno-mmx` et al on x86.
> +KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)

This looks like an LLVM flag, but not GCC.

Can you elaborate what exact combination (compiler flag and source)
would cause an issue?

From your description, I guess it's that when enabling V extension in
LLVM, the compiler tries to use vector instructions to zero memory,
correct?

Can you confirm LLVM does not emit any float instructions (like F/D
extensions) because the flag name suggests something like "float"?

> +
>  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
>  prepare: stack_protector_prepare
>  stack_protector_prepare: prepare0
> --

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
