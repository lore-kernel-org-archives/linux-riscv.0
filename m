Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0F8C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRf87T3MXssnWdXktQZOz2nrB7k8cdBojK54EAqB94s=; b=xih6hFV2zIAsZP
	6/qXGm0d0/7nm+oUNZo7KBm4Z0CEpANi6PTXEslJn9l7dCQ48irvtTAKcy0X0G+qDuUx2egxUVVmJ
	gHcKEslsnKKnkVMinFTSCTFEh1c4EqUbClY6LKWb0V+gZ49CibKbOITLf/LMYrJrSkot2RMlnqzl/
	matdRMe4EARr8pk1K+um6wEstnA0XehqgFpaq/zzuCMQculHiHo4EuxqXfkL5CekiM7Qer9Lkq441
	ORAv066zrBheXEWRKi67X2QnKeX5cvZSVvQ1BEXP/uPzWtun5wyn7GchYmAXMSwvml2ZcUi3HlQUu
	gzAJxinHez/syhu4spIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbm-0000000105O-3BTP;
	Wed, 19 Jun 2024 11:36:10 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbM-00000000zfq-2GUm
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a6ee5995549so69880366b.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796943; x=1719401743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zBoSU0Yq+Ugqb2C3LqSBfjcHhvTu3SXd5PthuDFsoQ=;
        b=SacOf5O0EtFtUweKWOcvonMUmlxETdOWAr4u87IeITfTK5aLwZ7aNaCI9IhAoRkCYj
         U2khotpaNs3SRvZjjY9H+tIpjrAUXXf3eLU5PP8PEcvsHFtcdjOYB8P4pqwg91rUCvz9
         BryvwAnnUA49/DRfynbQn1+OLgtlY1avOE5keo9zT6vZRegVpPtLPqqfO9VhT4Tpjmc8
         4D9Lb1eBKeEVyrUXYKTaDqEfUoFrB/0v5xz8j9s/GWveM/FnbuFuAWOgIVpGKpSh+avV
         9pKcTk1cJ+H2cjvgnBF1w3rJy8jjFd2m8xvK/nQUwOgK7zUJ+TiFHmVxUjfIqy38Mezd
         YF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796943; x=1719401743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zBoSU0Yq+Ugqb2C3LqSBfjcHhvTu3SXd5PthuDFsoQ=;
        b=KokN8MJWyDAUO6pJnh9dnk/dJgu2vN5rC6ZfxTjbs0lkWnu5ff3T3OkBu0tuCAjqbK
         wz2EEhWydHADYHey3HqNbs+JwwcBSAPm3gaHWYa3YOurFxhgSE9XnqGslPGdblCOj4ck
         BFu3iDpif4F5RDy44CJjQBAPNdMg7BpX2CkdyO/iSpvF4bIpdVVzaS6rYXj93mSn/gua
         SB4qEn+drUOPL81EN9lGDGbvs+gBxQGwAj8dEyZjTFKNf0F5TCzd2bZvV0kOsJianvQe
         mMRCqqkoKUTb1eoDIeZyz7h0CpFOxzee365ovga+Ru76D0DupmYnulrV77shCg3V2ipN
         RrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJGJ1Y9cYlYncso4eK9T6NDvfq6bnQQnRwQdcxEXViax21Ujr2wTgUideTtB0KeBHX01pdErI43oAvKidt5cy0xPizndSO3bbCJKHpbMrb
X-Gm-Message-State: AOJu0Yy8nHkbbV/NGOGBRA384/BQ1zyk3Sx9/nG0HYNj7pyIiqXR5Y4q
	aICiI0XuX4xaSX6C8LzhvbDafbT86A43+Kp6JYZmyecs9i396gXobUWarJrhTg4=
X-Google-Smtp-Source: AGHT+IHoW1UfcptJKJbUfHf0FTH+sEhONquKrK5L/t4dwXUtj8o41zbe9SSO2B6QS2dtbEZsYiMHBg==
X-Received: by 2002:a17:906:4fcb:b0:a6e:f419:5456 with SMTP id a640c23a62f3a-a6fab7d04e0mr124124566b.6.1718796942951;
        Wed, 19 Jun 2024 04:35:42 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:42 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 06/16] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Wed, 19 Jun 2024 13:35:16 +0200
