Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3BEEE01E3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1OH78YRmv6PHQ912nktoIZUpLFnLnRLvfPZaCtr5eXQ=; b=RVIy9Lv0xO77bO
	WhOFn8Zm5+9KW1mm1Nh4cDCS7rvyuL0ueQnLzARCxyri5c10LbS5B81iBBWHYs4r28BbtS9wCuBVJ
	okZjny7MwfD5yKS+RedYIqOzinOlFD2Vi+H9kslTq60AN1ZJIEBBRNoQIriE5fEDTvmV4/yDana9w
	NltzmpeUQ8J1Zau+3Q/sh9c1SWDjoKJZlzO/xj4aTwwxQhsxzHqdnpDwenVNXVagLU6FZjVVTDy0Y
	Ll90vUV58uXwEceNk/Nv4uGnG97lC3LT8LcjJQLIn4ItewjeImYSUmtjjBJ4xt4JcZh2tv41OH10Q
	b3917ACmnS0Ryikab0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSv1-006MYk-2P;
	Wed, 13 Sep 2023 16:40:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgStj-006LD2-0e
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:39:29 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so16299595ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694623163; x=1695227963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ef4CImEmSIW+76zVD0vc94sfYA+dioK1AcFoClQNfbk=;
        b=RfmebTNUxwbj8PIoxSka3Bkzve2AvKp2nt0yHbb2aGw/E1wb62joBOf9IuLjL2rcFF
         Z4lEQ/L0Y7meRa1j5ZOPJGwpRD+WLYz/is5LxvO19ECm39W6Abz+br/jzeRtvsxEw1LR
         jtcQ4L4ZRp7uecJ3KlT+s/claTjk01WV4ZDR2S4E4fVX05MhgCftvS2nsQhVW2oLWgpG
         ulNV8wAgRM1ib62eYZyIgtxpvJlT2tezZtzibmWx9erzGuXWMhpKhqZM0noNeJ97iZdo
         rI3zurjo4nL5DFj1CHkFROFwuLRpAuXT9fIEwF9s8EE4khTLabPEW+LRlLscYlovyEDI
         r3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623163; x=1695227963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef4CImEmSIW+76zVD0vc94sfYA+dioK1AcFoClQNfbk=;
        b=DAinZkRCk1Tix9bnkfdDNQRJ+0WI6bzZit1cZZlEFzPCPP+92qhkteSE19hZJZ+1yF
         bsT+4Pol/SCQ+oaJgBcF/8AsCn3xWANhVRYNZxrDtV0qjKPb+ej3OvGzAXOIZrtvrD5R
         PJKxYHxqmD6MGaZCgtXojmAN3E1EzU3LLYFQLxyJfayN94QFv/3BgfMmMho4YWbj6qUE
         Eb1vy4TjuX4se1r1Kr1g1U6T+bsJppJUh4iNYJVh2pM9pOqTBHVe7DWubvvNDYUqJuCU
         8ZV6dpIC0hiNEak3OkD9xAMucdNHURIe7WX4L0vTxdU0owvj67mpg2eaQQ98OPNH4KYP
         Wo0A==
X-Gm-Message-State: AOJu0YwHWasxeZb6MNiSyjyhjDH6ouv/FxnF+UW/1+AYVaQVyu+h1MEg
	swznR2a214REtUXsI2dswX9pGQ==
X-Google-Smtp-Source: AGHT+IFX63s8+lbuOPL6hrmi/VfFXIoj5dxeyqlDEq+RWNNHGS384jWicL6gUwaa36DGhTDlbZSMIw==
X-Received: by 2002:a17:903:2285:b0:1bb:2ccc:c321 with SMTP id b5-20020a170903228500b001bb2cccc321mr3826965plh.48.1694623162924;
        Wed, 13 Sep 2023 09:39:22 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b001b243a20f26sm10577756plb.273.2023.09.13.09.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:39:22 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 0/7] Risc-V Kvm Smstateen
