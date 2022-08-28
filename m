Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEABDECAAD5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Aug 2022 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuzDl7tnuVsA9MHT+PIFVM7geRCu2JiOAef9PeXij3U=; b=QPqWOOlbx+YWgg
	QO7x4KKkgpKyM9f0vpuI9TXR9Hpg4RfT8+8nnVxtxPgiKmvN1FkCqArcmp28v/lKLKNyxaJPud31a
	+fqkT4rPNp9348MLZsDIyYefqYt827N2oanSANZR0NNTlcuvFdWyzMXYZHt225YVxtm7Cfoxd/7jw
	pKG9Hc2AazXhPlen7ppU/7xpCzs7pb71YuOebODGnUXekw2OHu0JhtWx/L+xjG/tTffntBQI2cRrQ
	x2br7RKoqhi0za38CnChumwuMYtB2eKJP7Zc/XKOHs+oqlzPRMbTkwkTnUAzoCEF7j71rw1ZmgQ2E
	U65wd/ZprfqsAhTFvbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSPsD-00270Y-IU; Sun, 28 Aug 2022 21:31:18 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSPsA-0026xC-Nc
	for linux-riscv@lists.infradead.org; Sun, 28 Aug 2022 21:31:16 +0000
Received: by mail-lf1-x130.google.com with SMTP id bt10so8808991lfb.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Aug 2022 14:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=s/2W9LCrKpr47ADdk4ieOEheh0bAAQj1U8gf9Id6rM8=;
        b=SzzWPow/y7s6gZ8YOrwPtPmzdhNherZbGZMIRbAZeNeYSdjcHxpcr/5c6uy2owQYxA
         avft8u741y0cBgSLZQIA5EN+gy+Vs1DH4sE08Z4GeyXj4auG5iDIDK6l8/YrkX96TTPv
         vIqH+HIfduhBewY+y2fopU4PbiJCBa7u6y5yKaotNyhlWl2Yu5+xvjJRsnKivO8/vwJW
         0dLqy3ex4sjE+lzLiU6Gp+kKOgn3pP6psFUoDkC5mj3pdbijdS0f8o9lnFFBx1UQFMlV
         WKrg7xJbCdtDyyexn7VzyCgWIsHrN+LRuENV/H6BIGRsdN5QnzGrcr9YF/5ghxlFCGoc
         pdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=s/2W9LCrKpr47ADdk4ieOEheh0bAAQj1U8gf9Id6rM8=;
        b=c+gaQ/T7E6GpSx/4HH6o7Ug+b7AqNF9iUJy8y8fKmlLiAuf0ACcEQhAbPjI3hGo5vi
         Y77BUI5IMFM5F8wS756i93GrFL7RdESZcwtAnK5n/0a0ruv1lN5IpBkNoTUdXlujWmSg
         RxPeGHc/gygUCjxUwOnzhco9sM3QiW1r9Xuvvi0891+ybKDWJfOd2RkklPPoFoWpexfy
         ECV1ew5m3Ra3btG7K3zQ6wnJGIvM4gBqOH2fFtJZBP4YTJq3MTRsWg6ijfRVE0kRLapy
         Gldyo8WMLbYZS4DfwYXu1QSuRaXW03U2rg0ENxOoH0/juH7836hj7MdY0nhC8ivJ+SsS
         9TgQ==
X-Gm-Message-State: ACgBeo1siid2jnppSUNLm8sXOhQHa72EVVxn/Af1bQ1A82DK13X9LJ53
	w/9w9eTDcXcCQqYi1CxZEqw=
X-Google-Smtp-Source: AA6agR5Hs+dK8h0lGmyQYp+ol68xSCBqYIKehEsXo55iBEJSabF8hfpjvs+lzYDbPuBxVYY5eJpaCQ==
X-Received: by 2002:ac2:418a:0:b0:48b:aa2:1d9f with SMTP id z10-20020ac2418a000000b0048b0aa21d9fmr6020701lfh.195.1661722271965;
        Sun, 28 Aug 2022 14:31:11 -0700 (PDT)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id b10-20020a056512070a00b0048a91266268sm1054386lfs.232.2022.08.28.14.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 14:31:11 -0700 (PDT)
Date: Mon, 29 Aug 2022 00:31:10 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Conor.Dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
	mark.rutland@arm.com, will@kernel.org, anup@brainfault.org,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	sergey.matyukevich@syntacore.com, atishp@rivosinc.com
Subject: Re: [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
Message-ID: <YwvenvGgTiJAy69W@curiosity>
References: <20220826203443.823906-1-geomatsi@gmail.com>
 <20220826203443.823906-2-geomatsi@gmail.com>
 <70656978-546f-c14d-96a9-8dc7d8dcf9aa@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70656978-546f-c14d-96a9-8dc7d8dcf9aa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_143114_803724_3280F8E0 
X-CRM114-Status: GOOD (  23.17  )
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

> > [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
>                                ^^^ (see below)
> > 
> > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > 
> > The root cause could be related to the interpretation of the number of
> > counters reported by SBI firmware. For instance, if we assume that unused
> > timer counter with index 1 is not reported, then the range is correct
> > and larger array needs to be allocated.
> 
> I found this to be confusingly worded, had to read it a few times before
> I understood what you meant. Maybe it's just late on a Friday, I think the
> theorycrafting about why the code looks how it does got me lol

Well, it was not exactly theorycrafting, see accompanying opensbi changes:
http://lists.infradead.org/pipermail/opensbi/2022-June/002926.html
I tried to provide some context for this one-liner, but failed to do so.

> > This is not the case though since SBI firmware is supposed to report the
> > total number of firmware and hardware counters including special or
> > unused ones like the timer counter. So just fix the range in for-loop.
>                                               ^^^
> I see "fix" mentioned twice here, what commmit does it fix?

That is the initial commit adding the whole SBI PMU driver, so it is a
bit confusing to add 'Fixes' in this case. I think the following commit
message should be sufficient:

SBI firmware should report total number of firmware and hardware counters
including unused ones or special ones. In this case the kernel doesn't need
to make any assumptions about gaps in reported counters, e.g. excluded timer
counter. That was fixed in OpenSBI v1.1 by commit 3f66465fb6bf ("lib: pmu:
allow to use the highest available counter"). This kernel patch has no effect
if SBI firmware behaves correctly. However it eliminates access beyond the
allocated pmu_ctr_list if the kernel is used with OpenSBI older than v1.1.

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
