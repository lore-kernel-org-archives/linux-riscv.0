Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A5CCED24E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 01:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTrc7orrh/eZ2fwdxn1u0LWHoxkIBynawJaHcM3Fx1A=; b=MzHcWNHis8cKVX
	gwZ5BzMIaSM0GFZmVQ2lRyNCKwyGlGG5WGL2aWOGvZwru1IBIVQjcNiKgXBBUwylXty7Gm4qWr7L9
	Y6VReLp2Df3U3rvpSfjldwMjMRnBzXx5AG3rebEezDiniMV7Ee6pouogPorND8mtQMwgUAnNfuzm2
	mz5AAqlMQnrAOQnrlcGCCkmIpcbNz+EwoUtq4aFKOrOmHdW24B+7hS6zMFTwhP6hA+7D9iG1Zvzts
	i3ndCGvqaK6qYZpwj3+RFYNcdTN91CRWZG+8Gsz4+E9l/PrFTOiTPa5IHctNZo1gqf+GcH9rXJ9Gr
	OPcNoigB+2Dv+wwgMgLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxzGg-00000004DOG-0dKL;
	Tue, 08 Oct 2024 01:44:06 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxzGd-00000004DNX-20At
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 01:44:04 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5e5568f1baaso2698897eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 18:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728351842; x=1728956642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMA8NIgbUUWy2PaRc1Fk8S2RKWxEcaTI3Gg4Jjq/WS0=;
        b=KIoF5F2T5T2i2ApCip4Y2saNIQVanmmM2+I8nE2EcvPZb3R5hu5HTAmK7+fAMfB8FT
         Z1sFkyx1AVNalDidx0ulM1ztOKXzgeSZcmqvudE3jGjdSU1lc547NTTmdgQu6dg7brj5
         7ouevdcAxh75OwU0rOVxDQ1laUrqsV1QOdg0uvzt83qb5aXVmLE/6Iy96+9UbDqhqgLe
         SRWzQ4/GVEq4nTLG9MCwXoG5FNOoejvolv04I0eriOe76zWXDeOOTPQXBisWU7N3yPgg
         7UlVsojJGVoTEG2l6hn7eggkv4v+sXHM3x2FWxd/600MDWf6WxHlD+EKZhRgiiYBIHzy
         AzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728351842; x=1728956642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMA8NIgbUUWy2PaRc1Fk8S2RKWxEcaTI3Gg4Jjq/WS0=;
        b=bXwryUqjFl5KQrw7/i7Mxc7mqkYI8Nu9+TUsgj98+3N8/ubqphNJVGF4WYkzIdSZs8
         47VBJhFnNEEqb2xmWIGkGUeQS/vkujRuHC14aG/NjHfcimJozEt6v0nK7Q9XTP++t6f5
         /x//fWefHyQzcI+CIaxl7A6s9Mskc6giFWi2BAj0+vJfYn/05za3HfQfb+0UHjFHSnPv
         fUrbvTUzboLXuYi/ANK82euXAcVar2ihCJeSJXDGH0sMQ9w8JT5QTJpitGcetYnmoeg6
         w2n0uJkOMSxG+Gp5qnWxmaVvn/5UMhMo+ajn7vJUHCnPrQh3JyD2orbM5LX1TqVoMkXx
         h/TA==
X-Forwarded-Encrypted: i=1; AJvYcCXem/rn+6x0pI4lXTGPPRNdxdcHPUdjBbBza2qgIVBGl0TI8MQEuV7DggNSQHGR5Gx6I37pK3eOzEu9gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yynl0nI3GGPDoErrCyNxjDt9Ebb0l/HprCQqvP0IflRg2VJZmb1
	vYbY1P6DwKx0rn/ByLZFMUsxhC+yAoGfU39uIdzCBkZy6Nh9wqnq
X-Google-Smtp-Source: AGHT+IG/wPKeG7rs6dIdkvUMb/ihW2JWNEUHrbX/RXLsnFy/MnnjIeK3XJYpuEqL+0u1GxUip2afYQ==
X-Received: by 2002:a05:6820:228e:b0:5e1:d741:6f04 with SMTP id 006d021491bc7-5e7cc079979mr10120950eaf.3.1728351842312;
        Mon, 07 Oct 2024 18:44:02 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-715567715cbsm1739626a34.17.2024.10.07.18.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 18:44:01 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH 1/1] riscv: sophgo: dts: add power key for pioneer box
Date: Tue,  8 Oct 2024 09:43:52 +0800
Message-Id: <12e65a99f1b52c52b7372e900a203063b30c74b5.1728350655.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728350655.git.unicorn_wang@outlook.com>
References: <cover.1728350655.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_184403_539907_6A5D31A6 
X-CRM114-Status: UNSURE (   9.78  )
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

There is a power button on the front panel of the pioneer box.
Short pressing the button will trigger the onboard MCU to
notify SG2042 through GPIO22 to enter the power-off process.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index a3f9d6f22566..be596d01ff8d 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -5,6 +5,9 @@
 
 #include "sg2042.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
 / {
 	model = "Milk-V Pioneer";
 	compatible = "milkv,pioneer", "sophgo,sg2042";
@@ -12,6 +15,18 @@ / {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	gpio-power {
+		compatible = "gpio-keys";
+
+		key-power {
+			label = "Power Key";
+			linux,code = <KEY_POWER>;
+			gpios = <&port0a 22 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <100>;
+		};
+	};
 };
 
 &cgi_main {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