Date: Wed, 13 Sep 2023 22:08:58 +0530
Message-Id: <20230913163905.480819-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093927_290030_2DC74838 
X-CRM114-Status: GOOD (  12.12  )
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

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IHRvIGRldGVjdCB0aGUgU21zdGF0ZWVuIGV4dGVuc2lv
biBmb3IgYm90aCwgdGhlCmhvc3QgYW5kIHRoZSBndWVzdCB2Y3B1LiBJdCBhbHNvIGFkZHMgc2Vu
dmNmZyBhbmQgc3N0YXRlZW4wIHRvIHRoZSBPTkVfUkVHCmludGVyZmFjZSBhbmQgdGhlIHZjcHUg
Y29udGV4dCBzYXZlL3Jlc3RvcmUuCgpUaGUgbW90aXZhdGlvbiBiZWhpbmQgU21zdGF0ZWVuIGZy
b20gdGhlIHNwZWMKKGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1zdGF0ZS1lbmFibGUp
OgoiVGhlIGltcGxlbWVudGF0aW9uIG9mIG9wdGlvbmFsIFJJU0MtViBleHRlbnNpb25zIGhhcyB0
aGUgcG90ZW50aWFsIHRvIG9wZW4KY292ZXJ0IGNoYW5uZWxzIGJldHdlZW4gc2VwYXJhdGUgdXNl
ciB0aHJlYWRzLCBvciBiZXR3ZWVuIHNlcGFyYXRlIGd1ZXN0IE9TZXMKcnVubmluZyB1bmRlciBh
IGh5cGVydmlzb3IuIFRoZSBwcm9ibGVtIG9jY3VycyB3aGVuIGFuIGV4dGVuc2lvbiBhZGRzIHBy
b2Nlc3NvcgpzdGF0ZS0tLXVzdWFsbHkgZXhwbGljaXQgcmVnaXN0ZXJzLCBidXQgcG9zc2libHkg
b3RoZXIgZm9ybXMgb2Ygc3RhdGUtLS10aGF0CnRoZSBtYWluIE9TIG9yIGh5cGVydmlzb3IgaXMg
dW5hd2FyZSBvZiAoYW5kIGhlbmNlIHdvbuKAmXQgY29udGV4dC1zd2l0Y2gpIGJ1dAp0aGF0IGNh
biBiZSBtb2RpZmllZC93cml0dGVuIGJ5IG9uZSB1c2VyIHRocmVhZCBvciBndWVzdCBPUyBhbmQg
cGVyY2VpdmVkLwpleGFtaW5lZC9yZWFkIGJ5IGFub3RoZXIuIgoKQ2hhbmdlcyBpbiB2NToKLSBS
ZWJhc2VkIG9uIGxhdGVzdCBsaW51eCBtYXN0ZXIKCkNoYW5nZXMgaW4gdjQ6Ci0gVXBkYXRlIGNv
bW1pdCBkZXNjcmlwdGlvbiBmb3IgcGF0Y2ggMQotIFJlYmFzZSB0byBrdm1fcmlzY3ZfcXVldWUK
LSBBZGQgcmV2aWV3ZWQtYnkgdGFnCgpDaGFuZ2VzIGluIHYzOgotIE1vdmUgRFQgYmluZGluZ3Mg
Y2hhbmdlIHRvIGEgc2VwYXJhdGUgcGF0Y2gKLSBNb3ZlIHNlbnZjZmcvc3N0YXRlZW4wIHNhdmUv
cmVzdG9yZSB0byBzZXBhcmF0ZSBmdW5jdGlvbgoKQ2hhbmdlcyBpbiB2MjoKLSBBZGQgc21zdGFl
ZW4gZGVzY3JpcHRpb24gaW4gcmlzY3YvZXh0ZW5zaW9ucy55YW1sCi0gQXZvaWQgbGluZSB3cmFw
IGF0IDgwIGNoYXJzCgpNYXl1cmVzaCBDaGl0YWxlICg3KToKICBSSVNDLVY6IERldGVjdCBTbXN0
YXRlZW4gZXh0ZW5zaW9uCiAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgc21zdGF0ZWVuIGVudHJ5
CiAgUklTQy1WOiBLVk06IEFkZCBrdm1fdmNwdV9jb25maWcKICBSSVNDLVY6IEtWTTogRW5hYmxl
IFNtc3RhdGVlbiBhY2Nlc3NlcwogIFJJU0NWOiBLVk06IEFkZCBzZW52Y2ZnIGNvbnRleHQgc2F2
ZS9yZXN0b3JlCiAgUklTQ1Y6IEtWTTogQWRkIHNzdGF0ZWVuMCBjb250ZXh0IHNhdmUvcmVzdG9y
ZQogIFJJU0NWOiBLVk06IEFkZCBzc3RhdGVlbjAgdG8gT05FX1JFRwoKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8ICA2ICsrCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oICAgICAgICAgICAgICAgICAgfCAxOCArKysrKwogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oICAgICAgICAgICAgIHwgMTggKysrKysKIGFyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8IDEwICsrKwogYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9rdm0vdmNwdS5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgNzAgKysrKysrKysrKysrKysrLS0tLQogYXJjaC9y
aXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgIHwgNDEgKysrKysrKysrKysK
IDggZmlsZXMgY2hhbmdlZCwgMTUyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKLS0g
CjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
