Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF1CC282CD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 23:23:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0607214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 23:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7kkuWIq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="G8hGiJZm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0607214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gkq2+EdChpmWMJl7G+tcw0aWqUYlDnSrOmdvRGGwJkg=; b=X7kkuWIqcXD1Kq
	EgDa8uS5W28ZXV4IM8/xnw2n+BGyYoX/U7En6ilLbuB8DQBxtE1rqPsTtIoRVfHwv8C6HHY/56mT1
	guvit+utxaxcX4E1PE3XwX03lk5lssgY5/pO6t84tq8X/cLNAFXuUCpwdqdDq9mt2TENbJr0ZBfQZ
	59406HO9E9a6N+WJXPYiTIP62wBDCHAXME2JK+jE3sjeRSqu3hRqDKyeiyG88SaLHuYzVU1TFrLcl
	gm2NN708sYP/mH77CnFA9LUgpNKZHnZGyS3RIHZR5ZDemjAGx/9zc4T0hMZPlMYquBbuxXCLamV34
	16hvPSoavrJ5+Hn8+jbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goGF4-0003mm-Ps; Mon, 28 Jan 2019 23:23:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goGF2-0003m6-Jj
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 23:23:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id g67so15776905wmd.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 15:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rL2ke4BgMMGJiZ/9hpGvvifFpTfg8dePwee1MY1zgfc=;
 b=G8hGiJZmidS8Fcq//T4GbFU3WHwGRnWTow1ltRU/3OKYCNNMADQepQAdTjI3RzK+Dw
 MDAV6Kr1uvP8NyENsTzY23kKDwua+zs1b+m1qxhnvV1o07fFEFPMpBrxt9NGF6EWP2b0
 hSONsJ8F1lfYY991G7XlpJbJkxAdxYIXXUyqFolEttnmEPwdlfYhembVnh8hRou2LojV
 Hsoh/lf2a8D7000/fp6u3BSNE33xIuhBaeP0lE6vuLT6s2DwW91tHXdz2mcDqyYLllFL
 D/5DLIGtR0HdyjjcvCmORsEkRhgQQMoMPMzr3yWyY55OoONat6FNnPkZ2kkLWg2lNN/T
 4KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rL2ke4BgMMGJiZ/9hpGvvifFpTfg8dePwee1MY1zgfc=;
 b=SF+HKHZ+iw2KRnqzJDBar4Rnra5/bB3HeBWorBBYaAT1Jq6Po9DkHRwqNHw/wx+YXL
 Q/rtnZaMHq8AzEjfDUtqD74h8sYKc+ASAoCYqzah8Ue2wwJWGQArdIGn59KrlDY1w+XE
 919q1Mt668smPNAfjNucMdd52x2t4wTf6mZZCp2WaFaIbAHakGWS0qABpiHf/dK8YKyq
 xLxDIJBhe39OZsrXN+juUadWlVTXS7NG2d2KIGINi8GWkDogs+JpVR+AlDo4+uZSmIWC
 NcplZoddYKCEUK/BmWzNPQmodYbbbotbM0y0psbsMcxlf2QJvzAflunJmaZ4m+ygr53m
 knxA==
X-Gm-Message-State: AJcUukdIYF+6DPbrMPRORDm78Fljl9HRoF9R/iSE3hbzATDAj3SWYtof
 wpVt7HsGJMJHLK+Ywj5Vgi7HMpB8aOlnZid2jJOigziak0c=
X-Google-Smtp-Source: ALg8bN4vi0ky1Lno4W5Uqf7W+BT4SRM/NhdnbJaDCeKio6GVruewcPcNfmLtih7o776pYyBdgTy3STjfoX98GQHSJQQ=
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr18789367wmc.106.1548717775081; 
 Mon, 28 Jan 2019 15:22:55 -0800 (PST)
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
In-Reply-To: <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
From: Bruce Hoult <brucehoult@sifive.com>
Date: Mon, 28 Jan 2019 15:22:43 -0800
Message-ID: <CAP8PnuS4vE-w07dENEpJWx_nu-yx3fsyM3nu3kUQoVFW5nzJcQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: ron minnich <rminnich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_152300_672675_DC61653C 
X-CRM114-Status: UNSURE (   5.69  )
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
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 28, 2019 at 11:40 AM ron minnich <rminnich@gmail.com> wrote:
> Short form: if the PMP makes it impossible to measure, disable and
> replace firmware from the kernel, then PMP is a bug, not a feature.

I disagree.

The owner/user should be able to change the SBI, perhaps by booting
into a special mode. The kernel in a system running normally shouldn't
be able to.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
