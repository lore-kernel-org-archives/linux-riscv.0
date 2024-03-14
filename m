Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB40BC54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4yiflBqSSH16J3JnFNZHFk8S/7zzH1Ypd2yf5+7UZN0=; b=x8B3m79xWSlSY9
	QRYLp7YWf9oCcq5Avsmum8bAhX3uDDT0bby5pJcMS1UydLRHadGqU64qyMNFj12kaSbozmQsoOWrZ
	T0h+0+lJu6t2oREz2XmO4NgS3pSq0kgHYGaAAZ1haeTn9zZLUkoZGxgL7M1BfcStoqdoPMzYtVhXP
	daNZt/uMxmGUsPAKBJzw4erl9GHDJZmm0qNk1mKMCxOvDJfMWgzDbXflsMMhytQQEpMzAUkan5V0d
	xj7wqihIh9gfbRwvmcr7Tlvb7Tb7pdR3J2iunu97ngpDnLbtVIqPSgB+q5jFyP3dl76ncJ0RqeKbq
	ALQw/Nntsi+Qv5Bvbjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkfNV-0000000DMOv-2HMb;
	Thu, 14 Mar 2024 07:19:49 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkfNS-0000000DMNg-0LkL
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 07:19:47 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-4d4293625ccso129436e0c.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710400782; x=1711005582; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
        b=OLbkq8tCDpWnu/HTxz0lJm08CUvPAE96ENRGgtG8/tg96vllRTTHb5jjquQLWkrHUG
         Q2XhwDHDPz8w84QuWJLbGrzXQ3m0N9tTXsg3lr8cFPH17MsxT4L7yaL8mupRHol39D+j
         47BwbKM0H4S+DsTVgSCWFv8tT9ZxyfdOK8q03Ps9xPhYQXhMWPm8DXpfysrTebclE3rV
         B/08nTye39jprrgJGtSf05CPLOwx7iDrjtHPlZBq6ua92VGmsQ9Sv2qyIQNsotzVFN3U
         FctVZLNvIJRq/30bK+BePqjUe8fHNl2mvjV4XX6YrXgji7/pkvcMaoaonTIJvSQWY+Yu
         rLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400782; x=1711005582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
        b=CeRFwKxeoXjS3i+ssxxJpYxX1Kr9jpZYU5g3oG2Ololn9DPM1L2Pwp/X7B2ccmSIcF
         YbolqIW3bcjfgDkSmSWAxE9oPsJ6cozn9RCfsQGaU8oO3XeCa/mzTqSHt4lQ8eFp2/MG
         e8VsXzfRha/c2ByRKRy1UiO2U9C5mwovfLMjL4bCRe3jD1B9Jwri29UTo3MwhE0n2JJb
         bTfQbL8eTtQEughPUUpJw7xH0MdBkME8VLJbdNdvrsDSsKszGbgQU55r9/7+WTOgRt8I
         Mj8om0kUJbN1bFheA5Xkjp7hOlpJ/yKOH+I4RTxrB+fHIIELw5GIB1VJ0lFuuVzHoYWn
         dgWw==
X-Forwarded-Encrypted: i=1; AJvYcCUmQsXXJkzTlZnG6Lh8OO8hOVmQQ7/LfKlEyP1AZxjSzCB5D/y9Q4dQI/cz/ffHNqvq1PWFq7fwv5iJyk85e9W4D63f6wdnmV46UK09yKTb
X-Gm-Message-State: AOJu0Yy7obhZLpEjgXHEwkeMr3eto7pKZvtOb+g+qPSFVHRVYP+oAUlM
	MLbP2j/Pf7Si0W5fl2KCu4ZbAh27Jo5P18ZTlsm8qfbq6YTmL7n7r+rf02kx5emi4Tq6fbqkaiw
	wanL+PwqThcNpyW+VVeZMc1YWl8n1Ttgii6SVQA==
X-Google-Smtp-Source: AGHT+IEu7MNUInwIY97dleYnWeWXfcA+5F5T/ApvKi6n0MwxHEqr/RR8abTAy2/zINbSlyHB23weCyfflgDg+RLDw2Y=
X-Received: by 2002:a05:6122:1296:b0:4b9:e8bd:3b2 with SMTP id
 i22-20020a056122129600b004b9e8bd03b2mr431224vkp.2.1710400782181; Thu, 14 Mar
 2024 00:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 14 Mar 2024 12:49:30 +0530
Message-ID: <CA+G9fYsHhTLw3c1Eg-L6G3H2g7-mPf9zdR+hKDCV10RhHk5vhg@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, netdev@lists.linux.dev, 
	Anders Roxell <anders.roxell@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_001946_230243_6382973F 
X-CRM114-Status: UNSURE (   9.72  )
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

On Tue, 12 Mar 2024 at 22:33, Guenter Roeck <linux@roeck-us.net> wrote:

<trim>

> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.

Thanks for the patchset.
This patch series applied on top of Linux next and tested.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
