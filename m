Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E89C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iKs1GCyWvBTVvAhzVH+E1vJLUaWs8uH+Mm1QY8LsPgA=; b=AuO5UIzUrDoSbM
	oCEfjpBqEC2tLWrsGXk2UnbMpzLcnVlOulTMIFvZbyLaDx9WK+VZ0IfeO61Gweoo6sViQFZFuiWXF
	huvQ2Hz/HyYgc3tNDXBzEwOVEHNHvwfu4vIOkVthe2EhqbMiOXC738M24l9cyHydlCa/GroK+XR9O
	660YWxlNFNctboCkO/ngSUfwBIiFRxAXXd9U2eWhZbp8oy/dksRnuuPU+P1CdGRQP/j/X4GUsOBvh
	LRrpWtNAVgsR1R6U2Dgqgy0v29cPUJH/JzcA8FIe7Ev/N73kJ3mOiZ0DBCQojJSd+OvBQc6EQEvCa
	FmDq1u7HIxM9Xnk+bbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHRs-009wlU-1C;
	Tue, 24 Oct 2023 13:27:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHRo-009wjQ-34
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 13:27:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-408fd07bb78so2448265e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698154071; x=1698758871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7NxDbO7GUxLbtod+vtUf5vVuxdvzarRCEG44wnrlEM=;
        b=dd82eUWWUrfRCIB7xjhA2Sha6dC4WM1yhz+2a0Kdnh2IKvOvQZX1GrnS/DAFEmUDOa
         PH6e3W8tHf2gtESpBHBw0dSgfByEWoEEyFmE6ovvVm6iE5dJHH5wEl9tNY4FUZX+SnG1
         8EZ3kxVexWw/5HFD1PuiuiSVR/WP/Qors8/UeDBpGEY3r0NwRmQHAfEFlDdDdId5Um4a
         WqhWKagw3w3YXkELWThQKtmE/Jx10A+SZgZ/6HM0xFZn5A8pr9Vx6m+2ho0F7t58xJFf
         hT0n4Ysh1CmfAgomVR7rHIsMfDcBmx+8or9613Rb8CYmdiCVFn7JGrqUzy1g/zktuj6c
         KzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698154071; x=1698758871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7NxDbO7GUxLbtod+vtUf5vVuxdvzarRCEG44wnrlEM=;
        b=PmuQ9hySGiNTI+0KMe2yKs7TsoR9MqDgqsKUMrhZrBLsj9rEbAa0QRo6BvqBgz37xX
         GErJuc++sbXLtWhIY95MEiv9+ZTMCnPUfgUFZPPbWn3jxRy50DjZUKZpgO7J2MOIq3tN
         fAWSYOBFSpryfyzsgSaGouGoLuK8EywUWtj7FqwSRukYqqhcNcF2lUspc+EhLXlfDS+D
         UwrCrxJp2xcryHs8hi1JObHBdOW7+mVELHPSXjA0MTbPrLAR4CjDmndFu9S+I4AlIMA5
         JsuPjPVMOR4TbOF+gRmSxshTGy0Z2/foBKWgJJRxFefZY7Q/RVuULoN5aDYcS1HfKqTv
         3lPA==
X-Gm-Message-State: AOJu0YwPX6AXgYyu8jnmTT4UxUcuV3vPi7wXY90zmOJI3CCWq0uzCWPg
	9bmv4O6vHUj7CSHeXMLPLGXcNQ==
X-Google-Smtp-Source: AGHT+IH77/PUgfFp7lhNctpa+rJkehqrdIV97sCBXLPajMuJnwUEvoVFCh76kpQkxXAlg1/QWfUznw==
X-Received: by 2002:a05:600c:2293:b0:403:334:fb0d with SMTP id 19-20020a05600c229300b004030334fb0dmr9098071wmf.4.1698154071124;
        Tue, 24 Oct 2023 06:27:51 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:597d:e2c5:6741:bac9])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d4151000000b0032d87b13240sm10034964wrq.73.2023.10.24.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:27:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 0/5] riscv: cleanup assembly usage of ENTRY()/END() and use local labels
