Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236F4C3F6B0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ddoe66nVWbw5VX7YM7MxfvJjZjCSF4IF1MRo9AQFSdw=; b=LzzYy8HvvY9xVh
	mxTiHJ2rWr90Ejti04kphUfPKNHkwPeVocc8OG1CN4dm+TjadtatsiZX8Qo/75lWUhC2TWm18JMqA
	rbwhiI7IOwabmIDRBa3tg4kUBPPpkXPoqiUlM33J+jeIwgFbLmQtBvP1/2kx2LLIOmJ7MATwaVWtm
	p49XxxqQlKLQhSG8841WM/o+hjz+7pf1wR6ebpcemXawAfBMTKqejoCSZR8OH5KiPXfDC4XVcVhap
	/wr1lDtHCgna8ePGy+WwzsErmZikWLaliAiGCt4ykSAXxQATNiPAymwL0mGLxV5gfvUroF4lov4KH
	dRRBhtqocLI5CJ1jxM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVQI-008mOV-PK; Fri, 12 Aug 2022 14:14:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVQE-008mKC-Is
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 14:14:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id z12so1342712wrs.9
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=E4JPtvsTDamtMFqwau0g/GY/W4zUAlwh1hRHFDce25k=;
        b=c6nHRRoj/+2Dqa1s2A5U+L2edwSBxY52Lr7JUJnYsSn+M/jIlR7yUrl8oIztURxFPG
         MdvxQIxbF5PrXWzBHT8SuEHPKHYfZ7EfS+SDza250wY6DrPKVvL4jQyFUSiiBbarWBOo
         Ur422oX44qtxqPDFZEsg+naMASIjpODyOe0nQx2DDYx18ddjO4s6DdF60LoaK0/WO3sl
         bikkX8BezC6vTqt2eRac6vilxae1ORVubzVVCFLhSJJZ0DykBkWLC1UAgf4Jync5wJQm
         zwM6VqEMhjNMRawBwrU7PZ48jv1Y+91aQoRj9lyIOf7VkyEbeRIf1nj3gEopb3JsviKr
         CWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=E4JPtvsTDamtMFqwau0g/GY/W4zUAlwh1hRHFDce25k=;
        b=eEduvwnSXhfFgZVW33epAeHc/pxDyuTFGom2Q0UmOYxmUoyTFGBurDxJZ0XavDM1mJ
         kuxHbpgMjwVZg0qnz16kzkua3j2394sOYnYbcS8ZrwTvhyicINXYDIUJzzttZ08AyVR6
         loh9vttkK8zvRlLhD+MHgupZBXI/NGwyxUdLw27h/GvPb5bJSAJPvV29Gef1QVLv2009
         3GWAAWWV5+Bpi+en0jjkfg+XIvEeVhedyf/dUqbgs+vT/30VqQQvA2VI7hYoPySKqe1F
         YFVsjO7377AGE2b9L7j9aiiKhTakIQj47rYh5aykFOfhkoamMUpbpc3HqnAQNasH2NRF
         W4hA==
X-Gm-Message-State: ACgBeo0WO65pFo/5e/HjBweMhkps61vqNF+AIQ8BWwAsVQHMai0SleTa
	LbzgPdf+xByNhOBc1yJfYiQBxw==
X-Google-Smtp-Source: AA6agR4CRKUeJvXj9MfeYDX1d2OqDrZn9NbmbzCxoJBiRuZRrRhMvwNKsxx0TCWg9VxF4XAwAmreIA==
X-Received: by 2002:a05:6000:c1:b0:220:5c10:5c51 with SMTP id q1-20020a05600000c100b002205c105c51mr2181769wrx.668.1660313635838;
        Fri, 12 Aug 2022 07:13:55 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id r13-20020a5d494d000000b0021e4f595590sm2001393wrs.28.2022.08.12.07.13.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Aug 2022 07:13:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] perf: riscv: fix broken build due to struct redefinition
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220812135119.1648940-1-conor.dooley@microchip.com>
Date: Fri, 12 Aug 2022 15:13:54 +0100
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <2055040C-D443-47FD-B6E2-C4C6B3E600B4@jrtc27.com>
References: <20220812135119.1648940-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_071358_684538_F40E6BBD 
X-CRM114-Status: GOOD (  16.38  )
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

On 12 Aug 2022, at 14:51, Conor Dooley <conor.dooley@microchip.com> wrote:
> 
> Building riscv/for-next produces following error:
> drivers/perf/riscv_pmu_sbi.c:44:7: error: redefinition of 'sbi_pmu_ctr_info'
> union sbi_pmu_ctr_info {
>      ^
> arch/riscv/include/asm/sbi.h:125:7: note: previous definition is here
> union sbi_pmu_ctr_info {
> 
> This appears to have been caused by a merge conflict resolution between
> riscv/for-next & riscv/fixes, causing the struct define not being

union, not struct

Jess

> properly moved to its header.
> 
> Fixes: 9a7ccac63f9c ("perf: riscv_pmu{,_sbi}: Miscallenous improvement & fixes")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> drivers/perf/riscv_pmu_sbi.c | 14 --------------
> 1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index e7c6fecbf061..6f6681bbfd36 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -41,20 +41,6 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
> 	NULL,
> };
> 
> -union sbi_pmu_ctr_info {
> -	unsigned long value;
> -	struct {
> -		unsigned long csr:12;
> -		unsigned long width:6;
> -#if __riscv_xlen == 32
> -		unsigned long reserved:13;
> -#else
> -		unsigned long reserved:45;
> -#endif
> -		unsigned long type:1;
> -	};
> -};
> -
> /*
>  * RISC-V doesn't have hetergenous harts yet. This need to be part of
>  * per_cpu in case of harts with different pmu counters
> -- 
> 2.36.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
