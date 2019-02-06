Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4455CC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 09:33:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCDA217F9
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 09:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I0XTTY6j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="gklk/mCH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCDA217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsGDyDrXZ8yc6XkPBau8ZjunrwFzt2RmTFGkTvV2cNA=; b=I0XTTY6j+ZQPol
	hMSe+/z0/b0QawHqJkfDkVKCwHNjBR1JygvVhGOkUY1809YiD/zfKxA9eo3yTD3dxOQX4lBLcXioD
	TosBX64iGsJ4qHhGFCO09Gf9jtnu0Bxfk5yHYKyqkVm7NLQ1us/4stYwYPEEQTUoOBC7AY0mXz1DX
	7aLLfi3UhB87PNcvRGeWTQMOABE/xdFQ4sXYHR4WrR5C+/yOkZO5fdp1p2KB/XIB+fLE+oK5tbq3Y
	7/sSlFsVlbrIgl7chvbI5IPb8GZYF/0yQ9dLJSVz7pUkWcIexIhrEF0ekvMeqYXmiCki//2MLNwKd
	sYCUEhWRAvLSiQ3RcXag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grJa5-0000WN-Me; Wed, 06 Feb 2019 09:33:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grJa2-0000W1-8d
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 09:33:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id b11so1698185wmj.1
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RanJuYSndnfS1esjGKBz652VzsxNR48Yk+y6nYKNIH4=;
 b=gklk/mCHL1UfNVRqO+yaLw8ANkBWXJ+MQJAZHOYHu5org1rx/PII+VGJp49/q6nbqI
 v8pbTSzeNUTGFCcO7eFRQFqBg0NO+H6MhLAJJWC0mSHaFmi/g6xM8w9PVJ92jHuwwHwe
 1MnnSk9WS6r+yiGJ+8DyG+1taBZi40VO5/J+gdRcprsdoWgBagN8+S3/NL6dg1NAB/RE
 rRqd0420ZMhLhTX/dHQ5h//ixheji6OF0eP2kxdOhdLwxCus1ZKncmL6phXM+9WN9i7L
 LXA56P/OZk7gzPk5Q/eyw3eZ2rreWjHZCCVUk2LwH3uz1xC1LEcdBC1m/AYwZSxzIIFE
 Rhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RanJuYSndnfS1esjGKBz652VzsxNR48Yk+y6nYKNIH4=;
 b=Gt8A6D/KWr21EDELWVYk2FyeDwkPSyreju1JVI69hHfTgTpiJ4BiipJ5Khn5XTQeGM
 TjtPcesNmJNZ+nu0wwu7wbYJWiFvAw7yVCCEiwpgHhLcfOmovHtkbx9OyDn32DVXNevY
 w0VlKR07ANWVd23WNy4E/Hh2DYCPR7AWN032J3VU4y4Pzxfa5YaX5o6ZJCJHwQAQfVMK
 EM6KkZ+VFwOzD8LPF7dy/aRXkwpbN6aiNynHKA2yOoZj3xKB9wp9A4goQ0omXSDazfh4
 jpUZHdJFsUSh0JmENreQHKJ1eLitwL2aAgILJ/G228k+OQ+rfUhnv0nXqNihU6xoFzCy
 FGPQ==
X-Gm-Message-State: AHQUAuZutROcFlvvYTi6Fv8EgHSXi91+PqfYSVfw6YQcW/RpvP2TYzmT
 LwJuQso3AeJvhRFBjzBsE9QWri5V0kj8qQvWbJPTk1gOm5CPAg==
X-Google-Smtp-Source: AHgI3IZsKrXT8UGNmINcf1YXDbwB6dHWeA62JS0j6AeF3d7BgvTg/Pq1f12d0Yd1ag5eje5M4yCzAcUEuUdepA0Gs0w=
X-Received: by 2002:a1c:d082:: with SMTP id h124mr2198984wmg.21.1549445595805; 
 Wed, 06 Feb 2019 01:33:15 -0800 (PST)
MIME-Version: 1.0
References: <mvmsgx22r3u.fsf@suse.de>
 <F77EA382-959C-4142-9A00-F1EBB58D37F8@wdc.com>
 <mvmtvhh1dl2.fsf@suse.de>
In-Reply-To: <mvmtvhh1dl2.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Feb 2019 15:03:04 +0530
Message-ID: <CAAhSdy1OWwh86u1w=jtX-3SidWjZm46T-5giKtXD1LMcZSywQg@mail.gmail.com>
Subject: Re: Boot stuck at "smp: Bringing up secondary CPUs ..."
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_013318_449373_C40D55BC 
X-CRM114-Status: UNSURE (   6.29  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 6, 2019 at 2:47 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Feb 05 2019, Atish Patra <Atish.Patra@wdc.com> wrote:
>
> > Are you loading Linux from U-Boot and openSBI ?
>
> No.

We requite Atish's SMP fixes to boot upstream kernel on Unleashed board.

I have applied Atish's v2 patches on  "v5.0-rc5_unleashed" branch of
https://github.com/avpatel/linux.git

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
