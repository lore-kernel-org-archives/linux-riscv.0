Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA38D74962
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXulyND2F1DJRW/iiAACRaQwtyL4nyARZBHELV3ncqA=; b=WFaOcN0dZ5l8BB
	PWMiMxGKxUC/8PAQh3iZ3nlSTuqXA3kBfU48YiHdtL8R+G59yVRy5vQNmUnwlDEJOqdjsPiSvwPBJ
	0GM3OCppbFqT/h9VsOoMEETSBFLK0fhT3hiXMCyd+dDMgcPtYpKxHv8+K3Xy/neDdFe7SlU0FyRea
	QEHMlz5wvfWasbPMOwC9Ji4tSABXx5vmSpDLcwfo4mFT8fOXrwcJ3jBzrwyRA99+EBHwjFCiQFbQP
	cKKSSyCvxIfz9D/tzbIujC0nFdmiaJafwPO/8JXiYwE5Erxiyi1o/zAM+vu90YeMpdebNxxkwTeRF
	NQeuyvHBeJ2PtmrCFAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV8M-00000009llr-2qWA;
	Fri, 19 Dec 2025 07:42:42 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV8K-00000009llS-0wT1
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 07:42:41 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so1333977b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 23:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130159; x=1766734959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A16mIOMQmuaHn2+TKOnGQUAwRDMDtpdj4WXcnB4hmwo=;
        b=i5m2rUOJ6cswEjdkpWhlAMC15iOU8mWDBMtR0awjZ+Udl0dyvqNw94WnT40Sj4CL9Y
         pxCHhaQNhSD2mZ9/pze/PAG2+GoKFLcbkPYwvtyvv6JxkDQQFl5PlcXO5f+pz7tjCPuq
         wSbmI7Yj4Y+yzPOgb9V/FPDz1GXdqnCuK18+f4ljUCNNHYI3GSGaOvbF9UvXYPfVLnpI
         NY1Sww8o+Puo3gJHYw7zgry6BFpXmD55+Xkh85Hxj4AtpI9WwkiS2mttg8cHmk9IMdK7
         yhzT0FD0s6ZVINmaV3L1Y2qY8VYzJkGZhK7s16v5Izts6FBcR+09mfilTksUSgzeecGc
         p2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130159; x=1766734959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A16mIOMQmuaHn2+TKOnGQUAwRDMDtpdj4WXcnB4hmwo=;
        b=YI33VPHHEX/Cm4v+DY0GOIugcfmWixltlMW6+pMciEqrBg6Oi+NykD1QdzO0jVRnlg
         1PbdVCaDgWf679C7FiWhiuHekTAJojmvBykdUZvgkViugwol0FuixDkj5t3MC/kqX8sJ
         QlSD0K0Akjew0TCeSMCKdpJWVFsVpEhgddse+HoVV2nICNBtTuIMTAsfQSflErURNdyu
         S+k55DwbcrfXiBTJFEb6l3TRUpxGAjTkFTTnYcjGGhWLQVE1ODzRHu+vG49jHX1K+tfW
         yRN/qtGNnls7nEtI/Qqvyvue6J+C8bgyBWASTHbQtBXeIXzwaFBvvoC7+pZz90tmd8Qd
         xyFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4VWztqBNaZVAxF4NAqEk2I2EdUJBZmUnSHxUCNIoHgW1n3AG8WSasoH2Vrygxxam9PW1F7Nzf15/qQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10sdTsicO67/9FQMm5bgF1kLNmF5itBDXUz3TUaP/iX53Z58U
	MOCaw+nxzrhVZBi3i3LRMx5G+wnc8elPAZpAtBpcd9zaSfwpl+O4WzHD
X-Gm-Gg: AY/fxX5+CvLoh4CPwG0mrN4zzjmsBJTGHdDumJpmEchboEV08qmtXGntZnMqaBs+OPN
	JMg4fzkINpR4nFEHtC6FtMbeZeR+6qkbsVvenBFUDavikrx6QPIAvM6zSMZiXgvioDIy5El9I6b
	75mNeA/qCBFIcLqf+97zR/B39IfneqikSwcbJ39HU5n/wlugOXAT1BZmtZGw673UHz5TBWxhBIO
	FRdlFkY8ARXmGL0vqw2hq2xRiIpVqe0Sv/8d4ywie7NwQTVpQl1Hp8PN6eykZ6/Dcfhx2jbILof
	KXvImq04tZ32oQYTntFz+0V+1gQyon+J06SjPPAYUFFgXCLsqHCMxIi3jjuAOeb1Ft6e1u2dQ6T
	U99oZlvPQYF0lOo4lczTzwS61bdAOGTOUjhYWFiQrg0abiG8qaZ8D
X-Google-Smtp-Source: AGHT+IHMDEZLLOxw+3dAFpieF2QA1Yfe4kaK1QG7vQqgmnkvKYHURHQzbX3y21w9Lj3QQl7AzO8tFw==
X-Received: by 2002:a05:6a20:914c:b0:366:14b2:30b with SMTP id adf61e73a8af0-376a9cddf9fmr2091296637.62.1766130159109;
        Thu, 18 Dec 2025 23:42:39 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd602desm1335791a12.21.2025.12.18.23.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:38 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Fri, 19 Dec 2025 15:42:20 +0800
Subject: [PATCH v2 1/3] dt-bindings: i2c: spacemit: add optional resets
MIME-Version: 1.0
Message-Id: <20251219-i2c-reset-v2-1-ad201a602e74@gmail.com>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
In-Reply-To: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=857;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=/r6f9IRpVGju3Ryu7UDsRNF+0ADreBgeJr9SFE2YWMw=;
 b=wvV25q8btJ4G30xXAzQfVKnpzsZrDgyjSlGnmi9bOhuNQ9Aeuh6j0rLJZZ2UdmpI8Wk3BNmIX
 Bd8J5IqmhlsD4ZMfSltfVzsoWEpZ9saVGE6AaJqKlfN0k6035M6lSH8
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_234240_277028_EA991AF9 
X-CRM114-Status: UNSURE (   7.99  )
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

The I2C controller requires a reset to ensure it starts from a clean state.

Add the 'resets' property to support this hardware requirement.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..1290106e28e6 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -32,6 +32,9 @@ properties:
       - const: func
       - const: bus
 
+  resets:
+    maxItems: 1
+
   clock-frequency:
     description: |
       K1 support three different modes which running different frequencies

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
