Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B429C48BF6
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 00:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsoBYEdv/fFkY1Aq5nzaWX3hOVNI19+iqbRMCFqgK0s=; b=LBIh9cLb0fk4+X
	Jp+r4zvqO1l3u81+6WtypgHSbYyUeeSpyaw1CvDNkFsIfH3CUjnJcLB970D01a8QAgfegtXCIDx10
	1c0ThohTjFivc59DmDUY4JfRtwqWR2yTN4SG6mhaThBz15dH58t2LEkEdskYyQGFMtwWJ1iAUT69x
	DZbieWgdLiDU+HK4lH3QTbbB3QAtW1/8sghlU5QvYY9fBEjNHP2V3afWt9Iow5aRpe5non+WnJ1N5
	1GNylYJuFYdBm37J87CCA1+T0YFRczEs451Y/WeEH+goev8Z15DBvlH8CS6EC1InnhJrwVa1n+Hi0
	tFaIsJS8PD47l7prunrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhJ17-0000000BHU1-0Eqx;
	Tue, 05 Mar 2024 00:50:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhHyx-0000000B7DR-2v2p
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 23:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64BA361243;
	Mon,  4 Mar 2024 23:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4986C433B1;
	Mon,  4 Mar 2024 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709595870;
	bh=MLwVgMiS9MXpSzGX1zc0uxa5SCct/8aqMgcl2/E/HR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DRIsSCwQNmRKaCQlUTQflisG+76M/OHZgr3iwCGv3EUOdj9BZ9jxdbI8QFLMuuEXa
	 fVfVcCoY0+CQlY0Efn7Ic6afZXXh28UH9WTBfa6ZTfGoOdKve+VMIgjyFD1EvYtDwO
	 J8Y54AhGFIjTVh/96p0WKxnnok9dM/d7IblJXtdjfBWtTu6DlQmSVL/cLEUpKBdHfx
	 nbhT5AV+gpCVo2z2ZT6o/+1CIVQLJhaO8772zOsz8SQIuQGMQhTvaRwLNggYwWfUJS
	 uqEoaSr+gPtEytQLOglxmlspmssyosl5Xxop2qKaunZtyjjUJealD4D18PYggbzxYc
	 acl/x5Q1Lw6gg==
Message-ID: <b86d6e62-ac57-4bd4-aeef-de37766a12f9@kernel.org>
Date: Tue, 5 Mar 2024 08:44:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: add Canaan K230 boards compatible
 strings
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_919C60B8F6882311AE464C66C86223041F06@qq.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <tencent_919C60B8F6882311AE464C66C86223041F06@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_154431_924255_73940DD7 
X-CRM114-Status: UNSURE (   7.38  )
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

On 3/5/24 06:05, Yangyu Chen wrote:
> Since K230 was released, K210 is no longer the only SoC in the Kendryte
> series, so remove the K210 string from the description. Also, add two
> boards based on k230 to compatible strings to allow them to be used in the
> dt.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
