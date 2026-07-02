Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA5DC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ft+laCyTQMC1WrkgrW/B87HicR0zINGnMS5YPyNHALg=; b=QxpuN9nb6g83GK
	YhancgefnUejL3oV/aJCA/nJPh1ok8JB/0Jmw/0J+uLhRe0Km5RjNwHggCQs2Ic7RvqPbMK6k/PMO
	ueQudGmbL9OjKEeyhE1x44g9zDNe66DDMtLt564yQDcQdue9OH5oGkGxa93D/Nq5/8JDyw0sg2JwW
	NXBiOeLnYsWhSMSUiTjqC+H1ABRyXovZUK22y4FoP4TxS3PagjrGx4n0tq/uDukXoXjnEYpd/BipD
	pZaISqjf8K/hzYfWqdV9fnTngI6GGHU8URHHUTinwscErej3ViaNll4jGTtlbnQ12p8Sf+91kadYf
	sPS3zeYKUEvhX3iO7U9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKAj-00000004z4q-2y46;
	Thu, 02 Jul 2026 16:21:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKAi-00000004z4i-1ZR8
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 16:21:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AD93601CA;
	Thu,  2 Jul 2026 16:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAEF1F00A3D;
	Thu,  2 Jul 2026 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009311;
	bh=lRYYfuzSFOeRYJmv5cGsJm2KFhklobIhVjufiS+redM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=htVfk/trvNAhdz5EgvVqZggl3T8bU4hz3U6oSLizhXEk3qThqH20gxrU5CiwHTRsU
	 9EnrfDOZxbrZQI1ZBdWAxM9SQr/A5duQR1wxwTi8k300wQiY0mnyNDgjxteyX09xlc
	 5kBywlNeIjzldoQUpMHO335lTjyYrrvwuuAPwrXvSRc2YVMpekFs3EN5fwAdRx58Gh
	 aHFob/YFUb7yh2hvOR0bkTQS3Heimnq2veu2PW4zpmsznZ0g+729gQDUDUI6bjQDuJ
	 7kF8HLbvNoyabpInTuS72WHN7MVqpsVnpFP4mFCkLuyyz7nXOE4bUdy//+qHvG07Fr
	 Gws/FRVC2IlNg==
Date: Thu, 2 Jul 2026 17:21:45 +0100
From: Lee Jones <lee@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH 4/7] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Message-ID: <20260702162145.GC2108533@google.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>
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

On Mon, 15 Jun 2026, Pinkesh Vaghela wrote:

> Document ESWIN EIC7700 SoC compatible for syscon registers.
> 
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Doesn't apply.  Please rebase.

-- 
Lee Jones

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
