Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80671CA0FE0
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ubuxmx2FBkrObY39Bvr+6z5uH1X2ij90zrmQXcFw814=; b=fFZ5GS9adLvVYT
	y+gjAIafVd+r1qRevWQnBNg5ecIi8QSSXZi5D+Ab/xlcyBhqdsNjpTGOOMVoT9lvjE/qtT53zQhqM
	8AG1aAeZA0h1wJIvsMJKGQesLTav4sECaJenc4Jzb6xKmzuhKShaDfzlS1z7v1XD7Jv010gbMBZa+
	4tuqjj8rzese9f4noHDT74ZdZDTeqwaN8vV5UuPlF64hC5hhRNPX4JoQjhHFS1uEGvsxpftZH4lFJ
	qMubQvWWfPz49jEdcFomYXP6zCUYzP4fCvQJ86uk+TkVWfN3Md2FgkVYyvSUD1DxuSRW4ToK50X8z
	T0HdkgCwQoEHhhQmRrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1mY-0000000GRVL-2adY;
	Thu, 21 Aug 2025 09:40:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up03Y-0000000G9Xd-0RP7
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 07:49:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C653601D5;
	Thu, 21 Aug 2025 07:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0563CC113CF;
	Thu, 21 Aug 2025 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755762594;
	bh=EPyqC0s/26OqizoQpmqez7kVfjFPxg0Nl0MiV1qYmzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hIdEUQveHZfVUU4/VbsaDLBD9MRJt6XUjS1tFUhNaWF2e/4M4tiGHh27YbnLbrPp8
	 3nCdYVltt5HZbngTjXajE2ZdWMLpav3aLThIDzBVtgpjo6wHfETnM7sHyR2lhaum6b
	 i8n0iOu8417qT/Z1vSYEwQCu8Jj9RBfty8i8M20wXjpTXnLi2uD1fFUbduOk6qUqKo
	 Ixz9xiPat8aK7kuuxCrOGc+ykOV13JXFgTsXLq2AXa79bsui80vl/F9ztoozh2Xfml
	 /7DS7Es3mgDmFosvX48cosd/405VhAJK1hy3J/1TZ8ep/Ayt7l1WTNyl2awe++CCxv
	 HqQl9Xa4tBbRQ==
Date: Thu, 21 Aug 2025 09:49:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Scope the reset controller to
 VO for TH1520
Message-ID: <20250821-delightful-gleaming-myna-f63fa1@kuoka>
References: <20250820074245.16613-1-ziyao@disroot.org>
 <20250820074245.16613-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820074245.16613-4-ziyao@disroot.org>
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 20, 2025 at 07:42:45AM +0000, Yao Zi wrote:
> @@ -502,8 +502,8 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> -		rst: reset-controller@ffef528000 {
> -			compatible = "thead,th1520-reset";
> +		rst_vo: reset-controller@ffef528000 {
> +			compatible = "thead,th1520-reset-vo";

This breaks all the users. I already commented on NOT DOING this.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
