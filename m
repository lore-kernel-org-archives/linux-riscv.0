Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0917FC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 01:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGtFi69cxSB6NX0X3t3RD3gY9H0X0OC1PHAtPBbnJmA=; b=fW66bI8aJuFRgv
	1j0Fakzpgkts71LhtMDoiOsn7kTRUQjq7ML86msJeVo7Vl9ZbneNUzPjSbNEcIBeaQdsnfAqyiylS
	HB3E8fBWuSVOsJfD46Zob7sdxWUzj6lXNqK6506/chHtyogLmD59njJo+HZ56fHhhdLwDIyqZVtbi
	9X0gBWdupdElm6SPkpXrS4Tqi2e/zhcXXUKcRSMgKX3X/u/ub+FKjs03B6dq2MZRjKl6cXtVDhgAw
	WW9yo7TzfQ7RTAyckmU73yNeT5w5z9WnmVnHkboCuvz3kZ5H52TeOU2EGdtMJl7s77P7713mJYTw3
	FnDtq1dlhYtLjgJJ6+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdHC-0000000Eswa-09Ju;
	Tue, 30 Jan 2024 01:51:02 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdH9-0000000EsvH-27gm
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 01:51:00 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3be3753e002so862949b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706579458; x=1707184258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+xiQxZglnWq+tBqbd5E5R9p1VheyL290G3NA4mMGp4=;
        b=FQZmhcUb9JhV7E1DD3sn4LiFA+NkCazFUHsJJ/GB0aXPubUxzU46q5jmqY1rAj1U/c
         91fsQ0LgbmtXMBp5ElwZYFifcBGLJ446kisk4doihU05qTyEA9xMU+oDc9TRXTv9i8v3
         lfPQQdv4B24a2SlUcJHSvzZWSSYUlQKrgcHtMQgpHcy7FL4hOC69elyDS6ExnN/nboDR
         L6TXf/i6YpQzgHldecLNPDA/S1JcV83OiKUhrWq/J+PswqGIPjYY8YBffqdGyuWnb6rb
         u2EBjPBw1fW0BOFD086TI+jCo+cUOUdhpawW1HrQR0bIlPgJjyTTNP31/bqodMBqzavY
         6gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706579458; x=1707184258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+xiQxZglnWq+tBqbd5E5R9p1VheyL290G3NA4mMGp4=;
        b=B57vj5pEcaRM6PeHp8RCl3+M8Vrs8t01sexzYiuY5aAV1GPAqUTPvxC1ot9KIwBzwF
         3o752dXwCtOHWrB554yzUZFtqa1KN7/WS7lWyuTvf0f+DVjJFnUhQvlDTXfihf5qlAis
         ZAb9EJl3Q6P8tJLZw6EOILGh35ZK75khj7LxCeOxG8R88OpTq1RQog/MG2wZZyQdQfYb
         KVPqG5ZfJWRkMMEZDpJrfD42hb/whWjJ+K2gObLkUsioMvqyUNB8VELXxHlQZ80TyswG
         uyRR/YdqEXHSkh8E7vtizDrKn8FuFw5tgHzv2E3P9DKj0EU7OYTgIECxAP1+gFclq411
         UakA==
X-Gm-Message-State: AOJu0Yw6wvB4kIco+dFgae83qQysyrEETX/BY02p/ejdBK1oABH9AH/F
	az1b0FoNz54NHJ8HSJsvcCSonqiV640hPTJGtznQinDC0ZMSK7dw
X-Google-Smtp-Source: AGHT+IEVngsUvnKfoP7Yv/9NQbRGtKkZWpQCRP18wKnnkXaseqw/Yc9oW8LGCQ23D3g9qIEVcgYDbw==
X-Received: by 2002:a05:6808:1b21:b0:3be:9565:d4e4 with SMTP id bx33-20020a0568081b2100b003be9565d4e4mr235702oib.24.1706579458391;
        Mon, 29 Jan 2024 17:50:58 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id cz13-20020a056808404d00b003bdb8b1f964sm1652754oib.21.2024.01.29.17.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 17:50:58 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v3 4/4] riscv: dts: add resets property for uart node
Date: Tue, 30 Jan 2024 09:50:51 +0800
Message-Id: <807f75e433a0f900da40ebb6a448349c98580072.1706577450.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706577450.git.unicorn_wang@outlook.com>
References: <cover.1706577450.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_175059_568043_334787C5 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add resets property for uart0 for completeness, although it is
deasserted by default.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index eeb341e16bfd..81fda312f988 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -343,6 +343,7 @@ uart0: serial@7040000000 {
 			clock-frequency = <500000000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rstgen RST_UART0>;
 			status = "disabled";
 		};
 	};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
