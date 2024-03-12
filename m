Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170E3C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 22:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NR5STgxkHkSTMPtgUgtiodOMsu/LifpfyC1Y1/A3c0=; b=d8muo6vtliyb4i
	30G+ITc2b740gnIzLq5BFpBKfTj4NE1mw+pNy1/A25R4mJwD5n/YuUd8eKLy0O7GjNF5WW+POj3uU
	iHO1kU/ZUSzwxoprfoJyP97RshJerXp/rSmJZSkb7fnnutU44M9RscCRhakjmsFzdqhlpr5DudymI
	64Rh3/uKW1t3RIcaqf+XEoewVh+i0l3Ddf5WoGozu5vdHzs/091kluxzM+O8woE+dmGPUpn6UGL8c
	QM/M6Nmst60088Y6GJqIlsucdlKrIpVuLL1ITYT2GMQQ1QG/viMVSuAqZXEsNPCYqq08M8GkhTMjk
	FOJNZ9FCQYSryyISXTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkADJ-00000007iag-1xO2;
	Tue, 12 Mar 2024 22:03:13 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkADE-00000007iWM-2Ldn
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 22:03:10 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7c8ccffacbcso11444939f.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 15:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280986; x=1710885786; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFZkOPzjUiG9hBeGxmULl/XMqNk9IbEaqEvdeXcgD8s=;
        b=WVaZNxzLXwXHdhSqfnZ5hxZCv+1xu97EvcnlFNgdIaqXXwJd/mYCdNtiY5TveA1IHS
         O7KVck6H53Jw1HGGiDj5DKBs8tN5c8gD163YfYCVjPxWRlBBqVf+CJNjGqAPxH9kApkJ
         5m00N+T9Ly0t8NySHKGbqUFjTE++akpjkMyuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280986; x=1710885786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFZkOPzjUiG9hBeGxmULl/XMqNk9IbEaqEvdeXcgD8s=;
        b=IiMVGnoBD+4uzy5Z3JQTCwZu1gUMQ51izhMby42HOXZUn6kPaAAzrAI1EuYmbUhzYF
         nRqh2reECHb2UeF+f1Yee0PmfUxmWXH0L3PxCj+53Qnfz+Sna7nwNwk5oYap5T4EBo9W
         xusLjOW3S89DkWw5YgZvKDjFbeicFVrfWI5rj87u9INJOwilM1qUf6CVP/5RluUcU6QP
         HSUa4qcVXJEA4SttG3WKTDM+6O/jMidZL/dKAj5bfAZDjS+dtEzf8Zi73MqVgD1Cqawi
         7l2zYy4m2J5j5YxaIFrvT4gUzlOpkLgBDrkESHFdKHB8aqqQI21oNHsSqAm915vRmmFr
         4SZg==
X-Forwarded-Encrypted: i=1; AJvYcCVwhr7ZptuhUDe/PgtIx4Q77/Xqe1NNC/lYelYtgDc/onp9KSoN4u/aP8UPE90QScFUDAfu7nr8N4MgXUzlO6hJ+emC6ETzEGQWGIWs3xyS
X-Gm-Message-State: AOJu0Yx0e0bl9r+P5a3TH5mmDkodpa3OpJ1wpdvxUbBmVNC1fPD3jYKT
	xWOY44CuO5jKmbiwgXi5dSxg5wYXaOWOkRhHjoNmATZf2ceYVTeKHMjy+mgaUw==
X-Google-Smtp-Source: AGHT+IEdwN1SY2GeciEHPDmRWgTgdPa04evl6KEFQYoPJeYQSV2BmWI4216WoCmzy6l7zJDsrZVhNw==
X-Received: by 2002:a6b:e719:0:b0:7c8:bf15:5653 with SMTP id b25-20020a6be719000000b007c8bf155653mr4918871ioh.20.1710280986087;
        Tue, 12 Mar 2024 15:03:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m14-20020a63ed4e000000b005dc816b2369sm6650251pgk.28.2024.03.12.15.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:03:05 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:03:05 -0700
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
Subject: Re: [PATCH 04/14] kunit: Add documentation for warning backtrace
 suppression API
Message-ID: <202403121503.B97DE8A60E@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-5-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-5-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_150308_628954_B6B1113D 
X-CRM114-Status: UNSURE (   7.96  )
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

On Tue, Mar 12, 2024 at 10:02:59AM -0700, Guenter Roeck wrote:
> Document API functions for suppressing warning backtraces.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
