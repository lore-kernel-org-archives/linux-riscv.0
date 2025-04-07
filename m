Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F2FC3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ny9rdB6qTREWTr8gget5RpvrBeoBucGU2v0UWJsriAQ=; b=1sWam+mipMLj3I
	/RQ0iFG2l1eDlxPzKvWjoqP7REhCxHDWensHOwwHEg/ZJRqBbSJmCgi9T5jvCgc3Sqk+EhXFFcL/U
	tKsrjmvyKUoEUnxyKSsj6MFVt2vYR9ANtUqojJfymlwMvYC87iZHJQWROnBKvniGQy1kNxF0459JD
	C7inW1EFhZKzfYO05iwRnsjVXtz8I8Rk4SPN/PA3m87WyuKXXN4QItwYtpzPsDQ17OMALvoeIHEOK
	MXLeaWbD8RutEQzPUHux+RzdraUOWDxyBiglkbiUtA9HGGDX4TTOH6sEHi1fTbtm2O7ggGBpQqVJp
	Sj5Q9H+zJheTHwZj1HqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mzR-00000000clS-02h9;
	Mon, 07 Apr 2025 13:58:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mg7-00000000Yv9-2xvR
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 13:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3911549F33;
	Mon,  7 Apr 2025 13:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81925C4CEE9;
	Mon,  7 Apr 2025 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033098;
	bh=iJcvqyuDnRs1UUEVLb9o2DZdzokURwcVSh0sWsAF0WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shGgD5GcvoukPBR7IKo4QrWf9lMxSBN0wZOrqRrrC5X2KDzeGjC8MA3dF3eWVQ/L/
	 VaMAiey9R8D3X7e75z/KSxv/EZH4m6hFVnbm4MuSEdLPI0pfjWa1i+iSYqpxSnGyNR
	 syEa9hDIWIYB4Cfg/DfyGaIRLKhH6G9AqJG9FfMS9uz2VFi1iuMfZyJgL/79KZ4l0/
	 Ur3cwy2t80bBXz6K/BopNTHi+rfENnFEuMK41pFxWB6eQDFbE6Qx13ILCe9X8dG0zX
	 NK6u//exi8jzgWX6rsgwTxCloOg9TTTgQioF4Wtj5MZKw+ZccCvFFoU3/jjc4iOg8E
	 hJPaHJIY1P87A==
Date: Mon, 7 Apr 2025 08:38:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, ghost <2990955050@qq.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Chen Wang <unicorn_wang@outlook.com>, linux-mmc@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-hwmon@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	sophgo@lists.linux.dev, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Message-ID: <174403309704.2081482.4050249481827035310.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_063819_761393_6235819B 
X-CRM114-Status: UNSURE (   8.08  )
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


On Mon, 07 Apr 2025 09:06:06 +0800, Inochi Amaoto wrote:
> Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
> compatible string for SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
