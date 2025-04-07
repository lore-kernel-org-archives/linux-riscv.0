Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348D1C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/iyKbQv2Kmu+I8efavcMzIMsbXHvhW2lj/cZ7oi3Cg=; b=Zv2QMQhkQDNDZB
	Nc0K8CjAZSkrUC+lgOPsZKy8dXBrczcSuJKMv04bKPCN8eJATzztD+6/yNVPRZHyWSvsf0NhTu4NV
	jBxc8yJSMHwAlDg5JaAyMEJhpjwAU26cQMkAUwne653a2x27GQ9XSJ8998407DJp8LV9qOhvZEjq4
	FX+0ga0mVtLYqSJu7vNdBJRHcBpPvMIxnFBz2pNGg1j6FLOuyw82QWvWaMo4vV7ZvMlgG9erwdD2e
	VBOKxUIbqHkQZPgOktkURSr61dz3e5B6lbciCNdKJPQ1PkzcofRHp22huOqb7XhhyYkmZCKYfVSoH
	LJ331VGyma7w3tRAe6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n8Z-00000000f39-0Tfd;
	Mon, 07 Apr 2025 14:07:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n8X-00000000f2m-24Kq
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AF9349F40;
	Mon,  7 Apr 2025 14:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C053FC4CEDD;
	Mon,  7 Apr 2025 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034861;
	bh=TaujOUNY4+EkrJXwK4q0mvwGc8rH8Q3ZdBnCxuWnWYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVtMEVp7APvFMAMDPfhn2yiDcq2izHGAQlMMWiPOoJwr+963UufgWNee3eLIFVFyU
	 DfJY3Fjp+29pbzG9eo5FpmuOxsmDFCTMp+C1UleMdOibV3YOCTBep+huhmU1BMJP/M
	 Dn55qS1ZvyrYeU0hMswrMaxHpk77qyncbDtsZYK7QShkChdL4UWZa+6SGpeLQ8vjM7
	 gRdaghF80Olla4zzvrnEl4ySwUgoZR/+3suNZo8zhkQ5Iqog4w7/xEuN0S9oH7S+o8
	 Qwqkj9mGIhRROpgvtO1SB4v2jXsM6fHHYFNzz6iIWT3KB/O/8m+JYJmyM34WoGkJhw
	 vhIEoDBDfBYcw==
Date: Mon, 7 Apr 2025 09:07:39 -0500
From: Rob Herring <robh@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, sophgo@lists.linux.dev,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, dlan@gentoo.org
Subject: Re: [PATCH v4 1/2] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Message-ID: <20250407140739.GA2174606-robh@kernel.org>
References: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
 <20250407-sfg-spi-v4-1-30ac949a1e35@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-sfg-spi-v4-1-30ac949a1e35@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_070741_548337_BBA37F65 
X-CRM114-Status: GOOD (  12.92  )
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

On Mon, Apr 07, 2025 at 02:35:12PM +0800, Zixian Zeng wrote:
> add compatible property to include "sophgo,sg2042-spi" for
> the SOPHGO SG2042 SoC SPI Controller.
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..94102d94ed5dffe889a8a11c1c637d466713c208 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -88,6 +88,10 @@ properties:
>                - renesas,r9a06g032-spi # RZ/N1D
>                - renesas,r9a06g033-spi # RZ/N1S
>            - const: renesas,rzn1-spi   # RZ/N1
> +      - description: SOPHGO SG2042 SoC SPI Controller
> +        items:
> +          - const: sophgo,sg2042-spi
> +          - const: snps,dw-apb-ssi

This and all the other cases with snps,dw-apb-ssi fallback should be 
combined into 1 entry.

>        - description: T-HEAD TH1520 SoC SPI Controller
>          items:
>            - const: thead,th1520-spi
> 
> -- 
> 2.49.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
