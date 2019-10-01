Return-Path: <SRS0=CAot=X2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541ABC352AA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2019 13:22:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2494F205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2019 13:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X++DIi4r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2494F205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uj9B+ipQUb2W6e8iMaoQLABg9ZWJWhnDq1QeKJsBnK8=; b=X++DIi4rFv69mf
	kTbTO9U0aqMSZqFC9Ok0XKdAgU/yn9a1xfCj0NyUeRz+0yMKLyWsc/mR+VL7taBrIIH3QPWWf36gq
	zG9yKz0Wi8l7v+Jv8bJJwaRTzAvBYcYs+0FS00h7iLy18MviVIsAUMJ967FgK50D0w84qHloqZJwF
	MCjjUetbQMk+lghRYwihEaQHAXVVlj21ZdPC8rdnHSSuiw40wLmsnNIsyw316jn+SmrsUpmYzZBnY
	kfyOb4jOSDU051kaz6iH1qaEb79TkTvj7DrtezqztdX8ZEyWv/bj0g580qZZAS1DZzhjxI1RmzOEX
	a/Qa5pixMyyjTUxZJPog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFI6a-0003n4-2L; Tue, 01 Oct 2019 13:22:16 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFI6X-0003mS-GR
 for linux-riscv@lists.infradead.org; Tue, 01 Oct 2019 13:22:14 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 1421A316;
 Tue,  1 Oct 2019 13:22:13 +0000 (UTC)
Date: Tue, 1 Oct 2019 07:22:12 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Chester Lin <clin@suse.com>
Subject: Re: [PATCH] riscv-docs: correct the sequence of the magic number 2
 since it's little endian
Message-ID: <20191001072212.21d55899@lwn.net>
In-Reply-To: <20190916130108.31404-1-clin@suse.com>
References: <20190916130108.31404-1-clin@suse.com>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_062213_544537_CCB61088 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "atish.patra@wdc.com" <atish.patra@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Sep 2019 13:01:40 +0000
Chester Lin <clin@suse.com> wrote:

> Correct the sequence of the magic number 2 since it's little endian.
> 
> Signed-off-by: Chester Lin <clin@suse.com>
> ---
>  Documentation/riscv/boot-image-header.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

So I'm slowly digging my way through my docs folder, sorry for the delay.

> diff --git a/Documentation/riscv/boot-image-header.txt b/Documentation/riscv/boot-image-header.txt
> index 14b1492f689b..f388805aa5c3 100644
> --- a/Documentation/riscv/boot-image-header.txt
> +++ b/Documentation/riscv/boot-image-header.txt
> @@ -18,7 +18,7 @@ The following 64-byte header is present in decompressed Linux kernel image.
>  	u32 res1  = 0;		  /* Reserved */
>  	u64 res2  = 0;    	  /* Reserved */
>  	u64 magic = 0x5643534952; /* Magic number, little endian, "RISCV" */
> -	u32 magic2 = 0x56534905;  /* Magic number 2, little endian, "RSC\x05" */
> +	u32 magic2 = 0x05435352;  /* Magic number 2, little endian, "RSC\x05" */

That's doing more than just reordering the bytes.  Was the original
completely wrong?  If so, the changelog should probably reflect that.  Or
else what am I missing?

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
