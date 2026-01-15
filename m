Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E5FD3CCB3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWcybXGEGW6jXz7fuAnvnb28t2qcX7AKXqbIiZ8hSVo=; b=ZyDwRuo+GM2HbI
	gsJHBDsXYv/H3I17OONJnm4yqOPvfIrTEIiIwAMMDiA72NiPf6ynmZkoZwST+dRQBWZ5s49w5OLGJ
	M5s/g49ia9zQH7ajD+Iz7mn5rA9p8ERrcjmfZIZ0AaBCmlyqfq8ZBgLJ65wHbk7lS0OAQNY2hnVCJ
	2g6V8C5qDKeAMfJgkq8MtugrjY2gDOmpdO1xwNJhYqdjuZqJGc2sXnNny/23JJ0VxqFhPd5k1+rvh
	2qIXbcmKa2ZSToErcQumsl4eLodf6q2lFJ14b4zPR5b62mxFcHlq0Ce9nZa7UN771nZ3qvr+SntJf
	Kwjquhr5HToBpERnRHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDp-0000000Bt7w-3WlT;
	Thu, 15 Jan 2026 06:52:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDn-0000000Bt7A-2XQK
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:52:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0833b5aeeso5924785ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 22:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459963; x=1769064763; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBO7qrwPmz8yCkOE9w4XOKMChGOOJNh4q0wHZ0CHZEQ=;
        b=GVVef01o3yRmNHDi/Xn5cNitYACzpyYfnBv0zzFsrAWGwuMqZXanGyd/miAVEC14l2
         WAOBlvgjJKxuP45BQLUnOHDJMdmYc6cJRUnQfBxPqyI1sF4dJuivCqGiJj7zFLNrZlPs
         v/dndUTG1rrrLO4KS53U0tCfzZ4UTBCXNOdEk2okJCn41O1vbZiMMOttNJC1F1XZsttN
         0sp19NCgDjkQzMWX+YBOqQSvlvKT9ykQn3hUXfiYxkFPIprKLZUK85qyG1rPYssktdYX
         oc8Dsj/rAtAad9z38gGN/5Z7X31CMOczLp06iqnckYvICVWTw1DYI+RqHhZ3KiAemRIp
         5b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459963; x=1769064763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nBO7qrwPmz8yCkOE9w4XOKMChGOOJNh4q0wHZ0CHZEQ=;
        b=eds6Aoh/887IcVyDtNFwhhXIV3BE8oeWLZz7Z3KqNxwd8EEqlwPcZ6Wg0ySxMdrFtX
         6K+buCgnQ+QBktbpKEOcZJXKgb/n54LapymN4/rqfzxxzIO99D1jW+4tX4VWjhv9GNSl
         SmKG3QX0crRYRH2zia9b8Z0mheUCfYfcMbAn79A5BvCansZxRWJ8FykLD+14Hp9BLCQ3
         3CnritKbKsw+1xlaIEoagv2Z39z4NnkFCsmpVa4Tm1QU+HClWZpuPVXhufyjhFhSinCa
         iZ4r8jjUwPPh1I72iXRsEAeOmb+MWio7i0ckOb1LbOOGvuIcy16MozAmkKIeXk5wKQvB
         xbtg==
X-Forwarded-Encrypted: i=1; AJvYcCUUydZapwAt9jj76PmSw2djKduEVkuubds9tI1XrESmtaCLlpfKT2DLvSEBpLbr5vq0JKFL2DwfmKrwxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6kuoS+1z2wyx+sST3zkT3LMQupCKEzMSYOOYTWvhzodupVTK+
	i4ljlMcetAz646kGJXIgcNa4U84XYKtI8tUoAVVT1+InN1ia4GvDYX0ZjVlA3dxSMBU=
X-Gm-Gg: AY/fxX4kicfmjlGSQ6L3ynCFKqNajlzkcW2nFT/CcdIGLIcAgv4s7DkX4yNP/XfVGYk
	+ynbTdiPVT3FPj8091uAF6Yft1O+qvB6DMgqdhMOtqHD1ibJG0oi0QqckJ2VWKL/grWl1oMjxZt
	VuP39i/cK3VavrWdoWA1l1DG82o9a6komwiYP/i3V0qNiFjQOIrZGdDutkBoJ9FWBjSeMzIm/TA
	kksnvzw0trJPSZWzbxQ6AqeSv4cHUBc58Qfyo1xVZBRRN5UxTmfwZQjAg045Wx7YnG3uRWo3OIN
	SK9Yfw5d0zMl7+pY9UEat9c+Ub4nl18HFcxrmILQz2/kzgKEwi0gDd4wWrztx/SF53KJQ+J2HTl
	UsPumx3DsSeM3iqhPE+vHu9Q469aP2Ok4UW+danM0jrGcYrFotc9obokXduq1dwlw374o3V8KLJ
	GKpxnRho2Xz6snNMQhPuNQ2h4F55d4O12XI0LwjjVhwTc9vRvudfFDcn33ieTCrZSX
X-Received: by 2002:a17:902:cf04:b0:2a0:dd66:d813 with SMTP id d9443c01a7336-2a599e5f8bamr55517385ad.55.1768459963033;
        Wed, 14 Jan 2026 22:52:43 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:42 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:43 +0800
Subject: [PATCH v5 4/7] dt-bindings: interrupt-controller: add SpacemiT K3
 IMSIC
MIME-Version: 1.0
Message-Id: <20260115-k3-basic-dt-v5-4-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_225243_671907_222035FA 
X-CRM114-Status: UNSURE (   8.03  )
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

Add compatible string for SpacemiT K3 IMSIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: No change.
v3: Add Acked-by from Krzysztof.
v2: Fix the order to keep things alphabetically.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb9..feec122bddde 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -48,6 +48,7 @@ properties:
     items:
       - enum:
           - qemu,imsics
+          - spacemit,k3-imsics
       - const: riscv,imsics
 
   reg:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
