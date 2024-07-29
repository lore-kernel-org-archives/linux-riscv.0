Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10C9C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 21:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQGxrdq2LNeDLKTql8vZm66JZW7zb79kIgjc9Kda4hA=; b=YCFx/SrZTsP1c2
	kKxY2i2WLQ+bw50ofa0ihwBaLIB5CfdCw5AD3eHn53Q1KjS2BGHrGwOPLCIXWfMUJghBL7EO6cGN0
	/vEsuv9je55Q8ugYHGTC1Z48PlpvDdO+YT9zDsLaZKcMrfPAWpmRJlkEBHrRlOkK6ox9it0lUKHY1
	ZFpcByjaDyurOUk3TxmW8wjqYo0FGaeiCuGofOv+zAacuthdtYYBhIHr/zL8ny4S0+tqpt3P0Q9uG
	b8sHWJgASyuHDxS2zeRsklfOe3zG7XlNgqO8qaZeLjs/QsrvU5IFYiDC6s8tyf2nvxIrPnIcQzwn9
	FQ2HZJAWUsbDxOoZtmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYYND-0000000CqPJ-3zkf;
	Mon, 29 Jul 2024 21:57:44 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYYNA-0000000CqOS-37r4
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 21:57:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fd78c165eeso31235555ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722290260; x=1722895060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/uG0RbPF+t6wEe0TF57sCA99ACL1gtkgDLZUWdqXsM=;
        b=jcj5X+DbO72aQgScQeWn3Ym/2Zx1kkRvrRZwLtpRDBk9EVFQB05E0sx5XPQRnXYBT9
         J+pbvKC2mlApeFSIH29EhyyaTF20XROUep7ulGZSdCLt0roCzQvkKGyLSBqJM4U6mhFk
         AkYi3wNOZE7QO9/LiMBMFNOssPYd7Wk0jJTQNcVFf8OTT1zHG4Y8ACTOI1OEx+chCn+s
         RoxJEMCh6C0sdGRIjI97EpiRYTK/cEoJaz3x7qwBC+wgNzhnMYagkVzhxueqd5zqyQML
         z2bcfbLMF0dNKsgcU403q0E+uJPJ6rVqvH/8D6a5gzkKWg0O2JhMi2ol4rjn/JRGYXkx
         0RNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722290260; x=1722895060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/uG0RbPF+t6wEe0TF57sCA99ACL1gtkgDLZUWdqXsM=;
        b=C96JmNxErAozVRGvYMapTq7SahVY7JkpdRORY0GXHxKzWrS+KJhFWW8FJ27JmTFfbL
         RExOyj8cas4ACec69UdEGnMVzEgeZiCvma9h5EsCfaYMMQ/1uvLJQ2C2T62/pkklUHs8
         SH6h2eZS1I2IA9fFF0ZjIj0DCT7luhyYhFaiwi5+55JZM99lBn5rJXKehVx8OA0coO12
         X1s1DD56nZRiLoJWfZWDaLRAtqGW00lnW8Jda9EREQ7kQk60xAd0sktSCJJ2COlrtwyN
         eLOF50vdVgInY5Xca4stK6qPUZ7VYypS/QsGfUve2qijKtquaIqa0XhCqU6ySaAXdrCe
         u+XA==
X-Forwarded-Encrypted: i=1; AJvYcCWwnoQqCA1sVyqF+Ch2YWlfnfCuiUqiyP0MmU2YbmSNbA3tYBTx3XFSd+IFLtUCNsN0Qu7/wX/JZkrkeI6TXrGOVRGHDMU3C7JEXQ5LPGct
X-Gm-Message-State: AOJu0Yw+yX2kh8wbeLLbHeyzc6W1vUv8sGcEZ6GIgqZjW54x3+dI6sUj
	cDuNNsxJ+9ugjIXwouo7StZm+qbZPOjQGEXOsKbuzWRZAKdn4zeCZBnpfE9tFwk=
X-Google-Smtp-Source: AGHT+IHwZkZt24czu8/lKOn2GWi2SUrhVTkh/FSI6AFzn2vEWdyOC7cANh35tDrGnaCxah8UqaL2rQ==
X-Received: by 2002:a17:902:f542:b0:1fb:779e:4fd0 with SMTP id d9443c01a7336-1ff04824612mr112584575ad.24.1722290259864;
        Mon, 29 Jul 2024 14:57:39 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff0fead748sm45010935ad.74.2024.07.29.14.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 14:57:39 -0700 (PDT)
Date: Mon, 29 Jul 2024 14:57:36 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] tools: selftests: riscv: Fix spelling mistake
 "regesters" -> "registers"
Message-ID: <ZqgQUKmoNrSAeoQI@ghost>
References: <20240729091734.42259-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729091734.42259-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_145741_000777_8C17062C 
X-CRM114-Status: GOOD (  17.50  )
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

On Mon, Jul 29, 2024 at 10:17:34AM +0100, Colin Ian King wrote:
> There are a couple of spelling mistakes in ksft_test_result_fail messages.
> Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
> index 1dd94197da30..6838c561e4c9 100644
> --- a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
> @@ -49,14 +49,14 @@ int main(void)
>  	ksft_print_msg("vl = %lu\n", vl);
>  
>  	if (datap[0] != 0x00 && datap[0] != 0xff) {
> -		ksft_test_result_fail("v-regesters are not properly initialized\n");
> +		ksft_test_result_fail("v-registers are not properly initialized\n");
>  		dump(datap, vl * 4);
>  		exit(-1);
>  	}
>  
>  	for (i = 1; i < vl * 4; i++) {
>  		if (datap[i] != datap[0]) {
> -			ksft_test_result_fail("detect stale values on v-regesters\n");
> +			ksft_test_result_fail("detect stale values on v-registers\n");
>  			dump(datap, vl * 4);
>  			exit(-2);
>  		}
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I fixed this and some incorrect error reporting in a different patch:
https://lore.kernel.org/lkml/20240724-xtheadvector-v8-12-cf043168e137@rivosinc.com/

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
