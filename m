Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E14C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D6060E53
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37D6060E53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGhdeFvTDDbBpivOYzbLIRKIFiPUImLIh2XoPcfCEnY=; b=OjSv04K9t/Mee7
	zh8RIZ03tC0GRt+EKRyFTu1oOjxV1YkjUpe4aDSPkvPK2zoqu1c/WIKAFhgVKyH73HxRNI5YVd13R
	qBq6bBIXDtQCABQ8sBPVI5xkeP4CYykYfMrnsvZKQa1nGAfGZeeNwNCioF39whMnGaXJPeUKYLbuF
	fTBulAc5YgKc5Fo3I8CjNLyrlg/r9NZnhKcRw2trmxMDrHq5j9ZorAOMbPynhMQ4OkzH6mc1sayv6
	HyNS9jYtANCqIyNWGLwI16URhyL5tv407sdh+bEgJzz3E9zZ9qZDVVpT9ynLdkcKu3TkkGIAmUzMU
	6QoFB33acGtfsnFDnNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJvC-00DNv5-Ro; Tue, 12 Oct 2021 15:42:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJuM-00DNWP-EO
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 15:41:42 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1maJu8-0006eg-Og; Tue, 12 Oct 2021 17:41:24 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com, maz@kernel.org,
 tglx@linutronix.de, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, guoren@kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: update riscv plic compatible string
Date: Tue, 12 Oct 2021 17:41:23 +0200
Message-ID: <3384738.8kAFQ6LgSR@diego>
In-Reply-To: <20211012153432.2817285-1-guoren@kernel.org>
References: <20211012153432.2817285-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_084138_557524_BEABC4BD 
X-CRM114-Status: GOOD (  14.05  )
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

Hi,

Am Dienstag, 12. Oktober 2021, 17:34:31 CEST schrieb guoren@kernel.org:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add the compatible string "thead,c9xx-plic" to the riscv plic
> bindings to support SOCs with thead,c9xx processor cores.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 08d5a57ce00f..202eb7666f9b 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -46,6 +46,7 @@ properties:
>        - enum:
>            - sifive,fu540-c000-plic
>            - canaan,k210-plic
> +          - thead,c9xx-plic

Devicetree bindings shouldn't use asterisks (the xx-part).
Instead you want (probably)

+          - thead,c906-plic
+          - thead,c910-plic

to name the specific SoCs that plic is used on


Heiko

>        - const: sifive,plic-1.0.0
>  
>    reg:
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
