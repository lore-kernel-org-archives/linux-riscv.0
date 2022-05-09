Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9800C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 05:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPVoJQUbU8EGbJLvUjUIkZGsOVSWSIl27XHX7njQp8I=; b=D9emg/rn+hsQ5W
	dX639SgS20So3gLldyCQM80ZYdQiw/ci7GIkVoLAPBjlKb7zx9Am5bBUmqCSlJ/Rxpd0MMeZYrQZV
	Fj7XRF1lGxBChPXGXISg/eei5aKCVtupdI1LSXistfp8ivG6HJIknob5BYbOf8fVzomiX4lNrXv0V
	EPKtoFUDK+9zac2hxUDjGxkE1Oppq9/vmidsTyhUz+ivNQJJRNj2JiFtAUAFfWR56VN+V8FpNjgAB
	k9fMvpe49GFXitY2MBcfu8DcAdajXKPt8rYNUZipekd4bzIXPBmWyL8eA5nPRkDRSONnZpNvYgoLc
	m+dA21zWabjIVedg/P+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnvcR-00CRRi-T8; Mon, 09 May 2022 05:07:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnvcO-00CRQ0-KO
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 05:07:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso10098271wma.0
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 22:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bdhxBHkeZJKhLSAPI6OAJv4xkfu7sQGGwYGe9PwcdxY=;
 b=NcUwvkHBJUKCv0MFOi0aoimKs0nJQK03BTN3eOVPeiwTolHlhov3OuBgLwnc613hjZ
 D+vg5/Kr1EdeTsBtz/UTHpY53F8sayW0x4Z05Q469bh2TCvnRUUM9gSbkyI/Ni1gPQLE
 RCxch8rhsnYcYKxi3lWtFVyMbCjAqTWJMVsYygV8X/enVf8x71AJ/991FvAQdSsPljg+
 TMay8lCypCIRilGJdXsvQpOKwT3tF5E7WlIPRSNBm0rPFsFQukMIqSidMBTz4XSQbuZn
 JfHggLWPByhiIq/F9nBtYUa7lNYxtAxH6l42cHcX/zZc2XJHUtMBSRjaCKbXiTKGd96k
 F4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bdhxBHkeZJKhLSAPI6OAJv4xkfu7sQGGwYGe9PwcdxY=;
 b=r29AAuMyonQ9xZITFTAXdIvtyHGEms+0U5TKqyVoMwi1Jjk3B3kQI7DyAO2jGAqdF4
 AOOwdJFNHI5T7WWT0S86HJyoiQMhZK6XDQkuFxXHjWXtP2WCzwaQrhUyk4UoN6m0Ayfu
 C4SYFPpIvqyzTyYMC2Vo1R30cr628nLr7gcVEUkzQagC80SZ3AI/o2twIZc0CyNi+TF2
 O8w9LQpQvcYehl0l/TH1E5uOrsvYUtrrc/NPrpOJC/HG96rJ9VrWyyvW1B+EPJHCmhBI
 bXUGJmpi8bCVi+KM+lLTJwaKiF0G12ee4lwTcF3DUd0W8CJ/rkm/Ta/Drog08IA/Dtaf
 158g==
X-Gm-Message-State: AOAM5338ITgKtpRWX+VGT8JPE7jsoVvAxARgZwF1JX/0I95wAzBuZB6p
 T3L3Bc/cAyR3w+SmiezvX+ciYglCpN60W2LSbIralcca3PU=
X-Google-Smtp-Source: ABdhPJyRvxJOp8dQf/hnmLk5CPnu/T4DwM8Qpg0kXrVvEiVm0ZjDRLI/md+TzxFB02jc58meQUAs1NVUyDWkIjd5bqw=
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id
 bg42-20020a05600c3caa00b003948fb80716mr3482746wmb.105.1652072844025; Sun, 08
 May 2022 22:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220506094512.116729-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220506094512.116729-1-jiapeng.chong@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 10:37:12 +0530
Message-ID: <CAAhSdy15CE5ZUROH-mOwhpR0AuwsK8h+8W-Kd0jxwsTixpQOQg@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: riscv: Remove unneeded semicolon
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, KVM General <kvm@vger.kernel.org>, 
 linux-kselftest@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Abaci Robot <abaci@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_220736_929504_13416F54 
X-CRM114-Status: GOOD (  14.68  )
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

On Fri, May 6, 2022 at 3:15 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./tools/testing/selftests/kvm/lib/riscv/processor.c:353:3-4: Unneeded
> semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

In future, please CC kvm-riscv@lists.infradead.org for KVM RISC-V related
patches.

I have queued this patch for 5.19

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index 3961487a4870..e17333518af2 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -350,7 +350,7 @@ void vcpu_args_set(struct kvm_vm *vm, uint32_t vcpuid, unsigned int num, ...)
>                 case 7:
>                         id = RISCV_CORE_REG(regs.a7);
>                         break;
> -               };
> +               }
>                 set_reg(vm, vcpuid, id, va_arg(ap, uint64_t));
>         }
>
> --
> 2.20.1.7.g153144c
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
