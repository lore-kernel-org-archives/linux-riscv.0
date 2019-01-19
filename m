Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3731C61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A972084F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T26+kn1F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="fP9zCSOI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2A972084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVyd+yA5EBKzYXWSCK9SVcA0Xq55/gGcnsrgQQ33YSE=; b=T26+kn1F1xsBSR
	62iL7xcVPXVQpQ9XFvZiT4BFUdbudt82IVLM6zaxxkw4NvvUnv9T/Zxl1pSdufgK4H0HABR8zzTHq
	jznMB8MoGKdWuYRkwMuBvsa7dSgcAf4u4l74QlBWZuLxKtGe9CeV+IYYy7RPH3Qv1rTX1vIkugCq+
	y/7BFQ9pz7NaOPdxFaKr9V0R3o9tU+eopFwB1gjj90Ii4sdejFXf3hfoX7rumtOXWRsq3Y5csQ6EW
	3LE3yLl7KnqqZm+2cnm19L9dSd9gFkeVa23cWLZ9Jskc/RNoEF1YL38IZ3cziVXNO4tlXTeqIy3vS
	0gldCOgtYCpU1hZe0Zrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkj9y-000381-AP; Sat, 19 Jan 2019 05:27:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkj9v-00031R-V2
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:27:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f188so6291447wmf.5
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+BQqAME/n96OaDRAvhqrmL+Q8yZyrA9mWoXMS5JE7pE=;
 b=fP9zCSOI58Il0IPLCGwoSGtvSya1dK7oL8gdVFU4k+p415AnygBCURviv37BBme5Xu
 CNWsikmffBocAkY298f4gm7QaEfVr10uNE5cMeLt+3fBjBHBGYS+9/mZ94+Yqp9F2bru
 L8Ym/yDXLJ3kLHiKBNM7Hrh2vHFmNEAWb10DmhPBsJQGRiFw8lfHERrpIqwLmwCEHmDo
 3aSmWY+mGMXPxX87cjvyXgG+sD3bF2d0aky7rNngPY2SZbH93SdTqHm3KBsJ5W1zqi6v
 RpSMr6BzQJL+dEzKHfF5EWOqfwbacHm0fr1e33D8uPyU9dxkrOPLjWAkutaYQ/jlSLp7
 2IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+BQqAME/n96OaDRAvhqrmL+Q8yZyrA9mWoXMS5JE7pE=;
 b=Dpv/3Fm4Z0Q3TwWCZpCiWpzOIRlwB2OLOo9qXIzJJqFVTrDh/ZYE+1O88Az/wpyxLp
 ZAT4zjshMEw+l8JAeat6rUJAck3Ceh0iF6zl3d/ElKoauR1QfRlKAjDCIxz30iDPpfne
 zfRp31KIJ6989rL6QYl5MLi5Exb/GH/SMq9a5EPCiO0JFYFA4qUYl5b65CuVMXufsmnl
 ublkOFKoxhR07KOInxJibnhNLZ+3IeqqmsMkTw86reLl5zELAwK19DSPdnvOqglUsiUg
 Tb1IJTjonihA90khPtt++X6sbxmFhkMLwXFxuoZ2PeHlo3bmF2Ltvb+6rLfIRnqOrZZf
 dCOQ==
X-Gm-Message-State: AJcUukeJsd0bd4L5eGg+N3ORAnGpqH+uFOGpFCUc3Cr5InGNq87tLgOA
 EXc81Cj3SfP1SyWNDF095CtJrp+fuknGa/BaDiP3bg==
X-Google-Smtp-Source: ALg8bN6HPCgf6Y92vYMKkS6v+Nl7Gq6Rxxcz7LLyiaVmaCS98mMzr238JY944RYvOiwSQc5gijwXBvzHPuUqVvBVsDc=
X-Received: by 2002:a1c:1801:: with SMTP id 1mr19018322wmy.153.1547875624887; 
 Fri, 18 Jan 2019 21:27:04 -0800 (PST)
MIME-Version: 1.0
References: <20181227111821.80908-1-anup@brainfault.org>
 <20181227111821.80908-6-anup@brainfault.org>
 <20190115155727.GD13095@infradead.org>
In-Reply-To: <20190115155727.GD13095@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 10:56:53 +0530
Message-ID: <CAAhSdy1JpFfxPmuLM_T_YVax9HD2oNbfwMAwttNYjZ+BSL4fuw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] irqchip: sifive-plic: Implement irq_set_affinity()
 for SMP host
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_212708_000799_8AEBBB44 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 9:27 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> > +     if (!force)
> > +             cpu = cpumask_any_and(mask_val, cpu_online_mask);
> > +     else
> > +             cpu = cpumask_first(mask_val);
>
> Any reason for the inverted test?

Okay, I will not use inverted test here.

>
> Otherwise this looks fine to me:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
