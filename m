Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BB3C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 04:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqAIAi2T02jexGfdckv+o0v0N7Eh9eP0y8e8+sI6lFs=; b=QX8OjR1zLnilzu
	msRYTiRuMZ/Y+Dd0GL1em6V8rwbh99pL4qXlM7gvZ1lnDfPXumXthQi3/q6y/T/JaBJxXOKJl1nQD
	72pgaux4EFfWjcFhF8L659aVdAG6+seLWYiNGW1V9kWDQHj3+BvQMWYh//kZhvung/4+SsWJYjoXY
	H20t8266J/XK2Z2AzSvzcMaFpsAou3EG46LO1sYmdsnma/zVGNl125fjqW31HN4uUAElu2u5y0DOM
	fnElI5oxse56TyVOewNw8rk4GDMMshZu4FDj66H6NDEh4759Q5Bv7wIa+1KqknpY1MQEaRfT840DZ
	ZuNAPx17QIOx/mrTiMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAMtG-000000083WZ-01UW;
	Fri, 24 May 2024 04:50:50 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAMtC-000000083Vx-1YAg;
	Fri, 24 May 2024 04:50:47 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3309070a12.2;
        Thu, 23 May 2024 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716526243; x=1717131043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIptIV19IdFhks5FxO4qOze6Xd4kuAo9MJ+XTfG/tCk=;
        b=I9MVYDuYLACfGNb7YtvhyuCQwzPgyRqFwj9TDwoJFQ5a5N2LacYf80F9G3RIwFSYk+
         4L/0/ZpBdE6zkCDpp35LfR2xyEnXqDMyUdoTTCVLK2L/5yvNPUR4VshFymfGHiUuKVge
         j1R//udANhPn2PQSWr34/ZxJhJPQPA+5orV45An9d3WQG4qPSu79v4uZgBB5OozKDvtr
         PUmIqDbuFH3Xve69a3gyyvI96CJ9WfaaaloJQtDI12HiGO2ySMNL7R+sMbNEJKVRnyZH
         7nI5l/GUKvNgQ+45bCg8INEf7KvYt3v9lntvbQAKFM5YveawjJ0ehIWWZEmxYov9/Duo
         R6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716526243; x=1717131043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIptIV19IdFhks5FxO4qOze6Xd4kuAo9MJ+XTfG/tCk=;
        b=d0mOrHOULSP0FihhvhCGM/J8y9UmZUlg8/AVMxMGJNqlXybHvJNd4lp2VMt+/tVM/V
         z2RLwATg+KAxMKZM1AK0+BdOgnIGiRCvGl4JmExIR9lff//FApNH3qrECdQ7oyYFPBrQ
         Ar0EI6fi8ltqPvgSF0uD7YipVWFkAtxkWwdkrs4sa6qyGTgSWLRWH65EKJwfVuQ36UFb
         I1Jb6bLW3yH8XcfPww1QZFMWJfMBwdHRvHdTPotDhE8L2JT6cnvlhZrofr0YJsnNpYpt
         sOQJcGB/CIQ9VqaTXEy1UOKEUE0iivjKicFJw5ytaIGrVzK4eWgSiOBMtyg9NPVpVvDQ
         BD3A==
X-Forwarded-Encrypted: i=1; AJvYcCVZI1C0ZgEdQKQ4RQkYVwGRAKNQKjXSqmClL8v+m71chpdAHl9bqVsLb7pQcnuZfjlXVQdashNE5L46qcrjGI9nMufJzlFssIqu1dsnDWFVxg8hoZr4/LK1eHN2PsymXxaoO/eTsfRWrxCnFlEnYAabWo2A4S8=
X-Gm-Message-State: AOJu0Yye5xh3xajVVwh5kHrXKBszVGB+iEnoiff0TKXpBGOnWGNxdyla
	XnaWbG4wtNz9Cgqo/YpWJUO/HHltE2YD4zHNxASeaEOeQiT31Ovf
X-Google-Smtp-Source: AGHT+IGph2ngJGkIc2ZoYCJl38SlsP/yXGoytXnEgHL9Q+wVYFcQgbKU4AH+MCEZUe8DoMBNd28k3w==
X-Received: by 2002:a17:902:64d7:b0:1f3:3f33:2873 with SMTP id d9443c01a7336-1f4486ed8afmr11797375ad.25.1716526243411;
        Thu, 23 May 2024 21:50:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7ab7fasm4449235ad.81.2024.05.23.21.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 21:50:42 -0700 (PDT)
Date: Thu, 23 May 2024 21:50:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240329072441.591471-14-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_215046_438426_015B9143 
X-CRM114-Status: GOOD (  12.91  )
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

Hi,

On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
> Now that all previously-supported architectures select
> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
> of the existing list of architectures. It can also take advantage of the
> common kernel-mode FPU API and method of adjusting CFLAGS.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

With this patch in the mainline kernel, I get the following build error
when trying to build powerpc:ppc32_allmodconfig.

powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o

[ repeated many times ]

The problem is no longer seen after reverting this patch.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
