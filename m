Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A2AC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fq5UZHre4hrIN6pQ9BxYwYqNX+FXqPV/hiIj3Ngc/qc=; b=yAJhSWNBbSsC8Q
	m1RrlpZAKv3QOIj1f2kUl+J/oDqdlSx+l4vs9cPZN6CfMmbSirta0oulo4rOcSbIyesEwkbI0IbXc
	rikidDhox+9RmiGOMn4wF9SEfCHTaTj4ZmIEdHZs+5TDJq0HTMm/95Jq23yfNnb3dh6DPOOgCL1fa
	dy84StJ4SRCxyuIwsh+SoAOE6pCefng6VF0vIZ+q4H1DcOBccIYbFOqPzvZX8YKwc2e0MCeOQ/IsD
	8N+G6BWXmL+T+1f+++OHqlVekHgZoWhl5JzBlmkz+qvaqIdy9NgzCJz2sNL2DAAWeqV0UOb7ggyUz
	gi2IKaffO1GPCmPEVdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFUw-0000000HSOR-2QQW;
	Tue, 23 Apr 2024 12:43:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFUt-0000000HSLh-0NIr
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34801b1bc4aso947578f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876220; x=1714481020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9WxKxISE98J4DR8ayongvF0iJ3p8rHkiA1LnrlMpVw=;
        b=Bck32+4jiDGGQvcF51AW/HgoWtmWGH7Jzg5hkOwNq/2JwY3RIIWbD09cqW81DDt8tK
         tWmp+1S9OGh3J7UtTeK7VZCAhB7bIhHQ8R2XpkcUJLI2uk6X6QQ71baZbE2spF5muhTs
         6ylepPhpdMWX4P5fbTSpwr9IlfViLcUtF6+W1KEfA7PMsIER9bz7e1IaIFCCIw2zRhE8
         LmearvP6dj+u9WyZETSGyjuHW87hp1lSW2sIKAwAi0pl9LRksbFuMX76ijQOiPeDUBRC
         lvrqpX2/joBa2BWAhjhVqw0YwP1lMUoPadXrTYImIjiJtR9/aoaslt/g9rbBOIf6AyAw
         YEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876220; x=1714481020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9WxKxISE98J4DR8ayongvF0iJ3p8rHkiA1LnrlMpVw=;
        b=UAJVaOjVbQWJyRIbCJLFi1/LnH5izQtTEbLoh4gtbKeLkQI2QTdvigV0XKC46j0Hv9
         kC3LM4iMG58PKV+8kp/IgsHe4y/UyYpFdpiebysz8+jaGnXSleNNQCh0VZFR9wdR6/9v
         WBd9Towyu7Osw/3Etb/izBZ1Vzql1ocvR4N74Ykk6z5pO5dl37Sj954z1uoyR5b329aT
         HOZ3Rt3h/aePDH+AmmZ1ND0FgtLiUNov7q6m8Org5rRtxW/R0nHoKd6nj5Zovud3GOgp
         EdftGGQRd8vc7dYn16jMdy19RAjLOrmKadevuxdKgOysc47enyZTLTMUeVE8zUf+KM6C
         v41w==
X-Forwarded-Encrypted: i=1; AJvYcCUtjDLARY0lJFyuAV/KDOR6+r6nQUcb6j2fMwIdJHr2EPsZO48ykBki2URPOrE5YZvliJ3sqcgL60tqshhekYi+G4920b9R/bLP2QxH9Iob
X-Gm-Message-State: AOJu0Yz+y4QoYap8SuNvvlfLrlTteVV2gMuhgEcVoR0M2r8669ndNQk9
	QCv3olEnFozflWc2ZoIkCy1i9WbdZpQkOHYiAM5WY2ofDlB1RHigTGL+GKufIcc=
X-Google-Smtp-Source: AGHT+IHpI2Tpv9REfejw04rEmQ/PVuDNtz+wncAv+sSz/yClI0MXsOsXH9hJ+L4XIOgzD6O4fSViLQ==
X-Received: by 2002:a05:600c:1c90:b0:41a:b9a1:3ecc with SMTP id k16-20020a05600c1c9000b0041ab9a13eccmr1166991wms.3.1713876220072;
        Tue, 23 Apr 2024 05:43:40 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3 00/11] Add support for a few Zc* extensions as well as Zcmop
Date: Tue, 23 Apr 2024 14:43:14 +0200
Message-ID: <20240423124326.2532796-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054343_162297_AA0C71B9 
X-CRM114-Status: UNSURE (   9.30  )
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

