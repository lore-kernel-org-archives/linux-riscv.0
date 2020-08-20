Return-Path: <SRS0=ioKI=B6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0265EC433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 20:45:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CFA2076E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 20:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="maNGBTjv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="yoTD1RCV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5CFA2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=VmJsWuEsI9Iz/yVoz+oR95stQtAO5cchBojKtSob9h4=; b=maNGBTjvZryaKshdAO6MiT3C+
	RXWnSNZYnrjaCfN2km33TVsMfICqP/Y29zWzXPC56PgwLJf4aeIfRCR3SmeAoPX4sAx/PSVmgVR04
	4AOnXk7h24Xpo3bnA2thjU8uZytS8kyiAuuQzpQiKeYphTM6yIG7J8DcpTQ2Nq+YdczmC/bBvQ2xJ
	qgIrF5NeWh5xTkNlM2FKeMAI1TtvoVGEwO48Rv/nG5TAOVY0+zj1gCCkl3DCPVpak+qrO1a5ELc2E
	IYyHkxlg9u24dqWs+Vwc7AK88HGJf4SQe8aXt1WztU37JABshUVElvrQTOQcM8B8/hifpYhvSzOKm
	/xRTtV8dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8rQk-0001TD-Gn; Thu, 20 Aug 2020 20:45:02 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8rQi-0001Rh-Cc
 for linux-riscv@lists.infradead.org; Thu, 20 Aug 2020 20:45:01 +0000
Received: by mail-pl1-x643.google.com with SMTP id bh1so1461900plb.12
 for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2020 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iJ1OwKtfZUiEaD/By8wQCQJ5w4e+/SuoDaxAh4xoYIg=;
 b=yoTD1RCV1vQ+E9mi6aZ3W407bzZWfiFsU7FTJ4JPtTnONQn4f9iOFZ8bK7ZnPq/5Bu
 /Pus5dwVh2RwQ6mMY8VSw79RTxgfzkNYEmSmPDfl9MTZb+HSAij+Y7mzpix8E9V1Fcjo
 rXAH27XS+u+JMlv48olZhaWJWoIzqChgv7iEI1SMDYfHpsLWJwtitCloXQYdRaugj9t5
 7K1Bp45M1URaVAn0tKzthyVMtybdaFJH2ajjBMdMKICJBxrmmgnUWp1Q8qowvTjO0mc4
 BipR9JGXVwndjolDCmb03ySdE084egC9UCfKafA+0+PdSHHYK22LpzPdqukEMw0A2aY+
 Pq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iJ1OwKtfZUiEaD/By8wQCQJ5w4e+/SuoDaxAh4xoYIg=;
 b=GtT6AL7vqhrOvrdt19Od7cgBkdIpRm3I5Y1Atpt5MRIsL+fJ9Vav2WHYUuRFvJDd/B
 2++ovcZC7BxejZ3+q8urQDduIPdpWHQ9EWgmBx+YxQCdlpYcIZsKhsZTwDX2uWX1qbaH
 AdfsveHJo2Q5Pwz+HvfL14ku2gDLQTgcEMuquwBpo4PoymHNqJx7SEdbY2rH00bU1ZbN
 iOlcB5ZYC8JW/7YvV6YEPrdDCVy8RBgdqKzxzgSjyVY/BsmLuK+VY1LYe5kt+B1WrNHz
 blQ1YVn+pJfrqJqNLiq4PMUmgMYi3L//joaWyw+VUk/luwPeKTd5LUngNynJ+7oPFQOW
 OezQ==
X-Gm-Message-State: AOAM530+XwbHkIQ1bJ9bWhlulF3cDoIvBmJMKhxYy8MMAB/92HkMKdpP
 nktodF4CoCVEM0Iu2H2pBhYPZQ==
X-Google-Smtp-Source: ABdhPJy7KEtP70xiQ5oHihQRcs/deZzjjA98uzS2A3WICdeD6f4n9pYW0wwgjgjxgzlGT0SgVH1HJA==
X-Received: by 2002:a17:902:7d94:: with SMTP id
 a20mr135796plm.174.1597956298185; 
 Thu, 20 Aug 2020 13:44:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u15sm3011247pju.42.2020.08.20.13.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 13:44:57 -0700 (PDT)
Date: Thu, 20 Aug 2020 13:44:57 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Aug 2020 13:35:38 PDT (-0700)
Subject: Re: [PATCH 2/3] riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
In-Reply-To: <25223adbad5badb3cd0000df078b407bafc129fd.1593766028.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-81da4508-59e4-4b55-855a-f7d9c31ced50@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_164500_442181_8B17AD33 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 03 Jul 2020 01:57:54 PDT (-0700), zong.li@sifive.com wrote:
> AT_VECTOR_SIZE_ARCH should be defined with the maximum number of
> NEW_AUX_ENT entries that ARCH_DLINFO can contain, but it wasn't defined
> for RISC-V at all even though ARCH_DLINFO will contain one NEW_AUX_ENT
> for the VDSO address.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/auxvec.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
> index d86cb17bbabe..22e0ae888406 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -10,4 +10,7 @@
>  /* vDSO location */
>  #define AT_SYSINFO_EHDR 33
>
> +/* entries in ARCH_DLINFO */
> +#define AT_VECTOR_SIZE_ARCH	1
> +
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
