Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E04C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhLNYxpzTNQExRtlJwuhij/TeM/ov8Gt5hkNhJ13Ecs=; b=X9Iut54FUlG/NJ
	kqMCqfb4rTp8I3JyBNXhr2t+k4srL0+1lrCwIe4m1kyIM6rNb7s2HOlLNj/0R+gdGZmnntWpIGvL8
	trUa6tk45db49X84OJrzKmiPsmuzLp4Di/heGPf+W8gZFSexs6KRZ9qmAzjSW5vwzEp9F4sJ/5W+h
	BNLc92qt9ptJ2NWb+7suzQfHFZ5dN/BlETdlTpr+aMwrNcXEEzYCbLqRgketToSC09ecJ6YS4vMYJ
	J00M0352j5VJsEA8v1K6BUt26foB5qr9nZ5j30hL8n3GG8SZTrQMbvnYgY1UsVlaqqh8c4Nb8JNO5
	T4hzaKq+SVq8G/k+BOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR72u-004M4M-1r;
	Wed, 02 Aug 2023 08:17:28 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR72r-004M2x-2A
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:17:26 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c0cb7285fso467123166b.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690964242; x=1691569042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ldftGtGE3zBMdAsfK66SnrRKaY4BxtS34znrPguj00=;
        b=VZqg9aULNEJ7UAIeUZOwVIpEb7J/gAa6BbzIysq7Qjg2B9i6MmbL+iJ60H+mEFeXwO
         7+xUEszd8iITALIH9uNbRd230JgmuGEdOgIcHcoQXy8XHBMUwuDC0LWzoAky73O0QTDE
         IK88InVrjSBCb7Smd0ockQwMZ+jN0jOJhAL/oUvyo3VLBhj11Yx6rgBjirBPF3gNpvql
         VnLkA8pYwpIQoZHuaaj3iEqDeC9dmb6s5trPnFhpRiNySbdp+i8/UaG7vpEzM2DJLNnJ
         K9GPMwod2L+xnnD7JQwHpzQ/+/yFdbJScFCkjmOQpf5t8q6mbraixrpnNxbtEVKLyltB
         We2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690964242; x=1691569042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ldftGtGE3zBMdAsfK66SnrRKaY4BxtS34znrPguj00=;
        b=Q9tbBUrmalVb2gX6Hgm5EF9D8ZlYKZF/U6iHkbZSxJhLI+vSQylMIDAxiO5buSOBlt
         Xu2kuf0HTMOJDqoLpihTbwUTkdiRwjd3TVarS79hf9qmGjb5HnG+ZIdZdxctUZT0YRpP
         DQqaI1WB7vg3gPFNkG9eFwRiod12oEMAiepGSahg60txmMNLlN3h2FCQIOiP+2Hfoml+
         sIP/FQH2yq+WhBxqaIhQrjunTaGjs94WgPaG3S6qDzec431Gca8KkGBepVpu8vZliRb7
         MXwjebWFM55OhPW8iPjWaB1JFW46RT0VPzakNEotA6T/MIu8MXGl9hzDJwcASAtL/W7h
         aRGg==
X-Gm-Message-State: ABy/qLbo2jXoaf6TfGT0VEHytTFB/N+J58HfH1FEjIUD3aQ+cuALwoCR
	QIPs8nJ/ySzXJzY/WwtMJ+meqg==
X-Google-Smtp-Source: APBJJlE4se+P1KQKrNIWrSJYRpYsIXMW3uMaA4HkJOuaP9fCZ8JPzwkKO0enEcgnoSzjZqUYJquFHA==
X-Received: by 2002:a17:907:7893:b0:989:450:e585 with SMTP id ku19-20020a170907789300b009890450e585mr3875932ejc.45.1690964242457;
        Wed, 02 Aug 2023 01:17:22 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906408700b009786ae9ed50sm8651597ejj.194.2023.08.02.01.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:17:21 -0700 (PDT)
Date: Wed, 2 Aug 2023 11:17:20 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH v2 9/9] docs: kvm: riscv: document EBUSY in
 KVM_SET_ONE_REG
Message-ID: <20230802-4751804e563fb13903ef6277@orel>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
 <20230801222629.210929-10-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230801222629.210929-10-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_011725_728231_99784DBE 
X-CRM114-Status: GOOD (  15.98  )
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

On Tue, Aug 01, 2023 at 07:26:29PM -0300, Daniel Henrique Barboza wrote:
> The EBUSY errno is being used for KVM_SET_ONE_REG as a way to tell
> userspace that a given reg can't be written after the vcpu started.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  Documentation/virt/kvm/api.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index c0ddd3035462..229e7cc091c8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -2259,6 +2259,8 @@ Errors:
>    EINVAL   invalid register ID, or no such register or used with VMs in
>             protected virtualization mode on s390
>    EPERM    (arm64) register access not allowed before vcpu finalization
> +  EBUSY    (riscv) register access not allowed after the vcpu has run
> +           at least once

We allow access (reading, even before, and now also writing when the value
is the same), so this should be worded in a way that conveys the register
may not be changed after the vcpu has run once.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
