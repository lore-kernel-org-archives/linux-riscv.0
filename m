Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375B3C3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SEUF+JzbjLeJg7RXkcsKyWZcoTXAbnPJdXmdzl4yvI=; b=b6xsWjXizQt/EQ
	99amD2z1BChrg1vCIkO1qKTa2noVEB+bQF5Do6Ys1ZSHnKW490o6mYe3uHCd1Dk5RdgRNLw0hLynd
	O/uq/XR6m9WBZOaDu1It45m2C1PwSwiWSJ5YmliL1bRvVRD0jxvP9u1uvPhZ3aAUhf+sOPW9MPT/R
	aIf1onhxhIRnifXU30hLt2GHOnSGCQSX90rddDQT5q8PMivdZjYEz1FncscZmpywECGB9ZPzoN7dM
	ITOcwACWVAoC6vp2/yUW1446OGezRe0oQqLsg1pIfzVNg3kjf2mUv+i+A3jGH07wQp9rFJT37zEEB
	U9U1mBmE8cWdfTeUznRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDnR-00000007yuM-1tCW;
	Tue, 09 Jul 2024 16:34:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDnO-00000007ytR-3S67
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 16:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BD07614DB;
	Tue,  9 Jul 2024 16:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE01C3277B;
	Tue,  9 Jul 2024 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542865;
	bh=E2za/mh8ktg1bgavQy5omJcI/K13Hs0AayEZ5BBlLwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bE3mYPurLZlXi269n7C4A8hA023tud0MrA3v63hXbQ3NFw2GC5hWWTa4aKb59TToz
	 1xtJP/DTbBaanRoJVTOKJcytnOJS7ny2COOZ3x6VOzt9tSy9WZi9F2j14Lgyt6Sni6
	 SX37n6gPcs9XC6DF8/FxfiJgibtz5X8XUqmIj83Cpqj5zFrKk7oMIqSpAG42IWYJ70
	 xs5oQOjYW6ZBPyNLpIKAFxCgpdv8/HwMM7j22bUiSn5/j0zwmR2Ug46/3g+UnL0Y+e
	 zOj1u7o0/KqQa6aClSyeqKM7HJzRKyaTMwzIzudP565hjVEsayf3nn3FNLGCwVA9y7
	 sgtCwzSR0lMqA==
Date: Tue, 9 Jul 2024 10:34:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v4 03/10] dt-bindings: riscv: add SpacemiT K1 bindings
Message-ID: <172054286210.3798572.13513101197976115030.robh@kernel.org>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
 <20240709-k1-01-basic-dt-v4-3-ae5bb5e56aaf@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240709-k1-01-basic-dt-v4-3-ae5bb5e56aaf@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_093426_920295_3958AA56 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Lubomir Rintel <lkundrak@v3.sk>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthias Brugger <matthias.bgg@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Tue, 09 Jul 2024 03:18:46 +0000, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
> 
> Add DT binding documentation for the SpacemiT K1 SoC[1] and the Banana
> Pi BPi-F3 board[2] which used it.
> 
> Link: https://www.spacemit.com/en/spacemit-key-stone-2/ [1]
> Link: https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3 [2]
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/riscv/spacemit.yaml        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
