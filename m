Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964E7CD37AC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sO3yM897uuKre8hIbiiStb64HzMBwx+O25fS93i6KbE=; b=pDcLHrY4Rz7SE5
	aWS3dp6gS28jPhR+5AlTfRKIFgoDVQdovwRon8AlU1Pw25IgTwMo029R99HtwCyLcFwjccCt7m43P
	rJD/azRl1DygUO32ExEyDJBWB7hqp46dehvZw0EYqCQwA3n+J/z+L+t9vObI80m8n2DDdqrhjxSxK
	/PUS5kLz0etQD31YULiFZEqkwqs2HN+G4dqewa5i1C9R26q+Ghk26uo0V+F9PPAJVSCUYTx9G0diu
	X83RNcjl+3mSOwr4evRfJvOQfB+6fnHuzNqXT9R4Bi9hAM7SXo1/mI41tr4h0IMpLAV38BvDm7U4t
	WAmFRU2aijjF8zagwS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCs-00000003K5m-0fb4;
	Wed, 13 May 2026 17:17:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDCp-00000003K24-1S5Y
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 17:17:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EDDA42A81;
	Wed, 13 May 2026 17:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A418C2BCFA;
	Wed, 13 May 2026 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778692630;
	bh=gQool408l4gMm/6emufuT088Y5cuxk1gS7/KqLZUW24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3ThsJ6uakmRAlORwNtN6mSAMxhV73vUJkp6B5Qil6QDn3YQ7x34MH22Dlqe4Mdin
	 1rgI5npXFzL1kUITxOb/QUXd55yfmuVJCOPvRhVaUbJDRDsB9MjUdIiC4DoPkSPtff
	 TyPJ+fE17FGQh+wAi6qT5UKhti4Q1A/JDeYbIvpNns9WVQECBuztgxPWtgwzSj0Yzg
	 +EoIqq6NTlwWHnJwiK7HdUE+5hYEb7lfg0J7fZgLx/swTbW3b78FRIGR4uNs0cQlTl
	 nj+SZ2euZvMfr0qJuteGgd2okGaT2BdyeMXz7aSsxq0e/RZqEIWnoEtRXhtw3E2RLm
	 OuL5ZeoWUFoTg==
Date: Wed, 13 May 2026 12:17:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anup Patel <anup@brainfault.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <pjw@kernel.org>, Ian Rogers <irogers@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Atish Patra <atish.patra@linux.dev>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: Add RISC-V trace component bindings
Message-ID: <177869262677.1393813.17216118016558034806.robh@kernel.org>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-2-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-2-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101711_402777_CB67871D 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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


On Wed, 29 Apr 2026 18:21:24 +0530, Anup Patel wrote:
> Add device tree bindings for the memory mapped RISC-V trace components
> which support both the RISC-V efficient trace (E-trace) protocol and
> the RISC-V Nexus-based trace (N-trace) protocol.
> 
> The RISC-V trace components are defined by the RISC-V trace control
> interface specification.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  .../bindings/riscv/riscv,trace-component.yaml | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
