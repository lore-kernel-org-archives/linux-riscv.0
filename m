Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A610ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 23:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8FB20847
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 23:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/XB3s5x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P/tBeEbv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A8FB20847
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coRywWM4E0eWNZ24jHVgl6OPfZuFFfM3OJ1Q2DbNU/w=; b=q/XB3s5xrSfaGX
	iNazJ0CNLJbo483nWFebvk9PE0lDKxTHo5xwYuuwK61tmaFBZFyDCGG5mW7Lw4spnj9Mt90fTPjO+
	uwGacVnwY2UbHVq1DpdZWa1PMrJYaBZ1JzBbq9nHvl07lgj16zb+WIOpVqlmNauVQan+uwlvOIA1F
	GdIBOuJ8f7PJUJTsnx2ea8FbpXFdGVnI3Gbci20IjbiUNWuRau/IVCad+drCfdjyQ51ko10vwnHE8
	l0Zrbw0ouRRNUNnz3MXqrTGFLX+ixAh5ujh9j51umz3REZ9nuq13zyCex4HdmxxfnomSPOhOuZu1e
	+MEbVCLb1iZB2jam5t/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHzpk-00007a-Mw; Wed, 31 Oct 2018 23:23:32 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHzph-00006D-6S
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 23:23:31 +0000
Received: by mail-lj1-x242.google.com with SMTP id s15-v6so16450280lji.3
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 16:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fpZdpokKvQSVfTqMIaCufFICb5MDl6qqXhiKEYYMWuY=;
 b=P/tBeEbvhGu0l4waNQPHovipcFXGFY+kLh2+4HNONcRjajDsJAuA35GEw4jCfS/XUm
 I4lieDosGjPBJUC9Ya+dfyPOe232EEBu6KOxd+tk79zTDRkNMU5Xl8i5PMhJGWf8T8l3
 SqzooMkan8ToIoayRLiveS6VLLG+ia2ncEzeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fpZdpokKvQSVfTqMIaCufFICb5MDl6qqXhiKEYYMWuY=;
 b=Lo7JxgIl5mP6gnSKcZWRIFa4IsOeow4Xf/qh4sMdn7E/4uOqcOixXmUOtrlBWpzJRx
 Hdbx33/kin2wgiOSj33msPgjEKsI+DRJ4EZyq8CwMRMcz5M4F7jPsE9zUUnwIm569JhY
 lMBXbKARgpCOKQk+BgNe9NrxSMo/mogMKglAq2TemsAsVDv7OOphAKpdQ8ZSqqc60ioN
 BbmmPVaC4r6ykRotxIk0mmFp+Syy+HDLecnTLptaglDk3Zy3iusS+2lAmddj8PBfxdLQ
 CRyEfcBl/bzLp8W/T5ETYEPpN8dqIMu6dbIOhQNDqTbxF345lUd/G8NjklpE9yxzfMr7
 yw4w==
X-Gm-Message-State: AGRZ1gIUQi2KG6AsxgEP1eugEa7FQc3Xa3yC5EeHxjup4jYB7rbgwVwe
 xeagPYho/K84V8qLssC9N9q2fhEQqtujig==
X-Google-Smtp-Source: AJdET5c9vFc2f2myODtH9kH1WKQ1IEXyuv/AbYZBjNpoSx5M6R6AKGg1pqiLhTK+lnrAHCtGXVrWRQ==
X-Received: by 2002:a2e:710c:: with SMTP id
 m12-v6mr3289764ljc.66.1541028196826; 
 Wed, 31 Oct 2018 16:23:16 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id s3-v6sm2047351lje.73.2018.10.31.16.23.15
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 16:23:16 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id q6-v6so12932748lfh.9
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 16:23:15 -0700 (PDT)
X-Received: by 2002:a19:7019:: with SMTP id
 h25-v6mr3193250lfc.147.1541028195354; 
 Wed, 31 Oct 2018 16:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-ddfcf75a-ffa5-43b1-a785-23da232023ad@palmer-si-x1c4>
In-Reply-To: <mhng-ddfcf75a-ffa5-43b1-a785-23da232023ad@palmer-si-x1c4>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 31 Oct 2018 16:22:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj2DtKSLDUCAzOpUsxuuSjzVyi3XyhJ1KqH9bX1_rLsoQ@mail.gmail.com>
Message-ID:
 <CAHk-=wj2DtKSLDUCAzOpUsxuuSjzVyi3XyhJ1KqH9bX1_rLsoQ@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 2 v2
To: palmer@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_162329_236611_74452B22 
X-CRM114-Status: UNSURE (   7.04  )
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
Cc: linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031232259.8Gn4WH7S46oXk0Dr0fZKnii15wMBprjHa-NUAPJ3xEI@z>

On Wed, Oct 31, 2018 at 4:07 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> RISC-V Patches for the 4.20 Merge Window, Part 2 v2

Pulled.

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
