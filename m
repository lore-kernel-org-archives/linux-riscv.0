Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ADBC3ABD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QZaFRu69C6DRQxtz3oCCuN3CyUIcU8THtxyC6Yowi7w=; b=bWd9C5hWVJ98xy
	H6gUr1GK50MIE3aFMbZbMwPG6q+kqrfLdh1rFVQB5FXnsndOP2cW3ZzN8AIT3Ddw9/vt3vRkjEGAB
	MYWP26JTeEyYUBDRaa6vknsM8zBSBTP53o+NCo/LL0pw4RX4yUgb22y356k4+ifxVxlapXy6DRfZ6
	IbhtVYiaSHPlV7Qi547nfyKBms6UXN14ZSjszz6OT99zSCMw8xeZ2aFYLk2/0vr95lmwkhFW+5wwk
	zwl/ZvMET/eFwifCjpenNKHEHUJqdavJA/6/t/pNAfsLbWfprZKQWqWbcIzrRjmOAwTRRq8noj04S
	rMk2C3W9zBA3TJ9hFYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwL4-00000003iDa-2KU8;
	Fri, 16 May 2025 14:47:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvjO-00000003cGR-0L66
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 14:08:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so22175945e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747404488; x=1748009288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/BNsmKtmxng+uJwxYfVRzr1UYXziJ1APu78MxCAAdI=;
        b=vzoHh1GfSPwnA+4wXdEWUeoIUzMnWwYuib9kTu8XFik2ZMFdswLDB3vRNRAn4vjOaJ
         zK62tNULR3JmfkDkbvcOxy8yrC2X2cuYKF+rb6rAZUUPmZB6Qd0ni7TBbisdSb7REW7g
         oD8hC8mdo+x5zeWtV7BLwiCOmITqwy26wlMcNBGHUkoPbmj72OkfH2L3p4DAc6snNi/Z
         RpI4PJpVz6erf8+jgzyble+++Dc+8p7zn0Ym8K8rebV0XvqEGUWhP0Y4Xb6jkhRitAQT
         P5dEOs6Bz0EOS2jnR6y4bZ0Uylk91DoE9kTp/dEJWA52KCHJdJqcGZtlCpaNOo0qUJEr
         kSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404488; x=1748009288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/BNsmKtmxng+uJwxYfVRzr1UYXziJ1APu78MxCAAdI=;
        b=sTmVb9OrLdNefU8iino812h1SisSUVW604iBAwvTZjojz+KVrw8niSzTvgHNRXUnJG
         Rm46dUTKN9jT7HT9qd/6FX0LXbRc53wig6b4p8+mCfcnOOdHprshEm1Dl2sZbV7fzq8u
         0aY1MLBCQhqaWctcnzrkG4zP6Q/R2IEmouPahYzne0exoZ0eSPFYSLG9CNZBvY9HnvA1
         3CqN0VHu6R7MTIhJA9wjSMQYFWKdLMv8kgkNvHJKNAPiG+9rs4LGrAqOQ03JbZy1nktj
         O7OJuFNvrVgqT5LNhBNSCsw8QLDMMlLQ2N/VgsQE9ldqKPYQPy56Av0HdZWyfZ+uvoJK
         HyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG1epSodnqABRlXffqvTx6E79xoiQBza4+84PgehCJMCoLXZAg1idmPuFjoNwlxIoOzzYVpO/iRm5EWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0vHC06GLBo0nMd5ojRx6mh4tIGakarX+6hlCAGg4a9EEg71V/
	pa5cllETekz/SKZRxeLDnw9MKaoNC9kR5LjVRHvBLVLekxbHbOPvU2MAbJMMvOFt5pA=
