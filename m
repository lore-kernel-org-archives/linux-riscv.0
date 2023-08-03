Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93845C04FDF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abI4Q7LIkVUlKLgtYYFG2klslj1k1Y87xI0xq7Kfcdw=; b=M2x0a757OWYezt
	mo54ru02npOu0exLlS3T5jvkWmv2jUbLMkzj/ZYpBWJEvUC9263v4UShpiqGsNHzOPsI690ZZn/Kg
	cBiD7x+ptm6O5MxeW2L/JjU8WHm+CWCU9B41ZnSCZ7pRkgVzrgETGsfTgI+QIbq1umi7dpT0e3J1m
	/mfYoCSmM3H/KXP/yPnF8jSjanWBr1buYvsvXopFdTP/Zy9y6Nne7sEqUW2Knyia7Pwpo6ssji01T
	KlhkmMyC3gHRqmvxc638qEEa9W6y0hJ4z6c9+Z6FC2ycPt6fD+0gl61f8shAXGsI3TTKTU7MZcwIr
	ZikoluGMadvW3lsmvCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1a-00A6dp-0f;
	Thu, 03 Aug 2023 15:14:02 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1R-00A6SZ-2C
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:13:57 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3a6f87b2993so811667b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691075630; x=1691680430;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSK2FUGY1przyTtVFiZaUHO9KuKYI8oQjaSBCONicVY=;
        b=FgI6HJuCLmlIIfhgwxl2HYhgvvEO0gMnbnbo5JcS1tXxFRRW3EO9yVG41ccq44RWRy
         1x/q83ecGHJhoaaZU93W3GpWnoOM0h5hMYD0SD75A5flKg+3Ho7RFEtkK9ZQoqwfOl0A
         +cVLthsaYH5icLAo+tZX+lUq/wgFJK9YcCYjkaqnipVDrI++onoa5b+LZoJJ4L1Jr30I
         GloMos7v8AstvMeOEs2u3/1cX6hnqKM2g9RMJWofn+YyPYEtIvYojTzRZgHZJr/cBuIf
         LAKzWa0iNzLT7Gx6ZIcVX5IIzKdH9zS1KVKF/EICY+rOGY+4+pvj1r+e3UJCyX4CNYIP
         bVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691075630; x=1691680430;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSK2FUGY1przyTtVFiZaUHO9KuKYI8oQjaSBCONicVY=;
        b=M6atDcMAGwBK5z+EASU0ap7CPXZ4d7IxzzN6lL90KAw3NlpaLrPGqUXOS6VaeN/4qj
         GSDVsGE7S969PMgh+yPUYVb1Ti2QuDhxBO6L1GJ1cUv8yYiqkri2P8IOUqPAsZ1JrAhY
         UisO2QURSgzbVM/dkiAbSuaWoIG9qxRt0LR37fJn78hbpJbTUvToa8PmUa7UyH1XMasR
         9Vil466eZO1YxeC/qMTc4B2rbmyBZYCykZzTWJkUQGVcKDP5Hpms9cKF+cMxpUvR3nMf
         19Q5LFVuKHW05N/qDvK+QHo94rnvttpDya9mDOLg386qV56lPehpvkFgaYT0H3R1blFl
         S2Yg==
X-Gm-Message-State: ABy/qLZzs9K1rSCwx9Mzk+IQdehod2KvRfOQkvYcWZwDNgxI3Jc7zsS+
	fCID+aiq6acrHwCodF/8RvQJNQ==
X-Google-Smtp-Source: APBJJlFVMdy6DDLkJxkMERnwGOiIBPbaX/0bBxceQP9420eI2mZRj6I9+lP/P1kOoB9353xoGfyMGA==
X-Received: by 2002:a05:6358:98a2:b0:134:c279:c829 with SMTP id q34-20020a05635898a200b00134c279c829mr10617038rwa.18.1691075629869;
        Thu, 03 Aug 2023 08:13:49 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id p27-20020a63951b000000b00563590be25esm1798pgd.29.2023.08.03.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 08:13:49 -0700 (PDT)
In-Reply-To: <20230712193514.740033-1-jhubbard@nvidia.com>
References: <20230712193514.740033-1-jhubbard@nvidia.com>
Subject: Re: [PATCH] selftests/riscv: fix potential build failure during
 the "emit_tests" step
Message-Id: <169107392499.27633.6579477595845776477.b4-ty@rivosinc.com>
Date: Thu, 03 Aug 2023 07:45:24 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
  Anders Roxell <anders.roxell@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andy.chiu@sifive.com>,
  Evan Green <evan@rivosinc.com>, Hugh Dickins <hughd@google.com>,
  Muhammad Usama Anjum <usama.anjum@collabora.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  Qinglin Pan <panqinglin2020@iscas.ac.cn>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Andrew Morton <akpm@linux-foundation.org>, John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081353_736246_CC535E21 
X-CRM114-Status: UNSURE (   9.31  )
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


On Wed, 12 Jul 2023 12:35:14 -0700, John Hubbard wrote:
> The riscv selftests (which were modeled after the arm64 selftests) are
> improperly declaring the "emit_tests" target to depend upon the "all"
> target. This approach, when combined with commit 9fc96c7c19df
> ("selftests: error out if kernel header files are not yet built"), has
> caused build failures [1] on arm64, and is likely to cause similar
> failures for riscv.
> 
> [...]

Applied, thanks!

[1/1] selftests/riscv: fix potential build failure during the "emit_tests" step
      https://git.kernel.org/palmer/c/8c82d2bf5944

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
