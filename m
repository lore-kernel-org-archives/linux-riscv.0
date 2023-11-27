Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE3BC07E98
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDnOGGhHO1/zVIVSmg4Fc48Vf+ApevGCKpXqmBw2SFA=; b=WG1giO52l/gKWz
	X8qt5baQQr/tdR9j8iE2Ccj2Sipue7MQvYA+2YyAmZxqlaTCZ6iIaCq4xGPvSzQdMdyLL+2IfB1Pm
	cYlo3v1FPqOsGkd+R7ryqP1yqM2DgwLnfq/04KfcSb6MsRXS7jgQ0XBK68zgzPVnP0tDJGoTQkYmF
	5vxGssEo0GUK7c6Z1nb76sfqjwnjl4NLmQIPNkSRcqeBoMhq+ASO9iVbxtIm8gLKHOK0eeKmz+ECp
	KGRkAR+GDG/qHvpGWbTUtJQQyK+WHfcWnRvxx2GIX5+zS0QkLoCwiM4J+5EZP4iYSZqEbT18jZoi2
	b/vXHes8qIE2U5MfxopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViV-001euU-1x;
	Mon, 27 Nov 2023 07:07:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViS-001erR-2F
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 07:07:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cfd78f8a12so1916845ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701068851; x=1701673651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWDZyqBJhOVpYqYhwbudR4lRinTiZ1fIB/oQ8fHi3tg=;
        b=QLBx8iCbdEuDrXqBqeM1d8jQpXFsjxs5UiXVtoeJ4HOcJog8llQnUJR6GYMpMQD/Z4
         KLoavIQn6sOIyzi58F1XGcFCTjd+mfNlv//9dtYOOTBCrmPHWKra3+CAKeAjIEsoIYsZ
         TI3PJ+TtRNnK5YmSLKPWt62TvenyzypJCJbKxaK+puYNTGOWy2q5iW3Djb0KJ1lA/+M4
         1XJj/CqooCIYynlIjenoOo2J36J4Rq+CRqR/qzvL08O7aFz0593EhZ/3U8PFomx5Z0R0
         DMexxmwuGSYaHMSUZvlIFeZsOE+gePFQggDqMf84z320nn/AbS5QtoK0jTJAhhuA6qz5
         6ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701068851; x=1701673651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWDZyqBJhOVpYqYhwbudR4lRinTiZ1fIB/oQ8fHi3tg=;
        b=Seh89jRcZnYPj9cvdc/0rLdbk83sBNtc/RcY1AOm8j2XzdJlM2lz9XV6mK7fCl3ObZ
         iGhxmKV1rAi8HCfRIzBc/OjbIL53SABpdj0ZYeE/1GVgIVYuREo8ksuoi/f7sMv8twW2
         Th775qrz14wwrHh+ojqvActmamGbU4KFxYdbun+LxHi/LqtFwvEziyYpjp678vbnEhNs
         yMU0qebUWy6gmcvnSvY3M/iGSU5LH1xgGcZfrJq146eEh7ya6Xw/Jedz9CHcmUSLfJks
         Ek+UQIWZd6lr3rSxAW+TW4C/7XyEEtuLAeSsMEkr5WoSCHQP6kVGpeV9fFpR34d5O/jc
         2vjA==
X-Gm-Message-State: AOJu0YyCqaIXX/Tz8SNcMCMgvYRmZ5QzbvIYqqrSfxyvkipldlxM31KL
	81vxznX9xR9ccjishzwDHD1WYA==
X-Google-Smtp-Source: AGHT+IH+pvi642lKHelJCCdm6Sbw3UusLCtlqBwe0TaqWn+6ozeTKQf9INKnJ4k0xOSABXksoQFmKA==
X-Received: by 2002:a17:902:820b:b0:1cf:cd4e:ca02 with SMTP id x11-20020a170902820b00b001cfcd4eca02mr2699019pln.24.1701068851234;
        Sun, 26 Nov 2023 23:07:31 -0800 (PST)
Received: from localhost.localdomain ([101.10.45.230])
        by smtp.gmail.com with ESMTPSA id jh15-20020a170903328f00b001cfcd3a764esm1340134plb.77.2023.11.26.23.07.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 23:07:31 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v2 06/13] crypto: scatterwalk - Add scatterwalk_next() to get the next scatterlist in scatter_walk
Date: Mon, 27 Nov 2023 15:06:56 +0800
Message-Id: <20231127070703.1697-7-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231127070703.1697-1-jerry.shih@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_230736_756419_9FB68081 
X-CRM114-Status: GOOD (  11.62  )
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

In some situations, we might split the `skcipher_request` into several
segments. When we try to move to next segment, we might use
`scatterwalk_ffwd()` to get the corresponding `scatterlist` iterating from
the head of `scatterlist`.

This helper function could just gather the information in `skcipher_walk`
and move to next `scatterlist` directly.

Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
---
 include/crypto/scatterwalk.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/crypto/scatterwalk.h b/include/crypto/scatterwalk.h
index 32fc4473175b..b1a90afe695d 100644
--- a/include/crypto/scatterwalk.h
+++ b/include/crypto/scatterwalk.h
@@ -98,7 +98,12 @@ void scatterwalk_map_and_copy(void *buf, struct scatterlist *sg,
 			      unsigned int start, unsigned int nbytes, int out);
 
 struct scatterlist *scatterwalk_ffwd(struct scatterlist dst[2],
-				     struct scatterlist *src,
-				     unsigned int len);
+				     struct scatterlist *src, unsigned int len);
+
+static inline struct scatterlist *scatterwalk_next(struct scatterlist dst[2],
+						   struct scatter_walk *src)
+{
+	return scatterwalk_ffwd(dst, src->sg, src->offset - src->sg->offset);
+}
 
 #endif  /* _CRYPTO_SCATTERWALK_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
