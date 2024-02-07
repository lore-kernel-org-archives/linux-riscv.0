Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3DBC4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 19:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mSKmHJs1UYti8JvzzRRJYJqIoiWlfHrF+LHm1cSCKs=; b=AMJY1lvDzWN6TU
	D7zLeJVcJy6DtDh3Im0xAfj75ghdszIGc7sifGOTIrL3UBv5UiHHueDgeYyEGQgy8N2wgKH+2GTwM
	pirpW8ojZu/Mgwo3JoccEcksB71nIcPmlsG8N/Do8pYRdxdf3EqMHpw3N5CaUgi9wu3s6Qo7CImGe
	6hoG4Dc83p7k8P3JJd6WE2fO3yCrw2d6ADybOmBA6sBmGOtfO6BguvFvAJ13EFKeSaw47QGrd22qx
	3k+vDzVMV2fdF+aWPShaPAreo70clzlKcPIYYzqw3spr06L0ZUxkpWmXOy11GpowMjiaPNAWp5HIX
	A+1vWH+LpMxA3CkeJbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXna0-0000000BcC2-2yW9;
	Wed, 07 Feb 2024 19:27:32 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXnZy-0000000BcBY-3jsm
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 19:27:32 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-68ca1db07ceso4860736d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 11:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707334049; x=1707938849; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cA5YwgvtHoLDpmj5Skshopyo0pdeDCfKH8nml3v6ZvA=;
        b=V2WJi1V0gc6cNbheE1e5uPQv9fa5hC8vK0r54dLpaz+lo8gNEy4p0ewoqao3GgeB1k
         Iwvvn+W6VmDX3DZeXdPATzywblj1LX3K3CAm+mKZoJPL6MOSOFOF4v52Hal51p7WB+3J
         lnRngI96FPJgwz99lMQgKohxYCjf46Wy06xXxB6naqKoAi1VNZcUtCY6ea17hOIeQNVQ
         y064ryHRIygD6C8/VUte6cR2eWc+PnOZE1vJBxeAudincla1YG7ZXrpLkVZk9E3wmzgk
         DVNFN82HMukuP1oK68lQah+u9IzsqaK7esIQAUv3yIAB5ml14+XR9BiMPjuMlZIEk5ta
         pRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707334049; x=1707938849;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA5YwgvtHoLDpmj5Skshopyo0pdeDCfKH8nml3v6ZvA=;
        b=R6KRW+In9nx4u04JJYhSqZim9EXB0pidgdX3a6NnDziLPxKDWQtPlALnaohR1NZ7Q6
         FT5S3wWb3HNVhXzZNVDo9ccdcFz1DtXnz4yM1oc8UHW/xqObxcXXI3WvfMacxtCnH1ai
         wvYqFAZZhJiZWucX9qbyEmd7OwdFo+lYJvfJyWlkHmAM4cwzaxRRw0W2y7CkEt0UJBf9
         6LC492ib3jAebtm9obBirDKccB9jx7G4E/FyERRhBFbSTF1QvqnAQkcNtBzKgOhT63Es
         G9gizUCJBis/dRjGqeW3njP+xWkRrnl1tVrzH3VPZZ9lstOnaq46GYG4KkoF1wXvamO2
         Vw8g==
X-Gm-Message-State: AOJu0YxhgQ9NckvoEiygEmk4kiI5K9jRdFfJXawVyfMsZdqWoXD0jywa
	xrf28oTnVaKhLMMA+Mdlt5WuNeXHg4TxlEJZLPpCZlKGpNaz6sE5BCqfdhjabsg=
X-Google-Smtp-Source: AGHT+IHsK4ELyrPXdU4ZLmwitvFRj7LYEHNgAJuvSyMPNB8sou2DqRMM7N8MJoYaGqi2rQYT+Fxtqg==
X-Received: by 2002:a05:6214:27cb:b0:68c:67aa:c056 with SMTP id ge11-20020a05621427cb00b0068c67aac056mr6941805qvb.39.1707334049232;
        Wed, 07 Feb 2024 11:27:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXj1ff2e/sYSGxK1YlhNSpJ8/w8GhjTI5LhuvxizKy6x8W/6hos9diJ1ETtTEcLg/TVYmqAIwhTEKHzeaxM9l9DDMoT6Rl/ykv8I5MEn2RQ4RzDTpjnVLYW3ZXn/TNw0ueiAHScDsmwL3AwcGQDqrxvYNXsvFkP1puPtlXLOAxSFw+g/0BCBhy9I8Gajfei3p+mqqln7VJ2vILpUpfwVUdbkVf1werhIL4Xk9hkFoyQSXVpRi34UW/O8UHpavC+10PZ4+KSLIrP8EsbFRi/xpmZIjPE/QII7mdA+9jGp3ZJw+/NwygGxNW2xdpBgA2x1B/FviTu6abT91l6SLSW4ExTkADsYTqPkirRqI14FN4vBik5b9VpObUbi0iUqNRUfVaRBoEsg3TQ3KU+IyoV/60EkdsKc6zC+dDKPwAsDoMmpJz3Nv45Y33ntLQctzsHs9XF3FZuVV8dMiaEtw==
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id nd10-20020a056214420a00b006819aeb62d6sm868412qvb.136.2024.02.07.11.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 11:27:28 -0800 (PST)
Message-ID: <b4e20286-eb80-4dce-8d37-0d079ba5296a@sifive.com>
Date: Wed, 7 Feb 2024 13:27:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Flush the tlb when a page directory is
 freed
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240128120405.25876-1-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240128120405.25876-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_112730_967048_E587D699 
X-CRM114-Status: UNSURE (   9.49  )
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

On 2024-01-28 6:04 AM, Alexandre Ghiti wrote:
> The riscv privileged specification mandates to flush the TLB whenever a
> page directory is modified, so add that to tlb_flush().
> 
> Fixes: c5e9b2c2ae82 ("riscv: Improve tlb_flush()")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/tlb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
