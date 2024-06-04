Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F52C25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZLO2BnikTXHVa8e25SFk7jZ3MfMPmo6oxQAHXEyT40=; b=w4kkFqtoyM5RhX
	XgUn/+e+XJccTPTqkxqpOZhiFfFvgCmLke0R+RCRpQBph0P6bOcB3IkYMVBJrO0Oh8LiSexN5ZjLI
	jfivA3VA9YujA3AIBEb3obAhd/20hhwvxTFP9HddEZ6r1coYsl2CY6QMPUYt5eeTLz6Dx3W4ku37Z
	JyvwerEIa++oqEheEySOAyZE0WkZqlRkBNR7OaVKcjLKLTS4HgcDBkhCPztEHWHA+D/1xejETWKdy
	FliInLhpzMlvfdrcSENwLkIB9AIniQkb/TGZLrgkCmStHH6wNXoznj0M6Kg4rfQr/cvXrWywrzi2C
	Q4XrxBG85yZqRJkwNpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZV-00000002Lts-2L2w;
	Tue, 04 Jun 2024 12:47:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZQ-00000002LoJ-3lL7
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:47:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f61cca4a17so3706305ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505239; x=1718110039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDggCbJq5xAgdt5U/mnZ4/8n6MHnmjzG09lZvHegJVk=;
        b=oowqtNwFQjUGP5kjlT3VQAI2bTvgi/hniKu7IlNAFWZpAXS9Ccy6Nm/dvrPrWxeGn5
         8sQCpEAIAzA8vL95DvDHfhZdBkbn5BU6h/hz+B376Ep9nIoyYMBtZNFtNMgVeCSM8rWy
         kNfIpkBnhUpFBzLvsatnKsexLpW9kbhjZXscFkQ7aNbuW01zTsT0bboZrADDcQWo9tQu
         ioYCIWDlGkeMSWDY0Z7/PjpUzLVU/vtzgRLPgeJWh6LEZSXxbozyf/CLey+abzFscUpt
         iW5MJkVLetLZVCoqk/P14edvapiyXxl1i63LjDbYTcOJCNzlg0hsUB+T2BCpRik6MaEr
         Bhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505239; x=1718110039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDggCbJq5xAgdt5U/mnZ4/8n6MHnmjzG09lZvHegJVk=;
        b=Y8OEoKgv5/BzQxMf4TuEpnJ1klb/7mVHjmeDY5P8K+PZq/NIJhYbD42mJVZsTs8Th7
         idLn/2E07IhlOJHJ8+uyYxmvrFBxmCuNBFbiTCDYLo/nDH0iIGRp3H3ZZjoY5z3LuiBD
         2JSpX1X/PmRtQJVTw0KITRrA8+v55LWtSr7uV/RSIoL1DrhCQpVS6PfkSjMkIYqmibBq
         ZRmz0cDI9NipQ+8EkdLIPTm+yxaI0h0hr3nSqsfHByQwmeo7tnvCFpcuayGREz/Ai66m
         ZKSJQTtYa6Tr2F7twjj3DC64GPlt29K6/yqiCNeRdLz2wGB4qbI9jy2uV1wxwRVljpIS
         0Fcw==
X-Forwarded-Encrypted: i=1; AJvYcCU3EYMyuIr84QTq/mc07wSJAwBq4I0DnaVqO90xv7ie+pRAdQ2KsVXHIjzoXVw5c0C28V3I9PtP6VS2bW4Z4MjLS3M8Bok4BH6eY1rvw1NJ
X-Gm-Message-State: AOJu0YwuGeYNZxdxaCoXe/obghDdBCBUCswxkX9x+joc6A66PflACjhi
	f1RjgCixKupI0rgjwfzAuOP5TN2LhpXgp7x6iz7O3BNRb3T5GOMvm0MXk+LmUSM=
X-Google-Smtp-Source: AGHT+IGQMTJjGTRyExe5WucoZYIN7+QmoxG6l4x/LYMJNGm+8SMfBCqkxppCIaA9Kdjsd1UwcvgPcQ==
X-Received: by 2002:a17:902:c952:b0:1f3:453:2c82 with SMTP id d9443c01a7336-1f6370c3578mr132333805ad.4.1717505238694;
        Tue, 04 Jun 2024 05:47:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:47:18 -0700 (PDT)
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
Subject: [PATCH v6 06/16] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Tue,  4 Jun 2024 14:45:38 +0200
Message-ID: <20240604124550.3214710-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054721_033054_FAB45445 
X-CRM114-Status: GOOD (  10.63  )
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
ZXggNjE2MzcwMzE4YTY2Li44MWJjZTRmYTI0MjQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
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
CkBAIC00ODksNSArNTIxLDUxIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBSZWdpc3RlcnMg
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
dDogemNmCisKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCiAuLi4KLS0gCjIuNDUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
