Return-Path: <SRS0=oEUG=23=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23965C32771
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2020 03:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1632072C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2020 03:33:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PAzFbyIc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCJkixNI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF1632072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GeJQHklRS5/JeCRE9l1/tV6BLL+KdFu3cp0MQ+oB3uw=; b=PAzFbyIc5lBqUckldmBt8Vsl8
	Ndl5EUM5vHmpjx4wBR0jq5wu6yFt2U4MCH/00lbYhHDyrh2ilxRzlnpV7IPu7TmI6GUffhKoHrpDf
	vo+4/5w1j0Rm52MomtNy5NdLYluz/y/IGoJyeZS/I3o7CuXpEr5VDICAIWKwalNwlFY7gFOV1VtxI
	yUIN7qR/3Unn1duMByxhCA1NHoMXWkII2E3QacF8ZID6hhp41fLfaXmceyDfsfoYaTyOp3KRyshyl
	00aUb9oG3ZXpfHFKmLb7PLaBC6AiHvrUJZiaoE469v+vWS+oqK/T4QouVriMeYSea/cvoSCgaU0fQ
	OGQgFCExw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioJ8h-0000KW-8K; Mon, 06 Jan 2020 03:33:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioJ8d-0000Jo-Nn
 for linux-riscv@lists.infradead.org; Mon, 06 Jan 2020 03:33:09 +0000
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CAA524650
 for <linux-riscv@lists.infradead.org>; Mon,  6 Jan 2020 03:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578281587;
 bh=RAivqP6Lc204pepIUJNVEUcohHJoNfajiFio/GMszE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DCJkixNIAx6N/hQEBPBeeiFIpRxC0c4/OoS1rg51bOpMTu44h1posLfP+qCgXMBlT
 XIOWsDKVF5zhYGBZS21T9iopw56c8Be+zqyQBmoOg+wMqFcsfP6tOTwrmMd5z5el9P
 k+Zxmiw36ck+qs/tGqeVA/9jbtWfPSiTL8+86uns=
Received: by mail-lj1-f180.google.com with SMTP id r19so49498322ljg.3
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jan 2020 19:33:06 -0800 (PST)
X-Gm-Message-State: APjAAAVpunOE7Ytm/kagRjr0OSkAQc3AhAxz1kJY+0URyPi85oQCyCu9
 dYai7LJxaFACF5380OElgrck9mmQBinesBePDJo=
X-Google-Smtp-Source: APXvYqzL5X4e3S2WYpXmpAiY0PBKY24mqCoVG3XGpDe5FmGNtilugBgiKA2yUQhIeuLRLGsFN50LfS2JMjtDUg5Mlns=
X-Received: by 2002:a2e:8745:: with SMTP id q5mr59668391ljj.208.1578281585149; 
 Sun, 05 Jan 2020 19:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20200105025215.2522-1-guoren@kernel.org>
 <20200105025215.2522-2-guoren@kernel.org>
 <20200106024515.GA1021@andestech.com>
In-Reply-To: <20200106024515.GA1021@andestech.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 6 Jan 2020 11:32:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRd=PmNAj3T-_pD-k4x7aOgzRr54h_J-HCqUjLvVNCoTg@mail.gmail.com>
Message-ID: <CAJF2gTRd=PmNAj3T-_pD-k4x7aOgzRr54h_J-HCqUjLvVNCoTg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Add vector ISA support
To: Alan Kao <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_193307_799996_14E853A8 
X-CRM114-Status: GOOD (  13.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>, aou@eecs.berkeley.edu,
 zong.li@sifive.com, Arnd Bergmann <arnd@arndb.de>, vincent.chen@sifive.com,
 Anup Patel <Anup.Patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <ren_guo@c-sky.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, Bin Meng <bmeng.cn@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Let's talk about libc abi for sigcontext and our cpu has the vector
features, so we need start the work to support stress-test.

I think it's the same to andes, because andes also announced the
vector processor. The linux and libc are only small part of vector
ISA, let's work together :)

On Mon, Jan 6, 2020 at 10:45 AM Alan Kao <alankao@andestech.com> wrote:
>
> Hi Guo,
>
> On Sun, Jan 05, 2020 at 10:52:15AM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > The implementation follow the RISC-V "V" Vector Extension draft v0.8 with
> > 128bit-vlen and it's based on linux-5.5-rc4.
> >
>
> According to https://lkml.org/lkml/2019/11/22/2169, in which Paul has stated
> that "we plan to only accept patches for new modules or extensions that have
> been frozen or ratified by the RISC-V Foundation."
>
> Is v0.8 ratified enough for now?
>
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

