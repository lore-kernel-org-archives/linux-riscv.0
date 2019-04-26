Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1C6C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 05:51:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F727206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 05:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QER3RFc2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MSMGsljH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F727206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtybeEj3K+evIXGNMI9R4MW2PJs2HIx7hlcuxRxBEv0=; b=QER3RFc2i5o4Xp
	iM1Ipt+5ZC4w1yRBnz1luipZE2k7Xdr+MnCjHsuZSu8qR4tUFFcadWqBGrKkbQEDuJ48Xg8OS86ov
	ItHoqnCqPQZO/ttF5j/JwatAl2dBvXev/mQDI+bIe+UUpufU13jK8sjyQwp5/t+w5FhNTWAONP3Dn
	hOvJU5w1xb6CuWokPww3rjAYooy1sSHS9MBCfgd9iFPbgSpnqv58vgK4m6aMsgBg8I3btguq8PeXV
	zhFv7CTzNWfR4P3uvJs4J046tHtGjjewsKzYmibVe5+HsA86+ev83KbHw5WfxB4192zq/Mth16YE0
	IYN5wbDDdwBYtYUNasFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJtlC-0007bs-Hk; Fri, 26 Apr 2019 05:50:58 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJtl9-0007bT-QX
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 05:50:57 +0000
Received: by mail-lj1-x241.google.com with SMTP id b12so581361lji.4
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 22:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HNpC31CjPVPMt4LyUXBuFChEyLXh60VsFc6V2/expr4=;
 b=MSMGsljHd6soZ9TxJZ9DKZWP547y3KOJw6IxtwJSpBG3++X/2b434dVXnSzj9uhhxw
 beW/L0AEfvqz0mt8VnDkhJxseKqdxG42Z6q9t1XhU/Ijj2t8M67ZN8/dY7APQnTK/blh
 FUbXRx/IZLCCdgv0lFyLsmVzfYEzmCTGcsPqY9iMssE9Pwt2NVqsMoGuHRzuL4CmJLNM
 JpA4gnwFuxnuDFaFF+0Vb07cc/PMp3HGd3uDzd52bXbw0Q535BlOeB0IzrAJ/nmeTJRE
 +hpryQf6NjX2Dnc6VNvwerZYV7N/g11En390+RbKHY/Bd+a7V/l8KQvlf6aURI7nZzkH
 pT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HNpC31CjPVPMt4LyUXBuFChEyLXh60VsFc6V2/expr4=;
 b=K+1j8LxihS2rWrIur2NgNmjHqr0R2wPNEOeP4FcfqCIdKYlOdZodQGP7J6t234K36n
 +7leTplUPEnl+lwcvT6gnHW4sBHhR2BWZF8GKSHxultCgmBjh85MEoDWfGIjwr6AJoBU
 BW4mz5x7RCPPNMyvq0QPhAyZCPbhf0uZy8XJdhGi29crG7UqpU6wJxyi+//5TMh8cjae
 DjAbLnbOIHOyGAOJfCGiCoOPWVDB9uiixgHZgwzgTjg7Ph2RxbqRTxJh4UA0ynKGDQL+
 /Vj7h3mwQ5Io8kFLWJA7tb2pza0mZLyWTwDbVdNw9IfCA86cyeRRK0olwr2RKtYcd8bY
 +E/Q==
X-Gm-Message-State: APjAAAVZHBP01h7GhJvocrORpaJLfFyhoel1tsZatFkYmVpRrCp38cVH
 hZW9MNMEbQfZhhRTctre1qhZKUGxUAvsncIT1sAhTw==
X-Google-Smtp-Source: APXvYqzD2fg8HY9Ym+sEq9Cijb2pl6+57V2fxKRIECJiXoeIcf6Prr49EDXjBQm9e8693Fbeb85Vu0NYfV1nSWoy/T4=
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr21952024lji.127.1556257853715; 
 Thu, 25 Apr 2019 22:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
 <20190425101318.GA8469@e107155-lin>
In-Reply-To: <20190425101318.GA8469@e107155-lin>
From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 26 Apr 2019 11:20:17 +0530
Message-ID: <CAJ2_jOEBqBnorz9PcQp72Jjju9RX_P8mU=Gq+0xCCcWsBiJksw@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
To: Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_225055_866801_F1630620 
X-CRM114-Status: GOOD (  17.94  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 3:43 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Apr 25, 2019 at 11:24:55AM +0530, Yash Shah wrote:
> > Add device tree bindings for SiFive FU540 L2 cache controller driver
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 53 ++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > new file mode 100644
> > index 0000000..15132e2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > @@ -0,0 +1,53 @@
> > +SiFive L2 Cache Controller
> > +--------------------------
> > +The SiFive Level 2 Cache Controller is used to provide access to fast copies
> > +of memory for masters in a Core Complex. The Level 2 Cache Controller also
> > +acts as directory-based coherency manager.
> > +
> > +Required Properties:
> > +--------------------
> > +- compatible: Should be "sifive,fu540-c000-ccache"
> > +
> > +- cache-block-size: Specifies the block size in bytes of the cache
> > +
> > +- cache-level: Should be set to 2 for a level 2 cache
> > +
> > +- cache-sets: Specifies the number of associativity sets of the cache
> > +
> > +- cache-size: Specifies the size in bytes of the cache
> > +
> > +- cache-unified: Specifies the cache is a unified cache
> > +
> > +- interrupt-parent: Must be core interrupt controller
> > +
> > +- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
> > +
> > +- reg: Physical base address and size of L2 cache controller registers map
> > +
> > +- reg-names: Should be "control"
> > +
>
> It would be good if you mark the properties that are present in DT
> specification and those that are added for sifive,fu540-c000-ccache

I believe there isn't any property which is added explicitly for
sifive,fu540-c000-ccache.

> explicitly. Also I assume you can retain the stardard "cache" compatible
> in addition to above. I am interested to see if the cacheinfo infrastructure
> can be used without any issues.

Yes, I will add the "cache" string to the compatible property.

>
> --
> Regards,
> Sudeep

Thanks for your comments.
- Yash

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
