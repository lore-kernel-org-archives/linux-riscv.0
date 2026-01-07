Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15745CFD65E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUwSDQxkeB5rpTMhXa4x+NY92QH4AkAb/+BU6Off6Tc=; b=RQlYRKea5Bl3n5
	ZZBVeU30IiJIypy8oKRh8Mc70bBtD8rRf0ocVGI8OJK8FHGLdKVeSSamP/sTWYj9Fd/IjbSmSiBr7
	7oFHJa0GRbHUW6CHm/d1cAlpg0yAvmxMwMoHpZnDGAHY3ZQkbnEE4pvKLV3/mWoE2VXkFGMGHepgg
	QRwYINMx/3IiedF+bv4BvxLTX/r8mnZuMO16Z3xkPcgUcysrJjEA4+lBSjUnQk4Z7Aw1LLYBYTPtA
	wT5ngCsssMQsZuvL/BIwEDJmwe9VeqQ+XQr3zCmjYCOlmMTGgLquozOLa25MHJUjgo5VTvtKSwnnl
	0AufH9bbO4tNclhymufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPy-0000000FI1e-4AMj;
	Wed, 07 Jan 2026 16:29:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPr-0000000FHug-3tVK
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43277900fb4so432178f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803386; x=1768408186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WihJclLNTP76N6hz6eqMpZoD5cMEZ14VPXp1pd6gG3I=;
        b=th45UsWnELsYxyv8Ry5gyRFtMyTdKbhJfm7jm9PjcNNelzlVhii/D7/1uMmMi+iqEY
         DYSIp1Jla9W2h1c4s8E3ualZpTqiaz3rM0WtgvwauXqA2p3DCOsqGcUO8x+qFso+NWin
         uH3HsaibLV1DZSR9thJydKvlOUmgI4oLKkyNJX+EetSNxaZEH6tToLRiUFY218kuf46I
         ljm3yR4GZbHIYmF/L3QO7UzAIOVAr4CZJSOIn2yxcdbmbjtzgcMi3aVzA+FlYw7Ya4Oz
         u1CFX/BYIOA1fKJBJ6ly7LC7gtUPztVq21qy8C1cPAQsHFmR6eC09jWosyYLCtbeck3A
         aAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803386; x=1768408186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WihJclLNTP76N6hz6eqMpZoD5cMEZ14VPXp1pd6gG3I=;
        b=FHm3MjG/gGinDxYWd5hDm77SHBQc2oaP9o2IaeVRsH8H1oWEWYEyl/xfB2wQSQAh7Z
         K3Qa3m8lXURGflmlp66y2UzF0WWhtTYCdGsy4HY3Xe5pr8WNlBsO2bWykd40L8Mi8woS
         kYH7Zr395KENU2DRRwIA3yfh1380/lVsfVela4s9PqhIbMeJM3xRpMuvtyhFSytfAQ8M
         ETvAG4JrY1d/iZr3FLAD7acVS+LkNMRP3rAw8V9g/I0IjcMJBTsXWpdMvC/MTfTMg/6f
         rWgQlf9Jd61wAcT+DtVNpzQ6U7gz2EWpHvuJCDQXFqXuCJBxSsE0ls+L5j119D8zeJQh
         gx0A==
X-Forwarded-Encrypted: i=1; AJvYcCV1z6mevz5w+g7Ip3X8n523IID92rk21I6ntlLRJtw6pwtwcEOx42QSS79z4TAdARPJSL8v7w+t0y7Wgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE2K6E/Uw+omsziMgfwId2bzrqhouXbrjKg4/9QUbK0DVn4WW8
	ZbLaYNzHE6MhLw7V1I0Met+6pfii4B/BNcKWcZ8P9Na24tKAWn9RLBz3sR9ergvy53gn
