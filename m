Return-Path: <SRS0=7WNQ=OX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412D4C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 17:27:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26AB5206C0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 17:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f3EU2ztC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ewKn5BWi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26AB5206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJvdrMYI38Z2+tUmYtSK6IwRpAKg5LRUVIVdAiu57eo=; b=f3EU2ztCRALo1+
	1mLVSawBbYXWkRvlnKYlNko+3lGAkOHUPVYQyLmJksdivd6wO/6tHPdsvfzpaVbnzQmdrXTxEkbOc
	SXwquOUbkWLDESVeFmHx+udr++LYDNU2SXwy2qG67di48kfFau+MQtkzT2vaiZI8YEnmOg2NeBFGt
	1Io+7Ppv8rZOVQwmYvTx4R7LJTKs37NzmAgAN/iXcWtZB6b+qGYR54OkonkabGuzGUfCnwo5tS2sp
	P3EKADh/eyPVd6thFmheS2eBcjrvBLZeIz27eurND8bp6a7xPe22Ko41PWDuX819BjowkaV/Po5wV
	caqowz4a6TCFViIoyCZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXrFS-0006Ig-4C; Fri, 14 Dec 2018 17:27:38 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXrFO-0006GB-Vw
 for linux-riscv@lists.infradead.org; Fri, 14 Dec 2018 17:27:36 +0000
Received: by mail-vs1-xe43.google.com with SMTP id v205so3842302vsc.3
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 09:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gZ4TGoFUz+79M8AiQSluX6OEY1WhEWrh8u3QWtC/vbI=;
 b=ewKn5BWi+NmR56VuoKITB2QkqKVIvIuWbRr+CcwGNR09vrsHU8g57u2yp2B223iL34
 aSr7MCf2hUPDXTj3aiPyclH9vhhhZFz+O1bAgxfa36Ar1pUTUWE0rOeKwsT/f7Jzf7Ou
 rp5gADl2SIFVk4CFwKaXeyLfVcbZIuRQBPZXp+0UBN2sC6SKUNrMaj1cec8pnpo/uHY5
 ziJw2pyrPEVEgBLI3wG2v1+i+koRbFLi6hiyRGHTkvfnbOytvOeDfC2UX8I79OSq4laT
 2jBBhtlSFMlaZN0UQfL532CIXErmS2CDp9N0XpuwFtC5DUM04AqVlCzMWa14ISUWMi5X
 W/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZ4TGoFUz+79M8AiQSluX6OEY1WhEWrh8u3QWtC/vbI=;
 b=Ywkzl0Uszi5gSY/KxbX0bpsggDpSiCpFFXWvyhDoauGBo48b+HQLeQKxo057EvHJMP
 OPzvM5cF0F88rmjYHG+a9NPexigB0Fjh3XQ35nlyoAzYcdIBJf//R1IPXWQu9jd/P0dd
 ICgiq7cNQolf9K+iXCNOIOYvDgDvLoVG5GlDYVZpv7YXBuZzccXMBvz7LZmD/Odx5VAC
 mMv9x2VbsVPbcdizWqq0GyobJp4xgljsnmOgseAixNYWawEK8/9vkTzmXBIzHtx2M0Nk
 2yeizTrwQ7BR5OzpyTU3bjmtjTnuv72mC2FKV5tRIBqci0OwwG0Il9NBUS0x2VS0wDWK
 mh6g==
X-Gm-Message-State: AA+aEWY3QKuoatGW2aUf53obY8sEP0huPKHr1uKVDkXZYjF+xoz49pZj
 pCVS+BPweGPVe1malXR5RlHZf4Sp6XPTtrVFTAQ9Dw==
X-Google-Smtp-Source: AFSGD/W2sLO6mnj3v+pe+wimf6XkyMWUfNt7JpxMvjklc48eOMf1z4bEjFkzoaVzHi4YhjRgtrh/xbhGQ9x1xbF/lRY=
X-Received: by 2002:a67:1803:: with SMTP id 3mr1758434vsy.172.1544808443072;
 Fri, 14 Dec 2018 09:27:23 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLi-_R4+wpc834Ku2PkHcHgSydA2HT_s1aYsMeNRqpDg=w@mail.gmail.com>
In-Reply-To: <CAOuPNLi-_R4+wpc834Ku2PkHcHgSydA2HT_s1aYsMeNRqpDg=w@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Fri, 14 Dec 2018 09:27:11 -0800
Message-ID: <CAFyWVaakcVQC5ioOi6nopram8AY4Ph36dYbuohs-j=nuVLFCOQ@mail.gmail.com>
Subject: Re: [sw-dev] riscv-tests-benchmarks tools not working on qemu linux
To: Pintu Kumar <pintu.ping@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_092735_056797_0A0DA24F 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: Gurucharan Kaur Saluja <gurucharankaurs@gmail.com>,
 linux-riscv@lists.infradead.org, RISC-V SW Dev <sw-dev@groups.riscv.org>,
 RISC-V ISA Dev <isa-dev@groups.riscv.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 14, 2018 at 6:20 AM Pintu Agarwal <pintu.ping@gmail.com> wrote:
> I am interested in using : RISCV/riscv-tools/riscv-tests/benchmarks
> But I am failing to execute it on QEMU environment.

riscv-tests builds bare metal programs that directly manipulate
machine mode registers, because that is necessary to get these
programs to run on bare metal.  You can't run such a binary on a linux
system, because user mode programs can't read/write machine mode
registers.

riscv-tests is primarily for testing ISA support.  It has tests to
verify that load and multiply instructions work for instance.  If you
can boot linux, then your load and multiply instructions are probably
working.  The benchmarks dir does have some simple benchmarks that can
be run once you have the ISA support working, but these are just small
demonstration programs, not a real benchmarking suite, and they are
probably all stolen from other benchmarking suites.  These are
deliberately small programs, so you can run them on a cycle accurate
hardware simulator.

Anyways, you can run the programs in the benchmarking dir on a linux
system if you compile them as linux programs.  That is, don't use the
makefile, and just compile them directly with a linux gcc.  But they
are so small, you may not get useful performance results on real
hardware.

> Or, is it possible to create a simple and common benchmarking tool
> like: {Sorting, Multiply, Matrix Multiply, Tower of Hanoi, Factorial,
> etc.} using normal C programming and system calls (if required)?
> But, question is, how should I measure it?

The world already has so many different benchmarking suites.  Do we
really need another one?  I would suggest SPEC as a good linux
benchmarking suite, and EEMBC (i.e. coremark) if you want something
smaller.

Jim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
