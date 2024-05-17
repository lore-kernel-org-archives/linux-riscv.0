Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A21DC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ugB5bS27014UUEbPPu+omQiRcmbiO/o4oLpGj8SiQk=; b=gvh6To2GqPQX0z
	iPXsgJdTUK9B1skvMKWy64VPOa/soCsdN1DqEhc3+qpx5flTaLBCmJ3Uzh+1k4/wS6nCdJk+1Pyrh
	g3UUl7vkUC4HtEH4GkR8i/vlCmIm3bQIvxRvIRgDkgyxxz3znecnuQnPX0kBH3ck95Pap1NjqYraj
	u6VP9RSgJzG8jXn4j6cIF7qH5a5dsvf+JiIeGcxg245A+kPhBycHGTq7ZBFHyYJIQJESmB3Cnr3De
	1IcIuH72sCX44E/NCDhPREj4LhEPpgKNd+Sf7a5RnO9jovZ8qL0Bvl1FfU/nO611o4zoMZltrqU2N
	dJWZdoAvuOTpqop9nF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxX-0000000884c-0Mzh;
	Fri, 17 May 2024 14:53:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxS-0000000881B-387W
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-420139ea1c4so351495e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957596; x=1716562396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBxnVnvMYgrOz5wGG3XSCFV37Hy6vOq+FURf3O2sV60=;
        b=IgFAKVJilKYmWcIWi3/E0JNl/zCEcgLLN0hH3yd+5iNF/WgEZ5M30VkVbLTv5PQVFl
         3ECEgfjmIGDWyF4oHChNrxB7vAOm+dJhtcej2Zj4LZirzUcvDgOXHFscjbhPhuPSnz1d
         lIv4zdnN+lwD86BjnwDlHzgjhE/4EjUfV3xP1Lt8F5obbqpB0l0mS3yl80DykRRDJTUf
         bZ/BiemUXXAJd8A1w49qREVGp98lHza5Ojy/QoNZsoQ7TDqdz7y/M319/XNmEeOqt/dA
         mjqRouoD/laqG2xsWPt8Wnq7+Yj7pMG+bCAgsIeqVPlyVYcqQH0hfAtR/+2QF9x6W+sU
         vX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957596; x=1716562396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBxnVnvMYgrOz5wGG3XSCFV37Hy6vOq+FURf3O2sV60=;
        b=NkV8vR26f02tkZWW4uUt5rzpWMDqbIpGYlgGhCT4i53MZb7pfu34naIp8uN4YWl4N9
         wHnZgK3RsCDshnZgnnbjatDankIArvES9CrCUgrxxgajBLdBJwS82/wNSqVzUQJr0Q/8
         DhVoJcx1XY1dy/NsK/skVUJe/hzXD5t60yVrhpNfSIT5r0Ve+ILbxXGNcWbET0mdNvnM
         5QS7avWahMNv162a2AazMIYLMKij59i0ByOt1/z8W8dnOsXRUtBE80+aCQLXNGmNw8Xe
         65zAqX7NX8tbmeO1gEaC77zidye+TlFMyzbH4Nug5e3O8gY63hl0Sw22ribXMQ0nP7pE
         zjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNrGQr91W7208v6PD/kWWlFhZYtYTyBVAfpgEgPcbVMuVqwqW36IFZTJrDvE0QtlqpOQliXhZV2c+IBGDWL1W+2RyF0horhi29KMoUAZHS
X-Gm-Message-State: AOJu0YwUvL3UfvG9xPpVUEaQgAe74a0mZlrrdP9WxgaI+d+a2ozOrWhA
	eGTNeFiNMZPamBfr+NBksYWLEdyjkYVQGAFffjja++juoq7a/Z5fc26xTtaUrlg=
