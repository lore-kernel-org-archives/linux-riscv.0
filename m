Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5A1105F7AC
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1G3Wi1mDuXxgJOMsrPRUufNF9kzRlBZJV1Kjpz667Eg=; b=IPzLm5cRRiJwx0
	OgGsqs5avl9mxRFvDfMaIaEq5kDzOo6UrgEI3zumCnp5mPozprMIuKZVlpNEFaFuzM+oVDmBksJ/J
	lkgAff3wIjh3utELiQkE6kBZnFRj7tC4lQ7tapLG323yC+D/ecMNLFzwaRXIZnsWQxbZC0I42ylXH
	np3DywnZ81G2I4L0SnhikcMBYVtQk+5qo4DjLbIOZZJMGDF4UaWZ1uzpuLgp/whk4EZKjQ3GmP0WG
	+uq2Sn7NW9s40/RCgVS6DQgqLsHc48ck+kbkaoNPX7Vs3PxBX36+s+keMYVV1FAf7qwHlaXCrsKYp
	s5S4N7L5P9b+0G7PVPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12iH-00000000I7H-419h;
	Fri, 13 Mar 2026 13:38:01 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12iF-00000000I6s-29eZ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:38:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773409074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cg2Za8ytuaIQiCfO0rTWkIE+v+HBEroNtByDdsDSBreHBfeMZeNo7+Ej3k6Wk2gwtqwjITjDl2dzQ9saaytyAqk0mBXtxHHZ8xmc43MsRsitiGj4L1oTYoKZnXCB3d8oq8owfARqSAzrFjlInNTX9Ux6HyoAKS2uQobybyjrNss=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773409074; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1EMaOoOWPOC7Nwsl+BdHwxbIv8eBJD7gu8iTli3mgVQ=; 
	b=YH5WLgV9Hc8ZZ3IsOSxf4f/ktVGEbcLLk8I/nnkBh82WGfJZl0FZYWBYH5G6qnlKJ5zGVVl7vl8LvoGvK0+dSztQsfooJwgHv5SOFVL22x4mBu7gpWVCrnQWTPxM68pYXS1jMSV5P0f/+rBEZh3c12L7OgEgfUomzplj7ArW6SM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773409074;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=1EMaOoOWPOC7Nwsl+BdHwxbIv8eBJD7gu8iTli3mgVQ=;
	b=Z6kJoduVHRDoY8n9ISMguJSD8DYG8cvzoN3J3a+e1bZP5wXFDVIMFhv0PJEo7QHU
	GuhT1sp7rlMqU8rxhGr5AhJbQBdGJENPmIedV9USaHnutxfyKEzCoMLv1AuZyO3xKPR
	0VFeroTutnQf1Gq9bmD9D1MHTA+uSyO2W4k59eeY=
Received: by mx.zohomail.com with SMTPS id 1773409071410361.89946816641975;
	Fri, 13 Mar 2026 06:37:51 -0700 (PDT)
Date: Fri, 13 Mar 2026 13:37:34 +0000
From: Yao Zi <me@ziyao.cc>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
Message-ID: <abQTHmE_8_N3F-Hj@pie>
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
 <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_063759_656258_59E3CD54 
X-CRM114-Status: UNSURE (   6.97  )
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

On Thu, Mar 12, 2026 at 04:42:42PM +0800, Junhui Liu wrote:
> Return -ENOTSUPP instead of -EINVAL when encountering unsupported pin
> configuration parameters. This is more logical and allows the GPIO
> subsystem to gracefully handle unsupported parameters via functions like
> gpio_set_config_with_argument_optional(), which specifically ignores
> -ENOTSUPP but treats others as failure.

This sounds like a fix and deserves Fixes tag, though I'm not sure
whether backporting is appropriate since no existing system should be
affected...

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
