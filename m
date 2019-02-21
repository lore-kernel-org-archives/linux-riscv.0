Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4826DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 15:57:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F902083E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 15:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EblWFHgG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="K01g5hXM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F902083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/dvbu+0ltFCVPFw10VaTtX8acUTwWbnnwrnvsmmJe98=; b=EblWFHgGNM2RiKbiNpGsrEv3B
	tNtZ14k200cDnzQ4gNK4YVFwJ08H9eTnrdKL95InOdQwwz51Ydz2bbwme/1KWaogObNl+9ntSJ8Gn
	ZfXvg33WQfltHu6zBrDj+hnS4uUA8PutFyUtvEWMZWbCQtin6STsJi08XokBQv1+l3FurPvEcxASU
	7yHkPxlhimfNdBI2bYX8MOW2pQA6vP3UJck8yRafov654jpa1PM7tj/oc3f8yCc6nyULCQfBfWM7D
	Re2K1OzIs0ByZMa7HTwcFK8ixGcOAAb+j7wVl4Cp418NaVOBjBpl89i72LiEFmEhpY89shsvD84DR
	9w2gcRYVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwqjV-0006dH-T1; Thu, 21 Feb 2019 15:57:57 +0000
Received: from a9-30.smtp-out.amazonses.com ([54.240.9.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwqjT-0006ct-0r
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 15:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1550764671;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=EpJVlS96fwv7PxlUYMEwS+ifcbFIZsijk1RBB7mjrbM=;
 b=K01g5hXMdtuS1IsNerIYtYgbsB5M9/m7kL6BM5EuHau/3rbaTIOEEwJPpJJ2t7Xz
 bubyXbkkLHJpQoT+hFwcnnQ7Wx1aeDJzBrfQOnBoK2Qia2KEPT6ESu1ofpGC9eJgyE9
 a5an6gPdb4bseBYvzRCaN6eH8h1O8yG4W+li4smg=
Date: Thu, 21 Feb 2019 15:57:51 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <CAJ+HfNgwAFevO6cXMU_FjQtLJ=uxHmmWM8c-VWu58SMkKXgVyQ@mail.gmail.com>
Message-ID: <0100016910c70299-07cf38ee-a0b5-4bd0-9fd5-5c9bb6c1acbb-000000@email.amazonses.com>
References: <CAJ+HfNgwAFevO6cXMU_FjQtLJ=uxHmmWM8c-VWu58SMkKXgVyQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1390990713-1550764670=:17593"
X-SES-Outgoing: 2019.02.21-54.240.9.30
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_075755_146427_F57D4ECE 
X-CRM114-Status: UNSURE (   6.43  )
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
Cc: linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1390990713-1550764670=:17593
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 20 Feb 2019, Björn Töpel wrote:

> I noticed that RISC-V currently uses the generic one. Has there been
> any work on moving to a RISC-V specific impl, based on the
> A-extensions, similar to what aarch64 does? Would that make sense?

arm64 does not really handle that effectively. Intel has a single
instruction to increment a counter without requiring full consistency
guarantees like full blown atomics. The single instruction is important
to guarantee that the processing cannot be interrupted and thus there is
no need to disable preemption or interrupts.

What you want is some special instruction that can be executed in a cycle
or so and dedicate a register to the per cpu base address (comparable to
the
segment register on intel) so that you can do

	inc [per cpu register + offset]

in one cycle on an arbitrary hardware thread. That way you can keep
statistics effectvely and without contention. The vmstat subsystem is
based on that.



--8323329-1390990713-1550764670=:17593
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1390990713-1550764670=:17593--

