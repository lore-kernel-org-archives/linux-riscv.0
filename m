Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE48EF99E2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 22:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YU69EBW6IKiloogrcOTeDGKoJuFPl6FzAD9WqtRvAB8=; b=imyZbmnVX0MeiG
	6cWafaObh1lPBa7+evPHOjnh8o1IB7GPYI3sPgapNxjGszNRL628UYMKi1ee2qjXTfkL1PMcT0Kw+
	XFLmXFX3RUPtEhwpzViat4pw96+C/IDbZzqwyhM8HKZ/GkhIJTJtqWEQAspo+WZ/PrYK4Awilbu+9
	m95ypeo3LUEk6y/NKn8CIPPOVmkxzu1m2udeOhF+eeoDbjbNqKo/KA55wvSImk4MYMUyoBkhFbeBw
	Q0QM84HIKJZM4OAan/MbeiiQ5rzbwQe3Voi+Jd0jPZyJacHnV4qbBZ4NtQ/3D6SFq+X9gkEKLw2Pm
	FWtPO5X4bXL1fTxgeEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr1Xr-00000003zOc-2vwm;
	Fri, 13 Feb 2026 22:21:51 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr1Xp-00000003zOG-0lym
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 22:21:50 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C2A44342502;
	Fri, 13 Feb 2026 22:21:45 +0000 (UTC)
Date: Sat, 14 Feb 2026 06:21:35 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jingyu Li <joey.li@spacemit.com>,
	Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/8] iommu/riscv: Add HPM support for RISC-V IOMMU
Message-ID: <20260213222135-GYB164498@gentoo.org>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <F9748E3984D2A6F9+cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <a9d9f43a-edf3-419b-bdf7-dbd6bf9e978f@kernel.org>
 <605D8D5AE96AEF8F+31d65ad3-3956-49ae-8d9f-589747a5086c@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <605D8D5AE96AEF8F+31d65ad3-3956-49ae-8d9f-589747a5086c@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_142149_261965_DC0ED3C0 
X-CRM114-Status: GOOD (  14.68  )
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

Hi Lv,

On 11:41 Sat 07 Feb     , Lv Zheng wrote:
> On 2/6/2026 6:44 PM, Krzysztof Kozlowski wrote:
> > On 04/02/2026 10:08, Lv Zheng wrote:
> >> Includes HPM support for RISC-V IOMMU. The HPM hardware mechanism can be
> >> found in the recent announced SpacemiT SoCs (K3, V100), where T100
> >> (SpacemiT distributed IOMMU) is shipped.
> >>
> >> Revisions:
> >> v1
> >>   Initial release.
> >> v2 (sent as v1.1)
> >>   Split and cleanup DT-bindings.
> >> v3
> >>   Refactor using vendor specific compatible.
> >>
> > 
> > 
> > Do not attach (thread) your patchsets to some other threads (unrelated
> > or older versions). This buries them deep in the mailbox and might
> > interfere with applying entire sets. See also:
> > https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
> 
> Got it.
> I'm still using an old fashioned upstream way to collect all revisions
> into one thread. Will align to the preferred style.
> 
Using b4 will automate this procedure, you can also take a look at
Konstantin's articles, and the b4 doc
https://people.kernel.org/monsieuricon/sending-a-kernel-patch-with-b4-part-1
https://b4.docs.kernel.org/en/latest/

> Thanks,
> Lv
> 
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
