Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780A0C83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 19:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Pw6RAdBDKOcTU+3Vlo8GkomkzFMWxbw4jkkZXcfD/AY=; b=ybM
	Fq7uLXXDbAEmBhfFfbjnqC7jeNYcxjeSHyukIf9JqihyFw9GmRbCGmTl9OWYKxeLGhn0x+a6jDjPi
	tx5NusAZnKhxcyFkIs6NvN/1vlWmHuRprfaMyTJdha+QIM39KF+okFxIZThYAtq/J7VFdznXJISNt
	ud0/DM3266N9jZEe/oQ3DigQEgDeXO25PMTZvKl5xTHjiv4RcdpOAT4LZwYY12cPBUepyBtLc+FMz
	CFf1oXdi3J1BbqcvbQJeN1bzwInOcH38i0uNhHgYsTX3eA56+KjDBr7ryaeaoQIBqJ+EGPQQJxQ0e
	/sW6bV5dC1NS72X0NUc7Nd0HlzjTKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiNo-00ABuL-0W;
	Mon, 28 Aug 2023 19:58:44 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiNk-00ABtd-32
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 19:58:42 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-56fb25fdf06so2248477a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 12:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693252718; x=1693857518;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IbPpaVrfNq0ko2S3l1gP7OtKsP14DbcpFHAh7BgCC1A=;
        b=eee9/9wbtqwHBAG8KMk8MDEiwtL/oT3LgasRdCZtil3yifmuuVr59OGeOIdSHj+9oS
         8VJVtOskIxD4/MVztV31yHxshZsT1S7MCx+tbXjAiBskSK9KzPzp5q0DA869guvAOw7T
         ajEohkkAsS7Ny7SjIdGUPXSZqo8Lxm8JvEKLPeYK1Wnuu1mvI7VbpTL3UuN+E9/t2OEL
         3URtAnYPrYZADk8qJVa3283NQ+IZjtl/xHXXwxfYuYLzcoX6zUD5ZrGCy2iprPvmN5bO
         ITGZf5AeVuU8Yo6RCmdiNkfveD2V3fj/qlBdOTQMspt725YWRtOTftmseCE6fXN/bCzm
         9xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252718; x=1693857518;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbPpaVrfNq0ko2S3l1gP7OtKsP14DbcpFHAh7BgCC1A=;
        b=Fr1eugwVd4vyN1p0ZzbLLxcVTO+GfmxRJ9djMVdL6RELgt4uumf1noj4MmbvzcQFEu
         uAb7rg/NUhlc51/qkb/CCWIiGSHkxii/dekZ1MAUz/yt2iHmvsP8XiQdoSenyVJR3ysm
         +nJLrChILymq7YHIeH14z9mXWeM6z0N7bJTspjZXDcwZntf6Hgw2iMiPEdLHobMN7kxL
         3YPghckzl0bfqQXf7AOzXs8ZkwnFJPiwLy6yy2icn8POoq6cL3a6/hP0A/VwZx4viabK
         1642QhBHQ9wrtiZpeJMLS3O87TNGuk7MlDYoHirEGz+cwS6QLZ2qVxr+xnlEnWVEgWv4
         IPEA==
X-Gm-Message-State: AOJu0YzVRog/FqrefP5Wgxl82seep9Iwj1uN/Ip6N8zcipzv6XsKbAt/
	Q0fqF10Jai1TWwpnLmd3XoSvxehPHWTi4t+CZR8=
X-Google-Smtp-Source: AGHT+IHbkcWfdIY4Ud5PKH+QSr8+km87WDxWOUknjBIxSsOxtQJpHbg1H054vMbAlIhpwHOjgQSlqOs1z5/vUYrbGcU=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:7152:0:b0:564:9d36:f3e7 with SMTP
 id b18-20020a637152000000b005649d36f3e7mr4717640pgn.0.1693252718300; Mon, 28
 Aug 2023 12:58:38 -0700 (PDT)
