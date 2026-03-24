Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DE7FEC11B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 22:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/x47qKNzjkc3jZO/DZ5UIGR7X2V59yFvndtQtSWet0=; b=w0EacbWzHu3qsP
	3GSTlmXbVnLC7zvnCdxtKHdJnHzNYgVACBlnKtqnymBMKKbDJMQB9dJUmtdowwtdYNb8BdTnrleFW
	qJwUyZxeS+Hlo26SfJPeYN3E1YxLAmKD41j8pZXdYy6RNG2rXcs8+RE10zpmC13f2kstH4yjW5GW2
	LzFZQzZeUssj58o9+Ft8O1Ap0DmS1G8ySIxLedXofx2UqRwsX7NTKDYCswd9cidx9T0mPvZHeday0
	+w80fhzm/fM/tL8NnYNRlhocwVxVkHE0034s4LIjC9pzZB46Uuecpvcph/8xvewCOPy+nYd0QBAag
	nMA0ljq8X5Si2iAdFZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w59wh-00000002HoU-2Cmy;
	Tue, 24 Mar 2026 22:09:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w59wf-00000002Hne-08tO
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 22:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FB404442F;
	Tue, 24 Mar 2026 22:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4452C19424;
	Tue, 24 Mar 2026 22:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774390192;
	bh=7j8Ky5lso1k7J2uDYMW9hlAWHsxyR7vRQ7da5WAJfEw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=tuXinN2+A68pMTzb1oX5TWUcCu3BHM7Gkw0cdO5VaoJiw0yAVW+FaC1osUUNSIjvO
	 yKfi2qeDVFViC2Iuja2kaNFYuUCpfaE4RZ46wRugPwNGxOZPwiPoYRYVhdfOj/14DL
	 jBCyZo7wMmgy6DX3fcOGsXlEzY7pB0uw7N1M2ElDyjq8T1F0B66qD5TbRJb43LU0s9
	 IA7J5U+zJcSwWBGT4m+XhD9mOI9sGWlJ/YOsjklMtuuv23Om6JACnH+3YvLptzoQf0
	 YR9ZS++mfRRaOHfK1hcRgw9xgiOwG2VsaOYRY5iofCsOlRHFnJUeTVJF7OAKhQwQT+
	 9gMcSwhW4QQoQ==
Date: Wed, 25 Mar 2026 06:09:50 +0800
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on
 Milk-V Jupiter
Message-ID: <20260324220950-GKB767626@kernel.org>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
 <20260324090220-GKA739629@kernel.org>
 <acL_xPYiGXUp_Tir@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acL_xPYiGXUp_Tir@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_150953_089794_1A029117 
X-CRM114-Status: GOOD (  18.00  )
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

Hi Aurelien, 

On 22:19 Tue 24 Mar     , Aurelien Jarno wrote:
> Hi Yixun,
> 
> On 2026-03-24 17:02, Yixun Lan wrote:
> > Hi Aurelien,
..
> > ..
> > > Also add the bootph-pre-ram property to make the device tree usable by
> > > early firmware/bootloaders without modification, as U-Boot is stored on
> > > this NOR flash.
> > Is the dtb file actually used by U-Boot? I'd highly doubt about this,
> > if not the case or has not been tested, I'd suggest then not to add
> > this property..
> 
> It is currently not used by U-Boot, currently SPL support is not 
> available, but patches have been posted to added it. I just wanted to 
> anticipate the addition of the Milk-V Jupiter board in U-boot, but if 
> that hurt, i can remove it (or you can removed it when merging).
Not hurt since it isn't really used in Kernel, but I just don't
want to add things without test..

I can remove it if there is no other changes, then no iteration needed.
Let's wait a few more days to see if people have additional comments for
this series

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
