Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8006EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 21:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34Uf/nTbVO/aKLRU7OC2t3vAZIDHVhxL8Dj1I+anHXQ=; b=aKTfL93Szp3/Iv
	gE6vQZam9uzZjrcbJzj5oYOnTdBV210afsAED9qvPGIn24ufNNzGkYKxRFnN/En86TVGzMt5wFHbM
	Eph78yMeTK5PVxZS8n94cx6ZUCt/UmKOKkfDPiKXQxAddk/UlO/kbIGq8FSQr+7n4d4kJz23P2t+R
	LOcMKZohBN82H/EWcuk/h/jfiAJqgoA/BZFfldlDPT69hGWm+Hdt5ZDsKXcrkV6Xa5GAJf/tSsQTN
	yHk44uS6A/jiDpUsUmo60/wB277L3LG62Wh4L30ZoJQqdYi4haOKRw2vqYdmOYJjqZmtW6MFlAo2B
	3lVrOSZNYQd4bWYYYgzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMbLb-00CGyW-2T;
	Thu, 20 Jul 2023 21:38:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMbLZ-00CGxh-1X
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 21:38:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BEAF661BEF;
	Thu, 20 Jul 2023 21:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D396C433C7;
	Thu, 20 Jul 2023 21:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689889084;
	bh=nV9JT8DD9nQlYv5u7d4JlV2xPYXbAPq+BOUSU7hHlow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Knv69iMjNrm8SWaPTvyAb6eK/rRaF39bxTpb6R6KBHl7FybaQamR4oVh+OMiRwLfY
	 ATv96ZTLrniHpR8WQp4d34lr1ls5x7O28e0cV2xXceraddwERRMpZITNW8il+M5oDT
	 EUlXw1O3J8kOnkDCN81ezkwo3EVJykwohpHCZFfnYbk3NjDcSvbARbbZXb1Y7AP3+D
	 szifROxwQ+cJNoFJFetW+7yMktE7pioJ358NKiA3DXMmEl4BTQyjyRrMZ4/wibMz/c
	 wk+SthmErIHwcaI1nXAzlA20ETQQk+EDYKC0DGa9SBKnE5U/2iLbyL2F+hu7+zS0W5
	 8lqMn5qTeB00Q==
Message-ID: <69800c58-2df8-25e5-09e0-c9929bae2193@kernel.org>
Date: Thu, 20 Jul 2023 23:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/11] RISC-V: drivers/iommu/riscv: Add sysfs interface
To: Tomasz Jeznach <tjeznach@rivosinc.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
 <c26d029e-dabc-9ad2-ed42-bb6ee276e3fb@kernel.org>
 <CAH2o1u6pMF3MN=oFBcs9kOf-nwnEYfD2Vv=89+DzUanV59R5dw@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAH2o1u6pMF3MN=oFBcs9kOf-nwnEYfD2Vv=89+DzUanV59R5dw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_143805_569708_38370E82 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 20/07/2023 20:30, Tomasz Jeznach wrote:
u.h"
>>> +
>>> +#define sysfs_dev_to_iommu(dev) \
>>> +     container_of(dev_get_drvdata(dev), struct riscv_iommu_device, iommu)
>>> +
>>> +static ssize_t address_show(struct device *dev,
>>> +                         struct device_attribute *attr, char *buf)
>>
>>
>> Where is the sysfs ABI documented?
>>
> 
> Sysfs for now is used only to expose selected IOMMU memory mapped
> registers, with complete documentation in the RISC-V IOMMU Arch Spec
> [1], and some comments in iommu-bits.h file.
> LMK If it would be better to put a dedicated file documenting those
> with the patch itself.

I meant, you created new sysfs interface. Maybe I missed something in
the patchset, but each new sysfs interface required documenting in
Documentation/ABI/.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
