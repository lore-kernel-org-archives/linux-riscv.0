Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E63CCAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iP6+alyKHJvOaf5qKLyyAZano6FXeFHAVxME4CRlCrk=; b=a/rnbMbjuNrtNz
	5aKGvniN7xGvQSIPC3OqWcwEgTABLFyXL4H3PIFTI6nbnVJTC+/ZbcBn45sgaoAUgyfF0b1rjPChf
	8rwq3btoJ+6FS6Pk+xUqRRCH+ql3hRdt6crBsPloomK1wy5l0t7OxBE366Tt/U8xd1xFZO8patGRm
	yART3d6tUzv3h2T5biNVj2NBH1Njh5n3fjc1yLYglcZNvzBzIJIpMacwc/iY9z//OCDIMYf41+U0m
	DTOShlqnr4i1sBumPtPuxE5JEWu8/abG0VjTackksxoSpLF0vj4SLHGsef5p+/FkQyEHzHwMLx1ic
	eMnOeyhxyGseouNHN3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzV7Y-00000001zhY-3Ctr;
	Fri, 19 Sep 2025 07:01:28 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzV7W-00000001zg5-0VbU
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:01:27 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7762021c574so1768591b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758265281; x=1758870081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tB6QRb7jrsTmVzw62zDkWBc74Sx3MC31EtdUpSMEsXg=;
        b=EwjKgbmeHhf4mbcmCpLpPD8eDrEPkTtPGGLmZYQVAVOq1g4zbWWbpqtwG5aV0z7IGb
         VCRIYbAdz7bWtc0aKlQPLFpSkRZMIYTV0mf8o6G8TwROv5ORVY8YEF209fL7aGTYdjX5
         iRmvZCI0b/WS6ZWwYk0ktI++vrYSsF+vGqiNbFDeCrC77xGvJdP+BRH3iurRolx1KFJ9
         UA291V7d3E40J5XZq4VzkzludSh+CES6I3HIl5xFw6Bhk5ak90eka/bgY0hFMwMStj/e
         ltcrPkFFfPJgDq0LzkHilXvYIiXZ6vt/D2KLI8jDlDZ+mjwEU7aT2etkUVa3jgxhvt+4
         PRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758265281; x=1758870081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tB6QRb7jrsTmVzw62zDkWBc74Sx3MC31EtdUpSMEsXg=;
        b=Hob3x0Z9FRR5T5siSvcf6m8w5NFnWzZGtAwmiL6DwB0tpmdrwMH7JvYLBZ6C7CC/2M
         j4rFPS40XViUQZAr01MuxeJZVmLWt+Fe+hhYebF3DeoxiTHqErwG9zWrs7TNy5lkaLYx
         g4bWwETkDaX0rAg14y4fBX0VF9PYjs+UtxDKdlW6pVKymhATZ2j/zDKeVIEG/npv3i52
         4ZLMhlRRxudQSpWtSE/l7vc4uKg+la34yIUcwPx/P/CjeOeqkWp0fKdpPUkv865q7WNr
         LNX6aRV8i5VQRvKOlOKcGKhgdZbkH9eyGJOvrXq1rRZfRs25kQYhDRrV9/39z1fvIEBm
         mZow==
X-Forwarded-Encrypted: i=1; AJvYcCWwVtq4M26p8ns9pnwfynYExGQA/AY3El+sfPWQT7NzZW5B0qnybXwC87KiuNHcRhFMkjIK31PTobLRbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye3YJCKjJ+8gnIyjY+xLd/zRrCQjXuwh6k6YpLqLK7i5115LuT
	Q0qcpQRtTKhmgudM3Rmu3OZQtE+J4QfDbc4tgEfg0pz0P/zWVROWWXRMPbMJyewqVl4=
X-Gm-Gg: ASbGnctDmoEp8kopbwwC7IBW4eIntLjSlSaqNcyb6NZaDYisniQBDghYbmZUbKVHKf+
	+M7mJheI9jrNFBrX9upHgW2rmyafkXsHvd0mlXja5MpbXimBMvujs+LV0roasN3dhy/J+bzN/Tw
	eiIuL8cLEgJAaAxeslO+LOyxmu6OF6cG5svRVpSduui5rBww3mwvv5bLOqXshuH6tlUlFzOuSHp
	W52gi1YRAv0oBGHPQyDrsZUy1znbYb5oieIM/ORMCGe2M2EQxIoehaC7roJYgtDZ9VfJxlp7jHJ
	21U9yWCMMN9uJNIG/CH/bzRL7Hsra6FQnaRnBDKwl7lwUYFB8K54fjeO1CC8qkqSPo1aazCmyTB
	3M43AxikjiwtRyVPyM2myOCqqhcbwoo4bJeRkhdzNYPyu86LlMwE74LjkA9wV6lY=
X-Google-Smtp-Source: AGHT+IHr4UxZDEHkDiNV7EOaRF3VONxVH0Cmxy2oMVJnQ6nic0Vry9y1+483kpnmptspoi7qgVuy9w==
X-Received: by 2002:aa7:8894:0:b0:774:52bd:698d with SMTP id d2e1a72fcca58-77e4d709ac2mr2418765b3a.11.1758265280943;
        Fri, 19 Sep 2025 00:01:20 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dc606e10fsm2938738b3a.65.2025.09.19.00.01.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:01:20 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	atishp@rivosinc.com,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	apatel@ventanamicro.com,
	cuiyunhui@bytedance.com,
	mchitale@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/1] Support unknown NMI based on SSE
Date: Fri, 19 Sep 2025 15:00:47 +0800
Message-Id: <20250919070048.94646-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_000126_435700_8E3AB732 
X-CRM114-Status: UNSURE (   8.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBpcyBiYXNlZCBvbiB0aGUgU1NFIGZlYXR1cmVzIGJ5IENsw6ltZW50IEzDqWdl
cjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwOTA4MTgxNzE3LjE5OTc0NjEtMS1j
bGVnZXJAcml2b3NpbmMuY29tLwoKSXQgbWFpbmx5IGFkZHMgc3VwcG9ydCBmb3IgdW5rbm93biBO
TUkgZnVuY3Rpb25hbGl0eS4gU2luY2UgZXh0ZW5zaW9uCmRldmVsb3BtZW50IGhhcyBub3QgeWV0
IGJlZW4gaW1wbGVtZW50ZWQgaW4gU0JJLCBhbiBSRkMgdmVyc2lvbiBpcwpzdWJtaXR0ZWQgZmly
c3QuCgpZdW5odWkgQ3VpICgxKToKICBkcml2ZXJzOiBmaXJtd2FyZTogcmlzY3Y6IGFkZCB1bmtu
b3duIE5NSSBzdXBwb3J0CgogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCAgICAgfCAgMSAr
CiBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcgICB8IDEwICsrKysrCiBkcml2ZXJzL2Zp
cm13YXJlL3Jpc2N2L01ha2VmaWxlICB8ICAxICsKIGRyaXZlcnMvZmlybXdhcmUvcmlzY3Yvc3Nl
X25taS5jIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hh
bmdlZCwgODkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdh
cmUvcmlzY3Yvc3NlX25taS5jCgotLSAKMi4zOS41CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
