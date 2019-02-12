Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3D0C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 23:15:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5725521B1A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 23:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uj1HNhUb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UFKFZ3TF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5725521B1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jCwU4Jtlg20P6v6YtDFtVMY7hd+HNboLEH7/LUI2JiE=; b=uj1HNhUbhSwwokv3GevI/EcjF
	DKfAEGNrpWbsc9WUjhHmdkGJ33mj+YNS/Za9QN5EVlR2RaUc2WUjNEYqT7RiNDnMqzHIDYS8nSgbL
	6KqiL7YZWCVmKRV+3NrgW7+a1jUgQDzJ3glwuaN8B9TSpscHhPHtsAmf4uHfUub6UigS9tqjMRGFh
	1XFeVGRu6w2XGIyqxaHXPol8+Nse1SSSrdD/6hKUsVD/rFtm/Nde1KHFA9owAlqzopoNgw8pdRyuG
	XPFcwYj/Anv2aJojbgqvyy7BmxHVFPJFjx4f0RO+OU8NZqRXC9xHLrbhJKAPzZG94ODFBRawsgXf5
	f5hI0jcgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gthH8-0007KR-2M; Tue, 12 Feb 2019 23:15:38 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gthH5-0007K0-DU
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 23:15:37 +0000
Received: by mail-pg1-x542.google.com with SMTP id r124so197858pgr.3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 15:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7eBFs2jG1q/fDxjb93hzAefYGEF97+oyRaVopG3hxRY=;
 b=UFKFZ3TFQ7mdH7hnczOfaUV8LmEVo8xlYKqiKZp8zmPjxDkcuWjKW4RhQTgnBIvsSy
 9T6QYFWyX7s9nJQ7Y0T+3NBKwAkieNOtwHq+7L2k0KUhyAdueXA6dagHOwQ9zNAMzWcc
 id5pHoDOSRL5qNOwmfCpPmAvSftm57cY12IgR0gxnvjeUZxbVvdCP5VblEsRJdjRpB+F
 W2ery4H1vPNFEO6UFDqoy0NIzqpRtUmf97th1Qb+a7gVexa2jqKbhf/6+3ACNAN4qnBj
 /DAd2qQkaRy7MH4HmC1ELYUVN3rQE0r3JEqi0wWpSbaQw1dWdbyMZ2HN49wygVP4gVDo
 dMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7eBFs2jG1q/fDxjb93hzAefYGEF97+oyRaVopG3hxRY=;
 b=D4lAhyT9ZA6BfjPgbIBxvDyse9/pg0/6KJf+HtpilEa3G8qoM6VMXk8b7hAu7/L/ZH
 d8TvP8+HtIkoDmI/NB+V77rS766iOk7vp4P3eXnFNtlN3WqBgQwd2W8kpSXlm5GkrX/T
 VFEYI8ZXWHNyiuKI2eIjRXaCK7UXSKZ/lrKOkKUGd5awGuwSAqReiw5egk0N1EsO5V56
 EZOwjXUPoFbCa15nh7JI/rg3Pumo4coHE6w8pxNimQ37AgxkQDkWL3kDGIN/RdevZwUj
 /cuyHe0bKe1J7zWtBqMk6gT5kFkf2xJc5DKY9rcZAF4fIYcQxbcNkvWzywVBDU9lqMqY
 Z0OA==
X-Gm-Message-State: AHQUAubQJZmOlxSL+Wxu9tSXwz/omoTFkRpbgy8a0Fsgp1nEbLOcGDXR
 Q/1tDJOUQMdCiIGQkeAQucWm7Q==
X-Google-Smtp-Source: AHgI3IZ2WHnMhSklrjvS477A6+KUcHXhLrQlWDibtfRCJ6Z4Jnig9/4tq07FZK5LHNeN06SkNYw8ug==
X-Received: by 2002:a63:df50:: with SMTP id h16mr5985213pgj.421.1550013334522; 
 Tue, 12 Feb 2019 15:15:34 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 66sm2548101pfq.17.2019.02.12.15.15.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 15:15:33 -0800 (PST)
Date: Tue, 12 Feb 2019 15:15:33 -0800 (PST)
X-Google-Original-Date: Tue, 12 Feb 2019 15:15:28 PST (-0800)
Subject: Re: [PATCH v2 0/6] Fixmap support and MM cleanups
In-Reply-To: <20190119132650.9978-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-3acc6cf0-4c86-4929-a653-11e87d0c6b48@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_151535_455775_33B9CF9C 
X-CRM114-Status: GOOD (  17.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 19 Jan 2019 05:27:53 PST (-0800), Anup Patel wrote:
> This patchset does:
> 1. Moves MM related code from kernel/setup.c to mm/init.c
> 2. Implements compile-time fixed mappings
>
> Using fixed mappings available, we can now get earlyprints
> even without SBI calls. For example, we can use kernel
> parameter "earlycon=uart8250,mmio,0x10000000" to get early
> prints on QEMU virt machine without using SBI calls.
>
> The patchset is tested on QEMU virt machine. It is based on
> Linux-5.0-rc2 and can be found at riscv_fixmap_v2 branch of:
> https://github.com/avpatel/linux.git.
>
> Changes since v1:
>  - Use more characters per line in changelog of PATCH3
>  - Removed #ifndef __ASSEMBLY__ from PATCH5
>  - Use more characters per line in commets of PATCH5
>  - Added PATCH6 to implement keepinitrd kernel parameter
>
> Anup Patel (6):
>   RISC-V: Move free_initrd_mem() to kernel/setup.c
>   RISC-V: Setup init_mm before parse_early_param()
>   RISC-V: Move setup_bootmem() to mm/init.c
>   RISC-V: Move setup_vm() to mm/init.c
>   RISC-V: Implement compile-time fixed mappings
>   RISC-V: Implement keepinitrd kernel parameter
>
>  arch/riscv/Kconfig               |   3 +
>  arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
>  arch/riscv/include/asm/pgtable.h |   1 +
>  arch/riscv/kernel/setup.c        | 114 ++++++----------------------
>  arch/riscv/mm/init.c             | 124 ++++++++++++++++++++++++++++++-
>  5 files changed, 189 insertions(+), 97 deletions(-)
>  create mode 100644 arch/riscv/include/asm/fixmap.h

I'm getting some git issue when trying to merge the third patch via email

    $ mhng-pipe-show_stdout 4 | git am -s
    Applying: RISC-V: Move setup_bootmem() to mm/init.c
    error: patch failed: arch/riscv/kernel/setup.c:163
    error: arch/riscv/kernel/setup.c: patch does not apply
    Patch failed at 0001 RISC-V: Move setup_bootmem() to mm/init.c
    Use 'git am --show-current-patch' to see the failed patch
    When you have resolved this problem, run "git am --continue".
    If you prefer to skip this patch, run "git am --skip" instead.
    To restore the original branch and stop patching, run "git am --abort".

can you send a PR with a signed tag?  I'll include this as part of the next 
merge window.

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
