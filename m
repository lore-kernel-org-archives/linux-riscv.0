Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B8CCF58E5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 07:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSfjCCPukGQxmNcE5wseuDNXt8Oqi641sDwieY0UnMg=; b=G0a12bgJ+zPHq9
	8vjVLLuihFpLTADP/5QzumbGLhxzBoRr2ZILfad2QuObZOazOi6/lMJCF3ooW5eti08sS1uKp4NAs
	UfkhDApj5QGfYR6pKqhxDzK8+n2Jgi90oRtoE0pif7ACHfNbgjkryjR63qraMuRH8IenBdnY1eug+
	purw1FVNDYCAe0KGu+r8SJJuUkIkbnCoiIMZe/CV+y2Kmw5+zJvCVO7QjLFZqxOtXeJfzKEs6Leae
	r5TaPHGt5IoY1yulByuLUvMJnu7l6ww4hxf/eL96XcFQkK2cWTjeh3wbYM9f1+v6FhKL7YEc8z+K7
	cvO/mRSKSKdEmaaYO2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYEj-0000000BddF-3NlB;
	Fri, 20 Sep 2024 07:39:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYEf-0000000BdZK-0GGm
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 07:39:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-205909afad3so21734115ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 00:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726817964; x=1727422764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruwmjdS7i6iu2fXr/1ljeWFvjxlJAr2Uh230cCJEG48=;
        b=IyOW/ih3NMh2smyZmcMCc0uTZfwwj90c4tw+LJeTHj6/S6xefzxWPpGcfheJXDMJ6z
         qMvybW4btDRKOCHDOk2E24EfylWEqWxjsfcBohixesDev5wXkKDhN0lpksvr6i6iXP14
         1VY4yy54VkI/iUzmT5FqgfWCeT8gccG5q3u7bEkXvx8UJbbWMaMnyLSZ2FNbDE/81WHi
         Cgr2PrrMMj79h3VoxHCFzJdftt/RQJsiHN53uhNZClhxXZ/Y/pSYVc/OiZb5QvdOrg6c
         HhTKz24nDxyqfBNMExQgzAQS13OSOFvL5muJdqYc0li5CrOQFJp6AoJ8DVwHW3RSvLGM
         YlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726817964; x=1727422764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruwmjdS7i6iu2fXr/1ljeWFvjxlJAr2Uh230cCJEG48=;
        b=fD96DZrEBVYHyIvvvIacv3aInpNsFnxvVDLXUJY1Q8tRm12HMSdJlXVoh63ZQlHD5G
         nT8+CsGL3zWCGrqjFhruPIItLiWBcKRVO1ACD7i3ap4XQyaLYLsd/pQrTgfifFshDqgn
         RAARUhcTkcnY5KNhC3Vqm83Tf2+oisFGxCBmgabKxkT2/O64bYXP4kIFF5t15UfDR/0u
         rGZA4rK6XmnZeI3/t8WkoOBkydusNIQogf8U1tQvukIVFbRBCyfEd/d9Ra952Nvron6T
         369p6sPgRAEjyBDGje4teMXiql/COLOaM/Mc7DPJ37oY181oauyT+JU3PmzxJpTO+Wp1
         d3oA==
X-Forwarded-Encrypted: i=1; AJvYcCXd1dGS7z2WRLx6GEHX/eGrDMkWy9YpbjVkCxma3f5b6o6sFNZ/Llx3bZIrpB5dxuWMTOTqhWSf/iyirw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxi0KUsgJwbv7TkuhWCM67nf8rAEH7szB1lz+ujjo8S/9MToAX
	xyuNsXjcIKoEVte8BUSkJLGVMxs0VYEFzlJ30Kj0fJ9hGajXZ7EW6jOYiKo6uQw=
X-Google-Smtp-Source: AGHT+IFQ17yTVynIy2XrD45IeMLpoJPTm7mZPtHiliv+sGkaava/UbW2FEYcKNJPThWePCcr9bME2w==
X-Received: by 2002:a17:902:f693:b0:206:c5cf:9721 with SMTP id d9443c01a7336-208d830ed04mr28068335ad.1.1726817964075;
        Fri, 20 Sep 2024 00:39:24 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946fcaa4sm89645805ad.212.2024.09.20.00.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:39:23 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 20 Sep 2024 15:39:03 +0800
Subject: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
MIME-Version: 1.0
Message-Id: <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
In-Reply-To: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=0k8ksCBEILGEf/m73awHSumKV1bg5YEQJrbmB46fqmU=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBm7SalmDrzx1nt7U4zRVn2TPSNvgiS6IDu0bWQn
 Kih/ez6tBaJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZu0mpQAKCRDSA/2dB3lA
 vYzBDAC4qFye9TdTtbWuZxd4jp5gc9vJmV5AkP++702TLaSmioYtypI+JvTir7sHlehq6ncb/yf
 bmnci8IxCkk1BADX4GYvx2EGMziigRvdO2ZyTCIUr4Oe6SazBRjKSHvpi6QSWiCZAyhrXMtbFhe
 h9QvCakpMYjDTpp7Xiw2vj4VfO4nILyDcQCW54ZnUMqsEvXm7Yf3lIzElrG0gFmU3wfUsfxhc64
 tQEwoVnpzClS/JFlW2tW+zaI31qv4AQ6Ntw880KMfwKu0gI8546318I7uHDl0HK5ZVO2jrt/pCF
 iRvjX1UeHaIRBYdojju8pI7yWfoHS8l8yoOSHhtJ/rpRCUsEzPgVb9lmEOofF6RgxmnK4ZbYUa0
 TjF5lJmjW+3hdk67G2oiL3DBWnp1OX3V11ciOBnWkZMTOhZLHbPAtlNZ33cYDb6zJrQxOGBqPgy
 VUmHLfSABhBVe2ryVn0D7VUjc6DOJgIl9nWifkZyuAYkCuv2SKqBunOTfIIcuVF+WdCro=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_003925_157873_0762F18E 
X-CRM114-Status: UNSURE (   8.12  )
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

Add an entry for the Svukte extension to the riscv,isa-extensions
property.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928958704855c8993291b036e3d1a63..df96aea5e53a70b0cb8905332464a42a264e56e6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,13 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svukte
+          description:
+            The standard Svukte supervisor-level extensions for making user-mode
+            accesses to supervisor memory raise page faults in constant time,
+            mitigating attacks that attempt to discover the supervisor
+            software's address-space layout, as PR#1564 of riscv-isa-manual.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
