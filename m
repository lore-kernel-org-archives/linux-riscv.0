Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D10CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRrju8zTPKD8ZT08A3W3/guM7Ww4LTaLT23v5pm57xM=; b=DgfQ2rMZaweg5t
	Wsyt/FPlmsKGc6TTlG1ZSDDv39W1UjO/QB6cskkt/7wSsVYuUnJ0TGEn1+JsFm9UEyaBwIPtcUHVb
	4WhoXYPxzCF3qFB/2WxJV/1qRi5+SoLsQb/xGnaAyVctQB9s9DMzvMYOnnfdCcdU4TWlfKluEXMWq
	U8Dbp/pfukTdZHFFmGEmNbYlICr8Sw5A0W9JgNUCRZV6NAl1nBlma0yvRol6hQYWt9yfRPxFTfZe9
	OSLhyuKYFKGNgUFMoeXpR0mDMhimwUkDG10fftSAh/5r3zZ9youNr+EGG7gMMnXTr5U5xq9i8pD0s
	MjiMdy8LCjZpWHg1xpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEt-00000000ZZO-2od6;
	Wed, 03 Apr 2024 23:41:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEh-00000000ZMb-1sBS
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e0d8403257so3257355ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187701; x=1712792501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orqHimAqeIVvjnhm+Lh8YT/bDSQ5kt/uWL0O/MbcU4M=;
        b=MwHQsRZfHDUF+zTHeQtgguo7HWddzyDQLx+jQemO0AO0jGX97KwKXrMglKcot2oEqt
         bXRC/DOxcK7ENkG7iyWhw/Gl6CPwL2m77NfUNIKaW94dqLXvbMUh1WT56HJFLl9e1Dhm
         Yym/GHDeu4tc7z+GvlIVTfrTKw/nG455hDS2z6c0nVzwFTGrzSSqEVL1hIQU+nPPxb5/
         cPdz/JvXSP1DlTJ4mt32mIsSkvj01S3lpB2uS/Zmz1NiayO19Y2ckAeEzDpyPEd9xxXg
         ETMtku2IxMKD/iJkjH8G785PxtdOJD40RU/lWWAImyofmw4Jz3g8t+3tUIkE9sx7lRmt
         KpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187701; x=1712792501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orqHimAqeIVvjnhm+Lh8YT/bDSQ5kt/uWL0O/MbcU4M=;
        b=nHHiVOq/KCpJ2n3bD1VfU1fUNFZjW007sg59kz5G8taK/CkCXHy0Glehb1scf8SIS7
         tNyGwIBZe6T0vQwqDNqJfhZ3wiF/1Wi1Mse1ARWZ3GApoB1BWKFyKLsqakywKdEYPjim
         TRmQ9ZcOge9abELs+khUJdtOQV0wC9wqcEwxA9hbAj6y03kQYmtzJet5CAKzM6FLGaab
         atDjq3KYJo40afJp8PsJDqolL5gKJvwaIYjPe8vKeNR38fboCi+6yRmOjcDlzJA9L+Hn
         tYVcHKCize4N9H8CXGo5hD93mewnhA8cmP34FdbhWWRbuhWBcXCshLebEGmUlx3KhEL3
         XTMg==
X-Forwarded-Encrypted: i=1; AJvYcCVv2b1RIt4bYJJuEkwjZu1C+BwuBkD9o3v0S9m+gV8hmD7xYw4TC+xCvZrmvuKyvxG++Qw4/+xpHAt8dLrLOG3iiMoIUMXHRru7siXZjlnL
X-Gm-Message-State: AOJu0Yzczf2monGyV4b/fsWp/ALFPXTCwJtUEcOPq7m75zkaQD6FAFTG
	OJ7UWnD59sePcM1In5vMcR4yg/62By6SfdsrtHAIyNtFOsEK9QotW6qzKVKTqGE=
X-Google-Smtp-Source: AGHT+IHS90cA+AgUmlXmCnhm/ecMbFJNWD0dZq3yi8zpTRzaElJ0z3lk+4PPNraXYIXlpU0z512YdA==
X-Received: by 2002:a17:902:d4d1:b0:1e2:8bce:b338 with SMTP id o17-20020a170902d4d100b001e28bceb338mr994151plg.5.1712187700925;
        Wed, 03 Apr 2024 16:41:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings (extensions.yaml)
Date: Wed,  3 Apr 2024 16:34:52 -0700
Message-ID: <20240403234054.2020347-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164143_871749_CDA9223A 
X-CRM114-Status: UNSURE (   7.02  )
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

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..45b87ad6cc1c 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -317,6 +317,16 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description:
+            The standard Zicfilp extension for enforcing forward edge control-flow
+            integrity in commit 3a20dc9 of riscv-cfi and is in public review.
+
+        - const: zicfiss
+          description:
+            The standard Zicfiss extension for enforcing backward edge control-flow
+            integrity in commit 3a20dc9 of riscv-cfi and is in publc review.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
