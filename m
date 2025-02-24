Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719E5C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 20:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=friQDabYG9qig9B9oIN3G+QurbvMTm+xlxiKsp2Ve8o=; b=q89dysAmmMqzyb
	b0E9m/z0QhVmcqAcEVlUICrvb/cOAhA1Kmtl5Wq1ZVZ3v/8UGhF7o7jcQYZapVjjV44VKF7MPW+w6
	Pd1NMmms6i8bvjdkaKes8K3N/0VQ5aBEEYxLe4NNnVsdwkGhVo+m+0TUTohGrf0umVtdKkV3aFWmK
	cyrRtGCQfrTdbHxCazGr9Z0/B+5HFmExz2LHaG1N8F+aaBb6MgWL6ZaEwsJFzBqhsNGI4i4h1whnh
	FgMYrwDAiWvauO1g2SEE6I6MU8dbyAXsNnGWfP4Z6CZG85/v1orTkxcE1VDn6IkzxeG2/qkFNY3e9
	ySHqRIHUJj5nmpB7tnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf3o-0000000F5gK-1OYZ;
	Mon, 24 Feb 2025 20:28:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf3m-0000000F5fk-3d8x
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 20:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 308616112C;
	Mon, 24 Feb 2025 20:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17C9C4CED6;
	Mon, 24 Feb 2025 20:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740428893;
	bh=0m0T6PyoD7xkTGj6kIv+HfKEEBh/taWnpcicr5ltFaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4pVeK2SAold59ncUwUm/pyD8iI0WLAIYOKhCWSX+LTScDIKxbZVAfK13ab4tYsk5
	 xN76WQSCw2MyPUtuJK2U0YkMfc60jTSBPzuprSJqQ0PlDcIk7WBNUYAqdPW46lSww3
	 QchBWaPqYhjQRSfImW42wQ/emDJahVcxkcKf+Ri9fdKXNp1ID+7H3WEpAGF05TwlAU
	 1mo7Z4mTO0pdL4LyIq66nL0KrO1BA3YpKnnRLo2kmYQTCvjGueaUxTXeNFO+Zqsoo3
	 Ai+j4rHfKFzWTB6RSvPTEOiujr4rV0NvRIvQE6uBFeQn1jJSFJswqWEBrgHIzGuDM2
	 rKQD+BMM0EyOw==
Date: Mon, 24 Feb 2025 14:28:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: spi: add Sophgo SPI NOR controller
 driver
Message-ID: <174042889175.4042827.14947254444698691602.robh@kernel.org>
References: <20250224101213.26003-1-looong.bin@gmail.com>
 <20250224101213.26003-2-looong.bin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224101213.26003-2-looong.bin@gmail.com>
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


On Mon, 24 Feb 2025 18:12:00 +0800, Longbin Li wrote:
> Add SPI NOR driver for Sophgo, including read, write operations.
> 
> Signed-off-by: Longbin Li <looong.bin@gmail.com>
> ---
>  .../bindings/spi/spi-sophgo-nor.yaml          | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
