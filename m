Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5C2C64E7B
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 07:30:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A52D20B80
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 07:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A52D20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vtp+YYTWlIWsv+gPPkhuO1HyPKv2TSO3MIBuyDkYgvM=; b=JddC56gIcmurEBrs1qOxVCEeQ
	OxnW7yKXmqAyq4BPtIcm1bcWRZ+6VKFnPak3BdgwQsaEE8zAwCESwB97M/yje5BA+JQ2n4GyXSCt/
	BaNnawHLbZGmYCbWMav54IGeM+r6ElvzzUZsV4ikuoHDiwGyQTrZpHiF/eJP2kquP6qmx08B7MraL
	J68tSjzRW8Jfz6kiSmy6e+5yMSCaRAU+JhKnGSfsXHEshRO2l/5cVoCH1v4iuLS/xCGwZR6rjJRlK
	ToZjL6BeYI0TspzsNddyFHT8biOQJIQHf7q+vG6EyeiJftU8O9QovzfOvwOlCvnR5hXACwKNNnaRY
	RYREaITVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkj4I-0004Zs-Id; Thu, 03 Dec 2020 07:30:22 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkj4F-0004XM-Vm
 for linux-riscv@lists.infradead.org; Thu, 03 Dec 2020 07:30:20 +0000
Received: by mail-ej1-x644.google.com with SMTP id n26so1959091eju.6
 for <linux-riscv@lists.infradead.org>; Wed, 02 Dec 2020 23:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uZ/XGNhtoOQrbENqOXJbu4NnR/IRF+nt0tG8EtU2v4I=;
 b=Tq1U7R+X70S6sorF7X/KkMiXAVcBgEQf0ajgS8vbuO8pbtBPun+qlqfqyXgPYbXw6z
 zpNPffrdEd2gjOGgCBg9AKuzGkybuFJJWd1b8YXQ7GyE2KHQpixtaUH+QxcEw5aGeEh3
 GjdVVGb3WBSnO8LjfKtqr+TgBSRmezjO7rqC6vTsoXybvqxUNtKhKRx/fwwrWjiX4OSm
 P/YI68cIMhg63SMk3O+/W0rps639oYAZwk/LLuiaLah2zFRrOnslp+YDiEZplRauHC4Y
 dX5cDVXgyDIeRPQI+qKkgZe5WiG5NhlO+Su5nvAc6RsD/uT+ljwORtxpWNi51tCjhrn3
 L3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZ/XGNhtoOQrbENqOXJbu4NnR/IRF+nt0tG8EtU2v4I=;
 b=o3P1hcbSYf1egs9Ewp1KEYvdIB8paBJzkqC/iPu/gTkCTCEUp0L9/DU2dOvLHSCdon
 zPPESJbgGdTO+OFpsF70vqQsoU9PAjxve+aTtuK0pAeVgN9Gt0pl4TbttGdLE4ReKcpX
 eGEZC9fRTWhQAGVkEfp0doaH6V3/rrOWS1l+rPyooLH+Ry6Myjicv5bYnDMA6NVMPI/X
 ckJ9ReIdo6I6WpmvDgn7BTYa1s1ZDq9KnZr5M8fUTwrOQuhAP0zKrfsoqruVpQ66CtOT
 Jm8lZoLVl9XddqX+o+mD7t4P+c20oLI3oRuVBwgpwD58lQJfSswbboFn++jbZFhwlya9
 wOSg==
X-Gm-Message-State: AOAM533PkYDTsdoYVHGPaIl1IJ85qT2KQ24UXw4EzH5hnfIDgcjNug9H
 zeOLIbpbaXIgqgWymWIlIMgSL7dFk0lM3l0LTjo=
X-Google-Smtp-Source: ABdhPJzTsqA1rfc92cAYTkf57FsuAL7Dw1HRXwlK1u0yIS+ME4QKtBT73sHLxujSE+yX3ZTjaGxdY8+t7f2NR9ttvEg=
X-Received: by 2002:a17:906:ed2:: with SMTP id u18mr1355857eji.1.1606980612906; 
 Wed, 02 Dec 2020 23:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20201203064826.30832-1-tesheng@andestech.com>
In-Reply-To: <20201203064826.30832-1-tesheng@andestech.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Thu, 3 Dec 2020 09:29:57 +0200
Message-ID: <CAOJsxLHo6-6w9M3H1UP1hPX1bnxZ06tqbnc9cwR5_sLQBgA7HA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Let illegal access to user-space memory die
To: Eric Lin <tesheng@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_023020_049772_D43FACE5 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Eric,

On Thu, Dec 3, 2020 at 8:51 AM Eric Lin <tesheng@andestech.com> wrote:
>
> Accesses to user-space memory without calling uaccess routine
> leads to hanging in page fault handler. Like arm64, we let it
> die earlier in page fault handler.
>
> Changes in v2:
>     -Add a die_kernel_fault() helper
>     -Split one long line code into two

Please also make no_context() use the new helper. Other than that:

Reviewed-by: Pekka Enberg <penberg@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
