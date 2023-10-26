Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67753C25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+PLy5xVIQTzFO760nJfPyjU87oN3L/Jy16I7Zr5zXkY=; b=1tn4b5MAdxAd6N
	H+OXceHr5Qjil8gmm5Tl+03NIF23TBwAl6W+h7fjghEshXtnIpX2msTWEfDH1S/fOH2p95B+k77sW
	xM2B41dJORsmGEAZjegT1s1ZDTnPwgNpx8jmgoZasgq8TL9+LHYV5IKGFkr02o0apnnosfgJwKA/Q
	BF3P9imnU5CtPj7/ub/iLjj+2FhbFOXN+8a1gRR7MhzNFOhz0ne9aIPs33eyfUH6jP80m6xcLqmg3
	LYw3LH0CrIPPLsYO6F9+y/ierDZT3lrzLjlNBd7UAqXu53MFxqen2I4GxMIR0mqFtvG5WGkUWAL4L
	6sLu+vh3PQvADhGcX5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1OY-00EgWT-2g;
	Thu, 26 Oct 2023 14:31:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1OU-00EgRR-1m
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:31:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32de9764793so106441f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698330687; x=1698935487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=704Flyy7JmjBNi+vrzBFMAfESwzm4xcRGzYRJGjJNUk=;
        b=VC4+If+XdRPy0rF9NHPEFANGlDkpZDl5dUXl8AjwqEJ6I+jZ0s2oog7LDnAEhGAiok
         1qwc+rUYxxBNQGWnO6DCXd+7EjYBdCymIX/1d5knvgGFrxUvilzWbnONQ1/bTvUOuKas
         B0lQ3HqE+gTW/3MauVlu+ImF5SuzPc2uRy/KdBdi7HHl14IfU6NhQgunLJ8P5YOnhwUW
         yx/1o2KmZyVc0Jtd1yNizUOPDzFw41Noi/hs8gsQ9FuMc5kvH7/kOqpt936kidFPai9a
         /yZlthLSROCjMmFtTZqWTMqVPB9MlbA1Tl6UHTrvAVwdrtuLAcmOItAyJAoZi4cLUM7q
         /scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330687; x=1698935487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=704Flyy7JmjBNi+vrzBFMAfESwzm4xcRGzYRJGjJNUk=;
        b=B0bLTV1eMKjsLMfEQCayOuLYRPsYVGEf1WIuHkvQthFoHn0psQzCJ58GasU1AEbNrd
         AccBMkywzgTg+skQ58e8z3j4nmbD0ZBPI2OXvWaXfXfhuc3vho5Kkx5s7F/PES8lEoIk
         YSo/edRINLaOAM3WdkIhAru8x2aOkYbbhed8kKfaNdfNzwbR0gp53YGxvAOgwT3HWsA8
         A66NZ5xr/Ncht9fBP/TMsUuYSjcwJIaJVnUsVxzxB3aQ7C93Qj5iBB3ul264m+Dn4NFN
         sXhq04muaGjZUJCK4xrqd1prYd4Yn7IWlmerMPG5ZBwzRZfPnvT5rliqXV3L08KvPrvk
         xKVg==
X-Gm-Message-State: AOJu0YyUO8HoBC0sWz14RrzvYYKJFpXY9tFDLpq9IU64AMIuADNoxSul
	J1+P52lfEF9wbw9s5WqhCVJHaQ==
X-Google-Smtp-Source: AGHT+IGGS8KnMtYMw9jVJnd0yOMEqJbxVZiWH5Aj4AZIhVK0vIfZ2PSwmXaPa8ekX7sIAeERTvK8aQ==
X-Received: by 2002:a05:6000:1e87:b0:32d:f126:5a57 with SMTP id dd7-20020a0560001e8700b0032df1265a57mr10474423wrb.3.1698330686591;
        Thu, 26 Oct 2023 07:31:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:b380:32be:257:5381])
        by smtp.gmail.com with ESMTPSA id r9-20020a056000014900b003232f167df5sm14316589wrx.108.2023.10.26.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:31:26 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] riscv: add support for SBI Supervisor Software Events
