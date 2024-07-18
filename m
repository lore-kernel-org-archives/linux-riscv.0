Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDC9C3DA61
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 21:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TDcX1DK5rNQT4mPWFQfx8LEUl7iNYEPV32ClpkOkBDw=; b=3HVvgH9vmUv9Li
	Hklqi6mMLXha/BX3IeUeoqRVPVNaQicbGTihlSmt83C8k+BXxFkBNlGSLD/A6Szu29TkfQvNHDFzl
	8g42OaI56XFdOm4WLIvcLCv90wuewg48NNwTC8BHRDUq22rxTEKnJmE91c/jqvNZEKX5UfghymvDn
	XqiRhzuPiXYAUoGqi7FaQaZmMlDkx+ofVgxfUaw4rjUhlM6h7EWNVgL6Q73yNwv1ruv9NvkFfnKtI
	x9DyH6AUU61RX3ZC+TqKBP7c3SYPsPUC03Iat8yQOavON38urNsqRu5v8ruC7f7bx8izsSlihZmZT
	HIO47u2+/vwHss5epxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYhe-00000000jJV-3fqm;
	Thu, 18 Jul 2024 21:30:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYhb-00000000jIg-1hlp
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 21:30:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fc6a017abdso7234575ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 14:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721338214; x=1721943014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OQATAomh3oMordhqCE1xgMTp4P8G2Bzv2s8BgrxXwdg=;
        b=Io68BEIQI3C8amjvsjqk+uKOrpwl9cPTRfqc3R0T5lZ7jUJ+XoJ0Em4U53qnRcECcB
         u+mini94TIay0XkWs5gi+PwkIAeyMrrNmjZVX9YleOpwynV9nLWFNbs6DnTHUxOcziOd
         L4U1XJlu7aWTQ/4k2PZz4L6t8bFH3R3ejwfcC0TtTVORkdKDQcRmzfb7PtFBAso8tCWL
         EHU+AMn9xMDvttaWLCT3I1wnptjiOUyg6iE7LlfyjIu4DcjtFMW+ZC/h9P895jjNOM7Z
         PcwfTecy714Id9u9xsdv2xTGkJwFcjoSLSayVyW0jnwo3iu3kIUXAQqUbgw6Aw4Bgh8b
         J00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721338214; x=1721943014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQATAomh3oMordhqCE1xgMTp4P8G2Bzv2s8BgrxXwdg=;
        b=cs8bBBiAgqL2o2hXPxR5AciF4JesqfLeUjTq62BNJxN2JOgF5JugXGJkCrqT4kDJk/
         sJKPAku8Df9bJBtARCdjMwsnLCSA3t/PWSu3288+DMBUefMoK0lR8UsmT5TolQG7U371
         OrSrT7EMamOzluyoZkA/IuaRbt0AqRS0qiZv1hxfwNmo+jKmatk8+HzCoxosNDAs7tCN
         vztCvFxZAYjdHkcgWjI8CGcn3PLTbWiYqGyX+xSODy2fHceI189O5OA5iMAqJ7FobypX
         1k4NmoVCpME2uFAX908AY0EkvEmYAhBZuidWxkunZ4DCNRZ0JSvlazGIi0eEJRUkkjps
         Q0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVRiddQdy5HadpECXxTw49JoTLMM5lLtGcMp7ZMvUq8wK2SL/alAp6pN5tHjmRLyS4IJSH3xrRbOMiMu3V2moPLAX/qqlDRN06gtvUo+YEg
X-Gm-Message-State: AOJu0YxWW1XyEtsSAwCZOlrz6YvNTCKzpLhgY8XLjaoP+YKE8ffcV5g+
	xrkWBrPDHEZKY3sU8DzRLrawB2iKREuEv8b58POkbVC+zZF+f0DFVisKuKG+GTU=
X-Google-Smtp-Source: AGHT+IHD6wgOvrlgEKckIcPuHnHz5I62mcvWorh7TX0JSsIO8SzWHfMN3uJvQG/y2O99WXw9rRA3KA==
X-Received: by 2002:a17:903:32c1:b0:1fc:3600:5ce7 with SMTP id d9443c01a7336-1fc4e134b59mr58715475ad.17.1721338214259;
        Thu, 18 Jul 2024 14:30:14 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64d1a18dsm231735ad.207.2024.07.18.14.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 14:30:13 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: cpufeature: Do not drop Linux-internal extensions
Date: Thu, 18 Jul 2024 14:29:59 -0700
Message-ID: <20240718213011.2600150-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_143015_503783_CF867612 
X-CRM114-Status: GOOD (  12.30  )
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

The Linux-internal Xlinuxenvcfg ISA extension is omitted from the
riscv_isa_ext array because it has no DT binding and should not appear
in /proc/cpuinfo. The logic added in commit 625034abd52a ("riscv: add
ISA extensions validation callback") assumes all extensions are included
in riscv_isa_ext, and so riscv_resolve_isa() wrongly drops Xlinuxenvcfg
from the final ISA string. Instead, accept such Linux-internal ISA
extensions as if they have no validation callback.

Fixes: 625034abd52a ("riscv: add ISA extensions validation callback")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/cpufeature.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0366dc3baf33..dd25677d60de 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -457,28 +457,26 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
 		bitmap_copy(prev_resolved_isa, resolved_isa, RISCV_ISA_EXT_MAX);
 		for_each_set_bit(bit, source_isa, RISCV_ISA_EXT_MAX) {
 			ext = riscv_get_isa_ext_data(bit);
-			if (!ext)
-				continue;
 
-			if (ext->validate) {
+			if (ext && ext->validate) {
 				ret = ext->validate(ext, resolved_isa);
 				if (ret == -EPROBE_DEFER) {
 					loop = true;
 					continue;
 				} else if (ret) {
 					/* Disable the extension entirely */
-					clear_bit(ext->id, source_isa);
+					clear_bit(bit, source_isa);
 					continue;
 				}
 			}
 
-			set_bit(ext->id, resolved_isa);
+			set_bit(bit, resolved_isa);
 			/* No need to keep it in source isa now that it is enabled */
-			clear_bit(ext->id, source_isa);
+			clear_bit(bit, source_isa);
 
 			/* Single letter extensions get set in hwcap */
-			if (ext->id < RISCV_ISA_EXT_BASE)
-				*this_hwcap |= isa2hwcap[ext->id];
+			if (bit < RISCV_ISA_EXT_BASE)
+				*this_hwcap |= isa2hwcap[bit];
 		}
 	} while (loop && memcmp(prev_resolved_isa, resolved_isa, sizeof(prev_resolved_isa)));
 }
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
