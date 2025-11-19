Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7361FCF31B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 11:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7p9mbnuqRNFUP4pdrqsJk7nUCFwfmADIMJzNgksKW0c=; b=wfwiY5Zbga/eyc
	G5wJxACyezB+5PJufO8tbJ2T2al1PdRzHKs4rElpytHDxgKTG9TBoEMEekd/mL5lqNL0Q63WbHVcJ
	iUoH92UJWur/+Z59aQ8c6uujjNAXIju/t1/V0jJSLyNADvLpFMxvZiSPwdqlquwjgwkbwtc3vdkFX
	3YFCmPGDhrUnwzUU8iq+eR0StzAemE08USJJLYUHOmdRo0c0z2wPpKmIdOpRxNXOyZQSYiZ2IQbaG
	Z4ld4l34sInyqraHFnnVtCjDV4fi4k0bOZ/nHbqc2RgevbRbI7dIo/leiMDgrzNtrXrOekYKC5C2z
	eFarvoKPVWTSKx4OW7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgnw-000000034dt-45Km;
	Wed, 19 Nov 2025 11:56:56 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgnt-000000034dS-0bZQ
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 11:56:55 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-343f35d0f99so5622011a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 03:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553412; x=1764158212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUwM6pAblxmgyjxDQA/gZ64zf5hkh6yLTKnpJtNXTew=;
        b=XQ++xYg6DX+RzqbzGHyHfAbP5P2VLX+6lX6s4w/p4wm8G4h1VDCmHQpsf93jIEF0DG
         fudUPmexwGg25lRb1rRdoitqSIxozoKVOnWXHWj027o/eiLm0y3hjG//U2ecoobFYwk8
         PkOL8QMKxRkJhGEuXHL/2QRcHDLPtokYIQavojtRxaGeoCIAZZ17rJNMa5WrOsuc2IcJ
         IMzX4PBi9AtUMULx4YxsQpveIVHQ5yFUarPiR+VWTryJTL4Sxp0lUAlj4qKI1DIELIdK
         9KZivh41MuVqGe+eHtk9cf2tXpSQq/mmIEwQVM49uhnZtNjK1mnodVGjY6oMAR8rwZ8v
         1tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553412; x=1764158212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qUwM6pAblxmgyjxDQA/gZ64zf5hkh6yLTKnpJtNXTew=;
        b=JW+fj2Fh74mjS3vdU6sh2dKSUGQShQhxtI2C+9T3xxtTs5F8mRxdzWJfrFx5NU/mib
         uCq/DO3bWbRo2J/WWG47avL6YBDe1qvd2zgzT3UcnTfPSvy2BWo2LhwW0+frQy0qBI4A
         IPLTyXLzhanUUcihEbxlxHyBmq47abOYTnDjaoeS9jr+0H43dc9nLAm+Otgo6fwtdp9k
         2wLOTo5Tl4Yzk6Fgs4SSmf8sW3PgwcOTNK0bDfCSih7ZOYpxMe1vKQnGo/Fo2aYi6p08
         YeLKX3tjHeGctJwyt674zJW9AskWUwj8BpmQhH04nEvIdiup/dP4Q8GOwbhrqzBcWU17
         wIug==
X-Forwarded-Encrypted: i=1; AJvYcCUTcrHqhwQisblz1f02Ha1GZGMFxo04ueOT9mJ+K/h5z4t4Op3V2ZEJWUdFUBtAkkC2/3ehJxaKTb1l1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbIzJtExjU4Zhyd3dW9JAngULKdLY1ILtTg1KMGQv90hlmrPpt
	CXxIDVXp/uaktgXsfM/DeXtPl9cviovVbXzDap9PO8VTBdNKZVXC/4Qb
X-Gm-Gg: ASbGncuX3T7B6n1h30f9kS+sI6o+4NtSDcn6X9/GbjczBo/lMwFlhXqyuCiW37jomk6
	ZIjnk7ThXNNqRM1LmA7WksFBYibflr/IAI3GGjLOlpw5aKzKnvZVU7fdSXWRSGcQkcTQ/pek+hv
	6SEhTPYZdYav/7FNVuwB/jmFy9v8dMyUUmFWEoEEw2mzLmy6bq3hbNEWxoXZ3rRPcz6XbDvPG6k
	eHMhlmNJvza6Ebk9SLsMK5qukmvi7qThqdbYRWFeQIB9uPSx3ujq/uYJD5WRuPueyEwMEGmtHIO
	l7NHqM2MfyR7uyRs76oZJUGg2Gi8y7Ny72j2WBxCuKl84yx9H2iyfkkH8k+34uuwqRAYkNqaGe7
	CvAwyQfxiygA+iC5iubtTBB9um1IrApSPJoF/7qIwrjr1fMtpUq7q5e5r1Iz1u7BlTtQ3e7idNI
	Yza71NQ8Oed3w5Qg8=
X-Google-Smtp-Source: AGHT+IG5RC8qD54mIbAsxTIhZU1rpL+W33p8wn8L6JMVABPH4iQVEpKolLFmkisefx+eP01irVmjqA==
X-Received: by 2002:a17:90a:ac05:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-343fa527f4amr17253242a91.24.1763553412091;
        Wed, 19 Nov 2025 03:56:52 -0800 (PST)
Received: from localhost ([211.94.252.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc25fffasm2556880a91.14.2025.11.19.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:56:51 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 19 Nov 2025 19:46:45 +0800
Subject: [PATCH 3/3] riscv: dts: spacemit: add reset property
MIME-Version: 1.0
Message-Id: <20251119-i2c-k1_reset-support-v1-3-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
In-Reply-To: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763553189; l=900;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=7CjOcGFE5wwSmpZcmbYOnGQ6AQrPba6RbTKMsYumG8o=;
 b=1Z0eoRX2dDGoiZ5ytJ6qWD0t24HbGAMxGDLnolPtr9iBAp3+NVNhtHnDXL+zj4kP54vcFHzon
 y5yhhsrcud4DFWaY+bGGEVZiNavy5wOwoXw5DE4VShZQEnXknJFCHy5
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_035654_866898_A617EFC6 
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

Add resets property to K1 I2C node.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index af35f9cd6435..2b84dc276ace 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -468,6 +468,7 @@ i2c2: i2c@d4012000 {
 				 <&syscon_apbc CLK_TWSI2_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI2>;
 			interrupts = <38>;
 			status = "disabled";
 		};
@@ -481,6 +482,7 @@ i2c8: i2c@d401d800 {
 				 <&syscon_apbc CLK_TWSI8_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI8>;
 			interrupts = <19>;
 			status = "disabled";
 		};

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