Date: Mon, 28 Aug 2023 19:58:34 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3616; i=samitolvanen@google.com;
 h=from:subject; bh=6Rvbx1308s+7tjXG2s5CV+7L4mBaZXiG3+xmk9JfTWk=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk7PxpRPNPxUPxFo8LuUUSU8wq4G9knMzw+k5NT
 rP4Eh7i+O2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZOz8aQAKCRBMtfaEi7xW
 7qOqC/9xZRZK4p72DZMfeemNtGJ0wu3AlDuvHcU9nb6515rZA6CCB9kkTr9cW2XxQdFjgs7+LX5
 7oRvgylRappXjS2xL1+AZN1P4mI6IzYodAqfdhYcPJkGIBGCuhMTiBJDeX6nEmsoh4iWNMigmF8
 lTnFcvlIKQRqDjA7F0D0U2grbN5rOKhB6LF39fUWb+5bnV8wOaJLHVPkTHkeed3dVYoDmL9oHrJ
 RzRbdWujvAvlZ+LhbNLAU3J7RdMK4IGQ0GBpZ9iKyQpDKUXRNi0T+ujnFcBrhnTtTiBRf5phOiJ
 csRN4iSoh5nVZjU7dSp0flwQn4sZJB4d2KVOBb2SlPmenP46w0D2AzyhTqsaawt4bfr38ZddmKT
 L18JQYdx5TumB0eiVGP7pau5qCS9oYHiJXqVNcNSdLJOKMVDhJGRuhL8tgFe86gqnt+j8PyB1H5 vAfXRF5EtLz11F7pQ1l1tKH4MML6ngObfGdKtA+8xUpVjOkX9Q65TTvcRJQpkCybhNztw=
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230828195833.756747-8-samitolvanen@google.com>
Subject: [PATCH v3 0/6] riscv: SCS support
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_125841_000842_AEA9D645 
X-CRM114-Status: GOOD (  17.16  )
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

