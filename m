Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A89DC982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEdWYu3cLp27jWUWNYcxV8eU9f/B0CqzrfMHNsHw/gU=; b=ciPefTzybY0hBM
	ManDk5OrbtHMOTXGF/BbasPo50mGOH9YfBa71GoYa6qIcES8h4MMQDNJCXppgGEqApAVH+KsWg79G
	9q5KpWJOxQzYN8sQ8cAl4ZqQvx1KaskKXAIWjzeBehr1z6KQIPr0rFycqdze4MWEPXlE+jS86nF/G
	/l+ytObKDGtbur+oKKPfzPS5MFkp7Yy/OBRoiFAm3mBPI83nAb7z1q+YOZyuJ62y8gqYz8Gw+MEfy
	PQM1a8f+O0K/7n0IGi3fcvVeVpwkoHlkFWoghZ29YrrV0LikTPl3hltjDk5/afCCFa3eaqRX//a8B
	HeTI7ykcDjnsmLVB5W8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8feA-00000002Yc4-4AB3;
	Mon, 21 Sep 2026 15:09:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fe9-00000002YbR-3QPO
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=; b=R76VNO4kmvFeNyfhtw2lrUkKXC
	o07Kkgb3kLCQnENXKEszNkrRWptrxtN4R9Aut9JeQ6FQyjbT5alDV7cmJyeQHJUT+cPa2h6zJGm9B
	6refmcGV4o/PB4ALWkBX9awHNdFcBJs0RQPkEUSP3PDCEdUYWfu7+7OOQ0qncpHv+53JUuCzTfllM
	jP/iiXbrjYJg9iEUgPIh+l7C2Z85Ucfw/GApRmx/rjeJzpvyuVYm/04QfnQUMEkdnse5OxlKKhvp0
	/g3DzXxR26mZ2QOu6z0ettrcifdKD2kJsOxwX7t7ThPdNg+S7D2NgNcoQS4b1+AiV08stUEoZ95jy
	F3OGMidw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8fdx-0000000CS9o-40v6
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 15:09:32 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so31050645e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003358; x=1790608158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=;
        b=ZFk+HNKqM7aArqfCCLsOqcjFNXQOkJCRpygfMkcwRYGdxlFhQdBBRjYsjF1YAzrxYT
         fNKCmt+QNJtzd/W5WPXBLdREx8Y+1wSPamxwvINndkoBRoF18sUWnHcIlf9heoJJmRsx
         nBv6A5Q7gFaaSnC0bYWbvhwNYXnQscRzQb68RG521+pDQC050N5+xYovA5eBUIV0/+U2
         O5zoW+vnF4/cdWKTHTbCyEz+Pv63migXiq7tH6E5Y2EKw3atWfDL4XejWOXdBylHKlm1
         O2b0WxZ2BAnXk/Hnn1mrdfOyFQU0anj+D5OMpKhD3xCphzr7xWD4eWX1BEy5S2Qx6WZA
         7rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003358; x=1790608158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=;
        b=v/JiOMzfG1R7fUMTLT9+j7qgjIvsHtxkEKPTzMf0Gye0nnqqNxj8n4FhOaOhAbGSwE
         tF1kWoZ7dLIQB4IXw+LdAvopuWzABp4N/sRIlTUgXRLtZ2TCnsZdtvPGuUp2VfB2bh/C
         JtpcX1H+OQNmaAqOGWDpNSdAMH0GszSLNUUmnjfa+CpZyuaZvo+AJZfUfz1ZO9rE+RPJ
         IYoZ8DPAP57bF5w6YkSRtI6y2kUU1HQ+PMnwcBv73SDPCvbv3lW6Av2vKj+N5Y22k4DR
         5pwB4vH+4VhgMJXvtfd/IzEFvsEkR4eC3r8XmTsBHckLP00VUvKgUfeKDtfBnIATro51
         ZwKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjsuoL3J0dMZsLwOKQTjPRF5h2TZaDzcqyIBieuxaH3FDDSKWQIZ3HlR44Isqv7GUmRZhaVtDp3jxX/w==@lists.infradead.org
X-Gm-Message-State: AFuF++nk3795MSDASnXjMC9mqxVw88aLmjH6OIx+oC4qa0KEWsxAWXhf
	qJe6gnogr1dytMF/vPUdk6twIcxUAZDIIOk5YpvRk2fp0xbxMgr4jYc/
X-Gm-Gg: AYBFou1/aaXM/3AExkRnhVmYZWobZwDK9rr77V9WTMcN2PuVjTdRWSoCuYgj8fgqxo+
	wTCs6up/Q67b6ewt54Yst4KsTT84S0VaH1YAYIhxln9lYIMS5s03ktV8Gc6apGtaUcOpOoyyUaQ
	DbggH+Hi5K1Kwjn/u+RG2FHGwO1x53ufXJ0/0K7b29yOjKGHHJ1/CCkb5I7/kwXblSTaE0s8SCb
	i/Gr3/ssKXoxyZ7rJACVWKIh4gBWzG+Dj7vNT1Xb8zlIZH32Wojedp3PBmW1Ecl2URrlYTGF9HI
	33OhsGI/tSfHHP2U7KtNoUChIxB2cDq/wAX/MGSoicJQhX0uNbGrstFYnJ4r23qbpOJkAG9rUsW
	xt6z+KkKv97QGrjJVL9BlOaaVoOyiXokU+Tzn7wrubR0HyvON18TPS+P1DmNKQcXCwRZ4ZL+y9p
	TC+4f8SNVbGyC11IAop4NQHzHm2IFQ/3NTDXU6YqdFiiHl+3pjoBiVmm8PPuyYm5Ok5gEbdPg6g
	eXzCizpfaYFgaa7gWaMdvsOryBInOjj84GXOxp83X2HfHB5+S6OZ5EqpVmakyVWxKMQlkirvC/4
	7wCf+Ex45XBQMeSz
X-Received: by 2002:a05:600c:3b04:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fc56aab52mr150433145e9.9.1790003358551;
        Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Mon, 21 Sep 2026 17:09:00 +0200
Subject: [PATCH 2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop
 reserved memory node
MIME-Version: 1.0
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-2-ace29446b327@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=930;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=2hLVo973TL+IdDgfOfnl6vgwTnq6FuS1dy3gn60sYLo=;
 b=8vQxbbljLHi5ctbjXGnvpx0s7hUcmZwoEqChv9f7UFEt2WHJsgauYQxdmsMj3k2QtvPq4Px1E
 aqvlQO9Z73xCWko1NMLNcKEsCu4lGQsSo65J/OH2o+UPbItGZHFeTDN
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_160930_756213_56BA6676 
X-CRM114-Status: UNSURE (   8.64  )
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
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index a2797c0bd767..d4e86c15664e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -36,17 +36,6 @@ led-0 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		coprocessor_rtos: region@8fe00000 {
-			reg = <0x8fe00000 0x200000>;
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
