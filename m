Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC14DC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkjEaswHp0eGRso5LRFHGPKuVG/DJylzzAllkagV2xw=; b=y0YySCJq3DmuiN
	NmNIU10AlKYI2XioC0MbTv6Zku8Y2n1rECL4fBlUwjBIFYuy/AEMC+xT88sdWgSsYYlPBaRbRn+Mi
	egG2lXr1XMIxeW8FWbLI1SvHkDEreeKhcm3N8CNRBH571KSHAAHCuMs4v4XlHNM+gug3o60AQEsNi
	DICxLi9SQLTUAVsGRMY3uXo/AzXCvkeidxNXM9RadwhF7iNSXjs2JQBMa64RFIbdi/IGCxHM0FcBf
	K9eIemvTrbk5zElUEabie4+4TRYzcUytmcQtofBtFuIJEywemtqlT65vv0Ab1PTTopXKu5iw4TIK0
	gFGNc2B2Kt6djQls4pWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8p7-0000000CA1e-2R3o;
	Thu, 19 Jun 2025 06:32:33 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8Mn-0000000C7UE-1q8a
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 06:03:19 +0000
Received: from [192.168.33.139] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAA359UdqFNolI6KBw--.6418S2;
	Thu, 19 Jun 2025 14:03:10 +0800 (CST)
Message-ID: <123a7558-fda9-4b56-b6ae-a29d704419ac@iscas.ac.cn>
Date: Thu, 19 Jun 2025 14:03:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add support the SpacmiT P1 PMIC
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-2-elder@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250613210150.1468845-2-elder@riscstar.com>
X-CM-TRANSID: qwCowAA359UdqFNolI6KBw--.6418S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XryxCw47JF45ZF1fWFyfZwb_yoWDAFX_ur
	93uayDtrsrJFn2kas0van7AryfGr42yr4xXay3JFy8J395Z3Z8u3ZrJry7ArWrXrWUZrn3
	Jrn3Xr40q3WjgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07jm4E_UUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_230317_852558_15ACAB88 
X-CRM114-Status: UNSURE (   9.64  )
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

Hi Alex,

Before the patch body, there's a typo in the subject line: "SpacmiT" ->
"SpacemiT".

On 6/14/25 05:01, Alex Elder wrote:
> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially we
> only the regulators will be supported.
>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
>
> <snip>
>
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@41 {
> +            compatible = "spacemit,p1";
> +            reg = <0x41>;
> +            interrupts = <64>;
> +

(Not really a review, just a note.)

I couldn't believe it at first, but it looks like the SpacemiT K1 really
does have PLIC interrupt 64 dedicated to receiving PMIC interrupt [1]
over pin "PMIC_INT_N".

Regards,
Vivian "dramforever" Wang

[1]: https://developer.spacemit.com/documentation?token=AZsXwVrqaisaDGkUqMWcNuMVnPb

> <snip>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
