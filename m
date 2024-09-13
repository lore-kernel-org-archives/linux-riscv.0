Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DE3EEE27A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 03:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWS7UWEr3qXahyC0iRE1Qqadb50ghmDlEEZDIu4UyEE=; b=PqSq0A3wjFBDnY
	ZHEPqXsgo4Vn0P3MoBPbv5AzbPUZIkknjpr2CWMrM6gJNPPBRw0enKHW0+Q497CrA6WbvyU9OD2Al
	rWJpgvuEhMjMaXmJPdJHZ/FCmLdyMKjYvul+QZfW6vCg9100PvU39ahDI/pF3w8fN/vHD9P22nFEN
	4khKmwhJdhv+9/QZzrRSdlh7Ta/15OxhPGFv4bsQDlOB9auC3U+Kq3GHzZQdYjEOjy4+2lMF9kcGM
	Fa68Q11tbaVRHZIjCNOCMmZQjTnSIU+XpRrTQUZZtIBsBl0ObdEE/vpjd7snszsGNjjKtpsxvn9kB
	qsqO53J8aX4PadSoIoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sownC-0000000Eo09-2zsm;
	Fri, 13 Sep 2024 03:16:18 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sownA-0000000Enzl-2XHf
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 03:16:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d87176316eso2046088a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 20:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726197375; x=1726802175; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qmIqDIRKmZ3iBqg4fjUfRWxUySLwSHYWorSaFVgYpdg=;
        b=0oOrt8dADrI3/uFuJ0MszuRM1L7YyUsJ2dpmZYQ4+9PsOs5eGbNIaTJ0bwe5iDCiWu
         aVNj4wSaWAXZY5V0XTW6Fp0WmQByLnvvnJcReMjs9JPApp35xBbs+OLDO3n8uXXwaKPi
         QkN66S9EvBzTmh0sSxyN3lusGPPc45wpZWuX81lR03UWL/WgVwyq8hBQBw+nnomC7x2q
         Ss6Jhl7h67YdZFR/UM34dNtktg27ZLiRDKgwHrSyjrTphyi01Rg5E9uhNaH1y4EFU65Y
         B4GV7ERU/9HJhbfsVl+QJC0vPIQFhDdF9TEgCVEtVTsiOFvO47LD2pLjSg/FbNzly+bw
         05Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726197375; x=1726802175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmIqDIRKmZ3iBqg4fjUfRWxUySLwSHYWorSaFVgYpdg=;
        b=wE6mep6xdP3Pfm9bgZJzlApjXXEsox/czun0PYVWVewSr3/1+ah6GPwYD/Y2D0/GLo
         VebO/mBqzpwV/U2cgMniPxZ2G55Hdx5TFcwlt46VTpyNMicdWedwRlyLnVPbwSCLLSxW
         D8tSEi03J9ncOvI0Unb3fU6yzaW7EfvwiUMzsqtqBc0zNc51Jvz0+HIK1SJVkTuCRYmZ
         gSiujZNDqj1W0JwiRnEs0HN2cu88wq8NBJRBOLlZNt7kN5yIf7Ky6+oROHeAlGsw3r/m
         wliu+Ua1SPIku0LAAbLcAfbk9VZZf6tSvr+3op6TghwnHP9iPLySixDHVYRrg+hvajZp
         49gA==
X-Forwarded-Encrypted: i=1; AJvYcCXLNqjb6UUkkKci01XmwGFVbEkHZoB2K1Vj9Ekt3UBJ/5qjk3DIQyBxtp4zcwhVXvgSkhgg0lALAiW7xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZUo8KMzlwLqaQWcvbpZoNylcpQHWEYB9LnvhA4RCYZJm5nGbt
	MfYjT/Pysr4gmWF+2xGzt/yVMF523GYyyDK+Sj2gIkjl2lKG/tKdj2h03PQiKjUNmZjZr4NOByy
	v
X-Google-Smtp-Source: AGHT+IHofoEYfpWNv4esB4XO4Rim9SF/7infwEOUPzQiA3C8UNukICHiPv0hDgZfogm6+/vqio/R2A==
X-Received: by 2002:a17:90a:a408:b0:2d8:7a2d:62e1 with SMTP id 98e67ed59e1d1-2db9fc1bf64mr8322148a91.2.1726197375526;
        Thu, 12 Sep 2024 20:16:15 -0700 (PDT)
Received: from ghost ([2600:1010:b329:66c7:b074:429:f745:d035])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207842d435dsm2339975ad.46.2024.09.12.20.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 20:16:14 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:16:09 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH 1/2] selftest/mm: Fix typo in virtual_address_range
Message-ID: <ZuOuedBpS7i3T/o0@ghost>
References: <20240913022635.751505-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240913022635.751505-1-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_201616_665479_8E041461 
X-CRM114-Status: GOOD (  16.87  )
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

On Fri, Sep 13, 2024 at 10:26:34AM +0800, Chunyan Zhang wrote:
> The function name should be *hint* address, so correct it.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

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
>  
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
