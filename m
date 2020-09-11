Return-Path: <SRS0=K12s=CU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4719AC43461
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2020 20:55:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33DB206B8
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2020 20:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nzbhbTWV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Esc1QmdL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C33DB206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oRMut6NAQxd5dtqXnEqSvUiNDPZx9emcutXOAzjbVes=; b=nzbhbTWVyMNPM6vNgTKcMFr6d
	4j2bqG0J3foTxn4cqYbH/7K27FShONwje0RXtmb8VU+d8W0XHvWKjnwRtCTXTBeL0jwfk0MpVAoPF
	2y1f2HtjhPtwbEbXdvAs5r9KEoQ7r00A5TIQZGkgQmSWD/Ea1IaaYkhCrlbO5MSzx1JubvZcFg79H
	nLcxugd1Pucd8KMXglIfyT9G2ngpbQyRPLp53ZX1NeQbLSZJjKVZQ+p19KwkF+sNSfeCPltQ2GnEs
	e0ZDFsmxhaacNFmW8wxYozVjdMijHlmOLRi9yPKbGAniua/+vwIHdh4znKvc4hKEOdJ5OpYCPxfUo
	6ieInCV4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGq51-0000cR-JU; Fri, 11 Sep 2020 20:55:35 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGq4x-0000bt-UR
 for linux-riscv@lists.infradead.org; Fri, 11 Sep 2020 20:55:32 +0000
Received: by mail-ed1-x544.google.com with SMTP id e22so979099edq.6
 for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2020 13:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ggDeVKUI4NGl/o8mg/fjLzMDUrlaYtxa8WyaQiJ3Zzk=;
 b=Esc1QmdLi/6Qx3KaIAIQHQvS4P7JAMBYZoivizjNtvFSxIcRM6aFcTDwUlzVgp7zVl
 xZfGAKAd4+K5GljAHRzQZaFdXoJ3mXWzLg6BUVNC5gyMgAiISesnHGUQil3rv03vqihZ
 9X7HRf6C06TSG9WAVFbYL6tbU1PNR/YXoB7wnpZk4eTiYiC3BmLzfoVtp4823QwJRVGy
 eaH9FxHjNJs1R8UvvB+s3VK/CtgVkp/qRGS08ycITkIDCNI85AidVJPONdTdvj9S4zB2
 GnTXKALTM4Y5rXO3v+mJPh8qyUdYFkccTxHUp8gnLj1M9n1mnnvRXa1LwOjccbvfMbzM
 oRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggDeVKUI4NGl/o8mg/fjLzMDUrlaYtxa8WyaQiJ3Zzk=;
 b=aOs5h3nAL+rg/USt3pRo0RqctOWsWaNii63slqOb4SiGr25pIBC3Jgv/jq01KeIHtH
 UhyBYV2Q7FVv6Rizm1gLXtkdS3z4/BtEc64EVP1hD54hg31v+fPkSZEaTDAHhUe0Ybhd
 xQM0eM+bf91jYpJlGYCjbfJmmVr4BiUbSuq7hledJKgi/76G8diVoilwuJ0r01hxHjkd
 J18gvNrk+JNAyifZPZ2wJoXxTQhVULr6CDYZLuZK8pUmaLwz3Dag3BUguQS9JYXs1Tcl
 COGMtPLALNZ2vIYvyjGj+trd89arwSm9XTBvs3proOOzsEZnnuNC2LAJ7fPnNAIhW0Oj
 SlTA==
X-Gm-Message-State: AOAM532Eoqrl9asHlJy+ZkHQLEI0tCoXBJ89hSQKzrFxyvUV+NxEy1E4
 nJOUxM9WhoGv1xcKjLVt6fJKv6JA+bs=
X-Google-Smtp-Source: ABdhPJwe7IN3NAF7/5APCdifVHq2JNF9augUg+dt+qFalvnsfMz7Z0m4AuUDYm3aoMQVPr/iCU4J9w==
X-Received: by 2002:a50:84a2:: with SMTP id 31mr4534948edq.138.1599857729206; 
 Fri, 11 Sep 2020 13:55:29 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7fe:f700:e86e:d952:c3c2:494c])
 by smtp.gmail.com with ESMTPSA id q26sm2169824ejr.97.2020.09.11.13.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 13:55:28 -0700 (PDT)
Date: Fri, 11 Sep 2020 22:55:26 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH v3 3/3] openrisc: Fix issue with get_user for 64-bit values
Message-ID: <20200911205526.65llro2gnh7zlsu4@ltop.local>
References: <20200910233940.2132107-1-shorne@gmail.com>
 <20200910233940.2132107-4-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910233940.2132107-4-shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_165532_052227_C1409983 
X-CRM114-Status: GOOD (  17.72  )
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
Cc: Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 11, 2020 at 08:39:40AM +0900, Stafford Horne wrote:
> A build failure was raised by kbuild with the following error.
> 
>     drivers/android/binder.c: Assembler messages:
>     drivers/android/binder.c:3861: Error: unrecognized keyword/register name `l.lwz ?ap,4(r24)'
>     drivers/android/binder.c:3866: Error: unrecognized keyword/register name `l.addi ?ap,r0,0'
> 
> The issue is with 64-bit get_user() calls on openrisc.  I traced this to
> a problem where in the internally in the get_user macros there is a cast
> to long __gu_val this causes GCC to think the get_user call is 32-bit.
> This binder code is really long and GCC allocates register r30, which
> triggers the issue. The 64-bit get_user asm tries to get the 64-bit pair
> register, which for r30 overflows the general register names and returns
> the dummy register ?ap.
> 
> The fix here is to move the temporary variables into the asm macros.  We
> use a 32-bit __gu_tmp for 32-bit and smaller macro and a 64-bit tmp in
> the 64-bit macro.  The cast in the 64-bit macro has a trick of casting
> through __typeof__((x)-(x)) which avoids the below warning.  This was
> barrowed from riscv.
> 
>     arch/openrisc/include/asm/uaccess.h:240:8: warning: cast to pointer from integer of different size
> 
> I tested this is a small unit test to check reading between 64-bit and
> 32-bit pointers to 64-bit and 32-bit values in all combinations.  Also I
> ran make C=1 to confirm no new sparse warnings came up.  It all looks
> clean to me.

It looks correct to me too now at C & assembly level.
Feel free to add my:
Reviewed-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

-- Luc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
