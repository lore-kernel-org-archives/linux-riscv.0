Return-Path: <SRS0=Tq7r=WZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E743C3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2019 09:55:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C7B2339E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2019 09:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rm4PTnwg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MS5MBdUI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C7B2339E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEC0sDyGuuaE2d0q+epAagdYczskid5kR6wekalhMyM=; b=Rm4PTnwg96FpTR
	4A/authifuRutSYxkzV6eE+QiLzLjPDFPhQzpiUMkjDxseaUzSzTY90JzRnHyRparlOt3NW5qDnJJ
	bL+6E4qoHAXkoAm5mA/HlJa3qpVSpB4BBx4NDgdVNq2st9vLl8FE9GKQzc33FgtXq0NFYNLrvbl8b
	Hr+NfItYuucPc1iMXRyvHf0GqiWM02krKxNaaYVAtzo2tiqfRzSk+AfMDP+V95+PZss2MutmaNqcT
	/a+cQyiZgOgEqyERXo7gjrOhcZuFZ6hBcuK4cWPto11Kb5oKzUrUOZCyRrJNFnedBKBNKMegt7G8y
	tfhdioobLnx3ktLT4rww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3H9Z-0006mC-58; Thu, 29 Aug 2019 09:55:41 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3H9W-0006l6-3n
 for linux-riscv@lists.infradead.org; Thu, 29 Aug 2019 09:55:39 +0000
Received: by mail-lf1-x143.google.com with SMTP id j4so2008483lfh.8
 for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2019 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=evvUwMaL41hf6dQA5cbASb1N+VW/0lgS0C0cgu/S/XY=;
 b=MS5MBdUIFrK8j7JVNOIBDd0FVG15855op7IYcP7tlLIytYN6qxJRW0N8GjbTb23lbK
 rzQwQUy5RXgjl9OKpd0TEJGbSIAXrlppU/TkbF3aoQu4IIS1KSgFJsFfpHonZL4AuQ0r
 rQknOTfDjLfaJS/JJ3hYzVhSPudYP6OpPr5jdBlAp8Ln/oLFKkTDLxTrK6FtpSAPuTaB
 bC7yPU4oCUVaxI442RhA2CWrNDSNVDbN7hMRiym/QPz45b4MEA3XIKe518XH1JAE6+mB
 nM/yvP6HU7Wv4hr76APo59aA6DDuCNx6Accapkzd1cJ/BZjMnoNSjvf9stgHxe2BXlWc
 PARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=evvUwMaL41hf6dQA5cbASb1N+VW/0lgS0C0cgu/S/XY=;
 b=l6dPG22IH4xITkOPEOrPTC5CO1ZEjs7XN+wQL1OhREMW6YwuSgw1kafZX7/s0wQl0+
 OP36Qgj8kP8LI2pcu027y8y7UM8cp6Zs9qjRFbZbBGiJ0YSZENthVCoxtvlp7HnTxwXA
 U8V6EDyddzZJaXnlN2yAFD+R7mf8viZdX88dVYtLqDCPSfaLzvTIMkqC6uVIPHkFSHMg
 4ssulVe2iMpe9scVm0kiWPXESjvS3G1iWTEo/sBGSyoarFEScJzHw6YbI1vQrYFVwpCZ
 ZSXNZQT3/9MB3tuPELpYq12tpsuIDY5g/fy+meVWQa3LJu8UHwa6bn1r4Z44Rbomo+Ya
 GdHg==
X-Gm-Message-State: APjAAAUxBl1EoKak2oCUQ7QPfn/1w97qbNzD5mbNY9N7ZMiHPBznCVPc
 XBgg9/FES1O4K4QHgiEI/7yP+GVutq0oSiULtmE7Iw==
X-Google-Smtp-Source: APXvYqwgzlt4Ba0fIdipzn2QNcarMqY0UEZGFrkuppA5LS/NNCU8eU6W17GnvKVQldIpJENYm0vxsdEZmOv6K7MVIh0=
X-Received: by 2002:ac2:46ef:: with SMTP id q15mr5544001lfo.25.1567072535444; 
 Thu, 29 Aug 2019 02:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <1566882364-23891-1-git-send-email-yash.shah@sifive.com>
 <20190828.140644.534529249197568915.davem@davemloft.net>
In-Reply-To: <20190828.140644.534529249197568915.davem@davemloft.net>
From: Yash Shah <yash.shah@sifive.com>
Date: Thu, 29 Aug 2019 15:24:58 +0530
Message-ID: <CAJ2_jOGiTgGZ0TEZt6hBVB3oFxWkrrKVGQ6n__G4Zf_-ijY10Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Update ethernet compatible string for SiFive FU540
To: David Miller <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_025538_221644_95D97EC6 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Sachin Ghadi <sachin.ghadi@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 29, 2019 at 2:36 AM David Miller <davem@davemloft.net> wrote:
>
> From: Yash Shah <yash.shah@sifive.com>
> Date: Tue, 27 Aug 2019 10:36:02 +0530
>
> > This patch series renames the compatible property to a more appropriate
> > string. The patchset is based on Linux-5.3-rc6 and tested on SiFive
> > Unleashed board
>
> You should always base changes off of "net" or "net-next" and be explicitly
> in your Subject lines which of those two trees your changes are for f.e.:
>
>         Subject: [PATCH v2 net-next N/M] ...

I will keep this in mind for future patches.

>
> >
> > Change history:
> > Since v1:
> > - Dropped PATCH3 because it's already merged
> > - Change the reference url in the patch descriptions to point to a
> >   'lore.kernel.org' link instead of 'lkml.org'
>
> Series applied to 'net'.

Thanks!

- Yash

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
