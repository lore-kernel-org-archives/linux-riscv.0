Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E4DCD98F2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GvXBKHwZzNl/N56/eUMFLKBTuPgZpSsCAF3iyk/g6ig=; b=vQ3lZCXoZX/iq4fOt04wH0dZQY
	NU2Ca1KkXORhRmXaAgNdpELIBrwi/prkD329Z987EBPO4wTR15Pg2BmlqESr8rX8MtwKD34BYRgfS
	4bMpXGRKiCgEv2dCQT6i2aRfBORVcWWg8NxwoYmNepuNGzBCuYWDjZVPPUE7j5GRds5XHiFyFIr+R
	SiX6ac0yHJfudJ2JoJHjrOnz2N6EvKBHtBxJMTfIKB6THH3TbWkghH/l4jFaveuD69BJPuZHAtxvq
	vH9j1I/jb+53j5TV5sJHusWk6jix1hbF3gRcd3k2tKRHMN7+fMc8maR9ePjDdyAtD9y5qPngoOH4L
	ux33b2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhtc-00000005DUN-48zI;
	Mon, 22 Jun 2026 16:53:17 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhta-00000005DT0-2j1G
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 16:53:15 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8001478c58fso5354327b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jun 2026 09:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782147193; cv=none;
        d=google.com; s=arc-20240605;
        b=ELJBirebLCrKm/3qJ6hUJyF9uv8iKc/mFzxxTQ0UWC/olShTmolKP1AtaLsyWohrpI
         vAc+fHCYZIzkZsGM+59gw1dBNDh0XDRhzeYGMUImCDgNR0wXaNA+98UcGjjt4LA03cBg
         7InBzkDZclhOZ2VJT/9PXOzmkKzOER1OHCQ5cMJo0yEI//6ePZzMicqA/RIWBYTA8GQX
         DPz1I36rBh10AGX3GZHw+mdY89PQIv/hpAQ/1mWmax3o1+4o2WS+3LoBVR3qfm7EavfQ
         6eT42cnFX0iK6pgFZ4xGrr7iFAEbQhj59cZFs4dlIbkPCRmoFve0GkCuFX71GBpjeCDJ
         T3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=yqq18qbbUWyY/bP+GSAnkFACJ01YiF4BpvGLDNjlHfM=;
        fh=g2/F9mN5dOTNTsARq4nMz/jGZNoPPrdSKx87uQIz7VY=;
        b=g7qufSRbSg1gQmrqkLhCxx/vqOEamzvh0yVcS7h5NFMiJMXocPuRH6BUTCsZ1C05/I
         3mTbtEM9P2ZPWLF6pHvFriVvPncCyUQYHTSKdxnvD5SPlq9RJxffl9NCOwSbTkuIkzea
         aDgtpI8i6gvb3E28bUilB9tHsfJHsF7bPTgYFmbwMOn1+xEMU+JUTnyY+r3HpufjTu4A
         0XBspn8VgijPrNpSOBG8WKOtqUOQev/QFXr+f91fzMoIjvAR+XP7172TPCJqnbcEdG7E
         2fVpwiPI4OPkfuVSEjsrWbgsj1aq6aqf2bKWKnB4hvmRHn+pI+7MeaNXQ5oH8pAZk9Tc
         YF3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782147193; x=1782751993; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yqq18qbbUWyY/bP+GSAnkFACJ01YiF4BpvGLDNjlHfM=;
        b=pV2fv1aqPTLiGRWSsGgM2KLVLQULFgL79AIHniTQLb+IW1FV+0wqG5i2RwLKoeHmX+
         H/0CIcchOMPUuzzCDIZB234fUJtdmHBP37B4aYGvBXDUZdsXjEssDQmnLLR13hySYZOs
         iW4MDiF/BQ5R75X7bywSDKVQ32QRXmrRikfH7uPz6ygKguBDlWJzwyRoLVMgtuzeuq6v
         p5JFrCtFzUpJc3eAE3pZ4jl3B7tVx1nrEoyw5JqBMJHwt9e0wjwzoXUtJ/S0RAeNMZUA
         bKqmAo+qDxrF12lywu1ypXqlak4yjYwKeEVvpPjH/fW1YeNyVSAYwdfAzsIh512dxCn7
         SddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782147193; x=1782751993;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqq18qbbUWyY/bP+GSAnkFACJ01YiF4BpvGLDNjlHfM=;
        b=VfffHv+PSmRPu3SN619dtzdjZwK3zhuBeBe8Elb/kdZpaLL330UTEEX0ozH7yTiO5B
         lm2+DZhEkrNbNiN2GpDE2Q3jku9wPNEmT7kNsvoeuYQS4769P4FzSAUxcA4l9pEtueUp
         0edv8kUpXwFR+NmoHqD7BTtJApxEb489t8QFdOS9TUH5tVYgLFDCymPSHT1KbZPjtf05
         AfTNKEciz8Er1DSeYduI8k21fumwDEl05ZxJzJ9mpPw1v1qUj7mbK7LFCYODxLTK2kuv
         YmY1ULf9Bg24icOPzi6gHMXuCVXX+kECXI8fQTjR2jyqJyonxLQFUSW0QLifeJQwoKyj
         TXDQ==
