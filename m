Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88B4C83030
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 03:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:To:Mime-Version:Message-Id:
	In-Reply-To:Date:Subject:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQPfSIg7ghIob8lkz9ViSbtGAEoxnq6zedm5w3VoNs8=; b=mMxTck5Fga58jT
	ZrtjyD3fDveOtnerFgsT1IGPoVB6D+fIFfd+fq/+j7MziMSspDi8uLznTcHzX+FrzVcWp69ff7ZrQ
	dwzW4scZMvfCA1UibBx9qXoYrl6tBH66QQpJGzXFJvxTcnBQVYqSWuEcCo6pPi9HjKg5aR44VYKPA
	ZcW+LksIf0csnNLWaZAFWe6fDVcos42XO2kM4wDt0x334goYoCPltcg9/cNmL/rtel9FJJdVixSSH
	Ho8xg/iY/iZEC2a1Ta8aP5wjkhoMavxNs/pcpiAOhVpfVM8cL7YeXkgxwvt8us/Wa/78kAPllV12P
	Vy8yj7d2DVbByrr2/RZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyt3-00000004AWB-0PRG;
	Tue, 08 Jul 2025 03:20:53 +0000
Received: from sg-1-12.ptr.blmpb.com ([118.26.132.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyt0-00000004AUm-2vPx
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 03:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1751944844;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=6n3AcRO1UInIIx5xP9ytyTrFoeD+tlmMSa9ec0eVTSo=;
 b=Ue1gy2eFuQuDVBytQP+0t6TeYW8qdUZNqN9GJpBSKoGtO2+3gaC+/qXxV8PfVpXEvf6qIe
 yaBhMg5m05rMfjDCYx+V5lSpoSdV8s+4+FWsd3nzJhMPwZvRozcMKB4g/KICuq2Ymg/kj/
 Tc8/ktNP0e7GM2bCosPC6N0GAfpAguOl0vExFVIDua+nBplKP+KxL0+Ucf5jErzdw90s96
 hixFKaxJ22um9t3V6IsXmRxcBp5E2h0cEqbEl05NsjmIXTZ8wyOnHKYcadZV/ajB5ow64b
 e6Jt4wkQe7m6fadsWvHy1ZUgmEoypFkj27HEasbY8l3dpESwTOGy4cyAcl6m5w==
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 11:20:41 +0800
Content-Language: en-US
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Thomas Bonnefille" <thomas.bonnefille@bootlin.com>, 
	"Guo Ren" <guoren@kernel.org>, "Chao Wei" <chao.wei@sophgo.com>, 
	<linux-riscv@lists.infradead.org>, <sophgo@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Conor Dooley" <conor.dooley@microchip.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
Date: Tue, 8 Jul 2025 11:20:38 +0800
In-Reply-To: <204c8214aa084d592e8dc45d6c5ca23381937b54.1751700954.git.rabenda.cn@gmail.com>
Message-Id: <bc047c7b-c88f-438d-8f0d-0f593dfcfbe2@lanxincomputing.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+2686c8e8a+1fe456+lists.infradead.org+liujingqi@lanxincomputing.com>
To: "Han Gao" <rabenda.cn@gmail.com>, <devicetree@vger.kernel.org>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com> <204c8214aa084d592e8dc45d6c5ca23381937b54.1751700954.git.rabenda.cn@gmail.com>
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_202050_917052_8963DFFC 
X-CRM114-Status: UNSURE (   8.31  )
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

On 7/5/2025 3:39 PM, Han Gao wrote:
> Add DT binding documentation for the Sophgo SG2042_EVB_V1.X/V2.0 board [1].
>
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

> ---
>   Documentation/devicetree/bindings/riscv/sophgo.yaml | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> index b4c4d7a7d7ad..e21b65938a65 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -34,6 +34,8 @@ properties:
>         - items:
>             - enum:
>                 - milkv,pioneer
> +              - sophgo,sg2042-evb-v1
> +              - sophgo,sg2042-evb-v2
>             - const: sophgo,sg2042
>         - items:
>             - enum:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
