Return-Path: <SRS0=6USs=L4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36A5C07E95
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 09:17:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65E58613BF
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 09:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65E58613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KM+9AVzzpTwpj090WdS/N9qQprns1MQWtaBgflhz98E=; b=funqawHz2aA2l4
	xej5hHJbqPuKzpzSpCX00C7kek2pWiLZ405Ext7qMfkFwzyk7QoW/s+Eilqo/pednTTbGKsxqu5EN
	TBuP2imTvquuFK9acc9fI/p993yhE3avZvr+vfcahYz7YmRyv49euhs3r/cscnbg2vgymztdGx7aT
	Em6jDJBsxAcPynefJZHCXdumXhSuF+ybY9nFXZ+KbMVeutpdnoACJWdai93CWC2qCnJ1AMWYEfYU6
	J8voiIKBISnUKSwn3qjQ9H2GMPOaQymXnXKRdhsbJ0hGL374bf0vHDyERmCK9FgBMlEleHh2O69IG
	Cle6lsA8j0yAxDe7IzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzyF7-0065Ts-LN; Sun, 04 Jul 2021 09:16:49 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzyEP-0065AF-0H
 for linux-riscv@lists.infradead.org; Sun, 04 Jul 2021 09:16:07 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GHjq13PkNz1s3jM;
 Sun,  4 Jul 2021 11:15:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GHjq12kftz1qql4;
 Sun,  4 Jul 2021 11:15:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ULz5hv9xh-jJ; Sun,  4 Jul 2021 11:15:56 +0200 (CEST)
X-Auth-Info: 0tcvzTNEQcargKHyQeZg92ocktKkFbPN4hQYVXXTVXC/V76rINENRfQRGFDv/VlR
Received: from tiger.home (ppp-46-244-169-165.dynamic.mnet-online.de
 [46.244.169.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  4 Jul 2021 11:15:56 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
 id B8C724311A; Sun,  4 Jul 2021 11:15:55 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: dts: fix memory size for the SiFive HiFive
 Unmatched
References: <20210704083441.256097-1-qiuwenbo@kylinos.com.cn>
X-Yow: I wonder if I should put myself in ESCROW!!
Date: Sun, 04 Jul 2021 11:15:55 +0200
In-Reply-To: <20210704083441.256097-1-qiuwenbo@kylinos.com.cn> (Qiu Wenbo's
 message of "Sun, 4 Jul 2021 16:34:41 +0800")
Message-ID: <87eece7838.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_021605_234152_7BF50C23 
X-CRM114-Status: GOOD (  16.00  )
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

On Jul 04 2021, Qiu Wenbo wrote:

> The production version of HiFive Unmatched have 16GB memory.
>
> Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index b1c3c596578f..2e4ea84f27e7 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -24,7 +24,7 @@ cpus {
>  
>  	memory@80000000 {
>  		device_type = "memory";
> -		reg = <0x0 0x80000000 0x2 0x00000000>;
> +		reg = <0x0 0x80000000 0x4 0x00000000>;
>  	};
>  
>  	soc {

https://github.com/sifive/meta-sifive/blob/2021.06/recipes-kernel/linux/files/0003-riscv-sifive-unmatched-update-for-16GB-rev3.patch
contains more changes.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
