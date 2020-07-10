Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7BBC433E5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 15:26:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FD920720
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 15:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXJ/2vmJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Mak2sf3w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FD920720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bFtXGMAr8WiRKH9nv6bP9CqwWT3tr6cPcpwPKd7xxWg=; b=hXJ/2vmJ4yV9rS1q6qPuJMPzF
	4TYZnxdhsiNF0m7duzkiCDu1ZbD8hpagkbFa2TzbndM4I2O7eUaOvuragDomUPXkM/hwrL2PwuY3C
	IMApjynu3WWbzHeeo41Lq0BbDrofgNUYoQEJVcV64mEsMSx/OnlRpIBndVQ5fCGp0qZFMbB3MuMFd
	Lrfqr963igX7IpNR4m4McV84BTSaA4BN5aAYNUFakpkOhrQrM4B/J+UG9Id9/lp/3Q+J5Bdu06f+l
	irk1MGliN4sg6A0VphZwh6hwB4NmItrMgFGrKtrUrKMUm10MGOzh0dQ44CTJjvqYkRL2wblz00fxy
	TLhVftxjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtuuU-0008Pd-Vf; Fri, 10 Jul 2020 15:25:59 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtuuR-0008OP-4q
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 15:25:56 +0000
Received: by mail-lf1-x142.google.com with SMTP id k15so3419825lfc.4
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XI4AkRHvZrR0Ew7WpXi3OZzQZHVgyOG0so02CQsEE3M=;
 b=Mak2sf3wWVCDN414GX6oHTPld7bJlpmLqrG6bZhvvHH5T1znpXb6u3eHn8BmbMVF+Y
 ds/EyWXY0dD4gBcMZ/gDxgBnK2vyamBCukZjC5DfW83iNLTqsavE5ce6GoriDZi9axdj
 QYdrRPQcQGcNIl30F45Lsgp9hSW8E0/NOQjY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XI4AkRHvZrR0Ew7WpXi3OZzQZHVgyOG0so02CQsEE3M=;
 b=umFP2/QaWeXAGOEvmFejfOQpsJ9YziwHSjQBZSeA84iNMLb0uzi+G201C6aNdLKOdV
 PJFiQJ4x8hVR7x3YY9lEigJz6wcXEK9+cj1aeaFLYRfUdeFilAw61KIHwH1C9BropsG3
 OpNGQbnn844EUvrtpV2c2sV7n5EFgyCFMjGc+hVbvULwQSBhodYjS0zKfGQyVAfOwBzX
 oprJZdFSmLswUFlZNYkQfphtVcbscCgCkQykzDTngITnJmCMO81geuw0VM5iiBHkkw1o
 z4IgYlZM/PR86MHAEfMAuW700KJAVs2/561Ph1idQoRxev2kHeTYN3FSSDvnql3RkvNl
 Q6dg==
X-Gm-Message-State: AOAM530EeNOabNLHlrxuI0miy+ZW4Cow8NmS1PSBC9kdQXTdZaFhAeWe
 7LN563ECT5eeGScXibEVKFpRCsupDeo=
X-Google-Smtp-Source: ABdhPJzzAiEk8k4l2jcHgnfxxnrPavgB+L5Oaq2eNfCllGpGPEjqElHw746AhEpdcBOh6vKIJVuT9g==
X-Received: by 2002:a05:6512:64:: with SMTP id
 i4mr44059589lfo.113.1594394753381; 
 Fri, 10 Jul 2020 08:25:53 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id 24sm2277608lfy.59.2020.07.10.08.25.52
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 08:25:52 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id b25so6909264ljp.6
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 08:25:52 -0700 (PDT)
X-Received: by 2002:a2e:9b42:: with SMTP id o2mr39413534ljj.102.1594394751710; 
 Fri, 10 Jul 2020 08:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200710135706.537715-1-hch@lst.de>
In-Reply-To: <20200710135706.537715-1-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Jul 2020 08:25:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGjwtgYJvLOd5aO2dWyPsC-6ED2Hthoxm1Eerf-Ahd-w@mail.gmail.com>
Message-ID: <CAHk-=wjGjwtgYJvLOd5aO2dWyPsC-6ED2Hthoxm1Eerf-Ahd-w@mail.gmail.com>
Subject: Re: clean up address limit helpers
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_112555_359810_516FBB82 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 6:57 AM Christoph Hellwig <hch@lst.de> wrote:
>
> in preparation for eventually phasing out direct use of set_fs(), this
> series removes the segment_eq() arch helper that is only used to
> implement or duplicate the uaccess_kernel() API, and then adds
> descriptive helpers to force the kernel address limit.

Ack. All the patches looked like no-ops to me, but with better naming
and clarity.

           Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
