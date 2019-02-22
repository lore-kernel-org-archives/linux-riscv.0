Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0B6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB44C2070D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alfY7bGs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hx5mP2Ed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB44C2070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8x++FV9I3DprLC2NtOAwikVAYW0omuYtmWE/9r6HfFM=; b=alfY7bGs6Rj0mx
	gd/E41Wc5FHQOliLfCtoaAfDqay8emYucOfMD+go2QixWStH0DHwkpydPF7NN3NgbEKKbS4sRBk4P
	oB4A2pMWijmgPGK6M0kfToZEBDiftgs3yW/dqlQkUPjbjlnsfmSoeWrorO/TY1kE3egA+eedCm2MD
	0bZt7c5stuNe+H66BLMRF6rO3RQqYQhS34MRad84xx8B5Cl9tJiaCDnliCRk1d2edGhquK4tXRxGH
	Mrh/kQtYkovZY/PU9sYuqS+eO4yrQ8prXkEeAM8zYaMxKQUlGSraAPQymGwCXEhlgi4TAzJbz8wOV
	wb/uIxpPbJWY8mqI2riQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxGn1-00028p-Vi; Fri, 22 Feb 2019 19:47:19 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxGmx-00021R-JZ
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 19:47:18 +0000
Received: by mail-qt1-x841.google.com with SMTP id w4so3913735qtc.1
 for <linux-riscv@lists.infradead.org>; Fri, 22 Feb 2019 11:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RA2UILr6NruaF4wuncgu+IZlqGnTCwZw16jNN+l68Wc=;
 b=Hx5mP2EddtF+6Z2UvuIrgkbRJYq9d9is9dNi2sNSQI3jjeqznAS93NkZMw03A52XHc
 SztymW+RlyBY6Swwbpl4fVmfZ8Jsz6J8TtuZu2tiEYE2sZtvhhf5KIgH4gjD2XGuMTYf
 6yf/L0rFuCiYf6Zy8du2ponLtZwOqKSA0XF02UBfciSlvfiw/5QACdzriiBS0uj0AnAX
 erESzsCGHMr2g5vuNPz+mjueyu8TzjgqmHWcn3r7zMEoV0RCQknlNfioiZXR5ApxJj9m
 nev2nGC2wBDRzf0Ze/GM06qW82QaIv2tZAHldkkrnMMw2mpsHeKK2skAFH0w8o5HGyNY
 f37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RA2UILr6NruaF4wuncgu+IZlqGnTCwZw16jNN+l68Wc=;
 b=I9JlNb4G2IVYeVUL6b367nVm+lVoBKJGWZ6VBL0kqBgjr5FR6LQ45x2knuWks8gAK+
 nQn2RZsJri3Z6eI2KMXl8mCWjVePGkQKJkBnkCF2s+thwZualcWfWj5GGtCk2Tk4li8Z
 ayKUYOpyFRD2kUVKTBFu1DPOF6YjYuMAeNXSDhnBE+WWFq7ApR5t1auO3mZgUWuz/b44
 5jwB2FizIK0rcjuCMIeNMryiDy7DkrfN8LGAadExbVyejydhaX99CEIY7mGoqGHaWEb4
 gp34Fxm5DQgyQvXQbm6t83sxjggZRpJW/vP6qJU0/MayN1Guy6qd10yl55YcaiVpqgUw
 ruGg==
X-Gm-Message-State: AHQUAuZ0cO+DXStWgCSsih+7/FzXIRWmf7lrnamrnjr0s6p7oxD29VUt
 od9f8T+0z6X3Rg7iNgQ2fKC6RkjFNwGzLmyOD3g=
X-Google-Smtp-Source: AHgI3Ia4BTpxoBiwmQAUGqp+Qzq+0rNDSOzT8S342AcI6yNiMjwbxMobpDQPmKS/UNORPlTZ2+95Zcd39RH2VoU5K2w=
X-Received: by 2002:ac8:1ba9:: with SMTP id z38mr4447434qtj.3.1550864834126;
 Fri, 22 Feb 2019 11:47:14 -0800 (PST)
MIME-Version: 1.0
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
In-Reply-To: <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 22 Feb 2019 20:47:02 +0100
Message-ID: <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
Subject: Re: per-cpu thoughts
To: Christopher Lameter <cl@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_114716_000782_B3AADD70 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul@pwsan.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 22 Feb 2019 at 16:56, Christopher Lameter <cl@linux.com> wrote:
>
> On Fri, 22 Feb 2019, Nick Kossifidis wrote:
>
> > How about the scratch registers defined on priv spec ? We already use sscratch
> > on Linux for keeping per-hart kernel data structures (check out entry.S) and
> > mscratch on OpenSBI for keeping per-hart state etc.
>
> The problem is that the register needs to be referenced by the amo
> instruction. Can amoadd increment an address relative to a scratch
> register?
>

It cannot. So, we'll end up with (at least) a preempt disabled region...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
