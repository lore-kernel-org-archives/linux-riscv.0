Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EF7D637D8
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVfOz4EYDKgRjQScNwyv/EkdQxpCCi8kPTsM1gmWSLw=; b=KkmQCvyU7CgjUe
	nYz8o8S3hLC3iEimgZYuJgYzSo46VO/+HT5KRbKlSf9LGKYUDPRPawL1AB4QYcFNaJd1puRDarsY/
	UFHMfZsISO4tnP++2Sxf9BXVmuob7w2Ng5Ls0lzlXXEzXg5e8Rv6OWrtZSxtErb+t/zjzsQqQOkY4
	KU/b98n9I+oMyNjdcwCTX++DyPzUDFoEgTLlOHEWmMe48qA1Cy8vEDijBtx95iN35v/Hs0voQxh5V
	hAetad2mSu4CmERRDfTbTw+fjJpseWjA0DEbk9pZrTICWhEb0N9200+pMlXWpj7mC6fc36ysMJ3Rk
	INJDNEMI1bfN5hTwDtwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ7t-00000008d5T-3BLX;
	Thu, 14 Nov 2024 03:02:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ7q-00000008d51-3UCe
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 03:02:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20ce65c8e13so1046585ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 19:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731553350; x=1732158150; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3slBWyvgUqyrNTtRBU44b5VuzePQ2w/b3OOC87VCWo=;
        b=ydefqqCjbaN+26Dp0tlH91dlj3BJttVwhDy1cNSnSpaj7+n4qtEf8e6zwnuiIxsPvl
         Cp6RGOU2qMyqjc3jGggMUZY2m6MxTTeeOGkEeNyo8+s2LclO1zJ/HslKnaq7/LTfIT+D
         QR7JjfRkoD2JFrQaQDu4Pt/tD6vIpQa0pFKUTwPzqUlfxCbhcxNXSYqL/1yWLKonxa2L
         rTvg5oXYSv1ZGDHo2QDrvXsUYley2kPnPKgPh7Ui46gu4huJeeUgnFiIPmvsNfeSlyRT
         21e/CMdTzBrcf0yIF+vw0fUFmdHevo7cY3z5gfyOXpliChgPRkEySwm3MAhJ8mkmjlxE
         SwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731553350; x=1732158150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3slBWyvgUqyrNTtRBU44b5VuzePQ2w/b3OOC87VCWo=;
        b=RABEkGYZCqtBuezJd+QHGIskvHgEGH4a3UHmA2wtAEovcuTss1hU9RayP1RESUn4Fc
         IyimbIoQ8LCge5OdBoH2vIL9SQGEEQOwqw7TsIK0bDhubCYMqD5DWXL7K2bSD0MKOg/5
         A+RcphX8lXWQTCvmCoU2nsZ6ZEgHNRHsosLUY880HDalC8sCWnBdCAQ+oL/oGZoVsJPW
         rPXV1za+fqMkVTBPOqRHWyOY31tX80kZgFjY4oWnfhusPr84FRd46sMqFW67CLBhthl8
         W04QRe2CJIpHoqa3gidzZMa+bSb/s1dxrOM7Zt6fJqFoaE21xjCDWD6hOvq1yqQ4l22V
         AeYw==
X-Forwarded-Encrypted: i=1; AJvYcCXnUnyxXm+TVpsbhiZkHqbHsG2xTC+G6ESG6DYtFF3Yq0yg0Nhillnrmwkzi3LuarS4LYuKwTcwCRLrYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKKzvyQIbCTc5Lh2ayHYBGZuiLj4sfI1Fh0nkZRMHTE1zyAZ/I
	Wg76shGHmC2HVX/NvDiACv6dFpTlnuq09x2ZnyWsXBHnLhLmbzx0dDMPA6sBkMU=
X-Google-Smtp-Source: AGHT+IGfSosQZpd7ro/3P8ybXqRalEFqAIaugehdNVkBtjrErQ0ikNqH6xSPtSFBIgViM11iMSZkOg==
X-Received: by 2002:a17:903:2351:b0:20c:da66:387b with SMTP id d9443c01a7336-211b661df27mr59390095ad.20.1731553350082;
        Wed, 13 Nov 2024 19:02:30 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d06940sm706985ad.199.2024.11.13.19.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 19:02:29 -0800 (PST)
Date: Wed, 13 Nov 2024 19:02:26 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 10/14] riscv: hwprobe: Add thead vendor extension
 probing
Message-ID: <ZzVoQi6D0U30p9sg@ghost>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
 <20241113-xtheadvector-v11-10-236c22791ef9@rivosinc.com>
 <tencent_5B500856E30E1FB920B6B68D6315EE70CC06@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_5B500856E30E1FB920B6B68D6315EE70CC06@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_190230_898129_27F1B91C 
X-CRM114-Status: GOOD (  27.88  )
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

On Thu, Nov 14, 2024 at 10:44:37AM +0800, Yangyu Chen wrote:
> 
> 
> On 11/14/24 10:21, Charlie Jenkins wrote:
> > Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> > allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> > vendor extension.
> > 
> 
> Hi Charlie,
> 
> How about changing the name of the key from
> "RISCV_ISA_VENDOR_EXT_XTHEADVECTOR" to "RISCV_HWPROBE_KEY_VENDOR_EXT_0" and
> use marchid to identify what the vendor is, each vendor will have its own
> bit definition in this value. So we can avoid adding so many hwprobe keys
> for each vendor in the future.
> 
> I proposed a commit here: https://github.com/cyyself/linux/commit/36390645d85d1ac75dd71172f167719df4297f59

I actually originally had this in one of my first versions of this
series but was convinced by Conor to change it. The problem with it was
that tying vendor extensions to mvendorid means that it is enforced by
the kernel that vendors cannot share vendor extensions. It is possible
for vendor A to purchase IP that contains a vendor extension from vendor
B. This vendor extension should work on platforms created by vendor A
and vendor B. However, vendor A and vendor B have different mvendorids,
so the kernel can't support this if it is tied to mvendorid.  It could
be solved by duplicating every extension that vendors have, but then
userspace software would have to keep in mind the mvendorid they are
running on and check the different extensions for the different vendors
even though the implementation of the extension is the same.

The original conversation where Conor and I agreed that it was better to
have vendor extensions not rely on mvendorid:

https://lore.kernel.org/linux-riscv/20240416-husband-flavored-96c1dad58b6e@wendy/

> 
> > This new key will allow userspace code to probe for which thead vendor
> > extensions are supported. This API is modeled to be consistent with
> > RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> > corresponding to a supported thead vendor extension of the cpumask set.
> > Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> > to determine all of the supported thead vendor extensions in one call.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Evan Green <evan@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/hwprobe.h                   |  3 +-
> >   .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
> >   .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
> >   arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
> >   arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
> >   arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
> >   arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
> >   .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
> >   8 files changed, 88 insertions(+), 2 deletions(-)
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
