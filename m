Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D065FC624D3
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 20:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBfnFefFMnUMBX28NBBjTRBMiVykhCBMtekojEgUTjk=; b=AbgrXORY9YPCS0
	jE79difXaYY+pJ+0kmAQ2KhMPxKUyUnyBvUlTSfWGZzTo0rnuFycSEojUhViVMnqv+wUoLxFc3qKU
	iYfoqEUqGEIh7XG8N7FRlarczmUbemoiVkP+RNv+GfieiOH3yMFK1ByDtvd7bU1CN2GDEG9BPjG1d
	2+yhUtcQzk7Z861okLfv/4JIpQ90DXxcdH9G4FA2Xzm/2nlrYvvpNHkDNizCDWEIJWkxcLqbQtQ4G
	q0sT2Lv1LYX/6nfNi+rAdpkOm5GUox6m0ivtu5zkScUU2dr9I7XiUlhZhUsF7v7YqQu4lenJcP+gr
	s22CSE1E/ym0deEu+YWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aaF-00000003Gdd-19H4;
	Fri, 04 Sep 2026 20:32:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aaE-00000003GdS-0FjY
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 20:32:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE6DB40974;
	Fri,  4 Sep 2026 20:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F421F00ACF;
	Fri,  4 Sep 2026 20:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788553941;
	bh=faGt6RM9nZNDLVI5nWQekSsP9/y8RIHlIgi2gEzyN+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BNXVkHm2rG8675ikzmcjNnHgunSqXRbTTuayweLcKMp8l7UE7v92MRw5pWImYbIz5
	 lGYTGnfotzQUypdlQyN7Yc51U7QJ5LLsGIhcBgkp965Qb2y8OUXTpQpulEcztklLIW
	 iPRAYMyLchGPR1us8b4z6VcIyOqcyTX1RzEGyPXuRdFVLIbj9IiciQUehrSMirVvWg
	 ZAOBV2jL5frRz9h01vDYBVEYypKroLjgNUFpuMV5o2Hyt6XBxXeYMqmsPnBelfmqDl
	 /cltB37YfZEdHn0FG0F6R30iQ3ZjfIG1mmYh9KAAA683HakS8XUxINeWODQGHQlCGx
	 XYTOO9LiVe8aQ==
Date: Fri, 4 Sep 2026 20:32:19 +0000
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mmc: spacemit,sdhci: Add tx delay
 property
Message-ID: <20260904203219-GKC1974@kernel.org>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
 <20260902-07-k3-sdhci-dts-v1-2-4e7909cf4233@kernel.org>
 <20260903-tactful-scorpion-from-nibiru-a4ebe2@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260903-tactful-scorpion-from-nibiru-a4ebe2@quoll>
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

Hi Krzysztof,

On 15:00 Thu 03 Sep     , Krzysztof Kozlowski wrote:
> On Wed, Sep 02, 2026 at 07:03:13AM +0000, Yixun Lan wrote:
> > From: Long Wan <long.wan@linux.spacemit.com>
> > 
> > Introduce a vendor specific property to configure the step count of TX
> > delay line which should be applied before RX tuning, compensating for
> > board level trace differences. The TX delay line result comes from test
> > out of real board which vary from different hardware layout.
> > 
> > Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > index f35bf7ce08dd..3399a2d076dc 100644
> > --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> > @@ -63,6 +63,16 @@ properties:
> >    pinctrl-1:
> >      description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
> >  
> > +  spacemit,tx-delay:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> 
> default: 0, I guess?
> 
It's actually 127, I will fix it in next version

Also in my second thought, I will change the data type to uint8
then drop this additional minimum/maximum property, which will
 also simplify the code with device_property_read_u8() a bit

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
