Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77763C54E65
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyB4I/cIZa5kYNKjJ6Kgvl/Kl73UtxPcrTC5CvDpqu4=; b=yfUgy41YoBo7Mx
	Eb0g7uN4hNeZiNI9RYyu5+qRebjDsj80em7Qf7zjunHJq1kiqilpPhkKB9z0y3RsRzNkC4HQ/G9+w
	ejM9wytqwP24XZBHn4Q9hC8uwLvDTSZbs/Ul+UvoCdCo/hSRimlQ62cyi2R7RQKl1qUgQYDJnibiN
	ZQJ59J41fKn/t9fbV36ttXf7ohoLmz0WrpflQoU26BwLpcQ7IaO5rnhBJQyQmFAyKtFgHJqDiDmvY
	3lKO79dQiGph6T9Hnc7xxtbKOAObM43eBeI4VGh7CBOA+K4QOAhDW++o88zzWXv1V1UxT9ByKAoAD
	4Q0zoJteRuZiIGHz6pHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfUC-0000000FGWz-1GWS;
	Wed, 21 May 2025 09:11:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfN3-0000000FFRR-46GV
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 09:04:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13D9A629D5;
	Wed, 21 May 2025 09:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDD3C4CEE4;
	Wed, 21 May 2025 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818256;
	bh=/OVUEBvGvRPAZGd3SzU8JAylUHgP7ABuQxE9pS/k7ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAX9/Ubb83+qxDDSeFV7H0dd+Xne8eZrKi/rhRD5AO7cU6QO73W+kSVbaO+jsX2kD
	 S8AOnhpHbgwVppIvj9a5oMTy+M2sTJInqMi2gy1WbxsQJ4eLoVMkyCmjLexnsdLetz
	 Q5OEdslcsSLXO1lMxNTxMjol3RF4U37NL8v12My3fpexungpEjaXY+eS++BF0BHBj5
	 igHZskp/HxLAvbF72Yk8qTstafdFX04GTI20vcKOOCo10prH2nv6MHZm0yB8EkQZPY
	 FGeMq7ov1dxkwDMBLCUUbRkYU4saHCYTPIcOdQPbh2KfkL7AqVg/nbmE4vPjYM657V
	 APPiGas4xR3+A==
Date: Wed, 21 May 2025 11:04:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V2.0
 bindings
Message-ID: <20250521-strange-ammonite-of-domination-b5e4aa@kuoka>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <dddabd3bb2c718a506d2b6669a8252cfe3872fa9.1747231254.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dddabd3bb2c718a506d2b6669a8252cfe3872fa9.1747231254.git.rabenda.cn@gmail.com>
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

On Wed, May 14, 2025 at 10:09:01PM GMT, Han Gao wrote:
> Add DT binding documentation for the Sophgo SG2042_EVB_V2.0 board [1].
> 
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> index 6c82f89b56ca..cbfd07cc053d 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -35,6 +35,7 @@ properties:
>            - enum:
>                - milkv,pioneer
>                - sophgo,sg2042-evb-v1
> +              - sophgo,sg2042-evb-v2

Comment from v1 looks ignored. Squash the patch.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
