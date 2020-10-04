Return-Path: <SRS0=yqZG=DL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB75C4363D
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 17:28:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DDEB206B6
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 17:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iGZ6JETp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="XzvA1ibY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DDEB206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=gd3mUhbw+pPRSSFebFX3/Gu17HqSYMuxSQFUA6czJVA=; b=iGZ6JETphM4nx+CA6utojHInr
	sX/Z78LQ30Cq6Zm8iTu9sv3Nb269YrbAkRCZGIValoddChsUuyN9bg+1+nh5wljkEojN3/sSnzUHj
	LtxO/PMmC5YF/xCbg1hz+xli5mfFcK7YfPBHGUq8KaTSzNJtzEV+yornScEWLL49ynJ7z84jy4f1P
	kwsEGwYN1o5JZ/M9q4drA9AzENW0BAEhEqiYM2g37sLlo4wbgS7oOkxM8MH5NKoSfSqKqkmgsthsY
	/fKQZbZBxRLmMseYrk0K8MGncALbr5EmTEAnWZd7bsG0hWcSH9Tf8mhTPKSLfLEI2AP2jRXFdDJ+X
	DFk07bf0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kP7ne-0005Pf-B3; Sun, 04 Oct 2020 17:27:54 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kP7na-0005OO-Fx
 for linux-riscv@lists.infradead.org; Sun, 04 Oct 2020 17:27:51 +0000
Received: by mail-pj1-x1044.google.com with SMTP id b17so3864017pji.1
 for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2020 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tj85vc+tFzKQ8Ts1wgqekj2S97wfjTOBg845eefHhNk=;
 b=XzvA1ibYwKJjhuT5kV/gBCfVWaqWGosfZel3llNCYnpQOhIwyifIfQ8jyAzGMCIcmz
 IXTW5yCQRCQ2yNTHAg7p09RQDe/XmI4dzRB2/fGwR1YO26n1KCD+Y278Fm7nYK2uvkYq
 BnVLgkcDRg4Qk73FZ1UcCv1xE8xXDkPncjHn244CzbcWYTd+uPWiIW8uqjWy0tTLLWpP
 mhbXT33DK5yrAgz0kRvpl+10PFWL6PP6DYdEg0LSt9atD8Cn6f0y3vb0HuU6A9naQDHf
 7iM+AA6xDNobK8ePVCyQRSie1VOiOrI55NOMBapYv7yN9quU4/JsEqcKt/WbW81cjsZH
 CO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tj85vc+tFzKQ8Ts1wgqekj2S97wfjTOBg845eefHhNk=;
 b=mK2JSxW3qw/jsORvzhf5A77YnipdUW213/I9zB2j5jSz8VXQSdDXsc6ssO6csZ9sMl
 uamEPVYFH+haI1wnHaz2QR0K5gG0Hc+0NVpUoWPNomJ8yiT+Cd6o/sPliWtyOT0031Ww
 CW6bGP5Ae8MOLdrnUKPVlu8W4h0Hdjh94gmDaWR+7YUDveAw/NV5EH2yC6GNhBzdqdq0
 zmj21Q/EvERJaA6kRmAfkzQPed9FXnJij5NxfXVx7m1ll78rpG/LJJTimk9O86qYY8g/
 4eIg0ShuvrmVCzeLTmO9QK4UiYHOrz0qX/SP6cQwEG7rR1DtReo90zJSkYUVMehvcbvG
 yWeA==
X-Gm-Message-State: AOAM532fC5P/bpAgyFLnYOWW0rTzwVveCH+Xx5IRntEAFub5uGQMdDj7
 HrgefdIw4UlaXIWl+MEQx5G5hw==
X-Google-Smtp-Source: ABdhPJwj4IDhoydeLRkvglo0zKQhrjklU5j3+KfqxjL9fpv2XPSptrijTRwQ5V5iJTKPN9mcSPtL2Q==
X-Received: by 2002:a17:90a:5292:: with SMTP id
 w18mr13086015pjh.72.1601832466217; 
 Sun, 04 Oct 2020 10:27:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 16sm7810102pjl.27.2020.10.04.10.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 10:27:45 -0700 (PDT)
Date: Sun, 04 Oct 2020 10:27:45 -0700 (PDT)
X-Google-Original-Date: Sun, 04 Oct 2020 10:27:39 PDT (-0700)
Subject: Re: remove set_fs for riscv v2
In-Reply-To: <CAK8P3a3ONxXm_MWKn9BSswtLH3etVwOUh52NYoXpj032=WP0gw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-de10f104-52e9-4531-8d33-981b0692682a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_132750_563074_99DB9B7C 
X-CRM114-Status: GOOD (  15.87  )
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 26 Sep 2020 12:13:41 PDT (-0700), Arnd Bergmann wrote:
> On Sat, Sep 26, 2020 at 7:50 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> I'm OK taking it, but there's a few things I'd like to sort out.  IIRC I put it
>> on a temporary branch over here
>>
>>     https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=riscv-remove_set_fs
>>
>> under the assumption it might get lost otherwise, but let me know if that's not
>> what you were looking for.
>>
>> Arnd: Are you OK with the asm-generic stuff?  I couldn't find anything in my
>> mail history, so sorry if I just missed it.
>
> For some reason I had missed that __copy_from_user() change earlier,
> but I had a closer look now and this is all very good, feel free to
> add an
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks.  These (along with the rest of Christoph's patch set, and a merge from
base.set_fs) are on my for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
