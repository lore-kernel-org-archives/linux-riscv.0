Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1FDC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7JM66TGyq11CtFo61GlMFekuvKw27YeMeH8vdu7LKU=; b=oFM2jIbdB0WuPf
	IUcJipgDPmTbogBy3GOLOpVtjFAljpo6i23IJ3WbVs1caNQw+atol0HG5qZtuReDvTI/RxLgiiBNC
	RDHrOV95gV0Fplxnlv91s1HYkDDBJ9jpuacT6Tqx4Bv/tYIcfCXXMeiaGosHxGuCjWgC9DVWSMiy9
	k3jHJgIkDk0WA/cwTtmY/QCF0WzmUej1Nzm7XEqfoFpdO1uEFM9Z6rFzqPzIUH4eYIKo1BY3wlGyj
	kX3UpsWXno41x/Q3nGgv/kQXEd3HU6ZcAo4Msf66RT+zRTs9QAvEH7uvLrNS2N3xKoP3FUhQtBVbZ
	U8Kd9a8lq+SOTkO44Wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtcG-000000010Vw-0dLS;
	Wed, 19 Jun 2024 11:36:40 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbY-00000000zqQ-1pH6
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:36:01 +0000
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec3b282fedso2252951fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796954; x=1719401754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sy3W3sT66nFUHkOIAcy9zXa+nQEQXWEM2cv9eUy8eQ=;
        b=pxLSaupVjRc+GjezzqIf3vygp97JA4Uwm6lm36LKxDuQEJU54Fo2hYsYQFb7bqGYwR
         UlENEdo549JbFiAGVHyBYg5ucg4vpEUOurJWhEFj3fiPmRNe48oah6+ndeGQQn/oU1Eg
         UnfNP7CaP5wvVRIrV8XveBixx7e3jVN+NEcK9dujaQ49XOIf2pq/KGd4pd2xSd99f+Oq
         ElXCdTZW3mWUxRRhBKherKY1O/WSER+F5hw/BQ26Mn9qVWCSdwy3odrlrlYpiTBkh2ka
         Xq6AsoThXyqOTPO+CCxx8o0denXNgtWlQjwAO9PZ+BzpAA+9LaXMWxeEIsT9vmOkz0xO
         uU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796954; x=1719401754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Sy3W3sT66nFUHkOIAcy9zXa+nQEQXWEM2cv9eUy8eQ=;
        b=ZkQvtAjrgO2WuVzrEzJoJ8Oe64G4O2XFTvDdhRSBOO5VjUXjCZ2fqaXb2iIUXRo3aR
         RsR+9fJb0beERzvCuYlAdT77kPE+AE42ZIjJYRqWRnCwojPIsIbTgveHTeQ3ybs8U/XF
         WuX0zY4KHh8tTVQhbmhGOMtiiwA8nBbyGWqGYwbaD9cclKeuhLtxEsmZTuHzFXMXGJve
         aNfrdaxDFlfgQ2PYXb6gnR0xhZy7ViCBvn26oHZSBkn8EbzLG+wq16K9CD2PtTx9Mtkz
         72//x8AYjGvOZZ1Ni2TZZDe1W09D22oQpdZaYodE+I7dRC1QsWOwU7bt/6zh8R34bo2u
         POww==
X-Forwarded-Encrypted: i=1; AJvYcCUOyry63WayOQmU3aHT7g+eeJYL4pWgBsxaO5tKpZIIT0k0ENz5gPTt6rQ+mO6/N4vCoXKxmCIkjUbCxk+5VuwUFQL1A9eVsiwU1M7NNA+Q
X-Gm-Message-State: AOJu0YzX5rFt1FhdUhtw9fh3A4NzGm6ZauAxBQ6DISYdWBfaiL6k++z7
	w6UK1s/usL/UxojrLirQpiQCHZeWi5PrHun5ZfLThve0NevOyKKnLOeQkIcFmjA=
X-Google-Smtp-Source: AGHT+IFRciAFte3oPxe/TYNtXAvR1m3s7pGZfdqa/xJwJUVeVl2PdQBNkhgvRY1kSbpJQmQp281hYw==
X-Received: by 2002:a05:6512:b22:b0:52c:cd07:37b6 with SMTP id 2adb3069b0e04-52ccd0738b3mr880416e87.1.1718796954087;
        Wed, 19 Jun 2024 04:35:54 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:52 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 12/16] dt-bindings: riscv: add Zcmop ISA extension description
Date: Wed, 19 Jun 2024 13:35:22 +0200
Message-ID: <20240619113529.676940-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043556_750096_A5403906 
X-CRM114-Status: UNSURE (   9.38  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmNtb3AgKENvbXByZXNzZWQgTWF5LUJlLU9wZXJhdGlv
bnMpIElTQQpleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGluIGNvbW1pdCBjNzMyYTRmMzlh
NGMgKCJaY21vcCBpcwpyYXRpZmllZC8xLjAiKSBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KQWNrZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sICAgICAgICB8IDEyICsrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApp
bmRleCBlMzRkMDY2MzMyNzguLjMzZjFhODZlZmVkOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCkBAIC0yNTIs
NiArMjUyLDExIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBtZXJnZWQgaW4gdGhlIHJpc2N2
LWlzYS1tYW51YWwgYnkgY29tbWl0IGRiYzc5Y2YyOGEyICgiSW5pdGlhbCBzZWVkCiAgICAgICAg
ICAgICBvZiB6Yy5hZG9jIHRvIHNyYyB0cmVlLiIpLgogCisgICAgICAgIC0gY29uc3Q6IHpjbW9w
CisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmNtb3Ag
ZXh0ZW5zaW9uIHZlcnNpb24gMS4wLCBhcyByYXRpZmllZCBpbiBjb21taXQKKyAgICAgICAgICAg
IGM3MzJhNGYzOWE0ICgiWmNtb3AgaXMgcmF0aWZpZWQvMS4wIikgb2YgdGhlIHJpc2N2LWlzYS1t
YW51YWwuCisKICAgICAgICAgLSBjb25zdDogemZhCiAgICAgICAgICAgZGVzY3JpcHRpb246CiAg
ICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmZhIGV4dGVuc2lvbiBmb3IgYWRkaXRpb25hbCBmbG9h
dGluZyBwb2ludApAQCAtNTc5LDYgKzU4NCwxMyBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAg
ICAgIGNvbnN0OiB6Y2EKICAgICAgICAgICAgIC0gY29udGFpbnM6CiAgICAgICAgICAgICAgICAg
Y29uc3Q6IGYKKyAgICAgICMgWmNtb3AgZGVwZW5kcyBvbiBaY2EKKyAgICAgIC0gaWY6CisgICAg
ICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNtb3AKKyAgICAgICAgdGhlbjoK
KyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2EKIAogYWxsT2Y6CiAg
ICMgWmNmIGV4dGVuc2lvbiBkb2VzIG5vdCBleGlzdCBvbiBydjY0Ci0tIAoyLjQ1LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
