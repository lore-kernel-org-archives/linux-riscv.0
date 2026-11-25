Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D95606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2YjorB0r;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s+XRX0Ys
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wB1nVSX7+t2rVZnHcNXA/xzhvTt9w31cRwHYMr/coMc=; b=2YjorB0rvoU1pdB8tLMegGk7yk
	wtu2aoWbdD2P286MlQJ9YpsZtRx5uYgfk1ZWIsjnZ9vBtwcT20D/q5cS241VF2v096BJ7LAJncdIc
	vBpqje4SzyWBlF9geJTtIECP5W1YNYAoAQIdVbeL/VnFS3AlOkfs6Vr2q7l2nj/4ElpK+nmGvyfBw
	2d/tmd2x8+MZH2fs4nKGbQNjTo8A9QQJjuX0wZm3TF8WkFcVE2vtB5ZEmsOAb0wL6ezj/ez1MATuU
	okO2Ul2MabS/zKys4EqVj8WYCT4jQs85vhalZPSJC3emxJVNgvp0/x2AeQ1MvD8SM90Z1X3/hSgBp
	ilKlYXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRq-0000000BYMA-39mP;
	Wed, 25 Nov 2026 23:30:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRm-0000000BYJq-1XyU
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:30:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5593842f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649440; x=1796254240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1Ij9HGRNVPxHOypgke3ebIZ/asDfBx2BgBH8YIUh70=;
        b=s+XRX0Ysn8iH2x7CJy+1jJsRfxrKsDAoVtQwjtf3n2yETz0MKa9psEDcBb/4aNDo8R
         steU0WISS40GFL+MG44cSFKjvChTeeQpVl8K6ubT/C1ukqHhm27I4YZeeuX0gACkU4mh
         wgYf8rRUWXRaN9UsM9MZrPFxxwLbx9i/j3ktAgo2ULaTKBuxIuq7zJMdXbRfGr9xCZMR
         CxbP3rJRtJeqcN49VCshmN8E+tlbrlxvcagZvnZj8mUiAMCZXII+KezxTvMbCSNuJN2W
         Q5kvKvanbuy6zm2UyIwdqDnxF0T0I619tVoasBbdX6wFlNdqHPg+03uEmE5ddTNa0ncx
         qkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649440; x=1796254240;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1Ij9HGRNVPxHOypgke3ebIZ/asDfBx2BgBH8YIUh70=;
        b=i+B0nFxLLw6NQnhr2gZTXN0kos+hRch1sEIfOuloQJogAywoeFTopYAoQkTqw+K2OY
         vUx4wDTDwDOL6Il45MW+oae4Ip9CVsTGzdL3NUXE/hYHhuHPBilDa743iphfbD0TvqeF
         W4byQeCnWo1lMjtC4TOWnbxarAUzXf14OhwEByt8V207NgbVjxEDT+lt4jqZnAZdc6rZ
         10zyBmcgd/L6NbP2X9BF/4E9kei4/N8Es+5cHEn4QWqg7Ec8XwveFardyakUwB/0cfPy
         0ZcK606QJdsASeK1GZ9YnvjrYhdf3kVvgRWoqzpcseKSK2FdtGRCxNjcZfi9ZtuNrxfQ
         Yi6g==
X-Gm-Message-State: APuU4Z9/jlUxq5cUFXhr+Gh2Uulb3BoniLPfZrHAmFjXwVgsDFm5k1dF
	OZ9zWvczpPtZUCusKAmoxn12Thk2XDltJX64adKVosYQJBn0B9EvOMcQmbpuEQ/DbKg=
