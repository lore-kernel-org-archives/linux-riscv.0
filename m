Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA52C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 22:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2EEIhSf1v5p/krFX2qbNdbFptfd8K7880eLHRbljxKI=; b=DGS0wo3/2Q5zcdTUBeJ6pszFZ4
	JxG+gcyXIwv3HPVJ3q6LDQmwg30QlOXXkrGJGc82byOrelKB/qwpbil20gfqy5wjXdXHMHXqF9DRP
	VSH0Y86e5QVAr/FRwS1Ozzw/H9pU/OCtphCPS/v4Qhdd8lQQa1aldDXdNWYgIK9wvCu+NeGzqUFg/
	DULUQGcHT08hxKadbu2bTllU5fBW8OSDEkAh9p3C6hYoPoZvuupCYKPxowpUvS7t5nO8L9MMigAcN
	QBKmMAA2Wu84RcQHTxTQS7fCL5ODGD9gBoqc9pHJhfOJ2MIx3ncFL8KkZy3CZJixf3xmuO7mbKhCL
	v5XvOiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJKh-00FHbb-Vg; Mon, 06 Mar 2023 22:29:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJKd-00FHa3-Vq
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 22:29:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id ky4so12169331plb.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 14:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678141762;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6v/dxyavLz1aFpAiSmt8lqXZjxsbR0XXvhbxHk4HCc=;
        b=raUgWIxnnAFrbHyipMfm3neMx6EWucvpImMWcmV6s64JMe8na96VFed7BXiX16NG6D
         ELZSrBmRk6D53KDKSJJOgxAyhch6WHnD7akn2pdrEfbd41Ep0QrKG/R79e3xckvxfVgt
         25JpBzIqGntlVh1GYdpxF/fpheF0vW0qq8YrhZFXFWcgBYjIxCzeesIsesc7M2VpfdNb
         8F99/uSC8gCdaH7VzyYvBO/rmZV27MR3yph9u+GKC3RJ9UKg9tqSoTE0LSjllAShZy8w
         ovJSUT8/GZZiWgGimp8gSyfzXBMSO1S/jWCyx1xn7rA6fmvMqhllhx0ZIfg/MM3MXRa+
         1Mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678141762;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6v/dxyavLz1aFpAiSmt8lqXZjxsbR0XXvhbxHk4HCc=;
        b=i/GiWyZeIccCUxT05Qg14FOInqlRowC+hme2eDI4DzxLwKFCyBmR8AAqmuxzOhkKGr
         ZxCUKT8rVOPNpoNnT8jGM7yr5akCgUmq6ICkK7pCL6wW5a/8nv47OVkKKBT+4XP+7b5g
         RmmRv+OYCelI2fgCFtHULoSBrcQSsOQkg66PC2NdF1hZFE8P1njWUSRFKralF0jw0p1o
         4y8N1YIAhtIrfmGlAlkTQ0LkbvcayLBHjZPrRYD0eEkWUE/rHeGw149sxysQI8vtGHgO
         DJv0B6oZ7Bz/9ffYrudy3FQnXgpGmV+h6Zby3g5tLqlFWjMkZ0ptAkunUMG07b/DjWL6
         KJgg==
X-Gm-Message-State: AO0yUKVuY7+SIjYtF/jyVgNA9Rsu459G6nCS0cbeYMIzjpnWtc8RxvfM
	idt25Ke/tJ3iYI77t7Uv0aV45g==
X-Google-Smtp-Source: AK7set+ih/AJFfbVvSaYJDPFgE0Em+vhUav6ZHgNMNlbRO6lFb3JcQdzWha4SnZVstxiA4+5WOLXIA==
X-Received: by 2002:a17:903:247:b0:19e:6ffd:a310 with SMTP id j7-20020a170903024700b0019e6ffda310mr15872531plh.48.1678141761902;
        Mon, 06 Mar 2023 14:29:21 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090302cc00b001992e74d058sm7251876plk.7.2023.03.06.14.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 14:29:21 -0800 (PST)
Date: Mon, 06 Mar 2023 14:29:21 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 14:28:33 PST (-0800)
Subject: Re: [PATCH v1] RISC-V: Add basic support for the vector extension
In-Reply-To: <20230306222321.1992900-1-conor@kernel.org>
CC: linux-sparse@vger.kernel.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, luc.vanoostenryck@gmail.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-ac1d596b-0748-4dab-8161-80c8d5537db2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_142924_256607_9D905A94 
X-CRM114-Status: GOOD (  22.74  )
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

On Mon, 06 Mar 2023 14:23:22 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> I've started hitting this in CI while testing Andy's vector enablement
> series. I'm not entirely sure if there is more to do here, other than
> squeezing in the duplicate of what has been done for other extensions.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This is based on top of patches already on the sparse list, adding
> support for some multi-letter extensions for RISC-V:
> https://lore.kernel.org/linux-sparse/20220811033138.20676-1-palmer@rivosinc.com/
> https://lore.kernel.org/linux-sparse/20220811052957.16634-1-palmer@rivosinc.com/
>
> CC: luc.vanoostenryck@gmail.com
> CC: palmer@dabbelt.com
> CC: linux-sparse@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> ---
>  target-riscv.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target-riscv.c b/target-riscv.c
> index 8338d7a6..c8282814 100644
> --- a/target-riscv.c
> +++ b/target-riscv.c
> @@ -21,6 +21,7 @@
>  #define RISCV_ZIFENCEI		(1 << 11)
>  #define RISCV_ZICBOM		(1 << 12)
>  #define RISCV_ZIHINTPAUSE	(1 << 13)
> +#define RISCV_VECTOR		(1 << 14)
>
>  static unsigned int riscv_flags;
>
> @@ -41,6 +42,7 @@ static void parse_march_riscv(const char *arg)
>  		{ "f",			RISCV_FLOAT|RISCV_FDIV|RISCV_ZICSR },
>  		{ "d",			RISCV_DOUBLE|RISCV_FDIV|RISCV_ZICSR },
>  		{ "c",			RISCV_COMP },
> +		{ "v",			RISCV_VECTOR },
>  		{ "_zicsr",		RISCV_ZICSR },
>  		{ "_zifencei",		RISCV_ZIFENCEI },
>  		{ "_zicbom",		RISCV_ZICBOM },
> @@ -147,6 +149,8 @@ static void predefine_riscv(const struct target *self)
>  		predefine("__riscv_zicbom", 1, "1");
>  	if (riscv_flags & RISCV_ZIHINTPAUSE)
>  		predefine("__riscv_zihintpause", 1, "1");
> +	if (riscv_flags & RISCV_VECTOR)
> +		predefine("__riscv_vector", 1, "1");

V adds a bunch of V-subset extensions.  I don't think we need to 
faithfully handle those, but we should at least set the right element 
type and length fields for V as code might depend on those.

>
>  	if (cmodel)
>  		predefine_strong("__riscv_cmodel_%s", cmodel);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
