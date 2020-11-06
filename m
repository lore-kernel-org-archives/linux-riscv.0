Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1848EC2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 05:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC77208B8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 05:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pNGWZ00C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="kHPaqhNU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC77208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=EiS635KEKuvBXvyiksUfOsDIdkiegkD4syrVbav4F4c=; b=pNGWZ00CzzUhRtdceSAZoahOC
	HlMr7lGKCvCHTJihoE2258cPQyA1IC0jQH3Yk25HmBfQoXAb2wnq6bLO8JunkoETcyhRY/ZQK5TLp
	qF1uVO+STNKL69UahCeDsLric/4QPhRNPavMPM08O8DNejwplIIBUrAcxGI54TNYje7pTupii0wtJ
	n0m7DdVvZtM1aLBIEnTahcMVD0Rmx83p7U92lL86Q3/YittqquIDFn+9qNUlin6GG+GN5+gI0DAIC
	WLTPYvOluWJ/y67dsXvAe729b1i8qNT7Zw9gXipAducOeTFHKcbefD5gRjwOZOhx5ZmlZPuMx/APT
	tjXf0X7bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kauGr-0007Ib-3U; Fri, 06 Nov 2020 05:26:45 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kauGp-0007I3-1F
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 05:26:43 +0000
Received: by mail-pf1-x441.google.com with SMTP id o129so279957pfb.1
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 21:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EkQLhkGZHqpvuQT2CFN2+E1nRGoyf455nd9ZLIW66dM=;
 b=kHPaqhNUPrft4bDa8rGifjMcUdpz202rSSaV36nVs/Hru2LoPXEWCRkzDvufyB9fzW
 NSoIP9+mGKO9emMplFGwv88J9odD3J+C3hnsgl1EFQh644MZcr2/UFrxZQVSqpdOru1D
 Cmrl/jkn07BuKlQLVcijDNoSqnDsg+zhyE9lZE6A/7Ls/DXa0twaXKON0tk6fOzMdLib
 gL6msyEqIGKNhU5JC3o91m1M+BlvLluct1HU7J7JIrtMk9GwU22+beqtoLMAWoO4OSqQ
 OB3i+sdARPUIfQbirFuZ2Wep0ZTe9EYYEVKQCLpVY6L+cbPRusdhKmqOFesXtZC533pF
 /3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EkQLhkGZHqpvuQT2CFN2+E1nRGoyf455nd9ZLIW66dM=;
 b=eaYXDUTzR+xnrpBKyv6zsOEnNLQnfF6UCg8+R7p8AN0re3ArGlII3ZBpo5fnDWsT+7
 lIcsxtNUklgIpM3RmNObz0+Y/qgCLjPrlCw9zcJPOvd2LaRswq+kZlCdGhGaT/eXF8hE
 2190xoBSJXz+LJxyCg9+QJwCKZ2Rt6iiYp/ivuG01FfsKT0m1fwBSoBKakdSKEsJh8Bg
 /3aso4XJSoFON4vOpN3UTTOl7ID5Qldq+EVGXNE+6HqXFJafqOvzjWmCeyw16A0LywDx
 m748keU7LZxxBYIiyPdsxYUA1W4FX2sa8EhKRURqpS5QwPJfn9K32jqj2CpJF8mrNV70
 555A==
X-Gm-Message-State: AOAM530NenB+a2gb7i34di2aZQEWYMjPRAqu307/LHWr8imQ44xqHY6n
 A4byRu3eAcT4muXU4Wetz92/IQ==
X-Google-Smtp-Source: ABdhPJyX2PZV+nlWTOdRmguB30haDCamIKp/V4ktqSQVJ6fCG/rlsMyBnAkVJtH0MnxR2zUHOKWEUA==
X-Received: by 2002:a63:db18:: with SMTP id e24mr312795pgg.155.1604640400933; 
 Thu, 05 Nov 2020 21:26:40 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g7sm499742pjl.11.2020.11.05.21.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 21:26:40 -0800 (PST)
Date: Thu, 05 Nov 2020 21:26:40 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 21:26:38 PST (-0800)
Subject: Re: [PATCH AUTOSEL 4.19 28/60] riscv: Define AT_VECTOR_SIZE_ARCH for
 ARCH_DLINFO
In-Reply-To: <20201027000415.1026364-28-sashal@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: sashal@kernel.org
Message-ID: <mhng-2b910e68-c031-484b-9d19-5c845f9c65f4@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_002643_128349_BBB72A62 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: sashal@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 penberg@kernel.org, zong.li@sifive.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 26 Oct 2020 17:03:43 PDT (-0700), sashal@kernel.org wrote:
> From: Zong Li <zong.li@sifive.com>
>
> [ Upstream commit b5fca7c55f9fbab5ad732c3bce00f31af6ba5cfa ]
>
> AT_VECTOR_SIZE_ARCH should be defined with the maximum number of
> NEW_AUX_ENT entries that ARCH_DLINFO can contain, but it wasn't defined
> for RISC-V at all even though ARCH_DLINFO will contain one NEW_AUX_ENT
> for the VDSO address.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Reviewed-by: Pekka Enberg <penberg@kernel.org>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/riscv/include/uapi/asm/auxvec.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
> index 1376515547cda..ed7bf7c7add5f 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -21,4 +21,7 @@
>  /* vDSO location */
>  #define AT_SYSINFO_EHDR 33
>
> +/* entries in ARCH_DLINFO */
> +#define AT_VECTOR_SIZE_ARCH	1
> +
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */

Thanks.  This should have been

Fixes: 2129a235c098 ("RISC-V: ELF and module implementation")

which is essentially all the way back to the beginning.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
