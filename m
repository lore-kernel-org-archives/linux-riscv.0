Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40607ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E73720821
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nNt3dZtv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E73720821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJYU8RebY/9HG/9LCtHEYh7UmVBMKiHFf7oPSTNDKKQ=; b=nNt3dZtvShiCGq
	Zo0G3IXN0FwZflihEN59QPspVlqNdoYaxQvjwUdZob6Kxc32sU87U4iyLempHnVxH4ZxtV86k0dOS
	tUe0sdjxyGPfWoRODVZiD+LKGzurF/1kDr0vwrwWhQhJou4s7W2XoGjbmwwb/ULZfH72a46+KWZnJ
	f6Ohrk9d6TpZ4xjM4EQrlUnLeB02jo4LNuZONnVLntNB9fV99IiiHlE7U3HvIhnmapilsP7M/jldn
	6b/IAGcPtjzYl+6S8n+S3GTqyKNlj88IIJp8WNO5oWTqGsdhVOUviorHOuYCnws0gJ3vRodBe0wxw
	m8bLgHPvAf9nxe6LDKiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHjjd-00029T-P8; Wed, 31 Oct 2018 06:12:09 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gHjja-00028o-NB; Wed, 31 Oct 2018 06:12:06 +0000
Date: Tue, 30 Oct 2018 23:12:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Forney <mforney@mforney.org>
Subject: Re: virtio-gpu without ARCH_HAS_SG_CHAIN
Message-ID: <20181031061206.GA2828@infradead.org>
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031061206.gvGYY1Rq_mWNUNM625X3guyghL8xwoUxi_OgqhS7PNg@z>

There is no good reason to not define ARCH_HAS_SG_CHAIN.  To fix
your immediate problem just select it from riscv, as riscv uses
the generic dma-direct code which is chained S/G safe by definition.

And if you want to get extra points do a quick audit of the remaning
iommu drivers on architectures that don't define it so that we can
kill the symbol.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
