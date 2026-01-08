Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D00D185EC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIM5dMGZ+3tTsAQXwpMAzcxTyMqNy7ZYXMqwy2TOFV0=; b=SUW5pGPiGAXudx
	AVBF2W0wNLPPsDo/PD6cbV5JJ6232+6j9KkrJsmgykDCrDSq50OaU0zHdoMlz8e/5RKljcduF65u1
	HUwtkKrwMZP6TVrUmLfsImrMpVyk935Km9ZyjL8tdDxKwfqMafqqNjZel1gxmridWBxQiKJ6MJ6Sh
	jj6n1bq8SsZXD+oSPLs0ercfv/r9ea/GjAwjoEt5xpRTLanB/JycQ0pbOyHAVfOlmVk+18XZ1ex7K
	9vsS0+Nlw50j4jxEvbLEWL291p5kpPn5QyuV4UZ19yhOZydvjTmXF7ufhK/NzMdekA9d9fZBWP80W
	yAspD2/FltgX+d8/aeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp7K-0000000H0DR-2cml;
	Thu, 08 Jan 2026 12:27:54 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp7I-0000000H0Bl-0Bg7
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:27:53 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-81c5ff546f6so457127b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875271; x=1768480071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VF+6XfhiDaME4QgjDZFKmUqe8YthR175qEWdqlfUTBs=;
        b=of2ooIoO0hb5mdaWk5N4k5fXnqIqS1wFenmkjitWtjSLqwl2xeV2QgZamiHZTsLgBt
         Ryw4CllNG11aEX4APFf88/XeKBye3oQw8755ZNDm8GMHJnm8rU3OVKUp+6+lITMelE5/
         NVpJoALXX7KO8LJxX0wJdzuLwP7Kf4OdOuIsun3US58Va1wTPeERAihun0shvNra+B5P
         +F2/6qz1dV9Uo8o/qKskdbmW2VDpSl0EP0y7i6kTgZOX4UNdc1qd+1ShHjCM9XrnxBAk
         8DVqVE3gzjdDPa/d6D8Q6WV+Vg+bL+Pl/IUn5mOBQHir6HIdJXHJBqYYP8OSE4G/AuLz
         bjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875271; x=1768480071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VF+6XfhiDaME4QgjDZFKmUqe8YthR175qEWdqlfUTBs=;
        b=xA+HKeICW0E/cPUWXUIRz/PQUaXKoCJcOdhlQD2Rtt0dhLmCkJckfeFVG3SD5BPTrJ
         ws+yOCEnIQqfeJQEB0mXPh1q4wUCGAuXibrI2fLS26mKojcjhOeB6TEdF2/tPQ7AD3fi
         g07IJSIHbKMEfXgCTSZK3Uvzfz/ZWtQuGO7eoBZu1bTS2XN8ephIsD0Srl+TG3GUlXH2
         J3bDXhpO1l7vzlacE9bTHwjreRYxjXZAOAVJP3HSaYfhKhwggaGXCLoXcAwOMvzzfTYv
         Rk15tI66m2KwtEstwn+zYu76b0w41OShYJH4nyx7XfLQXl98ahkC6a6GjphgUrx8uG1N
         kvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqYfSjwpO8u6+JY3YaaTyb4lCiAwau5fog/tdABYShVZ9meinXGYY2MEegqBP1M/QmxqxYVF44AgBpgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz6+0Xcu0j4IOMUzMs+PLuBCfHpcLc+umnykFyNzrGqyszTKSi
	SJUCeNkWZdOFEb34+kKcvFf/t+X6NZ1jhKrQqcFyYs0Ve9giXqTFM8KX/yXTd04yP2I=
X-Gm-Gg: AY/fxX6N/mOJ6GMO5w6kj7T3eBnTBpaXGeUP1JCkpRHVweBryD/4YMca5G3DAfM+1MH
	rDi+yOrkN2lAHxdvXQrA/et3E+wZ+fsTwU5LnptxI+x2EYRCRLZZShOTGelVhP1cnejLqD4ju9Z
	wIWsKkz5IY+sulKD59HvYutqKbrzRW0QBPktDuWMPBWVI89jBs3Aucqi4sjDZ7tTswEVcuyODtz
	TugWfZLLmpTdO943UBCvOrDpIP/tvdJ9m7DkeI7cuNvDf/BsEE2ReO9QYO8BBZJOiopoRKnZOKm
	eZRFKXlFRFUqi/LVHwbySYfbSj33OxYrewbiXdu687k5QMnPB91QQioRLkYBVH1TU8C4FaV5NxK
	+4q2mwqS+dxRKIRxCtZJ2LQ+LTSbRvXTYWVe5IMoyoHtnsS7rAOutaM2fUQjw5jfRd6QqNq6uAE
	X3/2KWx8xa6Vamcuf+PcbtHAHCW+X3cBg=
