Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1490DC3DA50
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgP9qLoODBScYTAyGIZ3oBPF0fjKcWL3Q8NXN2jlv+M=; b=trLIZnQbDfou3h
	03dyFuGbm7aN5HblVnWfnMDnD1Ay3uplTSjhdXzbFtgXWMd/m5EZlwoaqcrh2Y72m4b6zFr6RNS6q
	7hdf4YCIWzKGTk7ThKe1AYXgLNlIetQy6Rp0/X/IF8RjVRycDwY3FicNyD5+xQXFMr/iwfAdDociN
	ypxN7U+5uCr6Cxe4kWH7fYJn5VlCkoiEEdeYNLfe7k0fw2uyxEpmoM8mMmmC2oM0Indc6KrHMtAfg
	t30T6CPNLDnb+mv1CzVuBRP0swgaB8Du7M/w4IUn0SWwQVv5pwEySXfLs/HMd3J4YwNTdDUVyHezL
	DXJvHoIXrMwHCCKbCjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRx5u-0000000ElbJ-33Ha;
	Thu, 11 Jul 2024 16:56:34 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRx5q-0000000ElYi-3g5h
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:56:32 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7035c367c4cso645310a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720716989; x=1721321789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3Qnbx+iUmsO5hmeumK/swjsC50+il8elHCmTBS0mBE=;
        b=Fu/0Sywycb+jo3ypIC/kG5q1nzCA3E1IoDCc/R+H86aSmSClkGqbCvW7hvUj1gjKJo
         zBd2BTkYUJmvH6vfVDEeJe1v/BrMS3oySFgDpDJ/jYL0bkW3zuyfVECmZsEYCUC2GR1d
         ToBzn7GxK53Sg7hhRw2r4srG7bxujD14KDxWy2Dcln2cxLQJz/lUpjD/847gsstWk2Nl
         BYW9VCqUpo2qSlmhJ2FsJv5szfWIb4t+nd3p+nseVgymtyvFAIUEuutfs//aEr4Mt8kE
         kSXnT/xr6boqSf+VIPmvyJg88Y0WPOppHP53b/Pss8fe/2jg9KV9Tcgzny4ZYIHIkDrp
         uQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716989; x=1721321789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3Qnbx+iUmsO5hmeumK/swjsC50+il8elHCmTBS0mBE=;
        b=T5CIvuWYgRYWZaUqCp7oovIUSxSG0q6nKMsI/UfDsQl+brOMwetmrh2kPMYOFab9PO
         +pzARwW8ZmWctHjAaK+q9EOEjm0pyrAaK1hcQbyIHxGbFhu9qa6gShfZZq5Fk+MRlvCN
         1J7UEqn9B/nVGOHKaxDkl7RMfmyCalZZqEsY7njfpCERlFCGXFkoXkWpxfDdL9UcfBYi
         6g7EoL2fqrqTmWOCsup5eCYNCpvdSoygf0O/DNq/j+UW7SLj5f1JJ5Wwz7/fPcE5kTGp
         egNlrda0JOpslW2RVHxvX1xbLKoVnr4SEimGsFhzcDWCw9WxwBm+QIZUzERB1XYhvr1H
         ZiPg==
X-Gm-Message-State: AOJu0YxrkqCxQi1QxFX9cPRzlX561yOGyyGdEbqFze5kB0mR9Uys45xs
	RjG2EuKXrnInpV8YEcpDQsxaAyL6WSJodsaJSRVWgo7jdY5mwuYUrJIMPBxe+CM=
X-Google-Smtp-Source: AGHT+IFT11cDKx1ITw8GMjOL9UGcw5whIW+QoK906Roo3HeBs1RdbW9Be5+V9SHoXTtfetGFJkarfA==
X-Received: by 2002:a05:6830:10cc:b0:704:4b6f:ac87 with SMTP id 46e09a7af769-7044b6fad6amr5865662a34.17.1720716989421;
        Thu, 11 Jul 2024 09:56:29 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:5ee9:fea0:d9de:cee8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-787089bc5f6sm1360038a12.92.2024.07.11.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 09:56:29 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Thu, 11 Jul 2024 09:56:21 -0700
Subject: [PATCH v3 3/7] riscv: dts: thead: Add TH1520 AP_SUBSYS clock
 controller
MIME-Version: 1.0
Message-Id: <20240711-th1520-clk-v3-3-6ff17bb318fb@tenstorrent.com>
References: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
In-Reply-To: <20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720716985; l=1213;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=sYDrZi/IT7Clln9yQAfkFJd8E3JI+vZ/XaYw2j6k+PM=;
 b=wUrrFs5q2J1pzVgeXUmh4OazEalf5YR5o4KRGJccYDi2MKdzK9ga2hXoA5XTCRa+cFkuSufnJ
 8urCX2niya3A1uefhZS985sJ9D73ukNMDwmyPRrI5M1Eacls5UR+wTd
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_095631_047282_3A8519F7 
X-CRM114-Status: UNSURE (   8.62  )
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

Add node for the AP_SUBSYS clock controller on the T-Head TH1520 SoC.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..10a38ed55658 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/thead,th1520-clk-ap.h>
 
 / {
 	compatible = "thead,th1520";
@@ -161,6 +162,13 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		clk: clock-controller@ffef010000 {
+			compatible = "thead,th1520-clk-ap";
+			reg = <0xff 0xef010000 0x0 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		plic: interrupt-controller@ffd8000000 {
 			compatible = "thead,th1520-plic", "thead,c900-plic";
 			reg = <0xff 0xd8000000 0x0 0x01000000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
