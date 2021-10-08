Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D032C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 02:46:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D94260FC2
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 02:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D94260FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pz597H4ka8pdc+AcpC9MadQFKeMmDLSKajG4zSoHd74=; b=YG3UkxiNQqqDxD
	tPV/M2gz8QC5G0sIE7mMvwXTllEfY82WkNmrK5t++TIfUcwt+MEHjZ+DD6I2SIzdifhewzycT2wbh
	J5oPnWGUqTxYJ87h/zPhOv60ivFiuozWon5T2X4V9mtXE0kn+mqnaJqcodjirullDxac+cGeUvN2G
	RwxldPtSpeuwAtoxugvy16cIkr6YK7929YOnalr6hrPaVK21adrUVPm1Kb+ZZ904Bg+l5Lo08ULWo
	arSOtFFHQf+qRn+Q3Me71I7qdw3AI3jHp0gDKn/MDBDSHPPwZ7UD4VDXWRhvmxTiy1a4a/pJ6KQpB
	/0t10uAnzpd5ShVJKPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYfu9-001Lgp-8T; Fri, 08 Oct 2021 02:46:37 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYftt-001Lbi-S6
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 02:46:23 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so10071199otb.1
 for <linux-riscv@lists.infradead.org>; Thu, 07 Oct 2021 19:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZiN7i9gSKdNstbHdeYWwXVbEFyTvnEpUijhN0u+SjzA=;
 b=p6wD+oSQSxFxi+Xva56ahVKlbbmn6Pa5EeaUVQNRo65WDBR5P4zYfBv2X3rdaRu4zQ
 X58jooAYw5NfXXfPjbVxq8GMJR1OFcW9gq9qugyyDIlgNVEBoMtUcZ3CUh9YlX8Dl9wO
 lnIvPs6Nao8JAGrVpRujklfGVZImqHZ2E23h7GflzMsELNrkouXzV/hSCNZKkhp61R6e
 5IuESSIvAfiMeviJ6szIlpMmQLaeSfxBCvnqd2B0mpjf8XK9Q+CkreB8lVJdqIA4Pshp
 3togTWd3LLvqJ/atk8aH1yP6CwvajpWNbvbrykcCY3L9C0+aQNp6Xx4uGkrETydqh34J
 q/GQ==
X-Gm-Message-State: AOAM5327eRTwv4XvA+rXMmXO6dORYx0Q2ksl9HIaGdvZIS1ZLWWuRaWj
 7oxpgNQ2IjHTHSLlTf6odQ==
X-Google-Smtp-Source: ABdhPJyIx2Q9OE86cxQ0eVI2Glqtq0+kpx6vwhQ0UPF5Nvt73XPVNCEaryUeqd8Gmb2c/5tTSaJKVQ==
X-Received: by 2002:a9d:5a8e:: with SMTP id w14mr6830870oth.322.1633661174072; 
 Thu, 07 Oct 2021 19:46:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d26sm305260oij.49.2021.10.07.19.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 19:46:13 -0700 (PDT)
Received: (nullmailer pid 1409591 invoked by uid 1000);
 Fri, 08 Oct 2021 02:46:12 -0000
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>,
 Atish Patra <atish.patra@wdc.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
In-Reply-To: <20211007123632.697666-6-anup.patel@wdc.com>
References: <20211007123632.697666-1-anup.patel@wdc.com>
 <20211007123632.697666-6-anup.patel@wdc.com>
Subject: Re: [RFC PATCH v4 05/10] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
Date: Thu, 07 Oct 2021 21:46:12 -0500
Message-Id: <1633661172.595534.1409590.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_194621_931142_14F68C60 
X-CRM114-Status: GOOD (  11.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 07 Oct 2021 18:06:27 +0530, Anup Patel wrote:
> We add DT bindings documentation for the ACLINT MSWI and SSWI
> devices found on RISC-V SOCs.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  .../riscv,aclint-swi.yaml                     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml:34:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml:39:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1537678

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
