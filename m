Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24A4CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 20:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ND7zk9eJBBgpIFFaFY4gFHeffX2nBZENF9hI305J7E=; b=fZ6G/TPvsflun5
	Kj44A/oymZ9aF0zKcjECfhh5/BgKPQofiOq5M9yFoTb7CBr1QLN5Z1oi5MDexKV1UE4mPgG9rvBO6
	lFZfrYodtR4fbB+5s6pc7R97SbynkQsYBF3OPCqRgJRhKaJgojEz+o4E1tqfnJ5oOX2G6f1zHyaFY
	C6Oequq2gP92VuzU+qrMxKa4eMJNHN1Fpga/IzjHWucTqyYQzrk38UyoB+XAc74IRLxisCFmeduhF
	LbEUjKAG7Q1CjWd4SjXHErE5mt7t2WBH/QdHMH23nH507cZ1JFG+a28AgyXt3xZLhKezCGP2UwzYk
	ilh68ggAf+ZvPtEgwD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFTg-00000005ZoM-25Cb;
	Mon, 15 Sep 2025 20:07:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFTd-00000005Znq-46rZ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 20:07:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45f2f7ae386so8996255e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757966824; x=1758571624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iMaZelnv0gjVtGPE0leSvjV6B/t1yvdFRKvRCI36mmU=;
        b=DRzZbwbOEFzzNtJMXwDl0dXiFwFvw0rzng4pTUHM9oWb1bdRpiK/t4AHNjuDhfXkKS
         EjbLfRelnsZHE7/hTST3FwJGKkHKi0EV2XnBVN9glKNCy1hJDjR0VLpf53Vn/5keFbJz
         5IJeEJIwJUIbPZHyu347PBDh7i9jNBd8ZBE4PZGRfB48+/VbxrInFOtm7E3oRXwMTsTa
         ZNEeAk+Bxd5/U3jT/GDr2JNnxqEoDfT284TFsBdBTbFHvLj0S/c7uHkdtRfQa1tI3zrv
         Z2ALHVeSqREcDLgYsudUYxhBI79VVvjddske8Efj7+0puCH5WFENg6dkl+rjKmgr/xLU
         VdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966824; x=1758571624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMaZelnv0gjVtGPE0leSvjV6B/t1yvdFRKvRCI36mmU=;
        b=Dsg0Ml0D5FQT7j9JCN2BXfuNieZJ1p7bI0veBO0OfirLXQ9uHSc72yLURbf+0pjXEM
         JgzjryrCnLCtPNo023N/1yPdCU4N7LPJ91xdRDbukymftAFgZW+m0lRj0qKdSRouxq4R
         3/lfSSZbSg5diUCD6VPwVp/H3ANpeaFgG5heuV2BgulQ9om6zz7ez6KoetQcqcZjejKy
         BpFU1NALxRVKxGiFkOCQ8RrgZM2EsLVJheAAlPptn0wyIfFOvyl+XSYp7NPZv3/AOwx5
         O87qGrrIrIY36aQ6UP37hoHv9pP9SoYriJVqQk7HJ2N2giFp++WalkgY4nJpY1dHhUSw
         2UsQ==
X-Gm-Message-State: AOJu0YzlyPDj28iSwMQqc1TatgD8o+9SOVLLQERNxqG+W6AjHBvXanRz
	KBFOpJKEgeSfw43fa9HTv2MjroZlUVOsGrEPAdWSTEvo6OkZw/HgT8yl2GsqgjAV
X-Gm-Gg: ASbGncvGUg51yqIxJIzn9pT53liBwxDRVrOPAw69zt3z2+v6Pmlv1yrhm2YxCn2mQaw
	jccyeDYKqSX1XY/99dW3jCksZdExx3M5yqxdzRFic4OL1It0qHK2kuWolC5PMsK06yblEvH3em1
	7w1AK6RN94mNyo1C4bfZAAnaFlb5K6Fl0ljse1GSh5BB7wRZwfNs/OqSETMtcaosvbKLeRpeTld
	rXfNOcIyj7uu1ck59Rg2zolp0uzO6IXX+2iLHNCbK3WFxOy7pLIEWPXd59z+/NTV7hh3lsq6GBJ
	qAsTzhEjxKje2AXxjd5x8Y6+XoE2aXZvNKwM2rsHaFeB/3EB7RcI1xqjJXxf5VSjdk74ZtuZKn9
	ZmW7iWFJvrNxSMUSTTM/ShRixm7psdNW+EjIF9F+dGAY=