X-Gm-Gg: AZFdTZfPhNfKAdyl4VpS8Eu9PwRS2uNXgwJab3EDcvzQw7OZPTrMuJIB9sB8UOi7QZz
	e7XAcPhUED/FiBMymUd4+Wj60OOzRBwGAYxM/05uc4VWy1egqqTL7ZbZgVYBjQ+cIObNMrmuMUs
	ltAQQYsPalzSq4B+5hVxGopaHGk3M3tdxyrPNegJ5ZSFVfObHGB4G19H8C3OVhf5HV6Y4TTQVP2
	wgE+txPrLBF2XksoAQIOXeJSzfnYhz7ZM7yhpFwcGORs6amKqJcnfJdnD2SiwY6nbgMv78xcnFL
	jZpP5v0X4QMk46Zwb5qAy+q0JOVdOWagz7tCwVEOtJs4hHrAVtMC+B6guXK6eeqUtq+B5faXvJJ
	xa/QFb5LQTEz71VY2rKkej4FlSJhcLV2ymKXmlLfkfH8E4QSQJ6M19B29FeQKg7FFycZt3o/Ueh
	PghDaFN3xZ2a4SM/RPRgmspcFAxQegYJjwMWUSOgCkGGT78w75vk/83cvP36Y92iCGtkB3ca7FR
	juXJMzAV+T0W9MfIN/C4Nu+PzTC0/zIZgLjNZPU3PwPqmc7I2VusC6GQv8orN5cvFHdkrkVDMbq
	f/M6tQ2cnY/PPHf3Bal2lTIyUbT2GmYB74JN4Jj0SAqBuas4BZdOJC/qI3lzbMvowbXPNHaYwMb
	g3V0FlV1t2Q==
X-Received: by 2002:a05:6000:4284:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-4abb9edfd7cmr38748071f8f.56.1795649440438;
        Wed, 25 Nov 2026 15:30:40 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm37411248f8f.28.2026.11.25.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:40 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH RFC 02/19] riscv: Handle ESP32-P4 CLIC trap context
