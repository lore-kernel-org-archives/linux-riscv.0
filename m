Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4D6C83033
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 01:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpmdGLxtqB/zlmo8Li1Ghw2Vz/JV677QL/5d3eJ31eI=; b=aqs8PWlEDOgLrJ
	k6rt9gDQLXQFdLBGsGZh1T2Ot/HmkooVwuB4gdpDJKXIsBiv80DAzAKglj8/RtvApby1mVzS0e0E9
	uYSJzL9NeqK+cg6+LDj7r+CRoUfrKftH2jLaUkhtpcF8Tz52lsyMM4wgx7vH9WrmnhSXGtCz//wcj
	VPdRWNwaRMmasnP0yCZmHwIhGNyQwjeYM19e/B6U9I0eNVeV6LFBL6ffNn+oWHsna1/H+WCB/Ubpg
	NwWiwz49d/7MskgIz4kz1hFVKhmTtcw7TQZ+rMvRNMI08Yz55v6PlgIFKN10tDat5UHTCQ8xDwHjU
	7k5MphXow1N229elNCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdN-00000003o6J-3HWR;
	Tue, 01 Jul 2025 01:18:05 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPdL-00000003o5A-0dg2
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 01:18:04 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so4212461a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 18:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332682; x=1751937482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=UYKCsuBwaR+OY0wAStDbpEccgGFcdex+RtecKR0k1vKrwE9pf8ip2Dv1Sx7mGi4xME
         h7hVWXzVLhiBRbgI/rAdBi2nGuTh1bCXDKVc69vmBv5UuoiRiBQijZJdlCZl1LJ1FkV6
         nFsZccSg/KOWYLeSX6QeSfrmAJqxFo5zYQAqFR3vwUB6q0r6jB5sH+68DS+Y7G2PxK0e
         sEhqV6CJzAIAanVoYOKGvxTi7sg993zNR1RWPX+B4aLeiTl8K2IdmjoLQAWbHy79RS0E
         RdGUTefKKOA4XacB6Q7S7vbPNs73EY9Gmbaf/QDYrz0/2F0+N+44oidtr3KQsG7Nov1n
         BcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332682; x=1751937482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=IAYosQz0qmlfxpjfMdgWuiSU76N1aCacVLgh2XlLO3eBFLn5qHyIDb+WP6xh8YQNzg
         /aaBvjvjuavLN/MhJQmf82Tcp6WPXoJQKwty8TDuyiXWN976Lky4M9IfvZ2GJExyR2SM
         ni1mvGPjNIUIaX1C7geKXQFIJyAKNNaLllxrTYoGZlC7aK60rj5C7FqokO6xflY4s9FF
         /+XOP/B3ZLOaL++l2YM01l34HD8gKZCtdHjE7FagjEoemKcJlFzRhjO9XZE/4wpraENZ
         JKbi/jcHsZZmeZUgRd9utIr7xH6WCt0wCg8d+kwuioWicUznv+KLVdhi15JQbfXusMqK
         OTVg==
X-Forwarded-Encrypted: i=1; AJvYcCXemGcOgAcbSkPD9g8seyIll6deSDe8Afy25SbJ8s1SVNs40njFNmSrKaP6PNycu4rhdXs+YeuN6z5S3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVOCoW1hB+CM+MztjGX2IBulHCxb+2vNAXjb9s+Jg3VcHf+hXP
	mgweeD4r3qy/ytJDXoAzE6ho0G4EP9QSmX3H101OD3bmkSAlrXpokRO3
X-Gm-Gg: ASbGncsC9M7Va3eliffsscfNpWZfqX7BYQSS2yGgyXAfWQNTQVjhY+6oYkVLUePYdd7
	PXeT95aMYv6mszF5U233mQdG9oZR/QCrq4a8d5hK/OWzhLolDNp3AI+DPaaPiWE7gpvasfMiDOe
	WYEGnuRtAgdiNkcphAcUpuFOE5ykFabswqALVcgAzG4y8fOcIUTN8hXooQe9gALwEcsJmC+YWy3
	rB/guRVq1xku+QW+zLrGoZ+lnC/zXjgTmEzJF65HV43NxnDCc758yP/Am2FZn8AaL8YZUBxwEzi
	67qKbMjEYyTtof2T/fahDB/oLTzp4p6NMi+Q/CSFuiRnacpNhArAAQawWk7Hh8pgu7V0QCS5
X-Google-Smtp-Source: AGHT+IHrvnGB8UpVmo+G36End1O2GSAjnGffQVOqmnvZs9oxeWkVGDRfXR2LbK24Xq3v+GU2Rm3BrA==
X-Received: by 2002:a17:90b:528a:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-318c9225e52mr21546386a91.8.1751332682255;
        Mon, 30 Jun 2025 18:18:02 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f54417f7sm15446402a91.45.2025.06.30.18.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:18:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v4 4/4] riscv: dts: sophgo: Enable ethernet device for Huashan Pi
Date: Tue,  1 Jul 2025 09:17:29 +0800
Message-ID: <20250701011730.136002-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>
References: <20250701011730.136002-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_181803_201431_192D249F 
X-CRM114-Status: UNSURE (   8.56  )
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

Enable ethernet controller and mdio multiplexer device on Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 26b57e15adc1..4a5835fa9e96 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -55,6 +55,14 @@ &emmc {
 	non-removable;
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
