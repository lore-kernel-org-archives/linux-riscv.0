Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE592C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:43:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78AD7214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a23vTuKK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="VJweNiwA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78AD7214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCRUfsuhSDYLilz1z1MxZH7Aj0q0U7htLW+25m+ix2c=; b=a23vTuKKMcEcDK
	bwEzhkK3wPv925UbSo0zg7/DAczxMQcpKmoegT+h29+m2vXuAd39Rg8zRQGti3Bo4eJwsEsegL/N6
	AHNBAnHJphh5UnbX4pkn0Ph0fmMQzGxKZ8j4ZFTcKgz0Nc33xoUE7nTg+KAzoNQFIIC58QfGYtDAk
	tSMMS1RVZJJVoaqZCS32UdlEn0a7qfkssaeO1cZ89fLg35jGnl5BGhdU53SY9i6c/s9UNI6kU2K5O
	4oUJAHi2A9YBJEm4zc0Tjs0+XgsnnxXSNYg97N706JnC/lVrV7adTIfdG0mhtxui2BPTeR9JgZQUY
	t+3m/iUP3f3idtxdT3uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3lQm-0006k0-18; Tue, 12 Mar 2019 17:43:12 +0000
Received: from a9-34.smtp-out.amazonses.com ([54.240.9.34])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3lQc-0006bP-7w; Tue, 12 Mar 2019 17:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1552412577;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=4njMMSQhlC3x0lhS7hf/Lj82ERNcRfwIi9DRxSLyMQ0=;
 b=VJweNiwAq0RV09x66jLku4qFoSPzeCdNcAzBnNGFlDS3EjBmfgTuYm4yLOradt5D
 nP2j5REWaMi2zdpaLiTOCysV9jRhmdCFXENwIoZbqXPFZRp1WAIPYovFJ80gZ8M5eg8
 rob8tk1UWV7uKCsKj7oE+b003Whf08eXik3E/UFU=
Date: Tue, 12 Mar 2019 17:42:57 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <alpine.DEB.2.21.9999.1903120717110.26459@viisi.sifive.com>
Message-ID: <0100016973000e88-99188bf8-0831-4fa4-b3ae-7de6547b651e-000000@email.amazonses.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <010001697026a740-ffe901ce-8e6a-445b-883f-068dd289b0a2-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1903120717110.26459@viisi.sifive.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-SES-Outgoing: 2019.03.12-54.240.9.34
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_104302_350046_A968BB48 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 catalin.marinas@arm.com, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 Mar 2019, Paul Walmsley wrote:

> The counters, though, may not need the preemption disable/reenable.
> Christoph, you expressed earlier that you think the overhead of the
> preempt_disable/enable is quite high.  Do you think it's worth creating a
> separate, restricted implementation for per-cpu counters?

As I have always said: I would like to have per cpu atomic instructions
added on RISCV V that works like those on Intel. Single instruction and
relative to a per cpu based addressable counter operations please.

I think the attempt to reengineer the core counter mechanisms on Linux is
not that realistic and would require you to first know the cross platform
issues that have driven the development of these things in the first
place. Sorry that I have been just superficially involved in these
discussions but I have a hard time seeing this going anywere. There are
already established core implementations and various arches take on this
issue and those have been around for longer than a decade. It will be hard
to come up with something better.

Can we focus on the RISC V instruction support? I also do not think that
this is a currently pressing issue but it will be when you scale up RISC V
to many cores (especiall hundreds or thousands of concurrent hardware
threads like what our interest is likely going to be in coming years and
likely also when RISC V is going to be used for enterprise / cloud data
services).






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
