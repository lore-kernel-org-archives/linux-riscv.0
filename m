Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF42C52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9d6e4TppBsxCPspoHJ2T56P9zoZYUvO5M9jEWurh1+8=; b=4VEHn1nFre1mfr
	LADj5NX+P2u975dR7t3CWpI9l8+l5vQ7205d8fvU9P6z9aHR4Yu+L+9lUzS9fqyAOR8+NYqYj24Vl
	4lgWVyER6lTID939q95/75GGCN9gd6F5vk6YmT++I2te6i3XstJ1h273zHbYhU9ClE4gzrHZKjE+l
	qQyPr1faCPoQ3e8j+GL2bGDOBO0uq/RU39LLYketX+aVcr52DEvoSdqVlAukoi4EO4qiFAifKPzEB
	OPokS+PnKuS28ZZijltpbxlH84YQqmDoRjvbUe74IGLE0IHiwus+Q22ITju5yJVsyuWoNE0kJbmHA
	m3ltBUSehoxXA/OmKAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfapi-0000000GKfI-08A3;
	Sun, 18 Aug 2024 08:00:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZhw-0000000GExO-1mtW
	for linux-riscv@bombadil.infradead.org;
	Sun, 18 Aug 2024 06:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AUJVvfa71x+iwF5DF3rrBv6vNd03sOzmOgv8ZqY/vyI=; b=Qzn+4afgCwqo5IgC3Tt1VPDc68
	nW9ZUMkjmFVZMu+5ylq4U5X7Orzj2D437c1Cl2Sr8Bwb9GNLo6SElNlDGUdaig+UGA7qNyvH1YLMT
	+LtX2IwxYxqIL/pfSEXCzDG6UE5fDPtnoOTRanPV6tpsB5zmg/cq4yqtu1tP7j3gQ9WxIzTF3p0SX
	6V+flcObyhx8L2w2pPTuCTXHniKKEMmi5PpLAjuzvEB4A2xpCUpEHqJWi3Sslo51SUC6VqJGJ3BMR
	ml32br4FLh/4RH9ciBysbx+MYQDM16bAbuhpuiQPH6SyBmuMZljPMbxIxSH842Tf7IZVX7BgsHeeV
	J6KAaHEw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZhs-00000008xTx-3HeZ
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 06:48:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37196229343so1258951f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963680; x=1724568480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUJVvfa71x+iwF5DF3rrBv6vNd03sOzmOgv8ZqY/vyI=;
        b=GuaL/yM61guvyBRqNTOeCdbt2ZKpR7rfN4jaAuz4WdkGvPAT5cTkGPAVnAC0C12ATS
         8i4VfqsGrdZAZHvt21rf5BF7rFJI+7e1IG/pR9byW0z55nXBo1z6dQ/+V/gCCGC6ySTw
         g8yhON/5/IKWl4OBMtqmB5AkgIAJ3fLg9Ku01s7oxF7zv/zZkJWbJ3r38WVMQ1T7p5ld
         VC3gQmRFWP4KK7Z+Aqrd35LK6ugUZdBRjp6VuzUh+9jXKTBjWDWwzcVjGlcuTqfpwiVb
         oZqLLITHF1JvqG6DbWyXCFqU5W7TsTrMu6rj2ndTE6LRw3Fd9vqnjZXc60wNMIk7SNTu
         KMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963680; x=1724568480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUJVvfa71x+iwF5DF3rrBv6vNd03sOzmOgv8ZqY/vyI=;
        b=V6IMp2AzUQflbGNS52b/LtT2+/IhNR+pC806LD5mWNtThCsXJxfu3KnpYMq0+/lkMJ
         a6pqkq3edF8BJ0G1sMTicElfJYXQAJ00x3JGIEybH8T3kv7Z15T8YA/cR1aerq3oGKXw
         BjiO/gOSYWPdCdP7WpYMNHexHHNiog74KR/EZrouBF0tQhPhcTyx/3f2+nJwStWKqjxE
         OX7z6dQ4G3IP3yZE2CVbZb8+5JNNzvVR8/W5nA3rTgPjgZmg+y8lKWG5/chVVVre8MlA
         EWWOsoc2+Cz3Tm2+ZzQheKWHSgez7SJFgYlP8hA4uDoyosJtu8QlInckgMwYDfN1/bhh
         FLDg==
X-Forwarded-Encrypted: i=1; AJvYcCUEu3gynDkSFBsx8tukmzZZwNGhAHFYYPcuOZVIY+H7UtDOSkq1Ud2GqAVrZlCS5Sux9H0W1o54/9OlYHLKculsz3YY6fSwuL9sAeqMCjnD
X-Gm-Message-State: AOJu0YwBokxHhlF5grla3JU7K8x/l291W81irnT9NQ02SB1Y3wolAtpM
	OpW4/bmHPa/nxhvBxOHzC5wR0sZsxNdE3sXutvSLWvHpCbwI5Hyn6HqBfjO3sco=
X-Google-Smtp-Source: AGHT+IHGhKQ874lL1J7nsjPh6FSfKHuvYCqLot3YTtCsdD7yaCkb97X7rPbK0sQldMNV0hrVqhCG+Q==
X-Received: by 2002:a5d:53c5:0:b0:367:8a00:fac3 with SMTP id ffacd0b85a97d-371946514e9mr5069861f8f.30.1723963680234;
        Sat, 17 Aug 2024 23:48:00 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a1b8sm7336054f8f.5.2024.08.17.23.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:47:59 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 12/13] dt-bindings: riscv: Add Ziccrse ISA extension description
Date: Sun, 18 Aug 2024 08:35:37 +0200
Message-Id: <20240818063538.6651-13-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_074805_470675_7B3B521A 
X-CRM114-Status: UNSURE (   8.47  )
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

Add description for the Ziccrse ISA extension which was ratified in
the riscv profiles specification v1.0.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63578b95c4a..4f174c4c08ff 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -289,6 +289,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: ziccrse
+          description:
+            The standard Ziccrse extension which provides forward progress
+            guarantee on LR/SC sequences, as ratified in commit b1d806605f87
+            ("Updated to ratified state.") of the riscv profiles specification.
+
         - const: zk
           description:
             The standard Zk Standard Scalar cryptography extension as ratified
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
