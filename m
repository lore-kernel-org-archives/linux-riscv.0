Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986C9CA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 22:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YffIKZ4FXHSZFVxjF/cezaFKgFAbIGPL5MHql+adpsQ=; b=IVVrG5mzxcAnEv
	UcSlBDNEH0ixLUqUIZmz2BhRrq8s58N8e0wWN/YxVdeBgp1bMSsKF7WgmvynlSIbj7d87ncvRzG44
	iYw3j0Qejf9thIE8J0buKPKycqlLCpJWZEC764ICtIlfzSK/0+gSt2ySRuyGd/Q+5ZgqNI2Nrgbtb
	Og7AMAuHCwcLCy7TTUM6EkgXoBr0I396mzNY5Y7ugOsrvegqmnAu91qnn4uyIGbjJjBcPiTkHTyEg
	6sMVY5JV09hb3ZW6hwOaXcv1iNISlfPaCutN6NegrePXIL5FpXyH4lY9GTAi9j5VKYJZc9fLeTyio
	sEjjYM8X8D9k3ry/55vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Nk-00000007L1M-2cHA;
	Wed, 30 Sep 2026 22:02:32 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Nd-00000007L0d-2hg3
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 22:02:31 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id AA5FB1D00060;
	Wed, 30 Sep 2026 18:02:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 30 Sep 2026 18:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790805743;
	 x=1790892143; bh=+7vzyzmPNyBsCrlSJl2Rf6M5M3oPOAwKb0gYKlfEvRU=; b=
	hICjf1GyQ/UqyyDNFehn5s+vguTlIU89BjeIOAAz74NblGtZZ3s8WJoGmZp+N/fb
	gzJjhvpntD0FvkOwsiHnZ4/NAfAKaFaAtnxm6K923Bub6XCiaG347ciF6rFcjf4r
	EPR+ImEzAq6En1j95Wp/lvsGmYpZrDlawVDLN18dZJPlfGxoBr4DS49vUPRHIhpx
	oSMRpOe6hnTOlVRoyEi2D97oSw/JS7i55gvmc5XcWYUBhorsMWuxFa4gpttSzds2
	XETFQjc01F1bk7nlwe0iWPIs9B+z2eYSJQMyewLXA02gTGvSV7/JOuAIYNtPNyJp
	WH3UzmzMXCXXvu0Lx3ewBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790805743; x=
	1790892143; bh=+7vzyzmPNyBsCrlSJl2Rf6M5M3oPOAwKb0gYKlfEvRU=; b=v
	LqhHXG3hwWHSqLdAQdxixh7PS/BdDA0eZVOa88zAHusLwDTcT3wu03qFuZ5UOByH
	WyCsgLjjr2pr7AZoQjfEJs4qwXONXkROxjK3XtZAF3TLmdDm7INOH9/u16mu2abg
	gFo2EuRUOHoxHf0Yp97JkwZmWIkygHOyoJFaWd8cpyFfQTueByrxPwQ1eZnv9juB
	WpoErhUC70/Hzy7QpEXHfq5IBGxgxfWQJIzgtfVJzvIdQDigLEjOlCjR8//q6ldk
	oSojeqX6c99hyPB0gG55uOE3NlMgOUy79i83ZwQ5HWuCQ346SRr2hd4P9Q7KRGas
	V/f70B7l6O7rTb3eGmKXg==
X-ME-Sender: <xms:74a9aoc5uF06efgQBMXQFmJ5FNynnWA-AM4KIxHLTOTDABfNDPC6EQ>
    <xme:74a9auIPvlOYpXkA3TNoVHJCGTcNWdWryAPjFTr-0j7CmmbR1irZmcMsOKA-IQfrK
    tQhQRWk8xcaAewgTvYP1Gljq9XR3qrwOj9Plyiwb8jlDtQXcCfycBoY>
