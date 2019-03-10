Return-Path: <SRS0=JPO6=RN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEE2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 10 Mar 2019 20:47:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DBAE20652
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 10 Mar 2019 20:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPKlB3QD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="wn2/TPkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DBAE20652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXud469dNomFHSbawl0d86S6L+PdW7/UGX6IuS4iQN0=; b=iPKlB3QDld0LOm
	dSDOiPHMbU+OlArWyKDO8B7HHN5/H3jb3mtEeyVO9DGD8YRueJ8ttA6TK1sSkea5p+HWUZ4SCmhb4
	Oj5cw2HFwEjI3De7ph/FOk8lWKB4xWZ04TyuRkwdPErZpoE407mzpkKzwJYIvUV9pKWrEX9NrPRSc
	ZfMegAuUgo5U/xAniKCCr+i8SF94usc73/e/ruRj/18aZ7HYydsWCy9Fm7iO1vc3JPVNHLGCiMxb3
	DnHMVHJackdUWn5OOCCXU6hrH4+8hdrYcJowGWwATcixRxjUibx0QVRhRCk+oZ6NPxGtuW21agA+6
	Z0Z2pQcLrIcB8HRpQEDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h35LW-0006E6-GM; Sun, 10 Mar 2019 20:46:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h35LT-0006Da-0w
 for linux-riscv@lists.infradead.org; Sun, 10 Mar 2019 20:46:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id n2so2882723wrw.8
 for <linux-riscv@lists.infradead.org>; Sun, 10 Mar 2019 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HDMdIF2k6F6Aa6S0lJ+vVSe8kUWSCtsYreff5BRoEkE=;
 b=wn2/TPkS6hBOhsklPmKgDDgkOjbxrffGXo4ua5ge3VwJo5cvmiByFZo40VXMdwPmgR
 qt7wUmEdHiw2/2U1jCCKh8i7+FfyhuY9kZu4l5IrEmZVA6i8akYuVCvWZkOtAhTGaJqu
 xJOW8jfXqqLmJnCEqGyXDZDcHmwh3V/dSFwSTYp6T3bDZXXn2lCgzATl93AwFjrLecfQ
 /gO9ojSOvkNA75NDnwaBkwL4RxB7XrLFqzjNJ3J4I1ZH77VUIC+J8KUOXg2/JLCzcrtY
 HSRCq/Nw04iDQJMvsBNRx5lRndyYV/jm8uKbzcXHz1fZHR9VkHWbOPMqteqM7xpgMrkw
 pQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDMdIF2k6F6Aa6S0lJ+vVSe8kUWSCtsYreff5BRoEkE=;
 b=c0qwQ32Fj0H3Rk31oawEKjJGBuofxdzlRUsxfaxcBXc2Nila5u10vODqgYrS1NetH8
 US8AKKvQN0Rm05/E9YKkTPoiYGEegAGIdU0yJ1BsKfHvWYahiFj8z8ACYTi0vHz5a0Eg
 nxIYeQxxk+QTOqtSeM3qflakL5GUJk4cu3iV33yawAtcgaj+y34GbIGHcs7KMeuoc9WC
 9Qya7rX9RSdgW3qvwOj0uj2TepSRDBYbCcD02B+obYFdXnSnQ4kI84tadBPlneJ5Q0HA
 qsuPhfyH0iG8dgrldKkeTUWum/TRVITCvHbdsuGfVhqQprZoT/ZQvfc//9FEicInZmcT
 Hqfw==
X-Gm-Message-State: APjAAAUceIRB6iSno8NgWdg84hrVXaa8yHJ2xxn9f3vbxLOtDRlGsCDc
 GGWIpQxzi76tapUaFy7Psfe2cVuh7VPIVoAukM45nA==
X-Google-Smtp-Source: APXvYqwqu7Xo/ntOZNSUoqFGxMIEQxKA1Sjx50dbh0fKgYSYcE6DxTGTARDsV9FEdiWftPMBHl3yaR73ch72mq4UW1M=
X-Received: by 2002:a05:6000:104b:: with SMTP id
 c11mr18931431wrx.9.1552250812120; 
 Sun, 10 Mar 2019 13:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
 <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
 <20190308163125.GB310@infradead.org>
 <CAAhSdy3n4F6EE0RYwozH2U2W+WMGJ_eVYs7-ny8Y2szoUeaksQ@mail.gmail.com>
 <20190308171804.GA27005@infradead.org>
In-Reply-To: <20190308171804.GA27005@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Mar 2019 02:16:41 +0530
Message-ID: <CAAhSdy1HBgn99x3V4=ytYEzf3cTiwT1ogBs193ZxFTVxTDbgsQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_134655_127822_22520EB1 
X-CRM114-Status: UNSURE (   7.84  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 8, 2019 at 10:48 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Mar 08, 2019 at 10:20:49PM +0530, Anup Patel wrote:
> > For your information, the IPI triggering is also done using SBI call
> > so we are not saving much by not using SBI calls for remote SFENCE.
>
> Not yet.  But all the usual implementation just implement IPIs by
> MMIO writes to the CLINT.  Which could easily be delegated and we'd
> save the trap.

True but CLINT is not the defacto way triggering IPIs. Other SOCs will
have their own way of triggering IPIs. That's why is it is abstracted via
SBI call.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
