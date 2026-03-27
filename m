Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8F510BA445
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eB/cT0U0zKsdGtSMbfwzVHFiO8biIudHFTbye4o4VI=; b=bFbvCxFhI3xwl7
	Ktwbn0wx9IHje7ZOSUIPMjQ2d0NmeJrQgi+ko+YHoq/nADKhDfdKqX/bUfttEce+yh9forvyPbn13
	81qabrTOpNYqq/uXEX30LdW2w+/lQAbxVe6oqyqRUk8MChmqucihvgzdS8o6pZ4ph0O1oPzpAksTu
	+f33GY77HgILTlaeMmzghR+xmzhgEzx64h6oQe7JgFEfvMWU+11zhhM0RHnwszXXqxIMiHF5/zlI7
	FxvQWJfR235H/2SgKPGydLVJeQmwawHpPcjY1DJgM0N2AUQ5A2PLktkFt0lGwFKD1Dp1WNKK72fw4
	u526Zj7lswcBWCM7hlcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62ew-00000006yuI-0Jca;
	Fri, 27 Mar 2026 08:35:14 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62et-00000006ytJ-095I
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 08:35:12 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4842C1A62FE;
	Fri, 27 Mar 2026 09:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1774600506;
	bh=Bmlj2evGzvCDdXu2zq4w5fQ4NVFEoYZiaircgvtA79A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIgjQjuyYayoXKvqB+948SitiIzqSV+efXrNqpt51iCznBGPtadZ1Vxv+iPSnc707
	 Xhu5v7axyumulbmQvOoOVXCqZwZBLY1sFe7YkXcav+0V0UyYoRVjFJNtJUkhVcAROA
	 AibN2Q0XeLDG2ehsRwcYCmo/DncWzE4lWfvrPgh42GZs9TPF9iYAW7ucE6Bn9/HogS
	 5dtJjcyGgextBm9DQuUm+TuEbJ1QlL4MDvqm4dJ71fj2u5hfW4FiahDDJ+oGNNUvwz
	 L8u9uknJ/2s0k0aOGpbX7iGnAe6uFh90plpJS9b+Cv4zRBzYR7qq5DVfnpFRYr1hI8
	 1EycyFgheibUQ==
Date: Fri, 27 Mar 2026 09:35:05 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yaxing Guo <guoyaxing@bosc.ac.cn>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/riscv: Fix signedness bug
Message-ID: <gbresi4jgjmt3cydjftumy7f3afrk2ondap4mx6xfjmrtdnvsq@fpv4htqzdcvz>
References: <20260319182644.1082740-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319182644.1082740-1-ethantidmore06@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_013511_292628_67F96717 
X-CRM114-Status: UNSURE (   7.54  )
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

On Thu, Mar 19, 2026 at 01:26:44PM -0500, Ethan Tidmore wrote:
>  drivers/iommu/riscv/iommu-platform.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
