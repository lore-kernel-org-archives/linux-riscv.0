Return-Path: <SRS0=iSnV=3G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9A0C33CAF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2020 00:35:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C412072B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2020 00:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jr0wG+bs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="Zee8qfed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C412072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i1i+BUVl6X3dVlLrJ1ezNZBhRrN2tvT8AcA1Jjxsl6o=; b=jr0wG+bsaJxbcsaEeVRfezph4
	Qn/qRUkdhq0nECGQHa93OZ1XnjValIEBjJ8XOp9ycCFETTUWo8WIHr/YNBxW3SBzA/SvVlTxaoY5X
	QE2WSmb4hqPiGGohNHYqH1sJQ8hv1iAKyJcXeGLaiZWUAtoW071cDOdfHalQSGXJ2yWoHuDucLNj2
	JGmv0pP3NvUHf70ah2aCPVHZbP1+uWAKVyIDYKS8Og1zTk84+acykK+Buf2cdvewsp35vyvQpx8kQ
	r7JHJvQxTPwtFlarkzzUvVP1UajtBDDsxCfGqsOvErLVVjpefnQHkjK18aZTcNku/6LdXeeLiN32m
	Rs/re0JnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isFc1-0001bL-CW; Fri, 17 Jan 2020 00:35:45 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isFbx-0001ag-Qz
 for linux-riscv@lists.infradead.org; Fri, 17 Jan 2020 00:35:43 +0000
Received: from zn.tnic (p200300EC2F0B23003D0DC5C907B4D929.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:2300:3d0d:c5c9:7b4:d929])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5D0171EC0C8A;
 Fri, 17 Jan 2020 01:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1579221333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=i1i+BUVl6X3dVlLrJ1ezNZBhRrN2tvT8AcA1Jjxsl6o=;
 b=Zee8qfedPj1RhUqUw0X36j2qSZ1p5ge8Xp/CVKrXnCMY4M2kt1gi34TuURop2u/bHG3iaQ
 zMY+pc/mtH3ry1EDkTwT8GK8sV6j1mzaCVHRaRqJZHiTKBcV0Doc0hGmZqFzdGk/1cpk05
 wPcBc3z6midbSR7wjOt2MxiYqfT2wyA=
Date: Fri, 17 Jan 2020 01:35:23 +0100
From: Borislav Petkov <bp@alien8.de>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH]  EDAC/sifive: fix return value check in ecc_register()
Message-ID: <20200117003523.GK27148@zn.tnic>
References: <20200115150303.112627-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200115150303.112627-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_163542_031366_6082938D 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: Tony Luck <tony.luck@intel.com>, kernel-janitors@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Robert Richter <rrichter@marvell.com>,
 James Morse <james.morse@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 03:03:03PM +0000, Wei Yongjun wrote:
> In case of error, the function edac_device_alloc_ctl_info() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
> 
> Fixes: 91abaeaaff35 ("EDAC/sifive: Add EDAC platform driver for SiFive SoCs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/edac/sifive_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
> index c0cc72a3b2be..3a3dcb14ed99 100644
> --- a/drivers/edac/sifive_edac.c
> +++ b/drivers/edac/sifive_edac.c
> @@ -54,8 +54,8 @@ static int ecc_register(struct platform_device *pdev)
>  	p->dci = edac_device_alloc_ctl_info(0, "sifive_ecc", 1, "sifive_ecc",
>  					    1, 1, NULL, 0,
>  					    edac_device_alloc_index());
> -	if (IS_ERR(p->dci))
> -		return PTR_ERR(p->dci);
> +	if (!p->dci)
> +		return -ENOMEM;
>  
>  	p->dci->dev = &pdev->dev;
>  	p->dci->mod_name = "Sifive ECC Manager";

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

