Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF27EC4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lXVq5c+9gc/TmfyYK1vlUyhdQoVWQpTdBfpIU4hFoc0=; b=ypkhiwRWNhrCb+
	TAl/b6mM0l4FDWg1siZQrXe1tJg+fw/R+AZwy06WuosQSMoF0eVXDw241KP+ZVHLhBoc66BiwQudP
	vhqlHbMPdymy61VIUqQUs2uF5PKbcZGUg8nW4MsbX8FxXS9q+h3rzks7DoBkK1RukyYVdJy2a+kR5
	Zp+89M9IM9WLRWxgcs71a12jJHTeesGQYUXQ0ddD8psQOWoi+Uka9zkuJFmbEg7kvck0gOtuIC3o0
	ldcARN59k2MDW+iuKJcKczMTiPUYzkjg6wlQTQlPBbf0Y1O3rRm04UwKuvtmaNpigPf5RNYkzFLUk
	Fb75uINkNGRcRS5DzdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOFXh-002ZLu-02;
	Fri, 12 Jan 2024 11:17:41 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOFXc-002ZKg-3D
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 11:17:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28b93b04446so1338303a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 03:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705058254; x=1705663054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/r2CUr6NQRTkWJSfnfsoonlWRwu5UcKq/JbWJG+yiE=;
        b=QKXrpG2Pqypj3t1OwJ25BXw+mMFrJH3etpXGyNY52mkR/sDF11Gss817I141/Bw/Ts
         DJK0KUGB2+Ug4dXLs/VUPdq+KaN7E3Q1J0qaea2/15GZAug0WPLQeQIpyluoUo0892jP
         vDgqEFUwoQjltZY0eKZIciB/5ulOU80OfGpSVGbkrKRExXOxrV9dwn4TgB+aO2EMnrf9
         DqzxbewgSBfihZ0YXyBbe4ZwfvlWdhveO+JDHB9kno+nKKsS4Uml66YiAeE43ECeGBg7
         D93/HWmsGx//ztfK+0ts7KZEbkzZrxES+IoyC4Efo9xEGTV3R7mi9M8YnG6cuFCgJeek
         V0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705058254; x=1705663054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/r2CUr6NQRTkWJSfnfsoonlWRwu5UcKq/JbWJG+yiE=;
        b=OPYaxNjl+SKNUNmr56QXEXclMX3UzxXJefczDcF/l64AoJrWhik6fVjhuHM93nkENU
         W7cEHMHw0tf75L+9VyDNNfHE5VVH7GODz38Uzvgk7n40nqMWBFJfUOpNl9csQDYu7diM
         ae5PI6DlOCVaPhirk5C9/78ENQmg0s+1QI3deEwEZKoAtuMS16tKM+x6kkC+gvNM/KjT
         5fN4hYDYjs5Jk+jsgrrUriI1SujKlmWrfqqR4vxGxA30rkGeTpe461sQtytdiWQx/P7L
         83TumTFFPTC3w7Y75SaPUguhUdh1NqpxedFxurM5DCaJkImbznIVxhocQk9e+jDhmGat
         abmA==
X-Gm-Message-State: AOJu0Yz5CKY+c1tK/bGXPLEUCNt80Mu5uPKwO9s9fSYiL173DVCeR52V
	Dt1/jliZRt7/f6WSJd2wjPkMOXxdcCGTlA==
X-Google-Smtp-Source: AGHT+IGQohed/oEcJo01neyqBjBHsaj+nu3i/3udCsZR7M7O8D2uGXWtzMc93+BA3NLF+ZCUdujm1w==
X-Received: by 2002:a17:90a:ad8b:b0:28e:1609:88e4 with SMTP id s11-20020a17090aad8b00b0028e160988e4mr326280pjq.3.1705058254520;
        Fri, 12 Jan 2024 03:17:34 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:a276:8a4e:2aa1:5f09])
        by smtp.gmail.com with ESMTPSA id sd12-20020a17090b514c00b0028cef021d45sm3794179pjb.17.2024.01.12.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 03:17:34 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 0/3] riscv: add support for SBI Supervisor Software Events
Date: Fri, 12 Jan 2024 12:17:12 +0100
Message-ID: <20240112111720.2975069-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_031737_257143_01572EEF 
X-CRM114-Status: GOOD (  20.43  )
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

VGhlIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBleHRlbnNpb25zIHByb3Zp
ZGVzIGEgbWVjaGFuaXNtCnRvIGluamVjdCBzb2Z0d2FyZSBldmVudHMgZnJvbSBhbiBTQkkgaW1w
bGVtZW50YXRpb24gdG8gc3VwZXJ2aXNvcgpzb2Z0d2FyZSBzdWNoIHRoYXQgaXQgcHJlZW1wdHMg
YWxsIG90aGVyIHN1cGVydmlzb3IgbGV2ZWwgdHJhcHMgYW5kCmludGVycnVwdHMgWzFdLgoKVmFy
aW91cyBldmVudHMgYXJlIGRlZmluZWQgYW5kIGNhbiBiZSBzZW5kIGFzeW5jaHJvbm91c2x5IHRv
IHN1cGVydmlzb3IKc29mdHdhcmUgKFJBUywgUE1VLCBERUJVRywgQXN5bmNocm9ub3VzIHBhZ2Ug
ZmF1bHQpIGZyb20gU0JJIGFzIHdlbGwKYXMgcGxhdGZvcm0gc3BlY2lmaWMgZXZlbnRzLiBFdmVu
dHMgY2FuIGJlIGVpdGhlciBsb2NhbCAocGVyLWhhcnQpIG9yCmdsb2JhbC4gRXZlbnRzIGNhbiBi
ZSBuZXN0ZWQgb24gdG9wIG9mIGVhY2ggb3RoZXIgYmFzZWQgb24gcHJpb3JpdHkgYW5kCmNhbiBp
bnRlcnJ1cHQgdGhlIGtlcm5lbCBhdCBhbnkgdGltZS4KCkZpcnN0IHBhdGNoIGFkZHMgdGhlIFNT
RSBkZWZpbml0aW9ucy4gU2Vjb25kIG9uZSBhZGRzIHN1cHBvcnQgZm9yIFNTRQppdHNlbGYuIElt
cGxlbWVudGF0aW9uIGlzIHNwbGl0IGJldHdlZW4gYXJjaCBzcGVjaWZpYyBjb2RlIGFuZCBnZW5l
cmljCnBhcnQgKHNpbWlsYXJseSB0byB3aGF0IGlzIGRvbmUgZm9yIEFSTSBTREVJKS4gRmluYWxs
eSwgdGhlIGxhc3QgcGF0Y2gKYWRkIHN1cHBvcnQgZm9yIFNTRSBldmVudHMgaW4gdGhlIFNCSSBQ
TVUgZHJpdmVyLiBJZiB0aGUgU1NFIGV2ZW50IGlzCmF2YWlsYWJsZSBmcm9tIHRoZSBTQkkgdGhl
biwgaXQgd2lsbCBiZSB1c2VkIGluc3RlYWQgb2YgdGhlIG5vcm1hbAppbnRlcnJ1cHQuCgpBbW9u
Z3N0IHRoZSBzcGVjaWZpYyBwb2ludHMgdGhhdCBuZWVkcyB0byBiZSBoYW5kbGUgaXMgdGhlIGlu
dGVycnVwdGlvbgphdCBhbnkgcG9pbnQgb2YgdGhlIGtlcm5lbCBleGVjdXRpb24gYW5kIG1vcmUg
c3BlY2lmaWNhbGx5IGR1cmluZwpleGNlcHRpb24gaGFuZGxpbmcuIER1ZSB0byB0aGUgZmFjdCB0
aGF0IHRoZSBleGNlcHRpb24gZW50cnkKaW1wbGVtZW50YXRpb24gdXNlcyB0aGUgU0NSQVRDSCBD
U1IgYXMgYm90aCB0aGUgY3VycmVudCB0YXNrIHN0cnVjdCBhbmQKYXMgdGhlIHRlbXBvcmFyeSBy
ZWdpc3RlciB0byBzd2l0Y2ggdGhlIHN0YWNrIGFuZCBzYXZlIHJlZ2lzdGVyLCBpdCBpcwpkaWZm
aWN1bHQgdG8gcmVsaWFibHkgZ2V0IHRoZSBjdXJyZW50IHRhc2sgc3RydWN0IGlmIHdlIGdldCBp
bnRlcnJ1cHRlZAphdCB0aGlzIHNwZWNpZmljIG1vbWVudC4gQSBmaXh1cC1saWtlIG1lY2hhbmlz
bSBhbGxvd3MgdG8gbWFyayB0aGUKbG9jYXRpb24gb2YgdGhlIGN1cnJlbnQgdGFzayBzdHJ1Y3Qg
ZGVwZW5kaW5nIG9uIHRoZSBlbnRyeSBsZXZlbAoodXNlci9rZXJuZWwpIGFuZCB0aGUgbG9jYXRp
b24uIFRoaXMgaXMgdGhlbiB1c2VkIGluIHRoZSBTU0UgYXNzZW1ibHkgdG8KZGV0ZXJtaW5lIHdo
ZXJlIGlzIGxvY2F0ZWQgdGhlIGN1cnJlbnQgdGFza19zdHJ1Y3QuCgpDb250cmFyeSB0byBwc2V1
ZG8gTk1JIFsyXSwgU1NFIGRvZXMgbm90IG1vZGlmaWVzIHRoZSB3YXkgaW50ZXJydXB0cyBhcmUK
aGFuZGxlZCBhbmQgZG9lcyBub3QgYWRkcyBhbnkgb3ZlcmhlYWQgdG8gZXhpc3RpbmcgY29kZS4g
TW9yZW92ZXIsIGl0CnByb3ZpZGVzICJ0cnVlIiBOTUktbGlrZSBpbnRlcnJ1cHRzIHdoaWNoIGNh
biBpbnRlcnJ1cHQgdGhlIGtlcm5lbCBhdAphbnkgdGltZSAoZXZlbiBpbiBleGNlcHRpb24gaGFu
ZGxpbmcpLiBUaGlzIGlzIHBhcnRpY3VsYXJseSBjcnVjaWFsIGZvcgpSQVMgZXJyb3JzIHdoaWNo
IG5lZWRzIHRvIGJlIGhhbmRsZWQgYXMgZmFzdCBhcyBwb3NzaWJsZSB0byBhdm9pZCBhbnkKZmF1
bHQgcHJvcGFnYXRpb24uIEFkZGl0aW9uYWxseSwgU1NFIGV2ZW50IGhhbmRsaW5nIGlzIGZhc3Rl
ciB0aGF0IHRoZQpzdGFuZGFyZCBJUlEgaGFuZGxpbmcgcGF0aCB3aXRoIGFsbW9zdCBoYWxmIGV4
ZWN1dGVkIGluc3RydWN0aW9uICg3MDAgdnMKMTU5MCkuIFNvbWUgY29tcGxlbWVudGFyeSB0ZXN0
cy9wZXJmIG1lYXN1cmVtZW50cyB3aWxsIGJlIGRvbmUuCgpGb3IgdGVzdGluZyBwdXJwb3NlLCBv
bmUgY2FuIHVzZSB0aGUgcHJvdmlkZWQgU0JJIGltcGxlbWVudGF0aW9uIGF0IFszXS4KVGhpcyBz
ZXJpZXMgYWxzbyBuZWVkcyBwYXRjaCBbNF0gdG8gZml4IGEgYnVnIGluIHRoZSBQTVUgZHJpdmVy
LgoKTGluazogaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLXBycy9tZXNzYWdlLzc0NCBb
MV0KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMTAyMzA4MjkxMS4yMzI0
Mi0xMC1sdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tL1QvIFsyXQpMaW5rOiBodHRwczovL2dpdGh1
Yi5jb20vcml2b3NpbmMvb3BlbnNiaS90cmVlL3NzZV92MiBbM10KCi0tLQoKQ2hhbmdlcyBpbiB2
MjoKIC0gSW1wbGVtZW50ZWQgc3BlY2lmaWNhdGlvbiB2MgogLSBGaXggdmFyaW91cyBlcnJvciBo
YW5kbGluZyBjYXNlcwogLSBBZGRlZCBzaGFkb3cgc3RhY2sgc3VwcG9ydAoKdjE6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMxMDI2MTQzMTIyLjI3OTQzNy0xLWNsZWdl
ckByaXZvc2luYy5jb20vCgpDbMOpbWVudCBMw6lnZXIgKDMpOgogIHJpc2N2OiBhZGQgU0JJIFNT
RSBleHRlbnNpb24gZGVmaW5pdGlvbnMKICByaXNjdjogYWRkIHN1cHBvcnQgZm9yIFNCSSBTdXBl
cnZpc29yIFNvZnR3YXJlIEV2ZW50cyBleHRlbnNpb24KICBwZXJmOiBSSVNDLVY6IGFkZCBzdXBw
b3J0IGZvciBTU0UgZXZlbnQKCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVz
LmggfCAgIDQgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCAgICAgICAgICAgIHwgIDQy
ICstCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgICAgICAgICAgfCAgNDcgKysKIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2NzLmggICAgICAgICAgICB8ICAgNyArCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NzZS5oICAgICAgICAgICAgfCAgMTIgKwogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS90aHJlYWRfaW5mby5oICAgIHwgICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxl
ICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jICAg
ICAgICAgfCAgMjYgKysKIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgICB8
IDIwMiArKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgICAgICAgICAgICB8
ICAgNCArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zc2UuYyAgICAgICAgICAgICAgICAgfCAxMzAgKysr
KysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMgICAgICAgICAgfCAgMTMgKwogYXJj
aC9yaXNjdi9rZXJuZWwvdm1saW51eC5sZHMuUyAgICAgICAgIHwgICA2ICsKIGRyaXZlcnMvZmly
bXdhcmUvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAxMCArCiBkcml2ZXJzL2Zpcm13YXJlL01h
a2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9maXJtd2FyZS9yaXNjdl9zc2Uu
YyAgICAgICAgICAgIHwgNTY3ICsrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYyAgICAgICAgICAgIHwgIDQ2ICstCiBpbmNsdWRlL2xpbnV4L3Jpc2N2
X3NzZS5oICAgICAgICAgICAgICAgfCAgNzYgKysrKwogMTggZmlsZXMgY2hhbmdlZCwgMTE3NiBp
bnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NzZS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJu
ZWwvc3NlLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2X3NzZS5j
CiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9yaXNjdl9zc2UuaAoKLS0gCjIuNDMu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
