Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8F5C54E76
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VqTYET80nd+T0IOUedXksnCbZ1uEzGnyx2ETBEXbEA=; b=HtSs9XuP1cGCmF
	Y1jBxhKuzaqWoXM/lek0QW067j837a9IDXl3g6/E34pn1vZyfjya0LFZ6B8VTI7yPtI9upE8Qnq3B
	+iHTJ43DxQNABk2czXvvKO6+ImZbFzsmYicvS888u2tuigUq9zbiLR4Pk/7ZtQnaZqxAnnPFKCGEb
	mArwBkrkbyUCs7QCqtaJJIvgXmKLBcqL3KgI8KutZ+NuoaBRYTjlz+cT/v5gxxdQCfFNLFMoozmEJ
	7JjrciZFxzx6nfGn0oo4bWDtgs7/OlBUfmQMQDZgN+V7ELWBhnJXgFymYVEyP34wgXSl9Jpu3Y9sP
	8e14K0NQ3M9qkChgjKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHryM-00Fft2-Ph; Tue, 17 Jan 2023 19:50:18 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHryJ-00FfsN-Bv; Tue, 17 Jan 2023 19:50:16 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-15f64f2791dso2846501fac.7;
        Tue, 17 Jan 2023 11:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVRN9WuFQqZQy8t/vvVMvysnKtLMLWxVtmq6SFpr+OY=;
        b=0OrW/GvgL793vF8YCC2NHPt5z/hBGWYelZBMpTLoCDt5SSWYkofvOa04GQh9ZD/qVD
         2ioy7ovKQd9exSl3eDcpuQyV/2m7JJJaB8EAyeHuYo0WZzrzjn0KOMQasEprH+z/wNFQ
         TV3/nsDacn3EFB+hru/VzXU8KueqbiuwrhXi8o82HdoMz5JvVTtiYFKBuAybFA8hITfx
         fEQQJO7tTsQayMz5vCLCHqVZFY7YD8S6tjIpS2QUPTb2RM/700WpHtrgel/rUx/VHveU
         FgtXDuTpIPKA+XE20+m5iMwM5ym2+UPrltKqwj4bXevB6WWUTM/Tnb0vqf/rgLgfhrmN
         RVrA==
X-Gm-Message-State: AFqh2kq4Vn053oaZHDPgiEnd5/DTSWgFdI32EEi95R+0PNdKbzmxgW+O
	MtBr8aYwNDl14aAEhC0wqA==
X-Google-Smtp-Source: AMrXdXtDWEQCAQKd90hHWf7/fvv4ZNpfThfphggEnd/a33sVVKdBxufs/RmFdfHxKmucc9XtTeDTNg==
X-Received: by 2002:a05:6870:4985:b0:152:d0dc:2bba with SMTP id ho5-20020a056870498500b00152d0dc2bbamr2462922oab.15.1673985012635;
        Tue, 17 Jan 2023 11:50:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bc31-20020a056820169f00b0049f8b4b2095sm15479404oob.44.2023.01.17.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 11:50:12 -0800 (PST)
Received: (nullmailer pid 3526963 invoked by uid 1000);
	Tue, 17 Jan 2023 19:50:11 -0000
Date: Tue, 17 Jan 2023 13:50:11 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: samuel@sholland.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, atishp@rivosinc.com, will@kernel.org, robh+dt@kernel.org, Conor Dooley <conor.dooley@microchip.com>, apatel@ventanamicro.com, ajones@ventanamicro.com, opensbi@lists.infradead.org, palmer@dabbelt.com, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v5] dt-bindings: riscv: add SBI PMU event mappings
Message-ID: <167398500960.3526866.18235571341667319487.robh@kernel.org>
References: <20230113205435.122712-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113205435.122712-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_115015_450692_689A02FA 
X-CRM114-Status: GOOD (  19.81  )
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


On Fri, 13 Jan 2023 20:54:35 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The SBI PMU extension requires a firmware to be aware of the event to
> counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> DeviceTree to describe the PMU mappings. This binding is currently
> described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> since v7.2.0.
> 
> Import the binding for use while validating dtb dumps from QEMU and
> upcoming hardware (eg JH7110 SoC) that will make use of the event
> mapping.
> 
> Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc # Performance Monitoring Unit Extension
> Co-developed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v5:
> - Remove the word hook from top level description & reword some of the
>   statements that sound clumsy when removed from the context of OpenSBI.
> 
> Changes in v4:
> - A bunch of minor description/comment changes suggested by Drew
> 
> Changes in v3:
> - align descriptions to SBI spec (and fix a misinterpretation of mine)
> - switch to a nested items description, since the descriptions are for
>   the elements of each entry, not the entries themselves
> 
> Changes in v2:
> - use the schema mechanism for dependancies between properties
> - +CC perf maintainers...
> - move the matrix element descriptions into regular item descriptions
>   rather than doing so freeform in the property description
> - drop some description text that no longer applies since changes were
>   made to the SBI spec
> - drop mention of the "generic platform" which is OpenSBI specific
> - drop the min/max items from the matrices, they don't appear to be
>   needed?
> 
> OpenSBI is BSD-2-Clause licensed, hence the license here.
> ---
>  .../devicetree/bindings/perf/riscv,pmu.yaml   | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
