Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FFFC88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBoOJyEg2yKGxJOuioJuIAxhRAvE6pScmvrvFdPp05k=; b=xr13XKifnCmivF
	bq2hLoT2/QiOeYTPCysuDD+sHddqEODuM1QGkfZGGYIaA/L6vn99pvtfjWlLLpspEp9dZulZ4ENF+
	XauEwNfrDkIXqx2iidzb8BD0Csj3mq7+YZ4duid5k1Q6WkY+q91Pr47mR70WH5y0nsAtN75eXN1Oh
	d2MbxLIz2V0Knzu1hro3DaTAgomHgXsG9Jx7aoxcfUedK/OCtwC11KKY2zEnmSfh89auojpZ2SrVw
	2cyeEWBtvNCwP5JE2ogtcQA0H2pEs2LexpGjbgDIh8gHetZfOc7xbOWVJidW6VFhNu4PkkUGUFNJx
	rdp1wZg61Tnrvxg8rqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Rb-00000002cXQ-0COK;
	Mon, 14 Sep 2026 07:49:39 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61RW-00000002cW9-3zPs
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 07:49:36 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so659426f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 00:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789372172; x=1789976972; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0SFFkTHAZrxKJhQbYm+mLNDx5PxDTI2Mi4G/IC70dA=;
        b=C9ZFqzBX5zeYRCIA6D61WiWzfupcXxjUJGux+VO8o+R80m9AvarwN13sRpXbBmZjxk
         8Y6+Bb4sCtlEIxtvWB9x11TxrmdSzjPwzHKZhgwwgsrzoFslrl2V0tNazjFGImnuqFkX
         6eP9f/voGo7YYDQApDcin+zEW+KUSZbVWEPmq9th78BoHt3U74jgHOhVa++HQhbQixbK
         VtbwllwxqQXgCKOTCYNWHqdwMmh2yLhoLBYw4Wgx9R+dR1JlywQCraota0rMoWSmrnPB
         SD0bLtHw4ectTN8ZFZev8/s/KTwYV3LIWa8PhcPB3dBX889YqbgLY/b4byVMWCHIkJQy
         lcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372172; x=1789976972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0SFFkTHAZrxKJhQbYm+mLNDx5PxDTI2Mi4G/IC70dA=;
        b=CR1KftBWRHfRyYTQPAMbm+tJQmWjT0FI+xwfjiFJMrbSw/daH5937m3Xgf5Cs0QKMK
         XBi+E7RTabWtmPYJpHqdIFKQmt6pLnnYpDJ22F+THo8i0mGXR76wBXxZEF1hvE9BhjZv
         pTunn5GG/dPmq5DcaeLgaM+8Q9sIM5gmZFGPN4F6kP24bqAuwM+LjCRnyCm6Au0rqioO
         +IElpdRxFFseGCzQFkHF1+gJniQ4do72wzhosdrR6Dhap8arlMc2IFA/caCo6nSk5Yy8
         vWjE+X9PtwnISSdYyUlYllysy2ivfBooCO8ioAkhg72g/MbLUyQ30GkYfWBVJZLZPzXZ
         pAzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBrYrXgyS+vp6IuPVC7P321gGxQ7ikGE//62gUDs19lL533lwkzN1znXqnpOYez4rFuVHsVkwNulJE5g==@lists.infradead.org
X-Gm-Message-State: AFuF++k9Yj6M0NNAFuvzdC8LJqddbAGfAAmBcbO37dLXIPwDrsJy2/jh
	6XPdRcRg53YpJHC8hIcjG3CP+SSAjVUjjerCVDayCXnuVWFtIGhIMLH5
