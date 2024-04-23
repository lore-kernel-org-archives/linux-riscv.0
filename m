Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD47C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqjEX74ZSFcVJNMndL3tkwpvAGc4/v96nmrSiWbuBx4=; b=Lo1XpPU0SEYagz
	LxH/OMvB1M7Uim9VYIdzsh0KZL8Xtscxp9PZdxhcTfJxJ0KLoOIlSPrGJa4GYld/TEE6poiWlBebb
	BOhUH+35t8xtG9dCTCVEGQktTtqS4eAQOAMhZr8waJSd54VwijWv3OUgNLfipygSCf8PjhKmKItQg
	OhfamIVqoqVTOyZlOy4buB5l3wh7AzbzgJiC7Fi2AJeVGqkWef08oo89tHw9UZKvvY4NHiCqRg0Ss
	XjnnfcSnw9hpJe0wWLiillw761Zh7EjFRnRkGOTFbQGHXHMyQUTE6TGKsfFV51y5OFMHCp4rpzw+m
	3AqRykNm/4LHgxsFgA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFV5-0000000HSVP-1nUQ;
	Tue, 23 Apr 2024 12:43:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFUt-0000000HSLs-2qPm
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-349fd1d3723so1073674f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876221; x=1714481021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY9X4nU5k+rqVQBtsNRF5VBDE3a2qL0GG+JxaikfjBk=;
        b=HWpTaqo010Jpjy9nMfLU+qmPE7UPL2AgN/dYowDCVikCL/Wm9u9ss/Nn34VI7oTj/H
         6xV8211colBxj8J23YVvKkjJsSlaQEXj/FubhKWSN4ZOHzrAh2dHgPGdZQzF/4g1gCJI
         fcOK3xAF0fOcNKmjIWrq8gC1JdEjR24oGlDI1WqZvta3EFvrjFvAVhrF+y7wyFaioV+e
         prrBtzV56ifmkYtc6CZKbSzB/b2j/Y137S3sU3CvC40WVMr1uamJ8Nzl6RVdHpbv6UtD
         Za6cwsPJhPZUE6HbVNyjzPghEFodV54rV7KJGtcM2kbrCAOWrcselQXMkJts/BnPfFTv
         XjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876221; x=1714481021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RY9X4nU5k+rqVQBtsNRF5VBDE3a2qL0GG+JxaikfjBk=;
        b=bbRxNwDfni3o+crcI3Tt4GPAiPLms3XneehkfCaFxMb/59MV59Z3yfDWNkq2iewvf6
         0QyzATOrOHCuktRBHTupxFeDkoCNY1ptXdRylPeAQOOZfIaG18vSpL2i5Fzok82b8E8r
         tHkETxNTeljARS3kktrfLSEaQ2SDTJ0DHt7yVOWfQIkGKcvUKBZGx2sFKhHX3Q4M10Jc
         cvoAbw0E8AuDcQS1MxaE0Ztka6lj6tT+yBqEvalipOzieqi79A+cShYohySJO1l3IfmE
         Sc5BBxz/8D6DMYP1e88RoFUhvZ5vTRVBhDmJAXWvrmWQ7D8ID3YQnrAu2Eq0O8TmH7K2
         RM8A==
X-Forwarded-Encrypted: i=1; AJvYcCUo1Ed9gMZOWL3Kfbc/lJbfydcccEodiluaUVdqV8i4nhuZl5dRZF5jT5nfvB2IBfPrlvqu+3qZYNJxy+sKT7vo7FqjBj4Q06BLGaxov3pm
X-Gm-Message-State: AOJu0YxKz03PXhSh6LriRjg/VhVOpqsolYXznr4JHvf8dI4i6cFqCWEV
	1Wrw0rHzB6N63+8eKFRyftOx6xMFeXbm4aktAL8BVBBAXeu6lSPPxg4aFmnWLgY=
X-Google-Smtp-Source: AGHT+IGBgbRJ8rS0V6sOY/Pp3/+7YVKywNh0XxOcXpBBLcmpeUTMJ3+uEL+uOgTO/2ehZ+OVVYWaaA==
X-Received: by 2002:adf:f850:0:b0:346:408d:42e6 with SMTP id d16-20020adff850000000b00346408d42e6mr8871797wrq.2.1713876221498;
        Tue, 23 Apr 2024 05:43:41 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:40 -0700 (PDT)
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
Subject: [PATCH v3 01/11] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Tue, 23 Apr 2024 14:43:15 +0200
Message-ID: <20240423124326.2532796-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054343_800101_20FEF25A 
X-CRM114-Status: GOOD (  10.52  )
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
bAppbmRleCA2MTYzNzAzMThhNjYuLjgxYmNlNGZhMjQyNCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
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
cG9pbnQKQEAgLTQ4OSw1ICs1MjEsNTEgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIFJlZ2lz
dGVycyBpbiB0aGUgQVg0NU1QIGRhdGFzaGVldC4KICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFu
ZGVzdGVjaC5jb20vd3AtY29udGVudC91cGxvYWRzL0FYNDVNUC0xQy1SZXYuLTUuMC4wLURhdGFz
aGVldC5wZGYKIAorICAgIGFsbE9mOgorICAgICAgIyBaY2IgZGVwZW5kcyBvbiBaY2EKKyAgICAg
IC0gaWY6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNiCisgICAg
ICAgIHRoZW46CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNhCisg
ICAgICAjIFpjZCBkZXBlbmRzIG9uIFpjYSBhbmQgRAorICAgICAgLSBpZjoKKyAgICAgICAgICBj
b250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2QKKyAgICAgICAgdGhlbjoKKyAgICAgICAg
ICBhbGxPZjoKKyAgICAgICAgICAgIC0gY29udGFpbnM6CisgICAgICAgICAgICAgICAgY29uc3Q6
IHpjYQorICAgICAgICAgICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAgICBjb25zdDogZAor
ICAgICAgIyBaY2YgZGVwZW5kcyBvbiBaY2EgYW5kIEYKKyAgICAgIC0gaWY6CisgICAgICAgICAg
Y29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNmCisgICAgICAgIHRoZW46CisgICAgICAg
ICAgYWxsT2Y6CisgICAgICAgICAgICAtIGNvbnRhaW5zOgorICAgICAgICAgICAgICAgIGNvbnN0
OiB6Y2EKKyAgICAgICAgICAgIC0gY29udGFpbnM6CisgICAgICAgICAgICAgICAgY29uc3Q6IGYK
KworYWxsT2Y6CisgICMgWmNmIGV4dGVuc2lvbiBkb2VzIG5vdCBleGlzdCBvbiBydjY0CisgIC0g
aWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9uczoKKyAg
ICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2YKKyAgICAgICAgcmlzY3Ys
aXNhLWJhc2U6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogcnY2NGkK
KyAgICB0aGVuOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lv
bnM6CisgICAgICAgICAgbm90OgorICAgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICAg
IGNvbnN0OiB6Y2YKKwogYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKIC4uLgotLSAKMi40My4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
