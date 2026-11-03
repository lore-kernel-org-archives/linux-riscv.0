Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D8606A333
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eOmjHCuk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XLg+2Cbt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN5Sr9Dq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jjXuwmf012YNSnSTL5J9eqlJQRc9pEx7XhEagiyqzP0=; b=eOmjHCukhcjQgh0Hlx2JVcZdbt
	SPWdXZ4q6whCBmltPUpyhI7jihsoi6WlhXtQnsJcoPLMT/wRtu7yIL4kFM+TXMQFSV31F6Kk1n6bg
	lnGfJmHBnkh+g1q8mKaP1Ou+P4MFFMwW0KT38Q7q9Y5w8dEKZpB1zqg1WGt5NSWkye5yjakRrdFAm
	GD9DSOzaYfGFzxX/GhqRRVw1WOVfIxYy6GLhlHj45ISr4oZUhyIVVMP92LCpUbMq2bvimRVXhxLeO
	xymI+ZvsJeHD2BtpswFKWMXsRemMtHExKdKshmBycuryFi63gikKzBkRhLaylwDQmE6l4aWHRaH7X
	OMskuGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMU-00000001fCi-2wwR;
	Tue, 03 Nov 2026 08:59:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMT-00000001fBR-2H70
	for linux-riscv@bombadil.infradead.org;
	Tue, 03 Nov 2026 08:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=; b=XLg+2Cbt3WDvXVtOT3nSk8zWHz
	Yyc4TrhARbUBKayyYqWkRUXg1COVrNrWwCNEEYGji+HP4jMDNFlolGP49isfRy/3Sqge8zicJpr3o
	ECge/rvwkh1Y0IYqBTXrgyf8MdjF1W0pQ7LMR36gjFz/gkRE5GHRmwKu9Wu3/qBVHfhMxtRXvNnlb
	UMnmyunDwdxLxtRIF6T5CbcfNjJgB2vU9KKP8kmPcN/5AuKMUX2JekhmT/6Bt54iLVXLCIpyFJ29Z
	aqVZAxHQI9u+9urrFqDXYc8RgPFEfpoL6mR9J1zHJryp03SUEpiS62LSXjSimldW+/DDzYrsC0G1u
	GOnCuG4Q==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMQ-00000000DXa-1Pnx
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 08:59:19 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso602739a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 00:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696356; x=1794301156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
        b=RN5Sr9DqxRwGShmFj5Sp6gpk35fHVaMYBjploGAMJol/kLB304zvDlngth25XfJw5k
         M5zSypfzKZXFUxpvG/f5KAKhoT2o5RjLZQzfe6z83/fsjvNCIgX8sB4OTncvIdF6354V
         SP3P/c03bM5U+eMrx97EY0fxNpqGnAr8awJ19lD1avZt0rFziFncXSi9rodE2TuNZR2Z
         YV5k86Owq9xBV4CY79udVY5HJwxwl8ulyEelX1eqj2WXeZyu5Atwh7yxm26AltiiIXfN
         BZcpZ/tQsWNGnDHSfyWXh45mjzEaPlURgS5CdER0eq6xSql6O51kw3fbBbEnZeaiwsVj
         jX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696356; x=1794301156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
        b=CZI3QZ9TuXcygQo/9iUiinQ2I4hrqe2Eg6oi0uXCWbwX479t2gwgvsC2lL4t0UrqO8
         Z3UMy84gP3ljyc5Ue+QgI4gHK81dB6MtTkAZX5KeCEsEXSqs5faws8F/K1DtC2bzj3hF
         6/C9q2aGNrVWOkBGnJsFxlcCMtYQTuqjeRNP94MZSAAyoq5KwCBLRYSysGDd0HG0ldVi
         812Zz4YlLlS+KHkATD5kueN37d4WtTIRyQ/srABz0rbw7GK2sUoH39J0FAyh8WO56dUs
         jk8i/Gwtd4z/rAcc0G3vrA0mvfc13kjMIvVYRlPeKGePLne96CRrVah4zfJzKJMQz8AB
         XX1A==
X-Forwarded-Encrypted: i=1; AKwUvBwnkyGNX4GpJXt++pgToPyO5EGz5iv1q8GUu7BskqaryFJ8ZwJcLv/FMioa88jZLNIkI41nwk6wIVYHLg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+judDajfhWq5oHx3lI7YWQpg6ILjK40JywZM0YasQF2PIsPeng
	GQ60iA2unNGCMPnzR53gDe6WB+Qp15BCA8O1cN109JH139oY7+tJ7qY9
X-Gm-Gg: AYBFou2OPocCcXws7Aaz9ZwrK1EODakZZN/qJACT4UsKVFA44DSMOo3PCvIj/sYiuDk
	XEvE1EZy8qnYTpIzOk3l9cgsWnw3pZH2x8WvJ5qZ3JmcFwEZWkIkZgDmnWmodUWdaJtCi3huuPI
	jJ0v5pw8O7pZqV0uwdgwFBk0HqBbAQ3NRTn+8HPxSAO+AWByL67gkHQNrLOjOSjyQX+slC0I3OF
	HBiF6uSiKILTdG01PH5rF9h+IAwOwYyXmwCd/CtjZdTMWFVprTVLxO6egnz1BIvU+jbjkgKbI/m
	ixmLS+KztnMXfvjTXt7wYqX3fIj+z6jdRpJW5eJtSP70lD9rUVpd5J+a5C2E6JrUJrpSHvxvLUM
	CH6vCwzn7RdqP1W/e46C5UBEV2eE7ZjiZnG1NXHMk7jZnafGUKdrWgq+oq9bCzx4TohdPIx1XXP
	+WsPPyha1UmEtIlpSkm5Z6GLOmE3KU8MoZb3c7HDwJi10csyDdBS/bE8u660lRdaoubvFBRcsVM
	q8ZA3Ogb9r0aon2qFWYBXckWLRpIfJqYHsb39TEE0sCogm2+FRBmXqQ5OGvMq/sa+s5RO7HoG7a
	l2QUe9ZUS9gFx28eW789z/FMVUzkeSIsc0yFPjhfq84L2Ej97HUuVXjl6BNhGo+XrgjhzKZaDPt
	07HLccqyJPClg
X-Received: by 2002:a17:90b:53c4:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3ae8988339dmr19037670a91.6.1793696355979;
        Tue, 03 Nov 2026 00:59:15 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:15 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch
Date: Tue,  3 Nov 2026 16:58:47 +0800
Message-ID: <20261103085847.338613-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_085918_424170_7BA5314C 
X-CRM114-Status: GOOD (  12.69  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The USB-C port of the Milk-V Duo 256M is the only USB connector on the
bare board, and the vendor image uses it in device mode by default.
Host mode is mainly needed with the USB & Ethernet IO board, whose USB
hub hangs off the same controller.

Use the role switch in the PHY so that one DTB can do both, and default
to peripheral to match the vendor image.

This changes the default of the port from host to device. To use host
mode, including the hub on the IO board, select it at runtime:

  echo host > /sys/class/usb_role/3000000.syscon:phy@48-role-switch/role

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index d4e86c15664e..0ad1dfd9449c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -105,6 +105,11 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
 	status = "okay";
 };
+
+&usbphy {
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
