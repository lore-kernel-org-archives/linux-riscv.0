Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D87C5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 06:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HuOOrd4YhOM9efxmvvIf+C76Fz+R4RnIkKWVsFQrqBY=; b=sUs1Wns4E1htvM
	CghzTpf0iDH/B1IyexKi/CusErd0yKmBbRGGLXCvL4G1x4EqwsZWHjKqFS4Ls3Cd1wUOOzdGUzG6A
	UAxZBtcwX+ZTIEfiy8RdKK+80V8bpdFjhS8rhAvM0drm5oSrwfd4m7Yeq8Jjet6IvKmRPfy2J5jw/
	yb3C+vjXxklKHu/11fwi7xtVkTX3unFOceONyUrkJFOvdo6j2cgeSHxdbbrKcCtDHaVLeUrj6k2+q
	YIPwM4JTbGKSgVz7dkrYgl5zSSX8HWDsDb21x8lBbLVHRVJ7zH9fW90rcv08TadGGEKkwJ/1Voa9Y
	UJqv7SJDRc0BlUbSDETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZZw-0000000GDck-1SCM;
	Sun, 18 Aug 2024 06:39:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZZt-0000000GDbs-14Gp
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 06:39:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-428e3129851so25485675e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963188; x=1724567988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sYtVuKxVaNEjuRyviwIAJgcsawGj7aKXy8R1Bii4eU=;
        b=sUtTAlTjppcjIV8udbjQF/yYXHCnRKnI86d26RkrMX3cJjycVJxeXrV2xfqaP0alGQ
         9daJA722BfJeOnwUFcqqxqnFBCsCINOgHGkn0H0h68wCfEB/m/PW7GAjlXuvfLicQoC9
         r2uu6vPM8Z52YETq+2N0k7XJZMxqiJsiW4CNtZcx4T/szA0eNf1T2mYBw/ehDZVWqpjK
         V7IP68QxY//hUp/d8yHP4rVhM4HxNiWZPCJidq+584fXPguhG9U68p6SH2rcULf03N6K
         VrY0n3SBJd9RLrmcnEWgOScnRXJkH9EHQBz6P43G28KIUnm/27CDGb5UDM4gnT54J41a
         DKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963188; x=1724567988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sYtVuKxVaNEjuRyviwIAJgcsawGj7aKXy8R1Bii4eU=;
        b=QvA0WBq24KQZrBfHcJhwsKtss4hrlawS/+tyzHgixkN+0jVyRtKCTmqM5mo9Nw8doa
         Ujq+ikjW5KCH6Je5W80x+rt7UbCbt1R9fCIinfq3gerREwyA4ti6+Y6Vrapd8ckcDXPA
         Ctx4VLaL7f5swvWsk+HPOq8J+Y8/g0H0vQJPbL5DXe+jZP3MRSYeP03nLf1QxWEV1KD4
         ztUKTCcNQwiXZQglGD8L4L8tkLKxjGNN54vk+Va450DMPOU7124vwft1m4qeGuRSUR79
         ipTrp2WLFYwP0OadUs+1yVixVujOY8Z13FkjGTeOWU2DtOV2TsuapSMcsxbt8VJMkQTK
         K3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxQEKvq+LJYG4qj3olEsWDusf8MvIdlVQED51wYsLNd0gFygwVbVa2MLFFG4JJfPxjbakO8iAG8WwWoiycDtQNx14V0DFjuxVmwH2GUyXr
X-Gm-Message-State: AOJu0Yy1g2S1XumddgWRddaHwEhJLpLsNN4Lv/gKid3rUBi0Kky32gZx
	ZDWa+jiEJSsuHYYgIycKU+H/2CTvLb7Eu4Rh6YudEnxzVqC5uxuISj1PRR0/DlQ=
X-Google-Smtp-Source: AGHT+IGGAMdr2P1EdP5GWl4akDsUdOuePbLIYOG470k8Ym7dIUmRU5AiPcQ2o3G7Nw7Sy6NLXGgTQw==
X-Received: by 2002:a05:600c:3c9e:b0:427:98b4:624b with SMTP id 5b1f17b1804b1-429ed7e4314mr53197535e9.24.1723963187547;
        Sat, 17 Aug 2024 23:39:47 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed658e9esm66744295e9.27.2024.08.17.23.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:39:47 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 04/13] dt-bindings: riscv: Add Zabha ISA extension description
Date: Sun, 18 Aug 2024 08:35:29 +0200
Message-Id: <20240818063538.6651-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_233949_321519_1A065908 
X-CRM114-Status: UNSURE (   8.85  )
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

Add description for the Zabha ISA extension which was ratified in April
2024.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..a63578b95c4a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,12 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: zabha
+          description: |
+            The Zabha extension for Byte and Halfword Atomic Memory Operations
+            as ratified at commit 49f49c842ff9 ("Update to Rafified state") of
+            riscv-zabha.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
