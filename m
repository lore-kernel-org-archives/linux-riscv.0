Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF314C282CD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 23:47:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39ABC2171F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 23:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C3QhPtEn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="DQLc0JW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39ABC2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLzZDlDO0mZFsbxEKSqEeRr5yJd1hR0t4vmAJ+bQOJM=; b=C3QhPtEneW131c
	Fg9ttYntdC1YeY7abvNt7R6m91ii2gTu31RLQYn+vr3DRwcuV3URoH3n8oKMA9+VTZOO9w4ihCLBm
	x5EPZdpYcAzVKq2KcHIDIvr2NnND3GvcuOw8n2oLEkCdWpY5aqsR10a9QZc3SW2OtUXRR/YU8acq9
	RWaJrnp4PM9lzbHbRLZ4yK8E94jUsjEATOYB3YR2jwrPygWB+chkF5eHPRGEyT1ZsOpxSWl0emhns
	n2b2vdmBKsfs1be2jweQAkCqJrSsnHR7tZwprrYUjEE46VAYWSU65VR5mTaZLFCsUiaEgISHlH7UG
	CEp/+mN1VIZUF89+wgHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goGcR-0004Uj-9i; Mon, 28 Jan 2019 23:47:11 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goGcI-0004Qa-W3
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 23:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=hBHspZtMelXCni8ry5NMINciJBUZLS4gkQJuooZZMHM=; 
 b=DQLc0JW/OzvftJiYgKmiB0p4v+WGRzcNPME99ee9U2r20geZiq9WkBb2vaUhzDTzKc2fAV9pDNHCaXlxkV9cybE/toC+QbrKDuexzJmovjol3wQ6HQ0fvGmxmbR23kJbkESVlj+nLo3oJtwpgj8pCa6EBflyvW1j03pfmNvcvjg=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1goGc0-0000A8-GL
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 23:46:44 +0000
Received: by mail-lj1-f174.google.com with SMTP id x85-v6so15892174ljb.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 15:46:28 -0800 (PST)
X-Gm-Message-State: AJcUukfJ+AydEk3VTXlou3E8UxLsu6ezHlOu4Vm8BZ8ZsFkhJEqEJRtg
 Hg/FGtWT/9pmvnDm+X2XJJlOVgmHQOvu05xsVvY=
X-Google-Smtp-Source: ALg8bN4Qhvzw1521gND+LKm0ooZlE/oKP5HpL5UIzX2PJkjStcr1NkBVlQikggVq0Dl+uHxL5ZyRgkHnAzTQNVgJo8w=
X-Received: by 2002:a2e:9a16:: with SMTP id
 o22-v6mr18868964lji.112.1548719182926; 
 Mon, 28 Jan 2019 15:46:22 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <aadef824-7c76-5784-0ec8-de4344158c15@suse.de>
 <CAP6exYJttZXUp=NAikvQ-9Orj-Ptpj4=Pnj30GN90Rzt_Rvvyg@mail.gmail.com>
In-Reply-To: <CAP6exYJttZXUp=NAikvQ-9Orj-Ptpj4=Pnj30GN90Rzt_Rvvyg@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Mon, 28 Jan 2019 23:46:10 +0000
X-Gmail-Original-Message-ID: <CAPweEDw3us0adr9B9DgLMn8GBbJiPjScdkfJA=3QpatEW1Vksg@mail.gmail.com>
Message-ID: <CAPweEDw3us0adr9B9DgLMn8GBbJiPjScdkfJA=3QpatEW1Vksg@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: ron minnich <rminnich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_154703_174024_CF210752 
X-CRM114-Status: UNSURE (   9.00  )
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
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, Atish Patra <atish.patra@wdc.com>,
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

On Mon, Jan 28, 2019 at 8:18 PM ron minnich <rminnich@gmail.com> wrote:

> That said, RISCV will have the SBI, and there is no getting around it
> for certain purposes, but there's no reason to encourage growth.

RISC-V is stated to be founded on "learning from the mistakes of the
past".  we're seeing empirical evidence that contradicts that
statement.  the problem is: the position of the proprietary companies
who seek to create secret firmware is quite reasonable.  there are a
number aspects, which should not be confused:

(1) the [false, arrogant] belief in "security through obscurity".
this is the belief that if the details of a security algorithm are
kept secret, that nobody will "work it out".  decades of evidence to
the contrary do not seem to be getting through their thick heads.

(2) the [unfortunately reasonable yet unethical] position that it is
only through early boot that "trust" may be provided - and by trust i
mean that the company that *deploys* the processor can "trust" that
there is an unbreakable chain of DRM which prevents and prohibits
tampering.  [i do not mean that the *users* can trust that their
rights, privacy and freedom are protected]

(3) the [reasonable] position that proprietary early boot additions to
RISC-V really do not need to be published (and would result in the
horrendous proliferation of customised early boot firmware
modifications noted eariler in the discussion), and that furthermore
in many instances the company *cannot release them anyway*... because
they didn't write them, they only *licensed* them.

examples of type (3) include Mediatek and other 2G/3G/LTE and WIFI
companies that typically have shared-memory embedded DSPs, or other
solutions that involve *third party* real-time Operating Systems on
which they base the software that runs the WIFI or 2G/3G/LTE service.

it gets even more complex when the FCC goes and fucks things up - and
you get idiotic people *in the free software community* supporting the
FCC in its consultation to lock-down WIFI firmware, as happened a
couple of years ago.

the reason i mention the FCC in this context is because even if the
full source code of WIFI or 2G/3G/LTE firmware running on such hybrid
systems were made available under libre licenses, whilst compilng and
installing binaries based around the source it would be a criminal
offense for people to actually *use* the result binaries based around
it... unless they paid the USD $50,000 fees to the FCC to have them
re-certified.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
