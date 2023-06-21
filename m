Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E55EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35S0bBSxegmYewtUu3C/I2SWKUsjjxEQ11NgZgR8Fs4=; b=0nXNyCcSifQIMi
	UjVDxPkFJEIX4u1CLKCoVYhUEDi/mbFIiL4yiBAGFQ3P6tXv2bKg9CL6+ZCtSRMVhFrjJhGsH0w2/
	Bv5Q4QA9c+IBxeP6EwPwuGgCIUMb7JO7ByLwmC/D8FjeR+/Ow+xl6UI6e3iI8U6UQl0N/Z0YBTXNw
	+1AQQuLxLMBT/PIwjOQV+NxrijuAMVfHaQAnqYkh9B4C24ZiVH+Vgug3C0PvC8bD34KPdkxYjkqLm
	S8xG0LciuG1psJrEHe9E6SR9kV57kDYike9yewELlO0ufZVdKLGU9ZDbi0/S9Hdw4cRteyDRzCO1O
	eLPC2K+RhzCuLexNLlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBxob-00EfXs-2u;
	Wed, 21 Jun 2023 13:24:05 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBxoZ-00EfXA-0u
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 13:24:04 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-39ca120c103so3869199b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 06:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687353842; x=1689945842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77CFlz9TwTlFk4rL1YgfbwtxFKs8v8egG44k3ujctUA=;
        b=nS+b/5jq1z/kJRNoTiGqfITeO9WumeN0/hxEkI3nJmhBtVGi7RrqXd38ZpzgTxueCa
         lbMAVL2eOyH9YyV2kmMGsoA8xQvaZgzzk/DpMzoFiS9UF/29fnC5iBa7XuRvByH3uzsG
         PZZgCqoKOJ9Hm1sbwvk+Y9GmnK3Ky0/acfzVlMci13auc9cel0QMWuNg6Fb/45DkPwCS
         pMij/4KxN1fqQMUReWO4g9YowdUsD1vaP8wZPPto12tCemohGPgVJNrUdsCz8vQ9bXqm
         JEsuqVsZKYtFTZfqRrCE12MI0pOyc5v1fEJC6YHBfxJpRZnPLEVCzDtqMfjbaISe7Dvl
         uxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687353842; x=1689945842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77CFlz9TwTlFk4rL1YgfbwtxFKs8v8egG44k3ujctUA=;
        b=H///xAS2BYDI6/i6HeOm93j1Dg8Jh1cqejgX2CsaIbbeqyCcSGUmx/ppBuqtIh3Z6/
         +/UwQR/pL2URM6zHHz+DKeekQMunelvsnBs1AEu0syr7d6cTOR6DauwYLJmRCmtc5lrC
         KL9Rg2Kl5xLKPxfhGEhvJMLKx1MWDHVmsY6gCUIUzt3II+szSvQZzUSih/7t7s71NkAY
         qfq0upEaBZTq0mArYLQ9Xw5fu2slz+KLmFMk+KnaF+ttfC6v2RB446Ae0Cmy6+rosEVA
         NhbmkRCqqw6l9dZJ/U7ktU5mT9dg02ogDnCpPQqdwYkS0OgG5pDmd4tCKLt2Y5u6bdko
         Y31w==
X-Gm-Message-State: AC+VfDzeU3XsLZE1YmScQTULKRPknOfr0ZqqifZlmJtRJlIjdLNCmY6c
	iXhC48e84IZvNGJ/rVlIFlCLGQ==
X-Google-Smtp-Source: ACHHUZ5EvsYYC1aM28L+BhJdSyRInfskfoYHS088kDZqSOW9v6mvhxzADB2/cRIPZkyCiRr0Tv+QTA==
X-Received: by 2002:a05:6808:2088:b0:39e:dfd7:162 with SMTP id s8-20020a056808208800b0039edfd70162mr9144606oiw.31.1687353842147;
        Wed, 21 Jun 2023 06:24:02 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id y19-20020a63b513000000b0053423447a12sm3091162pge.73.2023.06.21.06.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 06:24:01 -0700 (PDT)
Date: Wed, 21 Jun 2023 18:53:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Shuai <songshuaishuai@tinylab.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <ZJL56kehoYJm1g2q@sunil-laptop>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621072234.9900-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_062403_320133_7F0D33B6 
X-CRM114-Status: UNSURE (   7.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDk6MjI6MzNBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IFRoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRoZSBjb25zdHJhaW50cyBhbmQgcmVx
dWlyZW1lbnRzIG9mIHRoZSBlYXJseQo+IGJvb3QgcHJvY2VzcyBpbiBhIFJJU0MtViBrZXJuZWwu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPgo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4g
LS0tCgpSZXZpZXdlZC1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+CgpU
aGFua3MhClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
