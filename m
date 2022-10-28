Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41E5C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 17:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvkvo+O4n/AoYvqP7qMIm8TuWShpCQBC1pcLnW7ML+Q=; b=yRuXnRhTlG1dDU
	H8nJ9NQc/MSkpIQMLLRqKq/VrR7xyrxmeWG2y49YyUCuqgb8Oof8DL2W+8xfWTW3J0Fcw4JK9GJKS
	u7RmmpJ9a6a0aJqcN2RisJm2XujBAElLAtFGiL9uL/2mUrNychEil7tDchpx4IB1CT+AbLtx73Dnm
	1Gc4cnKaJ+5TYVPGG+PU2TGzMQP6azAZ/MU/JAImebk46QN3msAER/1s6dnz8FAhkW8XrlZGbP5XD
	P1QegCBZwmFqg5TWqhyobFOaLHrAjXhnsPk63Rh+yTelZtYejr7ND2FV97P98cTza5q3MuxhWqtAm
	eNvrg7mrqMyeAdE/CTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTBY-001Jcu-24; Fri, 28 Oct 2022 17:30:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooShk-0015hl-PT
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 16:59:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id o4so7410216wrq.6
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2faLQwm60FIW0toXle/b/I/Kg1QLaRnJK5/efYQgUQ=;
        b=mUHskhk/+kptO7vf7dtbknF4GguKne5ReUOG951HWBB8Nsxp2aqV8MDQNgsmGiR52E
         gcXnNF+2EZehSF9RLcEMz+8whS3F8lyRFeGxHcK1Fsi66C5hYFb6fvs+On0glS9FpuB6
         MxH/13MnbmUT1NfzYKE4H5FlAS/oqaFxy+GCfRCrsm0/LZkz52v7Q5C4Z5cbJi29VPx+
         0dhPe6341MzHwtAiAZjUvUdLMi3kJZYlv6qNBQTiXi2+YKHyQC75ZNHkFuePSehvxGGH
         Anrz3xn9A8NltaVPLX+QpHtfWrrgiMMR7hgHVTIbU+Rtic9Ad87EFkFN1r9o2/l0YCI5
         jJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2faLQwm60FIW0toXle/b/I/Kg1QLaRnJK5/efYQgUQ=;
        b=4+Ehu8OfF0diaRbqi9AOb+6e/5GIHXVqLIE+nzZRJgC4QwdtPVAC0rGuIQpfaHDssJ
         11nXrjmcMeUYF1y0aMXHlpEYYALUhk9i5SppL3UnMHbD6POulMaYr/RxoG63+ETfPt3G
         DomxLWYxyZRRxsXGJWoJ+0E0kTKzvfUScBS0YUBFVvL5HDXpRCpZjPYeTPWWsLoy9fEd
         XXalYP0/RJry5RG70uKTo5b1AFVEPkbW8+DLRPnUyXoPK0bWSv0Jy/+lVNzBT571VQlx
         WI0DuFWrG/NQVLjAvx9YWW5THZQkfgyPTLATzecvr4wDc8Nt8KxDwu9TYfv6Fv2Zoawq
         A5fQ==
X-Gm-Message-State: ACrzQf1BPToCLLGWtgYQknfQUoDwfKkJMokvOpMM3iVFJBTeBpxzvVP1
	Me5SPstewnfW5w53Jl1lYamzOE1C26HDVmmY
X-Google-Smtp-Source: AMsMyM7CC1AUvx0qZrPxkaEOBsaPe9FrMvFnvaaCKY9Uma8oYLgdhitk09PvFAVPyJtPLYrNV3tu7g==
X-Received: by 2002:a5d:6da9:0:b0:22e:53bd:31c1 with SMTP id u9-20020a5d6da9000000b0022e53bd31c1mr211356wrs.358.1666976372812;
        Fri, 28 Oct 2022 09:59:32 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d53b:eaf9:15f:6a8a])
        by smtp.gmail.com with ESMTPSA id h2-20020adfe982000000b002322bff5b3bsm4939689wrm.54.2022.10.28.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:59:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/7] dt-bindings: riscv: Add Andes AX45MP core to the list
Date: Fri, 28 Oct 2022 17:59:16 +0100
Message-Id: <20221028165921.94487-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_095936_885367_44295C61 
X-CRM114-Status: GOOD (  10.42  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
Single) from Andes. In preparation to add support for RZ/Five SoC add
the Andes AX45MP core to the list.

More details about Andes AX45MP core can be found here:
[0] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4 -> v5
* Included RB tag from Conor

v3 -> v4
* No change

v2 -> v3
* Included RB tag from Geert

v1 -> v2
* Included ack from Krzysztof
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index ae7963e99225..2bf91829c8de 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -28,6 +28,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - andestech,ax45mp
               - canaan,k210
               - sifive,bullet0
               - sifive,e5
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
