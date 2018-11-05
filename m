Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1546C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:43:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FE0920685
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1xfuo9d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/XJ3n8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FE0920685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Mh8WqMlaRcv5MOgW1wi7Crg5eoNZlZYAAQI8oxnLSU=; b=Y1xfuo9dsm/+zt
	Ee97ZEYPLKfHohO27aHfLaF4uj8RlNKN9cSYKuKhizZkRsGxYOsXzv/tZpBQ01PLXbhngvUA/nIYb
	XQLr+j+0wny501+vWmpHl6cXj/Y+zaICHTM56mcefTOYNJk73p9Q4vHWnFOa03zDAM9pbwpnwQpih
	73iVDuHT44nR8am/J3ROAsOrDfjNTEwX/jfuvXlrj5UJtLVz30WJXzfPLfjrE2wO8YElDakjDuh+Y
	OEweSPUVkcFhpE0mwAnKuFJg2jgaGa7rln2lH7piPt2yIUuzfQGa3e2MbfGHc+jkgc0KZN8Qy5ARY
	PMNe9Jjo31oROvfcl+Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJg6L-0004RP-QW; Mon, 05 Nov 2018 14:43:37 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJg6I-0004QA-Un
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 14:43:36 +0000
Received: by mail-oi1-x244.google.com with SMTP id 192-v6so6874715oii.6
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 06:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pYdo10f32NckHCIXZEb68VSH/2Pa5G60hUJFlsrnFHQ=;
 b=f/XJ3n8o2Aqh/Fx+OqiA7cpqz1XKCPQdt6mbOZ/xUpxwrneVNbHcoNzYLsVS9rCXgP
 5sIp9k2qponHS5zmCJl/weh/L0h/OyGTFEklv4yAWqRRtpoWk4IBgaPolsR5yP8WOjMR
 PubERiTpzR5OR//Kch6CZkRcLWYE8UyUayDUQd+agZcXoqaap8rkeisfyFp4GYEYz3WQ
 +auUAkye7phgd5dljdOcng3SvMb+waIpVNQSQzFO0xxMwSnqewGLwSqfntjzW4tETJ8r
 kjGpD+onqmbBUmkGwsIEhfRsh2R6OfSOTvKmzzk8eOV/9MEBHSMifVo8GlOU02IvqmKy
 ceaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pYdo10f32NckHCIXZEb68VSH/2Pa5G60hUJFlsrnFHQ=;
 b=qDvaOqzY8bbA9+mVzkLjHAMF1bbg6wtQoR88OwFQwhdAw4OQysSJvZqw2zUVGXyLjI
 XFGFlh72T7ayGtdDYgzkjMNdEYQv+ETVvfSGvJGRxlzIsEZBYHVsA2e6vmK8H+lOohrV
 Rj54VjUtA6iYfq735RY3WX/wDXCzRr6/tXrbx+WsQTeV3IaUW/CUvRKPcEPnt6vxdQwp
 CjGnEfqfuKp98Zpr8nXjn0mfMYELsoABeuTd2NtzRQ7qgVQh9FjQyj529VQGj7Wru3aq
 u53pAzoZ3YMP8Cm2Eq+1cLb+GCzY1khm/V6Lv7d8ORzgnpuqARsnKrSpAtJuQ5lQLFN/
 lbJg==
X-Gm-Message-State: AGRZ1gKGO75aXYsugNy7ucDOS8yLP5vTHUYijDD5gLTPpUYrtvQZzRK4
 kP2II9WXt549IaQOnbZABn0JUT8YIwHitm5oLgc=
X-Google-Smtp-Source: AJdET5fuDisIvruPi3z1QlFMglbHL7OGue7AG051BWdUIR+hauk7fhlv5nOjeg7W5T0sx/IP2csPQXGioS/xjh9dT84=
X-Received: by 2002:aca:c1d7:: with SMTP id
 r206-v6mr13597415oif.44.1541429003665; 
 Mon, 05 Nov 2018 06:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
In-Reply-To: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 5 Nov 2018 15:43:12 +0100
Message-ID:
 <CAEn-LTrK2x3n9enzv=+CbCOFzVrX_RZXZ1wB_ktjkys=wzYfLw@mail.gmail.com>
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
To: Palmer Dabbelt <palmer@sifive.com>, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_064334_998591_20B24BAF 
X-CRM114-Status: UNSURE (   6.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105144312.KDCDnt6qd-ejc_Xl5TzhKWTZ-OkVGPQ_QxASJZiB_DU@z>

On Mon, Nov 5, 2018 at 3:26 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:

[..]
> diff --git a/arch/riscv/include/uapi/asm/syscalls.h b/arch/riscv/include/uapi/asm/unistd.h
> similarity index 54%
> rename from arch/riscv/include/uapi/asm/syscalls.h
> rename to arch/riscv/include/uapi/asm/unistd.h
> index 206dc4b0f6ea..5545f498071d 100644
[..]

I forgot to pass --no-renames to git format-patch.
If you want I can resend it with --no-renames to make it
a bit more readable.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
