Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A77C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jan 2023 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLFv4O1Ca/SWjs+cgQTruJ8KfA8cVcJWcLXg1EpKpnU=; b=Hp5YpW+bsC7R3P
	KrnzAB64lTRUqZJvmk3XPA14ZWDj4GWRmqwdd6M5XEqmZx1IOJNxNbWXn1f/TQDltIOQzA9py+jm1
	V67C4y1wQZOysvQJKcandPzOhyM8HpUKHgI4cWyoXw4eedVUBf9leTR2aDTQKeRXwLFhrDvgg/EzJ
	Dfaj5Bb3u4MD7JARqc3mPlV3+xqtz0VFXXqC4sxs1X7qYHDUvGbLQkz6cNGmzHpKvXsjtgq78P6QO
	Vm1e0r7X44LOgHac9dfo3EmsdQnwW2f+R5uyNGGeEl0ExQyEBit9kiJ04CU46/xR86S9m7WjmaGCG
	QTjWAHivz8QrdSaC5WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM6w4-001R5U-9q; Sun, 29 Jan 2023 12:37:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM6w1-001R3t-0H
	for linux-riscv@lists.infradead.org; Sun, 29 Jan 2023 12:37:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id u21so8551170edv.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sNkvgNjalEbUIW9jrQqtpgRzQ5YzLgOG7GublAOFwsM=;
        b=o2c8vo5zXmMwTV06YADgWiDYGz0h9vEml5wucGFEaQCV7ii0Wu2c83Xvyl5mXncu6b
         MRnGVYOP+C4qkuonWw8bv732H/UoF3FEHfO6Qwmwk+YwtxzDO3YtlD73Z279ldNmfFpB
         7UppRVY+/fT87JbLI+4tNNfMOJERptPy92gnlha6RolZVWL6agnwz5tN95d3iMqlKcfz
         5h36uRFFyV23MY/gPR9nXJj++fPG/CaIcgp78WJomtr14Q8RTFEFm0jwYeYDu5//e6j1
         jzejPLi19rK29iYDIXA/cnbNAUYdIsYpgFIR118O2ALbv9V/hW+gUFGX7cB0n4SCEm/g
         EdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNkvgNjalEbUIW9jrQqtpgRzQ5YzLgOG7GublAOFwsM=;
        b=M5nGLoU0F/EX0by35f08iXx/GjxWT+uD2fX3m3gEy8lQqt1BqENjvFeGRY9gt0YRXw
         r2rH/4ktDKixxqwiqtNJMMYvJ+Vs7bty9Wjr63foDuLVuz3GKMWueWoIhMvfie9iu+4M
         YXnddBRS/rYFYz8BLZGlVBweAr+EIiWZkKTuSnHo74j5hz/FABvSRI3P8z1Viy94iIkC
         G1zNZXKoDOXnK0s6EbR8W4nGY6SoczZJvdbIQVn4Dj/91ZiRt8C6BOx6JmQXhCHYZe7R
         XbCU+++mNjwJIp/EWEL9jx53rT5fQm66PU9BN0H8uilGqld0dXXr4V+joxYTzgAHS0w4
         cpUg==
X-Gm-Message-State: AFqh2krmMctUrenbLW6O/OLxPAv+dKpjRjKe3u8lyUxskfnrhqzJQWM3
	nMSlr3lBjaRRP7vol2EDrXsrl5pUkLpMK1yVs1qJLA==
X-Google-Smtp-Source: AMrXdXtzn6th6VcLei3QJ9jR5iiYz4v5EBRiUR59/fz3Bm6vT7Cz3sy14GjFMJfzfqcdsE4ZUwX5taSDXwtMUnQAEyA=
X-Received: by 2002:aa7:de99:0:b0:499:376e:6b34 with SMTP id
 j25-20020aa7de99000000b00499376e6b34mr7737774edv.10.1674995843169; Sun, 29
 Jan 2023 04:37:23 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-11-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-11-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 29 Jan 2023 18:07:12 +0530
Message-ID: <CAAhSdy0HG_0DZVLDF3Rvbofx-4P_2z7Tp+hGJ7VwgTH-u6uLGA@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] RISC-V: KVM: Disable all hpmcounter access for
 VS/VU mode
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_043725_049220_87477EA1 
X-CRM114-Status: GOOD (  16.42  )
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

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Any guest must not get access to any hpmcounter including cycle/instret
> without any checks. We achieve that by disabling all the bits except TM
> bit in hcounteren.
>
> However, instret and cycle access for guest user space can be enabled
> upon explicit request (via ONE REG) or on first trap from VU mode
> to maintain ABI requirement in the future. This patch doesn't support
> that as ONE REG interface is not settled yet.
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 58c5489..c5d400f 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
>         hideleg |= (1UL << IRQ_VS_EXT);
>         csr_write(CSR_HIDELEG, hideleg);
>
> -       csr_write(CSR_HCOUNTEREN, -1UL);
> +       /* VS should access only the time counter directly. Everything else should trap */
> +       csr_write(CSR_HCOUNTEREN, 0x02);
>
>         csr_write(CSR_HVIP, 0);
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
