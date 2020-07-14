Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CB9C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 02:38:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F03920791
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 02:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RHukNbLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F03920791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SvrwiST7SPXDY6BbwxzzllUfmwNon8URZtEhObLLEEA=; b=RHukNbLYFMar7zqCmKoR/uWJQ
	K3e+UqLwnjNGCk3H4Gl5Uk0aadQvie2I5F5RreRtlVTwVtbsGqoS2ePj9AJmkSANkji/iyvtxaO6b
	m4L7XygJeeEwxuApi3JPLGnZJ9XlIDRE6gJFOpUxjdgyJGFzpuFvK61oG7CU3RroWMtr+vrI4AFrp
	NTYC9sF9W843PlxKc5IDHjhsEw//IdgmEZcFJy6/BxYBaZjf4KIlYH4nBJHOT7Nk/KNLLcKRrRv1q
	MOlq07VfbyP3iG1aD1f7fN3ezTAc0rYfAyHy1IafXxlkKeLFEnlSPUzkM4t8u8+utybkzzPd8XB6i
	y8J/lrlwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvApM-00027Z-RF; Tue, 14 Jul 2020 02:37:52 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvApL-00027F-40
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 02:37:51 +0000
Received: by mail-io1-f68.google.com with SMTP id e64so15746171iof.12
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 19:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l9yRXPbAuKbatZZtOZ8lv0tgEHkyKNFIEmB9CuDKx1I=;
 b=KxDgaoCnhaVpsiiEdMkgWy3Bp3J+HZKmZAV+beZWJ06cCdnqBwquzPdz61MmD65SAx
 8aV0Y9p4CT1E5TpyTTmRwsvO4zbUHXVTtGYKBBxCgf3C+2JlHL1vM+JUIcq2vh3+/g8k
 cWgdPrbhELLW7cbewsGv9iLuJgNMYMQJ5DM6oPKOzLHmzZDgpglJXx34hKDpLxBuccN3
 LnYkBE14iruXpDqtNQFiXO3yaw73Ozio8pjjP3fqOVRFJr7p8ozm2WNGptRMd82i96Xz
 ixvdlLoSHa+c9Ut0SCzDYNMVAwKozNOfT0mogjhnO6yzsrUY2xc/xBSV8wc61OJ0K9fh
 QvYQ==
X-Gm-Message-State: AOAM5336/lKVzZi530XwF2oUSP6HoEuLzKqB6I0c1KKPLXZyE41gKU4+
 b4A8y5gIozoc6y0Oyj/sTQ==
X-Google-Smtp-Source: ABdhPJwB0uH4+dXlUcswfGdYzX5Q71gv/PavH+vKBm/oYyn40EnjX/9utyBqyLLVsYAIO9o14kvV5A==
X-Received: by 2002:a02:9182:: with SMTP id p2mr3548431jag.69.1594694270483;
 Mon, 13 Jul 2020 19:37:50 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id h5sm8923943ilq.22.2020.07.13.19.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 19:37:49 -0700 (PDT)
Received: (nullmailer pid 1171324 invoked by uid 1000);
 Tue, 14 Jul 2020 02:37:48 -0000
Date: Mon, 13 Jul 2020 20:37:48 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: timer: Add CLINT bindings
Message-ID: <20200714023748.GA1164267@bogus>
References: <20200627161957.134376-1-anup.patel@wdc.com>
 <20200627161957.134376-6-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627161957.134376-6-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_223751_212830_E32AAB27 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 09:49:57PM +0530, Anup Patel wrote:
> We add DT bindings documentation for CLINT device.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  .../bindings/timer/sifive,clint.txt           | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.txt

Bindings should be in DT schema format now.

> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.txt b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> new file mode 100644
> index 000000000000..45b75347a7d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> @@ -0,0 +1,34 @@
> +SiFive Core Local Interruptor (CLINT)
> +-------------------------------------
> +
> +SiFive (and other RISC-V) SOCs include an implementation of the SiFive Core
> +Local Interruptor (CLINT) for M-mode timer and inter-processor interrupts.
> +
> +It directly connects to the timer and inter-processor interrupt lines of
> +various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local interrupt
> +controller is the parent interrupt controller for CLINT device.
> +
> +The clock frequency of CLINT is specified via "timebase-frequency" DT
> +property of "/cpus" DT node. The "timebase-frequency" DT property is
> +described in: Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +Required properties:
> +- compatible : should be "riscv,clint0" or "sifive,clint-1.0.0". A specific

A new versioning scheme from SiFive? To review, we don't do version 
numbers unless there's a well defined and documented scheme. IOW, one 
that's not s/w folks just making up v1, v2, v3, etc.

> +  string identifying the actual implementation can be added if implementation
> +  specific worked arounds are needed.
> +- reg : Should contain 1 register range (address and length).
> +- interrupts-extended : Specifies which HARTs (or CPUs) are connected to
> +  the CLINT.  Each node pointed to should be a riscv,cpu-intc node, which
> +  has a riscv node as parent.
> +
> +Example:
> +
> +	clint@2000000 {
> +		compatible = "sifive,clint-1.0.0", "sifive,fu540-c000-clint";

Doesn't match the binding.

> +		interrupts-extended = <
> +			&cpu1-intc 3 &cpu1-intc 7
> +			&cpu2-intc 3 &cpu2-intc 7
> +			&cpu3-intc 3 &cpu3-intc 7
> +			&cpu4-intc 3 &cpu4-intc 7>;
> +		reg = <0x2000000 0x4000000>;
> +	};
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
