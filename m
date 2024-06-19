Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D67FC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bHlXne8zF6E+9MlIzekPvhd1x2n3HiPkW7VlbIuksRE=; b=00MjAtxuj+S5WD
	+XRqTWjssKKxE+xaJQt9qId1n6SkOtlG0bpcCCWqPzh8PsHYYaOfl910M0z8qcxWgnQ+TB3Hmra4F
	8LhTSgKpI6OU2I4SPChCvth6p3sT04zJOH5jgkRKDxSujhtI7Nt+W1B0mHOuJmlcehk0gpLY/BoOI
	4tRfQy09DoTqzLIinxdDJ3X7ICdzhCV7d5dQ65CSljJTkd5s6J5ydiurpRUok1IQU91nFPgCUHPB8
	MmBzjoK5Nf6KK0VG5PGYR2+F3o11lc268vxegtWMwvUlBjw8VCeMfh2K3bwy2p224TRBXcmu2fj/L
	4dhPi7LlFKDOzkT385Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbI-00000000zda-16XP;
	Wed, 19 Jun 2024 11:35:40 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbF-00000000zbb-0Drc
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:39 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ebd590a79cso6505881fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796935; x=1719401735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R68cnnEZYSz82BBlgeePthLtn1GpI/DDwCMXiGYDPIE=;
        b=Qu973uFLFYr4mJqDvyoB3g4f6TnRO46F6c0bpe2DsMeMU5pC84uInQnma7LTVe6oIz
         1XWwA//65d67HGPK7uF9fTSc23x+IzYqOlC98IytjVVehcgXadnNQNQb9qhCXsV+jbRp
         r0myvDYudCkkfDXFD3Bl+KompxglsOT3eIdCoNwAOw+94qIhZ6LG8K0Iqf++iLZNW0B6
         b7XO45dQosKpksFRa68Y6rne0dPSRKISdRHWTnjRhvxzNC7QDRl40Jo3cXAl5La/A1Xm
         WgD3r4h9tSl85g3vZBHRSnG8IHWTGLyT5CWvcxPNAwrMP1fxbfbZBP9nn3madWQy3ujR
         pEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796935; x=1719401735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R68cnnEZYSz82BBlgeePthLtn1GpI/DDwCMXiGYDPIE=;
        b=E4kiSImuZlxrysC9aw9fI2xwWsl2UOl3xdh1Oj5RbyyD+yju39ud14c91EozliaSyo
         aTW29IrfpUtcWZrufUZ3I4m6rtQ58cFOPGMP7Jonf2qel6iiLITzho/mm4Yn4FI+I/cR
         22oMR0MU4m1TTCrnomAxaOb8wl3rBrMrJXSfgZTFCfMKO3BIjfDMp+IRYpPfQTFwjxJx
         m1kVYJQhSXecXtiFBv8VbjqIxirQJ2JaK2Bnj/tux0vuP8JO89972fBQKJJsAAh2WbNP
         UUNjOTFlwDyQcEhwBEml2YLl82wOrmQaXLBNzSfryugE3ZeTLTrL48EJhb3A52NTf4rs
         moOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkmXiyhPaW2Znhr83vujbGc04quu7GfrFly8NL/jjAp1KXjimu8EWC5is2bNBevzkxRNHAhvqGoxIScavlSoPx3G3DNa56k7Ok84t1idMB
X-Gm-Message-State: AOJu0YwJAtUZ/vpq8f8kR4TG/QxoRw/8fl4FL26hmrnEKsFubDizQexL
	KcVjQSnKJZxwPnsaU9kGOic49tDUguTdAyFO/MUrojOn8N+52k+B87+V3elZFho=
