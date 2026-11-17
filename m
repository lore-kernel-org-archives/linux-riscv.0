Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8919606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cqsWPX6e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Gud2wEmi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7jmiNhNMUx4tNMd5rkMsUQAxFWUM8h20XNboQlAJ5d0=; b=cqsWPX6e9i5pvdNjIx3EqsawAO
	xtOlN+IuNnWuBjGQn+d+c9HSAzLdM6ZhgZP5pwaRV8SmSYeHTTBF7DQMdFKJqS+4+B2oRrv7tX152
	ovraM1vqhwqphAFnUYEJYCg5hCGR66vhdmMfU6LoOuZZWKnrqz2N0wUO3s8jlYyz/lSIXwf9jMAHw
	1u9Yg55qbquyJtESeKG4Quoe7PumQtA2JMb5U+LW765pPDkJhOUa8e8KOtejGMBtpCQVHJuJWb2b5
	PVyowr63MQ0UzTnT8PGvVrmZ6dwPVmvYqkTV1lRA075CZCDD1SKRhB0grvce3B3e+UsOqOFeYAP80
	UXLdO1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQXk-000000076Vn-1buT;
	Tue, 17 Nov 2026 21:16:44 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQXi-000000076Uy-001j
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:16:43 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id A586E20DC134;
	Tue, 17 Nov 2026 22:16:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 7BC4B20D5578;
	Tue, 17 Nov 2026 22:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 7BC4B20D5578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794950199;
	bh=nRqTMJzShimxvHzfTCPPnMzUFgDsbxOw3020xqbA690=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Gud2wEmiaIQS+G9oDe+ppbi8YJDwz3F5MYC0RXhiJXIjVG2uZgEeHopbDxXr/dlfS
	 xHP9aurbGcSRBxJLXOJNqTJMYidrOqwxdLKUbzWi14nS90jSWEJ5xtxg8a/x5bztRL
	 W6PooeL3SZuYaRhzb0ROSZUucanEKf5W7rgicRYBgQ53WSc+6KODHdg6COXrPpYOy3
	 +jeaLMGWl6CfUt7R5ntrIULj4rOPdlSGAl4rVr51xcmuvaBN4YU/1AnG57ttuBqA3s
	 ierLl20iJ/xbOJRGXK9nhseC2PthgpWeHVGkOvpiLNBVgHlHST9wazquJXMXBsjS2p
	 H0JiGtDE7ne0Q==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id a40u_yxKLD6u; Tue, 17 Nov 2026 22:16:39 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id BE8FB20DC134;
	Tue, 17 Nov 2026 22:16:37 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] riscv: spacemit: k1: RCPU2 PWM clocks and the BPI-F3 fan
Date: Tue, 17 Nov 2026 22:16:23 +0100
Message-ID: <20261117211626.141105-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_131642_191330_9B5480A9 
X-CRM114-Status: UNSURE (   4.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkaW5nIFRyb3ksIHdob3NlIGFkZHJlc3MgSSBtaXN0eXBlZCBpbiB0aGUgc2VyaWVzIChzb3Jy
eSkuIFdoZW4KcmVwbHlpbmcsIHBsZWFzZSBkcm9wIHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2Vt
aXQuY28uCgpGcsOpZMOpcmljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
