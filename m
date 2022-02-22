Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4592C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8bBE/rgSBfw++rxhLd7E8lzoVGdoLhLwplif4enmNMo=; b=01qJoXcKLOpsU+Jg4K8+BJxoRO
	Fa48vu3qgApCyDi7x/drGQU7/fISix/B+NHwsaOvHnplv2Nv+cGbSNyJDBF93JDyOaeXTzu45jvFW
	zeDMpS++VEL3EaBH1GzWmMS24NGlA33D4e+1z2EG1KPfUjL8nIZyLtDBe/8UNC7Ww+l+XXMEUAQuv
	qlTYD8b6y4d9gRi3vwTgD+AWPFOqyLe5Z+lYwElbxDeX9rvJCQ1m7vmCxpi+y/Bj/E+652Q1Ly6oS
	AsjuoODnSIAhWbfLoQ5uuv8GUJehIzN4Mo3GjoPLrJpjXHf8Ut4+eb2EBEudsUkHzLNUoIzWQiM1r
	HDvlhxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMbmP-00BWkM-Ei; Tue, 22 Feb 2022 20:29:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMbmM-00BWjV-Fe
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 20:29:00 +0000
Received: by mail-pf1-x42c.google.com with SMTP id l19so13255985pfu.2
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 12:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=S0s4NTBhGEDU2wNKdQUNU51P9r2dH1Hmah30uO9NUzc=;
 b=ujReHU9piksoG2nTgb5h4zQzbHZyypJboRqWDW5rDxlH9/wWCVdBd4GRAHAYGYbinV
 /k8Od/c8z8IxIGLT3BZbnPDzIHspBsb92GI/BZEm4zG7WzatMQR8s3VYZfAmTv+SBAkB
 SDcOoDHJSEgAK/19uCWGBmZX8sbXhbQlQvryRgKwwp14AYXPYTpOF1fiHezJleIRDVr5
 JifoXWqVpqiIob6NZ9CRs2pWfT67MAJPkYaF6Io5Kan1xV2TlkG58jCD/uoz3SPiVfMl
 szCDMNEiEutqK4ocrNRMvrl2YYZzt6kzbyVj7Dca+2Qmbb99pH1+UoVBiX0tWyQNlM5j
 MuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=S0s4NTBhGEDU2wNKdQUNU51P9r2dH1Hmah30uO9NUzc=;
 b=yopcOsRk+DAL+kwm9e2SiIcBhMRHNOpNLU+F7RJXwcRCtMvXdWhKnFrIKmDwK1qYnR
 ndGGyFi4MnD/59LCLqZRZOwh3U/9CffSqvr4DVfxdPPuq6/9v6D+yNcS8YXUbyCKsDVj
 DZNSv+4HSWvLViEN1oLgoMgKKcTujA3o2H4kI/pjLv8xgBc+hJlSvYwCRU3e2KIHmuQJ
 rv/KWOSCYJHBeKqkWVRM08nri5qZC4BnVmQCIyMJbWKJY4GjPFpknHRT9J7Aj7fOHJNV
 TWT9gs3t0kKtgDY/RRzX96+02qxIet0d2QqI86ItPLN89KVao9JzTyy0zNIebyZXjZ5p
 1rxg==
X-Gm-Message-State: AOAM532ITLU+dXgw+VRADv8EVKVhSxxYrVuhCJ0OkYCi1YKfcEOov6g1
 CJ+K+AJ0FuF3hG2jI0Y/gq5N0w==
X-Google-Smtp-Source: ABdhPJzM0GFvpGZTF/kVUFUQ4VXFG100iRZ9qET6Tz5igdIEO9+6WlP6TRimQst2DZB9SYc48c7xGw==
X-Received: by 2002:a63:e953:0:b0:366:15f5:d6ec with SMTP id
 q19-20020a63e953000000b0036615f5d6ecmr20899963pgj.338.1645561737704; 
 Tue, 22 Feb 2022 12:28:57 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id z6sm17044422pfh.77.2022.02.22.12.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:28:56 -0800 (PST)
Date: Tue, 22 Feb 2022 12:28:56 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 12:27:56 PST (-0800)
Subject: Re: [PATCH v2 0/4] Add Sv57 page table support
In-Reply-To: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn,
 panqinglin2020@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: panqinglin2020@iscas.ac.cn
Message-ID: <mhng-091604b6-82da-4d91-a5f8-58abd7cdb5ff@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_122858_612989_DF25DDC3 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, 26 Jan 2022 18:48:40 PST (-0800), panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>
> This implements Sv57 support at runtime. The kernel will try to boot with
> 5-level page table firstly , and will fallback to 4-level if the HW does
> not support it. And it will finally fallback to 3-level if the HW alse does
> not support sv48.
>
> Tested on:
>  - qemu rv64
>  - qemu rv64 with CONFIG_KASAN and CONFIG_KASAN_VMALLOC on.
>  - qemu rv32
>  - sifive unmatched with CONFIG_KASAN and CONFIG_KASAN_VMALLOC on.
>
> Changes in v2:
>   - Fix KASAN for sv57, thanks to Alex
>
> Qinglin Pan (4):
>   riscv: mm: Control p4d's folding by pgtable_l5_enabled
>   riscv: mm: Prepare pt_ops helper functions for sv57
>   riscv: mm: Set sv57 on defaultly
>   riscv: mm: Support kasan for sv57
>
>  arch/riscv/Kconfig                  |   4 +-
>  arch/riscv/include/asm/csr.h        |   1 +
>  arch/riscv/include/asm/fixmap.h     |   1 +
>  arch/riscv/include/asm/page.h       |   1 +
>  arch/riscv/include/asm/pgalloc.h    |  49 ++++++++
>  arch/riscv/include/asm/pgtable-64.h | 106 +++++++++++++++++-
>  arch/riscv/include/asm/pgtable.h    |   6 +-
>  arch/riscv/kernel/cpu.c             |   4 +-
>  arch/riscv/mm/init.c                | 166 ++++++++++++++++++++++++----
>  arch/riscv/mm/kasan_init.c          | 155 +++++++++++++++++++++++---
>  10 files changed, 451 insertions(+), 42 deletions(-)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
