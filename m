Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C873E7C4C8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6qckFv0I+ZHTy0akQpCsms1CrKq4TVlX08lzSrjBLhg=; b=M56tiTaiTSrGe6
	2eMQKMwy3WpnkLfLalSna0Svv0rljUdAmulVzHCw9Y9AeFwin9Zxy9HMgEb20loMJvnUU35kuX+6N
	3Kc4U1msrud1YFrJW6XtAbUu0SPvomrCv2hHry21MMsRMH7XRFYo7vHdGA8MnREy2RWZlZJLMZhtC
	gh4CSIqOfDKWQPuJ57mOclunSqVn+xUG6izaYWpTPdHFgEW6aBywZFx+l3G5tSDySQZY+AMmP7ioJ
	eIznVj9dYsD7r9jWNzfOJirwNFuYNhiPtdrSisGTopsABGNgEukkBcY++gfyKYq9VnOnRea0oBmRH
	Egvfj4/Q6dfh9Q4YpEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2xg-000EMs-11;
	Wed, 04 Oct 2023 14:34:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2xb-000EJC-2M
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:34:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-406553f6976so4960775e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696430084; x=1697034884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CM1tzOwYIRfBowwMaDOZ0YTv6DSHjRM1ieV3JngoGb0=;
        b=nDcRmowiIFRrno6fZ9sWsr5hObMCHiGn+RBsLVP7Olh4mGDtZXhGR0sGleirrfm349
         ymz9HzdIuIgE27NLo1Nea8EVUhdyjuIIPsJCbTYcaj9tsV4pGQdjMkX2nsd3bIw+eGIX
         asKjA9nWxDdJuDBanyySB7BR+7TGLJp7NUEfDdRxXflxZ3dS+VPbn43TSkhEit45lKdU
         k3/hyBzAl57VEoPhryWlnre1WxbLpj93yuzG5ycOO5/jOirRMB3y/bhy3sFgE1cnoa+9
         IvIy3ledzKxPun9rqi7+RD+lG03dFMmi9BTUNImUZZG0qhP7HgYYe8sv1pM21xg1Jecn
         Wr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696430084; x=1697034884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CM1tzOwYIRfBowwMaDOZ0YTv6DSHjRM1ieV3JngoGb0=;
        b=iNQuAU9fLl8cLiARbDqW2HfUGVccBHHOxT2kPP9ffTSMVHBQyUU9BPdfTq9hg6JcP/
         /eupuMKWWwpA+nooDL10/QsHJt+l0sgew9MmXO3rQAfvYHk6u6o4LZdIzPcMuf7tce43
         etv2YOYBkFsMhVqMs2QMc4InTolcaRtS2B9pXXv46fPFsaqvJopJLBaopPJrsLYc4FJQ
         E71uggMwdC67W+BgBiKRt9ElBbZhe6jW2QPNOpy9aq1fbI/58x1yG8+e3hJuKrWzWyy4
         F/pbFfPceqCnvuVJtBaioBPyG3KRMljNAGMkRNdw+ksvxHqUjFPSI1j/BKOlt5EjChKK
         L1Fw==
X-Gm-Message-State: AOJu0YwlRS1uRbpBZ2NnuxukyXYykl/AYZYTfQu54JtXJMwCv1MjCh+v
	GMx4o+5YzPGJq3U6n26IfWy8Aw==
X-Google-Smtp-Source: AGHT+IEcQotQCjgDXMBBO6ccwZ9igg2/BW1u3BEgiE/Ihu0ulcuIV203Up+Cur0jM4vJZJIKO6KgBA==
X-Received: by 2002:a05:600c:5114:b0:405:4127:f471 with SMTP id o20-20020a05600c511400b004054127f471mr2532705wms.1.1696430083756;
        Wed, 04 Oct 2023 07:34:43 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b00401e32b25adsm1686205wmi.4.2023.10.04.07.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:34:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH 0/5] riscv: cleanup assembly usage of ENTRY()/END() and use local labels
Date: Wed,  4 Oct 2023 16:30:49 +0200
Message-ID: <20231004143054.482091-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_073447_934165_A963E864 
X-CRM114-Status: GOOD (  10.76  )
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

