Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E45CCD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5P4TCgARrYIoKtSJ/NrhjS+BDU9bSX8IimUQrKLXBdY=; b=4xYy5BlBm1iipz
	A0+dYFfLw6SklALQH4ln0Nob9tel2RC9isv+ksYEVoGaUOhvVGLbrQzsIZ5Q4PDSoMHlJuwB0mClk
	5ncsHeqarBOuOQ9dbSzoCqhzq/JYHBoGtclU5ilqreJIF6ZoB0bnHYJAqa279LnKnSu1sRvlVwEQE
	jcToIXccgOnIbJJ6pOgYmIIOCmLbO5g9sYixRToVY7RnxCQ9dWwFBvhzxeCOWS5ixazQVFwuzO+MJ
	O4A6JwgiKONsRQsAKfmIwtoMZZrdTYF6SzSygB5xai15CdL9Fh/tiOySK9L1Dm8dmHfDNSOwRmWCo
	Nn7vh24a9ZDUuSUYNs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFq-0000000EV76-31pS;
	Wed, 03 Jun 2026 07:43:10 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFo-0000000EV6E-33H8
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:43:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c85a2ca7bf7so1426937a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472588; x=1781077388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5uEvdBhcYIB/N6I7KQE0k+DcpCP+2VfxIHfSY5Ub2U=;
        b=cHMIwxLyXC9snG27W3bJ3AFnblo4I43gqXfSE90SRUcjcdjsIGt3avDNdhzp6152SK
         yUhsK9J1c4QL1KpmaYU28cBzJKWjnQQ1kvDyGGGaoSTAage/3WA1IDIdw1dUBmxnFqR9
         nCrf5tqoZDhsmNeRekkz1XpJ9JQfaZ3XtNDwk0qVs2WskSZSwfXzgdNtDsmczeZvFOJo
         Ao78PsfOZg9c1gsaHlpLTZE4PsKhztsX2SS9RQznx8Zidb204UzgcIKl+7m7VY3d17XK
         sXJAczrubCZjnUkWfuW6vNUy5Vs37Z7ep9ipv7UyLkhqF4+25Kvni7QEdxmWNfz+RmhL
         1BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472588; x=1781077388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5uEvdBhcYIB/N6I7KQE0k+DcpCP+2VfxIHfSY5Ub2U=;
        b=oH7j0R7OfFCbB2RPKkTKLkQ41XxSzVeQHutxZ9Wf9YdU3sfuCAYzPrGgqqM2Zp2A6j
         HtnJb/IPmMreNTmxCMcA639pJhvDrfW1ehdS1ZIp9Gbg0MXOvgdxHo1dySN9fSVLZIIu
         lIhRV1k0EvvXktljMgYoWOIt78T8aHZ/ckjuoxyOj0uRrQom2g6WAPHDO68yoX9+huBc
         U+/hzdsBxUL+DrgdmURi/dOCS7+WJAaBWKsyTVhlpXP1y2Wo0MQphZ7kzLvsmg9XoBQI
         /eeb2VqM3z++3C514pA3VfCLrfdASKp6gmWai02jZoFpjolgcKjnE7NlQacrp1oOwlCL
         L4Lg==
X-Forwarded-Encrypted: i=1; AFNElJ9KoMRRkd5aS8kWYwUsrThKBstr3IW3lXad+54O97Ehc60utMPsMlwsPKjIrc8yFN4DwQ5jCJExVh0G5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZlSUrOtxBkgmHWN2jDRQtiY3woRd7P/l+xZchu6myeqQZoRhT
	eHJzrwNlu5i6jVvYevMngN9/uKf6r1cDWC6O/uBG9LXOb+WT9bop1FN0
X-Gm-Gg: Acq92OFBXYyRcdgqWiZ0y+gRAP1do5vinFz3qauovYS4T5F7oILcE9amkiQw1YoAn5A
	rxNJHmT6tg5yBqM0CW7kOzlLX9XrW/EF+1LscVG13qoLwWlbj+G6tFzRHhUUdGr4LsBz+zZUu7r
	qHamCObb48e541DHcWvxON8QOBUWJd/svRS1bzdTIVJX7/Jn6vTdZvVIuGmtaL6lhRoqTtSgJ6n
	nD0jVcBvTAQL2pBnzDtqu9fxVIzMOPjJRaIsG4z+XeRggupgjRCcbUSfOqzZEmBM58SPoTdLWyU
	rIVV5ayhTXepAVPMEe1aFQs1Q+Rc2c1qP9eAvgdCkBGcj2EE7Xpj321w1A8ldhNQFTfJZmTYZDs
	63WH6AhZyKK9GWRrR/TIoY3OnvrMiXKlqALj4IpiQHzerpv8+PzQXCsgPu4Xkmt5W2u/ptLc4qH
	YOdzX589cjCnAHllc0Mg96hySWxOuaKzsaWzSGHDE8OZCvlV4rEtdVounkFCbtJh4qAMrHBoYbl
	BCG3MK6qM1CRkk2LxeQpFkiyvGbF62A8S0ZOcuChDsfhW0LsFVSuRi7/tk8USxKALwIprrRHxk=
X-Received: by 2002:a05:6a21:a98:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3b497646923mr2670209637.32.1780472587959;
        Wed, 03 Jun 2026 00:43:07 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Date: Wed,  3 Jun 2026 17:12:15 +0930
Message-ID: <20260603074222.593243-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004308_774244_F5F69F01 
X-CRM114-Status: UNSURE (   8.06  )
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

Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
core.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..2a57bd14569e 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -75,6 +75,11 @@ properties:
               - sifive,x280
           - const: sifive,rocket0
           - const: riscv
+      - items:
+          - enum:
+              - tenstorrent,ascalon-xg
+          - const: tenstorrent,ascalon
+          - const: riscv
       - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
