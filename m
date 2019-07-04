Return-Path: <SRS0=G26q=VB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433B2C06513
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2019 10:05:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1497D218A3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2019 10:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PaOLpREV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EsM+JT0M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1497D218A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJVNeTEyuRQM3BUzJVOm+0nN3oA0dYkXDKR/oGrsa+8=; b=PaOLpREVwro1rh
	tCYOProCcRc3Dd9SromwpXSdSXiQ/hCLZNoWrv23OvO1VhMrR/Rnb6YDeYewEdHuN6G6KZVEI9sc7
	nhfOrJqoOdga2UNoS71/PcowEEHwy35thEu21eCHBI6xp4UmwNVlyoVnGleZQUqnFwBMj9WMsDZ6I
	XIyUq0k3jRO9GHXo8YZv53Oh0hJhatB+6MGRnpntA+xvgpJNcCIlPX2LM6a2wRv0LipXsGCA8KJAd
	YZh59bMBV1EMOPKCY/5ICJ2By+G37Bswuc1cruRaDkcFOWP/Vggfm7DWt2+9mtT84PT9GI5k+BeHK
	n8oqtGVqEncNM+nuOk3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiycW-0004bf-Hh; Thu, 04 Jul 2019 10:05:40 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiycT-0004ax-Ak
 for linux-riscv@lists.infradead.org; Thu, 04 Jul 2019 10:05:38 +0000
Received: by mail-io1-xd41.google.com with SMTP id h6so11744080ioh.3
 for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2019 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=krsHjn9hhUUgOCG6JlKxY/1xOMPVr2m8LyxFmEgeRxM=;
 b=EsM+JT0MSnDEohwIk0zGab4nJRLUOadnVyFwZHmLMW4SjneRTyYxPtAcwrMgAxr8x7
 j+Qa+m4LhCtLVRhSY2LBCno+Ro5Nrv0qVhtNytYVyp5pAYqoXptLa+ieRzSMR+gibj0+
 CeR8Lj3YRwX6xzoc5SdSfDXOkImimH5hYulTuBIULtZJOcQm3AR//3Dx2sU5iymnQfNR
 EPr2CwTTXVAA50qMC2RMLJYaEr0udjRAHY/fQs5D6yT3pgyJncbxxg+STfrTsQG9QCDV
 YCWIfU831YRDgg+grt03ZGhYQZcjhcdFPCZ6jvGM+i0JTBHiTXf+mlB6a4Tdy9yYRJt+
 haMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=krsHjn9hhUUgOCG6JlKxY/1xOMPVr2m8LyxFmEgeRxM=;
 b=WBJ/bZ6kXMKe3VhiAlR3XPHWl41LluhFQhC7crUIGYLwI7rAwxy3g0AZ36oqcK0U41
 hX6xhBCCTYfHUnj5b4NQ4qmGzbLvO3ojZ1F+2czjjSKX8t8luRm6XRDfGUWLKp7tnWXi
 wCWcUJO97D5fB7Iz9KB5WkWlPN3bTD8q+hhDbTZynduxfx6hm/gT4nfSwpIkIhuwuuzB
 htwYkkPFpM0ICEAK+4XUQFwSlp4xvDnFTeCQ4qDq1R86+qL4cFp2aye0Aq/++sGE8rzA
 8JPvQKTFhYsX+Iqod4j1mPDqAL+FvLKNPrfwBSOgUBROAkWzsZRaYMOriKwU//ndzyDv
 i1tg==
X-Gm-Message-State: APjAAAXGQMwp2RuNTMhxlR5t81JaeDDBlmDo4yQ8z3eKqT/2HxCLwZPv
 Ms4l+FZg/Z7evhB51k9Qv+y75Jp8/rM=
X-Google-Smtp-Source: APXvYqy+Vw0ijCA9nUuvRgEtpZuy2PgvgfbfyYaQUmWc/vxvlVfF6B+Obh6CGc8Gifw0epaDFsRiEw==
X-Received: by 2002:a5d:9d97:: with SMTP id 23mr3527890ion.204.1562234736616; 
 Thu, 04 Jul 2019 03:05:36 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 m25sm4267985ion.35.2019.07.04.03.05.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 03:05:35 -0700 (PDT)
Date: Thu, 4 Jul 2019 03:05:35 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] MAINTAINERS: Add Paul as a RISC-V maintainer
In-Reply-To: <20190628002753.5573-1-palmer@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1907040304580.10620@viisi.sifive.com>
References: <20190628002753.5573-1-palmer@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190704_030537_371667_788C2A35 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 27 Jun 2019, Palmer Dabbelt wrote:

> The RISC-V port has grown significantly over the past year.  Paul's been
> helping out for a while ago.  We agreed in person that he'd take over
> collecting the patches and submitting the PRs, but it looks like I
> forgot to make it official.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Thanks, queued for v5.3 through the RISC-V tree.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
