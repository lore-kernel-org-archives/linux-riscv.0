Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B5E743D0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Y5tYPQXF1JyHlAx96JvwCnYqjPblaKGZgOim26TlqI=; b=TppOXIAbj3qUkv
	F27OyvCCr5koZRNPLhA33/v+T2R6QWTtdX4URQDbyTCcHH4/viIjQ+t1cwpqUvP+w4hlhhkGtJ6pV
	tNXN5n6J46QgO7tSD8mSLX7lgPdAMYb+KyDHrUsgNz07wW9F7Z0P5X6+IPUjPzrK6kocFAuEKfEkg
	jYHPkFvn6tyvx9sfvFg7yBYT9q/vAnDJOMpDBt9QhMlw1PBJsT25wChWznCPFEAieInwEHFi05C7Z
	dzKSqME4Y2hEiRlIkpKevfj9nNk0NLntlyMj8sXmyxD21Exho1j6ZWwwfK33ZLmnoNBEVtV1pDBR1
	h4/euePk2IHVg1O23Akg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12s-006tpy-1Z;
	Fri, 29 Sep 2023 00:07:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12k-006tl2-2s
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 00:07:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4064a0639b6so30016755e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 17:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695946060; x=1696550860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pm3MReQA9cm+BZNe/kSQElihaB6e5dEwV1F0BtOWf0o=;
        b=dg/LJrX0Q68aBDDGqvIknjDOfutjHDrFJZNhOo32OW36qE4vLWBRMMmiXbjgcJLHqA
         Znz3ytQlfmf2zicW3AQNhqV6MD7Nv0DxlCR3poD5k4beRHgmgTkGl5Zs3FGhm4bdymfh
         zAeT5qDXRR0nLbCZgAKFCz11/0P9nOd1/D4OdrqQS+Uj9AZ1vkq1jA1PVXn/he8cLoRi
         +6FSPGIVWaUNvhZ1BAWcyFXM+loWM7NxpEgFVIbFc63fikYI+D4tvfECGMNbQXgFjk42
         jGsa15GrySjNHjotdX3l5FzPHXdeVuX0ywWJJ9roVfwQztBl898ySxKSziMIuqP/L9Bw
         1Jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946060; x=1696550860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pm3MReQA9cm+BZNe/kSQElihaB6e5dEwV1F0BtOWf0o=;
        b=vToeqGNIRcmvMflMpBikPtvaX5wFvNqzCyr1bYS0j/tUx+6Xnum/QWEqnG2YWnlr1F
         it0aViznz1xAVwTM9VWVr9LwqQAEaEL8n0+C+IHgSrcOondOVO9TM+GGYSWKMWEIZ3Qn
         ziTJCM04N/xOu5xiNKY9CXfJJTyScWbukSQwQYDe4GzV9lTegzNIbRiz/xJjijsrmi9C
         qDAkzlxMZd/043idfyTVWzEA2oHZsXKexyqtxRBCeRqLhFhQGGKy9r/6m/qnwrcpu82f
         KkLjAH+XeqEtTDdnjh+rjQCovc+43FBlgj02EU/XI6EFdPp3wjmzqIKKotjw9UjcfEgl
         XuAw==
X-Gm-Message-State: AOJu0YwA3Nk7PLT6wjUFmUCDa7yBXODom8RHXoIT1sBjX+/ilskVsIYc
	LzoPAdgn2BsPvUfoaYEYCw4=
X-Google-Smtp-Source: AGHT+IFWzGmco5cPbyfqxkrqCJyu84aUIbOKGKp+ve4yALFAWxrMQaa4gbTmfwoH8DYCTzRn8jum7g==
X-Received: by 2002:a05:600c:252:b0:403:b64:ad0a with SMTP id 18-20020a05600c025200b004030b64ad0amr2423544wmj.26.1695946060336;
        Thu, 28 Sep 2023 17:07:40 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fe98:5e2c:1821:4cb6])
        by smtp.gmail.com with ESMTPSA id y20-20020a7bcd94000000b004030e8ff964sm245667wmj.34.2023.09.28.17.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:07:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] riscv: dts: renesas: r9a07g043f: Add dma-noncoherent property
Date: Fri, 29 Sep 2023 01:07:01 +0100
Message-Id: <20230929000704.53217-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_170742_928058_525BCAB9 
X-CRM114-Status: UNSURE (   8.78  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

RZ/Five is a noncoherent SoC so to indicate this add dma-noncoherent
property to RZ/Five SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index c8d63a8f7d86..b0796015e36b 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -43,6 +43,7 @@ cpu0_intc: interrupt-controller {
 };
 
 &soc {
+	dma-noncoherent;
 	interrupt-parent = <&plic>;
 
 	plic: interrupt-controller@12c00000 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
