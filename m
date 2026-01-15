Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A12D3CC92
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 00:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Odbgr7S+fmqTCkD7V6WBOLOiRfBnV6JFnMhGt5WUv4A=; b=uNGdTwd8divNba
	7v+SiELhfG8izEpujD8f92yfQC3lYCKanqxp6mEQcUK+K+/TYzegVqH4FdEWj3P5/F0L5tbJ7UM90
	YSXQ73wl9zCB0U0ZZtlH/5Ibj0Ozb/Nkb29Yxxp3P5LdZDvk1LFV3kotGfytCS30ni2wZe4CiSfoc
	GFV/xS4uljOcfrg5YZrDg2ZVtFpjAaC1r3y1NvweaSDkYbOsi9BaCEayGoGKBlP/AfCJdujU+0jQY
	Z6Nv53xHE3gmo6IxM7JovCzvC6YyqhKo0jiORIzFLPwEnXm/Hpuv4upKnqV1kjfFIT2F5gbKJCajm
	/BNkrrf7JQ56UsCmn7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBLB-0000000BFQR-1FcG;
	Thu, 15 Jan 2026 00:35:57 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBL8-0000000BFPO-3TKn
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 00:35:56 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-11f42e97229so774738c88.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 16:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768437354; x=1769042154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czNa2HPASxcpsdkABFpBkldVnBnMqWd7/qbtKUpfVF4=;
        b=Taz1bt5Eao2qKl1OBXzljse5+hGsV2N+kXS8VW3JbsmVwaXIljOnBO9OGvO8qNaXv1
         PGP0r+0+GTkDt9w1bupMY9InxajqvC4o8CZGfiwdpfgcVtrRX0Dn+o4i1gCGMg+gmq1j
         OQsjASXq4CWHZ8mgi2A9UJbTlsy9zvLf2ZXzyVGHr+ICzRTQM0UislQn0uAj8vJH49Y8
         XOkt+5nUz7stj+/ayyPIE7tdkjagrSNGnFZ60L5yOsaCJ+l1x8rntugV6ODu8lMiRBAQ
         9ADd1i8WHXn1OOg9/N4AD7IWtuZ9HJRynP10Gx4flSVsydeEWpEy2TohQ6i/7DmuhGxF
         2MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768437354; x=1769042154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czNa2HPASxcpsdkABFpBkldVnBnMqWd7/qbtKUpfVF4=;
        b=rowUQeMC76hMuC5oJGIp02SUTXMVFe4TkiIZFeyk7eYZBlrXHYvbkD7VBoaa/wyF8A
         PSuEGDSti7W+HVXtazn9X+zI8tJlH7oKGHpnivbpqfz9LVf9Td4nwfGJiLcaRAR8VrYa
         SAIBRfuFWMMZGKPbB4jJCRmSu2y/VEdJ0ZXHALyfos+/hUOc9y2MIqOxMltcvGOWrmzA
         0T1UakIVudpulzM1PNGGY5XikwLCBeOee5UK4x8KnH3JGgNYmCI6bYyvP3GI4z+K/IDq
         lci0QJvs2FskI4hvao3YrlPJuocSNM5GnbCAv+x5Vx5Y9VaSdVwziLdoO5jzx9S9msup
         qmEw==
X-Forwarded-Encrypted: i=1; AJvYcCUGcPYpMAUbnQtfxQ5RUwUqnpuijQGMbYW1ZeffjhBPUG888FbWutMPfiJNxpu04a7PuHJicwXbdViyPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVYr3pOdICwL5gtYEtOfUk/pw6jc5xgnMOF56UUzmN+GM0nDxS
	YakWSBdv0d6KSy9PJ+Td2GdBQQ9dCmR5WLJ+sHhauwoOv10KfJvQlM7g
X-Gm-Gg: AY/fxX53hLHbfriGuPWQpvvTipcKMLsYXf5xSncAZmHU3mioUNOMLxNJWpT/zlFHpG0
	8lGFm9+N5VJhIX4ZUUEKGk78uhRHOjyRVO8O8+C0oRO7hOz1jxQpVoe4k40b5fm8cMqjdOUiehw
	A/O9T2+CVPdcgnJsBuzmQOuNo63AYoU3bUB0LGm6sXnrLyMOu+X1lWjk2YM644lt+/6mNXvROmH
	671Mp+tTUiGyiarp7vxiiCwPlatCiouvVHaW4VYrGqqXNDWC+r9rfJQo4qE8EjWmcJwUrBwAiiG
	zWCQhjWYMQ/VRnKVOoivSFK4oreOsyfmn3xTOE+689h9dhh4HBQBzxkQuD8IwIk23oih3+yjdJZ
	vV+zdV0X1FukoT9owGIVXzBni0JDHWKk2g7vKjOOsCrX3GF9ecQLMwbPo0p2kZTOfdFRdz9cLPq
	+SN+PkVEu4fQ==
X-Received: by 2002:a05:7023:906:b0:11a:4ffb:9825 with SMTP id a92af1059eb24-12336a47f3cmr5379565c88.6.1768437353929;
        Wed, 14 Jan 2026 16:35:53 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248bb6esm32655086c88.12.2026.01.14.16.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:35:53 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: unicorn_wang@outlook.com,
	Michael Orlitzky <michael@orlitzky.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/1] Enable hardware clock (RTC) on the Milk-V Pioneer
Date: Thu, 15 Jan 2026 08:35:48 +0800
Message-ID: <176843728514.411490.2857554435791517315.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107112922.20013-1-michael@orlitzky.com>
References: <20260107112922.20013-1-michael@orlitzky.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_163554_865665_E0CACFF3 
X-CRM114-Status: GOOD (  10.01  )
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

On Wed, 07 Jan 2026 06:29:21 -0500, Michael Orlitzky wrote:
> Add the DTS entries needed for the hardware clock on the Milk-V
> Pioneer. I was able to get this working with an earlier (6.1.x) vendor
> kernel, but it is disabled in the upstream DTS.
> 
> Changes in v2:
>   - Trim extraneous information from the commit message
>   - Link to v1: https://lore.kernel.org/sophgo/20260105120129.58895-1-michael@orlitzky.com
> 
> [...]

Applied to dt/riscv, thanks!

[1/1] riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer
      https://github.com/sophgo/linux/commit/9e81c522680db5998c872fb91ff7877cf3d8ff42

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