X-Gm-Gg: AYBFou0Con6Q+ZntbZtk7+qO44/LmmaSwdp6h24GVwSj1iLKI2IHe1/VvFUPEKsJvVO
	Oz4a9diR7Go3/jM720Bmsz6r1LJgayxXsZ5E9r85AtnooF2NNghx7GfQrrE0+9XIMfbvbbB8G6P
	T9u2uQozyMftEozPOfBcneVBpNuh+UhE/l4tXYVDlfyyDMB6M/glSkGp6CJ5LGJX0o3ILzBA+Bn
	1vLCYsiik0jBhd9nDXrkJ9DqZMUmcSAGHyg7YMkLyXRjlVmcU7eC+07Ue2Xa/mJyehXWR14uM54
	qX2pue/CUCs8oePzwO6CWpnAOmvNjY6D89OiK25YqR1pvWf/Y+ECxZCboF58QHy/8BBU1SdqSD5
	iGq15JrXfRmaKJcmtvP1CiUG0e8ZJAtbJIrUxnjyPxXrKPOSw4W+4e3uvAr1DRTVRc9SnMHZqSb
	28uFlmEWjuMjb7rfkYmk7Du3Hr2a12H9XO80VowMAvTcxCxr4v7NNqSjoStzGUqWSAftXTob3RF
	I7uU/RioHPzlSDGxI1aFrBFsOtOwrtB/8vd
X-Received: by 2002:a05:600c:4693:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e7a66b714mr15344565e9.19.1789372172226;
        Mon, 14 Sep 2026 00:49:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6ca584f8sm194801515e9.6.2026.09.14.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:49:31 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:49:30 +0100
From: David Laight <david.laight.linux@gmail.com>
To: <shao.mingyin@zte.com.cn>
Cc: <pjw@kernel.org>, <mikey@neuling.org>, <jiangfeng@kylinos.cn>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <zhang.yue5@zte.com.cn>
Subject: Re: [PATCH] riscv: lib: Fix ZBB strnlen wrap-around regression on
 huge counts
Message-ID: <20260914084930.739e3832@pumpkin>
In-Reply-To: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
References: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_004935_009924_882975C6 
X-CRM114-Status: GOOD (  19.60  )
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

On Fri, 28 Aug 2026 14:51:52 +0800 (CST)
<shao.mingyin@zte.com.cn> wrote:

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> commit 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count
> boundary") computes the aligned scan boundary from the last valid byte
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the aligned boundary lands before s.
> The pre-loop guard "bgeu t0, t4, 2f" then always exits for aligned
> strings of 8 or more characters, and strnlen() returns 8 instead of
> the real length.
> 
> This silently truncates strings built by fortified strcat: the dm
> sysfs name attribute shows "live-bas" instead of "live-base", the
> truncated name pollutes the udev database, and blivet/anaconda (as
> well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.
> 
> Detect the wrap-around and saturate the boundary to the top of the
> address space, making the scan equivalent to strlen().  Normal counts
> are unaffected.
> 
> Fixes: 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count boundary")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  arch/riscv/lib/strnlen.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..2451289ed0f9 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -87,9 +87,19 @@ strnlen_zbb:
>  	 * Aligned boundary.  Use the address of the last valid byte
>  	 * (s + count - 1) to avoid loading a word past the count
>  	 * boundary in the loop below.  count == 0 is handled above.
> +	 *
> +	 * Saturate the boundary when s + count wraps around (very large
> +	 * counts, e.g. SIZE_MAX passed by FORTIFY strcat/strlcat with a
> +	 * destination whose size is unknown at compile time).  Without
> +	 * this, the wrapped boundary lands before s and the pre-loop
> +	 * guard below always exits, returning a truncated length.
> +	 * Saturating makes the scan equivalent to strlen().
>  	 */
>  	add	t4, a0, a1
>  	addi	t4, t4, -1
> +	bgeu	t4, a0, 1f
> +	li	t4, -1
> +1:

Ugg....
That adds a taken branch to the normal path that is likely to get
mispredicted.
Might be better replaced with a cmp, dec, or sequence.

David 


>  	andi	t4, t4, -SZREG
> 
>  	/* Get the first word.  */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
