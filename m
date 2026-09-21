Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2725CC982E6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C64sBVJZXClFU7oO9BuBR++jyfEoNEEEoFA3FcEUa0A=; b=v6BDrx9wHpRbqH
	ScvVHi0aOZFVMmKZ03uivOeYz3RIfHyuQPjZX4ndc1vVVz2bwRoNSOO6v12B9PWj6HCc/MtsUIpZG
	6XHBCfvI9bz/6FSqOgNoac+o85iFMPw7dFyEdlPepB3awoNgnEsZAsL0wxVwuzxXcvHTojsBF0E/0
	Wky/UPZcfoS//v/B7ItBN60jqomEG4zR+fWWS4ryG4F0CMjY9E8zVAivAJrolhohyilkAOnGytz9K
	28mwXXGuPf6ZrEx+c9DFiogo+Q4DW/kbtWKvN2830Y/2X/BSTLQouhJbpSuuMxjkYWunw5D13wAzk
	cRI3Cz9kH6fj7iyuTcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8feB-00000002Yc8-0QqL;
	Mon, 21 Sep 2026 15:09:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fe9-00000002YbS-3QkW
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=B/ZOmzg+WvtC9K7MxqhI9dmC9yNAOVlajFGrJ+kti0k=; b=plMZPQrz9zqy8BQDytUieWubrS
	CbQ2ajJclVzznqTZ6VueeyrVxyFos3kC1I4meuZi47uM69QRPVqLcsAvQ7GHvhSo23mkKJINaZrf1
	CwHMjcxD6sxICPV3NrxWtPJ63tkV2O1aArdupjoOtUiLbY9B1fETabpNHxnDJ0nwVU9bnXCtaJ9OR
	CRFVIkAlP+mWPq/c8UDWC+jfGyQ+cpf7jQP34hl66wRBKShaNq5JA0SzAeNfpFYBkCTgzOTrsR/w/
	Fx/YZmnm1ZcxeQOdxvjiR9yqNMyIgp324XuqPuuVHCGLjVXN+RwtDak5QdFhNMYkzUEuAlcVQwoc7
	v05+kWeA==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8fdz-0000000CS9m-3hgF
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 15:09:32 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so13395075e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003357; x=1790608157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/ZOmzg+WvtC9K7MxqhI9dmC9yNAOVlajFGrJ+kti0k=;
        b=cuHEBAH/360DrF+773FBbpGmI50/LemF2wuAkB7cZhH5YZx5AgtzmRa5dDa6bCENsD
         18IXilR/fRLkgnpPwpZTbX/oxkEIkIixNA1yNSw9sbpcluqdgJlPKfEQC6lWhqtNEuZ+
         fhbLrirdV+OcmV82vBDJ+OSNebGX3bgooisCc9CxVrd/u8xNHpXyKKJU93stBZy7Bb6N
         bf/SSqc+nCfBM63YOAaBNmsrnnGFRT0sVERquR2rJDh3HMsnA6r8vb55ctvhB1G0OqrV
         oms2OYiGKk25ECJnIIYNoqBc1z4lj5dDvPV/zd+6Iok6llluOTFQm8eNvW/9e+/Esgb3
         Z4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003357; x=1790608157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/ZOmzg+WvtC9K7MxqhI9dmC9yNAOVlajFGrJ+kti0k=;
        b=RLdi7mO6X17bpaphxax6cidUsQCDBVre1GOnPhUXP3pIfOOusDYNRRroYC551Rxix6
         UxhwGKseX5SCLW3MWEu1EO6ezABvdTDiO1qzcj1vMxqVr6lixQWrz2avUj8eux7WV8GA
         MfTsl9mTdF39ZvhELEw+jlY7eELFCiKIZLSKZnSartQxk86axgZJhh/hPtPA2sy2/xR2
         pf5TFFQaTBTlBPJh3G0XHbCRLeSZgzk2nKVIQszZh8nud7VG39falaPvmtGN1KtRXeKd
         MrY1g8xb5igzSsRrnCMTPxlGjnSyuFRRxQzKQ0iqt6+2IUJqyCG5cGe7Tn22kgHAu6ok
         l4ug==
X-Forwarded-Encrypted: i=1; AKwUvByP/aZB2a6RFtRhqseNmfa+1rfyoURvEp2B67fRhasgN57Vr5JntBN+NV8zbBQeiOzUNWW2l0Y8nj2+og==@lists.infradead.org
X-Gm-Message-State: AFuF++nVEuJCfddp6JFuJ9ZPbyYW1/vCn+XJVe/+0uY9G3K0c2dr2AfD
	FxbosPQADZ/CsXsZq3C+lW2jZYUgnocCvegnbSKV04bJ1QTvc5LQfFdQ
X-Gm-Gg: AYBFou3GawkG2Vp4pZXxQmGdfr0AOocYWAR1eo8eAK65j63RioK8JNDEpk7NtxSNfXc
	7wdH4im8MsNlNcpaeitFh3UYGUUFOMpFIHTzuhmqIgp4NUwM996RvL4WApPRzGhou5RH9b/7wqI
	88f9lVxKUJ4Czw3Nw91/jf0iS+Gkg20K/NUommn12Bfor74gdwjQWfdBESa6L+7m/1SF3j6e9Qd
	8vz3yKK58r/2ivlFptHPqMnJZjLpR85R+Jd2zQ+T4XahGQ6mJyF/VYm0yVY3lcLX3GmwgpQE8pc
	HhpCiv6+JD0VmmH6MA4phdesAtRXvdCS3dZLvx2ktW8D7B7aJSzC5/yD3/3C+fsRjU8Ly14LX1J
	wBx8h5QHBEUOiZkIGXeBz6owKUtH419WfXqItCoMueDLAapU597GRhCax/GwUVk1Mh14+Q/CK2C
	MFFxoFcCAbyWvW8J+g0yDAscOYWIpbZPFz8kcrnICg90thksLQAqmC/Ljb7okcTqlvVjLXMvuxM
	E6XjaoqLEihDjghg2A/RH7cyVuTNgS1h+kzZHXWP32VyWx7mApM+hQTlkecKlwywlNGnxTrp3WQ
	5K0HCT3FfsyVIpcO
X-Received: by 2002:a05:600c:3b0a:b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fce797ab1mr105033485e9.17.1790003357536;
        Mon, 21 Sep 2026 08:09:17 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:17 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Mon, 21 Sep 2026 17:08:59 +0200
Subject: [PATCH 1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved
 memory node
MIME-Version: 1.0
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-1-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=917;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=7oCgxgnMTJm72ksYvBvCCDiMxSWPCHawhVNGVG3gnF0=;
 b=/HfpHWWsl0W+IWEQi4abC2w6SqzvmKlMQckSkNlWUn5dc9Mj2OzdmT7rYT+JYx8lh26QfJ78Q
 6nk39nHIi6TCAUn4XyySgyaRyJzuiXrG/1Lw3F+tpSB5erRjmrskv3Y
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_160930_756577_CB06CDFF 
X-CRM114-Status: UNSURE (   8.71  )
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

The current FSBL can load firmware to any address and can also
disable the coprocessor. Therefore, FSBL should modify the device
tree at runtime. Remove the node accordingly.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 0e6d79e6e3a4..02848bae2e16 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -22,17 +22,6 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		coprocessor_rtos: region@83f40000 {
-			reg = <0x83f40000 0xc0000>;
-			no-map;
-		};
-	};
 };
 
 &osc {

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
