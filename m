Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB18CF648A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 22:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24tN5MN/kZhamuk5VVgJ2ojONQ+P3IUSiDJb4PyyKAY=; b=Oojsk38OSWKWvM
	NdEGiFKgw1s1tAmfcKPBIMbd0apaZfDNBxk/05AfVgjvEvPPgrTe+26BDKmQweOL05f+N49pD8rzZ
	2PWp+sSP49A49aMDTJBJHbf0sIMykd+FnV99dgFt65gpSkqgMQnL6OtddcD9ROgDjjO63CIMC8pF6
	4lQOiX77aaDRsj89rmaEsqDfNqcfPL9DsIo9r5kZUngEjEg1vQ5aKvluhdooefwrP0K320s367SR2
	hePhTJvv0Lyzu23U0IMBi4VVVJEBIHJsEMcfotu69nLlMZwaKA7iVIdzaI+QtStaRySG4Snt5o+FI
	qUmc83J7p1WMZr+n27EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suJVn-0000000CESc-2lt8;
	Fri, 27 Sep 2024 22:32:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suJVl-0000000CESE-2Nim
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 22:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B06C15C5AA3;
	Fri, 27 Sep 2024 22:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D40C4CEC9;
	Fri, 27 Sep 2024 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727476348;
	bh=saH4LjPEzRLlPysFm5GNlLBTMwG5yytpd3WGfVUXEyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZBsGNZuq9MB/AGCvy2dlV0PCwMC6bCDrwHmdtoqUwW9glT8YLYabhE+3KvBu8TFD
	 wXl0EIkmZw6cJL8G9pYJUpYFXHWuMaNjhJDXBmVFv7fhufOGFlFGGLOIFDfXgErAUu
	 OPrd35dCrJl7dG1qoMcD//EtqCgVCjahvHh7aA4MwfWsNQdJCoKLVc+LqtF2GJFBCu
	 7Gc9JesiDOU+R7KQCHluFcTaH0EJzgugNgfmqpaA673/IpXt21sZu7jnMiV8cXtQLb
	 F4mDHCOxEz09IvMTUlKFz+zLggOrvodQG5sJFItec4dAhoYoz+x6JvYTEAMl2AzoPj
	 tVWbiyzwa8yjA==
Date: Fri, 27 Sep 2024 17:32:27 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	m.szyprowski@samsung.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/3] dt-bindings: mailbox: Add
 thead,th1520-mailbox bindings
Message-ID: <20240927223227.GA152909-robh@kernel.org>
References: <20240927094207.1650085-1-m.wilczynski@samsung.com>
 <CGME20240927094215eucas1p1be4d58084ff19e47450dcad3e6da5f5e@eucas1p1.samsung.com>
 <20240927094207.1650085-3-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240927094207.1650085-3-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_153229_766078_4D4B25F5 
X-CRM114-Status: GOOD (  21.74  )
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

On Fri, Sep 27, 2024 at 11:42:06AM +0200, Michal Wilczynski wrote:
> Add bindings for the mailbox controller. This work is based on the vendor
> kernel. [1]
> 
> Link: https://github.com/revyos/thead-kernel.git [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/mailbox/thead,th1520-mbox.yaml   | 84 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> new file mode 100644
> index 000000000000..b517d0c6eb12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/thead,th1520-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-head TH1520 Mailbox Controller
> +
> +description:
> +  The T-head mailbox controller enables communication and coordination between
> +  cores within the SoC by passing messages (e.g., data, status, and control)
> +  through mailbox channels. It also allows one core to signal another processor
> +  using interrupts via the Interrupt Controller Unit (ICU).
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-mbox
> +
> +  reg:
> +    items:
> +      - description: Mailbox local base address
> +      - description: Remote ICU 0 base address
> +      - description: Remote ICU 1 base address
> +      - description: Remote ICU 2 base address
> +
> +  reg-names:
> +    items:
> +      - const: local
> +      - const: remote-icu0
> +      - const: remote-icu1
> +      - const: remote-icu2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  thead,icu-cpu-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |

Don't need '|' if no formatting.

> +      CPU ID associated with the Interrupt Controller Unit (ICU). This ID should
> +      correspond to a valid CPU core in the system. The value must be between 0
> +      and (N - 1), where N is the total number of CPU cores in the SoC.
> +    minimum: 0
> +    maximum: 3

The normal way we associate a node with some subset of CPUs is the 
'cpus' property linking to the CPU node.

Or is this CPUs which are not part of what Linux is running on (i.e. the 
SMP cores).

> +
> +  '#mbox-cells':
> +    const: 2
> +    description: |
> +      Specifies the number of cells needed to encode the mailbox specifier.
> +      The mailbox specifier consists of two cells:
> +        - The first cell is the destination CPU ID.
> +        - The second cell is the mailbox channel ID.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - thead,icu-cpu-id
> +  - '#mbox-cells'
> +
> +examples:
> +  - |
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      mailbox@ffffc38000 {
> +        compatible = "thead,th1520-mbox";
> +        reg = <0xff 0xffc38000 0x0 0x4000>,
> +              <0xff 0xffc44000 0x0 0x1000>,
> +              <0xff 0xffc4c000 0x0 0x1000>,
> +              <0xff 0xffc54000 0x0 0x1000>;
> +        reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
> +        interrupts = <28>;
> +        thead,icu-cpu-id = <0>;
> +        #mbox-cells = <2>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df4d7be6cf35..a6028f850a25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19943,6 +19943,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/pdp7/linux.git
>  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
>  F:	drivers/mailbox/mailbox-th1520.c
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
