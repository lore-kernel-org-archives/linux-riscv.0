Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0105C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chpP0TQ6Fjht7zpmpTaAEjtFgZHiI043pirJct1dm64=; b=EUC887CzpXLDUp
	tnHtwZIcqytA1mfsuA9mBj3Hwtqmqd89KczBB/eb2+1d8fMcf1huiLDuLkYHFczt3qXLmH6SjEut8
	l5kavdta8Ltj1AcwjnGNSnZPM6xqJX22DSoInX6bMXvnqtgcZmFGfCp8oeHrBf4BmdrXOPGQa9BDs
	Wv92Qx8Oq5qjKoZS4hxJhDQddCBTPiLKMFc02xaxhJy1HUrWIzSuXu8ivYxtDRZAqTyIVOzZl0Hsy
	ovoCbIvpQksmhPEhHtc3REcQIYw7uQOSN8IzPBaJhmdDeRkIVMt8d4Ht206VweyzzJwyF+hfibcGZ
	hHSGlnlnOWugrFFycPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxx-000000088UC-0CHV;
	Fri, 17 May 2024 14:53:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxZ-00000008867-20r2
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-34cb2bf85easo22356f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957603; x=1716562403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxwJ7AJVWOOJH5g1C7ONAzDxOLE31aJ/GSXI4iM+BBI=;
        b=Hr7s2OBA5vLyhUlPt8YY8kVJZ+s0TKn3ReU05tnW7DCCrkzgxJCoXBcbYzrNK/4gbZ
         sPZifeYKAxUmYz9OovV9N6MzJuvtzgWqpeDkMUUdlxAfjNf8AxnyPx7mnwEBtFpmoCQ+
         5xVdjTFSolzzVjm0loJr/UGA7vFWzAMnbqGw8bACdpxdZZxIE0spWvEpe/zYi7bq1Waz
         q5j98qHVMaO5UzCkD4XbmUAo/cO+SZ4mQECgHFJrIz8bSYaySgyc6sfPQCndKltqBqAO
         6M3neSf5aK9LWSuKJyd4Wla7lVv4422xBHBVk3yhSJseHJ+xom4C6fc/wTeJZatxptUo
         2TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957603; x=1716562403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxwJ7AJVWOOJH5g1C7ONAzDxOLE31aJ/GSXI4iM+BBI=;
        b=Mw+KCfoVCGfFo93svku3yvbD/hzGba7yZdCQExUuAxJbeSMspdWJWPmb1Pn+liERQM
         +FqgXaupo+ecFtCAm8nXh1e9sCVoOgAEwu5yvjUq/elIWv34VJADR6cuoXrYGmiYI8Tl
         aCV99SeJGYGpnxh0jOEUx2Ri5IFlbAtiypC9oZrojpJznLeMbdUiV3oTmwgUzUQ2rJH3
         hejTNSuE0OkYlZOG4jKLSUbQTj15yAEXcEh0IIbRia1ZjJpN9e0E9YWuS3gWPyKMPQTP
         X2mSLvkTuZRmNN4Xrp0YzS2nDb8D3Fe2UpIYYUZHKY1QjTIjrvl0Q3WWLBIgfv7J+1KZ
         MuHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFA74Kxudx2ykadx8AYEU1sK0Xw53/jco6fi0LueYE4LiIwaiJGqZ6KDFAauhDiD+i3wb2GVhJ25K/gqQ1KhLCcJel4N3f1c3g4rwFDlVO
X-Gm-Message-State: AOJu0YxIEs1b30JvNSCnF4IhS/w9ZPf4h075JqCc8J4CUXSA2cTZfeq3
	lJ0hSQ+kwSQ0VJQyH43XQkbyaUKOSYwRdXzCak4Fc19tSW8rHaICKu55L1Ekdqs=
