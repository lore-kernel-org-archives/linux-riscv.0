Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF4FC7619A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLxVUxfbnIMKWionTFBTMRM+spcAn9rMQpJsDGdCA3c=; b=j5HT0pzoC0qKux
	72AL8FMyOK63Dh4OElGmkoen7aB2YPUcU8lSGLG+QzXXeZELa+s16Ca/dz3aWVG8UiAQDYN0CQcvf
	eo9RMFCca6q3ZKwGcNJhHJJbobhxDgNDuLf0AzENEK1D5WJbxlROfTJ3k3EmgRAinACKyfSgirqQA
	BCtIN/JnyxnNAy4lfOp/+pkX19kX6GQQHvH+Gqmgod+5fV9nPZ2jCGo1RO/gYtfHvFIHuG3nYt2xl
	geGVtxAeCly1/ed3YmKe1weeDb8OnnGMzwk29rcPSaASyJcQhJ4KyxGOUgtG76kXGQPJ+YAWWaPSQ
	EBdUVd65+2b1JfOTGCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzQH-0054xq-2P;
	Thu, 30 Mar 2023 21:03:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzQC-0054uw-0m
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 21:03:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so21128764pjl.4
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680210177;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/xsTJDZlQeJOjmK2KOoGoYyGsO3o/mIzwXJZJba2dQ=;
        b=JnrYslCBdaBmWFrna8dF7+I4WqGxOyf1SdneNgW+b/qZFufmf5ZQCa0Y6BG+iYP76c
         HRTmL4LAemn5IosIpP833RVUcqQc2cOrvgS1s6WhlUCk7U73yRTQcaSHm7SDLmtQvQed
         zG2xpg+eD0/A887w+kdvbPsNJs1JCtKdd9dfGETiQRkpHLCieKgoQccyXKvo9wxRBfBM
         /W1J2VzYUccdg4s/JgajcqJ4/qrWUFrYgI7jahcjsvrbdB3lD0c7krw+PVpxk8qtSfB+
         WWHv/fU6I17C4IzxKnCEKZmB0Obj6AWc8dYOLrKJRd4P9+JTlo1ZM0F9il7uDJm2jBI3
         JE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210177;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/xsTJDZlQeJOjmK2KOoGoYyGsO3o/mIzwXJZJba2dQ=;
        b=uMnrszQs4zkOCxTM+Tqhss6jAWrwrBVUYggtHU0LBNgMNqIBWysm68vkMtH6GJlyu2
         i5AFMPJMgNDEiRLSO3T9rib5BApOEvN1m03EmL9fTt7WQTcwfproxubd1jONvXMV4ViN
         lB5xjMn1EjOtsKC4MGLRGlyddYDrGkhsd0cy/omh0+86a8t2Npar7RvUzCEvVeDIp+7/
         hTVKYoY0MPciz85A5gq4+FWP5sGYvhUrjlHUvAqODVPw73FNmM3ANQBOe/0bxavF1Xhu
         x/c4d/uf02GzN7GT3Ra4CmtB9ACILvr+1DO70vV1e9hh3O17v3jnOq7FieehkEdLp2ab
         /l9g==
X-Gm-Message-State: AO0yUKWBEhZGnMLekrHPmGJXdUy8lWxgCCHQo6OCxgdxRMTA2TXPyQvn
	l9hxkQQYcyXYt2SuAcx0KKlIhQ==
X-Google-Smtp-Source: AK7set8Tu5xQiv2POaFwMPQARW9IYLHTrFmIgYV0fJYXtvJptVdt71Q4oVmfS4TbYWoY9B6XBctZow==
X-Received: by 2002:a05:6a20:3a9c:b0:d9:77f7:d62e with SMTP id d28-20020a056a203a9c00b000d977f7d62emr19771027pzh.36.1680210176765;
        Thu, 30 Mar 2023 14:02:56 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00627df85cd72sm272683pfn.199.2023.03.30.14.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:02:55 -0700 (PDT)
In-Reply-To: <20230324100538.3514663-1-conor.dooley@microchip.com>
References: <20230324100538.3514663-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v1 0/2] RISC-V: Fixes for
 riscv_has_extension[un]likely()'s alternative dependency
Message-Id: <168021016598.24378.3655010932034321812.b4-ty@rivosinc.com>
Date: Thu, 30 Mar 2023 14:02:45 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>,
  Jisheng Zhang <jszhang@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_140300_276632_1EFA04CF 
X-CRM114-Status: GOOD (  11.44  )
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


On Fri, 24 Mar 2023 10:05:37 +0000, Conor Dooley wrote:
> Here's my attempt at fixing both the use of an FPU on XIP kernels and
> the issue that Jason ran into where CONFIG_FPU, which needs the
> alternatives frame work for has_fpu() checks, could be enabled without
> the alternatives actually being present.
> 
> For the former, a "slow" fallback that does not use alternatives is
> added to riscv_has_extension_[un]likely() that can be used with XIP.
> Obviously, we want to make use of Jisheng's alternatives based approach
> where possible, so any users of riscv_has_extension_[un]likely() will
> want to make sure that they select RISCV_ALTERNATIVE.
> If they don't however, they'll hit the fallback path which (should,
> sparing a silly mistake from me!) behave in the same way, thus
> succeeding silently. Sounds like a
> 
> [...]

Applied, thanks!

[1/2] RISC-V: add non-alternative fallback for riscv_has_extension_[un]likely()
      https://git.kernel.org/palmer/c/1aa866931b80
[2/2] RISC-V: always select RISCV_ALTERNATIVE for non-xip kernels
      https://git.kernel.org/palmer/c/1ee7fc3f4d0a

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
