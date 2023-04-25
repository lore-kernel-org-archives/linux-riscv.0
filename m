Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2AAC77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoP7ImFOJLLf0/i4f3t8b9/xIdgSQvx/bUsRmm9jdJA=; b=G+xJBjfdbzPGFl
	SgviRN5g55+fADsJxyqTDphIFQ1rXc4SxxosYVWRF6a4I61mbFCejv0f4Gak6PJxRIcBNelkntOOs
	5fXwzZHJoUmlNKbi4LSrA1qcIccZEOmdshYtEnwRiVcEHKbbi0QhopsyB/zqHm0wTDvsm3DlVNu9y
	4BQe+v+6Ol9TfiWAh2aioVBsjGIlEgjykLiLnHDmIPH9A55KvK4qHWJRpiRpm9BfkbVuVLL8lhUWb
	NpI3EB8V0jbiq0UaUG6VomBQ0k10ZhOWP7jviwC4gfURmR79OEITtvYu8Qle8E+b58I1kcC7yoPU+
	DSNlZ7bYo3StKXe1AuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prNpl-001zkq-0U;
	Tue, 25 Apr 2023 18:56:13 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prNpi-001ziu-0a
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 18:56:11 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6a438f0d9c9so4741120a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 11:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682448968; x=1685040968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2Pm94d+ETtvQvtSiYGYJJyGRbZetTQzfPQibc7M6Yc=;
        b=A/1BzzgPCHquwzzub4fYSkBDM6XPPA2wvYoeLYloJ5yFvbsR3lfTJtCdpik9H3ebfL
         5HlnjvK0W8RVgay6Kq1v3AMhQ3uwLkm5HidbyrnIxT6/UAW7pilD6LHqy1OLtHZUnZbr
         cGd/9F8Uu6hLtVWvbcEt6T467OqAhIzrewCA22d/8vWoBrLTL2WG8F4zgz2yevK036ES
         2oEeMvjn3ovkWnl3nitvrOSpzE1RH9GAPccMsJv9wCkgO3cYWN31wvVuC4JJjzLP/oq5
         TUCqEiqp3F/N5aVOi14evzoWzVKAxfyKD7ctY/vuVpLF4AN8TJkghqxbfa06jFb1E+XB
         YDHw==
X-Gm-Message-State: AAQBX9e4RhBuZ/73v/0yROqFyp1b7l1Mk/0URurv9bPCK2HQTQgQaNXB
	b3YgG43JIA7ztMj9KILIRg==
X-Google-Smtp-Source: AKy350aq3VPWA15tx1n6E49zmy3RkR1NktVBHF5gEUF8eyy7/Xi1FV1SIuOuPtHLw9y69YkT7Ji2hQ==
X-Received: by 2002:a9d:7a96:0:b0:6a6:4538:dde7 with SMTP id l22-20020a9d7a96000000b006a64538dde7mr6955629otn.28.1682448967987;
        Tue, 25 Apr 2023 11:56:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bt8-20020a05683039c800b0069f951899e1sm6071450otb.24.2023.04.25.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 11:56:07 -0700 (PDT)
Received: (nullmailer pid 2081284 invoked by uid 1000);
	Tue, 25 Apr 2023 18:56:06 -0000
Date: Tue, 25 Apr 2023 13:56:06 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND] dt-bindings: riscv: add sv57 mmu-type
Message-ID: <168244896648.2081233.16478595076932550051.robh@kernel.org>
References: <20230424-rival-habitual-478567c516f0@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424-rival-habitual-478567c516f0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_115610_219052_6C7C92F9 
X-CRM114-Status: GOOD (  13.37  )
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


On Mon, 24 Apr 2023 18:05:43 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Dumping the dtb from new versions of QEMU warns that sv57 is an
> undocumented mmu-type. The kernel has supported sv57 for about a year,
> so bring it into the fold.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Resending with the missing CCs.
> Palmer, you can take this for 6.4 if you want, otherwise I'll grab it
> after the merge window. I doubt there's a rush when it's been missing
> for a year or so.
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
