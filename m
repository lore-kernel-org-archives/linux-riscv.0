Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E3EC61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kriMDDqgnxNZKqCGJsHQK+3WDsIGUCMdiDrWwTIjTU=; b=EVp1UwG65liDXy
	OnDerHPf8RMQAKr/Aq7gGhLnLG08brflxwDM5P3U6NSARrvq6M3b8+T+xtlSv1+a1lwP1EV21490A
	CvfLawC0if9k64Jy7xidHaPl34rcBTjNlRnG7b1pH0qiXEqdia99SnFAX280VEHKKN9jxauRV+AMW
	xMi+1I9TvArTs4drCOSAM0oMiWijK5GyHACLO27RSPuP16L4Tmdai+VAvbJfWCejHNMNx4c8coAQk
	jjBImTAiXoHtucIiZuwGwU17NxXcvdgBPN7fVbsBHjXrASLAJFo6+g9yBeBqxdUmONHgS5oKAHRwf
	tll3rcBccZeSmDbXOITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Sg0-006hmf-1m;
	Fri, 24 Nov 2023 09:40:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Sfy-006hmK-1V
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 09:40:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b358f216dso10936835e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Nov 2023 01:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700818840; x=1701423640; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=liKWi3k1bQmGEMyLltDAEJD618fY1ygP7q9s9GKBNQY=;
        b=gM6I6t5OvUPTyW6Z7pmY6XHzacP3iM3WdXeO/Vj4qnNllKg+yuQHndzU2zYJ2stcpk
         ytxurouybS2HVAlANo9fwV8F27VK6K/g3JJZEA4wmmDJbpqL+74mDhEp226rlRMtpAli
         4eIIJBMObsyZ70cXbr/jsn2jaJbJAfFAHCq1pBMQ0v8ZCkq5CvhleE02h6QElj4RbyZa
         GTZipXPrW5toEmt/U8RwlPNTVqe5TI/HfIF7MWpF7rxzA+epHNWqk0IwUGvK5rbq2IQ8
         zXAA5nJG2KkdyTzxQ9gOZHTrlUaleHUsRYX92LuweyZJSA5cSLHsv7fhREK741p4O7Qt
         K5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700818840; x=1701423640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=liKWi3k1bQmGEMyLltDAEJD618fY1ygP7q9s9GKBNQY=;
        b=A7V1PBrRlP8b/81M3ufrYHANujVWUJH9MVw23FEDE7C/eZvYQqTFWVuQ1GxehFD583
         6VBOSfxeO5DhHM9Sk7zNkluZUGQBIfEvyAnSiCxwhqGA1YR/Xrcw1dmsZCX1nvtdrGfW
         9osfT7f27fM1Pc1J3jZH5fPr0FK9mVptm6uLeo45rNmIF4827tozlPRirJRU6sVa9Ryw
         6F2Cg6yqwNAeKy5d5EprPRvSVe7rfZD8J+090qmPV07UF8cFicd1VIPqTF8XDUy4ddUx
         NROBMdpdDi0i/24AQXhur/kfo2grt3sg/Hadl9XvB2s2a0F5IHjjSjxeieSU7xcMEHGU
         5nog==
X-Gm-Message-State: AOJu0YyAyHRBNf8fff2HSIO3luztdJZCHcG+P4QQQk3Vf5EoL5AE1VPJ
	rVXe2rmtgpquCWw2UUbbjT6B0g==
X-Google-Smtp-Source: AGHT+IF9VLUBW6WyHhdlX2rn3vRUYeHRnBcJF0nS6mbPXvTDrFDn41SBn1hGDsyIKy9IjON6i7vOzg==
X-Received: by 2002:a05:600c:a0b:b0:408:3cdf:32c with SMTP id z11-20020a05600c0a0b00b004083cdf032cmr2103866wmp.41.1700818840312;
        Fri, 24 Nov 2023 01:40:40 -0800 (PST)
Received: from localhost (cst-prg-91-180.cust.vodafone.cz. [46.135.91.180])
        by smtp.gmail.com with ESMTPSA id q19-20020a05600c46d300b0040b35195e54sm4550012wmo.5.2023.11.24.01.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:40:39 -0800 (PST)
Date: Fri, 24 Nov 2023 10:40:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Evan Green <evan@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 0/5] tools: selftests: riscv: Fix compiler warnings
Message-ID: <20231124-3934c1b3c4b6dc3f076b0f9a@orel>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_014042_523277_A6BC4D3A 
X-CRM114-Status: GOOD (  11.02  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 23, 2023 at 07:58:16PM +0100, Christoph Muellner wrote:
> From: Christoph M=FCllner <christoph.muellner@vrull.eu>
> =

> When building the RISC-V selftests with a riscv32 compiler I ran into
> a couple of compiler warnings. While riscv32 support for these tests is
> questionable, the fixes are so trivial that it is probably best to simply
> apply them.
> =

> Note that the missing-include patch and some format string warnings
> are also relevant for riscv64.

I also posted [1] a couple days ago for the format warnings, but, as this
series also includes rv32 fixes, then we can drop [1] in favor of this.

[1] https://lore.kernel.org/all/20231122171821.130854-2-ajones@ventanamicro=
.com/

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
