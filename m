Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EFDC2D0E4
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 03:14:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C45320B80
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 03:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dex9UQQD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MhhQtbTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C45320B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eSYU1nbEMvNMkegncrkBBmwJqJt84+D4K4YpdiPkfo4=; b=dex9UQQDubzGRQJ5CsKlVQDC1
	VYIhEmmJeiT4kJ6Cy3h1m8gvhh4IBSFZvdovqUBtX1KedobOlRtjHZm3/M8aiG0HIwqnr2Rlnlk6v
	9vGXZTraA6l5G0T8ZzVlsyUSJWyzGZ2UBy42a8gtHuYlfZnTNIapU2qY7sbhdHwamO4PXnrPFRqHp
	toVuQjPG8FyhkzMdithVpcV8Tq7OsI7ZmH8R4ULF+G1joPc7+JibkO59leF0K8n8yR1IhRbpqs8OJ
	LJFNY0UIutJyJ1HE+xN/4PT8usN2Cr54IKT2gcSeS8ykYInggiSaKPhsCZowVHN/6DEbEg5BPrQrb
	caX0Z1ehQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keUyE-00081x-88; Mon, 16 Nov 2020 03:14:22 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keUyB-00080T-Hp
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 03:14:20 +0000
Received: by mail-oi1-x242.google.com with SMTP id m143so17361162oig.7
 for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2020 19:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UmXDsbkMyG3TLtFxXGtOYPD+kRSyJ20ru4tSJVWRVhU=;
 b=MhhQtbTSSKCTKj6L6N6yRgPmAq/Bi9/wSZ0bci2FRMthAssY1VMWTwL66hm6coRqEs
 Py2l3hJl9C9xA3x9NnWIIgxiuLD9tQwzWAQaMYVD7N09XjTVcHxjXCOiuYduIpgc+me/
 HQEWx7PVG7lgZ3jBkOO3N1GMg6zJWpNfLkCEPOU8OrfFpYvGGgo/y73ztBv0N8rhj2xh
 v1bLlewoDC7u+20WshYT0q6THMLY0PPz0cMLObfbqx+T+opfxL+2P9HcR6xHxhxN1B4H
 pItkSGEtq6zosMdnUlI3xlcrrbfZKkYLId3aNORkM5KTi1XsXB8qzNMMvv17D6l8bEwE
 4EeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmXDsbkMyG3TLtFxXGtOYPD+kRSyJ20ru4tSJVWRVhU=;
 b=gQ24xFgfrX/1Z+m7JVpbrlqsRTlmH68vadSQ4kC01usbqZ5RkuDuymkKoeFOeBTH83
 AoLhQ1nM09EMOOepJN0pzPZyGw+OEUCYewYHROfMsCKV2XGwGDxoyNjMKZ89cRxNIRDH
 rHddjxoFbTnAuKFs4UDa7PZdi760LzIIs9bvz2bQedKomu1VmLwJhV034WviJIu4YlHv
 6aj/JFQTHo2DWOyyak6ECesWq/PHhiRqiKPVwkY94LLX7FW2mib6R2vP2i/YxwztHpZa
 r+GQogp6iy7/RiMvkm4uKSXqkNANZqq7NdPjLq9HmGknxhFJIEz8pV+wPPuo8ZTB9/Gm
 xOLA==
X-Gm-Message-State: AOAM533cq4cB2SJgNedWq4xTEwV8hcgQsFVfWh3+X8gzq/YAcsE1tSLn
 LK3Mn2HRRhgiJUuLglPAcH8lf7towT6ytk3ru912+A==
X-Google-Smtp-Source: ABdhPJyDqNE9q4x0eWvYqW5pk63CuMMdkh8YP/75hsj5Hw4gwBaBxi0hKu8Sv2f1F706gKCXsdakj45MtBoi3gehBCU=
X-Received: by 2002:a05:6808:69a:: with SMTP id
 k26mr8650729oig.140.1605496455229; 
 Sun, 15 Nov 2020 19:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20201111093514.103155-1-zong.li@sifive.com>
 <20201111093514.103155-2-zong.li@sifive.com>
 <MN2PR13MB279761320CFB61CEBC340B73EBE80@MN2PR13MB2797.namprd13.prod.outlook.com>
 <160516094980.60232.10838645292668930157@swboyd.mtv.corp.google.com>
In-Reply-To: <160516094980.60232.10838645292668930157@swboyd.mtv.corp.google.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 16 Nov 2020 11:14:05 +0800
Message-ID: <CANXhq0oX63CFqUUMqtcoqQavLnTymWAPHSQrfcboQZxznfc+Cg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: sifive: Extract prci core to common base
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_221419_620572_D8459F1F 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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
Cc: Yash Shah <yash.shah@openfive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pragnesh Patel <pragnesh.patel@openfive.com>,
 "schwab@linux-m68k.org" <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 12, 2020 at 2:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Pragnesh Patel (2020-11-11 01:51:17)
> > >+#define RCI_GEMGXLPLLCFG1_CKE_SHIFT   24
> > >+#define PRCI_GEMGXLPLLCFG1_CKE_MASK   (0x1 <<
> > >PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
> >
> > Same here, Other than this
> >
> > Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> >
>
> Please trim your replies

In v4 patch version, I change the definition of macros to 31 from 24 as follows:
- PRCI_CLTXPLLCFG1_CKE_SHIFT
- PRCI_DVFSCOREPLLCFG1_CKE_SHIFT
- PRCI_HFPCLKPLLCFG1_CKE_SHIFT
- PRCI_DDRPLLCFG1_CKE_SHIFT
- RCI_GEMGXLPLLCFG1_CKE_SHIFT

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