X-Gm-Gg: ASbGnctPlMTpGgnopUBywI9471Febh5hizuH5ZuMbL2TJii2m0IS1MldUhQrOPpVg8R
	Y4VMGfSKyQAPeFd9vu/Q2QAlWOuyObuXcyWVKpfeIJPZs+JxHlZdc2gwlDMSj+MaYTwq4Rx57lU
	xuSEiwdt2uIF+QRA/khKdQKrAJ7WkzPBFOf0QT0u8+m8BWmO2itodwzWNse8cnD/QpaemkCtMiQ
	17ivNSFyHO8PCLyIJBmSBm/sc4SjSevpLmnQxmbwPC6f7Gcbe5VQk4NWKtHFcr/rlxgKR2JppEO
	1r+AYyfqiTb/8Cu6XpNlQE6B0vnvNlDhwz56Di7I+Fqijbx2yvi47/liwEgL/jcHXwytcPh1
X-Google-Smtp-Source: AGHT+IGq36WEEdwcj2F1kc98tOimoY9E+6SHXs/IqyOGwvA6IL+/S0Nt0+GgQYvZ1hvDj9xey6cGow==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr38117515e9.24.1747404487692;
        Fri, 16 May 2025 07:08:07 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:b6d5:4f19:6a91:78f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e852fsm113910005e9.27.2025.05.16.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:08:07 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 0/3] Move duplicated instructions macros into asm/insn.h
Date: Fri, 16 May 2025 16:08:02 +0200
Message-Id: <20250516140805.282770-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_070810_342877_36D3E6D3 
X-CRM114-Status: UNSURE (   7.01  )
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

VGhlIGluc3RydWN0aW9ucyBwYXJzaW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBv
ZiB0aGVtIGhhZCBkaWZmZXJlbnQKaW1wbGVtZW50YXRpb25zLCB3aGljaCBpcyBlcnJvciBwcm9u
ZS4KClNvIGxldCdzIGNvbnNvbGlkYXRlIHRob3NlIG1hY3JvcyBpbiBhc20vaW5zbi5oLgoKdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDIyMDgyNTQ1LjQ1MDQ1
My0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDI1MDUwODA4MjIxNS44ODY1OC0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20v
CnYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDUwODEyNTIwMi4x
MDg2MTMtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwoKQ2hhbmdlcyBpbiB2NDoKLSBSZWJhc2Ug
b24gdG9wIG9mIGZvci1uZXh0IChvbiB0b3Agb2YgNi4xNS1yYzYpCgpDaGFuZ2VzIGluIHYzOgot
IEZpeCBwYXRjaCAyIHdoaWNoIGNhdXNlZCBidWlsZCBmYWlsdXJlcyAobGludXggcmlzY3YgYm90
KSwgYnV0IHRoZQogIHBhdGNoc2V0IGlzIGV4YWN0bHkgdGhlIHNhbWUgYXMgdjIKCkNoYW5nZXMg
aW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjNQotIEFkZCBSQiB0YWdzCi0gRGVmaW5l
IFJWX1goKSB1c2luZyBSVl9YX21hc2soKSAoQ2zDqW1lbnQpCi0gUmVtb3ZlIHVudXNlZCBkZWZp
bmVzIChDbMOpbWVudCkKLSBGaXggdGFidWxhdGlvbnMgKERyZXcpCgpBbGV4YW5kcmUgR2hpdGkg
KDMpOgogIHJpc2N2OiBGaXggdHlwbyBFWFJBQ1QgLT4gRVhUUkFDVAogIHJpc2N2OiBTdHJlbmd0
aGVuIGR1cGxpY2F0ZSBhbmQgaW5jb25zaXN0ZW50IGRlZmluaXRpb24gb2YgUlZfWCgpCiAgcmlz
Y3Y6IE1vdmUgYWxsIGR1cGxpY2F0ZSBpbnNuIHBhcnNpbmcgbWFjcm9zIGludG8gYXNtL2luc24u
aAoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oICAgICAgICAgIHwgMjA2ICsrKysrKysr
KysrKysrKysrKysrKystLS0KIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5j
IHwgICAyICstCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgICB8IDE0NCAr
LS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICAgICAg
fCAgIDIgKy0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jICAgICAgICAgICAgIHwgMTI4ICst
LS0tLS0tLS0tLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKSwgMjk0IGRl
bGV0aW9ucygtKQoKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
