Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E324C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 17:32:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB30922450
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 17:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RY1ORlKu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="s61LyeHx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB30922450
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=H9kFkz6It98FxQ228QexvYnfwxI4BFDFX6eWx/i+zdo=; b=RY1ORlKuIHgr8zFX4FPVTh3Mi
	R3Be7+MRqkZn+fZSXSsBJ5KTzQqC2U1J/0bmTDQWifQ+/2T9Y0Qc1s5N3qS4Dw7BKE8ShstUjlG8p
	cBqfBBZZUXEedRQnm3AtrfN6Egt47Rn+Sl4C1yMqpzAEDLEWKiNiVHSdKImWC3T2vtg1rhU618LIb
	S1hkdD9s64+mF0mNh8JKlAFH/TIt5/syUyLIGzZfYv3F4XpXwctUJE1khf6PeaFOwgfgJW1bE0F0W
	6kPwNA7KnvC3YmNm6h+4y9mcJe+YYXlg9JLhOkiUbpmj7L+rKiUcfwgUzRc0CAdBiwH9mMef4N5K8
	YrqQIN0ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvOnH-00089P-M4; Tue, 14 Jul 2020 17:32:39 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvOnE-000880-Iv
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 17:32:37 +0000
Received: by mail-pg1-x541.google.com with SMTP id n5so494025pgf.7
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 10:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=QoBje5b/NmuCH8o43ocVMZgnOX9gwDN8EjpWPtaCPEg=;
 b=s61LyeHx7aYK+1uQWhnB7wsqDmJK2BJAHKu0a3D/YyIBits6T11Ed08Dh5RHiwmHxR
 jv4N3r6BuoDOFuoKuPH1sb1sMmTlD/iycyDjAJRugMLCsG6xhHbL9e3n9JJ5b3Iyyqdx
 Ab4QB3HLbX9Ay3zjzjwAOd4Sb7gPLBbSRl3UILLHpbZ06Uu83CWwwe07BBeCwFx4M4MT
 8lyslow7f5kZayZALIISgU96szKwYiX2CaH7YiZ6QmHZzTjfoVhr89jOHG0UAnGNCEdn
 ZD2rGdMwNjXarkhJyWyPWswRzMXxjcp0lVMd35zmU+T1cnllQHUkYmGncymyn2iQy6c/
 24lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QoBje5b/NmuCH8o43ocVMZgnOX9gwDN8EjpWPtaCPEg=;
 b=rDsZxvGFjmXI9PDWcT4CI+PRb2h6tQU2PwE8SIQaMJ5LFRewE/j+LJl3J6is2yAJXZ
 UJwTPiRE5MINq43iY3SsNsOLsNeiTg3732u2z75QavhH/iOJjVvHBu4tIPTVXooEUdMF
 UblGXFsiIMwAWE46rwWBNojI2BSpj+5X2sdiDlbrvO66s88uzbDMsrA/8LXO1Q3GZh8z
 CF/8S92D/g04BHRxQcLH9b9hdIy+ItfkSDQHNnoMw+FUaq2QaQUr5jmP7RsOWJdzeEfk
 y10Jd1B/c9FPrFY1guPrWgOV742PlmitQsrT+84r8KMUpGxMYSD/kM6Zum6zQu5CRJ/B
 qu3A==
X-Gm-Message-State: AOAM530RJPnLvdwrgrPWwNXnD04nrOuZXos2oGx4DjhLCn99ydQH47yG
 wxBHu5Tuyg4F3E+EoF7waVkYhQ==
X-Google-Smtp-Source: ABdhPJzt45nHU7tWAPbDQyJuKtV2mV3A76dj9LEA0Ush9k4eEUq77PjJXQZBVR87EspR6vxQN5X7kg==
X-Received: by 2002:a05:6a00:5c:: with SMTP id
 i28mr5361924pfk.274.1594747953909; 
 Tue, 14 Jul 2020 10:32:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j3sm17081668pfe.102.2020.07.14.10.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 10:32:32 -0700 (PDT)
Date: Tue, 14 Jul 2020 10:32:32 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Jul 2020 10:31:17 PDT (-0700)
Subject: Re: [PATCH RESEND] riscv: Fix typo in asm/hwcap.h uapi header
In-Reply-To: <20200703134911.4006-1-tklauser@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-c6c7ebc7-1eb5-49bb-aa60-7375c918fd33@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_133236_800058_9D7678C3 
X-CRM114-Status: GOOD (  17.23  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 03 Jul 2020 06:49:11 PDT (-0700), tklauser@distanz.ch wrote:
> s/userpsace/userspace/
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
> Resent due to infradead.org mailing list issues.
>
>  arch/riscv/include/uapi/asm/hwcap.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
> index dee98ee28318..46dc3f5ee99f 100644
> --- a/arch/riscv/include/uapi/asm/hwcap.h
> +++ b/arch/riscv/include/uapi/asm/hwcap.h
> @@ -11,7 +11,7 @@
>  /*
>   * Linux saves the floating-point registers according to the ISA Linux is
>   * executing on, as opposed to the ISA the user program is compiled for.  This
> - * is necessary for a handful of esoteric use cases: for example, userpsace
> + * is necessary for a handful of esoteric use cases: for example, userspace
>   * threading libraries must be able to examine the actual machine state in
>   * order to fully reconstruct the state of a thread.
>   */

Thanks.  Looks like this one escaped.  It's on for-next now: while it's
trivial, it's not technically a fix and things have started to settle down.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
