Return-Path: <SRS0=54+r=VN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C92AC7618F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2019 15:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4338521743
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2019 15:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lOtLN2m1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="v/wWP6Cu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4338521743
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tky615NZ8aOY9smYlfhgsd9aAr0FT2NzZ42Vzra+YOA=; b=lOtLN2m1Q3jwrg
	fUHMoLbKR7L6oFEipE8Ogk9n1Xka2Aazcy96De9o3BwfY3Ir2bpjC3BKgteheBy38PUa6g/l3AKVq
	quRvbkk2v3aAd8xrsi1zDd3TA7VLCMOgkpvdYY44mig5RaTtMYth8wj551mcMIDMkGsNiodeOr9VP
	IRBB+DFhTMFBfc6B1vwhuKgs69F6bChYMejkYzOvaFST85EWB9JDVI/ZUobox4RAw6Mfo2VsazKAp
	GVq8V4ICTT78HmtQ/scesrCdmExlet6YLhT1IQ29rZK55vkUWMdVs2+sv+iKCBQod32AcmSTB+0+5
	+UFjv4GOnTDXzrC4P9Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnP3w-0008TM-TO; Tue, 16 Jul 2019 15:08:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnP3t-0008Sh-Mg
 for linux-riscv@lists.infradead.org; Tue, 16 Jul 2019 15:08:14 +0000
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EAD72173E
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2019 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563289693;
 bh=KJhKHD7WlwSPz/YtNQ78gwhQw1tnMo7KNHFxIFPMNTA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=v/wWP6CudN3LZ05a20mnKFBIGZbNnb/hXtgq8tq3n1lqPierjZLdSh1ugGYZMdlJo
 iLmsI7+T9j86zGKMrvwfi40H63QdIYP7a9/1RK5xVRn+qBwJPz2p66C5s1gPmyYa6m
 8vmQRNyzUohPEL6JvEv9V5sWOC/Zc+m4jNZg8hd0=
Received: by mail-qk1-f169.google.com with SMTP id v22so14832104qkj.8
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2019 08:08:13 -0700 (PDT)
X-Gm-Message-State: APjAAAXv3n05WV+BDJ0K3ktAA7fg4IScttZ+GXhuX+hGI5rKJiJbj65+
 CkGE4vqKrxD98SXmCo8ouRT+kFqdJ/6Iw6dpZw==
X-Google-Smtp-Source: APXvYqz5UF22FVhjr/olMVpSYsnaA/jqkKHMZ9iw0D7NDtGbXTHVkBbrbyHhvjWrTB3VdHeCTevV2u7jlIBsa3zOAy8=
X-Received: by 2002:a37:a010:: with SMTP id j16mr22559615qke.152.1563289692548; 
 Tue, 16 Jul 2019 08:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190626235759.3615-1-robh@kernel.org>
In-Reply-To: <20190626235759.3615-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Jul 2019 09:08:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKmovGLxZj5jOLgXLtYD1cRHjtrQZm27Nk8cRQR9tsidg@mail.gmail.com>
Message-ID: <CAL_JsqKmovGLxZj5jOLgXLtYD1cRHjtrQZm27Nk8cRQR9tsidg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: riscv: Limit cpus schema to only check RiscV
 'cpu' nodes
To: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_080813_760793_7A19CECE 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 26, 2019 at 6:00 PM Rob Herring <robh@kernel.org> wrote:
>
> Matching on the 'cpus' node was a bad choice because the schema is
> incorrectly applied to non-RiscV cpus nodes. As we now have a common cpus
> schema which checks the general structure, it is also redundant to do so
> in the Risc-V CPU schema.
>
> The downside is one could conceivably mix different architecture's cpu
> nodes or have typos in the compatible string. The latter problem pretty
> much exists for every schema.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 143 ++++++++----------
>  1 file changed, 61 insertions(+), 82 deletions(-)

Paul, do you plan to apply this? I have several fixes to send to Linus
if you want me to include this.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
