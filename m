Return-Path: <SRS0=YSHk=ZG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E55C432C3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2019 07:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE828206DC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2019 07:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dtJqvkqM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iuW8cKb+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE828206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzZaJQEqSV7ddKafX5KSB/HhG5EPR+tTzahTwNHpEFU=; b=dtJqvkqMqFsln3
	VD0zdZmKjPMhE+zhzG7DuDaAsslBQaWvfIvQfcTMbhHyQzIZfUJ5YcM1mkYSm6fHIldIBlJXGn5ef
	IKxmeCfkI1ddfOetclNni3ME5sxj73kzLv6y2HaP/GIjA9Af2dMkITcu9R58bSWutmcB98RBAuHjH
	2jSCBkcsFy7z6Pi/xg7Gq7oO4t9yftwLB5yEZklUHskhzUa5I2/gzWDDb/rDUPYW3xKHEQUdRWCo9
	WxcJXmO8lAjXyVm+fCmucsZyXDE+3hH05S2U/1yEOO8dMzvn1bjCb83nKwASnE4CWaGKgyF+IYwST
	yKeFg7UVljcKH1rYt/BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV9oY-00071f-KC; Thu, 14 Nov 2019 07:45:14 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV9oW-00071D-8O
 for linux-riscv@lists.infradead.org; Thu, 14 Nov 2019 07:45:13 +0000
Received: by mail-ot1-x344.google.com with SMTP id c19so4047697otr.11
 for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2019 23:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=dKg/k5qQH9spLz57/2miGXOjddJokItWVKvEng4G0Iw=;
 b=iuW8cKb+IKhbV1bFCx5109eZeJhUncE1UV7wudHbBIKmXPQ4m/SYYe4xVquJZXnvD4
 kCBpUfC80OQy6lt8GMe0L6CKRiMwe+NzPgHcoAfJ4z5uYT+sseVEHPlBMR5tTGLPYo2r
 NZ42Bwjk7h0YfpPsVnVx5f0mBIS0PKJXI0slr3lcdeHC/2DbHUwYBwy9GFuSD9cRm6Qu
 4s3OZuqje2pftqEpC+GB2q1YCf9t8LVrHDDNf2/z2GTIBw4hbrMhwlShbjKaPEo9abwt
 D4Dc4vsNC1mr5jFPBybKEOYliVqn+x59FOTOUdesg6D/YaaOelAFunXV329vnbxOtObJ
 +1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=dKg/k5qQH9spLz57/2miGXOjddJokItWVKvEng4G0Iw=;
 b=ODhDmQBrOjyjMriLN9cfC6Cog3JEuMrrS0pl10KExDnnRWrYg4ZJSMl7zXyRsDakYZ
 47F9EfXRFF1VcbWlzOR/MGLdsANCNyW39pvsNjANB/17sPsI0Cy7KCicZGM6WHWMXZHA
 m29wzgqLXGenWo9tuT3gPNngaRh7qXUgvw10JURXJj658pQ/Bf7bcOVW0WH+dCpDRCl2
 /XvJPbpuYCm3Bm1KHYgtOynL0vLnjfBzLh8KO/EMlUPqAhQViylvQPLzXYUfUESI4Oa/
 ng2dlpeEwvUkpPd/77MLcI+7fmZ7Sy/FIITjfo20iMSMl4WB2WwsFoyJlvv7EVA66nGR
 WUxA==
X-Gm-Message-State: APjAAAU7wkpzAR9+jt2uO0O2cO8Lg7n1rsO0x/4e411iuFFcEG1JJMFl
 b3KbybRQi3Ibqh62NWtW+3uNp6UPvMc=
X-Google-Smtp-Source: APXvYqzFrDF+lSCTrF1j8O4mTzBCFW8nox2nwrgCgZfzyKd0fGwuQwTQZx3Rhm+flvGA0Ut3R+LK5w==
X-Received: by 2002:a9d:1a5:: with SMTP id e34mr6709264ote.105.1573717511403; 
 Wed, 13 Nov 2019 23:45:11 -0800 (PST)
Received: from localhost (wsip-98-172-187-222.no.no.cox.net. [98.172.187.222])
 by smtp.gmail.com with ESMTPSA id
 j129sm1579463oib.22.2019.11.13.23.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 23:45:10 -0800 (PST)
Date: Wed, 13 Nov 2019 23:45:10 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/12] riscv: clear the instruction cache and all registers
 when booting
In-Reply-To: <20191028121043.22934-10-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1911132344530.11342@viisi.sifive.com>
References: <20191028121043.22934-1-hch@lst.de>
 <20191028121043.22934-10-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_234512_308916_F1B065B1 
X-CRM114-Status: UNSURE (   7.87  )
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
Cc: Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 28 Oct 2019, Christoph Hellwig wrote:

> When we get booted we want a clear slate without any leaks from previous
> supervisors or the firmware.  Flush the instruction cache and then clear
> all registers to known good values.  This is really important for the
> upcoming nommu support that runs on M-mode, but can't really harm when
> running in S-mode either.  Vaguely based on the concepts from opensbi.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks, queued for v5.5-rc1.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
