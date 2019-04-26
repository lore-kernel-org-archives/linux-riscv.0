Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF3BC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 05:35:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74890206C1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 05:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYEntnxs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PwMxOmAs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74890206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RoJsosW1Vb3l8dW2uFISEq3fwjDoG4HZLfJ6QtBPp/0=; b=ZYEntnxszAx7+K
	W0Y2FgxDa77m6eXMEmQoeTShEZkx7af1IVVFLpEESxKWjvCWzxjQ4m2LG2kh6On6eSj6tCiqwvkhQ
	1aQnfbL9D/EPeB6q54Wy2lIBZNId9vNQDYcM/rCmnX/Rgwt4mKJkUGaicANMqiiyMO6cHDpF4AB+F
	vTGX5cogssVtwUaxuOBfVMnKaMEeb31sj31r7cTq4sULeJa643u/NcK198KKVoQmWCAWUg+APirAl
	aGaVAFqziSJgzDN/GCTaWDjzzmLzoqj9XMT1DIAJndLDu/OCCZ7Okv7hP/0BmSvd8PZnLXq9P2Wlu
	Z/543RhaZURO55xHJ6pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJtWC-00037u-5z; Fri, 26 Apr 2019 05:35:28 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJtW9-00037L-2N
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 05:35:26 +0000
Received: by mail-lf1-x141.google.com with SMTP id d12so1524216lfk.6
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 22:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxo1C77LCpO+psJrdF0wkVInexAcV6zrC0JqBooE20s=;
 b=PwMxOmAsKahZlfo2iZ9sBJAnBP49w+3B+ILKI1GtDNEx5uKYLMfw+RAZTuNd/QSFDX
 DDMwFRhD2u31RtzUeF/KUgF7tdHDvFeRBRwZLkigTj9sy64YhPZNdvgOPrIOvc8oLgmA
 2ZYGS0oIfXX2huR5drgOFQ09xgO8BKshAUXPmC7nOiCBvaAPc0HuHyM2z8+KK1rEqB1r
 Ijk8ZR5LdItdIs31kRW9N7eHjBdx7wX5E+wqXnCzvatZmya9K4oPECVBkamK5xzLnMl7
 7trQLnVovXMUnzur6u5blFauPNi/a0YVaburq5by8ibWvCUzUrUya3bEcsa3mcNJaOW9
 024A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxo1C77LCpO+psJrdF0wkVInexAcV6zrC0JqBooE20s=;
 b=LuVGL7PBaXI/ewG6yIyOyO0wWaXso1oRgGT+hQmDPzzI4MMSp5i8oJuwqpZO/aoBMm
 h2RZCaBFlW838XBeAirOsp2pKANXF67HBBlryQknauVuhtG8pLtTfgJuAzPlelpCcLTk
 JMuJPjrC+79npulKqw+RI2XaxPv+mFpVdqvys66/hiRcwX7bZh+HmSqAjeUNafBQE+xt
 3abHUfaFjX3moc+KnW0Fk5mdYU4UJZfjPA5WtXewvP/2E9r+z92Op0fP3tSgOnOI2Ada
 ECrQzg77rtrDG1UHcP4uojYdqsHPuv3fwNT8b4zeIoucyfbHDYyB3RTDQs5UO+qaNpyW
 nVMg==
X-Gm-Message-State: APjAAAUL1xRGFAGH8Hi0lt/p2mzmyjmlQRLFvADjpEOmNt2BjQ7hmpst
 o+y8GEx0vL4GPFA5qS35ziFVKtPv2krGysEFS8izWw==
X-Google-Smtp-Source: APXvYqw976bRUl5Uh58lZhG+e/95HRJRYg52VkNXmo2VGCql1DDUro/qPNTfbfaD/30cjwsA461YeNMI4U3jv94oJtk=
X-Received: by 2002:ac2:52a8:: with SMTP id r8mr23259706lfm.160.1556256923148; 
 Thu, 25 Apr 2019 22:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-3-git-send-email-yash.shah@sifive.com>
 <20190425101757.GB8469@e107155-lin>
In-Reply-To: <20190425101757.GB8469@e107155-lin>
From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 26 Apr 2019 11:04:46 +0530
Message-ID: <CAJ2_jOGi3uTX2GhbFC-m7hHkSFAAS_-F7J-L_=3OYKpeexaaQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: sifive_l2_cache: Add L2 cache controller
 driver for SiFive SoCs
To: Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_223525_121754_6AF80D27 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 3:48 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Apr 25, 2019 at 11:24:56AM +0530, Yash Shah wrote:
> > The driver currently supports only SiFive FU540-C000 platform.
> >
> > The initial version of L2 cache controller driver includes:
> > - Initial configuration reporting at boot up.
> > - Support for ECC related functionality.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> [....]
>
> > +static const struct file_operations l2_fops = {
> > +     .owner = THIS_MODULE,
> > +     .open = simple_open,
> > +     .write = l2_write
> > +};
> > +
> > +static void setup_sifive_debug(void)
> > +{
> > +     sifive_test = debugfs_create_dir("sifive_l2_cache", NULL);
> > +     if (!sifive_test)
>
> Drop the conditional check above, Greg K H removed lots of them recently.
> In his words: When calling debugfs functions, there is no need to ever
> check the return value.  The function can work or not, but the code
> logic should never do something different based on this.
>
> He may not like to see this :)

Sure, thanks for pointing it out. Will drop all the conditional check
in debugfs functions.

>
> > +             return;
> > +
> > +     if (!debugfs_create_file("sifive_debug_inject_error", 0200,
> > +                              sifive_test, NULL, &l2_fops))
>
> Ditto.
>
> > +             debugfs_remove_recursive(sifive_test);
> > +}
>
> --
> Regards,
> Sudeep

Thanks for your comments.

- Yash

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
