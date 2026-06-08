Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F3FCD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjEJPtliLv3e3yZt/XpZWkoEYP0iXR2FBLJhDlZjnys=; b=M4iCukPS9OTe5Z
	7AlerWXj1gCkb4eRhablKEKvPEwbKbQNVhQec6yoZkzNG5aGSooekr1eEFvLdxbh2o4IaeGp4e/Fl
	LPCZdTlfgKt2hnSBa8A/MQwpUzyGJqmcWlNE7lprYk3YI/MI+wJSJ97HPEDHlMG5TU+dmoUC3hI4Z
	TDBMxtzyqsSdaEWdZ2TWaEXyfNePhCriaAfraPVvm2tMUcvaGojT8gNossUX+EmyGOSy4tpWtVmDv
	tjJGiHQU8hgY1TV50qPPNM/dFFhylqTPJTs6qyatAjUHfKLSVXovmde2antbPsnzYcRVElrAra15f
	8u1igdz4P5xlbKvMX19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbZp-00000003vHw-3mgX;
	Mon, 08 Jun 2026 15:07:45 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbZm-00000003vHX-3AVL
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 15:07:45 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4864abba33fso3329344b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1780931261; x=1781536061; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPW/j2H7etURcdgtP0gwsW6mmFXkT98v44Yo7M5DhUk=;
        b=enz3maWtYGgSVYPBUpasg0evn8MSRLwYylgcn8t2HnaqxgJb6dz+gYhh7wiwr/kC9h
         ZHgNweBZQevpX4a62ZpT4IOVlhZcpYLqGY3xjH5AyLDTt+pTdxy3XZi4hAUPMJ/iClWp
         nAtjTj9AGXpcETK1Fds4ywU6xSm+COdKYnvwyRBTR/T1KE+U8BhfeVhEW3GKEgc1wLB4
         +3/GD7gX7h3mc0mvMbiRCaMTG03IS7QU0lHtLVM+iicGoHbhk+0SoTXWYs719oNqFkjD
         3TtICTYXwFWUnnrFdOKvk02muRBOoRUt1/IMtdm4RxDw/winlWjW0PpEr63Z/O1ID6/y
         H/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931261; x=1781536061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPW/j2H7etURcdgtP0gwsW6mmFXkT98v44Yo7M5DhUk=;
        b=nKaHbB6oY0WfmoyWcWER5GvjXZMT1MKhDXFKCGziJRVXk6X1fly7DSr2DSAZgekxeX
         gcorp/6NlmsJGdBx1bS94pao2XHmAhoJfGjFYyRw/5R424b+UuNVPLTms6MMAmSAFrTU
         PnvpAGHcemiCB+hPWyqSYwDgySWJ5apFHPEdVpAYu1393kZFqtJ0ybg1ctIeRhuLMNEv
         5jSOgyrDIQqNXZgxphJxlocHz8ukszaNbHnX/352sDzmoJWxv1IqvDhn7bSerzlR103O
         3JSVZ9ensrf/rWy68z0pzN+kv8cWII3+R5WSZaVbIzMp0H/z/d5F9qK0KKn14ii68EfT
         sUNg==
X-Forwarded-Encrypted: i=1; AFNElJ+yYvK9bdleXHOUnW5RTBkN9YikK+vTXN7D8ZOXFuWSXpsowKi2HPcE5JegIOa+k4qsUe78yi9QaXFb3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzzPIuuSnvidxYVAQ/vpl7k0RqJrkEGXTdL2nkouQJvJQxbHJ2
	LzhC5TxUzjF7WiJrAfYZr//PKC2SwBNNmrV3ur+iLnU8YcHkgnYzxVAOWfzFqduPS1w=
