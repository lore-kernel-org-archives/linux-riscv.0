Return-Path: <SRS0=Os/g=AS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A740C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 09:33:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB512065F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2020 09:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmcyZpGF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jdmRppII"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB512065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7ghzA7D9ztD3/ftBgsEtQ7bIs00iVFNBzHfO+YAkRA=; b=YmcyZpGF9XHm54JaeoGz25NRTu
	2+uV/GBLpxChqShwWhZFuJxX8IWANzXFluWzPBKP/gIKZjg0VlZlzAwITk3miwNh7dIlzp8mB2yvJ
	XFefCKsstwFLcIZi1+3Uk12WaBPVgSex3mVsJfODlhSqIEUpJOXlJxKD38twcYYd/kH2RHMQa3dQ/
	b1lbERM+IORJtvS3NDWPMaEDDCiZuhc+xUfcR0hKo8HzHxDP4pd/mi3LLjAlE3nrsJGZIIj1EuWmT
	CQkuKbPIWBoyeQvhf/s7vwmnZ6fevT42akZyjfkiDGXZvvSkof75Tv/PSNJbXR9R1Te0xHCzoe4m2
	ATzj6Viw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsjyB-0007zj-6b; Tue, 07 Jul 2020 09:32:55 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsjy9-0007zD-Ez
 for linux-riscv@lists.infradead.org; Tue, 07 Jul 2020 09:32:54 +0000
Received: by mail-oi1-x243.google.com with SMTP id t198so21817042oie.7
 for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2020 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=UfuIz4UHBMOwSxX1pJVc5YXivVtB5zjr8vmw0wj96hY=;
 b=jdmRppIIVdsnJlbD/8XOFXCflBAVypl8ziuHJdOlL3dIlATUfGDLUbXYFmanXFZVLV
 Tqd7k4K1F2R1YuWJPp71Z76qdEHlyfRWH7niBZiiGEvfNxv4XdSZiYBW3G/3wKq3DFzY
 62so5j0QN+3PyXJ09luDc5ZClhOEF8/BB58+wJlL4cgCocSxZz0T9Uik4uA826+RB0d7
 UF0/tBPLrpEPnfEA3scjKK6/By0DGz/tA+ljQyJKC/GVyt0jvP+BIVDZkddeFnUp1CS+
 d6lCBFU0Oz7itQuAtG4CQEIfkkPBxo9AxltHqVsVGBNYs/Yr797FUUIklumJKTnZStoJ
 nvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=UfuIz4UHBMOwSxX1pJVc5YXivVtB5zjr8vmw0wj96hY=;
 b=ZsS1XHluzquFw7r6AuzTosrm+xHfSvlhc2JUp7SGTQMkQWo/BCn45bIIW4USCwa8xN
 vTZx8LNydWjw9Uw1TA0x32Vl+8GF82zD2cqUhs5gFFMDbul0fI2owFaSnXaWY1toKV5R
 MJR6OQ/rfv9lQ4iAsWFtcou6LQl45jQRFzkLnz+YIKPrBYnIcQALKUAVYS8MU/Xhp6DZ
 IYJhgr7ir88CvbY2ytDcvSXZYUzZc+CInIu1yWYm/AXNHgFQ9reAFU71nInqZytSvyMp
 5w/pjbxwVPA4fY/cSbZfLl9E2wXVMQIR/m1EpgcCFJC7YrrSrcpOauOluHXE8XhLPtyt
 SK1Q==
X-Gm-Message-State: AOAM5328vk53sjNJ/8Qe5Y9C/UIunpJeFZkBnY8HDeHE4xrFjGSwkyPV
 3tuIXRz9urQVm6wyhtfxTkeAiQRA/jQSk8yPGpW7CUCxcVg=
X-Google-Smtp-Source: ABdhPJz8mqzxYcSmj/jhmer7OTlkiPFwvqhO0vJBWKRwUhaCLX75N66VSDBFxEtVZltncMMmiESeoIizW8L+lU4/n2Q=
X-Received: by 2002:aca:d509:: with SMTP id m9mr2402280oig.116.1594114370298; 
 Tue, 07 Jul 2020 02:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200623080238.122973-1-zong.li@sifive.com>
In-Reply-To: <20200623080238.122973-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 7 Jul 2020 17:32:39 +0800
Message-ID: <CANXhq0o6LwkJRrxMXNK5MO9w0CRhrqdtc8+s8pnHPvhXTiGKgQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_053253_503888_086050A0 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 23, 2020 at 4:02 PM Zong Li <zong.li@sifive.com> wrote:
>
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
> +#define AT_VECTOR_SIZE_ARCH    1
> +
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
> --
> 2.27.0
>

Hi all,

I put this patch into other patch series. Please ignore this single one. Thanks.
http://lists.infradead.org/pipermail/linux-riscv/2020-July/000882.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
