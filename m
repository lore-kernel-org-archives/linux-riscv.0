Return-Path: <SRS0=JLSQ=TY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D309C072B5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 05:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6186D217F9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 05:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FIKZL3yy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YYbVYxF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6186D217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1e5EO0Isa6xIdsKQOtx5xt+Y2At9te/AmNyIDzOSGg0=; b=FIKZL3yywI1fuI
	4XdGAMSFeCxmqGza4qdx9VKgD+6m3ImeH/9Cwk8UDDtLh6ZNrEYmubz/Mf0P724aYuQEOAK90mJ7Z
	yVVrIUXCmvMemFGBj2A2WFtA/m9lsEBsIDLZq93rG9qOaif63qfjLkFxpjDFDKbgKSca/Wnjl1jIm
	seb1k3Yz1AvciOI6BuYF6QLnT/LIctWsMGu8kJ0whPj2eH25ac7x3gKQY5/RWAc/uuf7++wO19OVT
	b5oxP9cBJ7Wxw0Js7ETJcGvrrpA2IIK3E0OofJuccdxGdi1U6XrMAjkrSUBjou8c4qRHJEFzK5nCd
	FVdUKYnytJjz+r/J71TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU2Ot-00045J-Im; Fri, 24 May 2019 05:05:51 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU2Oq-00044T-44
 for linux-riscv@lists.infradead.org; Fri, 24 May 2019 05:05:49 +0000
Received: by mail-vs1-xe41.google.com with SMTP id c24so4962659vsp.7
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 22:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tKVly6OsjAP22H8YmM5rdYdS5YdPghJ8QErKTSHa7AM=;
 b=YYbVYxF6Q9/uYNoqs8vrH9SJmroJSJaP37lSIzKdWSzQBcJ/xpe2IYe/QqzKtLyQQD
 +mgzMgT2mWRdPK2QGhjlfc3yBnWAp5Ugakm4AXKL10W+s6VPjL7KSE/mPQqdO2jAuY9R
 jf4ODaHOOT2EB/XZicSIGzsKK8LptVeP+GAkepgZi4qO4rN/gLOtSbDi0mtSiw5If5Vl
 xWec84BewQq084f38kXoEm2IzhMH45y7lMNMpOu6fWzJsvZC8dynWdPX2BRPH1exFtTS
 6ObR92e+wS3VYIC0gN9Rx7wm/IRdcq5Vc0Ji0MLRNS/TOHs/bRN/0WfvlzFiBfPd18Uj
 7+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tKVly6OsjAP22H8YmM5rdYdS5YdPghJ8QErKTSHa7AM=;
 b=kaPzT/n50XCBHlgue+s+txorqE2Lx7sVziSVJGKiLAo9aLZ+o3k6QnBId5jVWWIpvM
 DUgOnfSGqRGpdf9qZ6UdNiFO5YEnJEeFKdNt3AmGRnO8pfXGDD58dBaSLugkmhY7o+Au
 Ryyif/SNUPZTE61mr5hz2gzYT/NFaIP79DjRTXIbAnUEb5Wp9MY8aptx7OPXKN+5l7aM
 CYsZA6oERnWqBCt58f7bCo7NU0blDAz+VKFZRRVNvcDRYB4Vrk/FVfJQZ8HnvGB3eOx9
 V3YyayHSTq6tT/sHEXQmjTpcjPhFhJb4ikbSxYPmmBhcCK3M5yK8wU4pI7nPDYKiNvNN
 S1ZQ==
X-Gm-Message-State: APjAAAXU0ojMyUL7FenTcLyCRl2yFT41UXbtQrJEBX2jcjJBSSeqzxaf
 p8iiLOaZ7k9oDOz0a/i8oova47mrPV91KrSaCCiniA==
X-Google-Smtp-Source: APXvYqzGNNHs++eX29nKjNVR+rLrBktRKrwzetThjxGfSuRn9WRNWCLdhEHXEO68Z8lWnHq60qbFVQOvuEi4IDCpLJo=
X-Received: by 2002:a67:ca9a:: with SMTP id a26mr21338403vsl.92.1558674346247; 
 Thu, 23 May 2019 22:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
 <1558515574-11155-4-git-send-email-sagar.kadam@sifive.com>
 <20190522194529.GJ7281@lunn.ch>
 <CAARK3HmMVibudG2CFLBoMSAqnraXyirTL6CXYo1T_XJEuGJy7Q@mail.gmail.com>
 <20190523123435.GA15531@lunn.ch>
 <CAARK3H=BPT3aGUGiQvov5aqFRNVTSeyqJ-bNGw6uEoU7c8iiJg@mail.gmail.com>
 <20190523135350.GA4985@kunai>
In-Reply-To: <20190523135350.GA4985@kunai>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Fri, 24 May 2019 10:35:35 +0530
Message-ID: <CAARK3Hk42cAPwiLiKMRJgau3WesCEtQkpvaG_KwMCfnV6ih3PA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
To: Wolfram Sang <wsa@the-dreams.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_220548_169656_CF8BD5E7 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 peter@korsgaard.com, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 23, 2019 at 7:23 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > Ok, Great. Do we need to write to him about this patchset?
>
> Nope. Hint: You can dig in the mail archives studying older patches to
> see how things work. I do this as well because things may work
> differently per subsystem.
>

Thanks Wolfram for confirming on this.
I will do check in the mail archives for additional info.

Regards,
Sagar Kadam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
