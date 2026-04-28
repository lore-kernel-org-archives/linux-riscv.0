Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4897EFF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKfRSWQnXUH8eTrVHJ0viOZTDAgNSlwJ67168PEm9I4=; b=Lw/SXFyUPLdIuB
	DYI04IpwAihhp8Vxy4M/3EIAnnbxlian7t6cuXG3DK5yY0Thry9uUAlPAcriz2ztMl6yDUfXSJ+pM
	FkwFTt8nrNK/CEvChZ8iwJrQ4iuPztLf0sFCf/nKJmTnxoh6KttZAJ/cQrz9VuObKvaEVETvsKQZ1
	E3Onaozq3sbtESXe8+Uw4RQjuXwNhzVazLV3Q+tqf8EfLhRXyrzYdqbPRKzi2VN55+zdQvI3Dgx1W
	tvf5nVK3H8N08OOz7My17s4yAd1+r4smX3UodX8KDQeeDsoaB8v2gArI3gctPNh370HG15WGtspsy
	xftWkS8IHP4O1XShxjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiZ9-00000001YLs-0L4m;
	Tue, 28 Apr 2026 13:33:31 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiZ6-00000001YKt-1shS
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:33:30 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-56a857578a8so4226841e0c.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383207; x=1777988007; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OngaHwDgRXU8aplL5gx6iXCqNmM7ax8JTAiWS4ELs6M=;
        b=UKfl+mkXxz7lFYhLmBe7xnihmyUW5ZHsuuuWQVLaebXOKqYSwf6LS4RDmcrCeKWumd
         dJ0scKtQI0AaJhThMUvybajFi6J+7Y57yk77TGkQSMLf7+wVL671YQrjMueyq8k3pwx9
         RiyhpWIu8yJWRT+dFuIRCB70AIvFPce6l1XYRLPcs8m31LesBQL/zVgrgmjNSnpjbnVn
         gwXJuxqNDtoHJ7CRUFN6iifUoLTDMa3XGbBUgImbQ7CGvhFUnSJOagKmAPplDyCPbJbY
         DuLsRCQ/J8k8tsA3ec1vf2mSaYJI7By0NRn8pkQgOgv+PfhffbQ4za5l9y+zzE1BHcE0
         QY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383207; x=1777988007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OngaHwDgRXU8aplL5gx6iXCqNmM7ax8JTAiWS4ELs6M=;
        b=JhP2UmJWu6qam/Wi2F4zZxRu8nRlKaXUTgyE4kPOUgzYY7IYavrfDi2DvbFcvxmom2
         SwFGi+IgJZENYIpIHMkzvl0NkoCSaJNE9I3RCWistpJBCwTVFFYzFNoSbdrcTUMp2rXu
         SviBa9byfdFznY2oQoDdriwHDfOJ13BVIfMa6WnFoOg3Y4/E/cBkvbCHO102mNsFMIo5
         LyE37xT8403CagfVdDbTP0Rd8Jt8j7CX79SIGxQvkdbjUEo2grUBxvNG6KM1MbUlXDUE
         UqJPyQbKIMStrPvCW+9rFj01Du46e0noAFPQSstZqSvu/TjB4vciXoZwNgI7YUToAF9s
         2/lA==
X-Forwarded-Encrypted: i=1; AFNElJ+znoOPa+erS2i6M8QL4dKxjLtVN5fk97sU6dGT5Lb0q7h62BtPnlL82yINFwCB9kR7GTCifCp5Qg+3Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXj5YERxAD3vyKg7ozzEzfPBamoVL3yiJN2iBc768FX97ZNXya
	GExl2zwuLhGF7pUJoNQBJuX7segWavHZEE87V024T249DKLRUsQ2+6kEonKjH8iKut5+qUG5t5U
	9MIq/woM=
X-Gm-Gg: AeBDietTOMKI1VD7Pcorekv9LZtgUfT4sAoSmUB262V4CZGurlf9t9mVrUwTbYBrPfX
	joJ6VPHZe6t0QfMjIQUPqdcxNXOJ7ZHSFDGEUDDN+HUfxFG29pApVJbYR0D0+Xkq57cxe7Rmo8m
	M3ouEqKrf3IxH3z8C0uW42+ZZOTRS+Wnzvy5pKi/cTzP3AXVOmLYecnuqZZSNXASsvH06xckJkH
	C0PocwiqtnUrRCovFoHd+csZPJXA/FvJuSoxlW/0EgUyRJ9XSJNyrfi7lsEyYCd/qSveTBbkMG5
	UM9R2H3tKkdx2AeVhK99LQCvVy4ZJvwsoSqJPVmlW5/0TLbcPT34hC3RlEeZeCM1Sn4PFZ7KN9X
	TWkxLXF+XPpMcpixrpp/xdA05oOXSdbsG3y6gEk9SsVbT6epR5SlCFrttBeX9n6uxHCKt3LYNdd
	4DBiQ33k3ecbbTShywCHuKRVosPK58slZdzNyV917fz0XYRtZ3fQ+lrfVVVtxpO4OFfZ13VnjIJ
	ekqEJVpcP5ESXWp
X-Received: by 2002:a05:6102:f09:b0:607:4fe2:a647 with SMTP id ada2fe7eead31-6280afc7cc0mr1065240137.21.1777383206848;
        Tue, 28 Apr 2026 06:33:26 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e2842bbbsm19645216d6.11.2026.04.28.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:33:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHiZ2-0000000AhmN-3Msg;
	Tue, 28 Apr 2026 10:33:24 -0300
Date: Tue, 28 Apr 2026 10:33:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 02/11] iommu/riscv: report iommu capabilities
Message-ID: <20260428133324.GD849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-3-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063328_486591_BBD76A00 
X-CRM114-Status: UNSURE (   6.70  )
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

On Tue, Apr 28, 2026 at 09:13:50PM +0800, fangyu.yu@linux.alibaba.com wrote:

> +static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
> +{
> +	switch (cap) {
> +	case IOMMU_CAP_CACHE_COHERENCY:
> +	case IOMMU_CAP_DEFERRED_FLUSH:

IOMMU_CAP_DEFERRED_FLUSH is not needed in v7.1

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
