Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC52EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXu/P1/Md1GC7viOf+MtBT83zm4NZfnjXdE0TvERIqU=; b=QnydMkWq95kHNC
	ZWDO1uYllqXuJ/VmkA5WxwHn3dFVmq1zNZjJcBdwIb7RlT+I86YvCg+0OnUH1D/Flg3iJllKlqh6a
	euE9HkbrfWiYVhb21Xd9p5aK55KXPq67J89wgzRe3ndqeR4Dmvy/EEufk3+EBDQgA8uVmXz4hK07/
	CJszYYUuawioZzbRVbNncnrAlBmG2WE+NYiKTX6DpmpVRneJdZc54z5Ttn6EIdjK9LssN/x0gZxMc
	XKbHF+1IpqdBH5FV17KcvdEDeIMzrOMeu9QrjkL12IT7PtMwO18KJEXd9zGZ49cgNVwKhTH+fB71N
	rMNgmmhAg/TxtCARHesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHA8-00FYMF-1K;
	Tue, 11 Jul 2023 17:28:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHA6-00FYLk-0S
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 17:28:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so73807315e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 10:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689096506; x=1691688506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tAbWd4eVejrEzVS+228fp0WdS6VB4PRr8i82+ghCjls=;
        b=tRiK8qbG1SzAXug+sVyY836Om/o50+MrsYCxB9zSIK1ZlhRVpBkrfSmdkSzitrivDZ
         31NZ/cnzFneyiSKGgTVNUqx1DLvVS4SX9U1XwBI5VC/yWLuij+X4qcUgULL0OCwwKkAi
         A+MT8hBxHsFbrgqWaVsFsQhZpkLvKMlpDROq1wM74+pWcKe9xIJUgTB3ePaXNwXKcyes
         phzWGb9OzvKacBvz2K3hDzW2Wp/10JRCQRJijjdWc7Gz/WarMMn8rR04TXQyCnr1DUhy
         zXnKW9aQL5AI+2IWTERgUDHnnKKxjj29/J5xS8M87svKya+Xz5vzdDYHUib1PlYWswr2
         HAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689096506; x=1691688506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAbWd4eVejrEzVS+228fp0WdS6VB4PRr8i82+ghCjls=;
        b=D4uBL8PTue6T2ohBhPVfuIP+IwUxXPcol14Dxmpl2Bv5mfECFKDFC+HEPJsu+xbqW6
         Xv9sBW/CJGRmr2OKATM0BUPzaJTQ1HBAhppmXikTFPDPXK/AlS3zHORNumY5MoB6wKtj
         HSnyCv146jr3YJMdEoOEpINkXn62S7J5CD5caDCbOM5vNYzEoxxt/7I7uacgXpuqB+Bw
         cOdMcPB9bIOLAqWV8Kcd8iEyg5tpWUwToSyx5GqeVQ4Tg8EEOrc+pcBkLbBPTzyUEBld
         m7ShsJ/DBTOu9xJdfwL0Ncknvji2oHU4QPc/NnPNLLQjAp/ImSSBH7s7UG0WIpS8eaX4
         2Qkg==
X-Gm-Message-State: ABy/qLYOV3JoeOIe6m+M2PMkVkOJs/X3h73+Haiq2ddu9BFQFe7uVUAt
	mVW4fdwiL1O7vbLLR1uPV1HsOANt0H7TeoCP8fPn1w==
X-Google-Smtp-Source: APBJJlG/12CTlRB68oSs36vSi4vauByL6WVCnuQ6QECH7YERJbx8As3CNX5CubZMqGqZTZyXdP4bLg==
X-Received: by 2002:a05:600c:2299:b0:3fb:b005:99d6 with SMTP id 25-20020a05600c229900b003fbb00599d6mr19528603wmf.2.1689096506356;
        Tue, 11 Jul 2023 10:28:26 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id f10-20020adff98a000000b003159d2dabbasm2762802wrr.94.2023.07.11.10.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 10:28:25 -0700 (PDT)
Date: Tue, 11 Jul 2023 19:28:23 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: riscv: Document the 1.0 scalar
 cryptography extensions
Message-ID: <ZK2RN7EKqmW87tyQ@vermeer>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
 <20230709115549.2666557-3-sameo@rivosinc.com>
 <20230710151624.GA1987602-robh@kernel.org>
 <20230710-education-evolution-f12520405842@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710-education-evolution-f12520405842@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_102830_182992_9BCEDAA2 
X-CRM114-Status: GOOD (  22.42  )
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

On Mon, Jul 10, 2023 at 04:42:42PM +0100, Conor Dooley wrote:
> On Mon, Jul 10, 2023 at 09:16:24AM -0600, Rob Herring wrote:
> > On Sun, Jul 09, 2023 at 01:55:44PM +0200, Samuel Ortiz wrote:
> > > The RISC-V cryptography extensions define a set of instructions, CSR
> > > definitions, architectural interfaces and also extension shorthands for
> > > running scalar and vector based cryptography operations on RISC-V
> > > systems.
> > > 
> > > This documents all the dt-bindings for the scalar cryptography
> > > extensions, including the Zk, Zkn and Zks shorthands.
> > > 
> > > Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> > > ---
> > >  .../devicetree/bindings/riscv/extensions.yaml | 82 +++++++++++++++++++
> > >  1 file changed, 82 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index cc1f546fdbdc..361756978da1 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -190,6 +190,24 @@ properties:
> > >              instructions as ratified at commit 6d33919 ("Merge pull request #158
> > >              from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
> > >  
> > > +        - const: zbkb
> > > +          description: |
> > 
> > Don't need '|' if no formatting to preserve.
> 
> The existing binding only adds the `|` where the commit message contains
> a #, please drop the `|`s if you end up re-submitting. Otherwise,

I think the `|` is needed because the messages contains a `:`? This is
the case as the messages in this patch have a "Zvk:..." string.
Removing the `|` makes dt_binding_check fail because of that.

Cheers,
Samuel.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
