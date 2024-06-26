Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB4C30653
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zz5CieM7fK8R3oPlwg+PHpbclLpuk3VKA01Omdj5cKM=; b=00dBIWBbGUuTCw
	pMj+cBis37Vp+qu4qkF/B26nVoQ6fnqrWBKBn4Szt5gslnpOPLwEpQUgavxyIeEEFMPqKvr1pglWw
	0rn2gbJuQjSLxzzqPZNDruklFofCrZfptd0s7c2/QMazG5SNGktdZlg03iIJ6lXfXFptlNh2Cd09+
	KrihUrhSfLUAjw2LUVi3A3GvugHa95hulxIS48Ud/Se8GzGY6Gon96a1aIZsuwtgKtBfBQq1WuaWM
	bDkqMs8sB7h54LToffVI9ua4gXbuaXCWlCfop+O0XDuQjE6nIATYAmdUmYZ3rf1v2FpU0R2AbBBP8
	WaxtqcLI6K3xqdbcrn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSM4-00000006rO0-2h41;
	Wed, 26 Jun 2024 13:06:32 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSLU-00000006r02-0B4k
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:06:02 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so74375051fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407154; x=1720011954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6LJZCR61gmm4dvekAa0Q1TIoLF/ScrG5TtOv9gDZ/w=;
        b=mmGkNjD4LPUVKhgWPrRLayP+q/jzFvrHawELWe9xnJMaEB6zHv5VPzQb5NxUvUyEpO
         XP49VYLhk9DVwL0oQ+TEU/vdghGp8ywoYXQAd78TR1Qk+bOeUfqQ5AuVp7gZULCHp66k
         FPXBpEDEhssU0sC6PB5NZT4B/AxHGCmsw9CFfBo4vE7N5UrAio9i67ALAZrC+qrvCO+B
         FLFAAIQ8ijAeEZVoKxsZivdJtUdM155P5rbm8DFEwNCZQ/+jbWDv09R901AfeLOk3l0e
         upJw3KWlevtSBJlWhb+vLy8VsXc1K9WoruAWLTO8DPc3grnBsNAj3YbRx9B1yMeG9km+
         dgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407154; x=1720011954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6LJZCR61gmm4dvekAa0Q1TIoLF/ScrG5TtOv9gDZ/w=;
        b=IJBSdlSU7gKIePS9fmhmoxUWhwN861HxKi87mYEkzWqZySxzUenTMHXara3FR+MU9L
         JALUxU+3ObzLlHjFW9XZOhW1t346pV/2uIG6SJDNP2Jkx1bx51Fc+ybmyaS4txOiQOvJ
         oslg66swERZoLgLtCFrZUIgI1GmBSMuDbwNFpILTW6EXqJeS04hW+Rybbi6f4c4601aa
         GVNcudYWLt8Kq4Yb+QEVWyo5+DlWt+8qFewfj5opWVhKo/VoUoBsmVg7Iza+qkw/QJLx
         +MleIX15DxJxu86X/5ybg7cCnS9KYAuA7opxDC2Eplb1CKaUDX3xiVjo7Jpionb+gAe3
         wtKA==
X-Forwarded-Encrypted: i=1; AJvYcCV5egj4y4KzrFBo3CXvczAb9ReUdRka4rXmS9y3z7ZBtRoBKvpe3nzv/+e3+3DIHN7PLLIUfV1Z+IkdSD+6ZPwVl9NnQsWk5bFfmiQQATBP
X-Gm-Message-State: AOJu0YxvAEmdVBLkzTRsOQXl901iGG10/nIJorSMMdCGZ6SHfx9bNOsz
	m0GFgwzi5AUQSoTEKNxUulNiEd1TPD8YesW3MMR2bCfb74lswqhy0lOmG/4uhlU=
X-Google-Smtp-Source: AGHT+IHX+jzGQgnJriZOGQ/oAJSCUkFR6oZJI+0k3ahW32MnlEUF+2I4ESnYZpAqS9088kQ4KTVI2w==
X-Received: by 2002:ac2:5f4e:0:b0:52c:e030:144e with SMTP id 2adb3069b0e04-52ce185ecd4mr6228931e87.47.1719407154179;
        Wed, 26 Jun 2024 06:05:54 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638d9bd0fsm15831149f8f.52.2024.06.26.06.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:53 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 02/10] dt-bindings: riscv: Add Zabha ISA extension description
Date: Wed, 26 Jun 2024 15:03:39 +0200
Message-Id: <20240626130347.520750-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_060600_370361_94F83252 
X-CRM114-Status: UNSURE (   9.57  )
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
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..e6436260bdeb 100644
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
