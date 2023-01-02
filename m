Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D264C3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 22:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GcenOplCqKvVOzYiqF65SExwnt5e8MJbJ6dwCkFP1ko=; b=blZbr3gofe7KK2
	1Or7R71YVUG6yYV8gMqkc0N53l+KnVAOiaiPlCH3MiiupzBY4Ar4X9+h6T1P0PiVts3wEk3BTetUm
	3PhCRlgGczLDJq4nt9zL1sFcfDYTrd1gQSYsHgl3FtNZqGUoyo+O4vV/7UUCgAKHloNT9dKuHkKhl
	CijAagVGO/hQ5fhMcItliBXQ0YJOVmQA2VxOk9v4ML/HzA8drIvBv6HO3A7Q/05iK65g/Gkz11NRq
	grsOkCGSReWUuc8tLe38uOpEqG/4UE97ysQ+Ye3QDyNGKGkFuF1HmfZyFTU4QK7anWSxXx+fWkSUn
	jck2GgCh/rC6UErtvT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCTEK-00EZL1-17; Mon, 02 Jan 2023 22:24:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCTCl-00EZ7d-6R
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 22:22:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id m3so12546140wmq.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 14:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzAhGjXaHPnQR3DC+YI7zHhPYNDOaj+LjnPkK+FZLFE=;
        b=j0ZQqW2uJDkWbhQ45/bqKldlVp4tBWD6gzWQPbPpR1V6AFZ5Ihrs4OZNBzpQgps/m4
         rTXaS/c0hFcCPZ4WfkHw/8Fqj/GQW3bwjF0yKbbdbo2f4nsXaGbw4firdjzZa6aHeiCq
         H0BUBRvG5b6LlzAwcmLoAOXuThD9YsZyLMnTEaIUqrKhc5bbDJy6jCSgD+z411j9YKZw
         eaVjDBNtWH27us9LIe1++zF0/urLoVxZYOsx/BNrxcXNyW2E3DWYJ1WZRyi6kR91zuXe
         yU1X4KVExp5RBj5pYF+QZPiIP5/Kz1guSKUYVWW6EFB+SWEAwa1qhY3K2NWgmlRhQvCw
         DiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzAhGjXaHPnQR3DC+YI7zHhPYNDOaj+LjnPkK+FZLFE=;
        b=HssCcPdrNIcrYNN20538bSplN/OOJk1TJE4jZm4SMhkUsHJObYksCXFtNwSM3jlEA1
         k8ThPiTKvRIGdSHpcwM2pVEMfSYwj3wK0DSjPhBtQ6ir06iu2Qwwy+kHBfMTnUbio7I/
         +EPouMufCPPTtYEqNlPyviJa9Gppm+0NAEkRCHI4kMnCKBym11tBW0hVgKtig4DaFH4A
         wlTPybV4r5BOer7jrAW90oLtrXD2b2UGMI9Z1ZKFVeimvaxMhexWKGUr2udmAxDs9Im+
         1JQGhzezCeNB1Km2JbY8Ml8ElYQhtE4U7hw7YlbxYOLAGuYzkrpqu3RxVnz4joVNRVpR
         fsfw==
X-Gm-Message-State: AFqh2koDlw5XzfPRAHBGVk/jTKH2lHQDAAGZtvjgh4k02Rj/JSvB0qLt
	gXGzU8oJ1oEYpJglJi6yOxQ=
X-Google-Smtp-Source: AMrXdXvs149q2RLwB0ZezqErfp0NhNZDzNbvUCbH1XcRYTqw/I6EeHFpBoeR9KbtNh2ItGEhDMU+3Q==
X-Received: by 2002:a05:600c:510e:b0:3d3:5885:4d21 with SMTP id o14-20020a05600c510e00b003d358854d21mr29134502wms.17.1672698168250;
        Mon, 02 Jan 2023 14:22:48 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:8a7:e535:b020:566a])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c4e9200b003d35c845cbbsm50341636wmq.21.2023.01.02.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 14:22:47 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] riscv: dts: renesas: rzfive-smarc-som: Enable OSTM nodes
Date: Mon,  2 Jan 2023 22:22:33 +0000
Message-Id: <20230102222233.274021-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_142251_278038_3F41FB9E 
X-CRM114-Status: UNSURE (   9.23  )
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

Enable OSTM{1,2} nodes on RZ/Five SMARC SoM.

Note, OSTM{1,2} nodes are enabled in the RZ/G2UL SMARC SoM DTSI [0] hence
deleting the disabled nodes from RZ/Five SMARC SoM DTSI enables it here
too as we include [0] in RZ/Five SMARC SoM DTSI.

[0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* Rebased patch on top of [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-riscv-dt-for-v6.3
---
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index fdfd7cd2792b..73941a5f844d 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -30,14 +30,6 @@ &eth1 {
 	status = "disabled";
 };
 
-&ostm1 {
-	status = "disabled";
-};
-
-&ostm2 {
-	status = "disabled";
-};
-
 &sdhi0 {
 	status = "disabled";
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
