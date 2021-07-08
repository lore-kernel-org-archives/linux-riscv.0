Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C91C07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71031613C1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71031613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVSkZtqapmZr5sbiREfMn6IzB0jyYMLjr4SEQ0kRqHY=; b=DQEsvEOPsx5OYW
	fNgFa/qErpHNsOTxiuAFXWVVqzytyaKq3xUIyuTJryHxhHa/5s86WGWGrnN11DKN/BH7Y4ZrWYMqs
	ufNPgcESWFfsB3O7BX+3HXaQJWY5ABIN5nIdA6u9N7hSackk20rcQHVQn6ctLbULNRaGrq0hYLLKy
	xlqMYa63YlBJWvepVkWeUiltyfhY1ND0nE9JNr7Y7S0sCqv1JJwx2WogVg8l9eDbHjITQQYbdm3us
	uuV640wzlyvn1M4twsatmLjHp73OtEbp69Rr9KCr1GOY51fe5CwmO1OasyD24MypCjC+7FxmPOm6O
	Zd5++18X98hj0CLO7vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1UFX-00H6zC-02; Thu, 08 Jul 2021 13:39:31 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1UFU-00H6yj-H1
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 13:39:29 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id o139so8950284ybg.9
 for <linux-riscv@lists.infradead.org>; Thu, 08 Jul 2021 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aOjj479tAYR8htOT6wsMXzX39R4Q2+skOoeED/e4V8E=;
 b=f9FeASktmqEXsl27jvJ/icNdiB5gBFDRI6giCnBn3E46WmIwA6qyfcA9rhmGtjocs5
 IW8VrM9fGHG6ut5Y7xdyZUe10Dn6iWRTxS0cctcDbdLuoQqTx9ap0jwgAYsRTnnFdx6E
 Ev0G/N7M+ARnmzWpH9PsUnxUfTpa9O0t1vLL4F7yZePreti0Rqx1PcCLZeFr3FXsMqGX
 Px1Vi6hfE5lEJnvpY7VEY0RZAGk6hfZ2Q68Ia9Go1+xmlbGC1ZgcuK//AclHAUzyhT0E
 SMCURuNz/gKtADQ+paxOmpjb6K10Z2w6cHz0bBtIo0Q9pCblUeoUCwzdny1SHgtT+AUm
 cHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOjj479tAYR8htOT6wsMXzX39R4Q2+skOoeED/e4V8E=;
 b=fi0bNjPhSMMEm/lMDs1DRgt5HrS+DZLgq8MVLQ0/XiBpiJNbVbDv1dCZ2SeizOto2m
 Hr3nykxyspxxG/yxysdZ8XkL1QQIwqVQslpJBeysXrFNBrVw8qplzwYDETQD96fO/Pf9
 5VrN1fujG45B7g80j1PqMpftzjHeyEfI4wtMZ5xWV2HWY7+yC+W7lRajlg4xB4LsAJhP
 0PxKgV9g5IieBxSJTNrzJ2VhYEzrENI3iaNTCAbcdrSZpp0StlFQ7Vnm4LM1s751b1S8
 HEiukGBGoBel9eiBtJkkGI0N+zAn2cWPexN3L5BDy7WIhKYycw/cFv6V3PzTee8vBqu+
 vONg==
X-Gm-Message-State: AOAM531sRD1b6eTD9xpKg25qJTlWcjtOCb7F6upeqTDE0LInbLtEiJDX
 kEit1p7ucNmqYQGRVuhN5GOgsnclae2K4OnmDpALzj3x
X-Google-Smtp-Source: ABdhPJxmyb5IyWJwnoebDxK7rCDnXHMCtTgKVmOTLA/UwSVVH7FDS6Qdg4j6epHs/5AZwAzfDniEIzUVNRyz3tF0cZs=
X-Received: by 2002:a25:b701:: with SMTP id t1mr36852054ybj.517.1625751567354; 
 Thu, 08 Jul 2021 06:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210616060251.398444-1-bmeng.cn@gmail.com>
In-Reply-To: <20210616060251.398444-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Jul 2021 21:39:16 +0800
Message-ID: <CAEUhbmXQt0pnqvzCGwGU38_U0qRZRmgGA4qgaFT_HevbSZRDBg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: microchip: Drop "clock-frequency"
 property of cpu nodes
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Atish Patra <atish.patra@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_063928_605042_640E3D40 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Wed, Jun 16, 2021 at 2:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The "clock-frequency" property of cpu nodes isn't required. Drop it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 -----
>  1 file changed, 5 deletions(-)
>

Ping?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
