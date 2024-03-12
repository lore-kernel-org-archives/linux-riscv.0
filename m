Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF84C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 22:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vhnV9Q1SyqXALKK/7Tg9akqv0+jWs8H3B2hNEyn5rc=; b=FFonTBvkgapEz6
	57sBCCwhz8uHzsSsSdqvdKKoFu8iku2cTDUoGiWOmizxloDrVqIQkN0K35vk+UF/2qV+tsc+riyd5
	48iQ43BaMYnnURZ2FhuMM/9amfKM8IUuyjPpTdB/J4tl2u89CMtksNgq1Apq44RpFrZpkT9zV0cdP
	N3/Ljo6Qn4V4ktcdzSJe/XfM9Vx78lULnqx9399gTypRQ+4UDQCLhNq6+GLLtkAoXjAjtAVeITfPM
	Mhx4GB/yI1e4qD303FTZi49u9OYWRwgAaTIRXQ5v97n+VjF3njAWqjQp4TBe9Ju58E3aXQ9HAB4JV
	gX9ruKyorSqOnfyW9j+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkACx-00000007iLz-3IK3;
	Tue, 12 Mar 2024 22:02:51 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkACt-00000007iJt-31Qv
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 22:02:49 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e6b75211ceso62107b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280967; x=1710885767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1akdFCp/NrQTZkdZoE61av7sk42pTtpjjQoFP3uV05s=;
        b=C9CZWjzEZEIqvBb+80dm3i845LO7a3SzwLv6CD1lUsmtoQKJH043Ci3cBI3TRNmx81
         y0NvwWxYehxV9fudcv2YggKs2kPuPFw506FjSJE7Wd8MoRE710ulKQU0M0ghjlbRV5Hr
         jlreMDVoDJejR2SlhQW8GI0xS18k/5Otn9AqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280967; x=1710885767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1akdFCp/NrQTZkdZoE61av7sk42pTtpjjQoFP3uV05s=;
        b=gLd8x41Gm73/CkudMIgw7Llj2kFJlHaZxYvNYIFJ0LuxmsLOSlWEgyPLMbbP7ZqGAe
         d7T2eUepH7rNq4WQjDjEvDM70Kye1sO2ZitgMFuMfiGsoIx8PAsZJGlXbAC1FeYosyXo
         trZwm2gW3Mu5CQ41X26nuE/k6YDUGQDOub8KgnlHBcR96y1K3iWGciELLULcEARvZ9Q7
         6QkvHAfgmlNZ8BN5jb3UE4vX95r2kc1tZvPzG/RY/t8M7VJcfmz6C02UIRknXBTON2is
         oldu5MFqcJdGwSvCnh4atLv52thuqcgmS6Ym0nifndjpBY0Mx9UzVY+pkKs7C93odD+4
         O5fg==
X-Forwarded-Encrypted: i=1; AJvYcCWwAPMRevjj+j6JWeFs2xfXriO837izAZsrqHR8I0AANYlxCNFbH0DHMsle3vtyoAte/GZOahCQZKkcACtgKmE5t77f4TdX/kjJ344Khp17
X-Gm-Message-State: AOJu0YzjELVA7nftc3vi6DJBBi+421NKBbavuIqTtQHW7hQ7hiVuVXBS
	VX5nS03d/R5PjsIobfa7qZnCvdnO/Ld3J1Vm7km2YoOL+hSqizBBlzE7WQiiEQ==
X-Google-Smtp-Source: AGHT+IFKZ+X2o3xvUM/DPjpn5dJMdSK/7jBm9riFOy6GxFDG2jNN2P7xmSx2+ecCvjPJ+atiR43WGA==
X-Received: by 2002:a05:6a20:9382:b0:1a0:efd0:b183 with SMTP id x2-20020a056a20938200b001a0efd0b183mr14145890pzh.44.1710280967019;
        Tue, 12 Mar 2024 15:02:47 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090301cb00b001dd6c0800b4sm7193896plh.188.2024.03.12.15.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:02:46 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:02:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@lists.linux.dev
Subject: Re: [PATCH 03/14] kunit: Add test cases for backtrace warning
 suppression
Message-ID: <202403121502.95F27A01@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-4-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-4-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_150247_971178_42955D26 
X-CRM114-Status: UNSURE (   9.18  )
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

On Tue, Mar 12, 2024 at 10:02:58AM -0700, Guenter Roeck wrote:
> Add unit tests to verify that warning backtrace suppression works.
> 
> If backtrace suppression does _not_ work, the unit tests will likely
> trigger unsuppressed backtraces, which should actually help to get
> the affected architectures / platforms fixed.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
