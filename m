Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62ECC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 02:47:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822AF60FC2
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 02:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 822AF60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0P3RD2aIJhNeo+nGnMlGMU8WKWf9Rl3FerDv7OUe+0=; b=F02+XQ5ek1+9Aq
	Ajn8YUn29Q5vHPjWBXADUg3chylILi1Rq3TosewsXrXL06k2EFDoNChSQIbHYK0mmn4bzXXC21rTn
	j1iKit27m9i2FvNdz1GxF1jUnpLVk2jkccU/FxHlA/qZfVQDb/pFbjdI+xS4fr2qJNX9H8ZYV/5AZ
	1mkZgjaWxj+V26xEqPkKNzwL+vPT3sLWCngplb7Bt9w1jiJznlSWvhQDWXngyHKbyr2bOdPmMH8dZ
	iNgOWduBQa3AnAFzKg94IS6Zpqh1F6jfaqzbQeAGr6A+I0IIxS8q2ajY1IdjvivxIZkTeEfaS+9D6
	jI5QBg+rI03ORFdEZ2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYfuM-001Ll5-4a; Fri, 08 Oct 2021 02:46:50 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYftu-001Lcy-Ib
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 02:46:24 +0000
Received: by mail-oi1-f177.google.com with SMTP id v10so11793943oic.12
 for <linux-riscv@lists.infradead.org>; Thu, 07 Oct 2021 19:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=d/DSBmhRsznzpWcfTu9Dz3MGhzpb5fEj4AuhwcCUbk8=;
 b=jcC7GuzOLYUCMLZ3Xb3KebbZlpGSfgJU377yCk8CrLhTm5VgQxmjWpKW93vlHuAawg
 xWpkBnyRxi3KBtfi3HlF2QFcPK4Pcvzj5hfznQhgn0J7AZyJW4OK/3mCJsFyvk6NULYU
 VAj7xgil2A8OViitv5XxopONPCEFftjRfQM6hhRR0RT4Oc8lfQ6K4aH1UjbtTqwliCbv
 EL3eTC0ZknpST8pP5gIzIjGQ/1WGbGpMKLwip4RJY1LU1M67l7+EUzEIsoRl9RBTy9Qj
 yn6HGSgUV26YjWLFwV2KKRw/yfFFU6fu8lyASLRweUjm5k/JaBoIFQ90FbFwlhQFppV6
 XO6g==
X-Gm-Message-State: AOAM530LAdBP6dTPfXJosvQViUdcIYYpA/Ppa7BoKdK2RES3+CokVdA0
 gewirdDvv1eiM01Upz7EmA==
X-Google-Smtp-Source: ABdhPJy1cC5Nx8AhMq2wtMPWY6DFxKO81NZcudRZwFFA99IYTe+JunWd29Ow26kJPmmMtcTTjhUixw==
X-Received: by 2002:aca:32c5:: with SMTP id
 y188mr13937282oiy.163.1633661181481; 
 Thu, 07 Oct 2021 19:46:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a1sm259305otr.33.2021.10.07.19.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 19:46:20 -0700 (PDT)
Received: (nullmailer pid 1409594 invoked by uid 1000);
 Fri, 08 Oct 2021 02:46:12 -0000
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>
In-Reply-To: <20211007123632.697666-9-anup.patel@wdc.com>
References: <20211007123632.697666-1-anup.patel@wdc.com>
 <20211007123632.697666-9-anup.patel@wdc.com>
Subject: Re: [RFC PATCH v4 08/10] dt-bindings: timer: Add ACLINT MTIMER
 bindings
Date: Thu, 07 Oct 2021 21:46:12 -0500
Message-Id: <1633661172.604098.1409593.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_194622_648220_16EE8028 
X-CRM114-Status: GOOD (  11.12  )
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

On Thu, 07 Oct 2021 18:06:30 +0530, Anup Patel wrote:
> We add DT bindings documentation for the ACLINT MTIMER device
> found on RISC-V SOCs.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml:31:10: [warning] wrong indentation: expected 10 but found 9 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1537679

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
