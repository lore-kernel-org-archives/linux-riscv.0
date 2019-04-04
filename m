Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBEAC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 01:04:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BFF20657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 01:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HIn25vqh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngFzqrHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10BFF20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMauForVBBHtpyW8PR2AogC98SvHtfslA0lRnIaN9g0=; b=HIn25vqhnZAHfO
	s+y1XRG6es0QPMHRnuFoRqK6ekHCVa+SvGQeM3sz2oJ3t/ivUDtQW588kr9lXn1PDxqe4TRve2AHH
	4ii9rkDTFDyKZj450wU8ZwpE4eLtmBC68fkiuKNMl11S2A4yWhwPPyYguJ9SHLtk5X2Fj9MshPkcJ
	zFpKpWuC3PaIeVli4jv5Uj0Cy9h7QukajphSMRa70L8g1ifKJo1nDXFFO43XYp9EbzdlutGNeAS9r
	EQ3OkTHeLu9vjZh35QjXOGEPX6i0RumQcc+YZP2yIrALUA5YDEaHIA3e8qco7cL/KUjhMN4JAgO+2
	vinoDmxt64BwkmdHLatA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBqnn-00017V-An; Thu, 04 Apr 2019 01:04:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBqnl-000179-3E
 for linux-riscv@lists.infradead.org; Thu, 04 Apr 2019 01:04:22 +0000
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9845221738
 for <linux-riscv@lists.infradead.org>; Thu,  4 Apr 2019 01:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554339860;
 bh=7gV+H9oWVrSmWiRY3ZA5y4avAoyv9NfPzH4g7pSOHcs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ngFzqrHVClHf8AKU8TUdzx2MuAdhyEGs7bD0Nr2Vdjxn6JXcGRKZtxUGYvtoZ7Mos
 ACyEtqzflIYeBo2iy87cjysasCSrq3O/v7xlHZhJW5KU5s5AlUBhTDlT8iI/p06MwJ
 7qS2kI5YfP4lYVDjxJX3i+4ep2hit/A8QhGCLQC0=
Received: by mail-qt1-f171.google.com with SMTP id z17so1281690qts.13
 for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2019 18:04:20 -0700 (PDT)
X-Gm-Message-State: APjAAAUoNC7Fpw8b4+NXWT92UEmo8aiqXSWX/j9m5Op6eGsE187LTtZJ
 9hn5nqePYoPd43W66//fHV3Dk4533YD4qqxKtQ==
X-Google-Smtp-Source: APXvYqyWv7yLQFKukfd4/5BAuNkQxH1Vx/0oZJKIOCVjjboPJD2I1/a8JY6urWk+zTrHQlgB3s3VdhTbZu5R6sAdHPY=
X-Received: by 2002:ac8:33cf:: with SMTP id d15mr2959220qtb.149.1554339859777; 
 Wed, 03 Apr 2019 18:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
 <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
 <20190329142739.GG21152@zn.tnic>
 <CAL_JsqLQ1XvQq7L=xA5Z8Y0Xa4Bmp0t2pgxn+hLF+tD=_L7Mvg@mail.gmail.com>
 <20190329202416.GI21152@zn.tnic>
In-Reply-To: <20190329202416.GI21152@zn.tnic>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Apr 2019 20:04:08 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+NMapJqM4N_kpeojvrS_W19vPLfMzdiENy6FjcOiqoDA@mail.gmail.com>
Message-ID: <CAL_Jsq+NMapJqM4N_kpeojvrS_W19vPLfMzdiENy6FjcOiqoDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
To: Borislav Petkov <bp@alien8.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_180421_152732_13BDD2AE 
X-CRM114-Status: GOOD (  14.39  )
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
 Yash Shah <yash.shah@sifive.com>, James Morse <james.morse@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2019 at 3:24 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Mar 29, 2019 at 02:41:05PM -0500, Rob Herring wrote:
> > DT dictates aligning with what the h/w looks like which has little to
> > do with OS driver design.
>
> Ok, then, where does this goal for doing a driver or compilation unit
> per IP block come from?
>
> Because everytime an ARM EDAC driver pops up, we are having the same
> discussion.
>
> > I never said you should change EDAC and I outlined how things should
> > be handled if it is one driver.
>
> Ok, we will add that to the EDAC driver design document we're currently
> working on.
>
> > DT and OS subsystems are independent things. I can't tell you how to
> > design the subsystem and you can't dictate DT design (based on EDAC
> > design).
>
> I don't think I've ever intentionally or unintentionally dictated DT
> design - all I've opposed to is having multiple EDAC drivers on ARM.

No, but folks just extend 1 driver to mean 1 DT node because that's
easy and certainly the more common case.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
