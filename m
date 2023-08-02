Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B29C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 22:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C5F5PyhX58+rhlD4MO1ZYasLaBk+71lZGem0jLxBe5o=; b=nZRUIBhKCQ5IqNlSXylWo3KKhQ
	ZexUGegB+Cj2L+hQT6fKka3cQGxB2CoHyp3tTUD/N+Uspi3ELYCkoRAY1Yit5qYbm4MjMwUAtvOf4
	3pLI1i0Yrz5rwjX6/6nvFuSm8FKwjlphvKukuWvtUXunZTha/sW+snCNQEJUAzmPknf13OEM9CDLf
	/qP+OS8HSrvkdwnRpKYTADpZlP5RGkKiZiTDoMi1CsSzq6TrvlBeMOVM1idktitKCIIJ+m34YQYON
	O+ZyIh3tuv4nUn6CuewKy+jTsuYzL4TFdvTVo1tSTzjPNVqlolZ0TScKgnqLfv6y9lpOW4HNKxvK1
	nsAWqhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRK9G-0060kP-2y;
	Wed, 02 Aug 2023 22:16:54 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRK9E-0060iB-1W
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 22:16:53 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d10792c7582so253071276.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 15:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691014605; x=1691619405;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RUKe0tndPE8THtppbQ2T+ebrmbNyYQbFqdjBVqfHPSc=;
        b=38kWKGnIr9nG7NEImMKN/kYSbzmt49a74eU6F0kFCbveiePdOPvNcSEILmD2Jrj89V
         5s3HlMArUkW/HBVjC+BKGdl78VEbeZGDRzpzebvzFmuEnfdGuYFrCh3LXUe2ON7XsDcJ
         XDSLeSHsdI1bdoXHmvcO1jlgRNqVX9i7F64mW3dIaLVO9uUlcnnTV8K4Ciie8zUrBEma
         T3UfOaEFJQ/Gp4fnvYg3Li6J3QtmUyuB1OzkNZ28bLiFkz/bN6RFDN4Eyei9qrn/QWZT
         hpTPIOVK7oPnJ3vimIJk7oKHDviRjKFyB8E7Hn/7QR0uMlBKyc9mGCI06sxNJxlvAPN5
         ZCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691014605; x=1691619405;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUKe0tndPE8THtppbQ2T+ebrmbNyYQbFqdjBVqfHPSc=;
        b=XR/FnQF6vN/VJx/a96852uSZK8vI8RsJOEPe4HuOEzRnX2lmikijR0DZ4oXrZkWy09
         H8zJ0RJpNQp9cIzop/AlW5ywhAAGRjF4kEcE7rSpDZlkJ4cv0Qo/ijrqFOo2vtvvIf1q
         gbPd6mGnrtB0hwklGwIT8UM4PM30Zn81imvJpTWHME5P0H1XXD5fqqZiZkxLJB/CzwNi
         0l8KlCnljV6mb+JFLzWXhSiGX5nLLWH6RKZNtIQQL1ghQX6tzlD/gA3Bm/kWmMI2wAVA
         jCa9U/1O2BysgGJuEReS5do6ITr0Hj/ybaYX+HYukx5m6t0i/UVIxP0yyK3oje8Ti5uI
         mPBQ==
X-Gm-Message-State: ABy/qLb0e/xjZtG5StFfx9F7qwcaQNLa8LVCqifcD+qg8abEzy1qQ00V
	MG7y9sfMR+iBBaVTVTYlMDrhU5EjukI=
X-Google-Smtp-Source: APBJJlHy/PqtmZyQAWZYe0P365x5lyVjJbw50xRf2ugSL9QxHVv9uASQitOtxhGFeAyfSZaX2h+IOYFbSyM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:aaae:0:b0:d04:d397:352d with SMTP id
 t43-20020a25aaae000000b00d04d397352dmr130484ybi.4.1691014604767; Wed, 02 Aug
 2023 15:16:44 -0700 (PDT)
Date: Wed, 2 Aug 2023 15:16:43 -0700
In-Reply-To: <cover.1690364259.git.haibo1.xu@intel.com>
Mime-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com>
Message-ID: <ZMrVrXlvu/FJEayx@google.com>
Subject: Re: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
From: Sean Christopherson <seanjc@google.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_151652_581948_62E8171C 
X-CRM114-Status: UNSURE (   9.06  )
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

On Thu, Jul 27, 2023, Haibo Xu wrote:
> The sstc_timer selftest is used to validate Sstc timer functionality
> in a guest, which sets up periodic timer interrupts and check the
> basic interrupt status upon its receipt.
> 
> This KVM selftest was ported from aarch64 arch_timer and tested
> with Linux v6.5-rc3 on a Qemu riscv64 virt machine.
> 
> Haibo Xu (4):
>   tools: riscv: Add header file csr.h
>   KVM: riscv: selftests: Add exception handling support
>   KVM: riscv: selftests: Add guest helper to get vcpu id
>   KVM: riscv: selftests: Add sstc_timer test

FYI, patch 4 will conflict with the in-flight guest printf changes[*], as will
reworking the existing arch_timer test.  My plan is to create an immutable tag
later this week (waiting to make sure nothing explodes).  I highly recommend basing
v2 on top of that.

[*] https://lore.kernel.org/all/20230729003643.1053367-1-seanjc@google.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
