Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA48AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Aug 2024 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5ONLFM84/v1IcUp9d842B75DHLYqtyIYsv6x64Km04=; b=qYT3p/DGgSMM+d
	6SOKT5aAyri8mejfTBWLIH+0ya6zivdWrHWMN/b+SUL8oidx/xbI/kFf5i0v2TKEGh6aYZ+7OG8XI
	vEtsx9B1I/o22bFU+vcWr2WWu0OrfwSJlsP2xefWVyoSaeYlCsPrjyrkR726qbIqno+7kA/96Irgn
	1CU7EYzCdC5DM7Zv8PUN0k9xD95SunEADBGmYamUoms654H8f5xgNPU39X9MuZbxM6OJhEQGIu/AQ
	WQojOf0meF0iZmcm2Auv3+hWd6Fo7v2NT3I/vS5i5S6xuka6iInGDr7a6DFFnK0GbxMf6QQLhBpuY
	XlpJIl9YiDBRJtTrRv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sd3pq-0000000FHiD-3H8h;
	Sun, 11 Aug 2024 08:21:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sd3pm-0000000FHhX-440Q
	for linux-riscv@lists.infradead.org;
	Sun, 11 Aug 2024 08:21:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B3CCC0003;
	Sun, 11 Aug 2024 08:21:41 +0000 (UTC)
Message-ID: <2171ee94-ec78-4146-b6fa-9aecbb99efd8@ghiti.fr>
Date: Sun, 11 Aug 2024 10:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Make riscv_isa_vendor_ext_andes array static
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20240807-make_andes_static-v1-1-b64bf4c3d941@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240807-make_andes_static-v1-1-b64bf4c3d941@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_012151_172540_CEE77E50 
X-CRM114-Status: GOOD (  12.15  )
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

On 08/08/2024 02:27, Charlie Jenkins wrote:
> Since this array is only used in this file, it should be static.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407241530.ej5SVgX1-lkp@intel.com/
> ---
>   arch/riscv/kernel/vendor_extensions/andes.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vendor_extensions/andes.c b/arch/riscv/kernel/vendor_extensions/andes.c
> index ec688c88456a..51f302b6d503 100644
> --- a/arch/riscv/kernel/vendor_extensions/andes.c
> +++ b/arch/riscv/kernel/vendor_extensions/andes.c
> @@ -8,7 +8,7 @@
>   #include <linux/types.h>
>   
>   /* All Andes vendor extensions supported in Linux */
> -const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
> +static const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
>   	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_VENDOR_EXT_XANDESPMU),
>   };
>   
>
> ---
> base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
> change-id: 20240807-make_andes_static-ec524bae21f2


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
