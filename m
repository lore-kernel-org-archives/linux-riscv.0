Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151BF606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b2Sgf2q/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVdMxSKn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UN7GR+SGOGEbtYYYpUcDJ3ANlvwIn9ItQQ/h47loqfI=; b=b2Sgf2q/f+uowlWlcoswlatTn3
	4GI/55ehUbPspb7VIwidBadooGS/K7dlaWam6MEQA06m3In0vY40aQKrT3QHIQ1ChnysrQy2XKuxI
	9iKqJymFiKsnCLs+DlXWT1vRbLnAvona4pxpzA4WWiamIdsPlkd8bJkN0g+2vaKhaEhqpKJDiIu+g
	ZsV4qyC0B6tJY7i8S9Z8rjVS83bMktUGv+hiGQVIEz9ZUIJBbPh+asaY425mRzEYlqSyDL4nR7zTR
	RTkT7uJrP4wBXSsbG5XcZe+q03KoeoeUBGxY/Ay3oEJWx0fedE057idVxQFoA6Mu/Hex5/pCnNW9G
	fLHKn6hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzFB-0000000HAk7-1Kbv;
	Fri, 27 Nov 2026 16:56:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzF6-0000000HAgo-0n8v
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 16:56:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5678229f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 08:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798570; x=1796403370; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipkmKJKWGNB6mDs2u9bY6uizcIe+dVA2X22JdmXX2qw=;
        b=XVdMxSKnf97JanPkuAGaueL+REQ5SozmfBXTQySyTXAR+96K8gbaO/IeT7vNauDXsV
         qB19nY2XPazmacAl6DTqobQ5BnYx7JY+vAp6rjpMrw+kZvVETq7kaTeTSm6ZlpMXm0rC
         u0uW1PLG6ZhQjj85dAIE3okkH0bLAINsdvXsCQC8IzFZ3y8viAiQF8PDBBtzp4FHmoDT
         2m8a3+R+IvUTUXMsfzVOr8sbfY1Y8XKeIOdrdlDx4dQuOK8c1oMwsKcjsUXkxpbOzXyi
         1lsH0qdxOi66tWIoQRxwuPSdVLb00IC6wc2Iyx6MtsjzCxeqdyes6rqP2av7eOQWe/95
         SXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798570; x=1796403370;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipkmKJKWGNB6mDs2u9bY6uizcIe+dVA2X22JdmXX2qw=;
        b=LNL+J9uvTY8nP4WxHpo5S6XlA5G/0aMCfWJDrS+/PR2mSSX56EnFmy69NLgqy4+2Ek
         rDKxv+NXJ2vc6o3nIsG70a6kB1+CzqDtt8vX4vM5fjBIWZqMrFRqAQabwObL7rR+lzSn
         4SRXMuZgKY66waR9KZdyJvhax2fIRYpmHRkokJuwJkfu5nbbvYjMAlMYLZtSghtu9HrG
         rfr6FgamDywQOOxs/M7q+peu9fehvvqYS/VtBBC61yhIcyIqUsQc2cGSU4qcQUC33R01
         lV6fv3bYHzZvgCRr90DPhLga499P1+o51duQlZmk+I+Jfltg6r44cDSwgisg3ag1IztS
         xmVQ==
X-Forwarded-Encrypted: i=1; AL+hErFKzoIHJqaQ6cDau81Pd2ACZjMV5Ldoav6BVUZmj9DwJevYXDUtoHvtuu/NOMX1uj2xS6AiD9xG/lx5CQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Jp5qKKNbmsiqc1khsSP+2ZNCWDyY7PyE7i+wI4x16LZMC9SID
	r1IP3bkYSQpnIhbiarrFNws1rHLSzutdpyAyg88F2YYYyZMgb6SaYqIF
X-Gm-Gg: AZFdTZddmWo3Jpconw9xF01lEuFMZyyo6J5t+nuUbi8TdntKGLFm6W2+NqQbpWnWNkS
	43URE6D3aRunCnl4DqdrqoSiWPK2DEJ0VYbCgYj97toMWwYLlIxUZ1YCH1NKq3KwSeyzz4MYgCA
	qj1ySnzTUq270WiHVNcNX8Uogyp/1nGUJg1iMRfH2+8nI+E0anfjn5KjlAB+MZmgP+S/EQmiH4q
	vIu6lUsTJh7CrjXNm94OuicXrWutgKJ1TK2qER2cnktNOEXZZPnpPiHyzS93fb9qWtW9jwifU+l
	61QKcONcqpAsae9R+1Pmd/KQDq5BXXnrgfcIeA3M1Bqp+pOJfHwZfmEyomtpeQIkc+pwF2eSZOe
	xCkFahFUl0c/nNcSNQflNrWvFsi6NQm0FQAV3zfPLDNSizFuFB5mNCXdg1geGJtZvFN9rcFWNXB
	eBahLoAdAQMZLVEG8FZo6mC55LpewwFzWbBbPGrVyipnIaVkPbuQQkZJMdOD/pMIP3VGeKwzksc
	zHdXiD2wcylPzCe6VyfJsqYsVgZnwKBb67VjMCdHLECQQCS1fcZFr3cNgVE10uK2Qz75dVJ4gPH
	NOCN/aThjDfAvdL3lzdfwXFbJ0Wzz13aUx684k4+8gOnh4kuAoFIAHifYCBi3Onh3pujooGWEhB
	m2FRaI+0=
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr352984235e9.26.1795798570113;
        Fri, 27 Nov 2026 08:56:10 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm979838655e9.11.2026.11.27.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:09 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 3/4] serial: esp32: Deliver and mask receive break interrupts
