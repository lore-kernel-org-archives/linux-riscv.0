Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40244106FD9A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1BvCr1bEzt9ynzu3a4w5sB8Bby+K5Q31QwZClnXDkg=; b=G29AcYqope536m
	YT5ns45V9FM0ilLC3FTLoqbViAElJmYL5IHi+TOFZ7zq8OxHxnfgteCRhtBfclgDLRGMQKvb0g4/9
	voCEhqx6Wel5TwjnhZYVBcCuX1lbXtO1KZ6dTcRXJflNt0OAO3Ezz/HB5j+A1V/uQKoPmWVssrbuo
	L2sQbx48/elSTE3CbaT87ReAGTzUzKQZWbhxRDjOkqCPAY+GCG1zAtm20ctEQChFXW7/WCNggwFfd
	bOPzarh4B0zmXNcqwtQYIu47BXhbl1PGFXpdPbHXLe3LXcSp97ofIOueGBYVpNFuPbcmg4w4lGONA
	e2UlNVRX/kztdcNQHR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAI-0000000HIoW-3rCF;
	Fri, 13 Mar 2026 08:46:38 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAH-0000000HInY-0Cbd
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 08:46:38 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-899e43ae2e1so15698906d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773391595; x=1773996395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxGhsiu6vVtf2eBXG+5lirme72BJfSMC1iQP2Bm9SNY=;
        b=ADcgNa8OjYKNEPZhOh/+CIxNPZ5eP8V5EC4BTKd3/ls5XvTbOG4MnNvZCNCjiiWjtK
         feff5eKtEW2L+CHzS/wPR9H+zvc5cJUYWI8P3gJDLfLfr8nx48VRoANktb5mZZjgKiR7
         of/63ViqgUa4wBXibGkDR2HbHvGuSh+LcKw6fIwndKtj57ByRLLUuGVg8dCrNlFQOtK8
         7dPpPnvJM+kWR9RuCvGDmmpFfc5EbjCQjc+pk4Q8CcATlTy3BI09gd/Cv/nkpxZRJKEi
         GyLQ1aRa1d2J8SPbqS61zVFVbNPU50NkKYv6i8J9Noxhafr0uUnTi7zixeBpFE0HUrXD
         p6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391595; x=1773996395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SxGhsiu6vVtf2eBXG+5lirme72BJfSMC1iQP2Bm9SNY=;
        b=H02hzjBkXhLrPVzQl9HQSMX7vlGVyBChIuVsVeJTEOQ45QXDh88X3TQS0WaHSChnUE
         xo+lsNKstG2POlqftWN65sNY/lV+c0LBQ3LUU/HegVC18dNdSvZuKuDNtxHZKw0QMlgW
         HCs5DPudIFaFk2+lLy0X6AAHxFQbFQiwxbXQ+n5arO8xZR8vA0gJfLHGELeDBNZ5JjjI
         Rm8GIIF+kdIo+vS35Dy1VEdBDlIUkXhnvU3bH+NgiyXUoAoGJ4ywfFpLx5UNIbQRZSnS
         OID3pq4D6z4RRTMiXJJVg+NdTDzuW8AonDQUM8IXY6pprcUsC6uuheiSSwTEddn6kRdo
         cnMw==
X-Gm-Message-State: AOJu0YxmfSTMtoGrh5WK04UfqUYaT1CNFP+86Q7hMnzDLB+Snf/y13LH
	Vwy2pGIRGsWWbUaleIIGFba6LweOvW5BhI9t9PcuUSnGsCwsB6Rj9YjyEqCawCRC
X-Gm-Gg: ATEYQzyQBPBhQC7iUJCTNAXKCbnOzDJsWFBPYCg8Th23d6KLVZVIh2kq99rVMm74lWN
	T0k0b8L9xKhNrkansvB9JchRBCTGe/N6xGJ8ktPDxFRS7ltcVnnC3SN6ISnoYcRARzzFNrc+bzE
	Sdn/ZtfuCCplxQqqXBWv9suOrj55qu/6JJr1oaGze+VZyPKhrSJGoz7PGDnZhc623Y9sxN1ArpX
	0aGKjZjGZotr3r58Re7lWX2PLUQ0Y58HGOWmz9Dhl1JoeeU4inzJFxF5XnyXBBXQ2JeA8n/4nou
	uucZNv1tmsbpc0drD9UPudzq5KioQbg65Fq+ue0CPxfm0hFqFO80y55b6BhuiuvbOP24GCLxc+r
	W2gSMaaGXcXoNrUQT8XFB8tkcj7s12YVXy0xP5ylU7sUI9AyRZF7e3Irm6TqTmOpZFAkQYEbBNP
	wjZx6shBMrMd2hG2jcwyP+GCne
X-Received: by 2002:a05:6214:1c41:b0:896:fa50:4c0c with SMTP id 6a1803df08f44-89a81f5282emr29582686d6.53.1773391595405;
        Fri, 13 Mar 2026 01:46:35 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb131sm50142206d6.13.2026.03.13.01.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:46:34 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	david@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Cc: lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com,
	marcel@ziswiler.com,
	conor@kernel.org,
	kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 5/6] riscv: dts: starfive: jh7110: activate XPbmtUC
Date: Fri, 13 Mar 2026 01:44:06 -0700
Message-Id: <20260313084407.29669-6-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313084407.29669-1-ganboing@gmail.com>
References: <20260313084407.29669-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_014637_087944_3365D7E6 
X-CRM114-Status: UNSURE (   7.13  )
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

Set riscv,xpbmt-uncache-bit to 32 to match SoC memory map:

           [0x0,   0x40000000) Low MMIO
    [0x40000000, 0x2_40000000) Cached Mem
  [0x4_40000000, 0x6_40000000) Uncached Mem UC+
  [0x9_00000000, 0x9_d0000000) High MMIO

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 6e56e9d20bb06..6dfeb31538fba 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "starfive,jh7110";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	riscv,xpbmt-uncache-bit = <32>;
 
 	cpus: cpus {
 		#address-cells = <1>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
