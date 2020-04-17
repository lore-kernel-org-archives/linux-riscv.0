Return-Path: <SRS0=37zL=6B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBB0C2D0EF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2020 12:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 933072064A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2020 12:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rw6f/Egd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="lW7Cq00O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 933072064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h5uGvUBBK13xiGM08N0Ar0f5rTAFRwfmSByaivnK03A=; b=Rw6f/EgdUYiq4xuAysBrXSfyD
	rEQZymf9sF+lAmsEjK/h0RKNWw+Tx3rSj4rxMVSC+X+sRtK3M8ekQOFMDcI8qGkakLl1D4NkuFidw
	XJmYJGSef0MgEFG7PRhWiJ6RfOjRpk8AST5ez0XFDFFSPtk2bs3baemg/zAbYwV8zIoGKX+RJ0onW
	okgSr3J0a4GOD2ChSeDEqJHzqavDWJojRoH8JV+8QgGez945fR1Qe65WXg5Eu7aPPp4MAB6vr1k3F
	X8HKtbxYtxoS6vO/juFx+yej4OtWAPFUefijj4Or4eC4sIJkHeyo82YPUEjK1e4u0Z23aViJaewYn
	xkfA6i2Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPQL2-0000dK-Rc; Fri, 17 Apr 2020 12:43:20 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPQKz-0000cu-Iz
 for linux-riscv@lists.infradead.org; Fri, 17 Apr 2020 12:43:18 +0000
Received: by mail-wr1-x444.google.com with SMTP id k13so1664613wrw.7
 for <linux-riscv@lists.infradead.org>; Fri, 17 Apr 2020 05:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5uGvUBBK13xiGM08N0Ar0f5rTAFRwfmSByaivnK03A=;
 b=lW7Cq00OBPIgaU4boC2NWhBfA/bsU8/tgZ1luVaWA85xijqr+QRcCxBHtn39IQUBcj
 OFSsXpby/C0JSeaqXBR6kqmZyYcAP7kJkDsL4l1OOe3rXkTpmHNpyyCIohBUMjie/xVP
 hUuVSymNynjQw3FMf6ITpkubTII7Y1VKk3GFMUwiYmdOlE3+yjH5lJ1liHB97jqZWbyq
 tgy8/e6Z1erE56HG0eznmdLvtS8YPEh4W7lhkwR5X0PtD/aLwSJUmH7Lm5cLcTklrs6e
 NkjVNQcxZAYKWJymi5N+NlvKRJxhEuSsJ701USslsxbsiCOb6mIiNigLVlXZG7ykeeH0
 nJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5uGvUBBK13xiGM08N0Ar0f5rTAFRwfmSByaivnK03A=;
 b=DNa2IWFKiAf/ljtIoijt5flsCE4mTSM7FrW1058fiXY4dVwdboVdIj4lbnUv6IFG8U
 4EE/BrXKDgAzJsafS8t5ALalf3rSTfIqG3ox0HD9uyOdVnMJgn5TEfIPcYA9A0eH4h2S
 w0wesjqUlll4hq+b1DbKEHwPhygjhZulqp7oWE+ORLkLo2kmW0bzg/lHfCTO5ku3ZTmi
 rSKaMrIxdyuVnOsJREKXHHgXwZ8pmwtRHYSgPPNJAIU5u4F0o7ufn5g0ww8r7kC7M9Nx
 Z2ZVJLyTj0y1O4dEXOesHW6L82ZMC+ZqDMZOgswbRIC2FgM7lGD+R1dSec6CytY6VmhH
 yzDw==
X-Gm-Message-State: AGi0PuY4/vsX2sdfBQQqpabo4473h/S6qkG+BVs1cHuc/dcCJXQkYXJY
 WspQrnl9d0+T1vAKDfpQzsm7gaY5l3YDJh63UIkIvA==
X-Google-Smtp-Source: APiQypI55lXXZd9uMDkedrEdIWCNpIBCl6PYW/582+5vVyZ761iYDh5v4e2V3mqw5xp5aBwFe4wF0LpJFFnlKYHl7EI=
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr4096911wrn.0.1587127395436;
 Fri, 17 Apr 2020 05:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200417121222.156422-1-wangkefeng.wang@huawei.com>
 <20200417121222.156422-3-wangkefeng.wang@huawei.com>
In-Reply-To: <20200417121222.156422-3-wangkefeng.wang@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Apr 2020 18:13:03 +0530
Message-ID: <CAAhSdy0wQrs3-1R+ovEspmDp6aXYEpJEuv4M_cH9XSjkeo2_8Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: sbi: Fix undefined reference to sbi_shutdown
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_054317_627965_E52EC0E1 
X-CRM114-Status: GOOD (  14.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 17, 2020 at 5:40 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> There is no shutdown call in SBI v0.2, only set pm_power_off
> when RISCV_SBI_V01 enabled to fix following build error,
>
> riscv64-linux-ld: arch/riscv/kernel/sbi.o: in function `sbi_power_off':
> sbi.c:(.text+0xe): undefined reference to `sbi_shutdown
>
> Fixes: efca13989250 ("RISC-V: Introduce a new config for SBI v0.1")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/kernel/sbi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 62b10a16c8d7..f383ef5672b2 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -167,6 +167,11 @@ static int __sbi_rfence_v01(int fid, const unsigned long *hart_mask,
>
>         return result;
>  }
> +
> +static void sbi_set_power_off(void)
> +{
> +       pm_power_off = sbi_shutdown;
> +}
>  #else
>  static void __sbi_set_timer_v01(uint64_t stime_value)
>  {
> @@ -191,6 +196,8 @@ static int __sbi_rfence_v01(int fid, const unsigned long *hart_mask,
>
>         return 0;
>  }
> +
> +static void sbi_set_power_off(void) {}
>  #endif /* CONFIG_RISCV_SBI_V01 */
>
>  static void __sbi_set_timer_v02(uint64_t stime_value)
> @@ -540,16 +547,12 @@ static inline long sbi_get_firmware_version(void)
>         return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_VERSION);
>  }
>
> -static void sbi_power_off(void)
> -{
> -       sbi_shutdown();
> -}
>
>  int __init sbi_init(void)
>  {
>         int ret;
>
> -       pm_power_off = sbi_power_off;
> +       sbi_set_power_off();
>         ret = sbi_get_spec_version();
>         if (ret > 0)
>                 sbi_spec_version = ret;
> --
> 2.20.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

