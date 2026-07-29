Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88FAC54F52
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNa6ZAKryETdECVYvGoKgY6hUJi1tKOyQe8wO2L5RPs=; b=c7bj/yTfyXoPB0
	/cTNVQRiezLSdsUgKiwvY0AZBvWpMH3I+z44NJmZGkQ5pwyJgBPl5cRAwJdTyyyEt146OlAI7pccl
	jSKCkxzy7NAu97jDXtfzKabzRq3yv9h+wNinh/kWkg+b4m29FOzf0TiNhjgex15L/2IJu3/8ugVQT
	k342cyzNPY6Tf7itRtJSxdQoEypZQy3GczOZZJ7tQOUhF2kVpWueMJ0B0H51i3nBCt37fUxqoaJee
	veHt0GHhFTOb0GVVceSmFqE9M/sqn/fWV3sV6jYUrtV+9MxsrbhBfjBXtQXx/g0sr5xJ8r0zcoRwk
	IEIms77qeSoriev5RrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotWT-00000006e3o-0NaC;
	Wed, 29 Jul 2026 01:55:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotWN-00000006e1R-1Ncf
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:55:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-381216921aaso400707a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 18:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290146; x=1785894946; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7grHuSDIPRW8L8mo7e1hpwggYcsc7BeN7mOCkn3pJuU=;
        b=laZF2tkiIHG4PHLpApxIbBc/NCyWJy8AXWyp9LjHLlzupdJ5CHZwresJyGzoJoXmp0
         POM3K3PkcwB4TIvKhyr5kORskyNzWAxZQdFZHzmMsGtwCoky5xrcBWIHWjaAIsCjSS7t
         m4aHQz8h79FbwpREs9LNoPxwT5eIm/huklaunVYFqKs8Q4pBtsbzVYJzVK/XUQpFZ9zd
         wj1QiiVujjmV5BCSh1yW3fY4PrNUi9svZUMcRF0oMGLygmUY94e3CQHF/R+zfqD81s5b
         Xi5ry5RnK+ai+GTJnHpELXVlqVuEymuE8AD7UaCh3c5I/tzVVD0bN5ErT7P0dITo85Bb
         2z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290146; x=1785894946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7grHuSDIPRW8L8mo7e1hpwggYcsc7BeN7mOCkn3pJuU=;
        b=dNd4MW3xANlAqL51R0OY9t6knyM/WpDleOPvX+UWn7CY/pRtmnPJJ1tKTTEJ32eIE7
         TaT65mUfmve/RNygRsVqEs4Z3Hy49gdcS6Pa19S2WnVAOlLfkXwRmZl2KgRq5VXYJRkc
         L2RZvRDbG3tCQDZbVCHiCKDu8IKTA9ryutA/hmgCns/5h1+w+yDkFsSlhpBRfIPl82/x
         oYdIgMAOWTMq01PPxt+Yt/2nEnREP9gtYkLcGmDVGRloWhFbNTq8jHm4LoPnA3UF86pD
         q6nuXXbGobswBFuWKba3HAs8sRYFzwp+vqqZ09Wxv9yJu8LhCMeTjyjDFrTCb4H+0O8R
         JOIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVdHOQk3ZmheJyAk5uqs6TdESLeKROnMXr0i0YvSJc8DB/kJGqY8qFVdbrMAkrVrfyhauSo+KiThvIBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEb/zZjsfxyco9U06S7yLqfCv+QiuZx26EgZrBglPK1eFpTbcM
	pdVKvlp9rPoPM6YMUpfKXjdfkEM2YWJ7yvuL/q/34iEl0wT1MSaxJPeVEVNLhZyg
X-Gm-Gg: AR+sD11drgFnZvYL8Yq0TJYvztIwOAdaVqzYPMIR2bvJ32et7QmZU2Y4KzpOE0fb5oN
	U/htMZaCoPGQTZo45UfU2xHKDrpuVpWDQ0/0BJqHQmcsSoW2qhaG1OF78lfNB5yhVFbNR61br0o
	UxZXoAoCYkjf5fWPLCN3zkAjRH0ytngRQM4/4QwzkxrRrTvJV/J/gGQ68nHUSxK1K3YfStRue3c
	Pr2o5CAPnntriCF4HmuKGjrVe4Y0Du8vIuyMbFIrzAI4rqY3qID+2+LPav7CkltdgSun9BR9/K+
	eSK3UzIw2gE1qaHPVfKK9YewqH05ca1mp8uCBSnShe7hhGoDcH01WT0sXkIX3W/HFZY5BACS0Cc
	gzWA+45eUWfDvJu67w7TXW3FwZeqrKCOTlPkxx+4ZIQGLSgD66C6Nom0yQxsMT9JKEQQubTDl1y
	tC3qNsGH6LyYnQnm7u2jB7FQnzdYZWmYZPDmxwG8PpFWuLVDpiEQmPoeQYwpdU2w+qeO7qnw==
X-Received: by 2002:a17:90b:3b41:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-38f6a30c840mr4956125a91.5.1785290146311;
        Tue, 28 Jul 2026 18:55:46 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642dd6casm1984373a91.13.2026.07.28.18.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:55:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com,
	Alexander Sverdlin <alex@sverdlin.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Wed, 29 Jul 2026 09:54:59 +0800
Message-ID: <178529008850.164571.1818758565125739771.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_185547_370009_8A12561C 
X-CRM114-Status: UNSURE (   9.89  )
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

On Mon, 15 Jun 2026 08:03:21 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking
> from ethernet, enumerate the wifi chip, have bluetooth, and can
> read a I2C slave device over i2c4.
> 
> [...]

Applied to dt/riscv, thanks!

[2/3] riscv64: dts: sophgo: add SG2000 dtsi
      https://github.com/sophgo/linux/commit/022d1bd8b08257966c4a00fc21fb72a828bca870
[3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board support
      https://github.com/sophgo/linux/commit/0cef4f813649eb19476c98f763128561f5bdf969

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
