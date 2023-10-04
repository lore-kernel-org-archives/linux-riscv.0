Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408F1E7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=18sffG22V0QbP7YSwjiub6HmXTe5LeHr2IY+MdibuhY=; b=RI19Y1ClyzyodZ
	AfEMXfJR1Zo530/aCpyjO8qBKpnEv3K2UmpBl8jfHuqS7V9c3ppR0YAl9QbmhzPJ9XTooKvCgynTL
	665ud30mz5dPUF73I9jDq++lwJlrks7EXRZoRiSjYp0kWEc+a76Np9Wfz/sm+hdVSE5OdW3ZKtegK
	doMecI+PlilX/F0qEnqm0NeqdgWz3ATwb0BE9D2v4Ma5VOBlOE6SRzS6mqmAzZvedZ1ltsVZsnJAt
	auFhJtPTiVHLLUQXgLqIIdGI1XPQuCqZ1X0tdwM329TpzknK7LLX3+eoJEoECQcOwBTYklU9XNXAf
	/BlgLyKlGxrhgQrEZyxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a1-000JZK-0G;
	Wed, 04 Oct 2023 15:14:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3Zx-000JXj-0B
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:14:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-405d70d19bcso4000285e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696432463; x=1697037263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiCOeJRANpJ7P0MWtYGhVQpvoxCcQmfg9ZQBftOdf3o=;
        b=svnZVDMY2CFO+yCPZLRu5IuQqqRDmjRDlFA7N4iPO/JLlRp53VWVmX7QPbfB6xi2MS
         DUgVtw4Y8jv2SSAXW1m6JX8hHFJOk8TyOciRzhhiIMuOb3HTpRbpfNVTEGi9Asma1VR6
         VPwd+dqxxy0HiaHqpCyshOaRCyCUy+Yt52Kmq35JJ3qSv53VXGnm5L1AC4Bk4IMjsuRh
         7et2r8nki0SuiDjlQeHRjQVXSpyWIpAoiUPv/AfoD9NUTVHw3vuAu7zchIU8/byJHH6b
         pqXU7xTiUjVoQDCiDi6lPhQS2e67biBSXQCGnzeSgagZ+EpFstdpXKMqsfMI4eBBJ4nB
         m6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432463; x=1697037263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiCOeJRANpJ7P0MWtYGhVQpvoxCcQmfg9ZQBftOdf3o=;
        b=SfAamvPSa6bZ89gH2XwgTELw04FYzCAghvj3x+AABtdAQnbuBMU9LgUnPd7QABPAmQ
         R/hT14u/TI4wRBeFtselj0+7F0L3KJlIAZLAyd47YNm1mBW++dcK1M+HTCAXbAy1TgRX
         8CiLiB07TJ+Zn2zmKzbW7rfg7zS8H8hE5zwsqPfi4linoD1cjLa/XG02ZqoMfygZ0jKG
         30CPgTnf6YvgjldSqBw16yCRtHYB71AEccrnv+ss2XobbVCM60uSWu6g2RvBKDDw9CIO
         7BfT/w8beVvEPzgqD4ooqCKn6P/bwyqYc+NPCJtj5HR4Tt8BD959v8KcdJG3+hML+5+o
         SdOw==
X-Gm-Message-State: AOJu0YxX+tYOHGhp2mkrJMY1dSr9ERY8VXz5WIB1tcfwsTPM+iz28X7s
	DNWNWTrpcIyVswOn39i2yyK6xQ==
X-Google-Smtp-Source: AGHT+IEFRogL8GkogCVx+tQlnbmJpQqHe3HYjESa17xIS+381kk34vs7TYN2Mj5VcrnAg/SFSwdoNg==
X-Received: by 2002:a05:600c:1d03:b0:405:39bb:38a8 with SMTP id l3-20020a05600c1d0300b0040539bb38a8mr2507039wms.2.1696432462551;
        Wed, 04 Oct 2023 08:14:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b00402f7b50517sm1768764wmd.40.2023.10.04.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:14:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v2 0/8] Add support to handle misaligned accesses in S-mode
Date: Wed,  4 Oct 2023 17:13:57 +0200
Message-ID: <20231004151405.521596-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_081425_094906_16A0CE59 
X-CRM114-Status: GOOD (  15.23  )
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

