Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF897C282CD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 16:34:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 763AE20811
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 16:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9lqxSqm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tBKv5brJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="g7yiErXz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 763AE20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5gpjack3YsHR/3/ItJGl+yowiKjImPCfatiSfvEICc=; b=a9lqxSqmA2ds5w
	4LJm13WNBvSvxk/ZfaL/nGuqSAjhFy9Pc6i3ssWVN7/c1D087e3Yk4gqWX104SOxMjKyMN9R5OAhY
	PUV7whPrcTIASLeLwksrBMAkMKzMw8B+2B0SUgn54ku8jvLAEjpDFVBKzFobIUbmVFWnAM1gsQTCO
	CMqWnZugSBPSyP5FvAjR+Fh8XCky3JJnVXVYvxnSIJ9ABAyLfox3kQqtrmWPoLpMcSCVU+pFxOAlK
	DP1U+jx+PAF3RoWLSJ7zTtfBUQot/emduK5xIhtdnoXZREyWZIgUein6ZGVj1OWfNxXlP41xCcA2y
	/M06JWswz4gpC6SVYbdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go9rT-0003lS-RO; Mon, 28 Jan 2019 16:34:15 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9rR-0003kn-AM
 for linux-riscv@bombadil.infradead.org; Mon, 28 Jan 2019 16:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EanT+WV4zvhzE83xFv8eh4oAtknqe8EfRXTzifT5JMI=; b=tBKv5brJRCPPrGQar3v0E+OYA
 /0G2WnEVsytyt9nUEG8kQif/YCR1L1wcbfEP/Mei8BlTJzDCBOfTwVuKR2qgpNp26HGT30PDspbWX
 oUifGeYTpa7xyuP00XRbum2Uc6lcBRS8PirAVuR4PRTz6xqtFc5Su1ozOeVmCao/sXgPmLlw+S1gU
 BVCmulhXDdlpfC7T3R0wgcUwUPaPSlzEPV3nnC/GyFkMINvHy805OXeJWKkUw5iKRVrWkLVUpsW5t
 eOVQkzsflDP8XJyLVwAswI1RSot0JYeETT9vCSAuuB7zkqU53Pc+iu3ZT9fe36rYTPZ7017yXD3t/
 4JFQ0anGg==;
Received: from lkcl.net ([217.147.94.29])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9rO-00012d-Aa
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 16:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=EanT+WV4zvhzE83xFv8eh4oAtknqe8EfRXTzifT5JMI=; 
 b=g7yiErXz+ta0lqXGDJdQJPngFewFCiB8YRKcBBHw6ONBUVJTLjlS/Eoq39/DWWVJuHmyKU0cSUyutAExCZx6UPILl5PBY2vhJVqZVXtt++paosZp71AAHh+zf4A2WDJuOwRGXlTUUtv2wOVAefhihQs0k71vzL9MK1q3/JDZyDQ=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1go9r2-0007mk-AF
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 16:33:48 +0000
Received: by mail-lf1-f44.google.com with SMTP id u18so12301922lff.10
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 08:33:24 -0800 (PST)
X-Gm-Message-State: AJcUukfaWgtLubx9LFSRgDvxGvs87WygtNjBsCb6xcwOKVv/qFG0Y9bf
 XUCKTKqjP9kMphtlE5xfzoNwMuZAQYGsZ6M+bgk=
X-Google-Smtp-Source: ALg8bN7mXGo7S1+dxurq18QEZyrfHgGHB7dwOklchdWHBSoC58bbkS5jrgTAhd7MGiqjCMlcJ8irNZHBSFWCvdCfU1c=
X-Received: by 2002:a19:2906:: with SMTP id p6mr16844679lfp.17.1548693198594; 
 Mon, 28 Jan 2019 08:33:18 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
In-Reply-To: <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Mon, 28 Jan 2019 16:33:06 +0000
X-Gmail-Original-Message-ID: <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
Message-ID: <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Alexander Graf <agraf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_113410_551049_88A0F076 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>, Atish Patra <atish.patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, "zong@andestech.com" <zong@andestech.com>,
 ron minnich <rminnich@gmail.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

---
crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68

On Mon, Jan 28, 2019 at 12:44 PM Alexander Graf <agraf@suse.de> wrote:

> > If Risc-V wants to avoid fragmentation, it should simply keep a firmer
> > reign in what is allowed in an implementation and keep a lid on such
> > horrid ideas as vendor specific userspace ISA extensions.
>
> I tend to agree here. I think a global identification scheme is
> reasonable. But can't we just live with a single global spec that people
> contribute to?

 unfortunately, alexander, the RISC-V Foundation has chosen to exclude
people from the discussion, by choosing an ITU-style ("Cartelled")
secretive standards development process.

 so as an "outsider" who for whatever reason cannot join that closed,
secretive process (for example a strategically-critical u-boot or
linux kernel developer with decades of relevant experience but who is
under contract) even if you wanted to contribute to a single global
spec, you can't.

 the reasons why the ITU-style Cartel was set up have been discussed
and made clear (patents); the justifications were knocked down; there
was no response.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
