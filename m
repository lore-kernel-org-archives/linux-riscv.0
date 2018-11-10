Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8ADEC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 19:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC7A20892
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 19:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D/NLAJQz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XN1j62Vn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="GictguyO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAC7A20892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMDmQeEdNrnrj5oxEb+17f4K5sLfvLtdf91nZSAI7Ys=; b=D/NLAJQzo706hQ
	wYvaEdxK/gtTi5d+08aiPfm/9HK0rPtGvtvXFURDnjoJnDloUc8A7IqF+oMyehlXYJKYw8bPz3eOC
	iXgoZG46+i0fNAE1/HGWDcXsdqbbZg46pYlZwD7iA3/dahAOOfkrDfDpcHLoj6S5Hz73dP9CKwjyJ
	66JWDohzHEU9GeME61D0UVSXwidcgam32VKoODioM1bNxs5D5w3S8Kk8F5BkifE8k3Tu+sodjzgfc
	Gvy6Prtyiz2rIlM1C28rZ/9rIX+YDYaMn/elaYgc3SzOj5mohWTWzjbq0Fv4YA/j3EsImjMAi4E8C
	UFMnxUH8L8aM8TmFOJcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLZ2m-0000jZ-1y; Sat, 10 Nov 2018 19:35:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLZ2k-0000jA-9B
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 19:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WO3bM8d62ytDucXdyjCqGJ771LgZBDqJrc/1kNs5RtY=; b=XN1j62Vn7jJr4aZlsTC2YZYoN
 zLlZQQu2jZ8Rk/k1Z70Hod70CNgdAt/xH8v2y7ECccviMFgZCtLVNJqTRWfAijIkiQE2vMwo1xRPn
 O7v6Em5nqf2imuggah9hpMb7VupVQ3EKh2ONtolAfFdSsf7hWG0Y2KqAs+R5TQlYWrUm7F9PwyoxO
 Wuu5sA1jmsR4AdNw4m3cx4Qx9VfAUF7pEz8+dsbr4G9hVTGl6PcEh7v5YAIb2F+NCmDp8jHyGRg+n
 f6UFIRMUYSm68t8Xl2SFlCN771ciqJv+pIKnY2hgA0xfkGo1XRAPDsmKwmF7PmTbf/1fUKfOQ54Rt
 HdV/GgigA==;
Received: from lkcl.net ([217.147.94.29])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLZ2h-0004Dw-Av
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 19:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=WO3bM8d62ytDucXdyjCqGJ771LgZBDqJrc/1kNs5RtY=; 
 b=GictguyO+TJ/kCflI+HRwYT8N8Gn4iPsFaOFuNYcsRmpyJovDKPrhASwkkznsIr38gp4wbCgG75kqg9WIr+9W4fB5FPkj+fy7ovDTdk7xZaxP1pIoTSN9nQ2SbWsHisz3QRWHYWoTYT3Gc2u/jHNmlsr5FEq6AHPsey3wCVYxxM=;
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLZ2W-0008M5-M8
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 19:35:28 +0000
Received: by mail-lj1-f180.google.com with SMTP id z80-v6so4344955ljb.8
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 11:35:12 -0800 (PST)
X-Gm-Message-State: AGRZ1gLaj9uh2FxhGVaZ38HPrgvSbAQCCgdSwI+4+ga070WB3PIeofJz
 ml1C2+zdYAEFQSU+eX+Pir/Ag7291xQCceamub4=
X-Google-Smtp-Source: AJdET5f0RUP3IPijSiKPRaUpA/2QcyGx1YmJeqZapGnoZ2k6klUE4u7IzB1UbHHzDau8vqAYzGVuULaMJODfGtHZrtw=
X-Received: by 2002:a2e:8187:: with SMTP id e7-v6mr8514029ljg.50.1541878507172; 
 Sat, 10 Nov 2018 11:35:07 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <CAOesGMic7iV69zeBFPDo6P+WwSGcogKG1DE-rOS_U9VCoC209A@mail.gmail.com>
In-Reply-To: <CAOesGMic7iV69zeBFPDo6P+WwSGcogKG1DE-rOS_U9VCoC209A@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 19:34:55 +0000
X-Gmail-Original-Message-ID: <CAPweEDy9or5vLCDtkTTZxycjUkyrmDkWNFUfDjJBV-PZ=Vqy5w@mail.gmail.com>
Message-ID:
 <CAPweEDy9or5vLCDtkTTZxycjUkyrmDkWNFUfDjJBV-PZ=Vqy5w@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_193539_384195_5807B408 
X-CRM114-Status: UNSURE (   6.90  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110193455.dBc7N6YblP6rMlgnWcGWo20HtlE8SJv1j3wxDyu3SSc@z>

---
crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68

On Sat, Nov 10, 2018 at 6:03 PM Olof Johansson <olof@lixom.net> wrote:

> "trying to optimize for those use cases is a misdirected effort".
> Trying to optimize your experience on spike at the cost of simplicity
> for everybody else is the wrong thing to do.

 i hear you on why you believe it's an optimisation: i get it, it's a
public API.  that's why i put out a shed-load of other potential
use-cases.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
