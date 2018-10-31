Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22FFECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 19:21:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA9F20657
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 19:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ui00HjF+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="coXimtjZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA9F20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a32JnCDCuJ611ZwhKwq7hqjQznEpa+4SNK534SIdrmE=; b=ui00HjF+H73MIs
	QWpOdHMyLJbystkz82zIlKVI/tlN8hAVhduXI0Dvanr+wFazfGv0zeUrFeX08qYKDxeVBg4evC9Ju
	4VUGdtoOb/9JrCRDXn8T5MMLpr+S119GM3KoeyWkkaXmu/QUHdPawWltnX1DQEq8sCm2APSJsrHFs
	NmuaaJICL1Lr6J81wDLhysDPbVhiEYLzmWbKFrz/n0bbgBseaPOjpLb4hgqVysQNJQSyeT8DknfEh
	eHXAekxKlRH8j1vaTwGyksBCNz8aai25fi96/tUaoXPSRy1+kpPD5/vxicRnmqQuTPEj9Vbb7JM4K
	/xTK5EHqgO+uTxVZG8PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHw38-0006R0-Oj; Wed, 31 Oct 2018 19:21:06 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHw36-0006Pl-JE
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 19:21:05 +0000
Received: by mail-lj1-x243.google.com with SMTP id z80-v6so9851135ljb.8
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZHNsws9O0ZmFQDI+IpvIriqFgxG0Yi+asUfseioP9mU=;
 b=coXimtjZA6VWR6GVxkM2Egja1wyKPzX2LfMp0o2xycfy6/5jtOWcZ0V5IBcG0H2k66
 /ZXBVeydkL3w9RbjlVw+FCLebNiWIedqzAYDPeDHYDK9wRiXMF+WLBkOloqVo2I5kS3s
 n93ViTMVqion/f6OjJzgxrH2ia3mh0niP1L6PSZQWE0Ko4T0Y7AaU4BUaMJ9rv8JsODu
 OWH+zleA81SLPEuaTq4DqtPJ/3aj0vnjFRu/YbLHtg9Kin6TbZ5MdU7Ma/86qyUAj0/2
 hmxguW7WVFKvZ5X2ir69XiH9G2qLuuoik3zAcdmTCFlHtLMDbpCBiGl23gD5ngUQVXiV
 88qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZHNsws9O0ZmFQDI+IpvIriqFgxG0Yi+asUfseioP9mU=;
 b=Mi38Ro94LF2+n9heLIoNP3I2celGqjEs/yJbbx1C9abdI+uYqQ7o51+Kb4n01Op6tL
 QFHXlBFBUKU9ifcbOJq1afD7nE4h9+oXKF0GjdpZdZd6juq7O5JoG0piMzWpdPedEV/V
 SjNeAY8Zd3K1I71STwIt6KNb1zDQ8sCEJRJnrf8pW/AtrZW8ixDLZoZuAFXAYhM9uhzL
 4Eq15nEqQWwpLVEOfjvbFpvDCXHqAnlYn7Y09EOO7/HzXRUSif4eagOxUGCmvFoF9w9O
 9R5jcg4vZ9wVy2tRs9a71f106ysAHPapZdo+6At1c40pvD7cPUNYw24hPSU2qDib8nzW
 MnGg==
X-Gm-Message-State: AGRZ1gJUlUZwa7trcVKlC00evrIyIcHE0KiAjVtI+U7UMAWGVP1Ib5+t
 4USwXAFO76AHoHLOjhcYH+JusXXCcB8CN2IKySZE1A==
X-Google-Smtp-Source: AJdET5c3H/ofrFIXOHXrveIrCN9S8MQsbClDOSUeYV4+UmnaAt3zQ3iUGOHyiIHggmb5eYMwK1eyMPw5b+kK1jce77A=
X-Received: by 2002:a2e:f02:: with SMTP id 2-v6mr2897459ljp.134.1541013652187; 
 Wed, 31 Oct 2018 12:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20181030123720.3273-1-anup@brainfault.org>
In-Reply-To: <20181030123720.3273-1-anup@brainfault.org>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 31 Oct 2018 12:20:40 -0700
Message-ID:
 <CAOesGMjXZNURZ4SdKjssYCcFv3=4MYLBpBpzvvb1rNM-fo=QHQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable printk timestamps
To: anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_122104_638266_F2513C05 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031192040.oNbGXMLHBmJiROsZ-deNTCPjdUXOHk9gXRdMzeQKEAM@z>

On Tue, Oct 30, 2018 at 5:37 AM Anup Patel <anup@brainfault.org> wrote:
>
> The printk timestamps are very useful information to visually see
> where kernel is spending time during boot. It also helps us see
> the timing of hotplug events at runtime.
>
> This patch enables printk timestamps in RISC-V defconfig so that
> we have it enabled by default (similar to other architectures
> such as x86_64, arm64, etc).
>
> Signed-off-by: Anup Patel <anup@brainfault.org>

Acked-by: Olof Johansson <olof@lixom.net>

For next time: doing a re-format of the defconfig (to shuffle config
order), plus changes in the same patch, tends to be a bit fragile. For
cases like these, I'd recommend hand-pruning to just flip the one
option if needed, and then have Palmer or Andrew refresh the defconfig
during a merge window if needed (usually quite rare).


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
