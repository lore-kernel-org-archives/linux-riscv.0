Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1C6E94108
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhaxVCNkQ6jz52SkK5lV37OiF0cdwKM0AcyMUwNEGI4=; b=FGTnb0irdmEv0s
	GXxcUFJeo2EDS8k0Dkby9nV5sm9dC0WnhYi3IHKTqGhTn1CiNnhYClMWZOhEPTONl41MOVDpj3JXy
	1A7UFvMz8srStQoTPtyxTQrpf2Npt0d2FCsqJDWy6+9+ZyeFvM3zVqpDBC+pw5h8BC/jq4pT7fVJC
	gJIJ6S5wv1dVY5yaZG97t1dDSqmxstfLw5OWoq5lJvox3szLdgUQSW2eWzLRxByKa+9CaV7iXHQVr
	oCR7GGrTZgCSFgUdCZumJP3o6eU+gu1kaKvadlWcBg1LKmN5IgMGiywc0gibEFOX7rDE+Ob/Xe2Eu
	tCkKS5IJq+Vd7jhnMJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVlJ-00000004e7C-1nq5;
	Tue, 30 Dec 2025 09:11:30 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVlE-00000004e4L-0khK
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 09:11:28 +0000
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowAA33Wgtl1NpHDdYAg--.1201S2;
	Tue, 30 Dec 2025 17:11:12 +0800 (CST)
Date: Tue, 30 Dec 2025 17:11:08 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	alex@ghiti.fr, cyy@cyyself.name, kingxukai@zohomail.com,
	TroyMitchell988@gmail.com, gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH 1/2] dt-bindings: riscv: canaan: add 100ask K230 boards
 compatible strings
Message-ID: <aVOXLPijq8iByiOy@duge-virtual-machine>
References: <20251229061318.16756-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251229061318.16756-2-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229061318.16756-2-jiayu.riscv@isrc.iscas.ac.cn>
X-CM-TRANSID: qwCowAA33Wgtl1NpHDdYAg--.1201S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4xJF4rAw4xJr43tr18Xwb_yoW8JFykpF
	Z7CFWUKFW5Ar1ag392qF4xKa17Zr1kCr13GryYyryDKws8AF95t34fKws5W3W8ZF48JFWj
	9F409r45CFW2yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07U_HUDUUUUU=
X-Originating-IP: [223.160.207.108]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011124_616939_BFAAE4B3 
X-CRM114-Status: GOOD (  13.17  )
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

On Mon, Dec 29, 2025 at 02:13:17PM +0800, Jiayu Du wrote:
> K230 CANMV DSHANPI is a development board produced by 100ASK.
> 
> Add compatible string for the board and its SoM.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
> 
> The hardware details are available here[1].
> 
> [1]: https://github.com/100askTeam/eLinuxAI-TrainingDocs/blob/master/docs/CanaanK230/part1/01-Introductionhardwareresources.md
> 
>  Documentation/devicetree/bindings/riscv/canaan.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
> index f9854ff43ac6..b9f095bc6021 100644
> --- a/Documentation/devicetree/bindings/riscv/canaan.yaml
> +++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
> @@ -48,6 +48,11 @@ properties:
>                - canaan,k230-usip-lp3-evb
>            - const: canaan,kendryte-k230
>  
> +        items:

Sorry, I didn't test the bindings before sending it. Now I realize this.
It's my fault. There is a minus sign missing before items.

> +          - const: 100ask,canmv-k230-dshanpi
> +          - const: 100ask,canmv-k230-module-dshanpi
> +          - const: canaan,kendryte-k230
> +
>  additionalProperties: true
>  
>  ...
> -- 
> 2.52.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