QWRkIHN1cHBvcnQgZm9yICh5ZXQgYWdhaW4pIG1vcmUgUlZBMjNVNjQgbWlzc2luZyBleHRlbnNp
b25zLiBBZGQKc3VwcG9ydCBmb3IgWmNtb3AsIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNp
b25zIGlzYSBzdHJpbmcgcGFyc2luZywKaHdwcm9iZSBhbmQga3ZtIHN1cHBvcnQuIFpjZSwgWmNt
dCBhbmQgWmNtcCBleHRlbnNpb25zIGhhdmUgYmVlbiBsZWZ0Cm91dCBzaW5jZSB0aGV5IHRhcmdl
dCBtaWNyb2NvbnRyb2xsZXJzL2VtYmVkZGVkIENQVXMgYW5kIGFyZSBub3QgbmVlZGVkCmJ5IFJW
QTIzVTY0LgoKU2luY2UgWmMqIGV4dGVuc2lvbnMgc3RhdGVzIHRoYXQgQyBpbXBsaWVzIFpjYSwg
WmNmIChpZiBGIGFuZCBSVjMyKSwgWmNkCihpZiBEKSwgdGhpcyBzZXJpZXMgbW9kaWZpZXMgdGhl
IHdheSBJU0Egc3RyaW5nIGlzIHBhcnNlZCBhbmQgbm93IGRvZXMKaXQgaW4gdHdvIHBoYXNlcy4g
Rmlyc3Qgb25lIHBhcnNlcyB0aGUgc3RyaW5nIGFuZCB0aGUgc2Vjb25kIG9uZQp2YWxpZGF0ZXMg
aXQgZm9yIHRoZSBmaW5hbCBJU0EgZGVzY3JpcHRpb24uCgpUaGlzIHNlcmllcyBpcyBiYXNlZCBv
biB0aGUgWmltb3Agb25lIFsxXS4gQW4gYWRkaXRpb25hbCBmaXggWzJdIHNob3VsZApiZSBhcHBs
aWVkIHRvIGNvcnJlY3RseSB0ZXN0IHRoYXQgc2VyaWVzLgoKTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA0MDQxMDMyNTQuMTc1MjgzNC0xLWNsZWdlckByaXZv
c2luYy5jb20vIFsxXQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MDkx
NDM4MzkuNTU4Nzg0LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8gWzJdCgotLS0KCnYzOgogLSBGaXgg
dHlwbyAiZXhpc3RzIiAtPiAiZXhpc3QiCiAtIFJlbW92ZSBDIGltcGxpZXMgWmNhLCBaY2QsIFpj
ZiwgZHQtYmluZGluZ3MgcnVsZXMKIC0gUmV3b3JrIElTQSBzdHJpbmcgcmVzb2x2ZXIgdG8gaGFu
ZGxlIGRlcGVuZGVuY2llcwogLSB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQw
NDE4MTI0MzAwLjEzODc5NzgtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKdjI6CiAtIEFkZCBaYyog
ZGVwZW5kZW5jaWVzIHZhbGlkYXRpb24gaW4gZHQtYmluZGluZ3MKIC0gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA0MTAwOTExMDYuNzQ5MjMzLTEtY2xlZ2VyQHJpdm9zaW5j
LmNvbS8KCkNsw6ltZW50IEzDqWdlciAoMTEpOgogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpj
YSwgWmNmLCBaY2QgYW5kIFpjYiBJU0EgZXh0ZW5zaW9uCiAgICBkZXNjcmlwdGlvbgogIHJpc2N2
OiBhZGQgSVNBIGV4dGVuc2lvbnMgdmFsaWRhdGlvbgogIHJpc2N2OiBhZGQgSVNBIHBhcnNpbmcg
Zm9yIFpjYSwgWmNmLCBaY2QgYW5kIFpjYgogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmNhLCBa
Y2YsIFpjZCBhbmQgWmNiIElTQSBleHRlbnNpb25zCiAgUklTQy1WOiBLVk06IEFsbG93IFpjYSwg
WmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZvciBHdWVzdC9WTQogIEtWTTogcmlzY3Y6IHNl
bGZ0ZXN0czogQWRkIHNvbWUgWmMqIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QKICBk
dC1iaW5kaW5nczogcmlzY3Y6IGFkZCBaY21vcCBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCiAg
cmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFpjbW9wCiAgcmlzY3Y6IGh3cHJv
YmU6IGV4cG9ydCBaY21vcCBJU0EgZXh0ZW5zaW9uCiAgUklTQy1WOiBLVk06IEFsbG93IFpjbW9w
IGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBaY21v
cCBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlz
Y3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgMjQgKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8ICA5MCArKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NwdWZlYXR1cmUuaCAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oICAgICAgICAgICAgICAgIHwgICA1ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9od3Byb2JlLmggICAgICAgICB8ICAgNSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20va3ZtLmggICAgICAgICAgICAgfCAgIDUgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jICAgICAgICAgICAgICAgIHwgMjQ5ICsrKysrKysrKysrKy0tLS0tLQogYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAgICAgIHwgICA1ICsKIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8ICAxMCArCiAuLi4vc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgMjAgKysKIDEwIGZpbGVzIGNoYW5nZWQs
IDMyOSBpbnNlcnRpb25zKCspLCA4NSBkZWxldGlvbnMoLSkKCi0tIAoyLjQzLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
