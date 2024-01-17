Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9932BC47077
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 02:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mzso4bPHqu3dtkb+IUhhVZ8ChR3IQm4QU7uRO+G1Lcw=; b=wJ/upvjAXyXVTA
	wEPRrdSxHaTJDh/bi4p62K4JXCieEEqyaVlhlx1ydFpAvchDCkRO6eTib1FxVZVscXMPseXigtTEE
	yi3/1Va1YVwT1aGZAhHvgJf0VliQ7KdVl6/2rjGvhZzDpQER1BJ68t9p/IQlMD6VlonnWj0VZW4cB
	gJKY6ARJPgCgRWfOjijSx2lBBE9LQJWmlDjFMIjgjRpybOhfd72sBGKBZfXrUsz99maWCKi+ywnrR
	bvX9mSHsxntEI8QP7S6Fx7LqtSp8FrCfPDhrA7otkZTVyjPfO/86EajqCUXNzpjmjZ++WbBFcdzVk
	eJg1yOk+zxbW+cv4Ocsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPw4j-00EGH7-0h;
	Wed, 17 Jan 2024 02:54:45 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPw4f-00EGDl-2R
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 02:54:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28b6218d102so8557192a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 18:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705460073; x=1706064873; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WW6+IaUJP6Uf9B7rnL7Xu6F/dmlNlrgMHD5+y/WRt7o=;
        b=MBvde9fizSVkjw8n+ZLZq75PQ7T4p/52wtG719hqBzjM3w83k0ASrgHvZZx/7jVKc4
         jjqIq1th3dEq/UvHW8+aHTDJmp1HmeNfYMYSXI0npbzTTuKG32Nz5i057RnNypq7F4ZS
         78hUav+5lPgKTcr+HvSM9ydZ71pVkYkdB1W02krQWUVYGtiFX8QiwLWD3oOS3zthMPjI
         J5ANjdWzazqxnKuhBLZT2xqpBtDg7ebJwVMlnFVLzM07nbnSRlt/EEm5EhEHQfLOBdWa
         mTvbpRpXlNMaozGrp8VUhMHa23maCmUHRvWBPVstjG2dJ888wxTHd9powPhFj47Eso8C
         HxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705460073; x=1706064873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WW6+IaUJP6Uf9B7rnL7Xu6F/dmlNlrgMHD5+y/WRt7o=;
        b=IvhNTuQQGGF78RcvRTFs3syYL5sTXiOMJtrS90Ao7Kkdo4cE8CDhoeL83mGQ8sQT/J
         OgA4teYrZJCQ4CWIRztK4fSHopP41X2i0aFrUQen1A+86vwV8Wa2YfEVCaM4N5tL0jnW
         qVCuYC/wPCITtNSxGKO6h9g+1O6gInl1zfzQM7bqugYUAxUDExsAsj+0k0zkHRkCZ038
         wH1p9qppIu+jDE2al9Z9n7UTNVXAXQ2MB7ZbdHiCYmt5axh0d9pmA2jtLQ81hOb15GUS
         iH8qdMcYFlMtOAWPwiC6aJQonDXnn7G6EO77JLjyl2O/H/rtI/yJ3nsk+QooM/dTPBAo
         EGqw==
X-Gm-Message-State: AOJu0YyiEv6AStcdEUS5xohF+YhluY2VC+YFR/axDAI7G7qE4fNpmJVI
	zxNwH28j6h5+Y/90Ja5O7VRQcpWZpif8AA==
X-Google-Smtp-Source: AGHT+IG2975QL4XvS61VVnkh+DY0sUA6kjqqd1RbHkJA8u5avvluT1b66g4NZGqLNlnulLdSXj2jng==
X-Received: by 2002:a17:90a:7087:b0:28f:fbf7:c3f8 with SMTP id g7-20020a17090a708700b0028ffbf7c3f8mr99106pjk.80.1705460073270;
        Tue, 16 Jan 2024 18:54:33 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id rs3-20020a17090b2b8300b0028ceafb9124sm12553531pjb.51.2024.01.16.18.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 18:54:32 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Tue, 16 Jan 2024 18:54:27 -0800
Message-Id: <20240116-fencei-v8-0-43a42134f021@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGNBp2UC/23QTU7DMBAF4KtUXhM0M/4NK+6BWMT2mHpBUjnIA
 lW5O05F0whl+Sx/bzy+iplL5lm8nK6icM1znsYW3NNJhPMwfnCXY8uCgCQi2i7xGDh3qU8GonU
 qDSDa5UvhlL9vRW/vLZ/z/DWVn1tvxfX0r4LoXlGxg85zAIcYPCG9llynOY/hOUyfYm2ptJMSN
 klNUvCG5ODRYzqQ8iEJ5SblOtNq1I6kY28PpLpLBQjbwlU1GVVIlHwPOsoDqffSbVI3OQzIGqM
 loqPXmr3sN2maBIVomlVKhwNpdxIff2ubtC6BQcUYPfyTy7L8AiWfKZ37AQAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705460071; l=2486;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Pat7RCigSa5r0JFjA0wxBgqZn7nz7o/oQLmsEgnHH2c=;
 b=j+zlsJvLP6gWKyP33srwPabTq27bJGfwwrXSeGvgu7PyZtodOZyZclbdcb5Xf0rPgpm+Ku3Fd
 e3QfmvR1XObDnJcLkrWu3JZD090iqBz1sSMQcYDA6RcR13e0Wu+Jq5v
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_185441_789511_5709E54C 
X-CRM114-Status: UNSURE (   8.87  )
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

