Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068E0F013C5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnCLyFpYqziEboaMsiF66DX+enx7SNDD1/vgmFS+4So=; b=GIpwKIKFMgjpp+
	D3b+lQBgnTtBQ/qLrVF+vSIEICFb3FwaNkM9JmDdsy/l0k6FK0KCrP+bwBWPZ/KvcsXsioQl0rNaB
	VI94S5bafrSXz3yiI5SXbpPblrkeVpI3RfyDuEeSN5X+Te7rT0QvsG0z8MVVqNMUSv/tICuPm2scU
	dOZ9KankT1z36wTZ5M69k/U2x97siFvEZ8ghLviFDHWRW5R7gCvGyiWXsUemn3AqhKcvJnSTWVINa
	H5GBnIhzNXpfHLjN7UK9yA9fQQs2AymfQZoVt/VijM9t8bvMNhVjvdsy95JWEjztlMCDebS0bL1Ek
	GbP9kSJlf21vNf+x2hbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w232u-00000003WO8-46YY;
	Mon, 16 Mar 2026 08:11:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w232s-00000003WNn-2eUo
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 08:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E431643997;
	Mon, 16 Mar 2026 08:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D399C19421;
	Mon, 16 Mar 2026 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773648685;
	bh=2/U22xyL14hpwzS+OtJ8KVxawev/mlvdeT5ndUJfiak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKPid3mNQixso9Q5ycyABdADX0CqKUH6PGjRBtrVDxt1AIlWes4vtmf9aAHRvZUSD
	 G7AarnVVHvmIdMxX42IyPFW9z2rfQOLkvalgsomLpMKSDCqlRHlAeHETLpGMqpYyki
	 91KgLS8X8RFaHmB01GniI5Ubv3ZGIm5enHeee2hJfy67S3Bv7wqgfWiOepD3r235fS
	 P/89bTNIrS349p8+AeJ/i2EotHv9ezc1YGdpBs4/YJ2bjwqjabJPzmblUzjdOSOlQD
	 xEezynDm9ZCxDrlQ84SES5BxC46cglXeSII4uC6uJQL54LyyFp6RMZX6lSaUZaHuZx
	 zTIYvm9dQthHg==
Date: Mon, 16 Mar 2026 09:11:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: update bindings of ultrarisc
 dp1000 uart
Message-ID: <20260316-uptight-dachshund-of-grandeur-fbee0f@quoll>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
 <20260316-ultrarisc-serial-v2-1-6ab3e7fa891c@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316-ultrarisc-serial-v2-1-6ab3e7fa891c@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_011127_036828_5B650737 
X-CRM114-Status: GOOD (  12.73  )
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

On Mon, Mar 16, 2026 at 02:33:22PM +0800, Jia Wang wrote:
> Add DP1000 UART compatible information

We see this from the diff. Why this is not compatible with
snps,dw-apb-uart? What are the differences. You have entire commit msg
to explain the hardware.

> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> Reviewed-by: Yao Zi <me@ziyao.cc>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 6efe43089a74..0040ed28e35b 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -78,6 +78,8 @@ properties:
>                - starfive,jh7100-uart
>                - starfive,jh7110-uart
>            - const: snps,dw-apb-uart
> +      - items:

Drop, not needed.

> +          - const: ultrarisc,dp1000-uart
>        - const: snps,dw-apb-uart

So just enum with the snps one.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