Date: Thu, 26 Oct 2023 16:31:19 +0200
Message-ID: <20231026143122.279437-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_073130_591538_D1311C03 
X-CRM114-Status: GOOD (  20.44  )
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
eSwgdGhlIGxhc3QgcGF0Y2gKYWRkIHN1cHBvcnQgZnJvIFNTRSBldmVudCBpbiB0aGUgU0JJIFBN
VSBkcml2ZXIuIElmIHRoZSBTU0UgZXZlbnQgaXMKYXZhaWxhYmxlIGZyb20gdGhlIFNCSSB0aGVu
LCBpdCB3aWxsIGJlIHVzZWQgaW5zdGVhZCBvZiB0aGUgbm9ybWFsCmludGVycnVwdC4KCkFtb25n
c3QgdGhlIHNwZWNpZmljIHBvaW50cyB0aGF0IG5lZWRzIHRvIGJlIGhhbmRsZSBpcyB0aGUgaW50
ZXJydXB0aW9uCmF0IGFueSBwb2ludCBvZiB0aGUga2VybmVsIGV4ZWN1dGlvbiBhbmQgbW9yZSBz
cGVjaWZpY2FsbHkgZHVyaW5nCmV4Y2VwdGlvbiBoYW5kbGluZy4gRHVlIHRvIHRoZSBmYWN0IHRo
YXQgdGhlIGV4Y2VwdGlvbiBlbnRyeQppbXBsZW1lbnRhdGlvbiB1c2VzIHRoZSBTQ1JBVENIIENT
UiBhcyBib3RoIHRoZSBjdXJyZW50IHRhc2sgc3RydWN0IGFuZAphcyB0aGUgdGVtcG9yYXJ5IHJl
Z2lzdGVyIHRvIHN3aXRjaCB0aGUgc3RhY2sgYW5kIHNhdmUgcmVnaXN0ZXIsIGl0IGlzCmRpZmZp
Y3VsdCB0byByZWxpYWJseSBnZXQgdGhlIGN1cnJlbnQgdGFzayBzdHJ1Y3QgaWYgd2UgZ2V0IGlu
dGVycnVwdGVkCmF0IHRoaXMgc3BlY2lmaWMgbW9tZW50LiBBIGZpeHVwLWxpa2UgbWVjaGFuaXNt
IGFsbG93cyB0byBtYXJrIHRoZQpsb2NhdGlvbiBvZiB0aGUgY3VycmVudCB0YXNrIHN0cnVjdCBk
ZXBlbmRpbmcgb24gdGhlIGVudHJ5IGxldmVsCih1c2VyL2tlcm5lbCkgYW5kIHRoZSBsb2NhdGlv
bi4gVGhpcyBpcyB0aGVuIHVzZWQgaW4gdGhlIFNTRSBhc3NlbWJseSB0bwpkZXRlcm1pbmUgd2hl
cmUgaXMgbG9jYXRlZCB0aGUgY3VycmVudCB0YXNrX3N0cnVjdC4KCkNvbnRyYXJ5IHRvIHBzZXVk
byBOTUkgWzJdLCBTU0UgZG9lcyBub3QgbW9kaWZpZXMgdGhlIHdheSBpbnRlcnJ1cHRzIGFyZQpo
YW5kbGVkIGFuZCBkb2VzIG5vdCBhZGRzIGFueSBvdmVyaGVhZCB0byBleGlzdGluZyBjb2RlLiBN
b3Jlb3ZlciwgaXQKcHJvdmlkZXMgInRydWUiIE5NSS1saWtlIGludGVycnVwdHMgd2hpY2ggY2Fu
IGludGVycnVwdCB0aGUga2VybmVsIGF0CmFueSB0aW1lIChldmVuIGluIGV4Y2VwdGlvbiBoYW5k
bGluZykuIFRoaXMgaXMgcGFydGljdWxhcmx5IGNydWNpYWwgZm9yClJBUyBlcnJvcnMgd2hpY2gg
bmVlZHMgdG8gYmUgaGFuZGxlZCBhcyBmYXN0IGFzIHBvc3NpYmxlIHRvIGF2b2lkIGFueQpmYXVs
dCBwcm9wYWdhdGlvbi4gQWRkaXRpb25hbGx5LCBTU0UgZXZlbnQgaGFuZGxpbmcgaXMgZmFzdGVy
IHRoYXQgdGhlCnN0YW5kYXJkIElSUSBoYW5kbGluZyBwYXRoIHdpdGggYWxtb3N0IGhhbGYgZXhl
Y3V0ZWQgaW5zdHJ1Y3Rpb24gKDcwMCB2cwoxNTkwKS4gU29tZSBjb21wbGVtZW50YXJ5IHRlc3Rz
L3BlcmYgbWVhc3VyZW1lbnRzIHdpbGwgYmUgZG9uZS4KCkZvciB0ZXN0aW5nIHB1cnBvc2UsIG9u
ZSBjYW4gdXNlIHRoZSBwcm92aWRlZCBTQkkgaW1wbGVtZW50YXRpb24gYXQgWzNdLgpUaGlzIHNl
cmllcyBhbHNvIG5lZWRzIHBhdGNoIFs0XSB0byBmaXggYSBidWcgaW4gdGhlIFBNVSBkcml2ZXIu
CgpMaW5rOiBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJzL21lc3NhZ2UvNTE1IFsx
XQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMDIzMDgyOTExLjIzMjQy
LTEwLWx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20vVC8gWzJdCkxpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXZvc2luYy9vcGVuc2JpL3RyZWUvZGV2L2NsZWdlci9zc2UgWzNdCkxpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMzEwMjYwODQwMTAuMTE4ODgt
MS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLyBbNF0KCi0tLQoKQ2zDqW1lbnQgTMOpZ2VyICgzKToK
ICByaXNjdjogYWRkIFNCSSBTU0UgZXh0ZW5zaW9uIGRlZmluaXRpb25zCiAgcmlzY3Y6IGFkZCBz
dXBwb3J0IGZvciBTQkkgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVudHMgZXh0ZW5zaW9uCiAgcGVy
ZjogUklTQy1WOiBhZGQgc3VwcG9ydCBmb3IgU1NFIGV2ZW50CgogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hc20tcHJvdG90eXBlcy5oIHwgICA1ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2Jp
LmggICAgICAgICAgICB8ICA0MCArKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zc2UuaCAgICAg
ICAgICAgIHwgIDk0ICsrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAg
ICAgfCAgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyAgICAgICAgIHwgIDE3
ICsKIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgICB8IDE1NiArKysrKysr
KwogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICAgICAgICAgICAgIHwgICA0ICsKIGFyY2gv
cmlzY3Yva2VybmVsL3NzZS5jICAgICAgICAgICAgICAgICB8ICA5NyArKysrKwogYXJjaC9yaXNj
di9rZXJuZWwvc3RhY2t0cmFjZS5jICAgICAgICAgIHwgIDEzICsKIGFyY2gvcmlzY3Yva2VybmVs
L3ZtbGludXgubGRzLlMgICAgICAgICB8ICAgNiArCiBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcg
ICAgICAgICAgICAgICAgfCAgMTAgKwogZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZSAgICAgICAg
ICAgICAgIHwgICAxICsKIGRyaXZlcnMvZmlybXdhcmUvcmlzY3Zfc3NlLmMgICAgICAgICAgICB8
IDQ5NiArKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgICAgICAgICAgICB8ICA1MSArKy0KIGluY2x1ZGUvbGludXgvcmlzY3Zfc3NlLmggICAgICAg
ICAgICAgICB8ICA1NiArKysKIDE1IGZpbGVzIGNoYW5nZWQsIDEwMzggaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NzZS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvc3NlLmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2X3NzZS5jCiBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9saW51eC9yaXNjdl9zc2UuaAoKLS0gCjIuNDIuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
