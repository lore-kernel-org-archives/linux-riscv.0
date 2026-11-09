Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A01606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4mtes+f/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGW4oX3H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FKNW34yVxQ/dUzV6uwVhy98uL0Svh3Zq1anYAIl/fRI=; b=4mtes+f/F8Yru7FADhOJX5p5b5
	w9242YpKv748454HLWl0yDDIGNIaHIxHGQX+sTnYOoi8p+h7+vqm4suyG4+v1WB7ObfXPb5IewFaw
	U6brJ4p4zqKu9mCY8xQYV4N2ZkVhKj6wHdLaowACG7Gs8/vXTZNyHNtWgHygZYyrgqkrjHevfG/SU
	G6+lX1l4L8StSxpCRu2krf57F3o18fT/y2c1TYnbvy8OQFAXwsvzLijhL5LnPmJPopJTy5UCzMGwM
	w1JqhQDZc1iyZ4Z/Wh+mB30dXB5WUpyWTq2Oy6RLOcUxGYeNoFj2wjvBikfL9Cx3TPqZ6KVaoKiwq
	jaRuWXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfA-0000000HNan-1HxN;
	Mon, 09 Nov 2026 05:11:24 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHf7-0000000HNZr-3chN
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:11:23 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc147d86bebso210993a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201081; x=1794805881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgRGsEIxSdF7se1kH5ZKybJwqIiFvQpOJpHKAYNwocs=;
        b=TGW4oX3HP8gSCPpx+vWeGJg+j9LcVQ+aj3S05BOa5LWizmrRKGMc72goixARFj1H47
         bsEAPGVyUByg516wczu9xfOjG8IhH0DoEeQh0wR8zbRExrY58QkFgCXvEh+kjbCSGUD4
         WR4T9aBuWK/KNgUCq5HAAZSXQJEeJwhlz0ZW8pZaiDbB740BJ0/0pOKihh0V9HY+3FA+
         5wiwoIks54/K30pLjE0IDC54XDFeYW4hLNMCQBS5/Cxld57KBv8RjjbT9+IthzaJrkKu
         P2hFnfLW2/ZySiIaGziTcPiIJY5JLsCKl2FMkCq1nD/jkVg3b2EDjeTtZe2RptrUs4He
         XhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201081; x=1794805881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgRGsEIxSdF7se1kH5ZKybJwqIiFvQpOJpHKAYNwocs=;
        b=rsZenARasTQ4kt33pY5+NAPC/Eq8E6Apcwk6NYSJI4yCRWF80kS3OtVXbmAbIeSGXw
         qT85ioKbXI4RiUR7uvwd6mISsjMaA62WQYPgSExig4mplu7u3LnfLM6m37HCZnBK2ztl
         Cx8Ksq3/venQohH92fVZ2kY6ikzAV/Qq9vO35Scd73v/UldxTkBS4ArKhl17V+/wo6CN
         Rz6r83AMPUFBFREw8tsFQzlVv8uIu9OAQDMUENQlLrkz3fODq97LRAuGhGmAAqMw5pW8
         U+N72lxKPE9dSkmkm63rFN7k2ziz1voBeRX7YXSjqzmGaJCeGHAGXmQJLtQ47Z03DxXx
         wDfw==
X-Forwarded-Encrypted: i=1; AL+hErECyaFBkyKTUc/36lRLupRX1znblr3YLyvmTLTG/aD5P8BmFsE19xMdFDjDx57l/agQ/KSMf1pT0EAiJg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/OGiVlTItlMtUVgsa2CnqcDWPiqStCudTvvvbYOVB6pAD7M/NM
	ayFFhY+775H7YIsDq0E199pGor1hlH2p5tv1pEtoVPGKF+cvyqyL0H2Q
X-Gm-Gg: AYBFou1X742Ay4tO3DNp7aQF90U70YpqEIDoythc+4J+ncD6V5lksu2HxcI8MkH8s17
	QRt3Cf5gyb0LPCRtKO0LC8XyIlSEZnWLJZ6vJ9gsznfRvt5+YBfT7C1n6VZUnF9GTo8w+ry+4vg
	vNViVzXky8kl9/JqVXCNfi6pkFqDvBVDOSdbQXMrxpi0jUiRkutLx5XzocGXHN3hVUteni7uk4o
	vGqciEJdFTevirt1f2+omPJTznBSj336ADdG0ajmMWPMTZe3Axt0YAwmvwpcYYNzlcmPZjHVkjG
	2r7BOH16+mxEiM4uqfXK5c2JIcNIXWDMJnN5J1aezVqUheyPl4aFmAX0MOGQKcUVRm58kCUtM/N
	zx5LyNFfDXasr9BT6dSxD3o7KrRlU0sMacblJhQpTIh/5LJ1lU7GqyBh28DlvWaPySaSuTQwa8v
	CPGgkF9C9U+3O49PhGuU6abOrbLq80n9nOOkGymSzs1gtq817hc2B5j/gns55j7P2gtP0G5IgPs
	JcgBkurp4KjDkXHjq5ZXLssLAX2D+9RbWT6Fw5/pOs/x7WmFbFCM3zVqZ8My/3joXknH3/AvaBU
	3jqpUBVC286cR9XTEHCCbI/JmirKWk3ImUIimF6ixAF2ZlmE8y7jflEaJ4JUK31G2SQv/PNorMq
	+Gjux+Ug3ZS3jj7IYYIGWZj2yF66M872n86pTZcvttcUXidSorwghqaIwcg==
X-Received: by 2002:a17:90b:1e47:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3b12d3fc296mr2052368a91.11.1794201081003;
        Sun, 08 Nov 2026 21:11:21 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:20 -0800 (PST)
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
Subject: [PATCH v3 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Date: Mon,  9 Nov 2026 15:40:43 +1030
Message-ID: <20261109051050.105623-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211121_905209_FD126C31 
X-CRM114-Status: UNSURE (   8.28  )
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

Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
core.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes, pick up review tags
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..2d2e4606a53e 100644
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
