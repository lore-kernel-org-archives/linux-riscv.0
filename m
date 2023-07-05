Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4536C0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8t2G2BIO8zeLpILAPjlKk61/zEXndeiVnZpKBL/aQio=; b=UVRVYfM4rxZirT
	u0y/98n8/uSuhyPHZroNWYWcEQzy0XhnaHGQB3SyMOHlUlKwKIJWNaVLzw2GE5lsxpzkoVtQk5zHT
	hIA9Fnv6TzAY5cdz/l+aU9919GV0pCkggLWsc8QF3Zj6PpfFa00DDLG/mBGCo/vorKYud3kMA13QN
	Ck35p9yWkK2XMrxlT/ms8ffIe7M4NR0Sp8bK0t7upwnafZrY7rPxRoWoIIFlhEh+MvREsEAPZw9Kd
	V/0R7778iwxpkARMOFSaQGqMPtxLpiQG/piWSu0gJ1twXQ3/Po+X8rsjTyfUhDzFmS+Ut7CNmjJW2
	CEKrHCixKZvOYDL7H3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC74-00HN7D-30;
	Wed, 05 Jul 2023 23:40:46 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC70-00HN53-34
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:40:44 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1a28de15c8aso188958fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688600441; x=1691192441;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLLif1KY2D3x/oQIb0fD6DgvzVEwBt9PgSDAy1D7jfw=;
        b=GUqHR3iKA3GKI3FuCSb+pdbJzC8NCKsiIcv9MeUIUvVgtc5fdWqZABfE+K9cmW/amq
         zWhMXjO2ROJtnMmSGMNvotrD3ew37U0nxfF4Jelj+YkaCXP541t0HaQyDY/WF9B5KVpv
         2vGrYoqoPpFqUJQ8w0yLdkhTnnA70PliwOjBBjpciRhQj/2X8fOhvFYpt2UY2s/fvw2n
         5s3fJOmoHlv/Mq3CXmD7kImG0SmvSfQGlGosw3lE3j9EYXQh5r9qyjR6A2KRWpV8zy+G
         ctpYQrsNTFQoR0P8QUxAml2EIsaoejiP7D8UnzHHacxXkal7+h5nkx8ow1tQJSoqc3G2
         5UZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688600441; x=1691192441;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLLif1KY2D3x/oQIb0fD6DgvzVEwBt9PgSDAy1D7jfw=;
        b=CHX6urjTNCXuz3v9+AjtOLGmVleuIHn7RojZTefWlLe4/BA7g0RDdHEYGlWciIxtC/
         aSOia5ccxPWd6exZFtCdr69kpImSYfaQA3axxmfBTNljIW4SjdxQnEOAremMfiQjBHe1
         m4kPo5BhLAmje824mlQKMDdO1qnuL7c3015D44SAi6QGXGtJsOYJtmzF047AWj3n4EgM
         zI1Cpa6kyC2gZkeYbcAFIJ2ts2Y2fS5Ddz9C4aUhKSMEcuxSDNxwZDNVC0Y/uluwixTd
         z68YvQ5IZ8TOZulYn0qhbXKsn3purB5liMNQ8+S6J7+RrX/zPB09I9IxG05J90MEa42P
         XCJg==
X-Gm-Message-State: ABy/qLaPj0Aw5GWscx+wbX049PKGZo1kFzAeNkukSUIijb7WtrGwMjpL
	yXn5lRX5EWxAZ34IHvcMTtgulA==
X-Google-Smtp-Source: APBJJlGhY6ik2a9lxlF0RgXnj1DEVnZ0h08AlHINQ5Ed9RK6Pu0MrgIAW8hiIMXydNfQShpu3O117w==
X-Received: by 2002:a05:6870:79e:b0:1a7:e554:500a with SMTP id en30-20020a056870079e00b001a7e554500amr631818oab.49.1688600441720;
        Wed, 05 Jul 2023 16:40:41 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a194e00b0025dc5749b4csm2047993pjh.21.2023.07.05.16.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 16:40:41 -0700 (PDT)
In-Reply-To: <20230702-eats-scorebook-c951f170d29f@spud>
References: <20230702-eats-scorebook-c951f170d29f@spud>
Subject: Re: [PATCH v5] dt-bindings: riscv: deprecate riscv,isa
Message-Id: <168860030764.22647.8715497868636301645.b4-ty@rivosinc.com>
Date: Wed, 05 Jul 2023 16:38:27 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor.dooley@microchip.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis <alistair.francis@wdc.com>,
  Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
  Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>, Leo <ycliang@andestech.com>,
  Oleksii <oleksii.kurochko@gmail.com>, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, u-boot@lists.denx.de,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_164042_993633_E86E6154 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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


On Sun, 02 Jul 2023 00:10:01 +0100, Conor Dooley wrote:
> intro
> =====
> 
> When the RISC-V dt-bindings were accepted upstream in Linux, the base
> ISA etc had yet to be ratified. By the ratification of the base ISA,
> incompatible changes had snuck into the specifications - for example the
> Zicsr and Zifencei extensions were spun out of the base ISA.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: riscv: deprecate riscv,isa
      https://git.kernel.org/palmer/c/aeb71e42caae

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
