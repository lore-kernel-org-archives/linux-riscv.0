Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C52DD4A5E4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 02:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MN6QXul6lw4PI25SkOVI27Xj63iebSqDSq0ZIoQGug=; b=ftM1C7IPqMsAxr
	mK6M1lDIu5edUrClzVDCvCc80wKEBQorctKO+UoFMLj0pvUELTTrXozc+b1euiz1j4T6gql4sNcb+
	SX3i5/09D+T05hfBE7++MtzHiaVzLSfd73ww6D0MJMwhrYQc+7Gf1/4jwwGPmcBAyAR7DFCyPukd5
	GNw11dyTqOpxJi1lBO7cK9Yr2075rXA8aj4MdDs5OH2Gv0Ji9MZD24Ofb9siUoZ9ofmMFn6/tbkBg
	RTRBsh+ZIpnVuIIrLfztE1pUTeFlr2IlNEDGWA83EajDnqrMM11Ru4hfuXVSAhhdfKGgsvrxtVz+9
	v815u7qP0+Mj7TvP5B2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZIn-0000000DRtq-1QGg;
	Fri, 16 Jan 2026 02:11:05 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZIg-0000000DRsi-16ln
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 02:11:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso1105089a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 18:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768529457; x=1769134257; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qBoetBmeJm3JJ7+522wExgCek3WhGfFdkGVZeCPvt8=;
        b=YFTJakx5pW1fwqEXgCXTxSZ1BUox9gkGxof1wlf7fQwYuJUofXCd+mISrEGSYdvTBP
         NGGyO0EakvMWlfUIUX4FZaRUzTXSOY0+cZ8+hPOv4m7lrOY4uCXcJIlNzfcm+2FsoTVX
         UtwAs1+dCEoy6vdQYlMXTXRh7IpQsuDGpYONIvy304Ztz/2GgxGa6BYZ6QTWSeWBaWdQ
         9yvBARLt45uMAh1lsxCO9k7v5fhC5QlvUOymUtFxGgZ69hRPoHQrXqLG3amxrCTw7gem
         2HCgPUixiuGUzj5Q0s53ezmq0rjmPul1K21LhRvONxl2CCwOFrWoJrd6+DUDrRcaN/49
         BjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768529457; x=1769134257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3qBoetBmeJm3JJ7+522wExgCek3WhGfFdkGVZeCPvt8=;
        b=HIaNcXZTwjZh/8LfijRBwC8dzGutTDtNUpYY8dOZLCXFnoxMwW9UpCJ3sYGf30VChv
         KbEak7CzJ6CJguWt/ZZux7vTLIa7SCOdIVApHvGMKwgwHszI/jRjAlYmE3RAexvixbcO
         d3fxvBl6oST+dccbOLJy39jAzvD0vwrp3jETLtNhGJu3F3XLiaG3SjayYQwiu1jo3mCW
         K/zEW14ILgGP2XYpoHTmk+v69i0teHRkZ7eE/6opgbfidJZe0ZsQ4KOpiryzztw+mxGi
         +jA6VWNIw+DYHqNWJjwr6vkvb2RDq2EVwLaCDuwl5/5PWKirVb7IV4h9IIMms9uOVfqV
         g4SA==
X-Forwarded-Encrypted: i=1; AJvYcCWJJmLjKu43SIvWh9HWTwkmkXXdXLKrerQqbPR+q4LSraoD+5k+Weh5ltXMl5AAS9SV7ClZukPNlWon6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiW4yI1rQ2tfy0fWfVjHCyvxJdMdZcHSwHo/HxbRMbzkd25svP
	ep4+4qYOBxPCromZOmsf01WIBHeV6EW7mFxPXMeTX58Q7qi9hLVt4q1zDWlC9E652cQ=
X-Gm-Gg: AY/fxX55W0VKqWLNQWl3OPsZWqSpSzhUFGhiIlRrzEDtq1xLb1SgeU+38RG6Xs35ggR
	rWK9JU6j1+HIZAro2lnzL4Y8yPyQQTqpTLJkY33E57BdB1EEr9K7Ket3rimONhwN5Ysh4BtOtqD
	pldeR6VCUCu+SiGExOSoopRYdaJ1SCqoQPnhVHhrd0Vrbn55GvsduAEL35J84qkzY7Z+Gm3XlCs
	Tkbzy4cXNDUhoJGQqsRyhvHUwhyDjNIjgNvOqXRfOhaLsB2ZpR8Ki0/7SD5txpSIhezi1bAkbW0
	VsPuxeQCzKisGb95IYw4BgEyuSTigR/3OU3naOyjt9XOwIF7u5NKk2iehU/iJrgqbRdxXIuEZqG
	YHQLM38pKlFPSZ3DR+tAIBHXkdsca52KGErqaWeZZk0eT4FyPUmSh/KagO1S3EV9vJ8WPyLNPmx
	EB6e49v+NW+8D/AUGFM/wrnh84r0D5Zk6d8tPt28y+jItgUisFxxXYaw==
X-Received: by 2002:a17:90b:58ec:b0:340:8d99:49d4 with SMTP id 98e67ed59e1d1-352677ed61bmr4296095a91.1.1768529457188;
        Thu, 15 Jan 2026 18:10:57 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35273298968sm364317a91.0.2026.01.15.18.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:10:56 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 16 Jan 2026 10:10:31 +0800
Subject: [PATCH 1/3] dt-bindings: riscv: Add Supm extension description
MIME-Version: 1.0
Message-Id: <20260116-supm-ext-id-v1-1-5fcf778ba4a6@riscstar.com>
References: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
In-Reply-To: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_181059_790535_A0AA32FD 
X-CRM114-Status: UNSURE (   9.50  )
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

Add description for the Supm extension. Supm indicates support for pointer
masking in user mode. Supm is mandatory for RVA23S64.

The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
state") of riscv-j-extension.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 4ffd61926505..1922dff03787 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -262,6 +262,23 @@ properties:
             ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
             ("Updated to ratified state.")
 
+        - const: supm
+          description: |
+            The standard Supm extension for pointer masking support in user
+            mode (U-mode) as ratified at commit d70011dde6c2 ("Update to
+            ratified state") of riscv-j-extension.
+
+            Supm represents a combination of underlying hardware capability
+            (Smnpm or Ssnpm), U-mode consumer privilege level, and M/S-mode
+            software configuration that enables pointer masking for U-mode.
+
+            DO NOT include this property in device trees targeting privileged
+            system software (S-mode or M-mode).
+
+            This property is only appropriate in device trees provided to
+            U-mode software where the next-higher-privilege-mode supports
+            Smnpm or Ssnpm and enables it for U-mode.
+
         - const: svade
           description: |
             The standard Svade supervisor-level extension for SW-managed PTE A/D

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
