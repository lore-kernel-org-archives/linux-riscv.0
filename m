Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46580E77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 01:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tkk8mU6I3oJrvBEOBgKjqLKXlj7FDHCvYvvt2ucYRtQ=; b=HxS8a7towpPEd3
	QivWGqZI8Ncl1o+mKlCKoPJ03q38ggpuoalHKYfjEecv44+edMZhc7ewdVJswvaEl1Qd7lSmFsX33
	MqVyXY4VJpmvANEafuo+iiN4J56AlOv/Y+yUzOR7XOnDiggHL503tadfen0FDQhK54fTpA/gZgKR/
	R7YQE+UXpBR7YW59PVmlXKAB4tSgUG4LkpziezokZLEBy2H3hoyswGLEAl4ogNWkZaYBEWwuo/hoC
	nBTZI2FkX0/QvVG+zwRdsSfEa76Ekii5Vs5T0lwHuGBszxNHYPv5445hcmC5Q7th3fLplMqn4akf4
	TCW5dLbapYX+6Y45sQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQg7-0000000HX4h-3J3y;
	Sat, 11 Jan 2025 01:52:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPeb-0000000HPrM-0j6U
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:47:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so3714472a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736556424; x=1737161224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4h+oYTtB9STcgJt5s9KFyAqha4KcHVl9vU+KomymzjA=;
        b=bOGqELMmdQoRrTLaT7i4OBJ9SV2Y+0nOu+UYfPwPq+vSqn4T4kff9Ml/R3Uo7w0Cqh
         myI73bf8LShb0KGUuUf06pBD0NH5PSgVdVLnSojALr25R10ONhxqcXKJf+oU0atMTp4f
         l735/S07CcE77epRxHzCEC6aaKIu6S6Ax4Qw6YkB3+HeyPQV7PtJ4m5N50NGlmd+NX38
         J76HMNYCB2n2F8OQ4Gk9p9QFvexBFuJ0c5MTrC0FiU3cKxmcvLEgOstwpe7ndEMB/Ser
         73Ohw3rLjHEuNetCPCvbup+MqMyBwc9PoJGSYXRzoJBe+X3NrfC84bD6kMa3KixpfSln
         oMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556424; x=1737161224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h+oYTtB9STcgJt5s9KFyAqha4KcHVl9vU+KomymzjA=;
        b=h5mSem5P3/vabIlC4pROzbRgiBPDOzSJHFVKQyCUsbP4A+evMBpJH+ZFtmOO4maNeH
         avQ9HTAcfKzNVTg/yZNL3sjy5VO5KlpT/GXk25nOf0B+QAR8F8BuaHkva7y/6lV4wuhp
         1qPqg1pfukBMhdcpFhhfbZDWSVjtNyN1M9yqDFU+Pgz/J06xWkE9llCxYE1UlEAKYSHI
         0rdcKFTV+Mxiebue1CtMh+bYJnkKBPr6BfPL5LAIT5pq+aFsPXXOP+iw6CITy3TyOJne
         1AoPelxA8NtLRGMjQ5ujJpuWFX93ZYetqWDJq4u+ZoxKI7I6cLebS4gzngGn6oZy4aHp
         4guA==
X-Forwarded-Encrypted: i=1; AJvYcCX8iHs2qPPbAichE0dzmmoVDu91kf6nqgRscOlv1WaqPjo14NIQd9ztDNdMLiQGBRG3fS1OLSIb7yIufg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvC5cB56oZNxHRgbj6NUCZQIBZbCasCaxVM3gDLO4SEmlju5dL
	X+rINC97JQnFMGy68LrQz9SNGFrMjfcPEaiuMFiLWAqy2+bEDYFKUYatT2qMY2Q=
X-Gm-Gg: ASbGnctJGMN9rdISxuW4YCnS9OYeWh4nCUudHZ6S4X60qo+LheuDJNFxfhab7z7H0HP
	6GgpAQY3Yhis8UQ+zyp2Dt3yy9hgVygKzofvha+QclNh4b1b95h4tjf+HAAqPfuA+ID9Q6VUVP6
	xTjR55c+AxVDvDsc1o83eje4ui2yG1q0vkwIgKmP2AjYnubxQ+qnQiksYGhBnDN7culp/36vlkU
	x45wc3jE1+Q23hvqPjZxhktA4kr4IpBUGV3eQa8DoE4tbRsKM5RB+8i9tJvosMWeB2vRC+Hj/2u
	zvg=
X-Google-Smtp-Source: AGHT+IHAZr0xNEPgPAWybCIes9Jl2csw7eIRzGzKkykORR+Jkm5P3UKWnrgjOIPEypC2vNZx8PlCXA==
X-Received: by 2002:a17:90b:2588:b0:2ee:c9b6:c26a with SMTP id 98e67ed59e1d1-2f548eae05amr18861868a91.11.1736556424149;
        Fri, 10 Jan 2025 16:47:04 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a28723esm6064295a91.19.2025.01.10.16.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 16:47:03 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] RISC-V: KVM: Pointer Masking Support
Date: Fri, 10 Jan 2025 16:46:57 -0800
Message-ID: <20250111004702.2813013-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_164705_227591_5172FB1A 
X-CRM114-Status: UNSURE (   7.63  )
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

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBwb2ludGVyIG1hc2tpbmcgaW4gVlMtbW9kZSBp
bnNpZGUgS1ZNCmd1ZXN0cyB1c2luZyB0aGUgU0JJIEZXRlQgZXh0ZW5zaW9uLiBUaGlzIHNlcmll
cyBhcHBsaWVzIG9uIHRvcCBvZgpDbMOpbWVudCdzICJyaXNjdjogYWRkIFNCSSBGV0ZUIG1pc2Fs
aWduZWQgZXhjZXB0aW9uIGRlbGVnYXRpb24gc3VwcG9ydCIKc2VyaWVzWzFdLCB3aGljaCBhZGRz
IHRoZSBuZWNlc3NhcnkgaW5mcmFzdHJ1Y3R1cmUuCgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjUwMTA2MTU0ODQ3LjExMDAzNDQtMS1jbGVnZXJAcml2b3NpbmMu
Y29tLwoKClNhbXVlbCBIb2xsYW5kICgyKToKICBSSVNDLVY6IEtWTTogRml4IGluY2x1c2lvbiBv
ZiBTbW5wbSBpbiB0aGUgZ3Vlc3QgSVNBIGJpdG1hcAogIFJJU0MtVjogS1ZNOiBBZGQgc3VwcG9y
dCBmb3IgU0JJX0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOCgogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oIHwgIDIgKwogYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVy
ZWcuYyAgICAgICAgICAgICAgIHwgODQgKysrKysrKysrKysrKystLS0tLS0tLQogYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfZndmdC5jICAgICAgICAgICAgIHwgNzAgKysrKysrKysrKysrKysrKyst
CiAzIGZpbGVzIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKCi0t
IAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