X-Google-Smtp-Source: AGHT+IElTJZHwS4R62Imc5G809nVY5XtS1QeDbXqWpbZYtlvSrsfuUs8xxpZzJsOl058opK+T4g56g==
X-Received: by 2002:a05:600c:3b0a:b0:41a:3150:cc83 with SMTP id 5b1f17b1804b1-41feac59d8emr162018155e9.2.1715957595750;
        Fri, 17 May 2024 07:53:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:14 -0700 (PDT)
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
Subject: [PATCH v5 00/16] Add support for a few Zc* extensions, Zcmop and Zimop
Date: Fri, 17 May 2024 16:52:40 +0200
Message-ID: <20240517145302.971019-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075318_913669_A1985B6F 
X-CRM114-Status: UNSURE (   9.06  )
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
NDA0MDkxNDM4MzkuNTU4Nzg0LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8gWzJdCgotLS0KCnY1Ogog
LSBNZXJnZWQgaW4gWmltb3AgdG8gYXZvaWQgYW55IHVuZWVkZWQgc2VyaWVzIGRlcGVuZGVuY2ll
cwogLSBSZXdvcmsgZGVwZW5kZW5jeSByZXNvbHV0aW9uIGxvb3AgdG8gbG9vcCBvbiBzb3VyY2Ug
aXNhIGZpcnN0IHJhdGhlcgogICB0aGFuIG9uIGFsbCBleHRlbnNpb25zLgogLSBEaXNhYmxlZCBl
eHRlbnNpb25zIGluIHNvdXJjZSBpc2Egb25jZSBzZXQgaW4gcmVzb2x2ZWQgaXNhCiAtIFJlbmFt
ZSByaXNjdl9yZXNvbHZlX2lzYSgpIHBhcmFtZXRlcnMKCnY0OgogLSBNb2RpZnkgdmFsaWRhdGUo
KSBjYWxsYmFja3MgdG8gcmV0dXJuIDAsIC1FUFJPQkVERUZFUiBvciBhbm90aGVyCiAgIGVycm9y
LgogLSB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNDIzMTI0MzI2LjI1MzI3
OTYtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKdjM6CiAtIEZpeCB0eXBvICJleGlzdHMiIC0+ICJl
eGlzdCIKIC0gUmVtb3ZlIEMgaW1wbGllcyBaY2EsIFpjZCwgWmNmLCBkdC1iaW5kaW5ncyBydWxl
cwogLSBSZXdvcmsgSVNBIHN0cmluZyByZXNvbHZlciB0byBoYW5kbGUgZGVwZW5kZW5jaWVzCiAt
IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA0MTgxMjQzMDAuMTM4Nzk3OC0x
LWNsZWdlckByaXZvc2luYy5jb20vCgp2MjoKIC0gQWRkIFpjKiBkZXBlbmRlbmNpZXMgdmFsaWRh
dGlvbiBpbiBkdC1iaW5kaW5ncwogLSB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDI0MDQxMDA5MTEwNi43NDkyMzMtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKQ2zDqW1lbnQgTMOp
Z2VyICgxNik6CiAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgWmltb3AgSVNBIGV4dGVuc2lvbiBk
ZXNjcmlwdGlvbgogIHJpc2N2OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciBaaW1vcAog
IHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmltb3AgSVNBIGV4dGVuc2lvbgogIFJJU0MtVjogS1ZN
OiBBbGxvdyBaaW1vcCBleHRlbnNpb24gZm9yIEd1ZXN0L1ZNCiAgS1ZNOiByaXNjdjogc2VsZnRl
c3RzOiBBZGQgWmltb3AgZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0CiAgZHQtYmluZGlu
Z3M6IHJpc2N2OiBhZGQgWmNhLCBaY2YsIFpjZCBhbmQgWmNiIElTQSBleHRlbnNpb24KICAgIGRl
c2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9ucyB2YWxpZGF0aW9uIGNhbGxiYWNr
CiAgcmlzY3Y6IGFkZCBJU0EgcGFyc2luZyBmb3IgWmNhLCBaY2YsIFpjZCBhbmQgWmNiCiAgcmlz
Y3Y6IGh3cHJvYmU6IGV4cG9ydCBaY2EsIFpjZiwgWmNkIGFuZCBaY2IgSVNBIGV4dGVuc2lvbnMK
ICBSSVNDLVY6IEtWTTogQWxsb3cgWmNhLCBaY2YsIFpjZCBhbmQgWmNiIGV4dGVuc2lvbnMgZm9y
IEd1ZXN0L1ZNCiAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgc29tZSBaYyogZXh0ZW5zaW9u
cyB0byBnZXQtcmVnLWxpc3QgdGVzdAogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpjbW9wIElT
QSBleHRlbnNpb24gZGVzY3JpcHRpb24KICByaXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFyc2lu
ZyBmb3IgWmNtb3AKICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFpjbW9wIElTQSBleHRlbnNpb24K
ICBSSVNDLVY6IEtWTTogQWxsb3cgWmNtb3AgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQogIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFpjbW9wIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QgdGVz
dAoKIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgICAgICAgICB8ICAyOCAr
KwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgIDk1ICsr
KysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oICAgICAgICAgICB8ICAy
NiArLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgIHwgICA2
ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAgNiAr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAgfCAgIDYgKwog
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwgMjQ0ICsrKysr
KysrKysrKy0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAg
ICAgIHwgICA2ICsKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAg
ICB8ICAxMiArCiAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAg
fCAgMjQgKysKIDEwIGZpbGVzIGNoYW5nZWQsIDM2NiBpbnNlcnRpb25zKCspLCA4NyBkZWxldGlv
bnMoLSkKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