VGhpcyBzZXJpZXMgZG9lcyBhIGNsZWFudXAgb2YgYWxsIEVOVFJZKCkvRU5EKCkgbWFjcm9zIHRo
YXQgYXJlIHVzZWQgaW4KYXJjaC9yaXNjdi8gYXMgd2VsbCBhcyB1c2Ugb2YgbG9jYWwgbGFiZWxz
LiBUaGlzIGFsbG93cyB0byByZW1vdmUgdGhlCnVzZSBvZiB0aGUgbm93IGRlcHJlY2F0ZWQgRU5U
UlkoKS9FTkQoKS9XRUFLKCkgbWFjcm9zIGFzIHdlbGwgYXMgdXNpbmcKdGhlIG5ldyBTWU1fKigp
IG9uZXMgd2hpY2ggcHJvdmlkZSBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mIHdoYXQgaXMKbWVh
bnQgdG8gYmUgYW5ub3RhdGVkLiBTb21lIHdyb25nIHVzYWdlIG9mIFNZTV9GVU5DX1NUQVJUKCkg
YXJlIGFsc28KZml4ZWQgaW4gdGhpcyBzZXJpZXMgYnkgdXNpbmcgdGhlIGNvcnJlY3QgYW5ub3Rh
dGlvbnMuIEZpbmFsbHkgYSBmZXcKbGFiZWxzIHRoYXQgd2VyZSBtZWFudCB0byBiZSBsb2NhbCBo
YXZlIGJlZW4gcmVuYW1lZCB0byB1c2UgdGhlIC5MCnN1ZmZpeCBhbmQgdGh1cyBub3QgdG8gYmUg
ZW1pdHRlZCBhcyB2aXNpYmxlIHN5bWJvbHMuCgpOb3RlOiB0aGUgcGF0Y2hlcyBoYXZlIGJlZW4g
c3BsaXQgYmV0d2VlbiBhcmNoL3Jpc2N2LyBhbmQKYXJjaC9yaXNjdi9rdm0vIGR1ZSB0byBoYXZp
bmcgZGlmZmVyZW50IG1haW50YWluZXJzLgoKQ2zDqW1lbnQgTMOpZ2VyICg1KToKICByaXNjdjog
dXNlICIuTCIgbG9jYWwgbGFiZWxzIGluIGFzc2VtYmx5IHdoZW4gYXBwbGljYWJsZQogIHJpc2N2
OiBVc2UgU1lNXyooKSBhc3NlbWJseSBtYWNyb3MgaW5zdGVhZCBvZiBkZXByZWNhdGVkIG9uZXMK
ICByaXNjdjoga2VybmVsOiBVc2UgY29ycmVjdCBTWU1fREFUQV8qKCkgbWFjcm8gZm9yIGRhdGEK
ICByaXNjdjoga3ZtOiBVc2UgU1lNXyooKSBhc3NlbWJseSBtYWNyb3MgaW5zdGVhZCBvZiBkZXBy
ZWNhdGVkIG9uZXMKICByaXNjdjoga3ZtOiB1c2UgIi5MIiBsb2NhbCBsYWJlbHMgaW4gYXNzZW1i
bHkgd2hlbiBhcHBsaWNhYmxlCgogYXJjaC9yaXNjdi9rZXJuZWwvY29weS11bmFsaWduZWQuUyAg
ICAgICAgICAgIHwgIDggKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgICAgICAgICAg
ICAgICAgICAgfCAxOSArKystLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9mcHUuUyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgOCArLS0KIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyAgICAgICAgICAg
ICAgICAgICAgICB8IDMwICsrKysrLS0tLS0KIGFyY2gvcmlzY3Yva2VybmVsL2hpYmVybmF0ZS1h
c20uUyAgICAgICAgICAgICB8IDEyICsrLS0KIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4u
UyAgICAgICAgICAgICAgICB8IDIwICsrKy0tLS0KIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC5T
ICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKy0tLQogYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L3JldGhvb2tfdHJhbXBvbGluZS5TIHwgIDQgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmRf
ZW50cnkuUyAgICAgICAgICAgICB8ICA0ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL2ZsdXNo
X2ljYWNoZS5TICAgICAgICAgfCAgNCArLQogYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9nZXRjcHUu
UyAgICAgICAgICAgICAgIHwgIDQgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vcnRfc2lncmV0
dXJuLlMgICAgICAgICB8ICA0ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3N5c19od3Byb2Jl
LlMgICAgICAgICAgfCAgNCArLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyAgICAgICAg
ICAgICAgICAgIHwgMzIgKysrKystLS0tLS0KIGFyY2gvcmlzY3YvbGliL21lbWNweS5TICAgICAg
ICAgICAgICAgICAgICAgICB8ICA2ICstCiBhcmNoL3Jpc2N2L2xpYi9tZW1tb3ZlLlMgICAgICAg
ICAgICAgICAgICAgICAgfCA1NiArKysrKysrKystLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2xpYi9t
ZW1zZXQuUyAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQogYXJjaC9yaXNjdi9saWIvdWFj
Y2Vzcy5TICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKystLQogYXJjaC9yaXNjdi9wdXJnYXRv
cnkvZW50cnkuUyAgICAgICAgICAgICAgICAgIHwgMTYgKystLS0tCiAxOSBmaWxlcyBjaGFuZ2Vk
LCAxMjUgaW5zZXJ0aW9ucygrKSwgMTQxIGRlbGV0aW9ucygtKQoKLS0gCjIuNDIuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
