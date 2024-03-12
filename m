Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31287C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 22:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWMluBg25Anh/+tf9ykyOgPCjYEmnNiyVnBj7GXnYeY=; b=e6N9SA5FOZEPdY
	KdDWozrZEwSYICEZZ0QpCeRkru3lC5K6OswHTSShX6+tCzy2yOmjyeVsFIzSXJ5DhZjVcFXeikbsV
	+KJc6tAA0VYj1Nccxl1moEdmt9iw3z5oDVtQStDBLQoGIExDiwRV/WdL57SUkTsuJaXEqNtPdWSOl
	hkys6yeEDKZzLLSi/mW6iuchVPARVP41pXy6b2VJnsAWMCvidZg3T0BWW0EB5mFpd6do1wp+XcGGE
	khNxe7PukLGSh15Yj2rAhmvmkeUHnU9Adn2r23r0ZpQFTD1HNzLen1nrafp6ImW8N/pHDMn5ZkVK4
	JfRGhb5lIgjqiZlPqXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkABG-00000007hhR-40au;
	Tue, 12 Mar 2024 22:01:06 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkABA-00000007heR-3Qss
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 22:01:05 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5dc949f998fso5533287a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 15:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280859; x=1710885659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lLq08iYnVcnWuDzFJHO0LDnyeIZ1/WCj/v6YSvUnsiY=;
        b=J2lBx3Pd99laX0OjaFZn28MUHyhQMP0dMqXRG1TkUb9Lwgs92LCayn1+SJg9NHI8/6
         NaY/3AMeb7WlfvPnUZNgW9J+MOOBPtxELVVUdJm0Bb0XeTmuaHdecFr3v0vZUH2PmG6n
         l4CFK5kg7g1sJg0IPgIFNlXxwlO1H+Tbltmnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280859; x=1710885659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLq08iYnVcnWuDzFJHO0LDnyeIZ1/WCj/v6YSvUnsiY=;
        b=cOK5ybKa9XVAn+L+arD0s5Pb0EPzwCC3qIj/7BE+obHhjhlKxdlbJlZBApm+EmpJYh
         CK7dGDYFcv/H9Syp+aKufjlnj366upnfpvmw3dcitXTon7vo6Fil9dw0u+FxsSvryEej
         5EHlzmypK32FX9T+akWE/tAx53tHW2myN1FlAO/V9ggzxIuzef2wIlxvdcenMyMnICxW
         X4xQsjGfCriEERUrSKiK0nkdvAlUyeuQ2VWJ1yAcF0rwK3spxgbrPyNx6EPEpPRVUDWq
         9OyQbRHM8E/qE0g++nhqZV8j4/zMPCWjbvoZa0WduGU3sIH1W2hPBnQdLPgR5LQp4Lqd
         /diQ==
X-Forwarded-Encrypted: i=1; AJvYcCVapcFkre+RbnrDBk9xsefAtQ5pQnjhUYa3aDIhFVJACpZ0yC1Fh15IHs/uJMROVJ1Uh0+88EPCfiHZpXE9NU1lm1NtyiKNt8NGDXdxZFgi
X-Gm-Message-State: AOJu0Yz2ohjdIh2GbKTpuPypjdNTusm0vkJ9oxNhan5xreqVV+t6+Nod
	7CRzj+SCRv/ES0y6mTqWj+wIt8QGm88QtE6QT4E01Clx6SuSACEGhypvYfbR1A==
X-Google-Smtp-Source: AGHT+IHdha0C7GHgTOtn+h7GC1nV2SuVFIKnwQ0XR5LyRaxyHLt5ciUVNw2VJKedo24c6BQYxDb+PA==
X-Received: by 2002:a17:90a:8b02:b0:299:4cc5:aa25 with SMTP id y2-20020a17090a8b0200b002994cc5aa25mr2853635pjn.25.1710280859551;
        Tue, 12 Mar 2024 15:00:59 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u8-20020a170902e5c800b001ddb57a4dffsm2232631plf.132.2024.03.12.15.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:00:59 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:00:58 -0700
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
Subject: Re: [PATCH 01/14] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <202403121500.64A2C02@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-2-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-2-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_150100_911881_4C91C81A 
X-CRM114-Status: GOOD (  16.40  )
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

On Tue, Mar 12, 2024 at 10:02:56AM -0700, Guenter Roeck wrote:
> Some unit tests intentionally trigger warning backtraces by passing
> bad parameters to API functions. Such unit tests typically check the
> return value from those calls, not the existence of the warning backtrace.
> 
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
> 
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
> 
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code.
> 
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Daniel Diaz <daniel.diaz@linaro.org>
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Yup, this looks fine to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
