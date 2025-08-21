Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD61CA0FE9
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOLWFfOjxNxab08V14AlZfeg6hsyXl6whu04aOpzGVk=; b=T30CgUQbKa6TYA
	vB6L9uo8YAAesENNQGL6a+lgEMOnwOrLbz+1FbtaROwGXAc/qx5NPOpXG7bFh5g/91bBV2HcrIDv5
	aTErH5RbfYwE5RplAHz+9q/18SEFWssDpt4agMXD5+FTlrNB2nbyxrtg0s5sL/hzIczAH2qEkxn/H
	rUmWDk7g3nc4iuQqG1la8u0W3MzIM6gnekjL0nA8r7izKeF/uf1GuoSUsTGVGsbCn0bz41o1XesMK
	d+mqhpPjaKEUnFT98vntW7TILgoZhjXla8W0a1YNePCgRaYywv/2T5DCZEN/n1Db+9bpBBzV+3V98
	ynRiGu4DxSiR4KlVKvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDsp-00000000kaL-03La;
	Thu, 21 Aug 2025 22:35:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6WP-0000000HGHf-0jwD
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 14:44:10 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76e2e8e2d2dso820590b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755787448; x=1756392248; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjHsK7aYToa+HjdrLphU8TIHfwEe9ycCYnoOfoaBQu8=;
        b=Ly8EG33iSLBjzw9e7sTPbU0dVN6rkQHj1SG6xaZZ8ov8Vvowhm8x9YqtunT/nS8dmJ
         qokwLDFTj7ibB396Ohg4JNRzNb2kpnPJzTZI2VVOeqbltftOuP97RWQs8QO8fxYGBqg2
         35u/wObBx7MqLa1p3J2mSqI8I3wAmXyne7SFv47sw5Vf6R0h6FgmsoGFLwblPjP65lLW
         6IRgrO7TiNqb0ag7hkGkXa59DVYciKmcTCqVL/9Ennypp1iZzOfk8D/fibEbrLRy74za
         nWRBNxupWC7NJQ3B/uE3JtI4nHxuG/ApUbGZpC3pCyUSJejW8uxXYRPcNjEWU5jLewEK
         pdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755787448; x=1756392248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjHsK7aYToa+HjdrLphU8TIHfwEe9ycCYnoOfoaBQu8=;
        b=gSs5PW36vqRlaS3nWUb76WGOspVgtyBEmCUvol8RkgrbCivkrwVifj7CTu6gT2dXT4
         F7VSQVdS/83u83hnPfH7j6jZn4301V46N0yXK0Y9Gn+zz0+ODIsXwWlgJiV+SIF4OSgF
         yJrQrqIC+6XfijPzwxxUpR35A9fqWDixVNzQg0ySX08ACizLIgR7WOYTyMjOc7+FGPGE
         eVmzH0p38fsHDFTPZrAExApGZ5TtFaAu4WyLt7TCXi4j2RqXyzg793pg5g22SvcAuLnR
         WxaEUdBSK+GhTdy2Lkl0QtRVptdBn/dOeDImrAZHGa0Ve6noJGaQofOwC/qBWOjSCGPh
         Sh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW9VlBkXYX7+bWGLrtkEcrrgEQh/jRGRCt+ZygxlQqQnNZE7so9ezKSSO172Dn5MUQkiBgbRAFrrXAdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZoHb7egCpYCriLhB5yW3IVTbPkvHXf8zF7vu/JUIkXUBbppa6
	JCJG77WA/2ZqVzaVQ4VowR5uzJz2UNBZ7e06a6TE/fhkIgY1/3FWEI3S
X-Gm-Gg: ASbGncv/iX4smO7NxnGkrSQwDwyIbfsGwB6/G8vgvcBf3nVH+hJnFPrW8vqxBUW5mBJ
	T4dm/LUrrhgFMHLdpZlSOOM6cdtDraUoNU5T5dMpcuthNT3nlUzgbi4CCd1FjOvdkdqCryaz5jC
	WLoJSAnmxuQ5BurWmeeAS8SWyBc6vmUn/dwIH3A7hefAp8EubmfQiwJWzuN66ogYPP7X0qcTGCX
	/qhiGXfR1dR1QQx4NlaX9G+o+unMr/CwhuRBQck877o24aE68xcgF9P7bIp8PT+rSZLTXnbsAAL
	LvkZ3KA5DoIdMeOuuaXSN90RliF7fbDQBQv7v/mFwWApWcpqb6PFPJGrRjnPA6TDvdMgjk3T7Tu
	MajevYopRH0x66AU5sk8o6g==
X-Google-Smtp-Source: AGHT+IFrxP8HkGJxHbfo9qdv4+YAssNVvQZ9lHAv8hQBfTrfVQcYKEUe6u/sN3hKWtF5yvYWmfOJTg==
X-Received: by 2002:a17:902:cf0e:b0:240:6ae4:3695 with SMTP id d9443c01a7336-245febed803mr38710865ad.4.1755787448263;
        Thu, 21 Aug 2025 07:44:08 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245f2820f48sm48699045ad.149.2025.08.21.07.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 07:44:07 -0700 (PDT)
Date: Thu, 21 Aug 2025 10:44:05 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Vivian Wang <uwu@dram.page>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] riscv: bitops: Use __riscv_has_extension_likely
Message-ID: <aKcwtXDJKRf4O_tF@yury>
References: <20250821-riscv-altn-helper-wip-v2-0-9586fa702f78@iscas.ac.cn>
 <20250821-riscv-altn-helper-wip-v2-4-9586fa702f78@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821-riscv-altn-helper-wip-v2-4-9586fa702f78@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_074409_212442_2DD03D86 
X-CRM114-Status: GOOD (  20.10  )
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

On Thu, Aug 21, 2025 at 05:16:34PM +0800, Vivian Wang wrote:
> Use __riscv_has_extension_likely() to check for RISCV_ISA_EXT_ZBB,
> replacing the use of asm goto with ALTERNATIVE.
> 
> The "likely" variant is used to match the behavior of the original
> implementation using ALTERNATIVE("j %l[legacy]", "nop", ...).
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/bitops.h | 32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index d59310f74c2ba70caeb7b9b0e9221882117583f5..f70ccc0c2ffb86a6fda3bc373504143d0c6a1093 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -47,9 +47,8 @@
>  
>  static __always_inline unsigned long variable__ffs(unsigned long word)
>  {
> -	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> -				      RISCV_ISA_EXT_ZBB, 1)
> -			  : : : : legacy);
> +	if (!__riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB))
> +		return generic___ffs(word);

So, on the previous round you spent quite a lot of time explaining how
'unlikely()' version is handy over '!likely()', and now use just the
latter. I feel really lost about how the code generation should look.

Can you please share bloat-o-meter report against this patch? Can you
also show an example of code generation before and after? Have you
tried the 'unlikely()` one? How the output looks?

>  	asm volatile (".option push\n"
>  		      ".option arch,+zbb\n"

Yeah, now the diff is much cleaner. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