X-Google-Smtp-Source: AGHT+IGYOWCyC3A9pZiSse41lg4ejcf2nxXc2Br4ue+JRbxFNqo/gdNFsWJwlvjbngH00Jlcy96tzw==
X-Received: by 2002:a05:600c:511c:b0:420:29dd:84e2 with SMTP id 5b1f17b1804b1-42029dd87camr37914505e9.2.1715957603384;
        Fri, 17 May 2024 07:53:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:22 -0700 (PDT)
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
Subject: [PATCH v5 06/16] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Fri, 17 May 2024 16:52:46 +0200
Message-ID: <20240517145302.971019-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075325_977885_4C9C55BF 
X-CRM114-Status: GOOD (  10.30  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBaY2EsIFpjZiwgWmNkIGFuZCBaY2IgZXh0ZW5zaW9ucyB3aGlj
aCBhcmUgcGFydCB0aGUKWmMqIHN0YW5kYXJkIGV4dGVuc2lvbnMgZm9yIGNvZGUgc2l6ZSByZWR1
Y3Rpb24uIEFkZGl0aW9uYWwgdmFsaWRhdGlvbgpydWxlcyBhcmUgYWRkZWQgc2luY2UgWmNiIGRl
cGVuZHMgb24gWmNhLCBaY2YsIGRlcGVuZHMgb24gWmNhIGFuZCBGLCBaY2QKZGVwZW5kcyBvbiBa
Y2EgYW5kIEQgYW5kIGZpbmFsbHksIFpjZiBjYW4gbm90IGJlIHByZXNlbnQgb24gcnY2NC4KClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3
ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQogLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgNzggKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFt
bAppbmRleCBiOTEwMGFkZGViOTAuLjM5MDg0YzU4ZDRlNCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCkBAIC0y
MjAsNiArMjIwLDM4IEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBpbnN0cnVjdGlvbnMgYXMg
cmF0aWZpZWQgYXQgY29tbWl0IDZkMzM5MTkgKCJNZXJnZSBwdWxsIHJlcXVlc3QgIzE1OAogICAg
ICAgICAgICAgZnJvbSBoaXJvb2loL2NsbXVsLWZpeC1sb29wLWVuZC1jb25kaXRpb24iKSBvZiBy
aXNjdi1iaXRtYW5pcC4KIAorICAgICAgICAtIGNvbnN0OiB6Y2EKKyAgICAgICAgICBkZXNjcmlw
dGlvbjogfAorICAgICAgICAgICAgVGhlIFpjYSBleHRlbnNpb24gcGFydCBvZiBaYyogc3RhbmRh
cmQgZXh0ZW5zaW9ucyBmb3IgY29kZSBzaXplCisgICAgICAgICAgICByZWR1Y3Rpb24sIGFzIHJh
dGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFjMCAoIlpjZiBkb2Vzbid0IGV4aXN0IG9uCisgICAg
ICAgICAgICBSVjY0IGFzIGl0IGNvbnRhaW5zIG5vIGluc3RydWN0aW9ucyIpIG9mIHJpc2N2LWNv
ZGUtc2l6ZS1yZWR1Y3Rpb24sCisgICAgICAgICAgICBtZXJnZWQgaW4gdGhlIHJpc2N2LWlzYS1t
YW51YWwgYnkgY29tbWl0IGRiYzc5Y2YyOGEyICgiSW5pdGlhbCBzZWVkCisgICAgICAgICAgICBv
ZiB6Yy5hZG9jIHRvIHNyYyB0cmVlLiIpLgorCisgICAgICAgIC0gY29uc3Q6IHpjYgorICAgICAg
ICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgWmNiIGV4dGVuc2lvbiBwYXJ0IG9m
IFpjKiBzdGFuZGFyZCBleHRlbnNpb25zIGZvciBjb2RlIHNpemUKKyAgICAgICAgICAgIHJlZHVj
dGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhiZTM0MTljMWMwICgiWmNmIGRvZXNuJ3QgZXhp
c3Qgb24KKyAgICAgICAgICAgIFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikg
b2YgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlvbiwKKyAgICAgICAgICAgIG1lcmdlZCBpbiB0aGUg
cmlzY3YtaXNhLW1hbnVhbCBieSBjb21taXQgZGJjNzljZjI4YTIgKCJJbml0aWFsIHNlZWQKKyAg
ICAgICAgICAgIG9mIHpjLmFkb2MgdG8gc3JjIHRyZWUuIikuCisKKyAgICAgICAgLSBjb25zdDog
emNkCisgICAgICAgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAgIFRoZSBaY2QgZXh0ZW5z
aW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkIGV4dGVuc2lvbnMgZm9yIGNvZGUgc2l6ZQorICAgICAg
ICAgICAgcmVkdWN0aW9uLCBhcyByYXRpZmllZCBpbiBjb21taXQgOGJlMzQxOWMxYzAgKCJaY2Yg
ZG9lc24ndCBleGlzdCBvbgorICAgICAgICAgICAgUlY2NCBhcyBpdCBjb250YWlucyBubyBpbnN0
cnVjdGlvbnMiKSBvZiByaXNjdi1jb2RlLXNpemUtcmVkdWN0aW9uLAorICAgICAgICAgICAgbWVy
Z2VkIGluIHRoZSByaXNjdi1pc2EtbWFudWFsIGJ5IGNvbW1pdCBkYmM3OWNmMjhhMiAoIkluaXRp
YWwgc2VlZAorICAgICAgICAgICAgb2YgemMuYWRvYyB0byBzcmMgdHJlZS4iKS4KKworICAgICAg
ICAtIGNvbnN0OiB6Y2YKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgVGhl
IFpjZiBleHRlbnNpb24gcGFydCBvZiBaYyogc3RhbmRhcmQgZXh0ZW5zaW9ucyBmb3IgY29kZSBz
aXplCisgICAgICAgICAgICByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5
YzFjMCAoIlpjZiBkb2Vzbid0IGV4aXN0IG9uCisgICAgICAgICAgICBSVjY0IGFzIGl0IGNvbnRh
aW5zIG5vIGluc3RydWN0aW9ucyIpIG9mIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24sCisgICAg
ICAgICAgICBtZXJnZWQgaW4gdGhlIHJpc2N2LWlzYS1tYW51YWwgYnkgY29tbWl0IGRiYzc5Y2Yy
OGEyICgiSW5pdGlhbCBzZWVkCisgICAgICAgICAgICBvZiB6Yy5hZG9jIHRvIHNyYyB0cmVlLiIp
LgorCiAgICAgICAgIC0gY29uc3Q6IHpmYQogICAgICAgICAgIGRlc2NyaXB0aW9uOgogICAgICAg
ICAgICAgVGhlIHN0YW5kYXJkIFpmYSBleHRlbnNpb24gZm9yIGFkZGl0aW9uYWwgZmxvYXRpbmcg
cG9pbnQKQEAgLTQ5OSw1ICs1MzEsNTEgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIFRoZSBU
LUhFQUQgc3BlY2lmaWMgMC43LjEgdmVjdG9yIGltcGxlbWVudGF0aW9uIGFzIHdyaXR0ZW4gaW4K
ICAgICAgICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS90aGVhZC1leHRlbnNp
b24tc3BlYy9ibG9iLzk1MzU4Y2IyY2NhOTQ4OTM2MWM2MWQzMzVlMDNkMzEzNGIxNDEzM2YveHRo
ZWFkdmVjdG9yLmFkb2MuCiAKKyAgICBhbGxPZjoKKyAgICAgICMgWmNiIGRlcGVuZHMgb24gWmNh
CisgICAgICAtIGlmOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpj
YgorICAgICAgICB0aGVuOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6
IHpjYQorICAgICAgIyBaY2QgZGVwZW5kcyBvbiBaY2EgYW5kIEQKKyAgICAgIC0gaWY6CisgICAg
ICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNkCisgICAgICAgIHRoZW46Cisg
ICAgICAgICAgYWxsT2Y6CisgICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAg
IGNvbnN0OiB6Y2EKKyAgICAgICAgICAgIC0gY29udGFpbnM6CisgICAgICAgICAgICAgICAgY29u
c3Q6IGQKKyAgICAgICMgWmNmIGRlcGVuZHMgb24gWmNhIGFuZCBGCisgICAgICAtIGlmOgorICAg
ICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjZgorICAgICAgICB0aGVuOgor
ICAgICAgICAgIGFsbE9mOgorICAgICAgICAgICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAg
ICBjb25zdDogemNhCisgICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAgIGNv
bnN0OiBmCisKK2FsbE9mOgorICAjIFpjZiBleHRlbnNpb24gZG9lcyBub3QgZXhpc3Qgb24gcnY2
NAorICAtIGlmOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lv
bnM6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNmCisgICAgICAg
IHJpc2N2LGlzYS1iYXNlOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6
IHJ2NjRpCisgICAgdGhlbjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIHJpc2N2LGlzYS1l
eHRlbnNpb25zOgorICAgICAgICAgIG5vdDoKKyAgICAgICAgICAgIGNvbnRhaW5zOgorICAgICAg
ICAgICAgICBjb25zdDogemNmCisKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCiAuLi4KLS0g
CjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
