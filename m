Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF57CA1005
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 19:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jjANHIih/zJjllU05k4gLjSYX9+O9MmzX3xqLd+LDE=; b=xF4rtNDPcgpEEa
	EpLTkr6JeRgykJecr/wmn18DF5fogo4njSgNo/CZtPxLUtXVwm+Led7ulFespApuoqkPMqRme47ri
	Tc3yMrj0NF4h2a0okNjqJHhyGzvWejdqeM+6HzCukXCtAjFJeG2Cv+aN8pH7BKA+5WigBq45M/JrV
	WXlVc4SFFEplFlXnWv2/SliHGoDIfpperN6YQhzVZfgzVKBc4RlHB/u7p6gRix9eOycM1XokavoPV
	tb8HC9ByjJEPRL4wBt6lv5JTauUB+eo1imG5ZyqMuqg9uqObK1YfdWyAGKEPMZVSWvOD0HZSJSrmk
	jGaMpusILsluwl3rivYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWRA-00000001eUQ-2wLi;
	Tue, 02 Sep 2025 19:13:00 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT3M-00000000htn-3ElN
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 15:36:13 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3f2b6e0b942so23772305ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Sep 2025 08:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756827372; x=1757432172; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9s+kfAE8HRXPT1H9Bh1Vhsm3UofgSwfxkPjIm95TJo=;
        b=pUtrGGU0+KUS9bRvAUX9fkcB1L8Dco26TPcQnszlpYfNjTVekQJd3kBFmClw4AlNW6
         W5J1JECDtwkyjJikhXtHJg01Fe381GyXd0/YNeP04RWJwaHrzw0FHAdUbsbo1POiwuqq
         fUhCAtKNbE5X5VeONLoe333VGJ2nI5QEr9t5GE1Ob4LI/Twav3XXH4glA3nK3kyJdC9U
         flvs+252JN9wCPkxXwPdwithX5yt545cBiGi/108X8TP5N7tlxjMTGTcVhiH/SwPIqKB
         WXiOzaEVcnBkVto3FbKZEB7bq+aY+LA4R2kZ/DjMl4zpB1jNArnvhUk7j+QzKMEOeaKE
         4pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827372; x=1757432172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9s+kfAE8HRXPT1H9Bh1Vhsm3UofgSwfxkPjIm95TJo=;
        b=WE6fTopCyT++oYyQpGZpj41i2LF/tIl1XE/itPxZGmv1PjIfzGzjVCcHNPn1g59SpH
         +smCgq+8Xou55rLhexcSDt60uQ70jE8K/BbiwauIf4EHNvNDMPBnzziRFQDRScPcljVX
         V3JMI/viELXahfbqT1RwjMgn2W8jPrfUGC8ECdqBzqVYxsWTfFTQyOiVpMnEBoaoInnN
         aDWiL5WNe10btFG3rFFS2teL/2PmyQWfvJl+qXmcbUQDefbnbU8PPRqFnrSYW2SDa/Go
         c1t/6WKFb+l6sQbTgv0prH25XnJvNeWxKjp16An80OX15PS3zYFpvSaJcILNDWssMTm2
         WO0A==
X-Forwarded-Encrypted: i=1; AJvYcCUeCDjK5Qru+vh3kr+IBK8N8doTjKPGdLBBafVFn1h959YZiXigNAZLcs3OCHAgwicObgL6khC637Ok+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8r2/37i+7rWk2FrDdHqXOAxW94tE70l7nonytxfEqey9Oq7hG
	dwNytDlkzWYpI2knlxZc7ea+nlBc9EQbvKfXFm/mAXJnHsVotGtWG7ss3meSm9YN/CI=
X-Gm-Gg: ASbGnctpw5hSFOvp3SmHaBECJ1iEHnX5BtIdIqW0Imtnp74MOYs6vQRCpWEYxwx2Ib/
	Kls7ya8C+JfpEBL72W1kRoMXZDMSembTi6KF2xECDMfgz83Mr9VACdFQ0n7pD8M4dgM7D7b7aX7
	XM5evrScEWK0GyCjAzlkN6gFEIKXMkO5Ij1IrmdgeBK0VcTiliCxrCicKothVev0t2KXUuqoLg+
	DBdM1Nm9H0f3r7uU9WB9l1m2ZM2tDYXQOWIuTmfOiKhe20rolq6e1tib/d3yk6ox0qxKMViRfVf
	WwJO/mS8OBeAw1AbdldPrtxjqhrRwITzbbOqbBqxosOqv3DWqxC/C3UBe2GGA0r49kqJkPTU1Iu
	VgCalThgOn6TSm2xNF4hOFhZP
X-Google-Smtp-Source: AGHT+IES7nRiJ9CHZ2JkifKal6ueldn9qBf26MOJ0udQNkIKmIhptPxDm7X55cZKJRjHHzBvZ9JRfA==
X-Received: by 2002:a05:6e02:2302:b0:3f0:62bf:f23 with SMTP id e9e14a558f8ab-3f401aee1b6mr224147135ab.15.1756827371527;
        Tue, 02 Sep 2025 08:36:11 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f35cd88sm3180471173.59.2025.09.02.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:36:10 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:36:10 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] KVM: riscv: selftests: Enable supported test cases
Message-ID: <20250902-9cc0d0dad59ba680062dbbf8@orel>
References: <cover.1756710918.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1756710918.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_083612_812226_A8BBBD41 
X-CRM114-Status: GOOD (  16.26  )
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

On Mon, Sep 01, 2025 at 03:35:48PM +0800, dayss1224@gmail.com wrote:
> From: Dong Yang <dayss1224@gmail.com>
> 
> Add supported KVM test cases and fix the compilation dependencies.
> ---
> Changes in v3:
> - Reorder patches to fix build dependencies
> - Sort common supported test cases alphabetically
> - Move ucall_common.h include from common header to specific source files
> 
> Changes in v2:
> - Delete some repeat KVM test cases on riscv
> - Add missing headers to fix the build for new RISC-V KVM selftests
> 
> Dong Yang (1):
>   KVM: riscv: selftests: Add missing headers for new testcases
> 
> Quan Zhou (2):
>   KVM: riscv: selftests: Use the existing RISCV_FENCE macro in
>     `rseq-riscv.h`
>   KVM: riscv: selftests: Add common supported test cases
> 
>  tools/testing/selftests/kvm/Makefile.kvm                    | 6 ++++++
>  tools/testing/selftests/kvm/access_tracking_perf_test.c     | 1 +
>  tools/testing/selftests/kvm/include/riscv/processor.h       | 1 +
>  .../selftests/kvm/memslot_modification_stress_test.c        | 1 +
>  tools/testing/selftests/kvm/memslot_perf_test.c             | 1 +
>  tools/testing/selftests/rseq/rseq-riscv.h                   | 3 +--
>  6 files changed, 11 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1

In the future please CC previous reviewers on the entire series
(particularly when they have reviewed the entire previous series).

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
