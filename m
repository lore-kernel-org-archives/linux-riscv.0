Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152C0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:45:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D53DB2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dVrxt+MG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Eidwy+tK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D53DB2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6rHBL5hqIW+jpdfbCn1YpIbQJqe4sVjQKwVwio1lHI=; b=dVrxt+MGkotAcY
	urKvbEEMwl6M8Zy3m2Gllj4oNxzoQcsMzGOSCcTwRTL2Y/xGb3/f7KA0sZ8TnSTh/6xTwL3jFTjVq
	BacCScGVeUwZdl820xvyJ8RncmGzsoBbJwYPxlvD1lVWFJwolDtdvbhwWAcebtPbJy3iiITXS3+n0
	4C1KJsQfzMhhWNulwVkXBe0xJrraibFuqUPkWOAPBIQ6wcv4XEekLRVEyyiiwmPwgKeKv4plAAx3s
	o63LaojIB2CsBpSMZW3ddc8PoTh9aALjItYMkljdTidaDLHgH9CozPF/S/K1hUAyzuUYfVtkkoLNp
	C/+jhtiWR5wefLfEK8/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KUc-0001Z6-Qx; Fri, 22 Mar 2019 13:45:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7KUY-0001Ya-U8
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 13:45:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id q16so2228502wmj.3
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oevSDOqGWXPPasn926HQNEciUZ0OqTSLjWI6HnWTWjI=;
 b=Eidwy+tKkDdlCK+NM/TAb4UCVCrqGCl2eq0PBQhZB/NLh3rf7kgbVEh3EtNX848qlp
 ovgwDx//l/e2+K0RbK1ehyhD/HIx47zVtcVY4WtbDk4E352lpWrQ65b97x63k1Flop5h
 jqnJAc2C59OKwuTUMUP1rTyr8QE9kJqcmeDVArtDcD2MXHDg/tLYhP7e1bNqH1ZXdo42
 Gvy2no3INWL5B0ZojJRs3WnRvW5ZDj48oglqCL9Z2BtR4PLrSkshoyc5PUaYE7Uo5BfP
 rj4nuuRDI+P04EXArJzdG9Su8JvozFNeHYtFswZiXZY9i5JVidJqlAOtoo4LOJedCO5U
 mx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oevSDOqGWXPPasn926HQNEciUZ0OqTSLjWI6HnWTWjI=;
 b=XM2hprW5bH2XJBujzB2lINtk4Up5/p6/+wDUYfcrl/jUnYPsVkgFwqBVv3koxFIXts
 7ZX2G512oYCg5xP+VKNRjh1jVzM7Za/V0TwsiTCxwrVZXDf7LdVrLcjQPJ1VDiYCuMtM
 uOExYezJjIDxJWkWAE6sn61DYpi50bBmfjl/KTj8xuwMBC0y43jxTu8DYc67ftIce5cX
 OFFL3fUGznx18AUEkUIzoANb6VzVQ4kOY0MY9Rl934CaluCFMd8jH2EVi3UwNz/zCD8t
 IfSFroDoCy6ZnrblgzC6qPeX3DdvYE6xuNdG+eT8DtdljgeSy9vVK+iQj1Iw6KPWCO06
 /orQ==
X-Gm-Message-State: APjAAAXnD8sRN3SamKGXxbZBY0Pu/2EONPIb6ZqovyHX/npc6WiyWcXi
 iYLNdtWwqq143JtbJkj1DlxNW3vbg/yrfPNEQVF/bQ==
X-Google-Smtp-Source: APXvYqyD68BSqYRiphJ0mQmR481lY3R4I58+/GUkVHKCkaLjnj1BZHpkkM9cjsx2roIl3CQb6c8vYQpyeEXsxZSnwaI=
X-Received: by 2002:a1c:9c14:: with SMTP id f20mr3152316wme.16.1553262348645; 
 Fri, 22 Mar 2019 06:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx> <20190322132556.GB19263@infradead.org>
 <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
 <20190322134043.GA18818@infradead.org>
In-Reply-To: <20190322134043.GA18818@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Mar 2019 19:15:37 +0530
Message-ID: <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_064550_969964_D9AFA0A4 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 7:10 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Mar 22, 2019 at 07:07:29PM +0530, Anup Patel wrote:
> > I think reverting is not right way to go here because there is deeper issue
> > in using GCC cmodel=medlow with setup_vm() which is called from assembly
> > with MMU off.
> >
> > Even if we keep setup_vm() in kernel/setup.c then still in-future it can break
> > for 32bit system as more code gets added to kernel/setup.c.
> >
> > The setup_vm() should not be sensitive to which source file it is placed in.
> > The patch which breaks 32bit kernel just moves setup_vm() from
> > kernel/setup.c to mm/init.c.
>
> I am not saying the revert is the final solution.  I'm just saying
> that 5.1-rc is not the place we should be doing the major surgery.
> Revert fox 5.1, fix for real for 5.2+.

If we revert for time being then even fixmap support has to be
reverted.

The patch only updates access to kernel symbols via __load_pa()
and __load_va(). There is no functional change as such. The patch
is tested on QEMU/virt 64bit, QEMU/virt 32bit, and SiFive Unleashed.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