X-ME-Received: <xmr:74a9aiAPR1MHh3h4mZ4kYGjuJ9Mq2hPoCXZhdwIlssJoFhklqa41XBXLyZ6i6o_vZsRnAyqaT_TFjKY1_V9x5BEh>
X-ME-Proxy-Cause: dmFkZTEh8a5mtMwJjm4OP/JFppemW1RPRtmhJ6QT5a6YrkqSaMjdfLQr1wK/lXFXXVqtLN
    dfY5ZMQ533nSdgeO5vEeYT9mwMP0Grqc6B3CAICqST+5eeAq5FOxfz8ZHLeopm8rwIwKYp
    AFGFm7XF+qXfB00CeOPH/mjk2W0d8pvz0382nekCbaDcgFuc83qPtWIQsuoA/Jc0eAC5mY
    J4pzDFaTl00fjaYL2d3KgJvqxELXgjQP3vgY8op3EK5Eppion9z1GafN4NZljdrR34E1GG
    Pl71NsKJMrjyw3U/dbnaJ3IiGmM8lnXBVyMfnSEIhCozL8tlU4XQH1yWzYqooyGK4qyPLL
    MMgA2dDQtFM+R20LjuDrWtGDxiZ8N8TjjWTGyEGRRY7jMdJ8+3icRjXcsL6XplUizqBfey
    y6sy180EWVponJsHkYa3L+aLaXe+aOfMUUtRniJ6xVk1YSp1cnG1HM1hLV1L0OQsyH/PSL
    YHsrVMUu62G+jTtJSj5Y7/Vny24vPdVsVRepXpKC0IJAByo9s4p22bvWHCp4Tnkgkh+zJs
    Tg4HZ6aSTqT7gZ0bVnk5vlBxxLAe8Xd4SDkpBWGVPfKe+STSALZySObNwsdY2djRk7KVxk
    LBQ6ewd0BN92ObzVQL4Lw1kDQlQR91fxZ6ayOyMc2sFD/fPt9Z9xt//bBNBQ
X-ME-Proxy: <xmx:74a9anhBNHB88LHwst52qfSLgee25CC83rWEMBkiKaLBmtWISFwTfA>
    <xmx:74a9asMCevJLDsqFBWPyJgNAYbYFtuQ7DK19Ca3sO8z5oewGubaWJA>
    <xmx:74a9auZwe4Ehqm-RoFo8rVkzkBJped0UgM-cY4FemIpKnMdh6mQMOQ>
    <xmx:74a9ah_c9uDL884P0e1u19fneWBEhYj3z3xBmbBPwLjSzt2LI_5hzg>
    <xmx:74a9ajrClykasys3hw2_ryqoUOh4n4UQLdNeRMA04s1D5lmidAs2sfK->
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 18:02:18 -0400 (EDT)
Date: Thu, 01 Oct 2026 07:02:15 +0900 (JST)
Message-Id: <20261001.070215.521963012921142699.tomo@flapping.org>
To: ukleinek@kernel.org
Cc: tomo@flapping.org, fustini@kernel.org, guoren@kernel.org,
 wefu@redhat.com, a.hindborg@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net,
 linux-riscv@lists.infradead.org, lossin@kernel.org,
 m.wilczynski@samsung.com, ojeda@kernel.org, tamird@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, linux-pwm@vger.kernel.org,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <arz487DLBlaBrWLN@monoceros>
References: <20260930101257.1649945-1-tomo@flapping.org>
	<arz487DLBlaBrWLN@monoceros>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_150225_863324_1F12531F 
X-CRM114-Status: GOOD (  11.98  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 30 Sep 2026 13:57:31 +0200
Uwe Kleine-K=F6nig <ukleinek@kernel.org> wrote:

>> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
>> index 729776086879..abecd95b0c3c 100644
>> --- a/drivers/pwm/Kconfig
>> +++ b/drivers/pwm/Kconfig
>> @@ -772,7 +772,7 @@ config PWM_TEGRA
>>  =

>>  config PWM_TH1520
>>  	tristate "TH1520 PWM support"
>> -	depends on ARCH_THEAD || COMPILE_TEST
>> +	depends on ARCH_THEAD || (COMPILE_TEST && 64BIT)
>>  	depends on RUST
>>  	depends on HAS_IOMEM && COMMON_CLK
>>  	select RUST_PWM_ABSTRACTIONS
> =

> Can't we do better than that? For C code the right thing to do is to use
> one of the div helpers instead of a plain / for types bigger than long.

Indeed. Rust code already uses some div helpers. However, the kernel
crate does not have Rust wrappers for the helpers this driver needs,
such as mul_u64_u64_div_u64(), so we need to add them first. The
changes would be too large for stable.

So how about merging this as a fix? I will work on patches to use div
helpers in the driver.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
