Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F4FC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 22:47:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B6321721
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 22:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fcW+QR93";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FkH69yTi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B6321721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NX5oFq8R4sFgWoP5EuXvxun48oQgSmBPYrpaW6Ury/c=; b=fcW+QR93PP6DDy8C+zTtSHtyB
	dEKwnH3m7++5SSTKObM6GiOpqkw3yFpwTHQlZAMkCgsVPC/1aJzMOpDItbX5chIJDUBgXVxys5dcq
	TlK5HcqfzoS2YXCNm3o9TKOL9zZJpDJXdzdksScWxGrPMeWlpUEaNUmA7eToz/0f/msrhEfOPK+6/
	ZM7WvVnOY1grMLOv0/zSpbLsu8vmwNwPTDtfXAwEmxAPFSH4UrIunsbPQLjklNxkizxkrHW7n4tsf
	xBf2iis+41wvPL5jbVm+BsZNekF0vTyRJD0764pK2CJfVbyAmv5SxjYlOrKPeAsH+h/ejpO5vCRId
	aq6ca6G1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grsS8-0000a8-J3; Thu, 07 Feb 2019 22:47:28 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grsS5-0000ZT-9y
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 22:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549579645; x=1581115645;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=w+SCEwgUybnuONj7QDPg4mrU5sjaWAW5sJxaJQa+js0=;
 b=FkH69yTi8uvKh1vPwncPgjq51fGCl8ZCy8P6omJQSwnh/DoenfL/J3Bb
 lFkfx064T+ZdepzuofP/lN4QrSqWwgc/U1xRIbo4r/xNDVx3K5MuDKh1h
 rpPbm1ueRINORi/Qba6pyFSd2l0+shWLWaVoOQ1aDla13sZmVM3XFqDAP
 7Xf86kVZMzY/1RdktnfASGLqnby4i0oXjC12qS6NlNS6nG29JZMbst0mU
 2CXQWav/Vkn+7lBYXeUtIPsihYZh2mtwv7oD3/1E/+yzt5sZFMixv07XL
 tJ2m0Hd/X4gbW24ljY8Je3DgZI12gWEAmNy5Onl1JHEM/kvb74/2mJi5i A==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="105730358"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 06:47:21 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 07 Feb 2019 14:28:05 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.196.159.121])
 ([10.196.159.121])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2019 14:47:21 -0800
Subject: Re: [PATCH] arch: riscv: fix logic error in parse_dtb
To: Andreas Schwab <schwab@suse.de>, Paul Walmsley <paul.walmsley@sifive.com>
References: <alpine.DEB.2.21.9999.1812171913510.29609@viisi.sifive.com>
 <mvmr2cjy7xx.fsf@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <893c55bd-07e1-6ea4-6d67-5d225d9f2db1@wdc.com>
Date: Thu, 7 Feb 2019 14:47:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <mvmr2cjy7xx.fsf@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_144725_458674_101CFAD7 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>, "paul@pwsan.com" <paul@pwsan.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/7/19 6:44 AM, Andreas Schwab wrote:
> The function early_init_dt_scan returns true if a DTB was detected.
> 
> Fixes: 8fd6e05c7463 ("arch: riscv: support kernel command line forcing when no DTB passed")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/kernel/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 45e9a2f053dc..84f19ca6d88b 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -140,7 +140,7 @@ asmlinkage void __init setup_vm(void)
>   
>   void __init parse_dtb(unsigned int hartid, void *dtb)
>   {
> -	if (!early_init_dt_scan(__va(dtb)))
> +	if (early_init_dt_scan(__va(dtb)))
>   		return;
>   
>   	pr_err("No DTB passed to the kernel\n");
> 

Good catch. I was surprised to see "No DTB passed.." message with rc5.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
