Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5294CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzquTFZPw1fO+gBomkrCfCpIz1WwSKU5++E9nmsEc5g=; b=YwVTV42gnWrbUj
	SBV8HSYEit1Zb6+JOgrF8FmVHuSs8XXxQNLR+3PBJbBGTLG+6JbPKz/5ekpcj8FIgKVuYh4YxPFuU
	FUPXyvffG3Owl4gxA6XQXhPjKArtNgUpcWx0fZcMlEhqi3MBdHioZPQRPFe67KWBbfWUvYJdImshc
	wYub+maJuE+hNZX++61rDpsNt9Rz0oPEPMUcjDrQg6Lif8vP9T5AS8WPqqkXkLFzaSWyMrqLotqzl
	qND2cNSmS0rRlIsJWYNweJJmRuEIr5UbmpicMk13zfy17wlFNQ9YpRUakDqD9z4Fz594omVymrmC5
	A2Cm4y/cM/1YLMf/tDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7QT-00000008k3Y-3SZy;
	Mon, 18 Aug 2025 21:29:57 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6yk-00000008geq-2Vl2
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 21:01:20 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-88432e29adcso112962139f.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 14:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755550877; x=1756155677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3nZTzF2lhsZGOWdY8YDL7P1nyHVBb5WBP5wnL3mixY4=;
        b=C5hODIKxGYC13BgTZj3Sl/FM+Q/aslwPtukZVfORu/YowL/7SsOml6KsRAtN8iB5Iq
         Hxu0CWkVK5YczCDJ7TiFAwDGG+Y3u/M0evsiZsxt87krFmRzsm+mjeQOAirMqXL7y1hq
         o/YBydUYXeZv+sS7Dxlau7vAMPTyAYV54VhS1swksvucH5z26RRorjFuYJTlYynV+1he
         fj+1IU1Ouwo7QrMiO7MSp5n1pfAVmjKa7t4R4NoLEV6DQ1wmhnnIyyyvQNfw1mKlOxri
         qhKFCQgIbsP4NitG+ohr3lzx8IRK3V7yT64loOQhkqrBZyaH5D67GZhPEdClYHKEJEPd
         d/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755550877; x=1756155677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nZTzF2lhsZGOWdY8YDL7P1nyHVBb5WBP5wnL3mixY4=;
        b=eqCUFCvx2/6GNxEAWR0yAVUUvT4UEjdQ7LbUHfVVzCDl9uXAHoIzA90wFpGxed8Bzr
         DxIkV6JlG00bWRkdwxesyxNnVGDgMLYcVuKrTNjL563Lt/yxJFDm5yFjC6GJYAuYpuuQ
         iZpjYmuZqPSMvAWeiWVgGbjt0E8atxm4CmcTdoWyuaa9Rn+RfnWBqImE38qXWB1XXqmM
         aw2Ki2K6QjNGgWZg/TVikXq9A3C8G4sFXETNwHCb09iR8THBUKOCX0TZg5qomL9oAUJH
         qq+NovxqCadbYu/Vo2mU3xBttjDfbD+gB5LNhQHI4DSySctj6KRiPS6tNAZ9jjvJmC/6
         94Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVv/k1/LirtR8gcoX4o3iHXMhHmSA6c009YcGkzqqJRBYcyfxzBYdRhG6cYhCKsOtb/K0Ia3TSAxPWvBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaA/V2B84zz7YDOV/JhSX70OkvvBNbqqSdd69ilmsWzy8zsvSx
	qgcN0x1BQ7L3h4okRyiq2bVNmzLgcUvV/xwdd3KzukW3mQB1v+HWg9egnkjJR30U6D8=
X-Gm-Gg: ASbGncvqhNlLeGjk0PrjHqghOPu73qyvAnbVSJnzxgdJZz6VK8gxfg5/c25jNWsbpOG
	/i7XgTrfirWTuCBkxBTTuFaXAABQha3ImX5WPTxHdGNKZ3e7IcroH5LRMuMoA5i68usZvE/iNch
	zjssf+Kup5ce2Ijb3uMX4ZCr69y1VAspanVylXQ72ZX64E56orT0gzr3c49a45msCzcIySBo/GJ
	GJ6FCZaiBWxxMID1X90bee0WfjUjRCFEUZNpCoFM5qTkBguf0njw4vaFU3DusqBH7yz7eHHRC+X
	rt4CK9UUzwEBOE9Jo1U/+wozIN5jfq/zrJC4bHIs2fMFxK1lhFLZBmRySzJHRb4wn9wpIg9cjaJ
	mXtY1pq/UI2aqBvecHwn92+/d
X-Google-Smtp-Source: AGHT+IFFpFqrnNZItu3L5GNLWSB269pADqOsIU+gIQEJhNsMNbkPMIMecR7fgqDGFDi8X/YtnL7Gbg==
X-Received: by 2002:a05:6602:2cd1:b0:881:87ac:24a with SMTP id ca18e2360f4ac-88467ecf75amr19364539f.7.1755550877544;
        Mon, 18 Aug 2025 14:01:17 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8843f9c47f5sm345226739f.20.2025.08.18.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 14:01:16 -0700 (PDT)
Date: Mon, 18 Aug 2025 16:01:16 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 3/3] KVM: riscv: selftests: Add missing headers for
 new testcases
Message-ID: <20250818-4672b703d0bf9518ee1d4162@orel>
References: <cover.1754308799.git.dayss1224@gmail.com>
 <cafaa0b547d4a1fc45a38753038c011ea7201d04.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cafaa0b547d4a1fc45a38753038c011ea7201d04.1754308799.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_140118_638995_28390BCF 
X-CRM114-Status: GOOD (  17.03  )
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

On Thu, Aug 07, 2025 at 10:59:30PM +0800, dayss1224@gmail.com wrote:
> From: Dong Yang <dayss1224@gmail.com>
> 
> Add missing headers to fix the build for new RISC-V KVM selftests.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Dong Yang <dayss1224@gmail.com>
> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 162f303d9..4cf5ae117 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -9,7 +9,9 @@
>  
>  #include <linux/stringify.h>
>  #include <asm/csr.h>
> +#include <asm/vdso/processor.h>

This is fine, but...

>  #include "kvm_util.h"
> +#include "ucall_common.h"

...this isn't correct. We should instead add this include line to all the
source files that need it:

access_tracking_perf_test.c
memslot_modification_stress_test.c
memslot_perf_test.c


Thanks,
drew

>  
>  #define INSN_OPCODE_MASK	0x007c
>  #define INSN_OPCODE_SHIFT	2
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
