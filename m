Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC08C04FFF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpjKXLO5Q6SsZKaE3AH0eTr2hOj6DhjDDic3317KYkE=; b=sM77fmr8ibnB/8
	ynlI0wtgdkwXO/tKGlZUVvtvyjrQEouILCES9IEqdnOjVdMy0JLeWOHsHyMhcEqaEZRvV5Gj8GLmU
	VXVXclHKx2dzTn2UhvXNWcpRNAiRgK5C2nMeU9Fa1/g8Y2p93bfrdE7VmRvS+F3MaQCArEscvHCgk
	JGr3UzTyAOwI2oe35pOlLAZ1Bayzc/ezyKvBa3DWmoGX95vsv6JcAl7zfL2uvuY7U/JA9q/fJbnvm
	C+zq/Q76+x0hlf+AI+Au0Hu4kcD9tfjSAf2dlz/Hf46cGIcwAqPlE64DiHaBylGSBz3vnYfN9zaZ7
	PLJucW+0JSC3VAX7rXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7Z-00000002CZy-0FYr;
	Thu, 18 Apr 2024 12:44:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7Q-00000002CRJ-0O9o
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-347c6d6fc02so116276f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444235; x=1714049035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrjU6l9W7DikYIaMYJG/SdZ2oUTcGtwCnDHe7Ekc7IE=;
        b=NuWAM3kDbx8VequTg93+Qo1r4b7sTaAVBx/d0NmHVpQhg01ajHoXxXCUclA8B5C+MW
         qi1py/TVNEcX8LeB3tKeTKdhnbVrId9Laxd6OROuM+dVTE0bkoyPM7WYC2tmA+Nfyae/
         kQQI1I60so8otLtVH34ANkyB8RfYSWa4zKBa4Ob2HmTvj/8wF0i/gUQCYTQbfspNlgfN
         S49dn8svv0ZJ9NCX1PpIkg7lJ3nWjkCggpb9/PGD3y5D6SbBRm4ZRP8zN8s04C1+3eF4
         lw9Q0Z82tAJ6ZqP6/uRapxX5zDaA58LS2IrZ4v8fYDf1BnQ3Yr3NswJ1sB9q1afATDBj
         rh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444235; x=1714049035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrjU6l9W7DikYIaMYJG/SdZ2oUTcGtwCnDHe7Ekc7IE=;
        b=cRPFznlH/WYgSbRy7/+pN8TBDquH6lbXjfDtGTjSxUh5RXyLYnQbjTuNCP3MR4xTs9
         JmDWCrntm6plrSVie1d6XZZfRV6palbme2kWd3hyXK2eXdysAlen+eHGdTq8ci9JWxWp
         tF1aZ5hzWWg1f7Ahx6E3jjdx6XvW7BSoSnrQmI+YL/q2vaigMwlB7pH1dz8HfTPKJA1S
         yHs6jaStsTgJn6XInuxfLBVVd4u2SOtCXq1zJn/zmEojrCU9hlTPF9QCU1N4CaTRWfl+
         iuUcpD1YJJDCx/8DlTcE/lKC6U3HI/A0JhxdnvR6oSDDXt4lWPnzBiU17/lktMxivUhP
         Iu5g==
X-Forwarded-Encrypted: i=1; AJvYcCX8bMn0GH+s2t3YDERzlhrdxbsEaaptyxmzplGphfm+Jbbm2by4AxZZYh9Z0mxOT/I2/9Ce4gsADQcwqkRm95F7YxWLZZWuyuZ9Kv6iBS5w
X-Gm-Message-State: AOJu0YxtfpNCR/dWvLzSIncuHfT+avVtBp48DfLrCeuw/bMHVyohBuLQ
	eK2Pg/mPc1TYoj9/ho9cb6osmm0kHcbQAtCxMa7PVK3NmZWLxOnGwomdsv29/BI=
