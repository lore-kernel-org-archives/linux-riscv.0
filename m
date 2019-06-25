Return-Path: <SRS0=f00Y=UY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88544C48BD5
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2019 22:34:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 594F2205ED
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2019 22:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VX3DQ7xd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 594F2205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCQehv4x9+Xijmc2N98JgIC6FZo2ZRkrLULU50oOubo=; b=VX3DQ7xdNQU5Ny
	awpHBvU8Lf7dhLYaRA3gZ3co32vtoH2jbLCByPFLt1pwERU6jS/c4gci4MDQp/CiuC9vLwjDB/MT8
	4eYYZ4Jg1i+w3w6TWIA0EHWVHyAD+2BTrt1IY3mPoJdDLOBwHPX7uoI/azug7Ol+gUhd0zBwgO+jn
	2j9TDS0o3mpg2qUIZ/jl91zC/amj5V42uHFxwaOTldBN2iHAz1RIHi/sMgrx0n9INEPf6h/mpho20
	O7aUdJjvVAxBDx5cJbU5CXMlpdbtBpcf7Y7qLFUr+hYUtkgEgVDrMqCcq4XMg1V5900smeIXF1zS+
	MeC8zZ+NMdnK0ImKuo1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfu19-00023d-W0; Tue, 25 Jun 2019 22:34:24 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hftyh-00074N-9r; Tue, 25 Jun 2019 22:31:53 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hftwb-0001ZR-4N; Tue, 25 Jun 2019 22:29:41 +0000
Date: Tue, 25 Jun 2019 23:29:41 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/17] binfmt_flat: consolidate two version of
 flat_v2_reloc_t
Message-ID: <20190625222941.GA1343@ZenIV.linux.org.uk>
References: <20190613070903.17214-1-hch@lst.de>
 <20190613070903.17214-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613070903.17214-9-hch@lst.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_153151_439427_DDDC0FEC 
X-CRM114-Status: GOOD (  12.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 13, 2019 at 09:08:54AM +0200, Christoph Hellwig wrote:
> Two branches of the ifdef maze actually have the same content, so merge
> them.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/flat.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/flat.h b/include/linux/flat.h
> index 2b7cda6e9c1b..19c586b74b99 100644
> --- a/include/linux/flat.h
> +++ b/include/linux/flat.h
> @@ -69,15 +69,13 @@ struct flat_hdr {
>  typedef union {
>  	unsigned long	value;
>  	struct {
> -# if defined(mc68000) && !defined(CONFIG_COLDFIRE)
> +#if defined(__LITTLE_ENDIAN_BITFIELD) || \
> +    (defined(mc68000) && !defined(CONFIG_COLDFIRE))
>  		signed long offset : 30;
>  		unsigned long type : 2;
>  # elif defined(__BIG_ENDIAN_BITFIELD)
>  		unsigned long type : 2;
>  		signed long offset : 30;
> -# elif defined(__LITTLE_ENDIAN_BITFIELD)
> -		signed long offset : 30;
> -		unsigned long type : 2;
>  # else
>  #   	error "Unknown bitfield order for flat files."
>  # endif
> -- 
> 2.20.1
> 

FWIW, I wonder if keeping that type is worth bothering.
Something like
old_reloc(__be32 reloc)
{
	u32 v = be32_to_cpu(reloc);
	int offset, type;

#if (defined(mc68000) && !defined(CONFIG_COLDFIRE))
	/* old m68k uses unusual format - type is in lower bits of octet 3 */
	type = v % 4;
	offset = (int)v / 4;
#else
	/* everything else (including coldfire) has it in upper bits of octet 0 */
	type = v >> 30;
	offset = (int)(v << 2) >> 2; /* or (v & 0x1fffffff) - (v & 0x20000000) * 4 */
#endif
	...

and to hell with bitfields, aliasing unions, etc.  Unless I'm misreading
the whole thing, that is...  Greg?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
