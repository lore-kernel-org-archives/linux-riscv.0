Return-Path: <SRS0=kixk=WB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938A0C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 12:27:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64AB52086D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 12:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FDMV63Lh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="w4+AecEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64AB52086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwoAmm8/2YVJEe0yR5e1jPjb4VT7sFhDbMBECkD8zas=; b=FDMV63Lh9g6iHI
	czssp90rVE0K0FsOEUVjBvht0H0RYS58eaIwP9YkEa3criQONeb3BRMJnbpQpR+IaQpYwvh2Yt9zG
	ROTy+NL8JRapzjUlJhZvkh9lvqZZ8arbqUVUT/ezeduT8C0V2Z9SigaY6vQxmK3wdhNQtHFQd/h6p
	sabHTRqLTOF5J4iYbGaYh4JRn0nhU7SwMabJR+u8y04qYBfodtQ0iJ1O5tgLvMwGwGRPT+K1ws7+W
	9Wt6yskqUGjFyky2AqCYbCu8E6Qznh8zZDRWTOkzkbjxCIUIVnrPDVJ5hgtJi8R2fUfFzHLMwN41+
	8llhMOjtDclRps+dcpEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huc5R-00085c-Gc; Mon, 05 Aug 2019 12:27:37 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huc5O-00084X-54
 for linux-riscv@lists.infradead.org; Mon, 05 Aug 2019 12:27:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id n9so59147426wrr.4
 for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2019 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9vjnriQzTp+3fhGfRWD4sJQPpUsfPg2DbYoNAsu2SiI=;
 b=w4+AecEmFQ/isfLzRPwHz/5MZljTohJlWFNeug8MdHi82X9VKPhe2ZyRzjWlJCvepw
 kiniiAn5l66EGF3UK+orcy9NcLV/dmSLcCGmna4yi0GF+i5dlXhqrxaPH9KubY6FHjLD
 99EpBHJsVCkZSJoOyTaWRD/ilyziUyk+nwPk0RUQNGwqFtyKJh13sW08S3edQKCVQCth
 hXeCoblZKRkBPCTcvTHLXaFhtdFGztMlOBo56CnAVX+z7v0wWKGwWN9zmif9kthuQeXJ
 pVWvaRXUT6j8dcd4c9QdaTp337ImgbfM8u4W9iSkzJGgF+BBdaFvp1PMRW7Na8yEVZk+
 giDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9vjnriQzTp+3fhGfRWD4sJQPpUsfPg2DbYoNAsu2SiI=;
 b=UFVE+lRzv8JYOBJH5dPwK+virChXxgFT9CoXtvrQ1pvA6liKieRM1LTKtZ/9x9puKw
 hWuZvj0zdnfNkftu+CTfrGmFo2GscnV4mXVhCIOkDwbS9jERASzrYaq7l9sMFgREAT7B
 QXD74utrQi7KnHvqglTjabE7NB0xFHJ541Wp2xNMsq55sHKFT+ZxDCMvGjMiso37+INA
 T/EgbQ5fsgV4+jS9OeFggMpsNZ9ct8RMTkqo71KnNyo2T2xgrWF5EZT36ywR3LI1uV9M
 DhuyQmod2/EXnTS8v9DNMJUCzwzpnb93XDUtFrcexr+Ui4wzKhig8aGcv5dWW+g7/GH0
 DamA==
X-Gm-Message-State: APjAAAV97BhvBJxdbJa34QjHyBJpYmRm9yltFOveWhfpMFl/bwnMtF05
 8tg6jMKeQB2xhCrY+04oxgqRhmRI/NvwfaVwPRk=
X-Google-Smtp-Source: APXvYqz/HgV3blyNJGsp03Z7QumAb6XXL7e/qsJ596wIug7Wl/foiSB6qgn4qCCaL+3bGAF5TklCThDKf6RqGhrKNGc=
X-Received: by 2002:adf:b1cb:: with SMTP id
 r11mr152697746wra.328.1565008052530; 
 Mon, 05 Aug 2019 05:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190802074620.115029-1-anup.patel@wdc.com>
 <20190802074620.115029-7-anup.patel@wdc.com>
 <98eaa917-8270-ecdc-2420-491ed1c903d8@redhat.com>
In-Reply-To: <98eaa917-8270-ecdc-2420-491ed1c903d8@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Aug 2019 17:57:20 +0530
Message-ID: <CAAhSdy2rYy+hAaQROYqjDQPKDq1DvROLMjOuWamn6333W-rrpg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/19] RISC-V: KVM: Implement VCPU interrupts and
 requests handling
To: Paolo Bonzini <pbonzini@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_052734_191688_40F6B0F1 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 2, 2019 at 1:47 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 02/08/19 09:47, Anup Patel wrote:
> > +     /* VCPU interrupts */
> > +     unsigned long irqs_pending;
> > +     unsigned long irqs_pending_mask;
> > +
>
> This deserves a comment on the locking policy (none for producer,
> vcpu_lock for consumers).

Yes, I will certainly add comments about our approach in
asm/kvm_host.h

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
