Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D95EB7EAA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8h6DLOhh5Peqhj4KsI20LwTw0+3/VTKC2247iNujrk=; b=bnZVUzeQH4mE4d
	iwpvjgcl0qIM0D5wYC/RB1e5jx4skc9B3wrNgtVfQQlKkDyclQtbFHN+J4FhsC6oSPeXL7NEx4spH
	7HFAuA2MlGvD9i/ndERYj51JFT2QGVaISzbtn01F/a1PJUzP4I7FNyYjC/YAvQAopiR/GZ/RE0XPB
	DVT+AoGqYB9teYnpTOBpPolH6VW4NaWLyLW8U7APEd5Y8uddUWb+73Jxo33a/ObeP+v/FgoZYG5i5
	pHPwxJHmpkL88v70Wkb+lnF4j6l0oLBsQHMey+GvCIrveYAqlt6nsW6Tz0x/LL68daCLVUNXByxjh
	gXc2k09RjwkWfCbVSYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhhn-0000000Gkxq-1Mxh;
	Wed, 04 Mar 2026 08:35:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhhk-0000000Gkx2-3Evb
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:35:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AEA443BA8;
	Wed,  4 Mar 2026 08:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F715C19423;
	Wed,  4 Mar 2026 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772613340;
	bh=oWg/cg7kWlEES/qZchQJbpztQ2Tn1CAdFHkpToBc1HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbDO9REZow53raDLG6Ylx8rKhsJQX8kWtGz7KlNrZATvSPnmX8sDpV9Tq+my2eKvY
	 fxJqZ2FcA3QsALILV1TuSsnrTBrnRVWgb5tvTZ68Y1EyPOKMv4Dz+/lACKzqHTY2X+
	 1xoIDJ6XusXVNeZ++c8yjBO/fmwvYxk0Ho360/zfWqZQBTxfXe9F1YaKXPNhMk9xwH
	 3gCfDP4acMucgyzLN1qpWikFA5i0c0IdrgBnmw4riv5065a5oWxTHJYCTIOcGCW/yC
	 D/RR6oVtruJAhNNZpSMlo6xU3+68Lhsyr3sUyv+6OP/8sIperKgNYz8Km8c0NNllJg
	 HP7x24bA6QNNQ==
Date: Wed, 4 Mar 2026 09:35:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: i2c: microchip,corei2c: permit resets
Message-ID: <20260304-vivacious-congenial-bear-f47377@quoll>
References: <20260303-clang-earthling-8a4904cb8a7b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303-clang-earthling-8a4904cb8a7b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_003540_827338_891E713C 
X-CRM114-Status: GOOD (  12.13  )
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

On Tue, Mar 03, 2026 at 04:34:54PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Both CoreI2C and the hardened versions of it on mpfs and pic64gx have a
> reset pin. For the former, usually this is wired to a common fabric
> reset not managed by software and for the latter two the platform
> firmware takes them out of reset on first-party boards (or those using
> modified versions of the vendor firmware), but not all boards may take
> this approach. Permit providing a reset in devicetree for Linux, or
> other devicetree-consuming software, to use.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Andi Shyti <andi.shyti@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-i2c@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
