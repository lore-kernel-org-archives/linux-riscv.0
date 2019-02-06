Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388FFC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0431120823
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:17:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9YNl/lV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rn9yqNOV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0431120823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOmxz8Pfm3Abt8A+AW0GldlK5hoWAHPDexw1StQnwqY=; b=q9YNl/lVabZxqq
	Rzew4KBtQpUSR9V96zE93KnFUpOd7wgoN90o8bd+1HfTYC5/7AL13t0l4uoO/LU2OHVc17Cv/gZbJ
	wzf5QsZVmdat0WG5bu8mlkoebvc/6uKS20g6YqkyiTk0iqluKn8IK47ngRp7Vf8xsmB+XGzrM4M2M
	oyHFuxuXg8tFVxcpTEAD9eL6cJZQRgKEX+R+Ow2IGcKywvQwbuIBdhm25NXA2OUThsXRlUKb41tIH
	LHTfaAdIIAC9OwmWaVjYT10Df0SnZ7XAcTRF8+ZNKJOpn3ImPNAjNVXdCh2zNQNQe6vEBIXDKertP
	8hvY/0Jc5ILHR7uySm0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grKH4-0002Mj-OB; Wed, 06 Feb 2019 10:17:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grKH2-0002M3-0m
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 10:17:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id t27so6865706wra.6
 for <linux-riscv@lists.infradead.org>; Wed, 06 Feb 2019 02:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28lt9oH+o4irNJEuHmXtjUYXTo5WSyH7H1CY17gikBk=;
 b=rn9yqNOVevONMu28Ah5/PIsFY1BtsCD1Y5JRnkBz0662+PcHF29ZnzxHg2JmOvFc/O
 kPSogWoM2iEUUeTIEl+y1hj8g5mA+qm9JWaGvjjyqQiuCfiQM2PBXZayuzYpwe9XxN+/
 eFSt5xKfWC9n3o0UrHyyMcQjH5iL/6Y5IlcaUGvShGPYOEiqjPP5sw8fknOl1FukEpAx
 YLFIV8xKtrkSDyHPS3JUsbAI654xNa2FM6HGhfEn5thhmCWarb+H/XXVAylgEDklLsq3
 34zsNu3qRxbH9sCvvHo2LX5mzy0MRj7ZoVQ6QI/tdK77HKWAW2zCR6+OofIfn7KSX++I
 WlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28lt9oH+o4irNJEuHmXtjUYXTo5WSyH7H1CY17gikBk=;
 b=K94BNS+nKITk0YkexKBn+xp0coBqt4sqG4KTpgD8QRtXf6ObunmF1Wm0xkk72+W2Gy
 mf8fpmeIwObofvKcJiLeCnfzR9GP2GQ1pIcS/upNTJA7eQ8cmQ6M5TlVl1cyo3McC1Xi
 f5NUEeihLnGhVeMMUFC689npaBPt2HXAD/gqL6aspbc1kZMkZegnUXqNnKwAkqSP4fBi
 W7ufxN5Dk+RcofnE3h41iIpCZn/HzLoOLXZ0Y1zRN/pwtRF4pr/yHloRwNYVF4RVupPp
 kVL2A9HNwoHfdv053ZaEpYORomYvhtJfEbo3WHwwFYZqPhEgIS2lfl4xYhuoso2Rc+Qy
 ItHg==
X-Gm-Message-State: AHQUAua0h4spdhhcl+bSKz3VhgHQd953bmhFTBOFwB+niTp8q+jaSeRI
 ZeSDhIf9UtYk3NpIi70kiyWQde6E92SdFGJbaq8U6A==
X-Google-Smtp-Source: AHgI3IbusTWs/R9+inX4hwf/nJaxnt3MS8VRfyvul1sl+kRXGx5EnfYxvnRxrUv7cZmvIZGvDNKCL/ixMsYt0XD8090=
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr6528249wrx.99.1549448261861;
 Wed, 06 Feb 2019 02:17:41 -0800 (PST)
MIME-Version: 1.0
References: <mvmsgx22r3u.fsf@suse.de>
 <F77EA382-959C-4142-9A00-F1EBB58D37F8@wdc.com>
 <mvmtvhh1dl2.fsf@suse.de>
 <CAAhSdy1OWwh86u1w=jtX-3SidWjZm46T-5giKtXD1LMcZSywQg@mail.gmail.com>
 <mvmftt11bdq.fsf@suse.de>
In-Reply-To: <mvmftt11bdq.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Feb 2019 15:47:30 +0530
Message-ID: <CAAhSdy33AFXrCQppswWzscy8TQh0Tjp1ixcjFcoB97v6vAwWxw@mail.gmail.com>
Subject: Re: Boot stuck at "smp: Bringing up secondary CPUs ..."
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_021744_057521_2BDA79C6 
X-CRM114-Status: UNSURE (   8.55  )
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

On Wed, Feb 6, 2019 at 3:34 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Feb 06 2019, Anup Patel <anup@brainfault.org> wrote:
>
> > On Wed, Feb 6, 2019 at 2:47 PM Andreas Schwab <schwab@suse.de> wrote:
> >>
> >> On Feb 05 2019, Atish Patra <Atish.Patra@wdc.com> wrote:
> >>
> >> > Are you loading Linux from U-Boot and openSBI ?
> >>
> >> No.
> >
> > We requite Atish's SMP fixes to boot upstream kernel on Unleashed board.
>
> The same boot image has booted sucessfully before.  The problem with SMP
> bringup only started when I started experimenting with openSBI and
> U-Boot.  Coincidence?

Lot of kernel bugs are hidden due to FDT fixups done by BBL at boot-time.

This particular issue is seen because BBL updates /cpus DT node whereas
OpenSBI does not. In fact, OpenSBI only does minimal possible changes to
DTB passed by previous booting stages.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
