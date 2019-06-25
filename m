Return-Path: <SRS0=f00Y=UY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB32C4646C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2019 03:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4342320659
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2019 03:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UgxXrpsm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="YutOJx/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4342320659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeXytEfesMD0/Bsmk0BBsWItagm4l4bxPiYAzWLRF6o=; b=UgxXrpsmGrlEqf
	trkS4S9P7oFKBj5BLuO+REHMP8i/fdAyVgeugu3Xq7F7DTx0CkhjWziDXqTe+liSr9FPQuLz+VL7C
	YrlUnFb/9xgEc8QzTiccP0mAcGvQnHY0rUR/5+1gG5pvMy7LhfSJAL1BUI5IIFbbqyie2TZnEQHKh
	5KohyyMe8AoYUYbYYaSiE46XhAh82HgSUlfL5b6R1vP7hGPHphWFmU6RflYsxARnxk3Fd7t879PDc
	V35ETOg0DVPRFiU9BXZgRjrWJOuutaz388+WjR72MxZJ/+5vxQ7lLduLXJPboPTi+cp3ovVZDkteq
	dSPJ/w07FQXau7+A9nNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfcBU-0004ln-JV; Tue, 25 Jun 2019 03:31:52 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfcBR-0004ks-3R
 for linux-riscv@lists.infradead.org; Tue, 25 Jun 2019 03:31:50 +0000
Received: by mail-wm1-x343.google.com with SMTP id x15so1238874wmj.3
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2019 20:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hreneRMdosQHoew3G/ulwzqPUoN3bk6y0Mh9gFGiOHc=;
 b=YutOJx/yNHxHBs7eip+GCzWGxLqBKS6HyqZOc89ENz9rJ34KjLkKIpDBw4RWPnmHLa
 MgchNwF70fF15hKZ24AWHDw+jN7rsCA9L13wkYtqXguEBXH072x8pEdHIijavPAOQufT
 ULwurfHUvacfjYlhENKW0MRK/d7rmWJ8yu0OcsDgVV91KEtrztuDNtXClNYJMgLaBzjI
 tEDhtW2KUAkF61HI2Etk6L3uJMrm7rBqP7pglkCVqUtohmQL0WgIPACLQTdzadflJn8N
 stPVpKOCO7djrBVvPtAQGvlSeYrSfjepK5GDBspXz4SOq5mnCipmYi9j4vRInCQRf0gk
 ZlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hreneRMdosQHoew3G/ulwzqPUoN3bk6y0Mh9gFGiOHc=;
 b=AV40UviY+mTsQtSu5juD7KWyEOngV/eiG75evOlD3H/S6sHs6DlYXygUEKD2JG5Yjy
 bGNmCxkJqhmMmDltabU7Svhre6WONfF7kNPyU5J3zhXUQQ2zccLQ4uclFUV+UVJvxgpn
 AIjBuTdmbeqsIeh8JAxDEgJeFaYcUQ4VgKgYHLPoJzpcmy1UZ6G5pp/iUsm356+/gwPE
 0Lvygv5BCnZXdYRIrFwoL1YUrCbIraH8ZefF7hoN9bQUwNkmKz102X5rCc+XwIOT7Kyz
 uj+QFbh93FdGnLqUizEdJMv58NB+8cj6F8nQ4np1OfZlslw/Ehw17PhAh6bo1812b/JB
 EX9g==
X-Gm-Message-State: APjAAAUQ5Jul2eqXPy/sK2TNOaM7yOupxqC4HwBKIr9/8LgJPi1apiyv
 +f1vokou26gYlmPdfxPpqv2mEnb3cVlswHhUa7PqDA==
X-Google-Smtp-Source: APXvYqwcYlRtlu/HQuSek8ocdSv5LWy+5p/nWI6LivltsiY0CBh5f2cBsro42LBCqwPhF/BJ5ow4BED0pcLfkh3uKF8=
X-Received: by 2002:a1c:740f:: with SMTP id p15mr17990557wmc.103.1561433506287; 
 Mon, 24 Jun 2019 20:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <1561375453-3135-1-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1906241421550.22820@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1906241421550.22820@viisi.sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 25 Jun 2019 09:01:33 +0530
Message-ID: <CAAhSdy0Z_uGMYqC+6yRPFzEBDGi+SHkrvhe2+1ZMt9heHhJ0=g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: Re-organize SPI DT nodes
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_203149_283379_D192CC5A 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 25, 2019 at 2:53 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Mon, 24 Jun 2019, Yash Shah wrote:
>
> > As per the General convention, define only device DT node in SOC DTSi
> > file with status = "disabled" and enable device in Board DTS file with
> > status = "okay"
> >
> > Reported-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> This is a good start, but should also cover the other I/O devices in the
> chip DT file.  The mandatory internal devices, like the PRCI and PLIC, can
> stay the way they are.

Yes, this convention only applies to SoC devices with external connections
so PRCI, PLIC, and CLINT DT nodes are not required to follow this.

Eventually, this convention helps when we have multiple boards of same
SOC and each board having different set of peripherals connections.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