X-Gm-Gg: Acq92OFMitXRy45SsZ4jW5oZFIRg0cdeD1p20LS8y8qjYqH4zxbDdGtdnJmFGB38/wG
	3WypjpK2YLH8EzuZvv5hr+WKYIEQe2zid/Q3lHOSTyDop/EZhX7njVaMPyaysAZPWFBwHptrydC
	equl55xs04LY2iQHHzTLY2Dz6NTYnigjiyiv6jbe9qxDDhDlMLgvgCfuZmp0wsXAlwK66R2LD0z
	3SowRN4pnS6iw6bWQrEiKsIHtVPhL+Vj2wFd7IhiQVHacL0oPOSiX8vtu+XQv3TQ/yzKGlcfPjh
	meOwCRYP/vj0Ks7sLQxNoACXu9koVX15wbDh6cY5BanS5obADThTCxXXXw2BR+VTqA/aaY/GKTj
	aBGz3C77Q326jVLlHKuPYMb9lcnQhVAmazsTFaHGerxJECpI3pX6ldhm+CdCa2BydIlOHFUVF93
	R/Ty2Ile56jn244ZEV0r0/6WRA0dLcJMThJHbmXtWOGkt+0Oc06G0WC/ImtokRSdjAfa84RNML2
	w==
X-Received: by 2002:a05:6808:1925:b0:485:50e:5899 with SMTP id 5614622812f47-48692abc2c6mr6386070b6e.2.1780931261172;
        Mon, 08 Jun 2026 08:07:41 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm13657032b6e.5.2026.06.08.08.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:07:40 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:07:25 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Wenhui Fan <fanwenhui@masscore.cn>
Cc: anup@brainfault.org, tglx@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix IPI target CPU mapping for
 sparse hartid topology
Message-ID: <pbh34jxjqrwjdkavt43h3gaizdghjweq6jhcxs44knm76uaqwv@qqmmdelvb7ce>
References: <20260608115935.2194813-1-fanwenhui@masscore.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608115935.2194813-1-fanwenhui@masscore.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_080742_982127_A1184E0E 
X-CRM114-Status: GOOD (  26.40  )
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

On Mon, Jun 08, 2026 at 07:59:35PM +0800, Wenhui Fan wrote:
> When the system has sparse hartid topology (e.g., only hart0 and hart8
> are online), the current IMSIC driver incorrectly calculates the MSI
> MMIO offset for each CPU. This causes IPIs targeting hart8 to be
> misdirected to hart1.
> 
> The root cause is that in imsic_setup_state(), the MMIO offset is
> calculated using the parent interrupt index 'i' rather than the actual
> hartid:
>     reloff = i * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ;
> 
> This assumes a contiguous hartid space, which is not guaranteed in all
> systems. When only hart0 and hart8 are online, the driver receives
> nr_parent_irqs=2, with i=0 for hart0 and i=1 for hart8.
> 
> Using i=1 for hart8 results in using the wrong offset which is intended
> for hart1, and causes the MSI configured for hart8 to incorrectly access
> hart1's MSI page.
> 
> Fix this by using the actual hartid for offset calculation:
>     reloff = hartid * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ;

The IMSIC binding [1] says that multiple groups can be used if the IMSIC
files for different groups of harts aren't located contiguously in MMIO
space. I believe that this approach must be used here, rather than
patching the kernel like this. The same quirk exists with OpenSBI
(you'll need a patch similar to yours). So rather than patching both
linux and OpenSBI, you can try this solution below.

You'd have to change your IMSIC node in the DT from something like this

/* Assuming per HART IMSIC file size is 0x1000*/
interrupt-controller@28000000 {
      compatible = "riscv,imsics";
      reg = <0x28000000 0x9000>;
};

to something like this

interrupt-controller@28000000 {
      compatible = "riscv,imsics";
      reg = <0x28000000 0x1000>, <0x28008000 0x1000>;
};

and the existing implementation in the kernel (and opensbi) should work.


[1] https://elixir.bootlin.com/linux/v7.0/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml#L28

> 
> Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
> Signed-off-by: Wenhui Fan <fanwenhui@masscore.cn>
> ---
>  drivers/irqchip/irq-riscv-imsic-state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
> index e3ed874d8..5f737ec36 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -894,7 +894,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
>  
>  		/* Find MMIO location of MSI page */
>  		index = nr_mmios;
> -		reloff = i * BIT(global->guest_index_bits) *
> +		reloff = hartid * BIT(global->guest_index_bits) *
>  			 IMSIC_MMIO_PAGE_SZ;
>  		for (j = 0; nr_mmios; j++) {
>  			if (reloff < resource_size(&mmios[j])) {
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