X-Google-Smtp-Source: AGHT+IEuqH9MIiC9H2NSi1ChnIIwHhuGoo28mnGGHSS2rHnq50vXKYnFjmfUIo4idAzSS1orpBUuTw==
X-Received: by 2002:a05:6a00:35ce:b0:7a2:7058:ab89 with SMTP id d2e1a72fcca58-81b76274120mr5237100b3a.7.1767875271304;
        Thu, 08 Jan 2026 04:27:51 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:50 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:26:00 +0800
Subject: [PATCH v3 09/11] dt-bindings: riscv: Add Sha and its comprised
 extensions
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-9-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042752_093305_B9E451AC 
X-CRM114-Status: GOOD (  11.46  )
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

Add descriptions for the Sha extension and the seven extensions it
comprises: Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
and Ssstateen.

Sha is ratified in the RVA23 Profiles Version 1.0 (commit 0273f3c921b6
"rva23/rvb23 ratified") as a new profile-defined extension that captures
the full set of features that are mandated to be supported along with
the H extension.

Extensions Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
and Ssstateen are ratified in the RISC-V Profiles Version 1.0 (commit
b1d806605f87 "Updated to ratified state").

The requirement status for Sha and its comprised extension in RISC-V
Profiles are:
 - Sha: Mandatory in RVA23S64
 - H: Optional in RVA22S64; Mandatory in RVA23S64
 - Shcounterenw: Optional in RVA22S64; Mandatory in RVA23S64
 - Shgatpa: Optional in RVA22S64; Mandatory in RVA23S64
 - Shtvala: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvsatpa: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvstvala: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvstvecd: Optional in RVA22S64; Mandatory in RVA23S64
 - Ssstateen: Optional in RVA22S64; Mandatory in RVA23S64

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Drop dependency check for Sha. Both Sha and the extensions it
     implies are allowed to co-exist in DT.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 78b75ab0a473b60508f72fc30d4809a797a2c40a..839f48503f8246864495f7cda93a572b01351b0c 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,57 @@ properties:
             version of the privileged ISA specification.
 
         # multi-letter extensions, sorted alphanumerically
+        - const: sha
+          description: |
+            The standard Sha extension for augmented hypervisor extension as
+            ratified in RVA23 Profiles Version 1.0, with commit 0273f3c921b6
+            ("rva23/rvb23 ratified").
+
+            Sha captures the full set of features that are mandated to be
+            supported along with the H extension. Sha comprises the following
+            extensions: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala,
+            Shvstvecd, and Ssstateen.
+
+        - const: shcounterenw
+          description: |
+            The standard Shcounterenw extension for support writable enables
+            in hcounteren for any supported counter, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: shgatpa
+          description: |
+            The standard Shgatpa extension indicates that for each supported
+            virtual memory scheme SvNN supported in satp, the corresponding
+            hgatp SvNNx4 mode must be supported. The hgatp mode Bare must
+            also be supported. It is ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shtvala
+          description: |
+            The standard Shtvala extension for htval be written with the
+            faulting guest physical address in all circumstances permitted by
+            the ISA. It is ratified in RISC-V Profiles Version 1.0, with
+            commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvsatpa
+          description: |
+            The standard Shvsatpa extension for vsatp supporting all translation
+            modes supported in satp, as ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvstvala
+          description: |
+            The standard Shvstvala extension for vstval provides all needed
+            values as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvstvecd
+          description: |
+            The standard Shvstvecd extension for vstvec supporting Direct mode,
+            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
         - const: smaia
           description: |
             The standard Smaia supervisor-level extension for the advanced
@@ -186,6 +237,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssstateen
+          description: |
+            The standard Ssstateen extension for supervisor-mode view of the
+            state-enable extension, as ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
