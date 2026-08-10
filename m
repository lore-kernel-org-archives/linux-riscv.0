Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BF3C5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 03:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KyutAhshDexDxuwKmbaUJEj13I95FBMKv0IgzfavKcU=; b=VtXMvPwcldSOPJ
	IHVVQ2NNlSP430qKERAijtyVqVUpVrawWiifNQrB5AxKHK0JiFolCt8DsbevRMXfcKmT/u2LGewu6
	n1SFxvGIKolwpyNxzpbTVsYyeSvGsNr6WLcqLyeLKxZ+vkuMY7izRbydavAHegE4OeSIKdexa3VgU
	FjoBT8PY2GTlD8p+9wahAvxOmVLw2XffgKFTT/xidnSGFJpbigMjFJPJwkIcBL1f+2MB/hHwmaoZP
	H/4YqGOK5pCrdTUKACw3px77fFBAjNbOcaw9qUZ4sw+6sxEImtEvQLSCu+qzVbEAdol+xg7fZ6xeO
	PnpzOhx3Cj4+AhnhyiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtGTT-0000000Awwt-2coD;
	Mon, 10 Aug 2026 03:14:51 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtGTQ-0000000Awwb-3Mwe
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 03:14:49 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2533140a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Aug 2026 20:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786331687; x=1786936487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2U/NertvaThR7gO4CsqMLm8+RSS4kDRYQ7JnB/WYh4=;
        b=qPWfNqEtO155twy6LZSNbP0yy1qBGntBJXb+EpPZyh4TrOfNDFbuwSo+b53ujXs0PU
         fzOL87NulfyR+eS6QGpFQCtMLdSXejVKsADt2aWaZ/T4hOq7a8ltki9mgDeIC45k3sKq
         6yFk2+4GxMDsEPtxhN4gsKDEyT6WmXFEX2ZyP7Wz6nTT6CZut5HE14TbJJ7a0eabr51S
         gr7lEiF7gxnItdvjMibQLn9axFQvFnlsItIVu/+6aWibFjE7gdiPp0++yzjzYIIt1hl6
         h4i8c0R2yoxf7QRWcOyB8mE3ZlVAi8kWHG/Uf4dWMUACaoho5iar7ppnRguvfukZSYBD
         T9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786331687; x=1786936487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2U/NertvaThR7gO4CsqMLm8+RSS4kDRYQ7JnB/WYh4=;
        b=Gf2f+y9YHY1YRKXwHRUG4A6OvUbAbppqtqeKK3gz2/e+w9vF8HLHfe0BsVnhavMINZ
         CcRj/mpZDMukDluxetQnR0yJ769KAN9gZwMCGywO8cOUlHzITxgnI2243OgqqDH4OucT
         vA0mLKtdsE9LJXF/p45dktZEQ+7Pga3XP9O0bFEUZu40Cm2Ba1l19wJjuuHjYdanetNy
         aiRGxnBza2ovd5IELqVcQjPFRifK/OIZZWj0uZAwot+Mseep+XCOFsKE9+w71+2aVuw7
         Ba9SWyWb92eXRFLY7U/U8ztSB3WLsHLTj7Fcn4jB4HVNtNCR8T8e8AEXKxH9VZUniZ3I
         bj8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrgN4G533qCVISfWRe417qa8iA/Uc8ffltfE4nYTWGdUDoT52uj/eZVi736r+UasVm01oAIRFq/JFBsOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvABrGOnhpBmuKGpoATD4+jKSpEvBtKmgreHso/hwQuLV7oQSa
	gIdV0e6M7djbOmloI/ZAmV5BUYb8tee/ENm175OGpQdTmlovRNm+zUxy
X-Gm-Gg: AR+sD10/NKtCd5JskeUveHDyTqIrPsE2mqN4Z5E2uYjEX4teGPmRcFdvdKUnd3k+vpN
	GqVfbeTtji91qqxJUE8oCYimkA2IScqTKXej4pJLbZBrDN2ohVxUknsPUUuNlJI07r1SuQN594U
	xji+RlsWfJbe6sECPcI+IXH//zXQn8cxv0ejaVM3ODWioPnqBsDStVvkVEVe2e1y4sCNOcIfp3S
	50Ls8DttpdTXJYqRReDzWViXU/5QU/l+ZaZzFpnAI5Xp81kKdQIZJJJk8LE2GZlcssOGWFYNEbu
	5W2hdY8qC8Mkli+MYtDhdVLDyuj+ZCkIHOZkCuqA+++Y+aH5f0AEx6T+kM5GnC4yZIw9hqs/yi0
	+r+9eaZ+wGCcC3neeboCDRniIx1hmdbxymSPIWRU49eUt8u9Ck8XUZ7dwE3Uw1x4YuCV4Hmhtyh
	3tC3qTScFIPEdXz7iV+QtQLcVYwb5bIhsjlxXakyV+EulCO6C7jscMWgx7DMlw
X-Received: by 2002:a05:6a21:9d48:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3cbd38d82e2mr16885494637.7.1786331687533;
        Sun, 09 Aug 2026 20:14:47 -0700 (PDT)
Received: from HP-Note-Host.. ([1.240.172.25])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f37469esm3093843a12.23.2026.08.09.20.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 20:14:47 -0700 (PDT)
From: JaeJoon Jung <rgbi3307@gmail.com>
To: bjorn.topel@gmail.com
Cc: JaeJoon Jung <rgbi3307@gmail.com>,
	rgbi3307@nate.com,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: net: bpf: add bpf_jit_supports_private_stack()
Date: Mon, 10 Aug 2026 12:14:11 +0900
Message-ID: <20260810031418.95364-1-rgbi3307@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_201448_862829_05B7B69C 
X-CRM114-Status: UNSURE (   9.87  )
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

The bpf_jit_supports_private_stack() function is defined with the __weak
attribute in kernel/bpf/core.c as shown below, and returns false.

include/linux/filter.h:1191:bool bpf_jit_supports_private_stack(void);
kernel/bpf/core.c:3381:bool __weak bpf_jit_supports_private_stack(void)

However, if this function is not defined in the corresponding architecture to
return true, an error occurs when loading BPF as follows, and it is not loaded.

$ cd tools/sched_ext
$ make
$ sudo ./build/bin/scx_simple

libbpf: prog 'simple_dispatch': BPF program load failed: -EACCES
libbpf: prog 'simple_dispatch': -- BEGIN PROG LOAD LOG --
Private stack not supported by jit

arm64, powerpc, and x86 are defined as follows and return true.

arch/arm64/net/bpf_jit_comp.c:2318:bool bpf_jit_supports_private_stack(void)
arch/powerpc/net/bpf_jit_comp.c:530:bool bpf_jit_supports_private_stack(void)
arch/x86/net/bpf_jit_comp.c:4111:bool bpf_jit_supports_private_stack(void)

It seems that it should be defined in the same way in RISCV as well.

Signed-off-by: JaeJoon Jung <rgbi3307@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 8fe8969fb8a0..c3e8d91836f1 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -2171,3 +2171,8 @@ bool bpf_jit_supports_timed_may_goto(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_private_stack(void)
+{
+        return true;
+}
--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
