Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2745EE77179
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYUEwu7CaGo2u3svhMMqtoIDfwjvnageSPV2C2Gb618=; b=qqYHWoSZR4LPwA
	J//LbCGkoapAK9u/VFlIPAS7NVsl9MreDJNGBd9drHdlz48XA9+U4nCuPXDcz2ri85ufJef2l9Tvd
	qqm7HlEQAPPDaq8KvUh7aiy3L+R+MTUwsEF1eqU/HFMYwFwaF5X+ke4504A7thNqzyy456iUqKMK6
	kfxV9hHpf7wgfysZnHw7o2CETvFCUfqTnvXEAhkg/heYtmulqcWehrShW6BCmGzS8e0Euzdprwlbg
	iE9gO1WehH1hIf8t1srZ3D49mrqkps62px6/MiXh/p0i8Bq8+rz+SxzXxoBgeZibe/ItaAqzaN6Xb
	zwAej/dbVZ4F3lLoiRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRe4-00000000h78-08wr;
	Fri, 06 Dec 2024 06:16:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRdl-00000000h3V-3FbR
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 06:16:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C7CBC0003;
	Fri,  6 Dec 2024 06:16:34 +0000 (UTC)
Message-ID: <a3e117ce-abe3-4bd9-aef5-90bbe173828d@ghiti.fr>
Date: Fri, 6 Dec 2024 07:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Albert Ou from riscv
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241205-remove_albert-v1-1-17eb850f1540@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241205-remove_albert-v1-1-17eb850f1540@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_221637_944916_DED1A5FC 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Charlie,

On 05/12/2024 23:46, Charlie Jenkins wrote:
> Albert is not an active maintainer and his inbox rejects all emails.
> Remove him from the maintainer's list to put an end to everybody who
> interacts with the riscv linux mailing list from getting spammed with
> rejection emails.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e930c7a58b1..8a5e12355850 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20104,7 +20104,6 @@ F:	include/linux/irqchip/riscv-imsic.h
>   RISC-V ARCHITECTURE
>   M:	Paul Walmsley <paul.walmsley@sifive.com>
>   M:	Palmer Dabbelt <palmer@dabbelt.com>
> -M:	Albert Ou <aou@eecs.berkeley.edu>
>   L:	linux-riscv@lists.infradead.org
>   S:	Supported
>   Q:	https://patchwork.kernel.org/project/linux-riscv/list/
>
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241205-remove_albert-b50c95e19306


I totally agree!

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
