Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D016C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 04:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCaoSR/38L77vZ3apz5b6q2L9it+sI9nAQJq36FcFLA=; b=AP7DHqaDoiNjcE
	NtmGuzM7h6kyc2zHC+0bGUx1DQPiBJdRec2qlL2cuem1zhyYV69UCbjFHYLEMpJi0+qnnSV25BCae
	cqSUkCJyEXuk4d26I8tFjLt/65avZPJsMEamSWzjhItHANwSx315KnHs5R7mo3NDHdMzmjjXhy5/R
	W/O4uQ37JcMb3pb6P7wDs1N2+IYgrut8FV59tSbGo9/CnNRBL0L0jY36R0puUzk/5A/Ckliw81zvN
	BIvmMHp8QFGN+Y6VPGDMa2lWzgt0GvVYqWu38wQZfATjaa3fwFOB/lKwPJYI/tBenhCyXOeDpv6+u
	yyF+ITlHIpcxFdtkg/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojCBn-00DaGq-Oy; Fri, 14 Oct 2022 04:20:51 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojCBl-00Da9E-19
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 04:20:50 +0000
Received: by mail-ej1-x62d.google.com with SMTP id ot12so8039451ejb.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 21:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OV3+a/0BT6g9pXRrmU2hqgr8aQ3sfDDJkFYLKeuZKSw=;
        b=cboXTgdXBn/Wg/ayWDkxV5ELOweKXTZUGvbDt3Cmf0EdfrB9qbaUFkZJPMTeg5QpPU
         GfjaCB0baw9rlJMW9Y244f07QcuHhHVTav9W4d+xzt0wMJNvaTVGQi2o/BRuMcAcCkGk
         FPsAeSL4KiKHcG3Vxof/E7hgArG2wAnjhYbjbQG38wUqcpGJl+fciRQv35Y4m4vk3e73
         GJJNzxPShx5BR1MgfW1RSXBXGFoduCsWS0aen8QmMfLqdUFNZzX+iZ4SlXtHAGu0j1CZ
         QMYAv1hZnG5ucr1mVb51/pORWIppRrSCJhMEum9JHcR8ZATch9YS4gMOFzyN1q4gqb0K
         qOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OV3+a/0BT6g9pXRrmU2hqgr8aQ3sfDDJkFYLKeuZKSw=;
        b=59DKhGFazasV6dWTrpOlcGuncEHR61vbOHEX1JGV7rsGJ1ibDYgHQDXnmhJg3lP+GQ
         BeFSNTE3GEZW47SO3LLRHUwLYIgeFMx0krEBVoe5dghRXZ8ksrd4gkt7Jh4M8Oq4LgMH
         VLuklY4GqHDdcZ+ummRIor7Fi75ag1wYNS2Gf/f7FX4rpL4kYPdRzrC+WSzxeq2vet6r
         fReuXUmkwFT4pVJkQd9F1DjFKsGKt7tYHn06Pov/w/+czbdQKas91EOvNsdsajkKYevB
         2ZNbl5cBBpUYmE4oGZBxuteySFx/NlYe48WYpMh4b33rK80HJFV9HiZcZK4CxHZe0LJ8
         xrUQ==
X-Gm-Message-State: ACrzQf24o90CvhStdZVYLd/x5oJp3/NoxtxreDSmUS3zbIM3l/wKm9g8
	QLt6gY/VJoqzHK2lKTuclqZpgZHxbCwMzH1TPl0leA==
X-Google-Smtp-Source: AMsMyM7+0eUHblw7Luuc7IqD0pCKWwi1rSFfe7iQHBNTv6SEMO9oK6RTkN53yr+znEsS/vx6MTrhy5z9iOxdtvbbdFA=
X-Received: by 2002:a17:907:a065:b0:78d:c5dd:45cf with SMTP id
 ia5-20020a170907a06500b0078dc5dd45cfmr2146288ejc.117.1665721239633; Thu, 13
 Oct 2022 21:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221013214638.30974-1-palmer@rivosinc.com>
In-Reply-To: <20221013214638.30974-1-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Oct 2022 09:49:30 +0530
Message-ID: <CAAhSdy0sM1ENhTuakHBB7xm5nUVtKzUzPFQ-sVMyeWHDv0FPzQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: git://github -> https://github.com for kvm-riscv
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_212049_094283_E0CC99AC 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri, Oct 14, 2022 at 3:19 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> Github deprecated the git:// links about a year ago, so let's move to
> the https:// URLs instead.
>
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://github.blog/2021-09-01-improving-git-protocol-security-github/
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
> I've split these up by github username so folks can take them
> independently, as some of these repos have been renamed at github and
> thus need more than just a sed to fix them.
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a47bd58a330..d103b44fb40c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11156,7 +11156,7 @@ L:      kvm@vger.kernel.org
>  L:     kvm-riscv@lists.infradead.org
>  L:     linux-riscv@lists.infradead.org
>  S:     Maintained
> -T:     git git://github.com/kvm-riscv/linux.git
> +T:     git https://github.com/kvm-riscv/linux.git
>  F:     arch/riscv/include/asm/kvm*
>  F:     arch/riscv/include/uapi/asm/kvm*
>  F:     arch/riscv/kvm/
> --
> 2.38.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
