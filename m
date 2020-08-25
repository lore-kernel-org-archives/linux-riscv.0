Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D958BC433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 19:09:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C642074D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 19:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xb2vxAkE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFTFOru4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C642074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+eisNwZN38zF1nEqXPIHMQuCXN6tI031vA1gAfzNSCw=; b=xb2vxAkEZJg4CWSDCNlhvQc8+
	h53u47NmiGdqjdoxT43CXp/Opa2Mo7gjn6Kvh5YR93NzrSLORIiwuW/8DpHWGB/jwhFQ9gwTMuI3M
	3Du9g20xVC0BcoTrIOeLCna5PRtybUufo+E2jkezGdrHgUrllJyh8uIBZcIeGBtXWNkTRQCphC0T4
	FExqtIC0c+mB/I9cxQzPtCnR6rZPSRogZpkPNZZc9WP95tSNuZ80dG5DD1lCyDoBMDb3l489A5P3t
	Anq39bKQKuqb9bSyCsnKuI+bhGEU6voDvUzYVxkiR8CnCMgM5ywpvCPPEUEuvm4O8mK7P4RDIZfcI
	aactRGppg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAeJm-0003wx-NT; Tue, 25 Aug 2020 19:09:14 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAeJj-0003w2-ER
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 19:09:12 +0000
Received: by mail-ej1-x644.google.com with SMTP id b17so9709567ejq.8
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gRWcAtwY0OlAk3WcP9YYzI+dZcdhHTEKFB4Zqc2m/vg=;
 b=bFTFOru4WUYBcq0t53IyHqBmjF/oxyNkwkPubfpMwL+M9EeVE3jmpShzIkcdKY+eTQ
 769GIa0c2eZIPYho8zKrzWHy4JYby8MEJL8f1FSd6McHC+BPoxcCn39vQE5eZXhRWyDg
 rFV+dZtpbBkbHb3ZsjGpY4qxanSjZlwdSGGtqBy4AelA+TJFmh/z1dqaEq7AlUDFAcl5
 ZY3SaMGCm/c8AK05d6rejvwycl1yS9oHzZKEfGocWJnwM3iPVpIhuB64LaodFRDMGJZv
 lrssaV4VpMp7KeIg9GALT3KPl0nCbTGC8elxrnGg74LgVmsrfdq1Ss5tCu5vHn2K3ADJ
 pkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gRWcAtwY0OlAk3WcP9YYzI+dZcdhHTEKFB4Zqc2m/vg=;
 b=LJQ2h1koZQULgxIpcV9/Od/5zyfrDkiXk6qm9AalrJ+wzrzaS+o9MlTtz0D7/Sn66x
 o/be9C5sObVH4R4pSEbEMOH5Lo/Vo+Rc6qF+Km+nDZH4ktAs1AbD7sgUN0998XqwES6k
 T5C/HDQdC6AJ3zUwGdciz2OWao4cZ2X4GjiMGBhZNXWhWaKDKBsqBDVL1abMsWj/TFxV
 PxBMf0XBK4ljIfhAYonmpssh1Y7esmBC21t+E9s0KweNswkivbE5i1KcF8X576T3QtwQ
 mpRtyPi9Es3KBWUAC85QcEFND+qsYtL3H3PL/e7IcHZuJTzBX7SvjEWy6JVNAgRmU+6r
 zbXg==
X-Gm-Message-State: AOAM531rUDv60r2uPardBBRXz+QwMmMCM7kIVxjQlzJiR+tpQmf/BZIO
 2CnrNiykulWIneeLEuKPctrBuggTLYgekndNALOSGkxKkU+B7w==
X-Google-Smtp-Source: ABdhPJwiHs0VhAHR0Hk4j5CCOYgC0kbSSuNnFNqnv3Jvkt2YLGu4LqGWINV6VxepgIZ/XKAuICsX6CD1yyZAKO7i86E=
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr11932638ejr.482.1598382549891; 
 Tue, 25 Aug 2020 12:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200825183907.275950-1-penberg@gmail.com>
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Tue, 25 Aug 2020 22:08:50 +0300
Message-ID: <CAOJsxLEeZ4cpMBymm1m2Mbp_fbJP3e_DGntjSYzusJwBS5KC6A@mail.gmail.com>
Subject: Re: [PATCH 0/8] riscv/mm/fault: Page fault handler cleanups
To: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_150911_518927_1FCB4047 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 9:39 PM Pekka Enberg <penberg@gmail.com> wrote:
>
> From: Pekka Enberg <penberg@kernel.org>
>
> This patch series cleans up the do_page_fault() function by replacing
> gotos with function calls, similar to what the x86 architecture does.
> The motivation for this series is to make thepage fault handling code
> easier to read and reason about.
>
> The use of gotos has no advantage in kernel code size either. In fact,
> the bloatometer script shows a tiny decrease in kernel text size:
>
>   add/remove: 1/0 grow/shrink: 0/2 up/down: 96/-99 (-3)
>   Function                                     old     new   delta
>   no_context.part                                -      96     +96
>   __func__                                      14      13      -1
>   do_page_fault                                778     680     -98
>   Total: Before=792, After=789, chg -0.38%
>
> Please note tht x86 also moves these functions out-of-line with the
> "noinline" annotation, which supposedly decreases stack usage in
> do_page_fault() at the expense of slighly larger kernel code size.
>
> However, in my testing, I was able to reduce stack usage at maximum by
> 16 bytes, at the expense of much larger kernel code size, so I am
> keeping the functions inline, and letting the compiler do its job.
>
> The patch series has been tested on QEMU.
>
> You can pull the series from:
>
>   git@github.com:penberg/linux.git penberg/riscv/mm-fault-cleanups

Of course I forgot the sign-off... :-/

Signed-off-by: Pekka Enberg <penberg@kernel.org>

(Updated the commits in the tree behind that git URL to also have the
sign-offs.)

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
