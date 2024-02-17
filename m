Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C557C48BC3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 14:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJoB2VdRw53W5kTHyyE86ZJCRJhzTH7bq+Mc5liwWIg=; b=jwDsba0De0ldsz
	dBt6xhGG3xVzvqf+Yb0esCO8Irr9r/D7EEkkZh9YX+XaikebzfZCd8XRJyYUE2a/mOpToDYiJNr7W
	ATrpQd+8Dw3f+MSZgg4MrI9hIU+/Ss+fgNMI1OgSBhM+cqxKlejhjgd10ohE2OPTTH0FyARWN89UB
	RZh8pVSE30EFwJCWnJDngcfw3fKHgvKsOSHTsXIX3hNi0KNALYJIx38HzHW+FIYX6CuYCMBPXV+Up
	Giy4eJYMZHZVpaEZ9YHKRNVwS5WMtdeRqhN1R3F33dUJyE56HZr55eah7k/94XNIrC2PATeMbfI1/
	JwXXa7exZ44MA9C2rJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbLOC-00000005nuX-1poW;
	Sat, 17 Feb 2024 14:10:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbLOA-00000005nuA-1GNF
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 14:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 220B060EC9;
	Sat, 17 Feb 2024 14:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D281FC433F1;
	Sat, 17 Feb 2024 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708178995;
	bh=XWQCs6PGhIvYz7XOGx/U7vWKMp1Df65xKPuZVEikzJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkwBQsUq9N5YCk6VRvVLPeMnkI2LhwDQ93/E4w32dYebddGCeu4mCrksJV0riWFYT
	 5PZBd1rZ9XqeHxjzYz5Nx3nZkucqm3ucjZh11p3yuv3kWa3oNJN0eR3+1/umbrEtvh
	 +y9sLIn0BtwYvL6e+UQ2t1jlTqb7Cpud8ofy46e4By3Uf5ViAa2JhiYk20BC18drGb
	 82e83J/W8trX/+ZBO1BDGDzDrfU+nZX1UM0Cn2fr4OlqLmnvDwLHOCfNjydE6LHzgg
	 S6F+Y4l2I4AXW4dNkUVnIqwQ2SN+rUSXY7Oo0UCC5Jln2UM3lAdZCWgWErLURQubfD
	 cJ9srWOSFDiXQ==
Date: Sat, 17 Feb 2024 21:56:55 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: cv18xx: add top misc system
 controller
Message-ID: <ZdC7J-5zUQFHHiNK@xhacker>
References: <IA1PR20MB4953D95E8657A480813767FCBB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49533397F35C450DB92B00C7BB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49533397F35C450DB92B00C7BB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_060958_408296_41DBDFC7 
X-CRM114-Status: GOOD (  12.34  )
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

On Wed, Feb 14, 2024 at 09:35:55AM +0800, Inochi Amaoto wrote:
> Add top misc system controller dt node for CV18XX/SG200x.

it's better to delay this patch until users is seen.

> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 2d6f4a4b1e58..dbf018e99c48 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -53,6 +53,14 @@ soc {
>  		dma-noncoherent;
>  		ranges;
> 
> +		topctrl: syscon@3000000 {

"sysctrl" is better, the TRM name this as system controller.

> +			compatible = "sophgo,cv1800-top-syscon",
> +				     "syscon", "simple-mfd";
> +			reg = <0x03000000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		gpio0: gpio@3020000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0x3020000 0x1000>;
> --
> 2.43.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