X-Forwarded-Encrypted: i=1; AHgh+RohjRkb60QvD1NNAy63F2CpmZVobrcVjVb2XKE7pLAHg6NPgu4mKj63/woXpghsDcLoe39u7PdA5UTsdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxO/RuB5xKgwq8GIorqFunsDT6FXhMzQ5K+K2tus3gU+6m4Mkas
	H5M04ufmsD3ZD8rqnA2vmmv8If2A+dlU07qlspHweuKdYbEmb7GrxbE7mFI4UlZMr11XR1nagsc
	KnLShR50RHstN3MO4Pia0e7DoP+TQE9FQfw==
X-Gm-Gg: AfdE7cn/wf8wSNgtqCsFkLbNpiBW48LQa5yZzrYjuQEmvDHb5Gb72SC63grJzA8aR8b
	s2/NSByIYsJM10ZNX9HYJPASwBJ+WnX0aAG+G5iIbPrtmC/2xH7lWYdxyZWMNtfiFjZSA3875WA
	o3/UVPHJGn8PoDulxg8jIEAhnIuAXWU4RQ8u8mSqFosmLzClp+PXmE40tmK4+4LwBSacB8p1y3a
	T9OgZhjBSD7WLTBtakyjv4zct2J4s8K4bBwIJGCR8q63lBEA53eD1N3NF9sz6Jm1EPfVfgNk/W6
	Gld8Xg==
X-Received: by 2002:a05:690e:d44:b0:663:2287:6310 with SMTP id
 956f58d0204a3-66350abda9fmr1098861d50.3.1782147193512; Mon, 22 Jun 2026
 09:53:13 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 22 Jun 2026 09:53:12 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 22 Jun 2026 09:53:12 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20260621145919.1453-5-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com> <20260621145919.1453-5-ekffu200098@gmail.com>
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 09:53:12 -0700
X-Gm-Features: AVVi8CccqdWnKBKHmE2f8tzUNahPkoURMJjDzmFn9Xa6CgvHAjnaUuwiIAhnUOo
Message-ID: <CAPAsAGwEyFqVtpJc+F_k-956pzB+Kd-A1eXDd-d2bN0VPWE=-w@mail.gmail.com>
Subject: Re: [PATCH 4/6] riscv: remove unreachable invalid range check in kasan_init()
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexander Potapenko <glider@google.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-riscv@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_095314_704103_423F7995 
X-CRM114-Status: UNSURE (   5.50  )
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

Sang-Heon Jeon <ekffu200098@gmail.com> writes:

> kasan_init() populates the linear mapping shadow with for_each_mem_range()
> and breaks the loop when start >= end. for_each_mem_range() never returns
> an invalid range, so start < end always.
>
> Therefore the start >= end check is unreachable, so remove it.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  arch/riscv/mm/kasan_init.c | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
