Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39182D185EB
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5bsAcL4xv4wGCy9ZcPbOi/7aks4Ti088kXF8o3KNT8=; b=C00/MdTGrRUiKO
	w2xMa5XnxaviPhGCyMGP+esQWKwmZYT9vuN9ctaQ80lRW2pxPNfFM3B62NJ8VR1FUmVlZTqCbt0CR
	RD7f6izvBt5CjJYBFgyWFUiOQEc4Qz3gT8U3dXUuHdUm8XBfvgn+jL90v1o7vSYHD1TvqCycAcHOB
	aceDnhXKWVQmZMgWwu05zJQ6H8qyPvEUn+BfBCS6OcjK1cRnKLxYRbkhqMhB8LdVl9rcd6g8lKa0B
	NUyr187dW4j35y3xA+Jcefb18Y82FnkPk2dbwFA8lEF1pAmghXbFE5TryHKwkp7qvpdVJnOfUzENN
	mENDl93+OTo94EMpspcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp5r-0000000GzTl-0zCj;
	Thu, 08 Jan 2026 12:26:23 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp5o-0000000GzSl-3QbT
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:26:22 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-803474aaa8bso1048768b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875180; x=1768479980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svNJwjtcBjZE5yQaD7VkQ4pduXIBNtce76dJ2fZTxXE=;
        b=dWNlXZ10HJfw8XrcXDrx+8DAi0KQhKW3htChOkIlQjeQnFaIg5OiPkk3LfrCb35Oga
         N3VYDS0f9n4LuJhAeFDaB00h7HpDzfdNTofcm4KuGH/8nAXBvznZO7fJtBw1vpxuoD+G
         E1aU4XUMqxcToMTo76OSduBFpbjuBpxYfGCWqXelQKV6mWjTqAXhhu/xQuUzNq82+bbh
         PX3f6pCvxEVjPUsIv36PEZ8Vy/lmUyeZ4Q0Vm/nh/IHGhVRO6FeBLaaKygR/ApnATK1Q
         2ijdf7VWCxKDMzdYrmAQ9AELQo/qIzs/aNRSE3QVDNFVLTvNLllW9hL2OZLJyTGYy0sE
         6adQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875180; x=1768479980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=svNJwjtcBjZE5yQaD7VkQ4pduXIBNtce76dJ2fZTxXE=;
        b=DLdsgOeDbhAfHAJ8mRjUTW6z3exqvulaQIc+rFygElfyWdRLN/pZLIDYUJSIfXFKhQ
         ekQjEcdhwavAHyX4LVIyxq1qRqlFE3GSqmSRVD6zvRKp0jcCEfWXSUYQFcAFX5O000Lr
         v0d01En4Vj8UzzMl/naMmmgF9vgaMpjB6cvL/6A+TTnzq2eRWHXT+oKI1hI5lBs8Rwb8
         jWNGJcmQ342v68Vd30NNtqA1JawYdvTxHcM9o78+afhJtmtDUaJXhaGHEV55Q+VjZWV/
         l4BCTvvxKRYoYN9f/8aBDyBJR067Fq/jF+Okz6FoRYlhnQr+ea5v6vw4RllLp61UDhZ9
         pXGw==
X-Forwarded-Encrypted: i=1; AJvYcCVlaQ/WpdWQsDDeC6NtL0xw90Ldchct5PdJDYdSVBlIgdD28bux6LuMCQSPbLtXNR3ApB42Jo9kOeGwdg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/PBg/9iwPBS0ZhoNLSp/h15b5SLf3eInnNoLV37XaL6kMDhAq
	ckj4I3gOdc9jmfGzTj7W3q9BQq+nHlnwNAU7dtk/HPmmTsqvMlbmUHhUPWiwcnvlDyM=
X-Gm-Gg: AY/fxX6Z7zFSb+YtBHkA+unQ27EBNAYKuhvVH8zKS2xd63ne2kqfJofixKhj7H7ldtX
	xik+JRCmnH3gAYf60k1OPVZCYJayPNkXUVXenFuKYzALkdR5vOQV3JcelebEdIOYuCR91oyHrIi
	nZoVFS39jtwogdFU+gPFbul/DoIN16amxsU99g+x4LmbXTDC007iQKvRh4+M7iBRDNm3Sji6sSi
	TQEcNVmSxfXL//kc/QYQnO8UT6zeKiwBi7AXxOcgK4Bis+ml6ewTmFZaWJFnex+5ddaBPsxGUfr
	r3g0Zm0oCYzHqEXMNt1eoHLEJKqw5qHi+u9jJ6lWX/0zeTH+7uJALmRELHaA+4uQjMVnUyUfvaD
	BsgsegNMCn5TAWugZecSEOLeIcXkgi3B0IW4S/imtsdYGyH3L3KYxuzZLA2RiSHxix9V2Arqcik
	jTC3lA7vt1nQe+mlTlp+OgLmVrkimcNXc=
X-Google-Smtp-Source: AGHT+IH6LhWNpywmlluc7y2KgKs63mU5gzOfaFnUWoQt+hUetISX226tIHExkzPECXmhOq6IXMNhgg==
X-Received: by 2002:a05:6a00:8a8c:b0:7ab:242b:95c6 with SMTP id d2e1a72fcca58-819436047e6mr5869824b3a.6.1767875179859;
        Thu, 08 Jan 2026 04:26:19 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:19 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:52 +0800
Subject: [PATCH v3 01/11] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-1-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042620_870307_C53FBF57 
X-CRM114-Status: UNSURE (   8.52  )
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

Add compatible string for the SpacemiT X100 core. [1]

The X100 is a 64-bit RVA23-compliant RISC-V core from SpacemiT. X100
supports the RISC-V vector and hypervisor extensions and all mandatory
extersions as required by the RVA23U64 and RVA23S64 profiles, per the
definition in 'RVA23 Profile, Version 1.0'. [2]

From a microarchieture viewpoint, the X100 features a 4-issue
out-of-order pipeline.

X100 is used in SpacemiT K3 SoC.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Added Acked-by from Krzysztof.
v2: Fixed alphanumeric sorting of compatible strings, put x100 before x60,
     as per Krzysztof's feedback.
    Added reviewed-by from Yixun and Heinrich.
    Updated the commit message to provide more information about X100.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d733c0bd534fb63ed7c0eada97c42832431f1fc1..5feeb2203050ae1f1404100ab7ba93e224f72d97 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -61,6 +61,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x100
               - spacemit,x60
               - thead,c906
               - thead,c908

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
