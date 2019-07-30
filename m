Return-Path: <SRS0=qfeT=V3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32EAC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 07:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5F5B20C01
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 07:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fX8NljRi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="LrczV40P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5F5B20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n25Ics669aXSO7ClG9I3pp8wIAz4epQ+N7QfcrzOUT4=; b=fX8NljRiJ6DNHN
	r35eNJ7wYtODZdPQsAjDhKj0t1oJbSZI4xMU09ZVocIXrIhElM5dychvhaD68Qy59ZXYB56QI2Pvd
	kj+DhXEe1G1BhSRXsuCrzZz9hH8/ouYsA0u7tETz8da+bh7PHo51TU30NApMnd3v6WTH9NCgRIn1d
	M3heO5MNhsudTA2dLym8tPWt4+u9C5mM3pF5g8u4YXZjgboCronkhKcdfyxHEa0KttiOFK9CxEn/S
	9yjzaTLsHtp4Gc/sZ+XslUguXCkmmEIklhwrQ5HVhSr798m3zHohpRA7ylu8ZfShJcrjhJlr9hTYn
	1XuLsnbQmjr/vsKCsO3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsMW3-0005pd-6t; Tue, 30 Jul 2019 07:25:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsMVz-0005op-V8
 for linux-riscv@lists.infradead.org; Tue, 30 Jul 2019 07:25:45 +0000
Received: by mail-wr1-x442.google.com with SMTP id c2so61324274wrm.8
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2019 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zHsfGOiHudmcq3LRs8Aej8bkXt/7q6tGTs328qFT3fk=;
 b=LrczV40PBYaEexs2nulDPR9CbIEw7ONJ5yLSnCOFXbBboSYj4LvB840cLolZPaw7D7
 2SH/3EZ21korc3Uq3tCl5SXaAiI8mZ/Qh6D+mIJstzIy1ez/cPVHYOdwB0h2O0dVyohc
 nxGd5YiRj3L5zZ7QzRfEaUwQFuL2R8291rzLiLCJWEY7dWxNSKh525tdU02FOSmR67l0
 5qd8nclSVf1X3wt81DKacMW3Az7iMY2pq0tKyalbqZ0+SpswNxqkNPCeKU5+CW++CaT0
 0i00b+aNdPcm9Ydin1BMYTueOxMbaRh5qYlmxtwSbiG1CjFl/xxjpkuVu0HVzlN7I/2z
 BolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zHsfGOiHudmcq3LRs8Aej8bkXt/7q6tGTs328qFT3fk=;
 b=WJHK9S4UG8mf13qkhfSF/H0e8B4+7oPEOpM4KaUM4yJFLMn4iPWxLpHf3AckOX4vLE
 kxai+tPh5gzsg3gNboUGSSsKjdE8edGOTcR2jV7qM2qfw9owMCFvXeLCdggjGSXv4ATJ
 pSVZBO9/N14h9BLAuWc6qLz0RHmYdjkzb7OUD7dhSRebqtW80re+IZjiFfXRczrAaxop
 ExrAfWpJ8ZWLCiV/curxTnrnDPESIVNwjpSkmVkQ9RQNCaclOghDOx9um0NGAc99GCCu
 fGPm74JfZwZbsMLUlebol7OkLs/OA5cPPu/7uaPFrRY7bqmF4rvuYQWzi0QZdfHnR4Y1
 +thQ==
X-Gm-Message-State: APjAAAVYYnPB4kxrskUIJPsBevQbr6D6U5k9XQNgddQUVCCBRZMnk5Ha
 G171dZYFc/hBiSBmppuc8kDV8aN5RpLukWzmZGc=
X-Google-Smtp-Source: APXvYqzfPqQlTpifZXrLgaPOHcYZc+NXl65yC/U+gpC8aBM5EAS2Ozjrobt3zBDfVK+pW5CxK1jdZLTWfym4UfgP5I0=
X-Received: by 2002:adf:b1cb:: with SMTP id
 r11mr118068531wra.328.1564471542194; 
 Tue, 30 Jul 2019 00:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <mvm5znkau8u.fsf@suse.de>
In-Reply-To: <mvm5znkau8u.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Jul 2019 12:55:30 +0530
Message-ID: <CAAhSdy2jKQspZNwvd5VnZ8iyWjwe0fGXR+3WwP9cn5pEOcSfVg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16] KVM RISC-V Support
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_002544_147314_2E9315C2 
X-CRM114-Status: UNSURE (   5.75  )
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
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 30, 2019 at 12:23 PM Andreas Schwab <schwab@suse.de> wrote:
>
> ERROR: "riscv_cs_get_mult_shift" [arch/riscv/kvm/kvm.ko] undefined!
> ERROR: "riscv_isa" [arch/riscv/kvm/kvm.ko] undefined!
> ERROR: "smp_send_reschedule" [arch/riscv/kvm/kvm.ko] undefined!
> ERROR: "riscv_timebase" [arch/riscv/kvm/kvm.ko] undefined!

Strange, we are not seeing these compile errors.

Anyway, please ensure that you apply Atish's KVM prep patches
(https://lkml.org/lkml/2019/7/26/1271) on Linux-5.3-rcX before applying
this series.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
