Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612F9C3DA64
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 02:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hFcebZCmRIJwKH4xcnbQffEYxaNgr7rGaS9EXrm7Vg=; b=aNSljwzvvewBBo
	26eNT+QyDO2BbTFdlaNF/RPfQrjnMLyKj2lbGYmiDINA3fyCoJtsdxUkBWQvihrvPkASktBENxYq5
	vVT1uoc9EQb5Jvy6tsxoDM5QJxyr7HHRqJ+qfBQwLgarfNJ+d1gKFxo7k+3SFWzvrH3EgiIUiCkf9
	lBFlBXwDTsChMXHHULVqAAQUJ3FW+B8nKeyHE34T5lR8eUZk2gkp5yd1F8sR9MKcX6JMt6T2dVFV1
	QnMRE1CjE30p62ZIf79y0FweemxZ9RGmyRFHGTBjkbvMaSWkscHroEYNfXPVV3w59icblep4SCHpl
	K58ZZE3BfPosTBsJiIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZhyB-00000007NL2-2gXo;
	Fri, 02 Aug 2024 02:24:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZhy9-00000007NKZ-04M3
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 02:24:38 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-710439ad77dso2864736b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722565475; x=1723170275; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MbaxQcsGfxUIgeMy81+1yUQqnxTxpWNLrxDGUmYtREY=;
        b=zbGbeSNBYiJ7hvFXG2+/cXp4w2IU7j5dGWvmJoINK6zDLwPWFUA+0vbtmzDFtm9aw6
         JI29bMGlHMZQ+RFh5epfK7buBMtR/Ri8e/hdRS47AMuuxO7AIpamqNNGsKjsCkfcVhbj
         Zka7tS2AxDXvh5FuLRUAAR3fLfIk+ieDi4JrgGuiDkMjGul+GEhgENLuRtscPckhTiuE
         4GGNrL0H9vVDUU8GqckSZCI5Tpc7ZGWY7lUN64VWs+8iYPxqsYgUmNdufw/6zk/QXojG
         Anha2Y666DCdCFi9W/hnEP6eEIp7ED/cypy55t2kcQIPTu0uKD/Cz1knLWmWMLVpOgVY
         XmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722565475; x=1723170275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbaxQcsGfxUIgeMy81+1yUQqnxTxpWNLrxDGUmYtREY=;
        b=gasV7mNM3gKVi2osuNkOex4BPVbwNBuuc3vPUNWSfTNQBqQxbSs5OLD2NM9SE/p3YS
         CNbMZvurABWYwhoZmbentem9ULPuGBjGZCl/bOnCJlhsJgUvfZFow0PQS8U/q6jckt1J
         osUGa+jXiniTaATOxfZuB/cVgB6vT2V+mBGQE1nzFv4ZGtl3MEaIJuckGQt+8qfGR6T+
         IU3XRAgKsoByBiWk5HxwhZ+Ld16np85OkdWpKWYu0pW4rnq/5BtJJe0lXL0tGlSgiH6l
         KqUwJBhcgloE7Z7y/ubEPeSbVqaXncCSbwDfD8PRvpMu1sdhVs6M9KoMVwdxov5SES7J
         8/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3V5Xet15amy8rm0yC3MCKmyMmttJSqC5ttfBb9oBb5N7faqd7YaCM9JRKxMo9oG36cV2bA8qKJ4nVjpw3dv8Y2chCJnIbGIyRzwpYkmhj
X-Gm-Message-State: AOJu0Yy/fR+LEP4C2uFjYU4P1TL/E/edrbefhg7Lv1jDO+MVzXfg09dH
	4H1j0opeoUeyvqgc7nyeZ99XQTPi+i26GnW81Kgw66E6EXj/3jZquNEDG7AiNvE=
X-Google-Smtp-Source: AGHT+IHszQBF9XaIlkRyUDtOVaKjBsyd9ElItCsAR7bTXrfBCzQtRSicoMdohqzkHhw4ctg47eXRzA==
X-Received: by 2002:a05:6a21:32a0:b0:1c2:9643:2921 with SMTP id adf61e73a8af0-1c6995504d0mr3392945637.10.1722565474979;
        Thu, 01 Aug 2024 19:24:34 -0700 (PDT)
Received: from ghost ([2601:647:6700:2d90:16b8:ec8e:e4be:b399])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f53c4csm5947405ad.72.2024.08.01.19.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 19:24:34 -0700 (PDT)
Date: Thu, 1 Aug 2024 19:24:32 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH -fixes v2] riscv: Re-introduce global icache flush in
 patch_text_XXX()
Message-ID: <ZqxDYF1OyIf40ZJA@ghost>
References: <20240801191404.55181-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801191404.55181-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_192437_332936_4214637F 
X-CRM114-Status: GOOD (  15.48  )
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

On Thu, Aug 01, 2024 at 09:14:04PM +0200, Alexandre Ghiti wrote:
> commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
> patching to avoid illegal insns") mistakenly removed the global icache
> flush in patch_text_nosync() and patch_text_set_nosync() functions, so
> reintroduce them.
> 
> Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
> Reported-by: Samuel Holland <samuel.holland@sifive.com>
> Closes: https://lore.kernel.org/linux-riscv/a28ddc26-d77a-470a-a33f-88144f717e86@sifive.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/kernel/patch.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 69e5796fc51f..34ef522f07a8 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -205,6 +205,8 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
>  	int ret;
>  
>  	ret = patch_insn_set(addr, c, len);
> +	if (!ret)
> +		flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
>  
>  	return ret;
>  }
> @@ -239,6 +241,8 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
>  	int ret;
>  
>  	ret = patch_insn_write(addr, insns, len);
> +	if (!ret)
> +		flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
>  
>  	return ret;
>  }
> -- 
> 2.39.2
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