Message-ID: <20240619113529.676940-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043544_801178_B603F58F 
X-CRM114-Status: GOOD (  10.68  )
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
ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClJldmlld2Vk
LWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0KIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDc4ICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKaW5k
ZXggZTIxNDY3OWFiNmRhLi5lMzRkMDY2MzMyNzggMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApAQCAtMjIwLDYg
KzIyMCwzOCBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgaW5zdHJ1Y3Rpb25zIGFzIHJhdGlm
aWVkIGF0IGNvbW1pdCA2ZDMzOTE5ICgiTWVyZ2UgcHVsbCByZXF1ZXN0ICMxNTgKICAgICAgICAg
ICAgIGZyb20gaGlyb29paC9jbG11bC1maXgtbG9vcC1lbmQtY29uZGl0aW9uIikgb2YgcmlzY3Yt
Yml0bWFuaXAuCiAKKyAgICAgICAgLSBjb25zdDogemNhCisgICAgICAgICAgZGVzY3JpcHRpb246
IHwKKyAgICAgICAgICAgIFRoZSBaY2EgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkIGV4
dGVuc2lvbnMgZm9yIGNvZGUgc2l6ZQorICAgICAgICAgICAgcmVkdWN0aW9uLCBhcyByYXRpZmll
ZCBpbiBjb21taXQgOGJlMzQxOWMxYzAgKCJaY2YgZG9lc24ndCBleGlzdCBvbgorICAgICAgICAg
ICAgUlY2NCBhcyBpdCBjb250YWlucyBubyBpbnN0cnVjdGlvbnMiKSBvZiByaXNjdi1jb2RlLXNp
emUtcmVkdWN0aW9uLAorICAgICAgICAgICAgbWVyZ2VkIGluIHRoZSByaXNjdi1pc2EtbWFudWFs
IGJ5IGNvbW1pdCBkYmM3OWNmMjhhMiAoIkluaXRpYWwgc2VlZAorICAgICAgICAgICAgb2YgemMu
YWRvYyB0byBzcmMgdHJlZS4iKS4KKworICAgICAgICAtIGNvbnN0OiB6Y2IKKyAgICAgICAgICBk
ZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgVGhlIFpjYiBleHRlbnNpb24gcGFydCBvZiBaYyog
c3RhbmRhcmQgZXh0ZW5zaW9ucyBmb3IgY29kZSBzaXplCisgICAgICAgICAgICByZWR1Y3Rpb24s
IGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFjMCAoIlpjZiBkb2Vzbid0IGV4aXN0IG9u
CisgICAgICAgICAgICBSVjY0IGFzIGl0IGNvbnRhaW5zIG5vIGluc3RydWN0aW9ucyIpIG9mIHJp
c2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24sCisgICAgICAgICAgICBtZXJnZWQgaW4gdGhlIHJpc2N2
LWlzYS1tYW51YWwgYnkgY29tbWl0IGRiYzc5Y2YyOGEyICgiSW5pdGlhbCBzZWVkCisgICAgICAg
ICAgICBvZiB6Yy5hZG9jIHRvIHNyYyB0cmVlLiIpLgorCisgICAgICAgIC0gY29uc3Q6IHpjZAor
ICAgICAgICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgWmNkIGV4dGVuc2lvbiBw
YXJ0IG9mIFpjKiBzdGFuZGFyZCBleHRlbnNpb25zIGZvciBjb2RlIHNpemUKKyAgICAgICAgICAg
IHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhiZTM0MTljMWMwICgiWmNmIGRvZXNu
J3QgZXhpc3Qgb24KKyAgICAgICAgICAgIFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rp
b25zIikgb2YgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlvbiwKKyAgICAgICAgICAgIG1lcmdlZCBp
biB0aGUgcmlzY3YtaXNhLW1hbnVhbCBieSBjb21taXQgZGJjNzljZjI4YTIgKCJJbml0aWFsIHNl
ZWQKKyAgICAgICAgICAgIG9mIHpjLmFkb2MgdG8gc3JjIHRyZWUuIikuCisKKyAgICAgICAgLSBj
b25zdDogemNmCisgICAgICAgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAgIFRoZSBaY2Yg
ZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkIGV4dGVuc2lvbnMgZm9yIGNvZGUgc2l6ZQor
ICAgICAgICAgICAgcmVkdWN0aW9uLCBhcyByYXRpZmllZCBpbiBjb21taXQgOGJlMzQxOWMxYzAg
KCJaY2YgZG9lc24ndCBleGlzdCBvbgorICAgICAgICAgICAgUlY2NCBhcyBpdCBjb250YWlucyBu
byBpbnN0cnVjdGlvbnMiKSBvZiByaXNjdi1jb2RlLXNpemUtcmVkdWN0aW9uLAorICAgICAgICAg
ICAgbWVyZ2VkIGluIHRoZSByaXNjdi1pc2EtbWFudWFsIGJ5IGNvbW1pdCBkYmM3OWNmMjhhMiAo
IkluaXRpYWwgc2VlZAorICAgICAgICAgICAgb2YgemMuYWRvYyB0byBzcmMgdHJlZS4iKS4KKwog
ICAgICAgICAtIGNvbnN0OiB6ZmEKICAgICAgICAgICBkZXNjcmlwdGlvbjoKICAgICAgICAgICAg
IFRoZSBzdGFuZGFyZCBaZmEgZXh0ZW5zaW9uIGZvciBhZGRpdGlvbmFsIGZsb2F0aW5nIHBvaW50
CkBAIC01MTksNSArNTUxLDUxIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBSZWdpc3RlcnMg
aW4gdGhlIEFYNDVNUCBkYXRhc2hlZXQuCiAgICAgICAgICAgICBodHRwczovL3d3dy5hbmRlc3Rl
Y2guY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9BWDQ1TVAtMUMtUmV2Li01LjAuMC1EYXRhc2hlZXQu
cGRmCiAKKyAgICBhbGxPZjoKKyAgICAgICMgWmNiIGRlcGVuZHMgb24gWmNhCisgICAgICAtIGlm
OgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjYgorICAgICAgICB0
aGVuOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjYQorICAgICAg
IyBaY2QgZGVwZW5kcyBvbiBaY2EgYW5kIEQKKyAgICAgIC0gaWY6CisgICAgICAgICAgY29udGFp
bnM6CisgICAgICAgICAgICBjb25zdDogemNkCisgICAgICAgIHRoZW46CisgICAgICAgICAgYWxs
T2Y6CisgICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAgIGNvbnN0OiB6Y2EK
KyAgICAgICAgICAgIC0gY29udGFpbnM6CisgICAgICAgICAgICAgICAgY29uc3Q6IGQKKyAgICAg
ICMgWmNmIGRlcGVuZHMgb24gWmNhIGFuZCBGCisgICAgICAtIGlmOgorICAgICAgICAgIGNvbnRh
aW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjZgorICAgICAgICB0aGVuOgorICAgICAgICAgIGFs
bE9mOgorICAgICAgICAgICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAgICBjb25zdDogemNh
CisgICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAgIGNvbnN0OiBmCisKK2Fs
bE9mOgorICAjIFpjZiBleHRlbnNpb24gZG9lcyBub3QgZXhpc3Qgb24gcnY2NAorICAtIGlmOgor
ICAgICAgcHJvcGVydGllczoKKyAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnM6CisgICAgICAg
ICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNmCisgICAgICAgIHJpc2N2LGlzYS1i
YXNlOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHJ2NjRpCisgICAg
dGhlbjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIHJpc2N2LGlzYS1leHRlbnNpb25zOgor
ICAgICAgICAgIG5vdDoKKyAgICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgICBjb25z
dDogemNmCisKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCiAuLi4KLS0gCjIuNDUuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