X-Google-Smtp-Source: AGHT+IE6RC6QQj4xdst05r+LwYKAnJLbln/3bNeokossDxipclPSYD8h8fJvmCXid878uJsfA1X5Mw==
X-Received: by 2002:a05:600c:2251:b0:45d:f7e4:88b4 with SMTP id 5b1f17b1804b1-45f211fee13mr110158435e9.30.1757966823772;
        Mon, 15 Sep 2025 13:07:03 -0700 (PDT)
Received: from localhost.localdomain ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32114c62sm2840745e9.2.2025.09.15.13.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 13:07:03 -0700 (PDT)
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	wangyuli@uniontech.com,
	chenhuacai@kernel.org,
	mikisabate@gmail.com
Subject: [PATCH] riscv: kgdb: Prefer strscpy instead of strcpy
Date: Mon, 15 Sep 2025 22:06:44 +0200
Message-ID: <20250915200644.200498-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_130706_020840_A282279C 
X-CRM114-Status: GOOD (  10.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QXMgcG9pbnRlZCBvdXQgaW4gWzFdLCBzdHJjcHkoKSBpcyBkZXByZWNhdGVkIGluIGZhdm9yIG9m
IHN0cnNjcHkoKS4KClsxXSBLU1BQIzg4CgpTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgU2FiYXTDqSBT
b2zDoCA8bWlraXNhYmF0ZUBnbWFpbC5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwva2dkYi5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2tnZGIuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2tnZGIuYwppbmRleCA5ZjNkYjM1MDNkYWIuLjk0NWY4MmE3Mjk1NCAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwva2dkYi5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2tnZGIuYwpA
QCAtMjY1LDEwICsyNjUsMTAgQEAgdm9pZCBrZ2RiX2FyY2hfaGFuZGxlX3F4ZmVyX3BrdChjaGFy
ICpyZW1jb21faW5fYnVmZmVyLAogewogCWlmICghc3RybmNtcChyZW1jb21faW5fYnVmZmVyLCBn
ZGJfeGZlcl9yZWFkX3RhcmdldCwKIAkJICAgICBzaXplb2YoZ2RiX3hmZXJfcmVhZF90YXJnZXQp
KSkKLQkJc3RyY3B5KHJlbWNvbV9vdXRfYnVmZmVyLCByaXNjdl9nZGJfc3R1Yl90YXJnZXRfZGVz
Yyk7CisJCXN0cnNjcHkocmVtY29tX291dF9idWZmZXIsIHJpc2N2X2dkYl9zdHViX3RhcmdldF9k
ZXNjKTsKIAllbHNlIGlmICghc3RybmNtcChyZW1jb21faW5fYnVmZmVyLCBnZGJfeGZlcl9yZWFk
X2NwdXhtbCwKIAkJCSAgc2l6ZW9mKGdkYl94ZmVyX3JlYWRfY3B1eG1sKSkpCi0JCXN0cmNweShy
ZW1jb21fb3V0X2J1ZmZlciwgcmlzY3ZfZ2RiX3N0dWJfY3B1eG1sKTsKKwkJc3Ryc2NweShyZW1j
b21fb3V0X2J1ZmZlciwgcmlzY3ZfZ2RiX3N0dWJfY3B1eG1sKTsKIH0KIAogc3RhdGljIGlubGlu
ZSB2b2lkIGtnZGJfYXJjaF91cGRhdGVfYWRkcihzdHJ1Y3QgcHRfcmVncyAqcmVncywKLS0gCjIu
NTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