Date: Fri, 27 Nov 2026 16:55:51 +0000
Message-ID: <20261127165552.133713-3-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127165552.133713-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-11-vitorhg20080@gmail.com>
 <20261127165552.133713-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_085612_709630_2CEFF0D9 
X-CRM114-Status: GOOD (  10.51  )
X-Spam-Score: -1.9 (-)
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

UGFzcyBhIGhhcmR3YXJlIGJyZWFrIHRvIHRoZSBUVFkgbGF5ZXIgd2hlbiB1YXJ0X2hhbmRsZV9i
cmVhaygpCmxlYXZlcyBpdCB1bmhhbmRsZWQuIFRoaXMgbGV0cyB0aGUgbGluZSBkaXNjaXBsaW5l
IGFwcGx5IHRoZSBicmVhawpoYW5kbGluZyBjb25maWd1cmVkIGluIHRlcm1pb3MuCgpNYXNrIHRo
ZSBicmVhayBpbnRlcnJ1cHQgdG9nZXRoZXIgd2l0aCB0aGUgUlggRklGTyBpbnRlcnJ1cHQgaW4K
c3RvcF9yeCgpIHNvIGEgYnJlYWsgY2Fubm90IHJlc3RhcnQgcmVjZWl2ZSBoYW5kbGluZy4gTGVh
dmUgdGhlIFRYCmludGVycnVwdCBtYXNrIHVuY2hhbmdlZC4KCkEgbW9ja2VkIGludGVycnVwdCB0
ZXN0IHZlcmlmaWVkIGJyZWFrIGRlbGl2ZXJ5LCBoYW5kbGluZyBieSB0aGUKc2VyaWFsIGNvcmUg
YW5kIHRoZSByZXN1bHRpbmcgaW50ZXJydXB0IGVuYWJsZSBtYXNrLgoKU2lnbmVkLW9mZi1ieTog
VsOtdG9yIEh1Z28gU2lsdmEgPHZpdG9yaGcyMDA4MEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy90
dHkvc2VyaWFsL2VzcDMyX3VhcnQuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFs
L2VzcDMyX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMKaW5kZXggMGU3
MTI4YS4uNDBhY2ZmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2VzcDMyX3VhcnQu
YworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jCkBAIC0zMTcsNyArMzE3LDgg
QEAgc3RhdGljIHZvaWQgZXNwMzJfdWFydF9yeGludChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQog
CQkgICAgKGVzcDMyX3VhcnRfcmVhZChwb3J0LCBVQVJUX0lOVF9TVF9SRUcpICYgVUFSVF9CUktf
REVUX0lOVCkpIHsKIAkJCWVzcDMyX3VhcnRfd3JpdGUocG9ydCwgVUFSVF9JTlRfQ0xSX1JFRywg
VUFSVF9CUktfREVUX0lOVCk7CiAJCQkrK3BvcnQtPmljb3VudC5icms7Ci0JCQl1YXJ0X2hhbmRs
ZV9icmVhayhwb3J0KTsKKwkJCWlmICghdWFydF9oYW5kbGVfYnJlYWsocG9ydCkpCisJCQkJdHR5
X2luc2VydF9mbGlwX2NoYXIodHR5X3BvcnQsIDAsIFRUWV9CUkVBSyk7CiAJCX0gZWxzZSB7CiAJ
CQlpZiAodWFydF9oYW5kbGVfc3lzcnFfY2hhcihwb3J0LCAodW5zaWduZWQgY2hhcilyeCkpCiAJ
CQkJY29udGludWU7CkBAIC00MDMsNyArNDA0LDcgQEAgc3RhdGljIHZvaWQgZXNwMzJfdWFydF9z
dG9wX3J4KHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCiAJdTMyIGludF9lbmE7CiAKIAlpbnRfZW5h
ID0gZXNwMzJfdWFydF9yZWFkKHBvcnQsIFVBUlRfSU5UX0VOQV9SRUcpOwotCWludF9lbmEgJj0g
flVBUlRfUlhGSUZPX0ZVTExfSU5UOworCWludF9lbmEgJj0gfihVQVJUX1JYRklGT19GVUxMX0lO
VCB8IFVBUlRfQlJLX0RFVF9JTlQpOwogCWVzcDMyX3VhcnRfd3JpdGUocG9ydCwgVUFSVF9JTlRf
RU5BX1JFRywgaW50X2VuYSk7CiB9CiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
