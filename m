Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB11DC43219
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEieIRHGmXZHmZZkMiSPT2AVnImX9iGzxl/zgtaABaA=; b=DL+CO/kB0HxNwl
	XcPLJPXzzHo5bG4nCQ+WaVCFnatvySl+9TjUaZtxo2L7DWccHiqWDr34h9YRcWX9MSE0NPcRH0OD5
	splXMtr9OnlIqpFvlYwyd01fuSzTXVsLZ75hOWSMdi3EQRZ3qw9Df46AiFvOvsT6vSRdaKR7xcXv9
	M+Vse9JF8a4xhdAloW95/pO5cK7tqd06TmSjwOSq2b1FAW9PP+gyePkbL6G5rxstt3JT7k0myq4O6
	AYddDEK4J3rud34Entp1KQjf3h9G07TpjhKHKUvigRlF52orCeS90CgLIeUGRbaHgwNTkvZDRcQsD
	YDZyGDsUd6jzFTsWtBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjU-0031Fs-Ja; Sun, 20 Nov 2022 08:31:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjP-0031DH-OD
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 08:31:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74C2BB80ACC;
	Sun, 20 Nov 2022 08:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B93C4347C;
	Sun, 20 Nov 2022 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668933073;
	bh=YzdHamMHxhIvOkUcVi73tvjWfjgrz55++jhDY5V4iSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bG8sQnNpVQVQDylUY+MnhQNRHU8A+uo2Sly70D/I0CNBkHDPj7SEj/bouRhS1bqJj
	 VRwmgFUwed5GYVDk9rvdbJWSNImOCFaebxolZfqP4uUQIQ8JkLV0YH+abB8MovKvMV
	 O4KeBYKFXWKKrPbDAZBT6vNnjBjDBSEOZ8vDPEQCkcV7tPDswPmTS2BnyDX2+eT0UE
	 NJ7GZGRFHfGWu/LNzMzGS3UihUl7knPMORY8RBbpyQlwjHMDFrdqymuEx0g473WPY4
	 R+cqDrrOlwAzEZ1GsCsuQXy4gEtFl/Lad/MScUbMMSF3JXzMdQ8rfxXMZ108kVAYRK
	 puQfrIamOVEsg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/7] MAINTAINERS: add myself as a reviewer for Bouffalolab uart driver
Date: Sun, 20 Nov 2022 16:21:10 +0800
Message-Id: <20221120082114.3030-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221120082114.3030-1-jszhang@kernel.org>
References: <20221120082114.3030-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_003115_943699_BC10D0B7 
X-CRM114-Status: UNSURE (   9.42  )
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

I want to maintain this Bouffalolab uart driver from now on.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2585e7edc335..92451834b940 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3718,6 +3718,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
 F:	drivers/iio/accel/bma400*
 
+BOUFFALOLAB UART DRIVER
+M:	Jisheng Zhang <jszhang@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
+F:	drivers/tty/serial/bflb_uart.c
+
 BPF [GENERAL] (Safe Dynamic Programs and Tools)
 M:	Alexei Starovoitov <ast@kernel.org>
 M:	Daniel Borkmann <daniel@iogearbox.net>
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
