Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB43C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 22:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4I/GqPmZ9HdxY1QRriLLUYT8poeVTRSQpvhQ1/AxRtM=; b=FdOguy5Ybqmngx
	lxvwlsCIdS22yRC9RPK33Y7rLrDyzbI99b3G7uWN6uR9NXmR8AXI749t0gOa/7f/stx1TDLtjDS5o
	0mjdNNItLEQeo+KqztjKXKWapgjUaQbDBhtMf4SayGZccq2jygocYscHdz4l7GazSivFTvGB0IcNd
	10KY+pmkfhk9r/5xxkkCreJJdK6h8PQZzi/VLTcJXEsKgPQegpcXXcoeKRaCuwvAtujLRoGSRGV53
	0lnWl4cWE908gaRZIvaHGnhvpFmcp9Ix9fF3jsAsH/oWw+GxYxzwAvMevUqdiTKoXktmJVJpGMm7r
	XxnlRmHnr13c3X0vWYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxYT-00000009Wyz-3etP;
	Wed, 05 Mar 2025 22:49:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxXz-00000009WjK-1loL
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 22:49:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223594b3c6dso130315095ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741214942; x=1741819742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uFYybP/h8fOOv7x6T0mDjGnjs7SO3QwCZI7Q4LRb824=;
        b=27NIYJy0bgK+FeuRYLU7PGV9zNZ9BU4qC5lFt1V8R+q7W2jfIUK7cpVvwMa+20TDbQ
         pn4E8z/oL2wg5t5RQ6bjSyarazA/P+fTP1ZAA+g5lA94kOVjtJovo+hZqf7Zj3wzGQZn
         KFml6exU1z38RJxF2TCEziQ+ftxQ0hDS0RxzqdFGYRaTbOQoxWfSGQsZEZUBIvGEiwFf
         Irm0VjH5i/lgp/oQplFsS9ohEIqudkp1VCMRGEjEmKVPiXnR0MUYERMB54gjae7SwBH+
         8O7Jn8xJk4wPyLNQzLWEnjSSOrayxyQ4vaNC+6hiphrjycAkr0VD9SFcjLAuTr+tl4q0
         Y86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741214942; x=1741819742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFYybP/h8fOOv7x6T0mDjGnjs7SO3QwCZI7Q4LRb824=;
        b=CmJ0UiHtHCVB0LNcj9JQAX5DOuw9NzUkLSwmJrN8EIxtq44kXWV/utrbsNf/ihXYby
         r6Qk/1yajQiyRJ/w3bXK33dshkbCT6IdKCPisTV13/bzxLFQSsZoXByUR9QmP6Bqk/kh
         /HhFw5I2nJuX0wNTnHe6xPVOv6RnMOCqsI3Yh8dQjWw3bQQlr7sD1Q9269s4uHybLT6y
         62uQfOa+T3Aikpnat6DhbdDASYNnpBJH/JBKlPF9BCjA75CXz2GS5s6/keHiyK3Stwq+
         mJQUIF/knZC6oPAORXAFOy++k1pjufLlCdSVZdSg4vjlCJziF1xXoj8Qzy1+hoF2qYdr
         3DIg==
X-Gm-Message-State: AOJu0YyQeRWxe6/pLO4YzA6+mCK7sK600LYw613omdq2Q6dzieJqIXSq
	3BiNBdqycvg5iFEe1AjMMF+DdZl566HJ2+gkAxYqgOQXPHJMGPFe8O02k336ymg=
X-Gm-Gg: ASbGnctRiCw83nXj8vSa2HpVdp6s2fE07top7zZmRwO+SmzjnOA8sSZs4BVWdIwuIkX
	OP3Mr7KIIdhMreTSHBwmDDqZhkuyv1o5f57b5G71f+m71do9ypF5mCt9+svNtkOCARqkj2ULqyz
	zqx1kb7eevw5tKTz0GhSgbb1noWgnEjKjj32VLSTmGkC91Zb0YAZwEFnBXTBuI/XEW/FkCgCjY5
	iMZL7ps6uDsKWHucKq5s6T023o5HwcweJsaBarIlGXTyYPtgRnRkXp7ZG0U8YOgumoI/R4nFIS/
	0iIoDsD04y/yKXqX3hhIh2txlDVYxi1uJ+Glb6eN
X-Google-Smtp-Source: AGHT+IHiF4FAqIjjn8/McPnIJdhPqPvuWE18WrtWy0zWz8b5lpOyHcNGEy/W0q+2+Lsw8Yldhi9I3w==
X-Received: by 2002:a05:6a00:148a:b0:736:491b:536d with SMTP id d2e1a72fcca58-73682cc4155mr7884057b3a.20.1741214942068;
        Wed, 05 Mar 2025 14:49:02 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:9b3c:3246:a388:fe44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73643eb9abdsm7837155b3a.84.2025.03.05.14.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:49:01 -0800 (PST)
Date: Wed, 5 Mar 2025 14:48:58 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, cleger@rivosinc.com, alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Subject: Re: [PATCH v3 0/8] riscv: Unaligned access speed probing fixes and
 skipping
Message-ID: <Z8jU2i5d3e4Dv4vk@ghost>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_144903_479265_099E145D 
X-CRM114-Status: GOOD (  24.30  )
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

On Tue, Mar 04, 2025 at 01:00:15PM +0100, Andrew Jones wrote:
> The first six patches of this series are fixes and cleanups of the
> unaligned access speed probing code. The next patch introduces a
> kernel command line option that allows the probing to be skipped.
> This command line option is a different approach than Jesse's [1].
> [1] takes a cpu-list for a particular speed, supporting heterogeneous
> platforms. With this approach, the kernel command line should only
> be used for homogeneous platforms. [1] also only allowed 'fast' and
> 'slow' to be selected. This parameter also supports 'unsupported',
> which could be useful for testing code paths gated on that. The final
> patch adds the documentation.

Why constrain the command line option to homogeneous platforms?

- Charlie

> 
> (I'd be happy to split the fixes from the new skip support if we want to
> discuss the skip support independently, but I want to base on the fixes
> and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
> or not at the moment, so I'm just posting together for now in order to
> be able to check for my patchwork green lights!)
> 
> [1] https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/
> 
> Thanks,
> drew
> 
> ---
> v3:
>  - Fix compile when RISCV_PROBE_UNALIGNED_ACCESS is not selected
> 
> v2:
>  - Change to command line option from table
> 
> 
> Andrew Jones (8):
>   riscv: Annotate unaligned access init functions
>   riscv: Fix riscv_online_cpu_vec
>   riscv: Fix check_unaligned_access_all_cpus
>   riscv: Change check_unaligned_access_speed_all_cpus to void
>   riscv: Fix set up of cpu hotplug callbacks
>   riscv: Fix set up of vector cpu hotplug callback
>   riscv: Add parameter for skipping access speed tests
>   Documentation/kernel-parameters: Add riscv unaligned speed parameters
> 
>  .../admin-guide/kernel-parameters.txt         |  16 ++
>  arch/riscv/include/asm/cpufeature.h           |   4 +-
>  arch/riscv/kernel/traps_misaligned.c          |  14 +-
>  arch/riscv/kernel/unaligned_access_speed.c    | 237 +++++++++++-------
>  4 files changed, 168 insertions(+), 103 deletions(-)
> 
> -- 
> 2.48.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
