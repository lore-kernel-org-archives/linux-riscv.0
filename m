Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF8EC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgCVUvOqZzkRpJgx22tnRbdAmHLYuN0Ln1XqUWkBDi8=; b=3z7hxVF0a8QOwp
	j238AV1dV50u29IPCJZE9nmrMAs5QQ952IrKne7tIRBNUNkFEKG4WX1EyJmCIHq9NNpsXsdDnNCAq
	mVZWI9MnAD3KJCH8PqqYOhOwOyKfCT6ni0wYtUlXdwkUYVrX4N6eoP/17opeVzW26dYiyOF8mrkfl
	m0mr1ZzO4VsIxcBafHj03pTaFbMrOm9Lz3D6KasIORCZ4h1AE7rl0PcHHFsS84S9IYxis+p806nqg
	ua1PdvInPasBA2UAO2NpZeCUq5weNaGaO5fwzb0uyMqtXLTojUtWEQRtvg5pTKmjOIFYJV5rwCajC
	BQMgWGgmxhyfnPE/l4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWG4C-002uw1-IH; Thu, 08 Sep 2022 11:51:32 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWG49-002ut8-Op
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 11:51:31 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 130so20425549ybz.9
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=a436DR9ekYarilCtTMkNs/UYHjO6SBD2Qq+LooUdeOk=;
        b=PQeK/QFDstoxZ+S0453r2TClY9wix1qZLhWHZ0dQYcpE3TvXPQ8HH+kmPBKJSpNInY
         lRQroR0Fr1OONJr8JyeHuM8hfrO1Ah2LbDjw2oH5Vzari4cCnjsI7qYcRK6T74wdJOl9
         fUtaJGdqpVgEwlgLXRaWOsAc+r2nOGyVWqtnS/qlqS+JSeQYok6QcVJ//XIxdW758ww/
         w+wHJQhs5zy3VtJkNwg3vwQRr8wtjGZ8IKSKJiTKZ6TchJpEO2omk4B70NoVVBymi65b
         TCrDMZCTFQhUv5Cs/yCSex9cJBp+WXPoBN2xctxI99u/edfz9OFiG6uOAAkeMbAAqQS3
         y/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=a436DR9ekYarilCtTMkNs/UYHjO6SBD2Qq+LooUdeOk=;
        b=y3h7dVmgaNN+w3C+d3/sJgidyZHv/tBIhgRugiY1WtN6NrEHTxOMSF+nLmpqDuAoQ0
         KK1Tv+2sTWDiqpgVEEiT9sqQJKtb/32SfJjV1A/acC0s6PT7nDyNXgs0MNs4dgLZE4LA
         w/erZuLdn70iPdktWPvljTb7uBenMn0D59VgZmAGblEsLQtqr4Vzv5Hg/CDrznzRZnGn
         39ewWhSt65Gu1hAGX3KQMZBjrl40l3UrjOfi+U/WkzdzAVl8msx+rLCrZnA5rTYDv00D
         8ToSVCXR0YATS4qx02JLY13k2ka7OLBfJnqp/6EfMTvcI1tqSWOfVpkaoctyJuLox3AW
         NxtQ==
X-Gm-Message-State: ACgBeo2Fse9iRBUoz14UVUrBHVwvOY7Srfgr/8GKFhSqxY4xfdyvKETJ
	kEzCPikYJjE7yHAvmhZFpXj1GdYfFL34Ken0dbk=
X-Google-Smtp-Source: AA6agR6E7xqAbO/Yprtm4+wPiLhw7gwiKgsB/maUWDEJUTLb4z+vH9/hiMygV2JLUV4WmRV8WAKxeq+yBYhz05q96LQ=
X-Received: by 2002:a05:6902:20a:b0:670:c563:9180 with SMTP id
 j10-20020a056902020a00b00670c5639180mr6824058ybs.401.1662637885111; Thu, 08
 Sep 2022 04:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com> <CAOnJCUKLpRz4Fbx1XiMnap-ELw2k1c8E9V8bZiSP+x7z9Z5QrA@mail.gmail.com>
 <f362eaeb-6ccd-4392-a346-55fa5ae25e13@microchip.com> <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 Sep 2022 12:50:58 +0100
Message-ID: <CA+V-a8uttuVd5_UXvNjXU6yG-GpmxG-BuEAm9pWxx13PjZ-h5w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
To: guoren@linux.alibaba.com, 
	"Conor.Dooley@microchip.com" <Conor.Dooley@microchip.com>
Cc: "atishp@atishpatra.org" <atishp@atishpatra.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"atishp@rivosinc.com" <atishp@rivosinc.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_045129_823057_4E7C4D16 
X-CRM114-Status: GOOD (  17.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guo,

> > -----Original Message-----
> > From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
> > Sent: 08 September 2022 00:38
> > To: atishp@atishpatra.org
> > Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> > paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> > atishp@rivosinc.com; apatel@ventanamicro.com; geert+renesas@glider.be;
> > linux-riscv@lists.infradead.org; linux-renesas-soc@vger.kernel.org;
> > linux-kernel@vger.kernel.org; prabhakar.csengg@gmail.com; Biju Das
> > <biju.das.jz@bp.renesas.com>
> > Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
> > configure the PMA regions
> >
> > On 07/09/2022 22:52, Atish Patra wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > > the content is safe
> > >
> > >
> > > On Tue, Sep 6, 2022 at 3:40 AM <Conor.Dooley@microchip.com
> > > <mailto:Conor.Dooley@microchip.com>> wrote:
> > >
> > > On 06/09/2022 11:21, Lad Prabhakar wrote:
> > >
> > >> diff --git a/arch/riscv/include/asm/sbi.h
> > >> b/arch/riscv/include/asm/sbi.h index 2a0ef738695e..10a7c855d125
> > >> 100644 --- a/arch/riscv/include/asm/sbi.h +++
> > >> b/arch/riscv/include/asm/sbi.h @@ -37,6 +37,7 @@ enum sbi_ext_id {
> > >>
> > >> /* Vendor extensions must lie within this range */
> > >> SBI_EXT_VENDOR_START = 0x09000000, +       SBI_EXT_ANDES =
> > >> 0x0900031E, SBI_EXT_VENDOR_END = 0x09FFFFFF, };
> > >
I am interested to know what is the status of your patch series [0].

[0] https://lore.kernel.org/lkml/20210606143848.GA5983@lst.de/T/#m7f4c4cdfb92d6c8672bbfabebda729ce4700e177

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