X-Gm-Gg: AY/fxX4/G9H4amHvnkHeWrIxjGcBP6z0OSgMr7aAc0nWPPkPxJlW6PcnYfnlgK2kDi+
	3ewadh6NQgaoMiDPCol25doHkJ3U5WN6wLszc4BCNtug/Ymid10lf7nprOf3UjW8ED+ZeObJnQl
	c/Xhna8TebdSVqKU3qctt0QeXuvQk14MarH6kMvvFitYoGKeXhMf25hvxgcrCti1e6UQqScFibj
	V7HpB1eWdBaMF+RjRBnNOrgErGUma4CBvx8YEY8wSlXgLXbaYYvkEyXgIP79Hem2Mmr3kpNdJec
	D/BQxk5hvEiticTh2kO8aLe+AlD7szQ4CkJ0jfhfdmT14lb6t1b1L+PD4mQF7HKW7Aj5AO/oo+s
	PbC70PFCcfDHR2hPC26PRnKjrpMFBfguPjxMKOKSL3fWr6I5niACERTH7p97LTN6csrp27WICUQ
	dy7rK3j4DuObOI5UVtrg==
X-Google-Smtp-Source: AGHT+IFKD1+c7SUjD7a/gByTTs7FpF1prAJlqO9osr5dmkMQRiIqO+8yFt3RtGpmL0uKFm0/tPDRBQ==
X-Received: by 2002:a05:6000:a88:b0:432:c0b8:ee42 with SMTP id ffacd0b85a97d-432c0b8ef25mr5297882f8f.11.1767803385887;
        Wed, 07 Jan 2026 08:29:45 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:45 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 6/6] MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT bindings
Date: Wed,  7 Jan 2026 16:28:29 +0000
Message-ID: <20260107162829.416885-7-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082949_747467_F98D1857 
X-CRM114-Status: UNSURE (   8.01  )
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

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKQWRkIE1BSU5UQUlO
RVJTIGVudHJpZXMgZm9yIGFsbCB0aGUgQmFvIGh5cGVydmlzb3IgY29tcG9uZW50cy4KClNpZ25l
ZC1vZmYtYnk6IEpvw6NvIFBlaXhvdG8gPGpvYW9wZWl4b3RvQG9zeXgudGVjaD4KLS0tCiBNQUlO
VEFJTkVSUyB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBkYzczMWQz
N2M4ZmUuLjQyODZlZmIzMDdiOCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRB
SU5FUlMKQEAgLTQzMjEsNiArNDMyMSwxOSBAQCBGOglkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC8K
IEY6CWluY2x1ZGUvbGludXgvYmFja2xpZ2h0LmgKIEY6CWluY2x1ZGUvbGludXgvcHdtX2JhY2ts
aWdodC5oCiAKK0JBTyBIWVBFUlZJU09SCitNOglKb3PDqSBNYXJ0aW5zIDxqb3NlQG9zeXgudGVj
aD4KK006CURhdmlkIENlcmRlaXJhIDxkYXZpZG1jZXJkZWlyYUBvc3l4LnRlY2g+CitNOglKb8Oj
byBQZWl4b3RvIDxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+CitTOglNYWludGFpbmVkCitGOglEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvLworRjoJYXJjaC9hcm0vaW5jbHVkZS9h
c20vYmFvLmgKK0Y6CWFyY2gvYXJtNjQvaW5jbHVkZS9hc20vYmFvLmgKK0Y6CWFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYmFvLmgKK0Y6CWRyaXZlcnMvdmlydC9iYW8KK0Y6CWluY2x1ZGUvbGludXgv
YmFvLmgKK0Y6CWluY2x1ZGUvdWFwaS9saW51eC9iYW8uaAorCiBCQVJDTyBQNTAgR1BJTyBEUklW
RVIKIE06CVNhbnRvc2ggS3VtYXIgWWFkYXYgPHNhbnRvc2hrdW1hci55YWRhdkBiYXJjby5jb20+
CiBNOglQZXRlciBLb3JzZ2FhcmQgPHBldGVyLmtvcnNnYWFyZEBiYXJjby5jb20+Ci0tIAoyLjQz
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
