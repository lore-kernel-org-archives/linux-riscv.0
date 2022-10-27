Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343B3ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 23:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=oUaswphrnMLyJtKgj1GybQl4nLiL6Jn19827U+4uA1U=; b=yVKldhZtYt4d5RHcNPYVBQq6NJ
	6Bt+8LyrulHX9PUM8rKSBaJU961eLT4DBHNZ6XYrB1bYb9RBELMpa+1vl5Csbxu5EyKsTDF/M2rL/
	uc0ogZ9rrXcpZAdyPZIWbfy2Qe30jVYq/v5CZarqzz9aSA2OfYZJ9vB4u80CvT0psyVfaddZpvUo8
	vV8Nq4zdkHLX5EGOcAqYeY4G62c29Tz3pq1Z2c2BhoZ2HG4kBrusUHYSDEu+7+MxEf8JR6kl1btT+
	UPgTWaHSgnXLAbscYt4NaaLxdKhPg6t57T/n9sc7n0rDgRkfQkWkrrqiM242rmZxcDnFjqC/52w+O
	s8WlzHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooBy8-00FApR-Sc; Thu, 27 Oct 2022 23:07:24 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooBy6-00FAno-JY
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 23:07:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id 78so3139263pgb.13
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 16:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gyfpmFe14VJ3jdYNVJ0rx3Ah2uaRzNTmMnT4495S4I=;
        b=ZNNSYZLMCiTx3pCpdTSLaMqTAwcT0XD23hboDkck2m1sj0K18I/wiwFIJBnxkxlMh1
         TMOX+6v0XNUWVLrMkaS7nFMD6HK3C70ZLK5411vF56AMxZrrEveIWdn7U/wWYAX6hu8f
         z7X+MhLcDZ2abQ+JkeJnFiHqWkFba2HtnVwkX4LhmKXO9kCXDrbkBH+MQc0VlITciM7I
         DQ4GGK7LnrmeObtOo33dthlXeC/HBl0rQRBuyHKeRHXZmYYPUrcsYqTcTlXIWwUSoL9i
         Op+9awjoXqXajuMDeHaLc5MvW/7/blHnT1v9JwgcyUng9A7q3UoZ9aZNVukbXbfjaCwz
         UOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gyfpmFe14VJ3jdYNVJ0rx3Ah2uaRzNTmMnT4495S4I=;
        b=6XngVXjiRNELaZ4ULimIInv6lDS+RgT9ooOW6SYoi+0o2ppFkIS9lXNca46d+/hO/W
         3WbQLxfSeS+NuNdwGTboJ9ROLV1TGdSgABELcz74koqbDD3+LsRNdkkKuyE/rj9JcUtD
         PgDTsRSt/vKZqmg5zv9O21TYSlB7PukVHLjKmrS9+hdHKCklkugZ4RTjxdtT1gZPSC+f
         gOlAoqvHroCjEAXADq7ItLll2LB7ojnCO+rGtzMQ0joCCmReFy/UBZ5NmqBkUfbdUpiM
         HazFDXroU1K8pI/N80NYSuP45k1ir49SiOMalr1S22RsROI5Ov+GzdFnSF/D1ljD0+Z+
         p0RQ==
X-Gm-Message-State: ACrzQf3or8OwoXReF4Mfq7Z3LL4DoIqALdAnbf6EvJ5iuNmGzxrsJLuQ
	ZvFRKKeS+B1zY/driTP9h2Bv1Q==
X-Google-Smtp-Source: AMsMyM48cCCOaGHpcUrqKPuvLPqi8N0s0YHUDIkD3gXkNLjihHit7dpsoFkfZbjAvACH4Z61kt9rCg==
X-Received: by 2002:a65:44c1:0:b0:428:ab8f:62dd with SMTP id g1-20020a6544c1000000b00428ab8f62ddmr44319504pgs.211.1666912040505;
        Thu, 27 Oct 2022 16:07:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b00186e8526790sm1675818plb.127.2022.10.27.16.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:07:18 -0700 (PDT)
Date: Thu, 27 Oct 2022 16:07:18 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Oct 2022 15:22:27 PDT (-0700)
Subject: Re: [PATCH v3 0/2] Fix /proc/cpuinfo cpumask warning
In-Reply-To: <20221014155845.1986223-1-ajones@ventanamicro.com>
CC: x86@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
  yury.norov@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
  openrisc@lists.librecores.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, hca@linux.ibm.com,
  gor@linux.ibm.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-b3bcbdea-1572-44ba-9d9a-e35e55b8880f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_160722_664912_B8053542 
X-CRM114-Status: GOOD (  23.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Oct 2022 08:58:43 PDT (-0700), ajones@ventanamicro.com wrote:
> Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> start and next seq operations implement a pattern like
>
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }
>
> which will issue the warning when reading /proc/cpuinfo.
>
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
>
> This series address the issue for x86 and riscv, but from a quick
> grep of cpuinfo seq operations, I think at least openrisc, powerpc,
> and s390 also need an equivalent patch. While the test is simple (see
> next paragraph) I'm not equipped to test on each architecture.
>
> To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to
> a shell, do 'cat /proc/cpuinfo', and look for a kernel warning.
>
> While the patches are being posted together in a series since they're
> for two different architectures they don't necessarily need to go
> through the same tree.
>
> v3:
>   - Change condition from >= to == in order to still get a warning
>     for > as that's unexpected. [Yury]
>   - Picked up tags on the riscv patch
>
> v2:
>   - Added all the information I should have in the first place
>     to the commit message [Boris]
>   - Changed style of fix [Boris]
>
> Andrew Jones (2):
>   RISC-V: Fix /proc/cpuinfo cpumask warning

I just took the RISC-V fix, might be worth re-sending the x86 one alone 
as nobody's replied over there so it may be lost.

Thanks!

>   x86: Fix /proc/cpuinfo cpumask warning
>
>  arch/riscv/kernel/cpu.c    | 3 +++
>  arch/x86/kernel/cpu/proc.c | 3 +++
>  2 files changed, 6 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
