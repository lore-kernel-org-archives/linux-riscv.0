Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DDCD3CCA3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 02:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5uaajhN6Eu2NA1eIJqkkFHCFOTua4qapHJLctCQj68=; b=XxhWYUq0MbPNHm
	PoGMAmXzJ89XflEJ8/XiXjsbmZzWor+TgXgE0Wu01yGvvz1GB73q4NM9KGuWgIA9LP3enH16/vSEK
	Dpe7bqg+OCZ1yUeZKj9vbj16uU3wr9nNSHjlnpKvnEa4vriW1KID1CfPfSqWs83H8tm7poK3dI8dG
	uQqOchf/LxP6eUSh9DbaTxwOW5dFIL4/j0+4v8YXT3XnAyacGXqMH8RZx8YppWQmyGLfqC7tylsbH
	ejGO/KVTod5yP6SKTGY7VqsdWgMtnU91knmpM+QyTMRaSGyAAGGuHErEgVMAXFrIvi6W28oshe679
	WIudfl/CPi6YZ7dXfpXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgD3d-0000000BXQB-2jUu;
	Thu, 15 Jan 2026 02:25:57 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgD3a-0000000BXOl-2vmo
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 02:25:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768443924; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SdLcgS0AKYw1OM2EI9pNozj2r+kFAtlgo6Uqeb5bGJak3M13Xbjtt9GAIv8taXGsvwD9hqRZCQtrJn/kD9n2rLrqUe12OgbcWutH1etf4THXoQyKyh8uLqCDFaqFsRHkEPDjuRfjuZB/uXDXVFMdznjgStlfuEFhlXysJuqFgAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768443924; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KjWm5wOna2WpOISnzqb2AoOrQZWydDdpwEHC+FBfdSA=; 
	b=nZRh5JKIGp26Qewfw2ZYTcghWJC1miR80JyBZepVkCLnG+QRvpLmiWLzTik0FxagH7+1O1KUhs6lBVtz2aMdBtwhkCrfwnI+wIx2MYuuPH/zk530wSzSKYNkAn8jT0YiMZk/9NqyVWoZ7ibRmMNwDMYr3Ke120MuabO06E/b+hQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768443924;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Reply-To;
	bh=KjWm5wOna2WpOISnzqb2AoOrQZWydDdpwEHC+FBfdSA=;
	b=Xa1+brfskQG59Bvab67yVX4GtVvPUI0BEyPcgTJ4qigru7KoXIDh5HNrGjnzwZpA
	O5KGuVymC/ztAQgtajaoGgLs3D+qQiN7PkoiKYuoGZczMbwWmMMwlp5qfmM9MtryEyF
	/NQdagYfzoJLhUNrTY43Irjd02Q6/ErceX1uUuto=
Received: by mx.zohomail.com with SMTPS id 1768443921940306.07558282338914;
	Wed, 14 Jan 2026 18:25:21 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 15 Jan 2026 10:25:09 +0800
Message-Id: <DFOT1OLHTY6Q.1TKU3R1DDM5SR@pigmoral.tech>
Subject: Re: [PATCH v2 2/4] riscv: dts: anlogic: dr1v90: Add "b" ISA
 extension
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Guodong Xu" <guodong@riscstar.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Conor Dooley" <conor.dooley@microchip.com>, "Conor Dooley"
 <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Chen Wang" <unicorn_wang@outlook.com>, "Inochi
 Amaoto" <inochiama@gmail.com>, "Yixun Lan" <dlan@gentoo.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: "Junhui Liu" <junhui.liu@pigmoral.tech>, <linux-doc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>,
 <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
 <20260115-adding-b-dtsi-v2-2-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-2-254dd61cf947@riscstar.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_182555_114416_24A19C24 
X-CRM114-Status: UNSURE (   7.18  )
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

Hi Guodong,

On Thu Jan 15, 2026 at 7:18 AM CST, Guodong Xu wrote:
> "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> checking rule is now enforced, which requires that when zba, zbb, and zbs
> are all specified, "b" must be added as well. Failing to do this will
> cause dtbs_check schema check warnings.
>
> According to uabi.rst, as a single-letter extension, "b" should be added
> after "c" in canonical order.
>
> Update dr1v90.dtsi to conform to this rule. Line balancing is performed
> to improve readability.
>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Reviewed-by: Junhui Liu <junhui.liu@pigmoral.tech>

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
