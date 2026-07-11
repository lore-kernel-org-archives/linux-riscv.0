Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B97BC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 07:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tcGfA7PPWu97SK44HODS72lsVt0EpbHJB7fh8wjehw=; b=lCjHQwi0XFSyep
	5MzvL/sB2lRXiBQ/Hq17zqN0L4b0HVnNgP8PRxfZIg0hkBapYrG6N3B/r7I6ecK1V8paLETO66sB/
	rcFFS5cVJ+6IgEfvNqSvYTgWag3Io/nB1QpmVtZLIGgeUwsN556O7VpRwyFohEh8MMqLQZAzI1ooO
	rFqupLDGAnn6wnOkuNitj8XwrzCOkMDc766M6KATBhIiYdwKYO7PLNkrNAl/NAJyNaD+0e5L3LCxJ
	3bKn3ui2eZ48cxYu/aB2bIZso0+Mj5tQp0r86AuQikfniMUqCgWkwUFvA1EnchS7k9f6I8CdXXz9W
	gXPclvMH7yaWRcm2afYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSOQ-00000006KeX-2vwr;
	Sat, 11 Jul 2026 07:44:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSOP-00000006KeB-1Ybo
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 07:44:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 550DD429C8;
	Sat, 11 Jul 2026 07:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3ED61F000E9;
	Sat, 11 Jul 2026 07:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783755896;
	bh=b0CpmOWLm2vb+ALVgOzFuf2ikhKbi8vr3l51aLzsp4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ek28vN3IHp2WFK7uen+eCu8vrfSzkYl6XFS2Rgqux3Rwn3djoDjd+uFzkKG6FPo+7
	 PxeDmXVumlVj7ghYyfjp4i5Kq+n+Qg/rcRq0pd3YQ1tXUl25x87uvRgfGnd5yJ5v9t
	 Vk0uGNFeFlRKtN8PaFNCykAhv1Hq3XL3AvGdeH3cdr/dyXnAqTVbA6ZViyStlTsCE6
	 0IsWM2TSev3ruqOuFIpihZTiBT7edbqkdhpPN6gPjsYAA2sStd5CfR2r2RjWa6PG/7
	 TK8T37e1P1aRUF/KQxyirmS0smYjrftZEBJG5/FB+U1uXMp6D5Hh+aQlrjXoeYeMI5
	 b+/eeiBJCKGcg==
Date: Sat, 11 Jul 2026 07:44:52 +0000
From: Yixun Lan <dlan@kernel.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
Message-ID: <20260711074452-GKB36656@kernel.org>
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
 <20260626-shadow-deps-v4-2-bba9831f2f1d@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260626-shadow-deps-v4-2-bba9831f2f1d@mailbox.org>
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

Hi Shuwei,

On 16:10 Fri 26 Jun     , Shuwei Wu wrote:
> Add CPU clock properties and OPP tables for the two CPU clusters in the
> SpacemiT K1 SoC. The OPP entries use voltage ranges because the CPU
> supply is shared by both clusters.
> 
> Enable CPU DVFS on Banana Pi BPI-F3 by including the OPP tables and
> wiring the CPU nodes to the CPU regulator supply.
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

Looks good, thanks for working on this

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
