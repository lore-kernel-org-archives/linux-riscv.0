Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE8CCCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qI7IkigyoSNyRQhhE0dfg9fN1VokT/2dz4kuzfODGis=; b=Z1Pc359jOdM1iM
	Ioe+HeymfV9a28FjLHP4zIIbJl5w7Omx5fCfTVTJXNPbZuOmzlMOW9h0jDeWTShSxM68tOHpY6Jv4
	Kc+rCOzP5RXqhH8El0HE51KXODXKGP0Vr2kRTYWNYGP/uCn9lGPO5E1SJCKcDtAeETgnIwUcg95Xu
	FAnLyfeF15wlKx1Ff/TzeMp/HF8f1VFBMFyCRgF1CE64WOuZT9OoLjyRx31V+IsypX6FB+eu+J9Oi
	fzH8nt2rSwLxe+mW8msRbr0deoaAvM39+VfgCjUp2MNFK8em2CePgT78Q+quNgadmzbeSgiofsGE3
	tXaBdZa8+E3jlECjfsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmE5-0000000GHN9-2o01;
	Tue, 28 Oct 2025 16:07:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmE4-0000000GHMm-07Xa
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 16:07:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-290ab379d48so57707865ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761667631; x=1762272431; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uN8oYIJ23vMsGy3r6Oa4DcNCIzaLKJCXZ02PFiN70n0=;
        b=dCcctCgusuoonc5hUtgkG2OU0ioA2JrqvAq452YYzQhxklsETnRBMm4KpEur/rXULq
         FVLOEiwtx+k5CNg6XVnlXSy4RQBzPQCQTdj6TBoS4QluAk8Xo0i7Anf6fEsecrDwLLIP
         SeflKj6+Vjqb0hl38brGPk+xBJQ2dkOMoQ8Y3jpeRFEYNqPaOS6dky9BagTsVY8vFmGq
         2hvouFgfUGe6qgSSX0HBOED+dWJjCkAXj7PgHpmmgeGCaWIaTxMuuThjTBd66WvIlHt/
         Q6yy848wKzCWZLUZY3GvMWb5U6o1sikzajPemaqjGsSmUW4skc3ShOejzoeIbJXUlsPi
         TM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761667631; x=1762272431;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN8oYIJ23vMsGy3r6Oa4DcNCIzaLKJCXZ02PFiN70n0=;
        b=M0chtWiqnxgEiaztk2BL/80vQ4uoMJxL0n+eFQ5OQEWJfABG2ajH0tTKxtS7r4wbzY
         QAS9tqylmcEvMcVTQOgnsBo9j/4FEOBAzHoLSdHde8+cZv6svLIDuo7XN6Hml5jH4a5J
         Z95b+sOfh9nk3O3YVqyoBKayT1wQMqB+tc3sdoAuX8E6cR9e8oxEItiipiHytzYrV6Xw
         hZ0uwu4hPZ94sw2N2PCop+9FuqXlxhqoPIOdo/0Jv6wuvrKYXCH7j8TFdqW5/Hzrrid7
         d6HNDohJP56UAL4qF+MrsW5Z3LNWZwyvRYVCEAU4dk+JyDTaru5OR/D3VDnAsoxoYNAS
         TAjg==
X-Forwarded-Encrypted: i=1; AJvYcCUHScNyWHJ/ERLKyyDPZfrjcy+22AcszoN21tz7LobEyWn5MhSKuStFIpy8Nl0sBsKN4SOpNhMfGefL3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYxm5ukSFo6GF4RXM5vUBk7Yz7cqVvitgQ/iwdvVA0RvieuPIZ
	zd4zP8ki0GXqBKTSt3fo93lIRtQizsau7D1JEPduif/PtvlPAmPAb4Fs
X-Gm-Gg: ASbGncuRntfB5mGJ9C1sa4P3SKscSyplWpTV107b/dB7Hjody1GRrCNuzCK31nQFeZ5
	i3owvCIF/pWlY1CYl1KNXXLHhI0ctRB/+5Y0zKKyaVDCMtQWh4nPsIiUYDRo0vQC28+20Kl6gaA
	0FB7zUhTYgZD95t68LVMi38NtkxAzJipgMe/I3bWAIaiqtJybNx5EijZjbOWUO98m4kE3QdGcy5
	molsd07kKPdG6UMQuZVhC/wG7Z2n4EAV0frOKavudz82Gb7+75JPWmQYQ95GnZaa+ZkN4Is0SS/
	EUGADIy7jpuGIcmx1OINGhoRmCopVp6YXCPnJsQFzmqejIAoSE9CSszvEM3rbOiyhpGVPoBgWoe
	LOHFAPePKN9lZENcJkoX3uVVZOAM1T5QOEurb/FDL/DmpQLi/FG1fJWN7lLOuyXtOT3HIzUPU
X-Google-Smtp-Source: AGHT+IGyT3KwH4uNk2S8o5U+iIhprzitxR3BDiviNoBBo/Q2/S/fxc45ypOS/S3o4J1sE0jtlwrDTg==
X-Received: by 2002:a17:902:ea05:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-294cb35e795mr49845185ad.12.1761667630674;
        Tue, 28 Oct 2025 09:07:10 -0700 (PDT)
Received: from localhost ([240e:440:d04:10f0:5748:527d:6b58:a56e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e41700sm121030795ad.95.2025.10.28.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:07:10 -0700 (PDT)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Wed, 29 Oct 2025 00:05:39 +0800
Subject: [PATCH] clk: spacemit: fix comment typo
MIME-Version: 1.0
Message-Id: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
X-B4-Tracking: v=1; b=H4sIANLpAGkC/x2M2wpAUBBFf0XzbOpcKPyKPDAG8+DSOYjk302eV
 qvW3g9EDsIRquSBwKdEWRcVmyZAU7uMjNKrgzMut8YV2GU4yIVEB87K/d5WNL4gWw7sDWWgyy2
 wNv9r3bzvB5vukgFlAAAA
X-Change-ID: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761667622; l=966;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=MWE1wHQwpJUdg+s6GjvQ4xmCBSj0KgbizOmtjag6m8M=;
 b=W/Nr03DugBRDanEde1X5Xv65lFXEPtYoAFcNg3Xwe4XJbUI2CxrjAH2YEeDNx85xNZJnWBfsm
 MjxogSDotZYDEXJJXvdlCNntvVzBXTXCZU3Vub/F3pyPxu1m33u9CXS
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_090712_094651_D14B831C 
X-CRM114-Status: GOOD (  11.08  )
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

ccumix.h was copied from ccudiv.h and the comment after #endif was not
updated.

This patch fixes the incorrect comment to match the filename.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/clk/spacemit/ccu_mix.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 54d40cd39b27..c406508e3504 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
-#endif /* _CCU_DIV_H_ */
+#endif /* _CCU_MIX_H_ */

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
