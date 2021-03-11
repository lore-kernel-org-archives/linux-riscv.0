Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333B2C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 16:41:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B4A64FE9
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 16:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98B4A64FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezzN6GXz6CeU+89EKr/UoT8rcehYBPkvyHiVu0H0UjE=; b=K2VacjigPOPCjsd2GjCideSyyg
	evf+z4XdJwUZwE8ycz1a1sLmfoVnndLCTz7F0ReVgWaUg/dpBDE1Kru/ltUawFpG0KWcw5DYhwkAb
	yh5zy9CjyDkXfICTLrHVipmoDoW4npsk2XPIY2MhTN1ib7ptBPSFqpT9v8kvm1RaiUA8pR8Sm2DL5
	85jlqfwgGD6I04NZqxvj11a5OnQ5/wbu3iEe86ulxjiGasKk/qJ/nWNsxAL/+3eUQ2Ez842ywTx+U
	y3pkpcGFnET4oEQOkKKgSFzen3PwKkFZYp5GgZvFyz1ain8uiZ4qHMqV8NK+NhAI+Ds7m9TkIq3bU
	AcvC3fmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKONL-009bJT-7J; Thu, 11 Mar 2021 16:41:27 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKONH-009bIV-8J
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 16:41:25 +0000
Received: by mail-io1-f47.google.com with SMTP id a7so22565199iok.12
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 08:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=+3y5o+1oaKZuqMVhsS8ruopNhactPzUGBDXzkkE8/k8=;
 b=VdlpvOwyvZp4sx8IhjDLzxdwnmtOKAFEw6YlWbD0jyZGP7cx34wTKK3Vdb7bQ9jh+R
 DrUpgewFRkrRblCPhOyWdyerKg+v0HjICCJgwYaUReX5j2ZbbfvvJkzi3chi4p/AmvVv
 wFxV6ar4leGG5s6VmhWH5uTpteg4r+ykn+OLzlqsPG4nOzUi2z5anFSjlwHOxkAEyfvk
 njABckbls10oTr6b1YxTBvMO1Znw+vioKmkbvVFx3dX8UPffz3Sp+SQICy1OnJec9NVZ
 sF2nxOTJj7AwhK6Rz9NWutIQrZjF1up6LcE97PAvPtgVAIl08WlGRNJgykMDENN4Uz2F
 Du1A==
X-Gm-Message-State: AOAM530bDvyMGhrSm51+k/02FsV0CxSoKtYvTE8oXNqkt0EKuiI4DGJH
 SjtBGKNR32sHF563R+RSlA==
X-Google-Smtp-Source: ABdhPJyLpyMvmT0QzCq9t02xwB8NsMjQ95MqYOykv4HfJ/6xg44iVvVnwoBMIgXafHcqcX15IST9bg==
X-Received: by 2002:a6b:6016:: with SMTP id r22mr6842998iog.93.1615480881372; 
 Thu, 11 Mar 2021 08:41:21 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id a14sm1576741ilm.68.2021.03.11.08.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:41:20 -0800 (PST)
Received: (nullmailer pid 841937 invoked by uid 1000);
 Thu, 11 Mar 2021 16:41:02 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: atish.patra@wdc.com, devicetree@vger.kernel.org,
 daire.mcnamara@microchip.com, aou@eecs.berkeley.edu, anup.patel@wdc.com,
 lewis.hanly@microchip.com, damien.lemoal@wdc.com, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, david.abdurachmanov@gmail.com,
 linux-riscv@lists.infradead.org, cyril.jean@microchip.com,
 j.neuschaefer@gmx.net, palmer@dabbelt.com, paul.walmsley@sifive.com
In-Reply-To: <20210311113444.15520-1-conor.dooley@microchip.com>
References: <20210311113444.15520-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: add bindings for polarfire soc mailbox
Date: Thu, 11 Mar 2021 09:41:02 -0700
Message-Id: <1615480862.543621.841936.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_164123_374831_9AA4B532 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, 11 Mar 2021 11:34:44 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller mailbox on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,polarfire-soc-mailbox.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/mailbox/microchip,polarfire-soc-mailbox.yaml#

See https://patchwork.ozlabs.org/patch/1451081

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