SGkgZm9sa3MsCgpUaGlzIHNlcmllcyBhZGRzIFNoYWRvdyBDYWxsIFN0YWNrIChTQ1MpIHN1cHBv
cnQgZm9yIFJJU0MtVi4gU0NTCnVzZXMgY29tcGlsZXIgaW5zdHJ1bWVudGF0aW9uIHRvIHN0b3Jl
IHJldHVybiBhZGRyZXNzZXMgaW4gYQpzZXBhcmF0ZSBzaGFkb3cgc3RhY2sgdG8gcHJvdGVjdCB0
aGVtIGFnYWluc3QgYWNjaWRlbnRhbCBvcgptYWxpY2lvdXMgb3ZlcndyaXRlcy4gTW9yZSBpbmZv
cm1hdGlvbiBhYm91dCBTQ1MgY2FuIGJlIGZvdW5kCmhlcmU6CgogIGh0dHBzOi8vY2xhbmcubGx2
bS5vcmcvZG9jcy9TaGFkb3dDYWxsU3RhY2suaHRtbAoKUGF0Y2ggMSBpcyBmcm9tIERlZXBhaywg
YW5kIGl0IHNpbXBsaWZpZXMgVk1BUF9TVEFDSyBvdmVyZmxvdwpoYW5kbGluZyBieSBhZGRpbmcg
c3VwcG9ydCBmb3IgYWNjZXNzaW5nIHBlci1DUFUgdmFyaWFibGVzCmRpcmVjdGx5IGluIGFzc2Vt
Ymx5LiBUaGUgcGF0Y2ggaXMgaW5jbHVkZWQgaW4gdGhpcyBzZXJpZXMgdG8KbWFrZSBJUlEgc3Rh
Y2sgc3dpdGNoaW5nIGNsZWFuZXIgd2l0aCBTQ1MsIGFuZCBJJ3ZlIHNpbXBseQpyZWJhc2VkIGl0
IGFuZCBmaXhlZCBhIGNvdXBsZSBvZiBtaW5vciBpc3N1ZXMuIFBhdGNoIDIgdXNlcyB0aGlzCmZ1
bmN0aW9uYWxpdHkgdG8gY2xlYW4gdXAgdGhlIHN0YWNrIHN3aXRjaGluZyBieSBtb3ZpbmcgZHVw
bGljYXRlCmNvZGUgaW50byBhIHNpbmdsZSBmdW5jdGlvbi4gT24gUklTQy1WLCB0aGUgY29tcGls
ZXIgdXNlcyB0aGUKZ3AgcmVnaXN0ZXIgZm9yIHN0b3JpbmcgdGhlIGN1cnJlbnQgc2hhZG93IGNh
bGwgc3RhY2sgcG9pbnRlciwKd2hpY2ggaXMgaW5jb21wYXRpYmxlIHdpdGggZ2xvYmFsIHBvaW50
ZXIgcmVsYXhhdGlvbi4gUGF0Y2ggMwptb3ZlcyBnbG9iYWwgcG9pbnRlciBsb2FkaW5nIGludG8g
YSBtYWNybyB0aGF0IGNhbiBiZSBlYXNpbHkKZGlzYWJsZWQgd2l0aCBTQ1MuIFBhdGNoIDQgaW1w
bGVtZW50cyBTQ1MgcmVnaXN0ZXIgbG9hZGluZyBhbmQKc3dpdGNoaW5nLCBhbmQgYWxsb3dzIHRo
ZSBmZWF0dXJlIHRvIGJlIGVuYWJsZWQsIGFuZCBwYXRjaCA1IGFkZHMKc2VwYXJhdGUgcGVyLUNQ
VSBJUlEgc2hhZG93IGNhbGwgc3RhY2tzIHdoZW4gQ09ORklHX0lSUV9TVEFDS1MgaXMKZW5hYmxl
ZC4gUGF0Y2ggNiBmaXhlcyB0aGUgYmFja3dhcmQtZWRnZSBDRkkgdGVzdCBpbiBsa2R0bSBmb3IK
UklTQy1WLgoKTm90ZSB0aGF0IHRoaXMgc2VyaWVzIHJlcXVpcmVzIENsYW5nIDE3LiBFYXJsaWVy
IENsYW5nIHZlcnNpb25zCnN1cHBvcnQgU0NTIG9uIFJJU0MtViwgYnV0IHVzZSB0aGUgeDE4IHJl
Z2lzdGVyIGluc3RlYWQgb2YgZ3AsCndoaWNoIGlzbid0IGlkZWFsLiBnY2MgaGFzIFNDUyBzdXBw
b3J0IGZvciBhcm02NCwgYnV0IEknbSBub3QKYXdhcmUgb2YgcGxhbnMgdG8gc3VwcG9ydCBSSVND
LVYuIE9uY2UgdGhlIFppY2Zpc3MgZXh0ZW5zaW9uIGlzCnJhdGlmaWVkLCBpdCdzIHByb2JhYmx5
IHByZWZlcmFibGUgdG8gdXNlIGhhcmR3YXJlLWJhY2tlZCBzaGFkb3cKc3RhY2tzIGluc3RlYWQg
b2YgU0NTIG9uIGhhcmR3YXJlIHRoYXQgc3VwcG9ydHMgdGhlIGV4dGVuc2lvbiwKYW5kIHdlIG1h
eSB3YW50IHRvIGNvbnNpZGVyIGltcGxlbWVudGluZyBDT05GSUdfRFlOQU1JQ19TQ1MgdG8KcGF0
Y2ggYmV0d2VlbiB0aGUgaW1wbGVtZW50YXRpb25zIGF0IHJ1bnRpbWUgKHNpbWlsYXJseSB0byB0
aGUKYXJtNjQgaW1wbGVtZW50YXRpb24sIHdoaWNoIHN3aXRjaGVzIHRvIFNDUyB3aGVuIGhhcmR3
YXJlIFBBQwpzdXBwb3J0IGlzbid0IGF2YWlsYWJsZSkuCgpTYW1pCgotLS0KCkNoYW5nZXMgaW4g
djM6CiAgLSBEcm9wcGVkIGEgbm93IHVubmVlZGVkIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIChwYXRj
aCAxKS4KICAtIFJlZmFjdG9yZWQgY2FsbF9vbl9pcnFfc3RhY2sgdG8gdXNlIHN0YWNrIGZyYW1l
IG9mZnNldHMKICAgIGJhc2VkIG9uIENsw6ltZW50J3Mgc3VnZ2VzdGlvbiAocGF0Y2ggMikuCiAg
LSBSZWJhc2VkIG9uIHRvcCBvZiB2Ni41LgoKQ2hhbmdlcyBpbiB2MjoKICAtIEZpeGVkIGFzbV9w
ZXJfY3B1IHdpdGggIUNPTkZJR19TTVAgKHBhdGNoIDEpLgogIC0gQWRkZWQgYSBmaXggdG8gdGhl
IENGSV9CQUNLV0FSRCBsa2R0bSB0ZXN0IChwYXRjaCA2KS4KICAtIFJlYmFzZWQgb24gdG9wIG9m
IC1yYzYuCgotLS0KCkRlZXBhayBHdXB0YSAoMSk6CiAgcmlzY3Y6IFZNQVBfU1RBQ0sgb3ZlcmZs
b3cgZGV0ZWN0aW9uIHRocmVhZC1zYWZlCgpTYW1pIFRvbHZhbmVuICg1KToKICByaXNjdjogRGVk
dXBsaWNhdGUgSVJRIHN0YWNrIHN3aXRjaGluZwogIHJpc2N2OiBNb3ZlIGdsb2JhbCBwb2ludGVy
IGxvYWRpbmcgdG8gYSBtYWNybwogIHJpc2N2OiBJbXBsZW1lbnQgU2hhZG93IENhbGwgU3RhY2sK
ICByaXNjdjogVXNlIHNlcGFyYXRlIElSUSBzaGFkb3cgY2FsbCBzdGFja3MKICBsa2R0bTogRml4
IENGSV9CQUNLV0FSRCBvbiBSSVNDLVYKCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDYgKysKIGFyY2gvcmlzY3YvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICB8ICAgNCArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggfCAgIDEg
LQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCAgICAgICAgICAgIHwgIDQxICsrKysrKysr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycV9zdGFjay5oICAgICAgfCAgIDMgKwogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zY3MuaCAgICAgICAgICAgIHwgIDU0ICsrKysrKysrKysrCiBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggICAgfCAgMTYgKystCiBhcmNoL3Jpc2N2
L2tlcm5lbC9hc20tb2Zmc2V0cy5jICAgICAgICAgfCAgIDkgKysKIGFyY2gvcmlzY3Yva2VybmVs
L2VudHJ5LlMgICAgICAgICAgICAgICB8IDEyNCArKysrKysrKysrKystLS0tLS0tLS0tLS0KIGFy
Y2gvcmlzY3Yva2VybmVsL2hlYWQuUyAgICAgICAgICAgICAgICB8ICAxOSArKy0tCiBhcmNoL3Jp
c2N2L2tlcm5lbC9pcnEuYyAgICAgICAgICAgICAgICAgfCAgNTYgKysrKystLS0tLS0KIGFyY2gv
cmlzY3Yva2VybmVsL3N1c3BlbmRfZW50cnkuUyAgICAgICB8ICAgNSArLQogYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgIHwgIDY4ICstLS0tLS0tLS0tLS0KIGFyY2gvcmlz
Y3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgICAgICAgICB8ICAgMiArLQogYXJjaC9yaXNjdi9wdXJn
YXRvcnkvTWFrZWZpbGUgICAgICAgICAgIHwgICA0ICsKIGRyaXZlcnMvbWlzYy9sa2R0bS9jZmku
YyAgICAgICAgICAgICAgICB8ICAxMyArKy0KIDE2IGZpbGVzIGNoYW5nZWQsIDI0OCBpbnNlcnRp
b25zKCspLCAxNzcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zY3MuaAoKCmJhc2UtY29tbWl0OiAyZGRlMThjZDFkOGZhYzczNTg3NWYyZTQ5
ODdmMTE4MTdjYzBiYzJjCi0tIAoyLjQyLjAucmMyLjI1My5nZDU5YTNiZjJiNC1nb29nCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
