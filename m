Return-Path: <SRS0=54+r=VN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D33C76192
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2019 15:26:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C98FA2173E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2019 15:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmztHU+M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UFwnonZ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C98FA2173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=428vSpiNK2jAemb3kZr2W/utsTdjsvGnt4hZXup0ZRE=; b=jmztHU+MIF6MSB
	6xD7VTeiyghapEUrtLGNO5/rNYE/6WJsAbZRXH+1vfGbKzEq7hYlnapV9h4BtnBPxAE5iMxtG+iJq
	Zpq9ByMB2S5VlzxRqEddIbhBwkug04kV8TdVN6B+yCqkZO9a7WC1xUJXAnCvH9csolDAbOIk3L+Qx
	9uvrDACT3E0Oagp0l//Db0lXsGnDDqjtm8NJzUi8mt8ggrYKXEUlYLfd37ewaFN6IvGzQhK4e1JTJ
	3Yl5GjTHJ22qL7UvHC+QUB3qlp6Vgnja7JGv9x0yzf9ckIaw/LGBX3FqyTVsd1Q4unqPxfNt2niiY
	IqaQuQ4mtUFqq6MCkQ4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnPLy-0000on-Kg; Tue, 16 Jul 2019 15:26:54 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnPJC-0005g6-R7
 for linux-riscv@lists.infradead.org; Tue, 16 Jul 2019 15:24:06 +0000
Received: by mail-io1-xd44.google.com with SMTP id e20so10215487iob.9
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2019 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=N195P2f0us9phWu08NVADmmlZekvAMPF8Z5SqipHjkU=;
 b=UFwnonZ/cfc25F4c3cAbdHC6solwqR0l8lLv7BAeP9Ozczdhg8nGvZUpzg5Y37od+t
 Xhq8oFbJNiKcY8wa+O3h0pLxMIMjaTMb+94vSFlm1z9xCPzC3a2dp42DZuExmajJeSnW
 lHIQNUWp4FqhJHcTAgwX2SLv1lo8pDeq5vp5Eg3CjBTBMnXmqEQ0W8RPbRkISSlIthCk
 jv1bxEzIfW+XBKdww/YOIQsrxjtyP7J43c47tngACpodJTHHOHj9jg6CwatIOqGsKEw9
 V8lbFN9aabPXiEZIackgQeu3hBNIzDEGxgIEPFReyyll+Je2q4zQp8hV3c4jJUWOT+UL
 qPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=N195P2f0us9phWu08NVADmmlZekvAMPF8Z5SqipHjkU=;
 b=W21dIynLW9X4y5UgcNLjnXSPq7odabjTGwDutV4QqlqUlz6W+FBJ4u8oS9iVC/Mk3K
 e2GK2Yfh+pM1BXn7u6MEpCLxZDcirw0LFeFAG5+6pihFpUJat4n6ANfwPua9VyfAAqeq
 HLlVpcjRlJRoZWxf+5UGWuoc/A0nMg3eHui9mHRvroQD8Prk29fgCUYmSsPJv/aoXJkl
 g4oIs780qJrPK/QLSRvXbAntWQw5vRWwrHPWonK9qWYPtk7NtMm3G7rzGyrPNRvhDEh8
 pKOstS8T7Buq2pDPBeHhZgGkc2gW9ndtanOoLUYUoiFOApJ2McfjufNtOxZ2xkFzeKA9
 SN7w==
X-Gm-Message-State: APjAAAVeD6g54JDtjM0vmJLRaGpakWo9g8BhK9HwtIG2SOjte255/tlC
 2jxw1sZ33Cw6Er4TkxvzE2EUmw==
X-Google-Smtp-Source: APXvYqyOxSJGHpDH9ZiCTa86Ja+vjoynyZSZ7MI6Nczc+lsODPXjGQ+sZHWd7xEI9cd/16JKEWBCQA==
X-Received: by 2002:a5e:9701:: with SMTP id w1mr32235289ioj.294.1563290640716; 
 Tue, 16 Jul 2019 08:24:00 -0700 (PDT)
Received: from localhost (67-0-62-24.albq.qwest.net. [67.0.62.24])
 by smtp.gmail.com with ESMTPSA id t133sm29445698iof.21.2019.07.16.08.23.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 08:24:00 -0700 (PDT)
Date: Tue, 16 Jul 2019 08:23:59 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: riscv: Limit cpus schema to only check
 RiscV 'cpu' nodes
In-Reply-To: <CAL_JsqKmovGLxZj5jOLgXLtYD1cRHjtrQZm27Nk8cRQR9tsidg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1907160823330.16470@viisi.sifive.com>
References: <20190626235759.3615-1-robh@kernel.org>
 <CAL_JsqKmovGLxZj5jOLgXLtYD1cRHjtrQZm27Nk8cRQR9tsidg@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_082402_929812_5B4C84E4 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jul 2019, Rob Herring wrote:

> On Wed, Jun 26, 2019 at 6:00 PM Rob Herring <robh@kernel.org> wrote:
> >
> > Matching on the 'cpus' node was a bad choice because the schema is
> > incorrectly applied to non-RiscV cpus nodes. As we now have a common cpus
> > schema which checks the general structure, it is also redundant to do so
> > in the Risc-V CPU schema.
> >
> > The downside is one could conceivably mix different architecture's cpu
> > nodes or have typos in the compatible string. The latter problem pretty
> > much exists for every schema.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/riscv/cpus.yaml       | 143 ++++++++----------
> >  1 file changed, 61 insertions(+), 82 deletions(-)
> 
> Paul, do you plan to apply this? I have several fixes to send to Linus
> if you want me to include this.

Please go ahead:

Acked-by: Paul Walmsley <paul.walmsley@sifive.com>

and thanks for asking.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