U2luY2UgY29tbWl0IDYxY2FkYjkgKCJQcm92aWRlIG5ldyBkZXNjcmlwdGlvbiBvZiBtaXNhbGln
bmVkIGxvYWQvc3RvcmUKYmVoYXZpb3IgY29tcGF0aWJsZSB3aXRoIHByaXZpbGVnZWQgYXJjaGl0
ZWN0dXJlLiIpIGluIHRoZSBSSVNDLVYgSVNBCm1hbnVhbCwgaXQgaXMgc3RhdGVkIHRoYXQgbWlz
YWxpZ25lZCBsb2FkL3N0b3JlIG1pZ2h0IG5vdCBiZSBzdXBwb3J0ZWQuCkhvd2V2ZXIsIHRoZSBS
SVNDLVYga2VybmVsIHVBQkkgZGVzY3JpYmVzIHRoYXQgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUK
c3VwcG9ydGVkLiBJbiBvcmRlciB0byBzdXBwb3J0IHRoYXQsIHRoaXMgc2VyaWVzIGFkZHMgc3Vw
cG9ydCBmb3IgUy1tb2RlCmhhbmRsaW5nIG9mIG1pc2FsaWduZWQgYWNjZXNzZXMgYXMgd2VsbCBz
dXBwb3J0IGZvciBwcmN0bChQUl9VTkFMSUdOKS4KCkhhbmRsaW5nIG1pc2FsaWduZWQgYWNjZXNz
IGluIGtlcm5lbCBhbGxvd3MgZm9yIGEgZmluZXIgZ3JhaW4gY29udHJvbApvZiB0aGUgbWlzYWxp
Z25lZCBhY2Nlc3NlcyBiZWhhdmlvciwgYW5kIHRoYW5rcyB0byB0aGUgcHJjdGwoKSBjYWxsLApj
YW4gYWxsb3cgZGlzYWJsaW5nIG1pc2FsaWduZWQgYWNjZXNzIGVtdWxhdGlvbiB0byBnZW5lcmF0
ZSBTSUdCVVMuIFVzZXIKc3BhY2UgY2FuIHRoZW4gb3B0aW1pemUgaXRzIHNvZnR3YXJlIGJ5IHJl
bW92aW5nIHN1Y2ggYWNjZXNzIGJhc2VkIG9uClNJR0JVUyBnZW5lcmF0aW9uLgoKVGhpcyBzZXJp
ZXMgaXMgdXNlZnVsIHdoZW4gdXNpbmcgYSBTQkkgaW1wbGVtZW50YXRpb24gdGhhdCBkb2VzIG5v
dApoYW5kbGUgbWlzYWxpZ25lZCB0cmFwcyBhcyB3ZWxsIGFzIGRldGVjdGluZyBtaXNhbGlnbmVk
IGFjY2Vzc2VzCmdlbmVyYXRlZCBieSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gdXNpbmcgdGhlIHBy
Y3RybChQUl9TRVRfVU5BTElHTikKZmVhdHVyZS4KClRoaXMgc2VyaWVzIGNhbiBiZSB0ZXN0ZWQg
dXNpbmcgdGhlIHNwaWtlIHNpbXVsYXRvclsxXSBhbmQgYSBtb2RpZmllZApvcGVuU0JJIHZlcnNp
b25bMl0gd2hpY2ggYWxsb3dzIHRvIGFsd2F5cyBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGxvYWQvc3Rv
cmUgdG8KUy1tb2RlLiBBIHRlc3RbM10gdGhhdCBleGVyY2lzZSB2YXJpb3VzIGluc3RydWN0aW9u
cy9yZWdpc3RlcnMgY2FuIGJlCmV4ZWN1dGVkIHRvIHZlcmlmeSB0aGUgdW5hbGlnbmVkIGFjY2Vz
cyBzdXBwb3J0LgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvcmlz
Y3YtaXNhLXNpbQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL3Jpdm9zaW5jL29wZW5zYmkvdHJlZS9k
ZXYvY2xlZ2VyL25vX21pc2FsaWduZWQKWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9jbGVtZW50bGVn
ZXIvdW5hbGlnbmVkX3Rlc3QKCkNoYW5nZXMgaW4gVjI6CiAtIEZpeCB3cm9uZyBmcHUgYXNzZW1i
bHkgZnVuY3Rpb24gbmFtZSAoZGV0ZWN0ZWQgd2l0aCBsbHZtIGJ1aWxkKQogLSBDaGFuZ2VzIHRo
ZSBkZXRlY3Rpb24gbWVjaGFuaXNtIHVzaW5nIGRpcmVjdCBkZXRlY3Rpb24gaW4gdHJhcCBoYW5k
bGVyCiAgIChDT05GSUdfTV9NT0RFIGRvZXMgbm90IHN1cHBvcnQgZXh0YWJsZSBhbmQgcmUtYWRk
aW5nIGV4dGFibGUganVzdAogICAgZm9yIHNvbWUgYm9vdCB0aW1lIGRldGVjdGlvbiBpcyBhIGJp
dCBvdmVya2lsbCkKIC0gRml4IGNvbW1pdCBvcmRlciAodXNlZCBhIHZhcmlhYmxlIGludHJvZHVj
ZSBpbiBhIGxhdGVyIGNvbW1pdCkKIC0gQWRkIGEgQ09ORklHX1JJU0NWX01JU0FMSUdORUQgb3B0
aW9uIHRvIGNvbXBsZXRlbHkgZGlzYWJsZSBtaXNhbGlnbmVkCiAgIGhhbmRsaW5nIGluIGtlcm5l
bCBhbmQgcmVkdWNlIHRleHQgc2l6ZQogLSBVc2UgZm9yX2VhY2hfcHJlc2VudF9jcHUoKSBpbnN0
ZWFkIG9mIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdSgpIGluIGluaXQKIC0gRW5zdXJlIHRoYXQgaWYg
dW5hbGlnbmVkX2N0bCB3YXMgc2V0LCBmYWlsIHRvIG9ubGluZSBjcHUgaWYgaXQgZG9lcwogICBu
b3QgZW11bGF0ZSBtaXNhbGlnbmVkIGFjY2Vzc2VzLgoKQ2zDqW1lbnQgTMOpZ2VyICg4KToKICBy
aXNjdjogcmVtb3ZlIHVudXNlZCBmdW5jdGlvbnMgaW4gdHJhcHNfbWlzYWxpZ25lZC5jCiAgcmlz
Y3Y6IGFkZCBzdXBwb3J0IGZvciBtaXNhbGlnbmVkIHRyYXAgaGFuZGxpbmcgaW4gUy1tb2RlCiAg
cmlzY3Y6IHJlcG9ydCBwZXJmIGV2ZW50IGZvciBtaXNhbGlnbmVkIGZhdWx0CiAgcmlzY3Y6IGFk
ZCBmbG9hdGluZyBwb2ludCBpbnNuIHN1cHBvcnQgdG8gbWlzYWxpZ25lZCBhY2Nlc3MgZW11bGF0
aW9uCiAgcmlzY3Y6IGFkZCBzdXBwb3J0IGZvciBzeXNjdGwgdW5hbGlnbmVkX2VuYWJsZWQgY29u
dHJvbAogIHJpc2N2OiBhbm5vdGF0ZSBjaGVja191bmFsaWduZWRfYWNjZXNzX2Jvb3RfY3B1KCkg
d2l0aCBfX2luaXQKICByaXNjdjogcmVwb3J0IG1pc2FsaWduZWQgYWNjZXNzZXMgZW11bGF0aW9u
IHRvIGh3cHJvYmUKICByaXNjdjogYWRkIHN1cHBvcnQgZm9yIFBSX1NFVF9VTkFMSUdOIGFuZCBQ
Ul9HRVRfVU5BTElHTgoKIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAg
IDkgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICB8ICAxOCArKwogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaCB8ICAxNCArCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgIHwgICA5ICsKIGFyY2gvcmlzY3Yva2VybmVsL01ha2Vm
aWxlICAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAg
ICAgICAgfCAgIDYgKy0KIGFyY2gvcmlzY3Yva2VybmVsL2ZwdS5TICAgICAgICAgICAgICAgfCAx
MjEgKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgIHwgIDE4
ICsrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgICAgICAgICAgIHwgICAyICstCiBhcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgICAgICAgIHwgICA5IC0KIGFyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzX21pc2FsaWduZWQuYyAgfCAzNzUgKysrKysrKysrKysrKysrKysrKysrKy0tLS0K
IDExIGZpbGVzIGNoYW5nZWQsIDUyNCBpbnNlcnRpb25zKCspLCA1OSBkZWxldGlvbnMoLSkKCi0t
IAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