SW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgaWNhY2hlIGZsdXNoaW5nIGJ5IGNyZWF0aW5nIGEg
bmV3IHByY3RsIGZsYWcKUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFguIFRoZSBpbnRlcmZh
Y2UgaXMgbGVmdCBnZW5lcmljIHRvIGFsbG93CmZvciBmdXR1cmUgZXhwYW5zaW9ucyBzdWNoIGFz
IHdpdGggdGhlIHByb3Bvc2VkIEogZXh0ZW5zaW9uIFsxXS4KCkRvY3VtZW50YXRpb24gaXMgYWxz
byBwcm92aWRlZCB0byBleHBsYWluIHRoZSB1c2UgY2FzZS4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3Ytai1leHRlbnNpb24KClNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lu
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2VzIGluIHY4OgotIE9ubHkgZmx1c2gg
aWNhY2hlIGlmIG1pZ3JhdGVkIHRvIGRpZmZlcmVudCBjcHUgKEFsZXgpCi0gTW92ZSBmbHVzaGlu
ZyB0byBzd2l0Y2hfdG8gdG8gY2F0Y2ggcGVyLXRocmVhZCBmbHVzaGluZyBwcm9wZXJseQotIExp
bmsgdG8gdjc6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMTItZmVuY2VpLXY3LTAt
NzhmMDYxNGUxZGIwQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NzoKLSBDaGFuZ2UgInBlcl90
aHJlYWQiIHBhcmFtZXRlciB0byAic2NvcGUiIGFuZCBwcm92aWRlIGNvbnN0YW50cyBmb3IgdGhl
CiAgcGFyYW1ldGVyLgotIExpbmsgdG8gdjY6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NDAxMDktZmVuY2VpLXY2LTAtMDQxMTZlNTE0NDVjQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2
NjoKLSBGaXh1cCBkb2N1bWVudGF0aW9uIGZvcm1hdHRpbmcKLSBMaW5rIHRvIHY1OiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTA4LWZlbmNlaS12NS0wLWFhMWU1MWQ3MjIyZkByaXZv
c2luYy5jb20KCkNoYW5nZXMgaW4gdjU6Ci0gTWlub3IgZG9jdW1lbnRhdGlvbiBjaGFuZ2VzIChS
YW5keSkKLSBMaW5rIHRvIHY0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTA3LWZl
bmNlaS12NC0wLWQ0Y2YyZmI5MDVkM0ByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjQ6Ci0gQWRk
IE9GRiBmbGFnIHRvIGRpc2FsbG93IGZlbmNlLmkgaW4gdXNlcnNwYWNlIChBdGlzaCkKLSBGaXgg
ZG9jdW1lbnRhdGlvbiBpc3N1ZXMgKEF0aXNoKQotIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyMzEyMTMtZmVuY2VpLXYzLTAtYjc1MTU4MjM4ZWI3QHJpdm9zaW5jLmNv
bQoKQ2hhbmdlcyBpbiB2MzoKLSBDaGVjayBpZiB2YWx1ZSBmb3JjZV9pY2FjaGVfZmx1c2ggc2V0
IG9uIHRocmVhZCwgcmF0aGVyIHRoYW4gaW4gbW0KICB0d2ljZSAoQ2zDqW1lbnQpCi0gTGluayB0
byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEzMC1mZW5jZWktdjItMC0yY2I2
MjNhYjFiMWZAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHYyOgotIEZpeCBrZXJuZWwtZG9jIGNv
bW1lbnQgKENvbm9yKQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
MzExMjItZmVuY2VpLXYxLTAtYmVjMDgxMWNiMjEyQHJpdm9zaW5jLmNvbQoKLS0tCkNoYXJsaWUg
SmVua2lucyAoMik6CiAgICAgIHJpc2N2OiBJbmNsdWRlIHJpc2N2X3NldF9pY2FjaGVfZmx1c2hf
Y3R4IHByY3RsCiAgICAgIGRvY3VtZW50YXRpb246IERvY3VtZW50IFBSX1JJU0NWX1NFVF9JQ0FD
SEVfRkxVU0hfQ1RYIHByY3RsCgogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2Ntb2R4LnJzdCAg
IHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBEb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaW5kZXgucnN0ICAgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21t
dS5oICAgICAgICAgfCAgNCArKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5o
IHwgIDMgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggICB8ICA3ICsrKwog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCAgIHwgMTcgKysrKysrKwogYXJjaC9y
aXNjdi9tbS9jYWNoZWZsdXNoLmMgICAgICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKysr
KysrKwogYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMgICAgICAgICAgICAgIHwgMTQgKysrKy0tCiBp
bmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaCAgICAgICAgICAgfCAgNiArKysKIGtlcm5lbC9zeXMu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKwogMTAgZmlsZXMgY2hhbmdlZCwgMjE4
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogYjg1ZWE5NWQw
ODY0NzFhZmI0YWQwNjIwMTJhNGQ3M2NkMzI4ZmE4NgpjaGFuZ2UtaWQ6IDIwMjMxMTE3LWZlbmNl
aS1mOWY2MGQ3ODRmYTAKLS0gCi0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
