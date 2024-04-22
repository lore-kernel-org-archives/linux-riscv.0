Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22513C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlSgqjugt37kNm1gqYFnysSM7g1gf5BQOKXc5UauY/M=; b=cWDSBU+Dn8ij3a
	LN8kyxclsMGbGLT/b890wveS2lA5bYgrvQ8bXr2ZhiRw+lzLWoXmQy9tNIjq7bj4wjphFVhGZ7JSr
	Kdzx4SyR9YLsfunAOeRWBRMmcCMMM1nWVE31zGEnNsv1bY1Apch4MPsBp6Pqgr7TzNmNQM+4Dthq1
	B0dRO3pZ5A1wxVEKkvnROlwA3NzpDjZ7r573hhtljeo3knZyCzaPVdjXCE9ck497fmhtFGyr9fj3J
	Lu1OrhRlov1krc/lNIkgycJpmU86Ao6Qt6fwkpt867vXLgka4IHpK3nN+W0Oi15l/WDzuh7wHKz2z
	n3ro1Wk2eAjhAYOwVAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywDV-0000000EEnt-3Tvs;
	Mon, 22 Apr 2024 16:08:29 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywDS-0000000EEmj-2LhV
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 16:08:28 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5acb90b2a82so3056731eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713802100; x=1714406900; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bMyhnDCrHyV4qyizjWenu586ccID3T1Re44yDyknMgo=;
        b=nNkW0gBg0I34vn36tZ5ZtPOVJd2/MrRd7MlUZbBs4oWnFJSKekwYDS4aiMYbTkgltD
         40lz18TFSlfl7+11kSXpLEMA4ou/jyuylN1XoEgkfGGKfE0JLZFV55DmQckZBaMP6ZPl
         haQysyVj20qh3jN+LX2ixtvPZ0FiOLAKhPl5uMSO8+cR7CPJaICAboh4q+XP/SI5hBUi
         woCh3t4U2nTpkWd3E8gOcCBd3WpQIYlwT0LdeB12bNetxuytJsV4e4wC+LvEi/IFOuAd
         BcxDKlIROgdBLf60yez+PCNVitS5tHZxVZiWTLWBCzAsbkbrhBM24H2+X4UN5dc1qB7V
         xCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713802100; x=1714406900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMyhnDCrHyV4qyizjWenu586ccID3T1Re44yDyknMgo=;
        b=QwM0IedyKG40aMzyDZ1UESVucaRnppLWa3LpyLAgj3XGmt9+Ls96o7rcK1jZbJ9yiX
         Pc8umT7MyY9KRHjhN+wlQPp70aQF30gCQ0p3aLhfYuHzL0lWjTTP0RRBGe7yVo+9PcLA
         ccxrKP5opVwRcuEW6rT/QrSBeKpsBWoCZVN6n/TkPpyrLjsqq6D3C9dzirhaFuXXNR3h
         adnuLgrrbFJHG1zBM0sOD7SYoiHwO4jiM6t+ytEANXhagPCGFxoNpWsVC9Yf6uC+ho3h
         l2HB3BYEJfSaDDxk8IKe7JuCWzsEvOgWAgefsykGWUdrrQVSjgLD45cWLHIVhBnwrrRU
         Z6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV24GS+E/ZmihwPticUXmghf9oMIDPawm7GjB8ubg24klA9w73EMnQq6nKYem0WkEiZUfxFzswql1H5IZhvvmuQEQiZPMxI3Ua7rcdf9suA
X-Gm-Message-State: AOJu0YxREagc1Hp+xf443fl2FKcQDhUgO2+ldplipuUKccN11mqEkeBG
	yYQjJeI/hDlg2r4pLtr8OdUytVEgJliwKPSlYr4eNsxlL4YIX+OnMSxJKk0hHMc=
X-Google-Smtp-Source: AGHT+IEk5jms5r3rvB1qzw8YQ+YVRly/gMNB1pW+j4Ieau6IBs3d3/y066TBXoaCbq31F9igsdhObA==
X-Received: by 2002:a05:6358:78d:b0:186:2852:a923 with SMTP id n13-20020a056358078d00b001862852a923mr11995590rwj.27.1713802099983;
        Mon, 22 Apr 2024 09:08:19 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id b24-20020a25ae98000000b00db41482d349sm2103941ybj.57.2024.04.22.09.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 09:08:19 -0700 (PDT)
Date: Mon, 22 Apr 2024 12:08:17 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: enh <enh@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Clarify risc-v hwprobe RISCV_HWPROBE_MISALIGNED_* docs.
Message-ID: <ZiaLcRimjNY8F0sF@ghost>
References: <CAJgzZorn5anPH8dVPqvjVWmLKqTi5bkLDR=FH-ZAcdXFnNe8Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJgzZorn5anPH8dVPqvjVWmLKqTi5bkLDR=FH-ZAcdXFnNe8Eg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_090827_029406_2BCAC848 
X-CRM114-Status: GOOD (  19.99  )
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

On Thu, Apr 11, 2024 at 12:18:25PM -0700, enh wrote:
> These only tell you about scalar accesses, not vector accesses.
> 
> Signed-off-by: Elliott Hughes <enh@google.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst
> b/Documentation/arch/riscv/hwprobe.rst
> index b2bcc9eed9aa..239be63f5089 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -192,21 +192,21 @@ The following keys are defined:
>    information about the selected set of processors.
> 
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
> -    accesses is unknown.
> +    scalar accesses is unknown.
> 
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned scalar
> accesses are
>      emulated via software, either in or below the kernel.  These accesses are
>      always extremely slow.
> 
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
> -    than equivalent byte accesses.  Misaligned accesses may be supported
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned scalar accesses are
> +    slower than equivalent byte accesses.  Misaligned accesses may be supported
>      directly in hardware, or trapped and emulated by software.
> 
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
> -    than equivalent byte accesses.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned scalar accesses are
> +    faster than equivalent byte accesses.
> 
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
> -    not supported at all and will generate a misaligned address fault.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned scalar accesses
> +    are not supported at all and will generate a misaligned address fault.
> 
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> -- 
> 2.44.0.478.gd926399ef9-goog
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
