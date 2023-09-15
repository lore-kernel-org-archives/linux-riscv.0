Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D95EE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5Y7sTs8A/hXjGgO7AuGgpJdiC+mztJ4MsGyx77DcxY=; b=Ddydm4OE0TTzZ3
	eM0N2v4COXZLFNWQv7Yw2zKD7xhaFblL6/kqLBzyGqdzqbvrsWsWzguoMDyEsQQ/CC2FvGcMf8rgB
	POm/owESS5S0gIabYaptWpZ33xgtnt4h9OcwQOCI+AyS2wqnc/5JVGSdwjcZrcMFeJ0ZA5kLdgq+E
	4JWADsKhnR4vdcxNwl8zPILKhDGWIAc2ATP3k5vaIUQ1aouG5L+LbCEtte4PuRBOJuL2NY6LuaHfl
	Ibym14ue+ywMrDo9+A28kWC5gxUGG0m8lPczz1nZvHU5zFVEIBRmwFn/OZOa07gne23TtImjF3sn4
	lzekTz3dzmk6sc6AroSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3Go-00A2qj-0V;
	Fri, 15 Sep 2023 07:29:42 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3Gl-00A2pg-1m
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:29:41 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-232-4Gk51lTPOEe7Li4u2XVmiA-1; Fri, 15 Sep 2023 08:29:26 +0100
X-MC-Unique: 4Gk51lTPOEe7Li4u2XVmiA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 15 Sep
 2023 08:29:23 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 15 Sep 2023 08:29:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Charlie Jenkins' <charlie@rivosinc.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>
Subject: RE: [PATCH v5 1/4] asm-generic: Improve csum_fold
Thread-Topic: [PATCH v5 1/4] asm-generic: Improve csum_fold
Thread-Index: AQHZ54ewpMv53rwyPk26+JqeBsO74rAbfALw
Date: Fri, 15 Sep 2023 07:29:23 +0000
Message-ID: <b6bd38541255470b97bbaf3e6cdb4265@AcuMS.aculab.com>
References: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com>
 <20230914-optimize_checksum-v5-1-c95b82a2757e@rivosinc.com>
In-Reply-To: <20230914-optimize_checksum-v5-1-c95b82a2757e@rivosinc.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002939_854423_D1A6C1E4 
X-CRM114-Status: GOOD (  16.83  )
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

From: Charlie Jenkins
> Sent: 15 September 2023 04:50
> 
> This csum_fold implementation introduced into arch/arc by Vineet Gupta
> is better than the default implementation on at least arc, x86, arm, and
> riscv. Using GCC trunk and compiling non-inlined version, this
> implementation has 41.6667%, 25%, 16.6667% fewer instructions on
> riscv64, x86-64, and arm64 respectively with -O3 optimization.

Nit-picking the commit message...
Some of those architectures have their own asm implementation.
The arm one is better than the C code below, the x86 ones aren't.

I think that only sparc32 (carry flag but no rotate) and
arm/arm64 (barrel shifter on every instruction) have versions
that are better than the one here.

Since I suggested it to Charlie:

Reviewed-by: David Laight <david.laight@aculab.com>

> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  include/asm-generic/checksum.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/include/asm-generic/checksum.h b/include/asm-generic/checksum.h
> index 43e18db89c14..adab9ac4312c 100644
> --- a/include/asm-generic/checksum.h
> +++ b/include/asm-generic/checksum.h
> @@ -30,10 +30,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
>   */
>  static inline __sum16 csum_fold(__wsum csum)
>  {
> -	u32 sum = (__force u32)csum;

You'll need to re-instate that line to stop sparse complaining.

> -	sum = (sum & 0xffff) + (sum >> 16);
> -	sum = (sum & 0xffff) + (sum >> 16);
> -	return (__force __sum16)~sum;
> +	return (__force __sum16)((~csum - ror32(csum, 16)) >> 16);
>  }
>  #endif
> 
> 
> --
> 2.42.0

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
