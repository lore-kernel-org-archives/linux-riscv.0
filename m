Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31257C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 23:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=IplRhtRC0POdKE3qwwfft6MBo+tIC8JZTJy/pynEZGY=; b=zR1BK/jFaYNlvCai+OdX/QWSRj
	MyTfU74Oxw+V8Ee3RPNuJGsTdGOQd9HwYHEB1zeL+4r4I+WeEGN7avkvQlg8KFTRQ1sMSRUO41fuT
	i8avLLEc8zUosS+MMUn01cl/QGvueQjBY9stCR+9bZzQfNdAUKDZgfCvdMXVUgz6lcOL0iLzN9NDO
	AGWv4CIWM2HQrpKtVUzDPq1gzkuGCvBVTOUycN4B/vz4aMaxqpqvJ7XuksN5JFLHNCaw4d/7KKGZ0
	2J8E/jjwjUz3ftdYhIwIuNXoIyuUMCHzMh0Jl4NefcR0ksXZGMicOgGkqobzY8P37eiVpItAUffsv
	gZ12Vfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOoWf-00Aw9R-Cp; Thu, 18 Aug 2022 23:02:09 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOoWS-00Avw9-7u
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 23:01:57 +0000
Received: by mail-pj1-x102a.google.com with SMTP id bf22so3030201pjb.4
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 16:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=6F0tHF/oZtPKzXhD+jVdw1jFO81d1wFdaL8SH2xhFCM=;
        b=Jg7kDDyoFvyFkN8yuaa10Cba2/J5uDCEOww8js0kJq1QX6PElsft4GDFqrrnjqxVRE
         h3ADoHa/Ed8N/XNTF4NZpPFQ+qcwh3IMjfeqJ7PQIqhC4fHeVRMWxel+pyRldIgOJ7Yj
         zpJ+R2QZbkqpdzMKpqe5+BMOblTp2eeYDS53ffc/UnvhTS1L5jAhAxJfwXXVoxpD7w6w
         ZlZn1AF70HSUDoWWDAgPYZj3D56JBjTFqkid5KeHFMqNfHJ8YXkPiqaVlwe+YMWgkC1Q
         GfygesNOSmrtUO8VCPBsO6WGLvWjZo1jGnfDSWj5aM/jLL3DlHCbeJ+MfxLNKMTGVPdH
         qOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=6F0tHF/oZtPKzXhD+jVdw1jFO81d1wFdaL8SH2xhFCM=;
        b=mFqqLoX+ppczxaUscJCFy0J0P4YgaGF+lcySfoSucNFnEISZ3RaJY3wZRc1CXeOsa6
         HwxxB78+ZqFodGNX7dm+28gzAebHqi5HMjHHxCrKBhIQwhgMFTaA4n7VfEiTvqKeJoKI
         CYYTXSY+3V1kxluQwAExX1rhHFUJhOGvLKxiRjxWEfvdd67YXjEvFXFboDtF+R+CC9gn
         dyAdImy2geH1Yk4jCAYwD8AOXfQ0JoaihoLoxXXJy+Hb7UBkmHPT8kjqCM4TTyLiP+b5
         7s+Tp2+ngttwkguYImv57S5nVvYe1yMoTWYVBtW/quaroHrUu7v27uaB5WZJ6+3U+Bga
         pK4g==
X-Gm-Message-State: ACgBeo2CAWmUKe8VdrmRuc4R1gkFL4322nILUejNvchwlnimP1fUmCUt
	fJQOfqONF2lau6ylukF2NOQkUQ==
X-Google-Smtp-Source: AA6agR7yRAXYc2k60DD4yr8Vnn8n7IcSqqHcY55G5LMynuepnj72MKFv/FbeFlyJNG46nWrGIgDgPA==
X-Received: by 2002:a17:902:e80d:b0:16e:f7bf:34a7 with SMTP id u13-20020a170902e80d00b0016ef7bf34a7mr4519987plg.112.1660863712125;
        Thu, 18 Aug 2022 16:01:52 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id pw15-20020a17090b278f00b001efa332d365sm1987115pjb.33.2022.08.18.16.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 16:01:51 -0700 (PDT)
Date: Thu, 18 Aug 2022 16:01:51 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Aug 2022 16:01:45 PDT (-0700)
Subject: Re: [PATCH 0/4] misc warning cleanup in arch/risc-v
In-Reply-To: <20220814141237.493457-1-mail@conchuod.ie>
CC: anup@brainfault.org, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, conor.dooley@microchip.com, guoren@kernel.org,
  vincent.chen@sifive.com, xianting.tian@linux.alibaba.com, heiko@sntech.de, wangkefeng.wang@huawei.com,
  tongtiangen@huawei.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mail@conchuod.ie
Message-ID: <mhng-49e49c17-7241-45f8-bea3-17188bd1d0fa@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_160156_316769_FF84F392 
X-CRM114-Status: GOOD (  23.95  )
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

On Sun, 14 Aug 2022 07:12:34 PDT (-0700), mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Hey all,
> Couple fixes here for most of what's left of the {sparse,} warnings in
> arch/riscv that are still in need of patches. Ben has sent patches
> for the VDSO issue already (although they seem to need rework).
>
> VDSO aside, With this patchset applied, we are left with:
> - cpuinfo_ops missing prototype: this likely needs to go into an
>   asm-generic header & I'll send a separate patch for that.
> - Complaints about an error in mm/init.c:
>   "error inarch/riscv/mm/init.c:819:2: error: "setup_vm() is <trunc>
>   I think this can be ignored.
> - 600+ -Woverride-init warnings for syscall table setup where
>   overriding seems to be the whole point of the macro.
> - Warnings about imported kvm core code.
> - Flexible array member warnings that look like common KVM code
>   patterns
> - An unexpected unlock in kvm_riscv_check_vcpu_requests that was added
>   intentionally:
>   https://lore.kernel.org/all/20220710151105.687193-1-apatel@ventanamicro.com/
>   Is it worth looking into whether that's a false positive or not?
>
> Thanks,
> Conor.
>
> Conor Dooley (4):
>   riscv: kvm: vcpu_timer: fix unused variable warnings
>   riscv: kvm: move extern sbi_ext declarations to a header
>   riscv: signal: fix missing prototype warning
>   riscv: traps: add missing prototype
>
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
>  arch/riscv/include/asm/signal.h       | 12 ++++++++++++
>  arch/riscv/include/asm/thread_info.h  |  2 ++
>  arch/riscv/kernel/signal.c            |  1 +
>  arch/riscv/kernel/traps.c             |  3 ++-
>  arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
>  arch/riscv/kvm/vcpu_timer.c           |  4 ----
>  7 files changed, 30 insertions(+), 16 deletions(-)
>  create mode 100644 arch/riscv/include/asm/signal.h

These generally look good to me.  Anup handles the KVM bits so I'll let 
him chime in there, but

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

on all of them.

Happy to do some sort of shared tag thing, but it looks like these are 
all independent enough that it'd be easier to just split them up.  I've 
put the non-KVM bits over at palmer/riscv-variable_fixes_without_kvm, if 
you guys are all OK splitting this up then I'll go take those onto 
riscv/fixes.  I'll wait a bit for folks to get a chance to look, so it 
won't be for tomorrow morning.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
