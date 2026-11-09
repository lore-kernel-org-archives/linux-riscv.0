Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24D606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RctDdOnZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDQfLNfT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ar6nJWtq4jZp91VDx31Df3fKA2xX7PnGTn8MffCuW20=; b=RctDdOnZRh72BNEftXRkH4I/8k
	OrtRrKNIYSgRuABJfm5wQrEcP9QlBB5bhZg/eUssWOS+PFsR8c3FQRrsW59fPbqtSqMtd0HxBqw5f
	wKy2EAOYPZLHAHqkQuMPTbbum5pw8xfvM+ay26fDjX4C4Z5QQXs99/UhFz3usgN94Fww+WJkrSzye
	5GRevgaQOgRgQ1Cwa49x21a5TmQrRo9nrZJOKuckLvDy6a2EUvc8OYRWzUERCtAaBX/Vvled0I00p
	tzWl4da7UU4fjWr5sMk4MFA0xHFM7ugSOEwKjyFGbjfiklBhESSPlRnpgYtFuJsKr1FLoSjamHSuD
	87mQexxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfL-0000000HNfP-2BKK;
	Mon, 09 Nov 2026 05:11:35 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfJ-0000000HNdu-0U9w
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:11:34 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so334708a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201092; x=1794805892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLBVynAnMVn6ipdjcgOcOiimigVGkoS4o0LHfR73ptY=;
        b=PDQfLNfTv4aAEQEKsziV22VANRyo9PH3MSfHSN7t2nydg1Oc3y3brvQ4/CspItOIDs
         i87Lt+Oqy6WoUbCw/zgp/bMf0ahHEa1xMqRk8dDnQfgcm8xMm0o3aZ1Ra2Zxd8f2tWBG
         5nGI10/A+njg2JaRmxXN/1x6qNls64nfwUcjqOFeXvflT3kr5tSceLGriKD1/OFgp5k9
         m7NbhI03x5D8mJmy0ZFqwoAGonMMZDqbXCc/IkRgo+DRXB+UGpvRF3hdxMsOIWfD5mnt
         BfJitFgoF6KFUwY/FhXvJT7NpCdDGYAjbtK2pC4rfKumGo+vmoswrRWWE9/bD/kUSXp3
         pTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201092; x=1794805892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLBVynAnMVn6ipdjcgOcOiimigVGkoS4o0LHfR73ptY=;
        b=rgeHanD9oDNnEMWXRYlpMeXTqpRJbzINfQu/3EFPttCHMKAyoV0E6650eG9WVhQqQe
         7QOgwezznxrzAk+nRkSxiRHShSwMFOz8x/npRDTaN0pOC8+ao/4An9GrpQ9IU7J2NQQ4
         VMPPuh7IlPot4kqtm/kO86KE9tdbKSFFKWGgx0FrYAQQlVKjKriMJEaUM6sjOmaf5Yzl
         1sWaKXqyT918x3yNHJnzNLVHwjpMFfGHbYKbZO4Vo546UcrBel6dY6dJ59rULaphWRcj
         eKJccJmTMicdvGRrTXXcEHFcgphuzUk9YV6ni2PWm042JjnvOiIKg2fz9/jFFgOrCnYx
         +IjA==
X-Forwarded-Encrypted: i=1; AL+hErGaMcuDu7iAAbpOIpDxIeO8UHhoATiNszt8cAnyev+XTT567VwHVJ/+nGskGB4WosxNlUt4ncfPS9IbAQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+cFO/U1dkdOhAmTmWk9wXf4zKtEX02leAyTrQPgXPFs6upETnp
	+PdJW6UiZvuWQp4HZIVUGlA1tEXdx3XwMuQzhrEQpbKoNWcVY8zRQoKY
X-Gm-Gg: AYBFou0paOxyhx8TW+eXJF3WVKcJM9wWOdPNh7So2K96eTnpv8XNeO7EzdI+tvghc+k
	xj1iiziopQaQCzbAAYaJ8hDQ351/v6v4yRVp+zGC6/++x6c47aWJJx+mxqseqjPN/uSaChK8Qip
	YQpi4G7ncvfUNlPDiAw6vWVPDIbrLKWAEupEv5sAeFU22BlSfynD9vP6kEV3S8W/sJ+1PTy45T5
	41/pR+6vi+FzusH14+od3unJlp4LMq0MtKXNMtQxq99eyuQBT5jfCXCoFTSOG+8m4GIDg+1g2fk
	PMo5SU555j11sfgdRux38lrB4dOFRhiNKg2vcgjViEr3BE/Ue0FWdBVuxbNEeeRtj4WWOCvM7pe
	op6jXZYkc9WGl3cWQdU/n5oO15usdUDlSLyDVOKRcyHUmY5GQ3edgoqpv43md4aZt9qTMNhTUvx
	wrUCevNW8kflS8mnxTpWCBSE6zfC6raiHYvmWgEafMULGOMHwLEqkIHXMQTvkaGcT0RBmUxqqgk
	8GB2Ah3DQQPo55hFRdQXlOfFySaNvm1dHpU/5lwGR/wyZclxk/BVGwIwo1ZvRY28ywvLPKntlQh
	x6wnWzUwq7798MdCAPWE7q6pvCVWVTE6W0d25PH0P9l2/lANBFqTHqdfI7FqF6BZsD674iPFPlI
	cy0vWkaYX5JnwyiEVmtw/c68If0B0smP1JBaybLFkpjppVLkub+2C/BIEQw==
X-Received: by 2002:a17:90b:5545:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b12d4b10dfmr2980482a91.58.1794201091869;
        Sun, 08 Nov 2026 21:11:31 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:31 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Drew Fustini <fustini@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 5/7] dt-bindings: riscv: add Smrnmi extension description
Date: Mon,  9 Nov 2026 15:40:45 +1030
Message-ID: <20261109051050.105623-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211133_163530_FD98FE0A 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Drew Fustini <fustini@kernel.org>

Add description for the Smrnmi extension (Resumable Non-Maskable
Interrupts) as ratified in 35eb3948bf0b ("Merge pull request #1492 from
riscv/smrnmi-ratified") of the riscv-isa-manual.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 79491ef8f86a..7f5d85c64f83 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smrnmi
+          description: |
+            The standard Smrnmi extension for Resumable Non-Maskable Interrupts
+            as ratified in commit 35eb3948bf0b ("Merge pull request #1492 from
+            riscv/smrnmi-ratified") of the riscv-isa-manual.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