X-Google-Smtp-Source: AGHT+IFsCC87W4xVADXKP6E1LRVpjwgMonVuzzedwVb0Jp+JNzVJhthcLxSn+Xc6UH4SRMqEmwjj+g==
X-Received: by 2002:a2e:a548:0:b0:2ec:3e14:fa1c with SMTP id 38308e7fff4ca-2ec3e14faf7mr12339341fa.5.1718796934705;
        Wed, 19 Jun 2024 04:35:34 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:34 -0700 (PDT)
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
Subject: [PATCH v7 00/16] Add support for a few Zc* extensions, Zcmop and Zimop
Date: Wed, 19 Jun 2024 13:35:10 +0200
Message-ID: <20240619113529.676940-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043537_273526_99682F95 
X-CRM114-Status: GOOD (  10.31  )
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
b25zLiBBZGQKc3VwcG9ydCBmb3IgWmltb3AsIFpjbW9wLCBaY2EsIFpjZiwgWmNkIGFuZCBaY2Ig
ZXh0ZW5zaW9ucyBJU0Egc3RyaW5nCnBhcnNpbmcsIGh3cHJvYmUgYW5kIGt2bSBzdXBwb3J0LiBa
Y2UsIFpjbXQgYW5kIFpjbXAgZXh0ZW5zaW9ucyBoYXZlCmJlZW4gbGVmdCBvdXQgc2luY2UgdGhl
eSB0YXJnZXQgbWljcm9jb250cm9sbGVycy9lbWJlZGRlZCBDUFVzIGFuZCBhcmUKbm90IG5lZWRl
ZCBieSBSVkEyM1U2NC4KClNpbmNlIFpjKiBleHRlbnNpb25zIHN0YXRlcyB0aGF0IEMgaW1wbGll
cyBaY2EsIFpjZiAoaWYgRiBhbmQgUlYzMiksIFpjZAooaWYgRCksIHRoaXMgc2VyaWVzIG1vZGlm
aWVzIHRoZSB3YXkgSVNBIHN0cmluZyBpcyBwYXJzZWQgYW5kIG5vdyBkb2VzCml0IGluIHR3byBw
aGFzZXMuIEZpcnN0IG9uZSBwYXJzZXMgdGhlIHN0cmluZyBhbmQgdGhlIHNlY29uZCBvbmUKdmFs
aWRhdGVzIGl0IGZvciB0aGUgZmluYWwgSVNBIGRlc2NyaXB0aW9uLgoKTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA0MDQxMDMyNTQuMTc1MjgzNC0xLWNsZWdl
ckByaXZvc2luYy5jb20vIFsxXQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NDA0MDkxNDM4MzkuNTU4Nzg0LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8gWzJdCgotLS0KCnY3Ogog
LSBSZWJhc2VkIG9uIHJpc2N2L2Zvci1uZXh0IHRvIGZpeCBjb25mbGljdHMKCnY2OgogLSBSZWJh
c2VkIG9uIHJpc2N2L2Zvci1uZXh0CiAtIFJlbW92ZSB0ZXJuYXJ5IG9wZXJhdG9yIHRvIHVzZSAn
aWYoKScgaW5zdGVhZCBpbiBleHRlbnNpb24gY2hlY2tzCiAtIHY1OiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNDA1MTcxNDUzMDIuOTcxMDE5LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8K
CnY1OgogLSBNZXJnZWQgaW4gWmltb3AgdG8gYXZvaWQgYW55IHVuZWVkZWQgc2VyaWVzIGRlcGVu
ZGVuY2llcwogLSBSZXdvcmsgZGVwZW5kZW5jeSByZXNvbHV0aW9uIGxvb3AgdG8gbG9vcCBvbiBz
b3VyY2UgaXNhIGZpcnN0IHJhdGhlcgogICB0aGFuIG9uIGFsbCBleHRlbnNpb24uCiAtIERpc2Fi
bGVkIGV4dGVuc2lvbnMgaW4gc291cmNlIGlzYSBvbmNlIHNldCBpbiByZXNvbHZlZCBpc2EKIC0g
UmVuYW1lIHJpc2N2X3Jlc29sdmVfaXNhKCkgcGFyYW1ldGVycwogLSB2NDogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjQwNDI5MTUwNTUzLjYyNTE2NS0xLWNsZWdlckByaXZvc2luYy5j
b20vCgp2NDoKIC0gTW9kaWZ5IHZhbGlkYXRlKCkgY2FsbGJhY2tzIHRvIHJldHVybiAwLCAtRVBS
T0JFREVGRVIgb3IgYW5vdGhlcgogICBlcnJvci4KIC0gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI0MDQyMzEyNDMyNi4yNTMyNzk2LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8KCnYz
OgogLSBGaXggdHlwbyAiZXhpc3RzIiAtPiAiZXhpc3QiCiAtIFJlbW92ZSBDIGltcGxpZXMgWmNh
LCBaY2QsIFpjZiwgZHQtYmluZGluZ3MgcnVsZXMKIC0gUmV3b3JrIElTQSBzdHJpbmcgcmVzb2x2
ZXIgdG8gaGFuZGxlIGRlcGVuZGVuY2llcwogLSB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjQwNDE4MTI0MzAwLjEzODc5NzgtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKdjI6CiAt
IEFkZCBaYyogZGVwZW5kZW5jaWVzIHZhbGlkYXRpb24gaW4gZHQtYmluZGluZ3MKIC0gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA0MTAwOTExMDYuNzQ5MjMzLTEtY2xlZ2Vy
QHJpdm9zaW5jLmNvbS8KCkNsw6ltZW50IEzDqWdlciAoMTYpOgogIGR0LWJpbmRpbmdzOiByaXNj
djogYWRkIFppbW9wIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KICByaXNjdjogYWRkIElTQSBl
eHRlbnNpb24gcGFyc2luZyBmb3IgWmltb3AKICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFppbW9w
IElTQSBleHRlbnNpb24KICBSSVNDLVY6IEtWTTogQWxsb3cgWmltb3AgZXh0ZW5zaW9uIGZvciBH
dWVzdC9WTQogIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFppbW9wIGV4dGVuc2lvbiB0byBn
ZXQtcmVnLWxpc3QgdGVzdAogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpjYSwgWmNmLCBaY2Qg
YW5kIFpjYiBJU0EgZXh0ZW5zaW9uCiAgICBkZXNjcmlwdGlvbgogIHJpc2N2OiBhZGQgSVNBIGV4
dGVuc2lvbnMgdmFsaWRhdGlvbiBjYWxsYmFjawogIHJpc2N2OiBhZGQgSVNBIHBhcnNpbmcgZm9y
IFpjYSwgWmNmLCBaY2QgYW5kIFpjYgogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmNhLCBaY2Ys
IFpjZCBhbmQgWmNiIElTQSBleHRlbnNpb25zCiAgUklTQy1WOiBLVk06IEFsbG93IFpjYSwgWmNm
LCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZvciBHdWVzdC9WTQogIEtWTTogcmlzY3Y6IHNlbGZ0
ZXN0czogQWRkIHNvbWUgWmMqIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QKICBkdC1i
aW5kaW5nczogcmlzY3Y6IGFkZCBaY21vcCBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCiAgcmlz
Y3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFpjbW9wCiAgcmlzY3Y6IGh3cHJvYmU6
IGV4cG9ydCBaY21vcCBJU0EgZXh0ZW5zaW9uCiAgUklTQy1WOiBLVk06IEFsbG93IFpjbW9wIGV4
dGVuc2lvbiBmb3IgR3Vlc3QvVk0KICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBaY21vcCBl
eHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QgICAgICAgICAgfCAgMjggKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbCB8ICA5NSArKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3B1ZmVhdHVyZS5oICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmggICAgICAgICAgICAgICAgfCAgIDYgKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCAgICAgICAgIHwgICA2ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCAgICAgICAgICAgICB8ICAgNiArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
ICAgICAgICAgICAgICAgfCAyNzcgKysrKysrKysrKysrLS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jICAgICAgICAgICAgICAgfCAgIDYgKwogYXJjaC9yaXNjdi9rdm0vdmNw
dV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgIHwgIDEyICsKIC4uLi9zZWxmdGVzdHMva3ZtL3Jp
c2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8ICAyNCArKwogMTAgZmlsZXMgY2hhbmdlZCwgMzc1
IGluc2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygtKQoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