Date: Tue, 24 Oct 2023 15:26:50 +0200
Message-ID: <20231024132655.730417-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_062753_228505_780E0135 
X-CRM114-Status: GOOD (  11.32  )
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
bmcgZGlmZmVyZW50IG1haW50YWluZXJzLgoKLS0tCgpDaGFuZ2VzIGluIFYyOgogLSBSZW1vdmUg
ZHVwbGljYXRlZCBTWU1fRlVOQ19FTkQobWVtbW92ZSkKIC0gVXNlIFNZTV9EQVRBIGZvciBzaW1w
bGUgLnF1YWQgdXNhZ2UKIC0gQWRkZWQgQW5kcmV3IFJiOgoKQ2zDqW1lbnQgTMOpZ2VyICg1KToK
ICByaXNjdjogdXNlICIuTCIgbG9jYWwgbGFiZWxzIGluIGFzc2VtYmx5IHdoZW4gYXBwbGljYWJs
ZQogIHJpc2N2OiBVc2UgU1lNXyooKSBhc3NlbWJseSBtYWNyb3MgaW5zdGVhZCBvZiBkZXByZWNh
dGVkIG9uZXMKICByaXNjdjoga2VybmVsOiBVc2UgY29ycmVjdCBTWU1fREFUQV8qKCkgbWFjcm8g
Zm9yIGRhdGEKICByaXNjdjoga3ZtOiBVc2UgU1lNXyooKSBhc3NlbWJseSBtYWNyb3MgaW5zdGVh
ZCBvZiBkZXByZWNhdGVkIG9uZXMKICByaXNjdjoga3ZtOiB1c2UgIi5MIiBsb2NhbCBsYWJlbHMg
aW4gYXNzZW1ibHkgd2hlbiBhcHBsaWNhYmxlCgogYXJjaC9yaXNjdi9rZXJuZWwvY29weS11bmFs
aWduZWQuUyAgICAgICAgICAgIHwgIDggKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAg
ICAgICAgICAgICAgICAgICAgfCAxOSArKystLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9mcHUuUyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgOCArLS0KIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyAg
ICAgICAgICAgICAgICAgICAgICB8IDMwICsrKysrLS0tLS0KIGFyY2gvcmlzY3Yva2VybmVsL2hp
YmVybmF0ZS1hc20uUyAgICAgICAgICAgICB8IDEyICsrLS0KIGFyY2gvcmlzY3Yva2VybmVsL21j
b3VudC1keW4uUyAgICAgICAgICAgICAgICB8IDIwICsrKy0tLS0KIGFyY2gvcmlzY3Yva2VybmVs
L21jb3VudC5TICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKy0tLQogYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvYmVzL3JldGhvb2tfdHJhbXBvbGluZS5TIHwgIDQgKy0KIGFyY2gvcmlzY3Yva2VybmVs
L3N1c3BlbmRfZW50cnkuUyAgICAgICAgICAgICB8ICA0ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvL2ZsdXNoX2ljYWNoZS5TICAgICAgICAgfCAgNCArLQogYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by9nZXRjcHUuUyAgICAgICAgICAgICAgIHwgIDQgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28v
cnRfc2lncmV0dXJuLlMgICAgICAgICB8ICA0ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3N5
c19od3Byb2JlLlMgICAgICAgICAgfCAgNCArLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2gu
UyAgICAgICAgICAgICAgICAgIHwgMzIgKysrKystLS0tLS0KIGFyY2gvcmlzY3YvbGliL21lbWNw
eS5TICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICstCiBhcmNoL3Jpc2N2L2xpYi9tZW1tb3Zl
LlMgICAgICAgICAgICAgICAgICAgICAgfCA1NyArKysrKysrKystLS0tLS0tLS0tCiBhcmNoL3Jp
c2N2L2xpYi9tZW1zZXQuUyAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQogYXJjaC9yaXNj
di9saWIvdWFjY2Vzcy5TICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKystLQogYXJjaC9yaXNj
di9wdXJnYXRvcnkvZW50cnkuUyAgICAgICAgICAgICAgICAgIHwgMTYgKystLS0tCiAxOSBmaWxl
cyBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKSwgMTQzIGRlbGV0aW9ucygtKQoKLS0gCjIuNDIu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
