Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F43C282D2
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70gAiIjJvkBlXeUswaaGc8ptHvTHGLBZxBgEWcm5W9U=; b=bWnnzjLp5N2+fY
	UozeoLHNjvIx31obRkhEzPcnqxrbr7zP2I6URLPQ3vmZtupc8hnxDIo5PNXeomJTWW54IuY5/lp3r
	1ZRVpWql6wogShsG+PXRYmjATVZNDDCxYjn3Ftd2lt2P5jjsvR93tBgLgDcY9n8G/U+oGXjWxS0j5
	1JrlAAYiCTI1DyB8ciBvaCC41prL/SbOeGWiMmNA/4DCh55PY+W+MQNqbp07EfyVxlLeo0MfDB+9S
	0lVjBJrP1XmfXx/fJsRa3wITeyiZw20t5LPQqXd1NXZuTi/UYomWrAbUDS5T/1BvOon3bZQ/i3OKt
	a7PeAm85X/4zKz+o5hLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUQh-00000005GUy-1LMl;
	Tue, 04 Mar 2025 15:43:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTuO-000000058hh-482C
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 15:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53D53A4576B;
	Tue,  4 Mar 2025 15:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE67C4CEE5;
	Tue,  4 Mar 2025 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741101011;
	bh=FhKpjo3hcAiaiK1n/W7XQ2upO3brMlYqbq9MJay2QDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCtdR3f0qQnfUb9jBESk9fU6fS7zr8s0lbOS829mYQt41QZYSWf9qfFPZuwZc+ZwO
	 Xb3HS+NnA7KNa7lSPNHNDwNq0xQ552pwk3gmvc4whqM2jDOlKxtW8YjQGWFEEvwqVS
	 cUSjVRGw6Glfps56nMIaw80kMMz//oyyk0/7ABLw0NJrVf0dzFyvf7wOsL+zBuZeiU
	 8oLMtb0R0W262VOEGUtZsSlpMaQRjL6Ba3OVgkQlET1dbGFbPRBg3S1ai4LpOhrrHi
	 8FCnavEfhAcHBt2vTbpY3/P++xIT/oYxnWYDOPwp7UfEOw683+jIdpWCc8seVU1DNl
	 JyuC5IkWJqIlA==
Date: Tue, 4 Mar 2025 09:10:09 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Message-ID: <20250304151009.GA2553244-robh@kernel.org>
References: <20250304071239.352486-1-inochiama@gmail.com>
 <20250304071239.352486-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250304071239.352486-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_071013_085573_7E3742C8 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, Mar 04, 2025 at 03:12:37PM +0800, Inochi Amaoto wrote:
> The pcie controller on the SG2044 is designware based with
> custom app registers.
> 
> Add binding document for SG2044 PCIe host controller.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> new file mode 100644
> index 000000000000..2860d0f13146
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +description: |+

Don't need '|+' if no formatting to preserve.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
