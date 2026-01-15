Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24114D41175
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buVKmWagkTJkGO7puwvFGovV0O4T1T53PukuEZhNR64=; b=LyGX59hC9Ve+6d
	eJALAIWXmTS3IQKk7LLQ9uWfglYnJq9wbKLW+rz43iodD0kH6F+F6ZnORKph4j2/kSOeqHHgNFAbz
	eIADYlvVdIyE1Wf03rrHkZjgav93S8Nis7cQhhkjnDQI44qJfi3W9gyHY2FQPo/BuIuwTuklFs2gP
	WFde/EiVCxOgt1C5fti/ukt3YZnQgHv1ACmoVJSvO/4UgN809urrEGUDv8f1y/ibBn0nJ9q4LiotY
	jB7gaPEGbeLlsc2s5ThrjqGUcU0Rdo1MFK7HD5tWDfAkZFrGDIhVLRA/aSemfe2WC8TYPIL1qPNHp
	HHZKBCYZzFnJfVraVHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLhM-0000000CEst-2F4P;
	Thu, 15 Jan 2026 11:39:32 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLhJ-0000000CEsP-0eUE;
	Thu, 15 Jan 2026 11:39:31 +0000
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-05 (Coremail) with SMTP id zQCowAB3zhHf0Whp6EcVBQ--.27569S2;
	Thu, 15 Jan 2026 19:39:13 +0800 (CST)
Date: Thu, 15 Jan 2026 19:39:11 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: vkoul@kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, cyy@cyyself.name,
	alex@ghiti.fr, pjw@kernel.org, kingxukai@zohomail.com,
	conor@kernel.org, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	neil.armstrong@linaro.org, gaohan@iscas.ac.cn,
	linux-phy@lists.infradead.org, gregkh@linuxfoundation.org,
	18771902331@163.com, devicetree@vger.kernel.org,
	TroyMitchell988@gmail.com
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: dwc2: Add support for Canaan
 K230 SoC
Message-ID: <aWjR3zQqgi7ZHUEZ@duge-virtual-machine>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn>
 <176846580373.38125.3306033410225962520.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176846580373.38125.3306033410225962520.robh@kernel.org>
X-CM-TRANSID: zQCowAB3zhHf0Whp6EcVBQ--.27569S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1UZFW8ArWxGFy3uryUJrb_yoW8WFW8pa
	y2ka9I9FZ0gFy3J397tr97KFy5Xrs3A3yftr1Ygr9rtF15X3W0q3ySgw4j9F1UWr4rA3W2
	vrWa934xGrW2yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bIBTOUUUUU=
X-Originating-IP: [183.192.221.134]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_033929_591549_766C21A9 
X-CRM114-Status: GOOD (  16.38  )
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

On Thu, Jan 15, 2026 at 02:30:03AM -0600, Rob Herring (Arm) wrote:
> 
> On Thu, 15 Jan 2026 14:42:20 +0800, Jiayu Du wrote:
> > Add 'canaan,k230-usb' compatible string with 'snps,dwc2' as fallback
> > for the DWC2 IP which is used by Canaan K230.
> > 
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > ---
> >  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.example.dtb: usb-phy@91585000 (canaan,k230-usb-phy): reg: [[0, 2438483968], [0, 1024]] is too long
> 	from schema $id: http://devicetree.org/schemas/phy/canaan,k230-usb-phy.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
I will run the make dt_binding_check, and then fix it in v3.

Regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
