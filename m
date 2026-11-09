Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC62606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zaRDcpdR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nikfkyMp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BObCVA2uZLK19s0jIVLWykb0TnljdsftglWvauIWaag=; b=zaRDcpdR31H+SGvTX+iJvAM1wp
	yAjTqhuqrkc2iWaEsNWW9uqq6v6uPOXFfyOfobOcg/4Ga+b+8sBirIAghmSxR/nlhGHbn3uMV3IC3
	wyTQHuwvtxgS2q8uYEhETbkLKhscJaIeklvFwq2FuGEUoQCw32TmXMa2E8m9NRdEG7T07FnUjP75P
	dX/egApJEoVV8Ba/fl5LbfrqS34nBNMJbCLWuZJCBuShPgxzdJamWiZ48Tuhl0ne50FaMg4wqvNTw
	Jm+Ej1CEexHc6hkmSobhMDDsfEipTBHBu9I8qEq0rzA8goKoF5BlBgTjQ423Teujtt5N5RErJkeRb
	4vPInVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfQ-0000000HNiI-2b5X;
	Mon, 09 Nov 2026 05:11:40 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfO-0000000HNgt-12x3
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:11:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ed06b725fdso3279185ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201097; x=1794805897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cUkRDkkVJbrdFe/cgpwKcZrnBsjX+X35w8h1XS3sJI=;
        b=nikfkyMpnwpVwk5D+n3C6t/wnR5u+rMlaloM/sMpe0Zw/WD0PXTyDHQife8PrDDwvi
         VJQCotUkQbl+Ee6M1QGUllHEcEUc2xTxTUq6mfsm8ttUhfmff5guzAdda+13XD/DPLHp
         jqNMNOttbMH53dW4dWtzx2EU1jLTqEu4sYdQhTlo33hkXBihB3gryiNvQQ0nSKI78O9s
         lw2BMQVhsj246vLvdnMyxjPx20GCkGsqDHDKe9w10PymYHUIEMeVABdk3xLVK+D7UdMI
         9GMs6ELU86wy9mv2fW6ZDBEBnRTRzG0GWlSqYBCMCInh90bd9IsMxcM4B/tndMvvVT+k
         rLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201097; x=1794805897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cUkRDkkVJbrdFe/cgpwKcZrnBsjX+X35w8h1XS3sJI=;
        b=DGDyKtnkjDkjZU8SYWNSnRllKDSw351zNNJEW6radd7O/7RaHXQvjg8szU+pdPQ43I
         DFbMBly0qUCKFz6nqTuE5fTgSGCpZqK3nLUPSMVUzTAUEQ+9/pG5a/SlkglrNEO6yT02
         VvVpMlC7BTEcfe76vOtmYThhrOWCrXFmvdiB4X1azmdTqA5ECvfsLEJmRHXPTdGWG0nm
         tNv2mWotdZmgdxhIdxUTUH/0jj/YzQ6mQyA6gKdzHMe/ZCvOj7VR/SYVNsZrkg627w24
         GOoqzpe1LEoKZvcw41xct+6cZQeaTrOzxl30Cvd52siLwaVceoU+wUhV8uxwmSmI4lP+
         byng==
X-Forwarded-Encrypted: i=1; AL+hErHBnDBIUYu+bYV6NZzNoRXxoPnaBc500HzzTq8vnsZIsbL2phidX+e058pXWKKlKujLiBPCXjQuBd0ykw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8UkKfgSnRp6dtsCyxm2s4Gbl7ox5CQ1xlPPgrO8852OghIElEz
	GeIeE++w1Sc0jXepDWOdBmWHLUbsdEON66Mh3xyJCBAM7q5IXtguJxRO
X-Gm-Gg: AYBFou0HfBrUKO4a3jMoqojjdJAhEd//4RnTypSqVgMeBAjVn2Hzy+iIlWF1pQ5jfPP
	/DXPiY7p7loE/NrhmYG/5stb7OD8eAuzlgchsvhaCEk0IqreT6K3fAY1coa6Tk/NtDLss6IqpcB
	Ws/0pHI2cpYFjddHsviyNNy87bWWvkywfbHkVofPhq2zZFZ+E4RYNkGRObhqJeNU/tRMcFgkXAB
	sDYj901oVuEcRr+GR02X0eKRLjU+TOQL0PkychIZUHNOBYqnu/qfSdFl/LjC0jEOv1EyxFBSC7N
	veDBowcWxWSNkxzBQ6ApxcvpcrYhzApfiHXkNI8IuSLW59ymQo2O0ZM8CyObibI4lWEaK/t5N7K
	BCur4CgZ7uuYkP8qpdP/WpCkRo/orR5By1aPibxiaIuslArbu8iEI3lY5T6wfZue8SUKnBOmQWF
	H9Fjcg+1VYe1DkAzqnXSQSXpj+S/NwE2xkTIMW8oOCCH+NHc4l9tOGpUp3/j1gF+91DoHgqkCA6
	0coHmFX4UEhRqHHvyfKYLLAPhgS4bC8WBp/O8ZpL0xVgPf3ls33KZSDiMWOSFAJ/F84qiYlbprd
	QBR1XSXGk4n1uICcpT5VUvdYEHP+dzL1snCMoSLQhaqEeQ0zmuebxnMUNQZttIGsSqCVwOrM/tr
	iPaJz3qZkLKld48aJ9IAkPJwHgu3EaYq5BAVSuOl+6fuB1/4hfqzVbFedqw==
X-Received: by 2002:a17:90b:268f:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b12d102c5amr1945503a91.6.1794201097253;
        Sun, 08 Nov 2026 21:11:37 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:36 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Date: Mon,  9 Nov 2026 15:40:46 +1030
Message-ID: <20261109051050.105623-7-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211138_291417_F560BCEA 
X-CRM114-Status: UNSURE (   8.16  )
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

Add compatible for the Tenstorrent Atlantis platform.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes, pick up review tags
---
 Documentation/devicetree/bindings/riscv/tenstorrent.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
index e15359b2aab6..7fb640e38455 100644
--- a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
@@ -22,6 +22,10 @@ properties:
         items:
           - const: tenstorrent,blackhole-card
           - const: tenstorrent,blackhole
+      - description: Tenstorrent Atlantis
+        items:
+          - const: tenstorrent,atlantis-evb
+          - const: tenstorrent,atlantis
 
 additionalProperties: true
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
