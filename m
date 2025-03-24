Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB881C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooIiWzMn/orx+V64/1iEh/ebiwejF8a3VG9EtDTVq7w=; b=IPZT76rtIBhghK
	5ChpzH8XZ6E06d8sAxvuOIPR/IFupwtP8XdMUrCwuIFWH+EJj1fZ5Gq64RzmE4YvwMRihHFOGOQRC
	FRTUPR6fgVdgAairRwNIguOfg5MGPGR9L04tF/zAcnQrr55q/v9PHb/FPUYQgK76XWItcxPihhHOf
	T2m05Z4hEIcONZaLeTYbyV66mX5gr8eM2+39MK7nbDYcFdkO0V/wc29jk3+UAexWuEyaf6Sus+57Q
	voIP4kQIRAwNLvSmb+V0UA8TL+QAFk65TDKAZmfhShW7EtrwzYQvqb1IQijKfQGCBAVt+xYOIkW1k
	Glu3vkG8QwfWlxXJB0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twgnv-0000000339L-17ob;
	Mon, 24 Mar 2025 12:21:19 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twgns-0000000338x-3v1y
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 12:21:18 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id B3637EC59FA;
	Mon, 24 Mar 2025 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1742818874; bh=9gpFd8EFx60nBxNFMoV0usv+BAC3zxeWfcnDeFxbqxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDbmyv6vIYVR4mO3RtZFWbK2+WP/H3WVLmsa5FJ9uNKgtGEb+SL3kMQo4Fnv4nVHf
	 wmOyvW81EIWY2wwa6lRqcnC7SrSFjU8+56R2qa9PNSGBE9GUAGJp7bfUKbsSiuezMM
	 +HGX90qUPKmNEsaoMroHF+qzA8ksiYt0pfdGVmNyKX9Sm6oDI87CCQsF3cPE7P8Cci
	 SdMlddqRc9LMcXW76hxh02VTKMw2QtXC7mKPxC1GsGzmmL/yNK77y5a6h8yep5Nvvb
	 K7+oISqlEPE2XiUFtAo73s/ej8k5uNvtKueS+OraDQK/7XwtAbBk5gC2jQe6jd7KnV
	 svZwHSRWFsyRQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSqTSPtA-cE2; Mon, 24 Mar 2025 05:21:13 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id A56AEEC59F0;
	Mon, 24 Mar 2025 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1742818865; bh=9gpFd8EFx60nBxNFMoV0usv+BAC3zxeWfcnDeFxbqxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKaMpdNisRVneY5YjfL44Z9h1qM+1S/RZ/juY/PjwDLMi8svonxhF8S65hOXoZT4n
	 Yeh7TYUS5Bgl/2Q6CBHJ09DUIZhAjsfRKEG1jCTNwqzTC+AWoYWmZHOiXdsPzhSEnr
	 3aAPSl+cZ6eEz8SZoopFeidMCnwhq24C85M9qyy1FT/qt9wEYxJaWzXHB/762GkWkH
	 OOK4riQLivvaYP+ECV2jv9AT0iiaDPwwTINBtsSCyncm5081eJL+SdciOvReu9hXj9
	 pvvtu5hQQVQHcKS8GHN7Rlkod1B8eyr4/Anmn3uXRK+nKHivgiYlhn+v4ZOGBMBfvp
	 wSYqGy8b5Osng==
Date: Mon, 24 Mar 2025 12:20:52 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, p.zabel@pengutronix.de,
	mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
Message-ID: <Z-FOJFHOsU_dLkmS@ketchup>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321151831.623575-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_052117_301904_FC67B975 
X-CRM114-Status: GOOD (  24.91  )
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

On Fri, Mar 21, 2025 at 10:18:26AM -0500, Alex Elder wrote:
> Define ccu_reset_data as a structure that contains the constant
> register offset and bitmasks used to assert and deassert a reset
> control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
> a structure that contains the address of an array of those structures
> and a count of the number of elements in the array.
> 
> Add a pointer to a ccu_reset_controller_data structure to the
> k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
> the new pointer field will be null for CCUs without any resets.
> 
> Finally, define a new ccu_reset_controller structure, which (for
> a CCU with resets) contains a pointer to the constant reset data,
> the regmap to be used for the controller, and an embedded a reset
> controller structure.
> 
> Each reset control is asserted or deasserted by updating bits in
> a register.  The bits used are defined by an assert mask and a
> deassert mask.  In some cases, one (non-zero) mask asserts reset
> and a different (non-zero) mask deasserts it.  Otherwise one mask
> is nonzero, and the other is zero.  Either way, the bits in
> both masks are cleared, then either the assert mask or the deassert
> mask is set in a register to affect the state of a reset control.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index f7367271396a0..6d879411c6c05 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c

...

> +static int
> +k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
> +{
> +	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
> +	struct regmap *regmap = controller->regmap;
> +	const struct ccu_reset_data *data;
> +	u32 val;
> +	int ret;
> +
> +	data = &controller->data->data[id];
> +
> +	ret = regmap_read(regmap, data->offset, &val);
> +	if (ret)
> +		return ret;
> +
> +	val &= ~(data->assert_mask | data->deassert_mask);
> +	val |= assert ? data->assert_mask : data->deassert_mask;
> +
> +	return regmap_write(regmap, data->offset, val);
> +}

I don't think it's safe to write the regmap based on a value read
earlier without the regmap's inner lock held: it's totally fine for the
clock part to issue an update of the register at the same time. Without
knowledge on it, reset code may rollback the clock bits written by clock
code earlier to the original value. That's why I keep using ccu_update()
everywhere and dropped ccu_write().

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
