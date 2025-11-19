Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EF5CF31B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 12:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57f1XCXnRmciILHez+TfU40odL/zGHcYZayPIqKmTH4=; b=QNsFJfdTfoEblB
	9R3JHYtHY4TN9cVMGnVV9DSqKqnohYjQTxjDj6x3xZaUj58SOLsqaZVoBruMNeUA1XOE5VF/wIo/N
	/ZuxmVYKPJr54XgWUAgPJqREYmHII39utQV0i3JbI8olVFcpP3sZGXL4FpBxxndo9CGlKP3hZZu9D
	RCITXhyclyKj82rYKN7kE+vKUdsgnhinbB0G7wfgomK32DeyEZ5txse12P+Oo0rQ7HM/zkQqInBct
	Xi7mbxJLHNITzU2ra5GFN5N31AWCRusncgmwpiOLiW42p3tRD0++DpP4WStLrmyvKa0PcYzW9a6ph
	hmHyORENemWcDJxYzO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh4D-0000000364d-3x8p;
	Wed, 19 Nov 2025 12:13:45 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh4B-0000000361p-1RS7
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 12:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763554295;
	bh=84K3nB6P3f7jaLk3QXNeVG5r6HVoItxT2o3+Sx3KhXo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Sk5KYcnWX1ubprEXevmxMbtQ/K5HOtureme4/Mt6gx6hCLk/rugzWKSTrOyPjda41
	 /2+o2t56uO8g8JZQGv41WUhUkAMXSiQ1egSrH75vijECcS/GILpprife3lW5jfcmZG
	 ZobQaBrAwzQYYpe0SJhLHNAOZW8JxMmwLsNGZUPU=
X-QQ-mid: zesmtpip4t1763554289tbaf07528
X-QQ-Originating-IP: TDvSvCfL9BCTc8r2vjv8+BrgnY+PKM0ZxPKhhUXcHh0=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Nov 2025 20:11:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16475274264780386058
EX-QQ-RecipientCnt: 18
Date: Wed, 19 Nov 2025 20:11:26 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Message-ID: <AC00D74FCBA8F87C+aR2z7i1n4_5tELvW@troy-wujie14pro-arch>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
 <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251119-i2c-k1_reset-support-v1-1-0e9e82bf9b65@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ocns8ug84zPhyk0jplkfMooNPowoNxk4/W7POa7M5oK/uVyrLusHHgt3
	F+0Tqkn2b42YXL/cUN2BX6XGOEXhVEAym3xSoOr706nuVjvPZyrqL+0/AXk++U+iq5hlWgW
	fbF0XcH031FwikfuFgKIdEzZ3hW6ubZoTD3ZPLRSijdbFrPiTabOU/3dxaqttqkJDv0PUiR
	Hjrw0gQtZQ6A9YAdmrd2konpeYQYrGWYbXAJRXuM+f7EqlDI3uDNSKfbm0rFROswhfZcg0E
	ZYq91Gf4nB+JeLbL/rnFhxGn9olquzl8XaGOt0UyYbm1Cw4zPd9x1s3fWN4/udN6fgGE5ZT
	uDaqzM+6Z+2NPDQVYdWAV6TqUKm3oKYgVsxdUJAVUV0l35/NjqvXHXxC5dD2Br/PtgLOnPC
	HWUE+Hi5EToFnbGh2UyFPPrLm9HpCQ+PjZDMmUGY1TbcpQEu9z258YW6wWkeJMj7FtfLk8K
	j/wNCgcDBjVMRNTuMhJZPIb9765AWWOwaP0oMGnBM/2nTYTeCLrdFrIYybimrJN38Gy8nrl
	G9bUYAeORT+BDyMxFGSjGj3ky3pCNh5CSxL6SbiYdeK8Ijv3q3mvHKCBzfEsAbbtSonQQlC
	auhWOKSVU8dHRN0UMDPdcW4nmvdgzJSSfZprtHb6I4lY6bUOIC9ADNIhWMS/zOqYDnLm4ym
	n4Rqm8JRv9L5kF4/v1srK4dS4B071xbSQG6fEipEI/48tuOiiD/ozpytkGMPlam8C6Z27ym
	al4OKguGR3tjqsMdtLNc4JNyVdbCtM4VyHBaV/MwmmZhPESKp8QGpjLxCG6nw/HKyqwVLB1
	HIQSwgKzK7wzIdTqsF5Sqys9jzoM2IRYgJr+bWgcNH42rAJx5wD0CbibSSOSSvV9wJ7WzPK
	q0qHgDgasbdtTUkM7YYj17WhNLFaJs+7iMxr1meu2m4OLc8ap1PMDqoycqys+OHweKmcim/
	puFcbMPGzuncnhHdKrxqJhMyVXTans0/U+FbZBz3MOhBizJoMfWdPdNbElCqbGBsi9r1ZeP
	7JZ+q14lIIi/5wbmPASXf7Us4wqQ3YcIrRGJ5I3G7f9en0ecGQ7xK4h/tArgg=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_041343_757458_5A7F2D7B 
X-CRM114-Status: UNSURE (   5.82  )
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

On Wed, Nov 19, 2025 at 07:46:43PM +0800, Encrow Thorne wrote:
> Add optional reset property for the SpacemiT K1 I2C.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
>
Thanks.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
