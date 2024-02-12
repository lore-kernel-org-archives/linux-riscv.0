Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29CFC4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3d45yhEAnzCNRJ7e4HRujKb2Nm8zQxiQLQah4413MI=; b=0l43AP55XRdhpy
	zCmSLnlUXJDhq/6Ia18SzZ/j8cBpRYt+p5p40ot/y7ndJ7BEEf/2Yvec1eE8gI4gcHKyflE/Q9aYr
	/4i/Bzr4G1Sa4d45QtLf4isfecXzkuEadUc24kgD99z/SNM/Ztfuo5SACt1fHaSgY1hRlGUtWH5Dz
	erRh8COwdC8uFJpyVINxP493h1nGppIkMynXcgvkB7Q/s3aOGDqkun45JufsO1xEgU3VXhnbYnq3+
	brBTcU+AbzFRJQl0JeDWBSbsA0zBxRlyDart5t1Ugv82Tk2SU4SQABXvVx4ra43kV0HyE6aQej4BJ
	78s4ZD0T1sBylTltTTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTq-00000004DCD-3Ou9;
	Mon, 12 Feb 2024 02:55:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTm-00000004D8z-2gnE
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:55:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d73066880eso25605415ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707706533; x=1708311333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyWEpJBZa6N5gG6vKnxq0FYgwkGh/wmTGuSHlmGCra0=;
        b=noMIfuxAjU8YgZbn/rQAxD2+r1R1tuIRxc/FoI+0p4jusSjAzJtlEobIx0scfI4aFU
         J9g3T7wzGnaml6f0kNCPfF8WFZ0hZmulJhSaU+NqRHZV+fY4B2BlqkpCCJ40pLSWAoF1
         GUWMtKQIjImPEQTQgG9UPtP6Ui3tT1zBaxcuzr9eiPwamjIURIBkoO6ZrHCL/HD39JWi
         Byyyh9k8KAjsJryktIrITQe8GCX9iJebDhBgVOde5rzxBKFR5t8p936P0HdoWWuMcWGh
         FaNTSFMgrorbzokYz88WlZWWKI/VXp4sGXumZAJHZG93C0FoKCy8UZeQNjKz4VIIDzsM
         3WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707706533; x=1708311333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyWEpJBZa6N5gG6vKnxq0FYgwkGh/wmTGuSHlmGCra0=;
        b=cAjvLS6PhPDzOmMtasFk1OJ/QUkYyKquwOEtr0KlixbMCvW4vCuyNaGYeDw0xvtSFw
         9gOqEN6bEkbAiARQa3hJGkHtk4+0gx3pfb8BXq+/F9B4rBUWZXS1cKqYDd0BFPxWEQVj
         9M2cPuNzhpnr2ykXyhQ/tLIvQzGk/9ulBKgXm5MKRPMLx/HqQqr9Bxrvuk8HIM7/FMO1
         ShrfyICFfSiVHyoFcUhGM9TlFRhQTuwWvd9lf3BF6N9plev+FCWz5fosIEhbZrhTZ5rA
         zDMmafQoT+0iFeEH9h+ciyTbAbljK3B5Ck/8b9pulsKp9YlNktRjo9iOaFrq+fi9Koes
         oIVA==
X-Gm-Message-State: AOJu0Yw0G7soU11XJ7L4hXEH5Yf4+lI9ls11J5TQtuo87SKSxH/upGSO
	i3vSy6GeszHAnOAyWeKP2lskx6+fxGdcD0wkdHCJnniY9Z53Rja8oXmGSfs2WkM=
X-Google-Smtp-Source: AGHT+IEQGBabtshtJRnBy7QMR0LnKtEJkjk8oI+Ecfk7Bk5If+Yz2qKW8FH3n5DdlZVHIUwqXKsG3w==
X-Received: by 2002:a17:902:e543:b0:1da:2a91:8c08 with SMTP id n3-20020a170902e54300b001da2a918c08mr2970896plf.3.1707706533677;
        Sun, 11 Feb 2024 18:55:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuWR7ifv90QrNgp9OEt3yI6Kuwl8TrHbiwLrMId33GgFSjH88KNG50sMejjWgECWoCB1ug+/IqU9OjHkK5Vn/juEDCGgYKNrlq73OyQmooS6Cdg7mXmU3LW3vffu4GbXxiPKCchb2+
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170902fa4300b001d9af77893esm4906443plb.58.2024.02.11.18.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:55:33 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/7] riscv: kprobes: Use patch_text_nosync() for insn slots
Date: Sun, 11 Feb 2024 18:55:14 -0800
Message-ID: <20240212025529.1971876-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212025529.1971876-1-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_185534_755296_1A730E68 
X-CRM114-Status: UNSURE (   9.90  )
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

These instructions are not yet visible to the rest of the system,
so there is no need to do the whole stop_machine() dance.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/probes/kprobes.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 2f08c14a933d..cbf8197072bf 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -28,9 +28,9 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 
 	p->ainsn.api.restore = (unsigned long)p->addr + offset;
 
-	patch_text(p->ainsn.api.insn, &p->opcode, 1);
-	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
-		   &insn, 1);
+	patch_text_nosync(p->ainsn.api.insn, &p->opcode, 1);
+	patch_text_nosync(p->ainsn.api.insn + offset,
+			  &insn, 1);
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
