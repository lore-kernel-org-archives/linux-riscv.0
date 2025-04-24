Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2181C369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JllKnHXOELZSD+0l0hOB78QyE3IKAoVFtLm0xOPZx8k=; b=NSs6wluvRt6OJ8
	7r7HiRus/QteNaSTokGltgyWiWhR6GVDxZqmvJCOYp88t3IEb5nxiV7wc6tx+IJG2lztb50squ0YK
	cnsH77TCWNneA2DXYGnGHHmTWAG0Yy+nIr02+PL2uZkXm7undCAzkN/l8rbWIh/RdtIh/MV96mKWt
	S55wtT/OVtbYiMcLb8RdatLWb9RI+9d6/bslokGaBlKaVBC4TE6qQf/YTQbW7Kq7xSUYR0AD/n0Ex
	CuGH71kL9gemdqhUV254cXV7gWfw/ZXR6YRoOSbacCc/dvuV67X9M+DmRqPdS8xzWzGntQXGJ8slu
	TSEQl0lbcFNVhONgvKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80TU-0000000Euwy-3DGk;
	Thu, 24 Apr 2025 17:35:00 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80TR-0000000Euux-49zK
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:34:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225df540edcso26124855ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516097; x=1746120897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9V9rr9KXScjB209CCQhOyL2xY7TO+2YEqW9Zt14WVs=;
        b=Pt4pnkKZ/VGWnXnyGpZMkLC5i8IuqW5qRlsnsi7xUOiy5Y4T1gojQryfD1o8z9lX/D
         YrNgM0wo9vj57+MhMvZfq5rOy9CuH3dDLKIW/d6HSJ5+olly4HIY46bXyqkutPoim+Ji
         fRKzg261/rwz57MZVgBENkSZ2CuTK543CtO8osnaQ8hYVyUl5J+/74OG8WuKdee11LfQ
         DXI9unDwaYhY3LZVWDopD6P0Se6NATkcY8GjmKXvrPhNb2KKKbap1yqPOx2oOGOOv8Nr
         dq6nGsTdbiTRdB3gbr18EcCLTYGWwjHYfruVOms/i33sVPiZrW+XGdvpj13Wb86ZUovG
         YXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516097; x=1746120897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9V9rr9KXScjB209CCQhOyL2xY7TO+2YEqW9Zt14WVs=;
        b=VX0UjCLG/fnAl8w99eiYdAWtZuACZuaD4ULs/VS2blk+Lt0KstjbhiDwjsnsUGItgC
         YZM6bQIemgqVrt5lhRiildf1hpo0u9GzJsyVaDD3eiKcs/dCUZAn7TgjH5aq1a+RanRX
         B7OwzZNdAQTNxbiZpdlBJ0dbRWqZH5odthK3X8eaNqECady1c/cObZcb26bIMRII7fTz
         TGlb0Lub7emZk8nJpxeWZcoWeXjH0d9GOaGrZQzIYPA8pSk+8qt7iRfvVUS0/J+7YlcY
         W3Nv5wGJmGMGhGkufHGJ0eZLqWsowjMDIkALRjLB84hpq6iuI0LNDoSh3K5lxhD0syis
         9iOA==
X-Forwarded-Encrypted: i=1; AJvYcCXiyHFEP2xFxhwBoYWvJM8CqSNb05Q6CHm+2duDq4TFnOIic9rodUpsvG1FMF+7NqerKmHL+WWekI3TXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4HvmxST8j3y3CIL2iqsEQykXUPCrHMbbfj+MhHAhtoezGTJ2Y
	ciQXFteb2YxYDojCOETw4RSfJXOP9PHl9j28a9esYF/0v5Quko/VzAeAdseIrEY=
X-Gm-Gg: ASbGnctW5oI8z1LJ9pVFomCbD5haqLl6hhaLTtHAqrt1F3QCKhMM9+EJQYXOEk+oZLf
	K1LKW4YcemEsKdSs8VBRRSd3JAMDszU5+uz6ZQhtqBIJ+mQPAY4UNRB+rfYgM7c6cA8jsqpJ0v9
	/sXPnYxx7ZESwk4Ui7ybwQJt+O3RH/HQvLyQHFu/sJ4lvZEtQguENYYC5bO4BLozVhQPbeFiN8V
	l02eQEPUT5TGC1N/C1V5MkkQeD67YfstSHyIe7h9Cc4tjM9N468U2QXHObFZOJJOC01s6+denxf
	YkQc3PbWAVxNRASPgnPVaCHil2L7ErZNBhLdiruDsR98qQwzRoju
X-Google-Smtp-Source: AGHT+IGAQrQw/KilPGjWcs2DXTqeGJNePUSlT3bxzRIay4dKTLJvYkpcmDxPXRgdgSxGOsYJ0V1TjQ==
X-Received: by 2002:a17:903:14b:b0:223:607c:1d99 with SMTP id d9443c01a7336-22db46a3332mr45750265ad.0.1745516097242;
        Thu, 24 Apr 2025 10:34:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 09/14] riscv: misaligned: move emulated access uniformity check in a function
Date: Thu, 24 Apr 2025 19:31:56 +0200
Message-ID: <20250424173204.1948385-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103458_023762_869C4D24 
X-CRM114-Status: GOOD (  11.29  )
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

U3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkgb2YgbWlzYWxpZ25l
ZCBhY2Nlc3NlcwpwZXJmb3JtYW5jZSBvbiBhbGwgY3B1cyBmcm9tIGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKQp0byBpdHMgb3duIGZ1bmN0aW9uIHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgZGVsZWdhdGlvbiBjaGVjay4gTm8KZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVu
ZGVkLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAxOCArKysrKysrKysrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCBlMDJlOWI0YjBmYzUuLjQxMGIy
ZTBlMDc2NSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNjY2LDEwICs2
NjYsMjAgQEAgc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11
bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKIAlyZXR1cm4gMDsKIH0KIAotYm9vbCBfX2luaXQgY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQorc3RhdGljIGJvb2wg
YWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKIHsKIAlpbnQg
Y3B1OwogCisJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCisJCWlmIChwZXJfY3B1KG1pc2FsaWdu
ZWRfYWNjZXNzX3NwZWVkLCBjcHUpICE9CisJCSAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
U0NBTEFSX0VNVUxBVEVEKQorCQkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRydWU7Cit9CisK
K2Jvb2wgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9p
ZCkKK3sKIAkvKgogCSAqIFdlIGNhbiBvbmx5IHN1cHBvcnQgUFJfVU5BTElHTiBjb250cm9scyBp
ZiBhbGwgQ1BVcyBoYXZlIG1pc2FsaWduZWQKIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0
YXNrcyByZXF1ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQpAQCAtNjc3LDEwICs2
ODcsOCBAQCBib29sIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9j
cHVzKHZvaWQpCiAJICovCiAJb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZCwgTlVMTCwgMSk7CiAKLQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKLQkJaWYgKHBlcl9j
cHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkKLQkJICAgICE9IFJJU0NWX0hXUFJPQkVf
TUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQpCi0JCQlyZXR1cm4gZmFsc2U7CisJaWYgKCFhbGxf
Y3B1c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCgpKQorCQlyZXR1cm4gZmFsc2U7
CiAKIAl1bmFsaWduZWRfY3RsID0gdHJ1ZTsKIAlyZXR1cm4gdHJ1ZTsKLS0gCjIuNDkuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
