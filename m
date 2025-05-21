Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A98C2D0CD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpuaBUu+4qh28iq8v8BqtANTv2giLHYrvsdclIRH51Y=; b=XkCQ5UsbAvWUgp
	/Tjz4aYAMNyAfznxEBgH3HJfoTvrRPexVvBCAyjOmo1WPlQ8yaF3HR7opT7S6x0XVoVqKXfDYqqGS
	qLvGrj/1mOhm9wzYJMEnYmTRYNOCSsQEQMdHTbhHZp0jbrG1anJHjQ90MNU6BSa17RJL6uDdqHckh
	I4ifCUeta4UbJDTY1nQbdLqaQ590pEx0HmOvFd0K0wkiPHjkmeeazm0voNOAWMmFtmIAIAzEzIQZ8
	efCTzrRt/ikesGbb27lz4MdZiOK8U98QTFiGrskBmHniyIZefZcbDLilQWY0CED8Nm1Ml8gfL1dOj
	bgBQL3w3rVQtMzC/VqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfUC-0000000FGXH-3cZo;
	Wed, 21 May 2025 09:11:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfOF-0000000FFdZ-1E8V
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 09:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 579266000A;
	Wed, 21 May 2025 09:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A326AC4CEE4;
	Wed, 21 May 2025 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818315;
	bh=mmqUXpMc6TlkAa2xMaHSr9ct20LHhndHE4Eb2UUfBzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2+GyFMdiogbhO42/5OOkH40tI5wvQI9T06584b2BHrNgHlQmUkYiLgBZIF7Xiz0M
	 QJsve4Q10lDnn4j3l8as/pVpQ/E20ULk5JXcrve37azofc+3a2Tczi7o83Qyt2dTQd
	 71JIsoNoo8Jw1AJ7UgFZj8XGUTWypzyfT4oOCorE4ByJWtRsV3jRtd1YkcclTuZPKH
	 URhZRdN9UG1N5bjYLbDAcx/iSm7cx+9u97T28G0JR/M7VCewzOj3TJ/dNqLZLMXtZy
	 zv/k26YX40CeNEBhi7ng7rI2qnJvaor4fiO7Ke0q9KK1hIhBxPMZ1SbbDgTHb0SIbv
	 hC2weHWwOXQww==
Date: Wed, 21 May 2025 11:05:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0
 board device tree
Message-ID: <20250521-cream-pogona-of-awe-b61cf4@kuoka>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <53a9a794641af697be9170e6d0af464a39d862ae.1747231254.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53a9a794641af697be9170e6d0af464a39d862ae.1747231254.git.rabenda.cn@gmail.com>
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

On Wed, May 14, 2025 at 10:09:02PM GMT, Han Gao wrote:
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +/ {

Why do you have two root nodes in a file? That's not the expected
syntax. Really odd/unusal.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
