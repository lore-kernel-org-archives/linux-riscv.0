Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A2FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 05:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31EE0610E5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 05:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31EE0610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dt2uPELuvSEomQsjNzXhw+LV2b4bjQ5vWu8jUw9fPec=; b=nTaEAn0nzXkUg+
	JjYeG3jzwyxwQxLrBELgyZjGPF/t05upgtPDrhX+S+RfcSNwHhh9nnp2szmgXeW0DMpx7m9D2QveA
	+S6BEtQo3NHvJho4FIGza/zPl92TKy9IpSD9qkFNgWABBWUdDau75MAo87Se7ZrZhfEgQ1becdfYE
	YrX9QKtLNQlgdqOLV3lyMK8SeAKx4oB6/45NLso+Tz71PQiTorRPUurfo0TxGr6t7idnrVe9ouCLC
	2MM9yRRo91lyA6AA3gJLTq94zOzo+5nia5eGjC63lm6KAwVSrwNl6fdEkg+PDomXAc7hPX1QJf/QV
	5QV7OVysx+AuNjPCId9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYiiv-001e0Q-1u; Fri, 08 Oct 2021 05:47:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYiis-001dzh-Bo
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 05:47:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i12so13385604wrb.7
 for <linux-riscv@lists.infradead.org>; Thu, 07 Oct 2021 22:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BUO+bDpipbeRKMmW8/mqCgbraNQzAhGi9jrXbZZyXSo=;
 b=c6ulsXPTlsw6nXgIwQt10rczsK1NI/1HT0KEiJljF6wIuUKNaMiMH6PwZiJyg+KLhR
 eeTh+XLRXzY1gCid7f998gRTRuaiiP44ynrs0Q5gtmfoQj8ZrCGZcYF+Z+FnFbvbUHRm
 WHrLYjJvJaHpOEo56YJ1iSHpj8a63WLdIxeObYIhVs8v4MUjJJJO0KVEmVBbyL4vR3bS
 RYOZkgNqLhLpfFh3gltneN9oK30ej4VfotD/1UEkRzZm2oY8QjeML1/AWdhquNmF+3ij
 riF2c8RBnq8yLiUC/tUvgeCBWIOkz0YvGG2CUrreuURZYKL7R5Xc0wmsuCRiXcTXnIOP
 hicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BUO+bDpipbeRKMmW8/mqCgbraNQzAhGi9jrXbZZyXSo=;
 b=6kOBXutZzPkloQ8Me4se2u7kT8ARatX2LLyytOw11jJCjpKp7g1ZXTgwZ62R4S+JNW
 6oG68ssl5D1+Z2nL28cEJ+KVT+ImTVJ4t/KIQCA5hV5dJFqwLlu32edsI4oDBXrg4aBW
 JGHnGLAQieuR1h7E2fqm6QgMOKvnmcyKeZGpC/0+IGLCfjE3NLGx5/zL44oX4qMMoCEk
 rKUt1wZ4oAwveaCW7HLfUbUhauOJn8zvKKK7MjUjetrxjKcN0mK4mFpGuSteZJb2XmpP
 jAb6y75k/8ZboF8NQxuJnzfJUx67wBRbTSRK6PQSMwFx1aJcckh/4IVDqRevju2E0YfB
 LnEg==
X-Gm-Message-State: AOAM531gPH1MUpZQSBNk3SLZ26alBA7My0qVnLmKgiQBpp8f5xs3Ceee
 MgIWIfhvFiq7ohBiHb9YRUUME1FA2x1VLqagc9ah9g==
X-Google-Smtp-Source: ABdhPJxVe1g7+6FuGdJEE0Z8tFx3XyHA4eOQMHsm6VHXPE5LFkXY71ABHoAVSmqLpRgdyU7INpagtuuvpQidMoRpUBc=
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr1338090wmj.176.1633672028067; 
 Thu, 07 Oct 2021 22:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211007123632.697666-1-anup.patel@wdc.com>
 <20211007123632.697666-6-anup.patel@wdc.com>
 <1633661172.595534.1409590.nullmailer@robh.at.kernel.org>
In-Reply-To: <1633661172.595534.1409590.nullmailer@robh.at.kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Oct 2021 11:16:56 +0530
Message-ID: <CAAhSdy2fBgA5xymwp=276qodB9mkNVOg+b6FhN1mxvm_s2KbOQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 05/10] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_224710_488092_5F6292EA 
X-CRM114-Status: GOOD (  17.09  )
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

On Fri, Oct 8, 2021 at 8:16 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 07 Oct 2021 18:06:27 +0530, Anup Patel wrote:
> > We add DT bindings documentation for the ACLINT MSWI and SSWI
> > devices found on RISC-V SOCs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  .../riscv,aclint-swi.yaml                     | 97 +++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml:34:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
> ./Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml:39:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
>
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1537678
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:

Ahh, I did not have "yamllint" installed. I am able to reproduce this
warning with "yamllint". This will be fixed in v5.

Let me know if you have any other comments apart from this.

Regards,
Anup

>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