Date: Wed, 25 Nov 2026 23:30:03 +0000
Message-ID: <20261125233020.1380594-3-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153042_466204_689D2476 
X-CRM114-Status: GOOD (  15.73  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIEVTUDMyLVA0IENMSUMgZW5jb2RlcyB0cmFwIHJldHVybiBzdGF0ZSBhbG9uZ3NpZGUgdGhl
IGNhdXNlCmNvZGUgYW5kIGludGVycnVwdCBmbGFnIGluIG1jYXVzZS4gVGhlIFJJU0MtViBleGNl
cHRpb24gZGlzcGF0Y2hlcgpleHBlY3RzIG9ubHkgdGhlIGNhdXNlIGNvZGUgYW5kIGludGVycnVw
dCBmbGFnLgoKU2F2ZSB0aGUgcmF3IG1jYXVzZSBpbiBwdF9yZWdzLCBub3JtYWxpemUgdGhlIGNh
dXNlIGZvciBkaXNwYXRjaAphbmQgdHJhbnNsYXRlIE1QUCBhbmQgTVBJRSBpbnRvIHRoZSBzYXZl
ZCBzdGF0dXMgbGF5b3V0LiBSZXN0b3JlCnRoZSBzYXZlZCBpbnRlcnJ1cHQgbGV2ZWwgYW5kIHJl
YnVpbGQgTVBQIGFuZCBNUElFIGZyb20gcHRfcmVncwpvbiB0aGUgbm9uLXZlY3RvcmVkIHRyYXAg
cmV0dXJuIHBhdGguCgpUaGUgY3VycmVudCBDTElDIGxldmVsIHN0YXlzIGFjdGl2ZSB1bnRpbCBt
cmV0LiBpcnFfZXhpdF9yY3UoKSBjYW4KcnVuIHNvZnRpcnFzIHdpdGggaW50ZXJydXB0cyBlbmFi
bGVkLCBhbmQgaXJxZW50cnlfZXhpdCgpIGNhbgpzY2hlZHVsZSBiZWZvcmUgdGhlIGZpbmFsIG1y
ZXQuIEhvbGRpbmcgdGhlIGhhcmRpcnEgbGV2ZWwgYWNyb3NzCmVpdGhlciBwYXRoIGJsb2NrcyBp
bnRlcnJ1cHRzIGF0IHRoYXQgbGV2ZWwgb3IgYmVsb3cuCgpSZXN0b3JlIHRoZSBpbnRlcnJ1cHRl
ZCBjb250ZXh0J3MgbGV2ZWwgd2l0aCBhbiBNLW1vZGUgbXJldAphZnRlciB0aGUgaGFyZGlycSBo
YW5kbGVyIGFuZCBiZWZvcmUgaXJxX2V4aXRfcmN1KCkuIEtlZXAgaW50ZXJydXB0cwptYXNrZWQg
YWNyb3NzIHRoaXMgaW50ZXJtZWRpYXRlIHJldHVybiBhbmQgcmV0YWluIHRoZSBvcmlnaW5hbAp0
cmFwIGZyYW1lLgoKVGVzdGVkIG9uIGEgV2F2ZXNoYXJlIEVTUDMyLVA0LU1vZHVsZS1ERVYtS0lU
IHdpdGggcmV2aXNpb24gdjMuMgpzaWxpY29uLiBUaGUga2VybmVsIGJvb3RlZCB0byBhIFVBUlQg
c2hlbGwsIGNvbXBsZXRlZCAyMCBjb25zZWN1dGl2ZQp0d28tcHJvY2VzcyBwaXBlbGluZXMgYW5k
IGNvbnRpbnVlZCB0byByZWNlaXZlIENMSU5UIHRpbWVyIGFuZCBVQVJUMAppbnRlcnJ1cHRzLgoK
QUkgYXNzaXN0ZWQgd2l0aCB0aGUgYXNzZW1ibHkgYW5kIEpUQUcgZGlhZ25vc2lzLgoKTGluazog
aHR0cHM6Ly9kb2N1bWVudGF0aW9uLmVzcHJlc3NpZi5jb20vZXNwMzItcDRfdGVjaG5pY2FsX3Jl
ZmVyZW5jZV9tYW51YWxfZW4ucGRmClNpZ25lZC1vZmYtYnk6IFbDrXRvciBIdWdvIFNpbHZhIDx2
aXRvcmhnMjAwODBAZ21haWwuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXBy
b3RvdHlwZXMuaCB8ICA0ICsrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oICAgICAg
ICAgfCAgNCArKwogYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyAgICAgICAgIHwgIDMg
KysKIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgICB8IDYxICsrKysrKysr
KysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgICAgICAg
ICB8ICA0ICsrCiA1IGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKaW5kZXggYTBjYTllZmZmMjY3Li5lMGZlYzcxMDIy
ZjkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKQEAgLTY0LDQgKzY0
LDggQEAgYXNtbGlua2FnZSB2b2lkIGhhbmRsZV9iYWRfc3RhY2soc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpOwogYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
OwogYXNtbGlua2FnZSB2b2lkIGRvX2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncyk7CiAKKyNpZmRl
ZiBDT05GSUdfUklTQ1ZfRVNQMzJQNF9DTElDCithc21saW5rYWdlIHZvaWQgZXNwMzJwNF9jbGlj
X3Jlc3RvcmVfaXJxX2xldmVsKHVuc2lnbmVkIGxvbmcgY2F1c2UpOworI2VuZGlmCisKICNlbmRp
ZiAvKiBfQVNNX1JJU0NWX1BST1RPVFlQRVNfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmgKaW5k
ZXggYWRkYzgxODgxNTJmLi41NzI5ZmJhYzBiNTcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcHRyYWNlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2UuaApA
QCAtNTMsNiArNTMsMTAgQEAgc3RydWN0IHB0X3JlZ3MgewogCXVuc2lnbmVkIGxvbmcgY2F1c2U7
CiAJLyogYTAgdmFsdWUgYmVmb3JlIHRoZSBzeXNjYWxsICovCiAJdW5zaWduZWQgbG9uZyBvcmln
X2EwOworI2lmZGVmIENPTkZJR19SSVNDVl9FU1AzMlA0X0NMSUMKKwkvKiBSYXcgbWNhdXNlIGZv
ciBDTElDIHRyYXAgcmV0dXJuICovCisJdW5zaWduZWQgbG9uZyBjbGljX21jYXVzZTsKKyNlbmRp
ZgogfTsKIAogI2RlZmluZSBQVFJBQ0VfU1lTRU1VCQkJMHgxZgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRz
LmMKaW5kZXggYTc1ZjBjZmVhMWU5Li45ZjgzMTBkZDBhNmUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNl
dHMuYwpAQCAtMTMwLDYgKzEzMCw5IEBAIHZvaWQgYXNtX29mZnNldHModm9pZCkKIAlPRkZTRVQo
UFRfU1RBVFVTLCBwdF9yZWdzLCBzdGF0dXMpOwogCU9GRlNFVChQVF9CQURBRERSLCBwdF9yZWdz
LCBiYWRhZGRyKTsKIAlPRkZTRVQoUFRfQ0FVU0UsIHB0X3JlZ3MsIGNhdXNlKTsKKyNpZmRlZiBD
T05GSUdfUklTQ1ZfRVNQMzJQNF9DTElDCisJT0ZGU0VUKFBUX0NMSUNfTUNBVVNFLCBwdF9yZWdz
LCBjbGljX21jYXVzZSk7CisjZW5kaWYKIAogCU9GRlNFVChTVVNQRU5EX0NPTlRFWFRfUkVHUywg
c3VzcGVuZF9jb250ZXh0LCByZWdzKTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKaW5kZXggZjY1OWJmNjJiYjM5Li45
MTI2OWFiODJjNjAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwpAQCAtMTk2LDYgKzE5NiwyMiBAQCBTWU1fQ09ERV9T
VEFSVChoYW5kbGVfZXhjZXB0aW9uKQogCWNzcnIgczIsIENTUl9FUEMKIAljc3JyIHMzLCBDU1Jf
VFZBTAogCWNzcnIgczQsIENTUl9DQVVTRQorI2lmZGVmIENPTkZJR19SSVNDVl9FU1AzMlA0X0NM
SUMKKwlSRUdfUyBzNCwgUFRfQ0xJQ19NQ0FVU0Uoc3ApCisJLyogVHJhbnNsYXRlIENMSUMgTVBQ
IGFuZCBNUElFIGludG8gdGhlIHNhdmVkIG1zdGF0dXMgbGF5b3V0LiAqLworCWxpIHQwLCB+KFNS
X01QUCB8IFNSX01QSUUpCisJYW5kIHMxLCBzMSwgdDAKKwlzcmxpIHQwLCBzNCwgMjggLSAxMQor
CWxpIHQxLCBTUl9NUFAKKwlhbmQgdDAsIHQwLCB0MQorCW9yIHMxLCBzMSwgdDAKKwlzcmxpIHQw
LCBzNCwgMjcgLSA3CisJYW5kaSB0MCwgdDAsIFNSX01QSUUKKwlvciBzMSwgczEsIHQwCisJLyog
S2VlcCB0aGUgaW50ZXJydXB0IGZsYWcgYW5kIHRoZSBzaXggYml0IENMSUMgY2F1c2UgY29kZS4g
Ki8KKwlsaSB0MCwgQ0FVU0VfSVJRX0ZMQUcgfCAweDNmCisJYW5kIHM0LCBzNCwgdDAKKyNlbmRp
ZgogCWNzcnIgczUsIENTUl9TQ1JBVENICiAJUkVHX1MgczAsIFBUX1NQKHNwKQogCVJFR19TIHMx
LCBQVF9TVEFUVVMoc3ApCkBAIC0zMTEsNiArMzI3LDI1IEBAIFNZTV9DT0RFX1NUQVJUX05PQUxJ
R04ocmV0X2Zyb21fZXhjZXB0aW9uKQogCiAJY3NydyBDU1JfU1RBVFVTLCBhMAogCWNzcncgQ1NS
X0VQQywgYTIKKyNpZmRlZiBDT05GSUdfUklTQ1ZfRVNQMzJQNF9DTElDCisJLyoKKwkgKiBQcmVz
ZXJ2ZSBJTlQsIE1QSUwgYW5kIENPREUgZnJvbSB0aGUgc2F2ZWQgdHJhcC4KKwkgKiBDbGVhciBN
SU5IViBzbyBtcmV0IHVzZXMgbWVwYyBhcyBhbiBpbnN0cnVjdGlvbiBhZGRyZXNzLgorCSAqLwor
CVJFR19MIGEzLCBQVF9DTElDX01DQVVTRShzcCkKKwlsaSBhNCwgQ0FVU0VfSVJRX0ZMQUcgfCAo
MHhmZiA8PCAxNikgfCAweDNmCisJYW5kIGEzLCBhMywgYTQKKworCS8qIFJlYnVpbGQgTVBQIGFu
ZCBNUElFIGZyb20gdGhlIGN1cnJlbnQgcHRfcmVncyBzdGF0dXMuICovCisJbGkgYTQsIFNSX01Q
UAorCWFuZCBhNCwgYTAsIGE0CisJc2xsaSBhNCwgYTQsIDI4IC0gMTEKKwlvciBhMywgYTMsIGE0
CisJYW5kaSBhNCwgYTAsIFNSX01QSUUKKwlzbGxpIGE0LCBhNCwgMjcgLSA3CisJb3IgYTMsIGEz
LCBhNAorCWNzcncgQ1NSX0NBVVNFLCBhMworI2VuZGlmCiAKIAlSRUdfTCB4MSwgIFBUX1JBKHNw
KQogCVJFR19MIHgzLCAgUFRfR1Aoc3ApCkBAIC0zMjksNiArMzY0LDMyIEBAIFNZTV9JTk5FUl9M
QUJFTChyZXRfZnJvbV9leGNlcHRpb25fZW5kLCBTWU1fTF9HTE9CQUwpCiBTWU1fQ09ERV9FTkQo
cmV0X2Zyb21fZXhjZXB0aW9uKQogQVNNX05PS1BST0JFKHJldF9mcm9tX2V4Y2VwdGlvbikKIAor
I2lmZGVmIENPTkZJR19SSVNDVl9FU1AzMlA0X0NMSUMKKy8qIFJlc3RvcmUgTVBJTCBmcm9tIHRo
ZSBJUlEgZnJhbWUgd2l0aG91dCBsZWF2aW5nIE0tbW9kZS4gKi8KK1NZTV9GVU5DX1NUQVJUKGVz
cDMycDRfY2xpY19yZXN0b3JlX2lycV9sZXZlbCkKKwljc3JyIHQwLCBDU1JfQ0FVU0UKKwljc3Jy
IHQxLCBDU1JfRVBDCisJY3NycmNpIHQyLCBDU1JfU1RBVFVTLCBTUl9JRQorCisJbGkgdDMsIENB
VVNFX0lSUV9GTEFHIHwgKDB4ZmYgPDwgMTYpIHwgMHgzZgorCWFuZCBhMCwgYTAsIHQzCisJLyog
TVBQPU0gYW5kIE1QSUU9MCBrZWVwIGludGVycnVwdHMgZGlzYWJsZWQgb24gdGhlIHN5bnRoZXRp
YyByZXR1cm4uICovCisJbGkgdDMsIDMgPDwgMjgKKwlvciBhMCwgYTAsIHQzCisJY3NydyBDU1Jf
Q0FVU0UsIGEwCisJbGxhIGEwLCAuTGNsaWNfaXJxX2xldmVsX3Jlc3RvcmVkCisJY3NydyBDU1Jf
RVBDLCBhMAorCW1yZXQKKworLkxjbGljX2lycV9sZXZlbF9yZXN0b3JlZDoKKwljc3J3IENTUl9D
QVVTRSwgdDAKKwljc3J3IENTUl9FUEMsIHQxCisJY3NydyBDU1JfU1RBVFVTLCB0MgorCXJldAor
U1lNX0ZVTkNfRU5EKGVzcDMycDRfY2xpY19yZXN0b3JlX2lycV9sZXZlbCkKK0FTTV9OT0tQUk9C
RShlc3AzMnA0X2NsaWNfcmVzdG9yZV9pcnFfbGV2ZWwpCisjZW5kaWYKKwogI2lmZGVmIENPTkZJ
R19WTUFQX1NUQUNLCiBTWU1fQ09ERV9TVEFSVF9MT0NBTChoYW5kbGVfa2VybmVsX3N0YWNrX292
ZXJmbG93KQogCS8qIHdlIHJlYWNoIGhlcmUgZnJvbSBrZXJuZWwgY29udGV4dCwgc3NjcmF0Y2gg
bXVzdCBiZSAwICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYwppbmRleCBmODI5MmFkZGEwOTkuLjI4MzQzYTYwMTk2OSAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jCkBAIC00MjgsNiArNDI4LDEwIEBAIHN0YXRpYyB2b2lkIG5vaW5zdHIgaGFu
ZGxlX3Jpc2N2X2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAlvbGRfcmVncyA9IHNldF9pcnFf
cmVncyhyZWdzKTsKIAloYW5kbGVfYXJjaF9pcnEocmVncyk7CiAJc2V0X2lycV9yZWdzKG9sZF9y
ZWdzKTsKKyNpZmRlZiBDT05GSUdfUklTQ1ZfRVNQMzJQNF9DTElDCisJLyogUmVzdG9yZSB0aGUg
aW50ZXJydXB0ZWQgbGV2ZWwgYmVmb3JlIGlycV9leGl0X3JjdSgpIGNhbiBydW4gc29mdGlycXMu
ICovCisJZXNwMzJwNF9jbGljX3Jlc3RvcmVfaXJxX2xldmVsKHJlZ3MtPmNsaWNfbWNhdXNlKTsK
KyNlbmRpZgogCWlycV9leGl0X3JjdSgpOwogfQogCi0tIAoyLjU2LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
