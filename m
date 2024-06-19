Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60C6C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9tiJ81fOa4y94l6gZ29Skdb9B94OGZB+isor0JLPqiI=; b=VooW+wsYIWZyuy
	5JCiEUmUZlImRGoyy4vc693hFA3RRubwtq2q6ST3rKaEP5BRDKhVNB9bTb3RHLBYOYQ0NcYCCEYIe
	Fyg7qKRFMhMGE1KsBjWHtYlJU+7PXpNgJWBrMNdi9/qYVKIQx/0miJ4YP9cOcu78g8cguUjIR6R5l
	M0Re6zSb7u0xyP51GuvGjtUfRZKUW0j1ALL1VQof3ZgCkSX6G3qCWtC0VLsHkb6zVKAIqBLiO57dQ
	vjJ3FKSFfcsp3zXbnZjxPkjsjPPhD+gSNQdRgMPW7ScmzzrFW94hOu+f5AXjDM5vyRuRc2ZTcJool
	x93tgyTbGS69GrbnO9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxQy-00000001qWo-2bKM;
	Wed, 19 Jun 2024 15:41:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxQu-00000001qSn-37Ix
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 15:41:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42181803bf2so4909085e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811670; x=1719416470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sG05QgwdQ7sARDUt4CTUt6qfEG9g0T59arCJfjRkJ9s=;
        b=t9lgcHmSlMktd63WCmxBDs6nAbRb5K5XRlPWto7PbsBK9c4+c66tKfcUO95hd+bB3F
         LSmVuHJEOElbfwMEQFwaTcOw8xOyu+dShvt5RVkZQ5b4SGGsqhSGQt15zOg32BfZNIOU
         6I8kAQ58siQLqOyT783L7UFyiWqcQh6l8AKXIYULJDgIFlYp294Ov3BkxWA1mH358vcU
         rGO5FEmBNCqwcPwTg2xGxJl0rM7OFNYnlke1rfxhzkXRirr0C5SjBIgZZEWvKr9mh4qp
         0mNPgTSk6IwLY9ADrpizHWdQMwuYrs7GHJx+V+Rg2QXv5c6071TnxiaFKZKqxzigipGl
         Xotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811670; x=1719416470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG05QgwdQ7sARDUt4CTUt6qfEG9g0T59arCJfjRkJ9s=;
        b=FOdpWT0jUAT0NqjwF9MKgTrr8dVc7/UfYi641xDMP+Vz9XlcAHOgkBebRAXAwv+PMx
         hOmITd8ugHwwrWUcf5wKlzOppn34WzDK+I3xU1Q0pKn5TyKbPJPypBS2YmW7EBOuysaT
         WJ24sZH+p1eCpfTfgjP3QlzhVEF7MRM80tm7n9TMOg0D+zpuCRL1l4tOqEGQ0W2fJDIb
         MqziD6cVmatXQxEe0pNylmn6c5ZOzQ+2B1JBn6hK3l+CTPM/UnGKUMA27DNM8JmUSZhj
         0sJdK9u6ZzIgKL6VLNIfWbyaly2JcjghTldGCPyKeyWwhmYF1FLDgWeYAcku2EtIDSSp
         2DYw==
X-Forwarded-Encrypted: i=1; AJvYcCUAtYazYVlS+OZH9VrHJk5Sx34GIlvS4Rp+3oINMzzx/eOlfu1hXXct1RjNhX9YhgGGL74ezGeAUIHpkcK2CUsgzu5GVQ+dm3k+e7F1h2Qw
X-Gm-Message-State: AOJu0YykzHcX+yRb5824ZOM1Ly4Lusjg9DwJ1gDYSZX34g2PAPDJLKR4
	z4eSq/CteIPc1fCxp8HXv6bUrCKgjh+GtE5IVBDNMME5u3UUtJsS8O941aHvJ28=
X-Google-Smtp-Source: AGHT+IHjJ/ELMaLTWKWeAU/HVEqGrqCHBr+fjB+4qaex+w80Yfl6w29FYw+Q9TIgjrzlZcWwZpq3WA==
X-Received: by 2002:a5d:5f93:0:b0:35f:2929:846e with SMTP id ffacd0b85a97d-363171e28demr2732074f8f.1.1718811669978;
        Wed, 19 Jun 2024 08:41:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/5] riscv: add support for Zaamo and Zalrsc extensions
Date: Wed, 19 Jun 2024 17:39:07 +0200
Message-ID: <20240619153913.867263-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_084112_817720_26A9BCC5 
X-CRM114-Status: UNSURE (   9.62  )
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

U2luY2UgY29tbWl0IGU4NzQxMmU2MjFmMSAoImludGVncmF0ZSBaYWFtbyBhbmQgWmFscnNjIHRl
eHQgKCMxMzA0KSIpLAp0aGUgQSBleHRlbnNpb24gaGFzIGJlZW4gZGVzY3JpYmVkIGFzIGEgc2V0
IG9mIGluc3RydWN0aW9ucyBwcm92aWRlZCBieQpaYWFtbyBhbmQgWmFscnNjLiBBZGQgdGhlc2Ug
dHdvIGV4dGVuc2lvbnMuCgpUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiB0aGUgWmMgb25lIFsxXS4K
Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNjE5MTEzNTI5
LjY3Njk0MC0xLWNsZWdlckByaXZvc2luYy5jb20vCgotLS0KCkNsw6ltZW50IEzDqWdlciAoNSk6
CiAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgWmFhbW8gYW5kIFphbHJzYyBJU0EgZXh0ZW5zaW9u
IGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBwYXJzaW5nIGZvciBaYWFtbyBhbmQgWmFscnNjIGV4
dGVuc2lvbnMKICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFphYW1vIGFuZCBaYWxyc2MgZXh0ZW5z
aW9ucwogIFJJU0MtVjogS1ZNOiBBbGxvdyBaYWFtby9aYWxyc2MgZXh0ZW5zaW9ucyBmb3IgR3Vl
c3QvVk0KICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBaYWFtby9aYWxyc2MgZXh0ZW5zaW9u
cyB0byBnZXQtcmVnLWxpc3QKICAgIHRlc3QKCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdw
cm9iZS5yc3QgICAgICAgICAgfCAgOCArKysrKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgMTkgKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAyICsrCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAgfCAgMiArKwogYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKystCiBhcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgICAgICAgICAgfCAgMiArKwogYXJjaC9yaXNjdi9r
dm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgIHwgIDQgKysrKwogLi4uL3NlbGZ0ZXN0
cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgIDggKysrKysrKysKIDkgZmlsZXMg
Y2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuNDUuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
