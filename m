Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73E4C04AAC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 15:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C58F20863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 15:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KjiQrfBe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Kxtt3uvg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C58F20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+UlDBB4VNuWRI8Z+hHEwfbrm7q5eaml6wG1+Tbwf5E=; b=KjiQrfBerapXe0
	k8VR5190V/A9DECpm0Wsb5fQS6ccHfBCpi8vT7dQT2bPsKlI5EZ5vqdax1g44hH4qnvTh6M1Di0Y1
	GATdIOZVz12tQMmsjgWYVjobUKJ5VcFQ1E4exLi3UcMmvHC6hZgnYxTVHYfDsmrJf749nmRcZIKOf
	vK6kaVpqlbKwjJSLPFT2eEMLkctlj/vOi68BezlzoHoMLXBgXp92NfiehBjrCN7ck6qqWf3vRIw/T
	DPxsy3vIvO2Tr4o5pP5gzbTgwqFhZklGz2Cq3MjGLKq9uZ/erXqSnFnU4CRFFdFlCFfe0OyaGWVPI
	/QNx9Se6qDThzPN89x5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSk5N-0005Ok-Sa; Mon, 20 May 2019 15:20:21 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSk5L-0005My-7h
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 15:20:21 +0000
Received: by mail-ua1-x941.google.com with SMTP id r7so5409956ual.2
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yPkishA3no+/g/FV605XOJKWtbVRtxVgWtFS2JQZ9bI=;
 b=Kxtt3uvgicFdIlOHphmgzeg6qcwksSg5x8b5fBlKAUoEtJbeq4uW+PNn4F5YAmMzyr
 uqFFhbY+un+kGiRRgCgL8MghZdTl4kLYe1ufn/CfBNiWyoYHwrRGgMA09rA6e9ix2WMk
 9sEpQr8fsWkqi7WNU3NXS9rylbV39+uq3sCw3ZpuGTkms4ijpxsGjO6FyoWtt5OL26EV
 RmgW9ZjVg/r34Cpggv32pOk/8Kik6hQliDvpmui4EcqGKnrIJvH/MCa3VX2Caz4uq/54
 4WGxty5+Ktsb3Z/m30o44gwsWigfGOM1GAh9Sg1WWp3W3R9KO+sG0qNvKHkLME5eVU8M
 MpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yPkishA3no+/g/FV605XOJKWtbVRtxVgWtFS2JQZ9bI=;
 b=DLvmAHcGwxPzzwpuDxaxsqp/txICzN2YUkyxEnMkiB0gmVfQhHqmERNQv3ghCsUEdR
 hs96q6sV8ty79PJ0wNWv5ISzERZxi6dBTh9x1RO4SDtnPWqeKKc8wx7wMqqECcOvuRgU
 9ZHrOPjfEmGwhWgikGDC99NqQ6kcooyeI3mpNz6KSmRyEPZEfdn1fi2czoZxsP/o1QoV
 COHgIybQ0bpKywT8d1VBlCpWUX6EOoFhpy8gq/agwlme4zfisYbg4EnjwLrBsMlgImye
 QsAYEJTZ5p8nkvACVYxnqYFI+JF7gO0io90AtNvfBN8m0yZ2tnhb9bO6xL3kvfFTEvLb
 uInQ==
X-Gm-Message-State: APjAAAXRYMDFYrsUXnaA6nZc8VST1MAEAT3O+N/ipAIoWonjtIeGLoih
 ekO1QfNrBk8zHTOtfbIv8saFASQxncepeJ+RavQ3Sg==
X-Google-Smtp-Source: APXvYqyUiE88Q5DbYY6MW6gAUlfOMNSWJ4PSpYDD0G5KebJp1+15Ue04rR+q2oWWqyNgk8/ayaSUM7mZwfLYVH9RSRs=
X-Received: by 2002:a9f:2b0c:: with SMTP id p12mr28323739uaj.143.1558365617913; 
 Mon, 20 May 2019 08:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
 <1558361478-4381-4-git-send-email-sagar.kadam@sifive.com>
 <20190520145216.GD22024@lunn.ch>
In-Reply-To: <20190520145216.GD22024@lunn.ch>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Mon, 20 May 2019 20:50:06 +0530
Message-ID: <CAARK3HnG4qg64cc_fjffxGp5EVTLdmWdkMVDx3YvK=coGAuqHw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_082019_425000_78B23975 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, peter@korsgaard.com,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 8:22 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, May 20, 2019 at 07:41:18PM +0530, Sagar Shrikant Kadam wrote:
> > The i2c-ocore driver already has a polling mode interface.But it needs
> > a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
> > There is an erratum in FU540 chip that prevents interrupt driven i2c
> > transfers from working, and also the I2C controller's interrupt bit
> > cannot be cleared if set, due to this the existing i2c polling mode
> > interface added in mainline earlier doesn't work, and CPU stall's
> > infinitely, when-ever i2c transfer is initiated.
> >
> > Ref:previous polling mode support in mainline
> >
> >       commit 69c8c0c0efa8 ("i2c: ocores: add polling interface")
> >
> > The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
> > FU540-COOO SoC.
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
>
> Much better, thanks.
My pleasure Andrew.
Appreciate your timely review and response.

>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>     Andrew

Thanks,
Sagar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
