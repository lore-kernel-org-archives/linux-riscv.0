Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194B2C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:12:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD1AD20724
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTsmS7Sc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="e5gRGjrM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD1AD20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jg5p0ENdQNkw1eylAloi8UwNk5Wj+MRdIVrcn1B7DTA=; b=PTsmS7Sci79fidimMamIdGyk9
	i38K/jZeYJ16wWTeb3JpGyod5xlqBcY2DRAsJZvwFwJVVb6K8mPg/JZtZ9XbXy1hwFJTPZbFFUnT/
	pSUEhhK8bqwmpYEqwaJUKNYi6qRvyecKCLP0bV74xBG3vNLw36xhTGs3WACaXP99hObBe1Jvp8zhd
	af5knWra3TQiEiUR5ALnwTq9kaXAxTTYrjayKvMQwp/M2bUvHlDffYXo68ymj5S+1Sgfv0xM6XjaS
	eSVKHEe+OUm5WUfYkYNRQxWdccaVX4SYsFF8lePnWqo6BosyUR1YIjv4AnUgomTQK6gEF7q59wIk4
	qtaN364iA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomHa-0005QP-WC; Fri, 26 Jun 2020 11:12:35 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomFo-0004ZA-Pw
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 11:10:55 +0000
Received: by mail-pf1-x444.google.com with SMTP id u5so4510488pfn.7
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=VHp8B+oVk2RFnlPcsRAqRzTnzd2Xx4e1K0uOmjkl3Ng=;
 b=e5gRGjrMxIvK+o9bipqjruuo0/zY3i7bPOHDmk5AwP0O3hOTESLbKBCPJEmbT5JEtK
 pp9ucuVuSXOQ+buOhyvqZ8hO4ThzSmhzJYRghKb01zgqrokXHwjW4J//zMvXZpUqugit
 v+r5Yp+JrktRlNq1SslO34NaJhNtxf7M/nC4a3FWQoJbEpWt761iOgw1gAhgiRyUkDQk
 6z98FpYGyjvGmy3gfxmQt7Nfjf04puonQ3tvbnevYKZ9rse88JkrUIrzgeJxsTgs2rgO
 zX76G+ZwTFTkaSbL90jnBMznNqWzlZiYZ8A1Rfgwkfah/d5Pc05Ag1zhevZtaeMulGty
 EQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=VHp8B+oVk2RFnlPcsRAqRzTnzd2Xx4e1K0uOmjkl3Ng=;
 b=XR4Xuy+9BzgcSQofr8TtGzJzKARPdiHBFJtlAZr/1zlV1JPWEuIFo0AoOvlrQ6SA1A
 tlefqkHzF8Pr5dWPvScI1DIbbTAAne0lHg2iaDANoXaSnw79SwSkAHL8O6aLme/r6TW0
 SawJXmyqWdkdIgcpT5o4C7M6Nti8fm5NmUfbJ1TfGiiNTqIF2IOxnZB9fbts61Vjpavw
 rFgNOvIB2g0eKom/8xq4prR1/XN3ltqLIaZVBWUxZ8xsimKgN9twQWBEKuF2rYGKznFX
 u5RVqQHWg3Pgp+3GSGpu7+F/QBVGMh5tGr3cIQvbsDcnuZM9v71m88l5BVulJAchBQus
 VyyQ==
X-Gm-Message-State: AOAM533iNTRWLQV+0ret3kxPdrqD+QGYV18iCJXaIYqvybbI05Kfex2b
 2mvGk5Brvz60wP5D/DcDRNAWgUqhAO3ywg==
X-Google-Smtp-Source: ABdhPJzbDoxoj5gWSZXv+ZmsMv+0hdalC96F9foR07lPSO2Hc+guCA+WHZ77O8w0UrxCsLIVQ3M6/Q==
X-Received: by 2002:a17:902:db83:: with SMTP id
 m3mr10617545pld.176.1593122535216; 
 Thu, 25 Jun 2020 15:02:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y136sm24206509pfg.55.2020.06.25.15.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 15:02:12 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:02:12 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Jun 2020 15:02:09 PDT (-0700)
Subject: Re: [PATCH] riscv: Add -fPIC option to CFLAGS_vgettimeofday.o
In-Reply-To: <1592874802-4242-1-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-7109baa6-a108-4914-a866-f4071df6a886@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
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
Cc: vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Jun 2020 18:13:22 PDT (-0700), vincent.chen@sifive.com wrote:
> The time related vDSO functions use a variable, vdso_data, to access the
> vDSO data page to get the system time information. Because the vdso_data
> for CFLAGS_vgettimeofday.o is an external variable defined in vdso.o,
> the CFLAGS_vgettimeofday.o should be compiled with -fPIC to ensure
> that vdso_data is addressable.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 38ba55b0eb9d..29cf052f6541 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -17,7 +17,7 @@ vdso-syms += flush_icache
>  obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
>
>  ifneq ($(c-gettimeofday-y),)
> -  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> +  CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
>  endif
>
>  # Build rules

Presumably this should apply to all the C files compiled into the VDSO, but as
that's the only one this is fine for now.  I don't know enough build system
wizardry to make that happen, so I guess we'll have to wait until we get a
second C file :)

This is on fixes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
