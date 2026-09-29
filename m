Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BECACA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 22:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o47S52MB4d1mOikMpVkaRq3IutyMMxkEHie3d+l0S2g=; b=AY7x+KEYQFf8g9
	yPJ2L6EeXTbYZXh42137r2QVWQW+L4xfm9c+dGRox7QVhtOyYMIJ7JkWhQVUzoSTMHWOaOWyDYuHH
	PYu9FszjUm4fJiwswaosufn1wpMC2Qx9g9sJDIEy+zKwv2O1PsAGcxCWGkYzOcYOBaC5MXV7jBE9f
	xCPr47RjTh9jRnNznpQm6nI4J0YXfGdzaBAbunUJi4rW6N/XKxDZLYJPu7Hm2FZXgDetMmv/rTmwl
	CsRmwxRLM6fjRb8up+xznVZEi6iak4KfIN7IOw45xRUfQnropMwvI99gmtwI0I23L0G5wZeBHevpd
	P4pUzM0SsOb6NAyvKtUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgMp-00000004hxA-1Dd1;
	Tue, 29 Sep 2026 22:32:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgMn-00000004hwv-1LE0
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 22:32:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 66965600D4;
	Tue, 29 Sep 2026 22:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE67F1F000FF;
	Tue, 29 Sep 2026 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790721124;
	bh=I/bcaEhgzy8e0pCQC+W8nr2IsiEI3TWrwkfuxgDwJMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F4kEz2tL1xOIKRb8jVYGqmJR36e6uSsK7t1tz0FlMLlS8gQQJHzEQIdNP3dSG76wg
	 gw8fQa092r1x74CGmtqfvqnXNzxaq/t3U7AtZhN1ARJCkTcLkncKyZpzB79uXfLcJH
	 m6id/fhxlDA3pLkNAaAv/ow6d5izHL4mNiu/QXHUnay120ps+SGgjgVVUNEXUuHXzg
	 EztHMtkJv1BU+lZfqmUdA0yVUk5Q0VEgyU/kVIveAdVm6nqPpCbgnpySU/AuQCxeE4
	 qECwgoTqlKdvotyeYvTiJhuUkJfskZFdSviljSigbb1kgrMMkEm73XAWY+ctpxP8MC
	 imVMBO+8r57AA==
Date: Tue, 29 Sep 2026 15:32:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: dts: thead: add Milk-V Meles
Message-ID: <arw8Ymd-vks6oxi2@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-2-effdd14a76e8@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-2-effdd14a76e8@iscas.ac.cn>
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

On Tue, Sep 29, 2026 at 06:22:46PM +0800, Han Gao wrote:
> Add the Milk-V Meles board with UART0, eMMC, SD, Ethernet and the PWM2
> fan. Describe the board pin assignments and the PHY on the GMAC0 MDIO
> bus. Give GPIO banks aliases and name the exposed 40-pin header lines.
> 
> The eMMC I/O supply is fixed at 1.8 V. Enable DDR52 at that voltage and
> retain the 52 MHz board limit. Describe 8 GiB as the default memory
> size; firmware updates it to match the detected RAM capacity.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/Makefile               |   1 +
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 227 +++++++++++++++++++++++
>  2 files changed, 228 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
