Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B9CE7A86
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 20:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giOZdIMwbK1fzDJ3LC9EYSn+0yqnNhbig3YD1hg2B8o=; b=SDj/e2GuoQXtE3
	7v9HRbcmDsUR+5uYwNRwRqs7pcTZpz4nAol+YXfLSm17eYh3gEpnj00zSF5X5FafQDq6pp+P9kx4b
	fF8nE7jDs6ifiuJWHX3vrV/fToxoCbjiEo1uRLGXcd30nVAx2A5b50pzVfu5u8rQnVMGoWICmvxpD
	EZAWTih1auEBAJy6AVWsQDdwTertC2FhMtVeS5PynxF/LzDCOyTBFGkbgqikRw8cMbtN5MqtViNHT
	KdhF0a0Le0XcyPsWqJ6BRssdWAqyEf9ijYGAPieojmPiO670KjrpnjYSMc+jzu1PkzmSIQPTsoFGp
	/AkdFiLDgM9AP/5Kb0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjmqq-009nIG-1w;
	Fri, 22 Sep 2023 20:34:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjmqn-009nGt-1c
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 20:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 029D2B82412;
	Fri, 22 Sep 2023 20:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72898C433C7;
	Fri, 22 Sep 2023 20:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695414844;
	bh=fh2nzdkaUADt+b/Vyqr/huEqEK6lXWqUFIL1/jW11c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DH5lhYXNzlO+ew3BUXFcOyJVuqVlPYo3WqNuWFm/OHXzIDzy18hNBGYFi53/vn15p
	 EQEdNv/92IRzaq6rcTmmpMlX9lnfyDQQbvla9PXqrOcISvvOwYuNjH6E7VFj3uAqNM
	 s4ncS6i0SB3vS2RIAia7aFy9kfiLkpmlKpfmRFlVQjB2mG0/nvFHlcVGd1kkInVrS0
	 DmlRMqsXq17SIS3ZsR1CAtfO7wk5+9XbLmbwxkK7tCKnetrEqjzJ0Zqzp4tcUOsL2v
	 23DRjr7NCyLi1z8NlHNnD96ulbiEZgRB5hC1vsOA2EHwMdzkER3j1XUYdEc76pNAZC
	 IWehZMuivn4Uw==
Received: (nullmailer pid 3535433 invoked by uid 1000);
	Fri, 22 Sep 2023 20:34:02 -0000
Date: Fri, 22 Sep 2023 15:34:02 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add missing
 additionalProperties on interrupt-controller node
Message-ID: <169541483923.3535328.3111610827495188975.robh@kernel.org>
References: <20230915201946.4184468-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915201946.4184468-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_133409_681265_F4C71B3D 
X-CRM114-Status: UNSURE (   8.61  )
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


On Fri, 15 Sep 2023 15:19:36 -0500, Rob Herring wrote:
> The "interrupt-controller" CPU child node is missing constraints on
> extra properties. Add "additionalProperties: false" to fix this.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
