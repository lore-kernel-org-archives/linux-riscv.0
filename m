Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A03CE8E9A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0mNLXVkRKFp9W6TZIVReHctM7M+yB1X0ZQzTyjFlM08=; b=OI5suxQGSC6SiFUEZ886XV6ebB
	9W8o6Kjidj7tFNAGWLQ+GE5O2h2QrS4/1TJChmxuertOUj8lnaay7R35559kTfaYn796ZE+ACnJpN
	WnadEYZ+paqy3YicERwTOxLYTVJcNcI+5c/556PpEDf0KtjkuWftEhLcJUKLAa68QplG4grNO6Ajj
	yAdZpwCIhNkiVT99Xzw9DaoH2P13vy1UhdtLjWu2axsaP1n2TwjhmhHDkXALY5rs1mK8Ed9ZDeHHb
	PSx+8K+BmplhagVdHQaSLlJ5M00pmNWTY01b4kIS42KmqrQV+gvHUeXo/8eL+uaYuFpe8hxc8deq4
	zZY8VmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42G2-00000001PjT-2gak;
	Thu, 24 Oct 2024 18:08:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t428b-00000001OHA-1yrB
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 18:00:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cdbe608b3so9311695ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2024 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729792844; x=1730397644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uq3Sx3k7CbWldci8VdjhK0lmnb+JNksv0KZ/tegkNgc=;
        b=NMRQVQtkO2vCFNu2YuMOLvohHNRLaknvtk8haMAp6HX3ReeNxSMjHYBa2nRHq1Gd/6
         MRTPF4kwALikZbUii482rmEkQ8PkLax1egTOTPSYbE0jlyRRziWwSi+v+hYnA/yLJ5JK
         38IFQwacZFtXpEq5Yi1NI/effzfZ7NgPBpJYDxuieKJLMkuzQUesRiFdBIFtKDkHKdPG
         H4C5yA6TtNnTjhBnWAO3ux+ky3bTF1q86rmuD9CgoO4agAylySTKrqTcVO2tFnu2clkz
         qLzTrmgDoIhWk9QCUtcGeJWJG9g5znpqLw/QyLOcZFHWV2Y6EdUBkyPSwBNmYdX3Qfw4
         hf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729792844; x=1730397644;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq3Sx3k7CbWldci8VdjhK0lmnb+JNksv0KZ/tegkNgc=;
        b=QBwmxReUT4rSP/rDpyMRRNgyBpjq8OuVcWAVOgMWyi4cthAtvzaZcR3qpZqnPCKs9I
         jiuzftEFOae4qZcm8pGXmuRhLNs08LzWA8M46BVNdBpPMzN3VDXO7RYKH6+qD959Q/o7
         ehNl5V9EwbCrMmEcDKS5GG8mi1bF3wYu1mumFehOIBTQrIJLxlpemvGUPh8OW2fTdCQ5
         t+4fzs2mQmTNWoE2es8n1soMpuLn/GwhZ17qXMcPUO2zvTX1mTY++HG9ZDKps+T+/tuU
         IhDRKJWmc0Q2qR9SoGiix3vC7YF/Qg5JDa1U7jUPM9FaM3GdCervF9zOqAe/fM+g4s5D
         xGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMvWTu7wrLvqQ9lx3rEm+GcGZ+N1mXu408YDlRBfUKEz31f7HOARFm2JKsTpEy9sY1vXdAFLBtBHgoaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuPkNG11ohJxJ99kenQNRYckHnou4ARLT++pTGKgjWdOhfA35r
	5X0m30ZRYlhxNt4wPngV2ADitX4I+J6FXQr3Kz0Yn9olGce+ixSr7qa7BDDeJ1Q=
X-Google-Smtp-Source: AGHT+IG6scKr4Ed7CrsoFYPBrwdrqHCqMwM3BvTaed47lJT2cbMpV1ZnIibL+NTBPSm65i2rdkQzqw==
X-Received: by 2002:a17:902:e5ca:b0:20c:b876:5046 with SMTP id d9443c01a7336-20fa9ea37c0mr67231345ad.50.1729792844371;
        Thu, 24 Oct 2024 11:00:44 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef15992sm75616485ad.74.2024.10.24.11.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:00:43 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:00:43 -0700 (PDT)
X-Google-Original-Date: Thu, 24 Oct 2024 10:57:56 PDT (-0700)
Subject: Re: [PATCH V2 3/4] selftest/mm: Fix typo in virtual_address_range
In-Reply-To: <20241008094141.549248-4-zhangchunyan@iscas.ac.cn>
CC: akpm@linux-foundation.org, shuah@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr, Charlie Jenkins <charlie@rivosinc.com>, linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn, akpm@linux-foundation.org
Message-ID: <mhng-43cbba56-67ba-4f5a-a929-0805662b22bf@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_110045_573958_59CC4766 
X-CRM114-Status: GOOD (  17.52  )
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

On Tue, 08 Oct 2024 02:41:40 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> The function name should be *hint* address, so correct it.
>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
> V1: https://lore.kernel.org/linux-mm/ZuOuedBpS7i3T%2Fo0@ghost/T/
> ---
>  tools/testing/selftests/mm/virtual_address_range.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/virtual_address_range.c b/tools/testing/selftests/mm/virtual_address_range.c
> index 4e4c1e311247..2a2b69e91950 100644
> --- a/tools/testing/selftests/mm/virtual_address_range.c
> +++ b/tools/testing/selftests/mm/virtual_address_range.c
> @@ -64,7 +64,7 @@
>  #define NR_CHUNKS_HIGH  NR_CHUNKS_384TB
>  #endif
>
> -static char *hind_addr(void)
> +static char *hint_addr(void)
>  {
>  	int bits = HIGH_ADDR_SHIFT + rand() % (63 - HIGH_ADDR_SHIFT);
>
> @@ -185,7 +185,7 @@ int main(int argc, char *argv[])
>  	}
>
>  	for (i = 0; i < NR_CHUNKS_HIGH; i++) {
> -		hint = hind_addr();
> +		hint = hint_addr();
>  		hptr[i] = mmap(hint, MAP_CHUNK_SIZE, PROT_READ | PROT_WRITE,
>  			       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

In case that helps, but this has nothing to do with RISC-V so you might 
need to re-send it so someone else notices.  Though +Andrew, in case 
that's enough...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
