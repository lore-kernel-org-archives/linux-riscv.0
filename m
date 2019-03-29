Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CA6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 14:11:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7FEA2183F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 14:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hK3nNcEM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0lA0vM3z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7FEA2183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qh5awgoAA+mPdj7/kgck6SIgAPiX7fC4/xNYExDQMss=; b=hK3nNcEMhrzBO1
	45RreH1tIBu1V6eylrwBJDqJ8sIGPt7a2HxPM2NorEorptw7GNj1mubQrCkocNtvF+6Y9deIpmwxx
	ay/V9oNexPHJ7NBxiY4AO2p8/oJUbNwygaY3FKhhQRZgJIQGEDq+Bq3HKOmFJNUhGv+fEN5ZcTSpu
	/1CHT4mOAyWxx6lqKdJcuN44GycMv/9ikHT5mHll7RJpuEW74uyXp7r0+ktys0VdJmoYfHnuLG+Or
	7nXJz8CHC4VXdSZWMjSdrcSo+HMt/GWNcLpbH5ZKHDBG3JrFeNuWJLyOWL1Vsh4zLvdIamU6hii/W
	MXVeOGbrLCZmIwHbg1pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9sEP-0006SP-Uf; Fri, 29 Mar 2019 14:11:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9sEM-0006Rq-A0
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 14:11:39 +0000
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 965C621850
 for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2019 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553868697;
 bh=mXhTNqf6f8vF2K2fJX4RBUBo2Tx2X0tY6KwqLiAnf+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0lA0vM3zaxOyJNXpQLWsyTDXUPqxlDMz4ZMK6NEkDTqWw9jKL96vJNMfjpj+4iGv9
 7K3I1zWWXXN7I/FNxvO8oNbyj3jRQ0yBDiL88oN2E39h1nMn6TNTEhP5i3/dEIER/f
 Xmxo4SxJ5bU2YG1zEZNwUoXxfxxqwurU3NeeFx3U=
Received: by mail-qk1-f180.google.com with SMTP id y5so1389955qkc.11
 for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2019 07:11:37 -0700 (PDT)
X-Gm-Message-State: APjAAAVYSiiOVLdm1nbtS70V9exkTx+3gNOSF9eEWz7BsbfM2K+iDJZN
 4cRaCAbkwZZqLvnQ7MxNM4bWya1euCZJ7PRXKA==
X-Google-Smtp-Source: APXvYqyTxjcJr1YGE/tHpafOjY+swUJl59rbSCq4bX9dliWVZ/WX+wcCWUVVR8GEz3VALP5YYhJ0kJjHPDIGVHpAnO0=
X-Received: by 2002:a37:6748:: with SMTP id b69mr39377769qkc.79.1553868696804; 
 Fri, 29 Mar 2019 07:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
In-Reply-To: <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 29 Mar 2019 09:11:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
Message-ID: <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
To: James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_071138_383483_8822215C 
X-CRM114-Status: GOOD (  21.59  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2019 at 1:47 PM James Morse <james.morse@arm.com> wrote:
>
> Hi Rob, Yash,
>
> On 28/03/2019 13:16, Rob Herring wrote:
> > On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
> >> DT documentation for L2 cache controller added.
>
> >> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> >> new file mode 100644
> >> index 0000000..abce09f
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> >> @@ -0,0 +1,31 @@
> >> +SiFive L2 Cache EDAC driver device tree bindings
> >> +-------------------------------------------------
> >> +This driver uses the EDAC framework to report L2 cache controller ECC errors.
> >
> > Bindings are for h/w blocks, not drivers. (And Boris may want a single
> > driver, but bindings should reflect the h/w, not what Linux (currently)
> > wants.
>
> For h/w block compatibles and edac, I think all we need now is to ensure the DT contains
> the three compatible strings: platform (if there is one), soc and ip-name (if its a
> re-usable thing).
> This is so that linux can pick the biggest of the three (usually platform) to probe the
> driver from, as this lets us capture platform properties we only find out about later.

DT is not the only what to instantiate drivers. If the OS really wants
to have a single driver for multiple h/w blocks, then it needs to
instantiate a driver itself (based on the top-level compatible
probably) and then that driver can find the DT nodes it needs itself.

> The single-driver idea is because ras/edac gets done late, (its not necessary to boot
> linux on the board), and the edac core has difficulty with multiple components feeding
> into it.
>
> I don't think we need platform-specific-drivers until someone has a platform that needs
> one for this multiple-component issue. To let us do that later (and possibly your
> customer's customer to do it), we'd like to avoid probing based on the smallest
> compatible, and use the biggest instead.

I honestly don't understand the issue with EDAC is here. Highbank is
separate drivers for L2 ECC (PL310) and DDR. Both are used on
highbank. Only the DDR driver is used midway. (I think we never got
around to how to report A15 L2 ECC errors within Linux.)

In any case, it's all irrelevant to the DT binding. We don't design
bindings around what some particular OS wants.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
