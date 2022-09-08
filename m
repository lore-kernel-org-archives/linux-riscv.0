Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FDFC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Uiq4CUa8IZVXiDzmf2xsvXhuONY5d/cwBHkmoBpsdw=; b=fVspH8SSkO4GHv
	Mm+clazuq+zFl7f/trZZcWT8tMx8uVFwX6NkNDAXUGXB0bnqDVpz9JlfVWwgEogVTwKt/g3TsTJDu
	AOIBIk7yZtxfRY5+AnpcVt/o4/LHZNXI6n2ysviish34GN5xZwIyKvt6YJg+3qxS3X26hEc0NqRVJ
	EBAXZVrh0aM/Rj8BLoj75Pu/L4tTfKJoqkendln/J7Ctc7xwBYCdXhX6bgCVF2u8a1TfnGSmW2TRS
	4Wb0f9TCxbYgWJSq41eRqrsbcMNTpNcaRjESBiIsg22a2ZX3ZED3JuLh95gije+GuOadWzTa1cLCo
	uEqgu/4cyP128ZLSfjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGPv-0036pN-7e; Thu, 08 Sep 2022 12:13:59 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGPs-0036m1-F7
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 12:13:57 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 130so26079819ybw.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SAM3mkegdCeaGVQgcXVVpthAb6ElEKSQcT12XxK/rDg=;
        b=UYY6e5y5Giua61QzsVGiSq6DQZmkmftZ5Wb4Q3NhvE1cm4x9K/cpS0diwQNlJYBYOM
         MVqzw7cWdy2dJ3NeACQF5z23xfaE7WFpktSAzkfjgLTVY63bPZt0cQNjugQMveKVF13r
         uxGJTiQKmgPL39oAuTkrmi1TJFAdA7yZaQLIYVSvi54x6VSj98lW0HPjlFER2DfiauNU
         lnA10QQoeF7QMS8e+f29qG33KPzOfvgObyjZ9uXJuSvrg6QKANfFrvE7LCmRgkYtLtFd
         ycaHI7Dt7tw1tSrFu880GPKa1Rz5PeYCelMR7JAo001c6e3TwrifFoHBrw/+khYPdwSi
         kxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SAM3mkegdCeaGVQgcXVVpthAb6ElEKSQcT12XxK/rDg=;
        b=sAjHKMlukBO/V/3d56IKMMJcuvr7bQgL5kmjdQ3tlXYMwEmZ4qOs5FOgyCe9rqvFFS
         3eDdCkdairqDmE294q708OeMggmw44HDjxA1mfuyy2W+fxiFX3u4gu5/76kS5g0hGYVY
         9VZsZIjYVPzn9c0/o5q/3/Xp9kwu7zJPJ8YZixkq6CPAsYZcUzaK1an/DzOAH4Vb11Q2
         CIqRcPat332E64q2+uD0WVsx2rENLRApkUGfJ83+IV+bLY/wGAonHevx/BGnt2mZjz5b
         Z6NDqYzxjDe4kA/t2tVcJnbyZ+mRfJROznLHa2e94CfMau8Tar5YKUwL9a9j6cdZi9pJ
         7glw==
X-Gm-Message-State: ACgBeo1ak1FCofz6wY1nqi+yZTAh1PAHE2/bC6qWqqg4XwX2pJtF1/bd
	Rxr8/5otpYrIKcOwzPlCuhN3nk2Gf3vJrKbyxNE=
X-Google-Smtp-Source: AA6agR6A54qH3lxmUpYHnW0X+bo5fGo16klKJB94RRqUN+vA9dsVtSbx9UghA4lAdjeptmty+EzDNfWxIYmbPjPMWiY=
X-Received: by 2002:a25:99c5:0:b0:6a9:6c30:a67d with SMTP id
 q5-20020a2599c5000000b006a96c30a67dmr6851545ybo.117.1662639234282; Thu, 08
 Sep 2022 05:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com> <CAOnJCUKLpRz4Fbx1XiMnap-ELw2k1c8E9V8bZiSP+x7z9Z5QrA@mail.gmail.com>
 <f362eaeb-6ccd-4392-a346-55fa5ae25e13@microchip.com> <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8uttuVd5_UXvNjXU6yG-GpmxG-BuEAm9pWxx13PjZ-h5w@mail.gmail.com> <e72263ee-10af-1249-5f0d-7e90e8e88441@microchip.com>
In-Reply-To: <e72263ee-10af-1249-5f0d-7e90e8e88441@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 Sep 2022 13:13:27 +0100
Message-ID: <CA+V-a8vS_ozrbEC=JmRwMTQxwqsciPdoaVU=rbPK-=DpkhfP7A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: guoren@linux.alibaba.com, atishp@atishpatra.org, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, atishp@rivosinc.com, 
	apatel@ventanamicro.com, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_051356_524908_1CBA74C3 
X-CRM114-Status: GOOD (  17.79  )
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

On Thu, Sep 8, 2022 at 1:00 PM <Conor.Dooley@microchip.com> wrote:
>
> On 08/09/2022 12:50, Lad, Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Guo,
> >
> >>> -----Original Message-----
> >>> From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
> >>> Sent: 08 September 2022 00:38
> >>> To: atishp@atishpatra.org
> >>> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> >>> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> >>> atishp@rivosinc.com; apatel@ventanamicro.com; geert+renesas@glider.be;
> >>> linux-riscv@lists.infradead.org; linux-renesas-soc@vger.kernel.org;
> >>> linux-kernel@vger.kernel.org; prabhakar.csengg@gmail.com; Biju Das
> >>> <biju.das.jz@bp.renesas.com>
> >>> Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
> >>> configure the PMA regions
> >>>
> >>> On 07/09/2022 22:52, Atish Patra wrote:
> >>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >>>> the content is safe
> >>>>
> >>>>
> >>>> On Tue, Sep 6, 2022 at 3:40 AM <Conor.Dooley@microchip.com
> >>>> <mailto:Conor.Dooley@microchip.com>> wrote:
> >>>>
> >>>> On 06/09/2022 11:21, Lad Prabhakar wrote:
> >>>>
> >>>>> diff --git a/arch/riscv/include/asm/sbi.h
> >>>>> b/arch/riscv/include/asm/sbi.h index 2a0ef738695e..10a7c855d125
> >>>>> 100644 --- a/arch/riscv/include/asm/sbi.h +++
> >>>>> b/arch/riscv/include/asm/sbi.h @@ -37,6 +37,7 @@ enum sbi_ext_id {
> >>>>>
> >>>>> /* Vendor extensions must lie within this range */
> >>>>> SBI_EXT_VENDOR_START = 0x09000000, +       SBI_EXT_ANDES =
> >>>>> 0x0900031E, SBI_EXT_VENDOR_END = 0x09FFFFFF, };
> >>>>
> > I am interested to know what is the status of your patch series [0].
> >
> > [0] https://lore.kernel.org/lkml/20210606143848.GA5983@lst.de/T/#m7f4c4cdfb92d6c8672bbfabebda729ce4700e177
>
> Heh, take a look at:
> git grep "ERRATA_THEAD*"
>
> This is all can-of-worms territory that we are heading to here, as
> the Zicbo* extensions is what is meant to be doing these sorts of
> things..
>
Aha thanks for the pointer.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
