Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCCECCD1BD
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 00:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmzD7oJj8ub5suy5fKy+fFmO3MVbEa4aJdh+n/h8c1E=; b=gTpLFOAI1SlIf8
	VrN/nq2FB0AHXtlMb9T3JKutmBNEIaXyIZAIsHl3VNLPNbYBXjpShmJl1xqhLKdLLHytv35IKc4z7
	U+9JVcR4+JVVqxGw1UqUak8LcJjaWorDTp3AZ42RF6MDtF4YgqVJG7abS7iZTsJECM6ad8PrCU+vy
	Z+T70LA+QqUuQIRRqNj11bGn4k2OtDJUplNiku4w8F6xtUGTdOBZ9xCQ8Zhq+h1EdQGUBOjsDmEAM
	rxO9qiorpEtd6v1HmWfFQ6NdHFi8y5X17Nc70d9g6rjiOrHQoRcU4Ea2Qhch9mn/B6jE82lpt1f+A
	NGOrig++GFwlsBX3xk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBN20-0000000154j-0XGE;
	Wed, 22 Oct 2025 00:48:48 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBN1x-00000001544-47WD
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 00:48:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7810289cd4bso5968722b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 17:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761094125; x=1761698925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WpwLRNrV83QpBzzvqKFmuh/MORhamr8seHZpCFbDI/k=;
        b=bLgr7qJGnbumOrxgeSIAWTVtR92iC3TGAxSjPb1P6n8xc693de+7oVr2Y41as0KvH1
         rASdpAu6ayuIGSg2A74BUKDik0A880Aga+ap98uC/7k+n3NuePH9GGkVjwmMX5ytYMaH
         BahskO9VyJKy6zEdj3N+aMuK9bzVDhVPjbQp82yycuF+scS6O8YJu0V/gStOe1mpRk/S
         WsgvjPAHzoElE1B/jAgf+ESvzDeBcpHEZMnbj6V/bDwNQIJv5BHsgd5W8TfGZ2XuxdGM
         xpmQqFouOu0UAaJxNyMxoFBlrr2GrrPhFMctAptX5DqlVKkOilKrd+s5ROSr1B9vmI4r
         IYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761094125; x=1761698925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpwLRNrV83QpBzzvqKFmuh/MORhamr8seHZpCFbDI/k=;
        b=iSCy0waGc04WGwcaJayA1IaUzk/CqtKkDRVy3frC+Cjts9pMiQBbFyN8JLotYcc0J2
         uxOVIa5YjTZb+wMQYP9SeptTBv7hBUA6FAokQzUz8XMH7Rn3mXL+YCBJ6Hd/CT8+ab6M
         jmqf4Y344PRn2GkQHnKdvUBrPjOI1lgIG+LPTz09D3wtBe4dwE2o/jmMWBLjT7zC2hsh
         Kr3HHn6EXp/B6c3Bq+nMdzYvRqUvsGpcIX7Lh+NPxmFoN0koQ2u7bQLtatnFcFZcuT6e
         ydnDO11LJ7DOB2VPg1bEmtmwYNr+p2Cp9/AELfLu1JYam6/h3vnjcAs5odV8PCl6LIhy
         lY3w==
X-Gm-Message-State: AOJu0Yw85ovvXyq1zXfffer5DSGu/NyJcUI09v9xAFELI0LPvTX7b5yR
	wu23xteAfZHkFfp7/jNhdrgg6LboiC81Y/QFmRpk9sFjbs6V97bijLmX
X-Gm-Gg: ASbGncu1pSUnQXEwd3ZljgwrJuP5ZZidSgVT1fauqpl0lE753sJqPLzUyk10vwUS55Z
	GgnhPw+Isy+zQlDyy5ti0dYt6S+1qkgESAhpd7XqjSxr6LQt424TPT2s/AhsbaBxm5yz4fWGnBN
	JR/oPuuMfWeY7RhvvgwYbk4EBUsmolpOOtHYikm5xTRfikv6+WUsENDXP+8KsgESqPL173//Re5
	HZErVKaE3H0rggLJfor2wvCIeWoeV1FoM0y8AKtr4Bh9YgyApTbjy43sQ4gUASGd5WvkAD6zpTK
	07G2gu0zCS93ksUQkY+S/rCmlvDQEVzzYBgcVBgB+zMXh/RCPsJAK12Ahnlueq5x7wUEI1Ux7i7
	Lofsfxot5aebfvl/RPzR7IDKb1LVXvxP2YMIW8ae9zJl88cFAyDcQP4Aenm01FaW6mG51OE8XqX
	k=
X-Google-Smtp-Source: AGHT+IF24ChetCW9CoKabWAzNvhbTnSK3MzmoX44gomg+ux4PGDg+A4t+y/Pa4mmCa5vznWef7GAIQ==
X-Received: by 2002:a05:6a20:958f:b0:334:8335:9d87 with SMTP id adf61e73a8af0-334a856e41amr26332793637.19.1761094124970;
        Tue, 21 Oct 2025 17:48:44 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b69e68sm11229683a12.36.2025.10.21.17.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 17:48:44 -0700 (PDT)
Date: Wed, 22 Oct 2025 08:47:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 0/2] riscv: tests: Make RISCV_KPROBES_KUNIT tristate
Message-ID: <umhjzrkzfe75mbtjeo7bsbziprvxicxrionbmumynhqrtut6hf@wt7hwbhi6cac>
References: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_174846_024431_5D726DE2 
X-CRM114-Status: GOOD (  13.16  )
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
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 20, 2025 at 08:23:54PM +0800, Vivian Wang wrote:
> Fix an allmodconfig warning on v6.18-rc1:
> 
>     WARNING: 3 bad relocations
>     ffffffff81e24118 R_RISCV_64        kunit_unary_assert_format
>     ffffffff81e24a60 R_RISCV_64        kunit_binary_assert_format
>     ffffffff81e269d0 R_RISCV_JUMP_SLOT  __kunit_do_failed_assertion
> 
> While we're at it, rename the test to remove the word "test", in order
> to conform to the style guide.
> 
> ---
> Vivian Wang (2):
>       riscv: tests: Rename kprobes_test_riscv to kprobes_riscv
>       riscv: tests: Make RISCV_KPROBES_KUNIT tristate
> 
>  arch/riscv/kernel/tests/Kconfig.debug          | 2 +-
>  arch/riscv/kernel/tests/kprobes/Makefile       | 4 +++-
>  arch/riscv/kernel/tests/kprobes/test-kprobes.c | 5 ++++-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> ---
> base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
> change-id: 20251020-riscv-kunit-kconfig-fix-6-18-01fc6eba6613
> 
> Best regards,
> -- 
> Vivian "dramforever" Wang
> 

Tested with allmodconfig

Tested-by: Inochi Amaoto <inochiama@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
