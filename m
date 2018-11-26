Return-Path: <SRS0=mShH=OF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A312C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Nov 2018 19:03:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6B220865
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Nov 2018 19:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JE5KCZAT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="R8v/JUL4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6B220865
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=IxKAAcf/bgZzVFJ8IpSdQ3HWWMJ/rQhgzOYAPBbukcs=; b=JE5KCZATobyduzhHnC2QW2tWP
	B8JSR+LDu2tXFuS62miCbzBQd8q4Y3vZs6dfGXNYv3hJWLzMuUz8rISYjhf4jK+fNvOofjMGLp5hP
	iitmz1EflvQYjaPihNKFbvLt6jKR/4QK0ZH7YaBBpPKFSnIZa6hnYBqfWv8SVplmiIIFS4K3fSFay
	lEHUIYzCwtGaxPdy2ijdumdlTnxZcnCOsSkBK81Gjr4ImTC5gWY/72ZOt2VS47Klers4602gOs+ZC
	BwKW7mY8er8ODkk7210CuhC1+lnPaIuXGc3GCOWNkgrJXHSboyyjZwtMDYXKZpLJ6H5NcqcZutiCz
	Llfj4VdTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRM9x-0006xE-LR; Mon, 26 Nov 2018 19:03:05 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRM9t-0006vg-2M
 for linux-riscv@lists.infradead.org; Mon, 26 Nov 2018 19:03:03 +0000
Received: by mail-pl1-x643.google.com with SMTP id z23so14316820plo.0
 for <linux-riscv@lists.infradead.org>; Mon, 26 Nov 2018 11:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OVp5h6hiWa5viWYNBzxoxu5Tt47L+PYW4lVWplLHQ2s=;
 b=R8v/JUL4kbq3vbtJLbOwQ65Lnv9cPIqMzefPeScfLel9qtZivlFuIVTg4lRl8jKyBy
 zw8t517enCnR5QNVPjOreimXhv9y394P3a+CsmpOoydJ0BIxrcsnMdZw7E+RyCCfeFH1
 ziCfJmMcpvCd1+2zGu1lCMYp1ziAlHhaFPaGXXsDJosdLr9Fo0XxXTmDMc0bc5byYMrP
 oq/8CQeYZp/Uu2HjOIJYCEzgTbYjiBPraxphFmX4BteUd13Ga8tR51EJS3yYiZWlaraP
 plDSJ5Qzk2tlAFXAz5WkzcBozIsnIilYlVTm5iXNxtAIj+WANNRruxae1IQxVdNva57B
 5L6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OVp5h6hiWa5viWYNBzxoxu5Tt47L+PYW4lVWplLHQ2s=;
 b=JYYobg0Nx4o8THt8O9P8ExozeuPHN3NaGOA583zWRjh/Ax9JuwaEC2xcwhFYxQVX5x
 Yv4iXIxYebKzOL2Fg+h7thZ/9gRGQOQ3dWp+imycnBcjq0n1XuChjyxwfNaajgMKEJ5o
 vXQolybHtkRVTkTqLBtczGG/mm6upX+ae1U9rWtjJEyFfZS7HZ/osx4XzLc006OdiIcr
 H5TXcLeoo0/Ahdlhv7QC3b3Bo6Ko/n8QvhH2FCL9r6jvmVQsINW8kWPIKtMS1AHxX5fP
 jxfXAyNmhWrA2lrexG+5YlO8MdRX0FA3QJ3Mast+uTG+4Yi5kA0gUnfkMpp4FJboQDTT
 /cJg==
X-Gm-Message-State: AA+aEWa8tF2t+hMRyf4cXZywcjzWZ40fZtevjceUSUmOZkvtjYdfB2Uk
 jeQaeQ4WrLLPyfBKNPelSuIzKA==
X-Google-Smtp-Source: AFSGD/W1iUOMLycLrn29VaCZnwHjxqXpiFfEeRTtHWcVKBYdcx2W9Qtr6JfZZrbGCVuaLNjviEMsmQ==
X-Received: by 2002:a17:902:583:: with SMTP id
 f3mr29865894plf.202.1543258969829; 
 Mon, 26 Nov 2018 11:02:49 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t66sm1467295pfd.54.2018.11.26.11.02.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Nov 2018 11:02:48 -0800 (PST)
Date: Mon, 26 Nov 2018 11:02:48 -0800 (PST)
X-Google-Original-Date: Mon, 26 Nov 2018 10:27:42 PST (-0800)
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
In-Reply-To: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <mhng-197c28a9-6763-40df-988b-3494dfe124d4@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181126_110301_107638_FC79A7EF 
X-CRM114-Status: GOOD (  23.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, paul@pwsan.com,
 Wesley Terpstra <wesley@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Megan Wachs <megan@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181126190248.jUy1Bc0k4v5c6X2GdjMBsQU5iFpvsS-3fDwflSYuZek@z>

On Wed, 21 Nov 2018 17:06:56 PST (-0800), Paul Walmsley wrote:
>
> For IP blocks that are generated from the public, open-source
> sifive-blocks repository, describe the version numbering policy
> that its maintainers intend to use, upon request from Rob
> Herring <robh@kernel.org>.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>
> Hi Rob, please let me know if this document works with your
> requirements, or if some changes are needed.  - Paul
>
>  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
>
> diff --git a/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> new file mode 100644
> index 000000000000..b899e5c6e00c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> @@ -0,0 +1,38 @@
> +DT compatible string versioning for SiFive open-source IP blocks
> +
> +This document describes the version specification for DT "compatible"
> +strings for open-source SiFive IP blocks.  HDL for these IP blocks
> +can be found in this public repository:
> +
> +https://github.com/sifive/sifive-blocks
> +
> +IP block-specific DT compatible strings are contained within the HDL,
> +in the form "sifive,<ip-block-name><integer version number>".
> +
> +An example is "sifive,uart0" from:
> +
> +https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
> +
> +Until these IP blocks (or IP integration) support version
> +autodiscovery, the maintainers of these IP blocks intend to increment
> +the suffixed number in the compatible string whenever the software
> +interface to these IP blocks changes, or when the functionality of the
> +underlying IP blocks changes in a way that software should be aware of.
> +
> +Driver developers can use compatible string "match" values such as
> +"sifive,uart0" to indicate that their driver is compatible with the
> +register interface and functionality associated with the relevant
> +upstream sifive-blocks commits.  It is expected that most drivers will
> +match on these IP block-specific compatible strings.
> +
> +DT data authors, when writing data for a particular SoC, should
> +continue to specify an SoC-specific compatible string value, such as
> +"sifive,fu540-c000-uart".  This way, if SoC-specific
> +integration-specific bug fixes or workarounds are needed, the kernel
> +or other system software can match on this string to apply them.  The
> +IP block-specific compatible string (such as "sifive,uart0") should
> +then be specified as a subsequent value.
> +
> +An example of this style:
> +
> +    compatible = "sifive,fu540-c000-uart", "sifive,uart0";

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
