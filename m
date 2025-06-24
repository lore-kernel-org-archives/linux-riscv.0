Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7074AC7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 03:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPAsljutJHZ5LZoMYJCUjLSUFAXi3Z78/cq4HoNVo5w=; b=ZQtvi3uUeIROVJ
	euAc8gMwRlR4i6+Ugk4ZtgLSKa533w7F3GDXgrW517JuKmdONz8bwhX0slRGoJxuKnqiMUGyZO73V
	kog+0GxHs2QksZStAYpYIKgD1PzFheRKPZsz0mxSyX4ha49r9aJ853I2yfGimnF+T8yBd+Mcco8Di
	rZH/GPCnaCR+0AU60aroEaDVawAtpbQaID6Q8vpo6udGFLG5sOwb4dzLVht4PQHsMIQOEts0iuoNT
	3LQuzh0BgZyHJ8c6kmbJ76Oo30I6Mab6yhKk+pIAQL6t3ci2+AEMro3ZXXFvevAYU85DS/9V+sm3c
	AOhs9l0uERaht4tI19kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuFs-00000004XOv-2TG0;
	Tue, 24 Jun 2025 03:23:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTtH3-00000004T1v-2NXr
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 02:20:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2363616a1a6so39062325ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 19:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750731636; x=1751336436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5YqVdeSV0yOTW+tV5vI7yosNZnx86VsTnkNJEv82NrU=;
        b=jZT4VnRXBpAyS0qPwBV08aPYe9kRNgPTCcreKzKFuL09Fi49M4ZKIPRElnDFAHU7/N
         viaUKU8S9Q6zhrinFM5RSpOfybf9x12ruwFW8kzA+AvR359c1IV4jZGGRFC4otbRn8yy
         79fwynbF677QNyUgBJU+AYoXiehaKF1pdBtsy8SLV4aix/rVHCScv4IE9NLC50S8jfkm
         XgOHoOAdKmUEX6OBmtAYb93KlHm9EioRGSqeUUih6An4TIKEUDhMm0XhLInLrJZsWZU1
         M+qpbeP9iusqg7wkukkPMHaOuOLF9BukwEQddPvY+j4GN8iKcpuKWuJqNODns7xX1/Jo
         LFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731636; x=1751336436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YqVdeSV0yOTW+tV5vI7yosNZnx86VsTnkNJEv82NrU=;
        b=Lv/90MpjTdb8i0LkdJekJuAIImUx5E0fiIy+aSl+EACSjy7pltbQPuCzKV7UmgkgjA
         mjR3e2+/zb0UCt6aSJCJXHpGSvSj+eptL09q0uaHEPL1+sp7hUVnCdDdta5xuZMzYfsc
         1+tGpytgXdStmClD1n63688Fa0xhEmFgi/qL5bgB8L4O085mll+PYsDPgqVfb3chPvlZ
         yWyWPNofVx8B1duFJGmEYal58gWp5mxqqdR1LOWUkJLUZn8B6CrroHcIKZGPTiE63QKi
         AWqDvHFD7Z5AueADEfqBB8C0YRm5ZL57wryagYxuDkmBmaJfO2MR6TDka/43R1tBr0SU
         L5rg==
X-Forwarded-Encrypted: i=1; AJvYcCX5HPzdWem4422V9Yj7c+ilA+ERUDG3GZRdsnR9ul+v0EAu7ayJCjo9CjrEuiMzUF2FF9TZlHSvSKNjLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw54IAAb588DgA+/rGk0fOp8VQI4+qK0ii3sW6leuoUK51LfE9b
	xy5dVnCkjsJ7cFeswjqa0P0kkPdVx6K6j3N4bzb+5c/1E+cXbsY1WX00Ig8KgwkeH0alNCicpxS
	jlGft
X-Gm-Gg: ASbGncsJoigfSeF842A0to8Wn00/mHjVWUVbXujmRMcdW/6slFXfnFm+B1acjhzMneJ
	NhbqoS2jiaHETgPFKanIWfd1H3Gkmei7PhoW38Wn0+cnIKiW3odV1vmgqjVufh2QXUH/NXkJTY7
	K52VEYThVWFEb5GNTzfFNKsLydkfD07O9aLwHwMM4mRrk3CqwkK/GksVbNuR/bZLmA5659tLcoJ
	hQ8vQM1M5kRDQ1PUjpFtjacR5FIMsHdbnmX9D2JWXSpz3lVovCxz6yqijFsaZwDk5/nCXyR7NQ4
	CnqhmrTw1GYDAoBJhtNFazGGZcD5or5fJhl/PEsfZ5wzPvaB+OQTrGyFDs6aGeUwFtqRYKo=
X-Google-Smtp-Source: AGHT+IHyunaVzpaVTgpP8rtS1XwQGBgASYHgCt65eo0OoSZXisCWYihwbZr6I/seC4YSyVWxsSsOzA==
X-Received: by 2002:a17:903:4b07:b0:234:8eeb:d834 with SMTP id d9443c01a7336-237d97fbc8fmr238805655ad.16.1750731636356;
        Mon, 23 Jun 2025 19:20:36 -0700 (PDT)
Received: from cyan-mbp ([136.226.240.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8608efasm94216845ad.133.2025.06.23.19.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:20:35 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:20:31 +0800
From: Cyan Yang <cyan.yang@sifive.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: Fix sparse warning in vendor_extensions/sifive.c
Message-ID: <aFoLb21xklpZoOzk@cyan-mbp>
References: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_192037_624038_3EDE9C06 
X-CRM114-Status: GOOD (  19.12  )
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

Hi Alexandre,

Sorry that I missed this patch. 

I believe there is already the v2 version to fix this warning at 
https://lore.kernel.org/lkml/20250516030310.16950-1-cyan.yang@sifive.com/

Regards,
Cyan

On Fri, Jun 20, 2025 at 12:08:11PM +0000, Alexandre Ghiti wrote:
> sparse reports the following warning:
> 
> arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?
> 
> So as this struct is only used in this file, make it static.
> 
> Fixes: 2d147d77ae6e ("riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp@intel.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/vendor_extensions/sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
> index 1411337dc1e61aba0b844902f356625048c85abc..8fcf67e8c07facd1bfdbc0e18dd9b43102f22145 100644
> --- a/arch/riscv/kernel/vendor_extensions/sifive.c
> +++ b/arch/riscv/kernel/vendor_extensions/sifive.c
> @@ -8,7 +8,7 @@
>  #include <linux/types.h>
>  
>  /* All SiFive vendor extensions supported in Linux */
> -const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
> +static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
>  	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
>  	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
>  	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
> 
> ---
> base-commit: e10a0dc2d21fd742c8d6ba042a98c05815011f9d
> change-id: 20250620-dev-alex-fix_sparse_sifive_v1-4e130e7e2833
> 
> Best regards,
> -- 
> Alexandre Ghiti <alexghiti@rivosinc.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
