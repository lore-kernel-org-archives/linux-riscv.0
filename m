Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AC8C433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 17:51:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50A92065E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 17:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtgQryQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C50A92065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9UuKEji6CV7lIlVe/LS9HhDJStHh1a+cPWn4QgdU6MY=; b=qtgQryQtY+LO1elOvBWVGxx3y
	lhWNU8ew7SuumxTbKWGu24D0jfgGBc5EabYaM2ya+weES2sGjHUGb0v9snWbqSo9Bd69RHPnYIx0h
	fbsfhU33bNJUsSOpkLb7V+iYgNfLFA5cjYlI1ZR67kAB20mrbQh0x7mCSR1NOMHWstwNZO0jaoFfT
	0uZ6Afo92WECG7pfFYurEHRncDvwYbYtZCzfdzfRbIATebfn1ZShn0uccZwOp8A9nmVxMpQRDSS9B
	yBNhy7jWBgztYsYS7m5km4QFMPwyJIkR/z7WgQHl2huT3zwc/iVFtCE/aYy2l88vYWYYjae1Gs7Gx
	8tvBILewA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvlYa-0003is-1j; Wed, 15 Jul 2020 17:51:00 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvlYW-0003e6-QW
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 17:50:58 +0000
Received: by mail-io1-f68.google.com with SMTP id l1so3173456ioh.5
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 10:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lm4/CoMM23brYGuvxbzrBI7XMuUz0kmq2vfp0FBfrio=;
 b=gcOSkWOAoscFSyq+4OiD/cB6cZMw/eppJHj54+hfhpDM37udoemXZ7Yfp4qMNITSEh
 Y+euHCOFeTGIylCPxThDqT0v6IClCSaLZYBd87XRXvlVnSoP4gk7+KGMCD3uVoLnw/rO
 D8DORyxDc/K2sgrZ90St2JBDc9m2z0yfi9eTy27XCjLLN0g/Z/1ZNToCW+xhLWREipJJ
 FGLCtvnz4c1NWS+IqLR7JjIizyIpGwUba4uTUO9IUmcBQJZ3aBIF8YVDLxnMAPAW2SRU
 4o7H6s+tL7e3c/JY4W+HNmCOujDduPwGXljSk5bCL6AgLHDWArLjO5n/Rgrm5GgobVNT
 4K+Q==
X-Gm-Message-State: AOAM5303FuGlz+koHkeAxsxbk50mdRCVB6ZyFKnjsTo+EW3OR4W/m15j
 f6lv71n2zm9/Pf3anOeW0Q==
X-Google-Smtp-Source: ABdhPJyue+QezUbFaV7QPT2tl/LvbzrBcrcPqpdUNFSnX/aKU/OdMBSFB1DJCISh0lxFHd9o44zJdg==
X-Received: by 2002:a5d:9a97:: with SMTP id c23mr418430iom.179.1594835454796; 
 Wed, 15 Jul 2020 10:50:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id 69sm1435476ile.60.2020.07.15.10.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 10:50:54 -0700 (PDT)
Received: (nullmailer pid 498027 invoked by uid 1000);
 Wed, 15 Jul 2020 17:50:52 -0000
Date: Wed, 15 Jul 2020 11:50:52 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: timer: Add CLINT bindings
Message-ID: <20200715175052.GA497000@bogus>
References: <20200715071506.10994-1-anup.patel@wdc.com>
 <20200715071506.10994-5-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715071506.10994-5-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_135056_880592_D57BEA34 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020 12:45:05 +0530, Anup Patel wrote:
> We add DT bindings documentation for CLINT device.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/timer/sifive,clint.example.dts:21.39-40 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/timer/sifive,clint.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/timer/sifive,clint.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1329276

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
