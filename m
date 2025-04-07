Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DA2C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEouoIc0f7iE18P0paCjZLhuvMncsS9QkJNwM1n7VMM=; b=B0/L95lCUB2+cS
	9UdkaYDYJ18QBMYeQm5fg5oJDdLKu5HWnHaUnloY2AmfugYblk0L0L5LL8ACj0hRveiq77QXoGzNi
	1370HwdPSfuArcjmw/kuZut8lJUO7krQq4VdEvO0DZor1U37XVxeJ2x4ea07r7aZO9hrC5nVrjDE6
	nFGPnoPp0xf150TyEtjRReJxitLqSK7vj39sg4XAS3yblny098aqXtvWGEGth/UMbXJyeDD4Goj75
	GfvrNVxBZFP4dtKAJDoh4G+jnwgChS8+F4P7kAEsy2usO1EjYwxcUdfN6Y0KzaSyXqwFyie2fRZvq
	I+CUIh3MNWVZvAYygQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1o9W-00000000tru-1FEY;
	Mon, 07 Apr 2025 15:12:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n5P-00000000eOO-1qJY
	for linux-riscv@bombadil.infradead.org;
	Mon, 07 Apr 2025 14:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HYqdenrFTRKxevjzZ6LW80052XdpBs0pbJL0MAh+7Cw=; b=U++Q7Tne6MusTL0k7ABodzo+ld
	ti0hqh2o9GXQRzBNqaKaxqcgx0RjSDO4veDPqtF9XUaCVSbP6RO9y5wvFe5plQcV+mKcmNXogYp/5
	AHWhQR/rf5jwbkJRQWf1oNBR2H4YC6UzVu0fwbZNyGJeHWVvCf2nmtdzM5A2meF2ztAG0XrNLn5lH
	UQ9erpQN799gHqyLOyqqHvHq50Y/AQbdayG2c/jJz1D8gW6qj8LqBfPMUuUv5F9JxBk4kESP55rxE
	8XHFv2oDWIfd2jrlXd5dgmXfcUJ0/rNOqSdwLZU9cV8VSydEnbPC7gfN+oz5eHGVEK2AUA7QO09pk
	QC0k9fww==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n5L-00000007y73-1y6n
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74F4249EA6;
	Mon,  7 Apr 2025 14:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A14C4CEE7;
	Mon,  7 Apr 2025 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034662;
	bh=9XG8FxASO50Sf5GWUZAuiznC1VGVDHHjVjUYicIPg0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lm9MTLWM98znlU9G5vV2Xo5NhFHRhWUWVzbOpr/5eS8fxUIvzqxS9in87kTfpRtKv
	 WlIzspzrZPd36MSFuzEInhkiI04F0htNcjJQHWJWzQEjKFWDvvk+Xv4hvJoZzH1FxT
	 pk0kFhUOeK0bGUPJJciBAE5vDKXxf8DZSfBQpy9moR/hcwfd0IlDU2CVOFharyugdv
	 ymAtSu9pJQsqkfMSNx4eRKhLOPETJcNq9BwLY9PCJe1nCJH0uKpUd4GcRr+JhP2YXo
	 xTDuKmcmfdT6KQSK3Q9NnkY0MfcwxMkQ1wzEnWBJTAzsCR6tBmciOVpO9Flp136l0D
	 xnDDfDRzdzBVw==
Date: Mon, 7 Apr 2025 09:04:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, sophgo@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>, ghost <2990955050@qq.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Chao Wei <chao.wei@sophgo.com>, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Longbin Li <looong.bin@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 8/9] dt-bindings: riscv: sophgo: Add SG2044 compatible
 string
Message-ID: <174403464532.2172777.7350680687448047256.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-9-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-9-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_150423_800855_7EC9579C 
X-CRM114-Status: UNSURE (   8.09  )
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


On Mon, 07 Apr 2025 09:06:13 +0800, Inochi Amaoto wrote:
> Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
> board.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
