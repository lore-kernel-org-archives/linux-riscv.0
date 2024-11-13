Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3309D41C07
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 06:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsriPXuElsrpblahHAZMdzpr5iQ1TTJ1ODqqSYGxJW4=; b=hUIXDVFCdXXzUw
	9QPe7F87fDSaXmNYjgBbYmLW4GIzkX3riIyRXhzmXTg+w3jy31ZYWOloDefcPIsgXlofD0dduwXXd
	M4TuOTPQWpG5cbsxDAJzyPzYiLmCt1iG/B5cTGEFSxTIqisMyC0lOgZ1gOOh6ZKQhEbatBdk/pW2A
	GRgzAulOmiBFQHmamzBOlw7GDr+Ts4QT0ha2n++HL635065OOWuEO/NtzomnhCUiffoh460G+RbDn
	p1NsQzDpmxjlrdFzkbUdClzzJITqZB2WGtSaALa/Eq6Q6z8Fe1Wf1l5bAiqfa2WkGqKmO+WGORjaf
	6w1zvtBzww9ShQWuNC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6u9-00000005tql-2Oi6;
	Wed, 13 Nov 2024 06:31:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6tk-00000005tnf-00pa
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 06:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EFF21A4024E;
	Wed, 13 Nov 2024 06:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06826C4CECD;
	Wed, 13 Nov 2024 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731479438;
	bh=hjBKF175D52aKk9ytGRzqV2rOfPcAzfyNpexBN7GjPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i5KMiboHxysWri9LAaFlP3XArThrmaoI/MwHm3NtdsduOllcQ1IAZUGnxMKYXOOKC
	 OqYW4r5aVURO+TOrzfpW4wJwGVAQ9jZlTezTuzNEVcIuZcIhY3UZ4qIuOrYyVoxZWc
	 veNnPP7Tu0lQk+H/z94BsAmX73cwW7CLOWcxZQYQSsy6jQ7Wk5ND1i8rQ79O3ygKfF
	 tCC+jjkAv/nR4EnSvW+CeY++wpjrMfzW9m2wcm15Nqb59bE455V51igT8f7mShwPuP
	 Qny+sL46xA2aHZ2qgcirJtvtU4nWGCgtBdnmWg6GN2yOCJ0odVtga5M9HYaRxh+2oX
	 CywbdIQTn063g==
Message-ID: <cad32ff9-fcb0-477e-8a8b-a7d4bb80fdfe@kernel.org>
Date: Wed, 13 Nov 2024 15:30:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: k210: Undef K210_PC_DEFAULT
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241113060950.5247-1-zhangjiao2@cmss.chinamobile.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20241113060950.5247-1-zhangjiao2@cmss.chinamobile.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_223040_150047_63694698 
X-CRM114-Status: UNSURE (   5.00  )
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

On 11/13/24 15:09, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> When the temporary macro K210_PC_DEFAULT is no need anymore,

s/no need/not needed

> better use its name in the #undef statement instead of

s/better use/use

> the incorrect "DEFAULT" name.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>

With the typos fixed,

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
