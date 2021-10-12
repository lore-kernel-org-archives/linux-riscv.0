Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFF0C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 04:57:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D2D60D42
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 04:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2D2D60D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncOzSO09kHU9RC4ORCslNifzV56QFWw+qoD7PwwlnlQ=; b=VTKuLClFLhq9A6
	ttD8ItNcfk6dMLBU0XzyQlB8U2tSTvStaoT5pXCBwfw4rl6kbuyqdDGvsUO+LuPu39+1jqVaRHxWR
	26zk/K/HTZReGgNlsmW4cm5fVIhV+6IJ5MCI+v3OGOXE4OUxvFiQKPPBDOTeBt3Bqu+mk0oX1xP+l
	rvIczMAjYz+8TI6m01xkmy4Zxe/J/bP4tQOketw5ANct7hmoGH6aHtlOG93jb55liAmnrZP5JL1Dc
	8XF7oFA1xz+wh789yyR45F9ng/81sHfPbFYJ/T/oPu3RhhGknjSv4JW4H+r79kM4rWn00TyjuHKr8
	Ncdg1QP0AovDujjhUfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma9qp-00BYSC-3M; Tue, 12 Oct 2021 04:57:19 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma9jT-00BVVz-MY
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 04:49:45 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E25574000F
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 04:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634014181;
 bh=DQTYFgRBjShgCc44LIKsX+ZkXacYI29O6N2UU4NvQ2c=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Q/drEbRHsPt9GqL8MDp6bzq+4McGHUXT0BBYYM9rywGtvw5qpwWFAvs+cYA3SvZHT
 lChvekrRQZkJceMnS5zpzU8RNLRDSH9UbynTVbHVfBSJ3gBB+fN4ofgtSaVA5yjME1
 0PAVKtR8TvqwUjo2HutuiUqmqOgA9pZDN+BXzjTM50Xg/SU25IvARY4Aqd6GiikHP5
 ysbtZZyfJ7D12wW+XuKDuaRRUG1JtmLT40G+nhmkrV+SQIDKHGSRpy0TrTFpYroK1X
 nnS7/ucDNAbsJfmjGYGDXbbGZI2+MRkqagfUfnVK6C18gibHvjHiOMuAkNpMpxwt7Q
 dO5syeuCPE7Ow==
Received: by mail-ed1-f69.google.com with SMTP id
 cy14-20020a0564021c8e00b003db8c9a6e30so5380283edb.1
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 21:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQTYFgRBjShgCc44LIKsX+ZkXacYI29O6N2UU4NvQ2c=;
 b=n1e6veKkfRvJU0xI0TNO8r3tuk3J3k/sqbRdyDwxSYMmGAR4/ljzrqu050wFDdIQF4
 fdpGMKLx+gAlxgbdzJr3AScvavwGryOpcJtwEV4dgEL+eKOVsnKpY/UYZT7leBJQnDWm
 epAcEncK1WZxujQTSQzGungQCNFwZPpePltuRUHjk8/lpv3unqln1xUkeegOQH7oqVF9
 cTKV/Jk5zzLT57johVT4hej4nRcbUbnEyd9KNdbHZKyhyu13MLC1PhctxMYL/8zoHaXD
 ZBgnMGGrD4tKTmL/F1CIF8w+f/KpggrxoufBpO5Z+vWsFh/kKO3GTzhMq3hbTr50c6YQ
 ZEBw==
X-Gm-Message-State: AOAM532m/rMUE8i3afdpQHVFrUx2lly359kuaViKA5zVzdne7bUJE2tQ
 5zvdw58WF1srsiFq8jI/qhbLRVDfhXe3Xhl1ACDTvhkm/TedgFcVwqL4jCvbN+dcmfD5v6HVTP2
 f2M16l4e4ltq4kNdRijrz91IYTCTXMKRN46z/bln65TxKuxExc6auUObqFZKP4Q==
X-Received: by 2002:a17:906:5a8d:: with SMTP id
 l13mr31820109ejq.95.1634014181400; 
 Mon, 11 Oct 2021 21:49:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTsvZiY9lixAtDhIJzHvONlvktGzyfRy9ZhG9KGRllcgbenZcXXrCZUfA21DF2hwyZpsjXAiUDGxByaRarDis=
X-Received: by 2002:a17:906:5a8d:: with SMTP id
 l13mr31820091ejq.95.1634014181236; 
 Mon, 11 Oct 2021 21:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
 <20210920130412.145231-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920130412.145231-2-krzysztof.kozlowski@canonical.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 12 Oct 2021 06:49:30 +0200
Message-ID: <CA+zEjCs6i7H9DWNmG5FDtJM0V5vCMUbUbianFEr+AeLPKnUVNg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 5/5] riscv: dts: sifive: add missing compatible
 for plic
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_214943_990523_E874AA9A 
X-CRM114-Status: GOOD (  17.65  )
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

On Mon, Sep 20, 2021 at 3:06 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Add proper compatible for Platform-Level Interrupt Controller to silence
> dtbs_check warnings:
>
>   interrupt-controller@c000000: compatible: ['sifive,plic-1.0.0'] is too short
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> ---
>
> Changes since v1:
> 1. None
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index 7db861053483..0655b5c4201d 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -141,7 +141,7 @@ soc {
>                 ranges;
>                 plic0: interrupt-controller@c000000 {
>                         #interrupt-cells = <1>;
> -                       compatible = "sifive,plic-1.0.0";
> +                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
>                         reg = <0x0 0xc000000 0x0 0x4000000>;
>                         riscv,ndev = <53>;
>                         interrupt-controller;
> --
> 2.30.2
>
>

This looks good to me, you can add:

Reviewed-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

Thanks,

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