X-Google-Smtp-Source: AGHT+IFFx4DMJCN/eGlinw4D8WxSb2s5Led6zbc0ypunbHRPKVqfx9J88kY5VuS8nvJuPPTEq99jAg==
X-Received: by 2002:a05:600c:55d7:b0:418:ef65:4b5f with SMTP id jq23-20020a05600c55d700b00418ef654b5fmr805438wmb.3.1713444235113;
        Thu, 18 Apr 2024 05:43:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:43:54 -0700 (PDT)
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
Subject: [PATCH v2 01/12] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Thu, 18 Apr 2024 14:42:24 +0200
Message-ID: <20240418124300.1387978-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054400_319807_9B4F36C0 
X-CRM114-Status: GOOD (  10.67  )
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
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA3OCArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCmluZGV4IDYxNjM3MDMxOGE2Ni4uZGI3ZGFmMjJiODYzIDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKQEAg
LTIyMCw2ICsyMjAsMzggQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIGluc3RydWN0aW9ucyBh
cyByYXRpZmllZCBhdCBjb21taXQgNmQzMzkxOSAoIk1lcmdlIHB1bGwgcmVxdWVzdCAjMTU4CiAg
ICAgICAgICAgICBmcm9tIGhpcm9vaWgvY2xtdWwtZml4LWxvb3AtZW5kLWNvbmRpdGlvbiIpIG9m
IHJpc2N2LWJpdG1hbmlwLgogCisgICAgICAgIC0gY29uc3Q6IHpjYQorICAgICAgICAgIGRlc2Ny
aXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgWmNhIGV4dGVuc2lvbiBwYXJ0IG9mIFpjKiBzdGFu
ZGFyZCBleHRlbnNpb25zIGZvciBjb2RlIHNpemUKKyAgICAgICAgICAgIHJlZHVjdGlvbiwgYXMg
cmF0aWZpZWQgaW4gY29tbWl0IDhiZTM0MTljMWMwICgiWmNmIGRvZXNuJ3QgZXhpc3Qgb24KKyAg
ICAgICAgICAgIFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YgcmlzY3Yt
Y29kZS1zaXplLXJlZHVjdGlvbiwKKyAgICAgICAgICAgIG1lcmdlZCBpbiB0aGUgcmlzY3YtaXNh
LW1hbnVhbCBieSBjb21taXQgZGJjNzljZjI4YTIgKCJJbml0aWFsIHNlZWQKKyAgICAgICAgICAg
IG9mIHpjLmFkb2MgdG8gc3JjIHRyZWUuIikuCisKKyAgICAgICAgLSBjb25zdDogemNiCisgICAg
ICAgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAgIFRoZSBaY2IgZXh0ZW5zaW9uIHBhcnQg
b2YgWmMqIHN0YW5kYXJkIGV4dGVuc2lvbnMgZm9yIGNvZGUgc2l6ZQorICAgICAgICAgICAgcmVk
dWN0aW9uLCBhcyByYXRpZmllZCBpbiBjb21taXQgOGJlMzQxOWMxYzAgKCJaY2YgZG9lc24ndCBl
eGlzdCBvbgorICAgICAgICAgICAgUlY2NCBhcyBpdCBjb250YWlucyBubyBpbnN0cnVjdGlvbnMi
KSBvZiByaXNjdi1jb2RlLXNpemUtcmVkdWN0aW9uLAorICAgICAgICAgICAgbWVyZ2VkIGluIHRo
ZSByaXNjdi1pc2EtbWFudWFsIGJ5IGNvbW1pdCBkYmM3OWNmMjhhMiAoIkluaXRpYWwgc2VlZAor
ICAgICAgICAgICAgb2YgemMuYWRvYyB0byBzcmMgdHJlZS4iKS4KKworICAgICAgICAtIGNvbnN0
OiB6Y2QKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgVGhlIFpjZCBleHRl
bnNpb24gcGFydCBvZiBaYyogc3RhbmRhcmQgZXh0ZW5zaW9ucyBmb3IgY29kZSBzaXplCisgICAg
ICAgICAgICByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFjMCAoIlpj
ZiBkb2Vzbid0IGV4aXN0IG9uCisgICAgICAgICAgICBSVjY0IGFzIGl0IGNvbnRhaW5zIG5vIGlu
c3RydWN0aW9ucyIpIG9mIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24sCisgICAgICAgICAgICBt
ZXJnZWQgaW4gdGhlIHJpc2N2LWlzYS1tYW51YWwgYnkgY29tbWl0IGRiYzc5Y2YyOGEyICgiSW5p
dGlhbCBzZWVkCisgICAgICAgICAgICBvZiB6Yy5hZG9jIHRvIHNyYyB0cmVlLiIpLgorCisgICAg
ICAgIC0gY29uc3Q6IHpjZgorICAgICAgICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgICBU
aGUgWmNmIGV4dGVuc2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZCBleHRlbnNpb25zIGZvciBjb2Rl
IHNpemUKKyAgICAgICAgICAgIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhiZTM0
MTljMWMwICgiWmNmIGRvZXNuJ3QgZXhpc3Qgb24KKyAgICAgICAgICAgIFJWNjQgYXMgaXQgY29u
dGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlvbiwKKyAg
ICAgICAgICAgIG1lcmdlZCBpbiB0aGUgcmlzY3YtaXNhLW1hbnVhbCBieSBjb21taXQgZGJjNzlj
ZjI4YTIgKCJJbml0aWFsIHNlZWQKKyAgICAgICAgICAgIG9mIHpjLmFkb2MgdG8gc3JjIHRyZWUu
IikuCisKICAgICAgICAgLSBjb25zdDogemZhCiAgICAgICAgICAgZGVzY3JpcHRpb246CiAgICAg
ICAgICAgICBUaGUgc3RhbmRhcmQgWmZhIGV4dGVuc2lvbiBmb3IgYWRkaXRpb25hbCBmbG9hdGlu
ZyBwb2ludApAQCAtNDg5LDUgKzUyMSw1MSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgUmVn
aXN0ZXJzIGluIHRoZSBBWDQ1TVAgZGF0YXNoZWV0LgogICAgICAgICAgICAgaHR0cHM6Ly93d3cu
YW5kZXN0ZWNoLmNvbS93cC1jb250ZW50L3VwbG9hZHMvQVg0NU1QLTFDLVJldi4tNS4wLjAtRGF0
YXNoZWV0LnBkZgogCisgICAgYWxsT2Y6CisgICAgICAjIFpjYiBkZXBlbmRzIG9uIFpjYQorICAg
ICAgLSBpZjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2IKKyAg
ICAgICAgdGhlbjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2EK
KyAgICAgICMgWmNkIGRlcGVuZHMgb24gWmNhIGFuZCBECisgICAgICAtIGlmOgorICAgICAgICAg
IGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjZAorICAgICAgICB0aGVuOgorICAgICAg
ICAgIGFsbE9mOgorICAgICAgICAgICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAgICBjb25z
dDogemNhCisgICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAgIGNvbnN0OiBk
CisgICAgICAjIFpjZiBkZXBlbmRzIG9uIFpjYSBhbmQgRgorICAgICAgLSBpZjoKKyAgICAgICAg
ICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2YKKyAgICAgICAgdGhlbjoKKyAgICAg
ICAgICBhbGxPZjoKKyAgICAgICAgICAgIC0gY29udGFpbnM6CisgICAgICAgICAgICAgICAgY29u
c3Q6IHpjYQorICAgICAgICAgICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAgICBjb25zdDog
ZgorCithbGxPZjoKKyAgIyBaY2YgZXh0ZW5zaW9uIGRvZXMgbm90IGV4aXN0cyBvbiBydjY0Cisg
IC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9uczoK
KyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2YKKyAgICAgICAgcmlz
Y3YsaXNhLWJhc2U6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogcnY2
NGkKKyAgICB0aGVuOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgcmlzY3YsaXNhLWV4dGVu
c2lvbnM6CisgICAgICAgICAgbm90OgorICAgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAg
ICAgIGNvbnN0OiB6Y2YKKwogYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKIC4uLgotLSAKMi40
My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
