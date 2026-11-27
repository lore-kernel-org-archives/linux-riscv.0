Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D4606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2b2dar8u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t/Gp/KHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+q5oRXFTmPXNdzTxD60AlEAQuFWc8AYp2FJV7RKhOQA=; b=2b2dar8umu4yp2XA/RvDTM5i4s
	+eZ5E24hiER+EyvuYzl+yS8+8SEB3ARIdEcxAfYq0Wj3KRSX7b+irLjwP3iPJE2UpxBdNJt8NSYdA
	x9B0rx8GKo+G6rRtGUaTYcinyS/Uqjn6RcvwWiTOSc77suuFC4QMU/78az0bNBsKs0ezXakKyZkeL
	7vDEZlH0/m/BKKjPLCrhToCJ7SXyGwrXeNPvm0+GPlMtBvRzE4/PKvOGbM01nNsUoOT4o5hww8I2T
	td7XV+tE5GEJ+6Cumoq42ThfrOK8aFU/uCu8kRr1lQIsTfbSsy8kOmdmKuI8luc08QCgFy/E9NAG6
	AVG8RSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1Zg-0000000HXmC-1uHM;
	Fri, 27 Nov 2026 19:25:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1Zc-0000000HXlC-1LaJ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 19:25:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49d05d51553so59398945e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 11:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807530; x=1796412330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XH9gWDCllqbYGijR6SSDBIRKOHxF1ZqXOL/NGtJepT4=;
        b=t/Gp/KHWJa58zwlKvDrfQxZxbInIa+F0zgZNgBAXLQK9Qa/w22qixuzTpxDhWUl/s7
         /CvWb0VpquByNublkchUfWHHGlzpowhh8D6gRh6wwzs6MS+nQPbgsjj9r7g/cXY1Y5qo
         ZRiBvWsyEl6YJked0gf+v5fqPfZRDEQeWP0i1qqRXD2mc/5Geno/1tO3dyfeIaPYnB45
         Ft19oJMsVSURh3hAY8wSSaWw+/IE5HKba9XkzJHNsqRDYXw987dlqu3DPT7LttuN4ANq
         vLA0OUys+jO+OQZzxauwjPoV0H/knimVSj58GFS1rDnt4HlPxq6DJZus1vIihd+WimCP
         Glog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807530; x=1796412330;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XH9gWDCllqbYGijR6SSDBIRKOHxF1ZqXOL/NGtJepT4=;
        b=1gsRgKCg+1uFiuY4kMY/r83TsV705oTskQVKtncKUtuzDAtCG3Up84IEFPG4KRBGPJ
         8MnqZbzKFpPU9rxtd2tKZjgMqxYZc5MJXHfSFqlSVPv3ISHR2MUkVbaxGa5sYQTIB8Iq
         c/h1zGL9Lio1zeIgTyMmUAo/4mbV1z2J0hK1pHBubNwk2XemSoss0vklkAgcZmGBn7AM
         APrhhM97Jf1QBob36Np7ukKIrYO9WmJ1TSOz2R+lhxzkmVfkE9XZwQW+2y4QLVyQCH6i
         mpYKLSNoPqgmiuMXT54BB7qkorWA9oGNm5Cb4W1pKyD30QAyqyE18vP9gGrnzbAH8y+x
         dsRw==
X-Forwarded-Encrypted: i=1; AL+hErHNjbNzpTkTk481jqruOdk5dOC6p6CBW5fXfzvMCojkI5+7LFxx6SCpUEPEy4DfaLgSIrE6xmCbY3vZnQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+i7C89fwj+QN6pjOE6hEfh1kR6Nxyqguql/ZNALsjDKMDp96OT
	alFdWUbg2HLjEyeZ0BU2uI8RZVbTw1rccgPPTpG9ZyacN+T0fBta7EYC
X-Gm-Gg: AZFdTZcxp7iNBRIsLEEBhOY24tQr5jUc2H7AS436W/G5mzJDAvymnbhu99To9/jkghg
	PX3rR5N6iHO7RWk/1byYffvnwbKQNtp4tIWk6iVEmRKD6ctgDclM68VHa07CmHXCSG4dNHnBStx
	6Gu+iaArANabvnJQrZZtYiXaFwUNbyHaXeHmvkdP0/M/YhigbfpprZSCba3vES4vCcJzks617AF
	UWsSUuRo5O4MVsxIKfsAUgd+4GR7fceVXM9q0q1UQApyhQloG6NDsPq2irHMbrTBZeaN2tVBbmu
	xbDCdDm2TvEZP9EEed/RV1i5hjbc58oyUlC7fJgPVcw9u6NAEI42TbEhE4SDvRaMux+XakXlUDe
	XJvbDhIXevBp3VaCGjTn/uwxldPTQbEkQzD2DAkScSFIuFszIuuJ6nFOcEnujbinAsUjRLUYKe6
	2oDJvY2yYcsNfT/qY4+iQ8z7fTUJmeLM4u5+nW32M4UrCCVg+uRMNq1Fycl8xtLdl1Y6ucOmPCJ
	9B59U7hJEh5zJaHFgueUvgGA+Dnkc0Z1bFKYNkoRAcJ7tHjZk0cL00NHy8Z3sny1cAaj38BM5nW
	xqrJADc/xcK1DgAtZevdQne5apjLbueEWMmDp/k0daNSs7EobwR0RNVaEhgnn+KcbpHtUt8l/US
	6bVuTPyfk
X-Received: by 2002:a05:600d:1c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb9de0d5ffmr266662415e9.25.1795807530110;
        Fri, 27 Nov 2026 11:25:30 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm700412425e9.1.2026.11.27.11.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:25:29 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 2/2] serial: esp32: Report active-low CTS correctly on ESP32-S3 and ESP32-P4
Date: Fri, 27 Nov 2026 19:25:11 +0000
Message-ID: <20261127192514.174468-2-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127192514.174468-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-11-vitorhg20080@gmail.com>
 <20261127192514.174468-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_112532_528293_FCF7EABD 
X-CRM114-Status: GOOD (  12.85  )
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

VGhlIEVTUDMyLVMzIGFuZCBFU1AzMi1QNCBVQVJUcyBwZXJtaXQgdHJhbnNtaXNzaW9uIHdoZW4g
Q1RTIGlzIGxvdy4KVGhlIGRyaXZlciBjdXJyZW50bHkgcmVwb3J0cyB0aGUgcmF3IENUUyBsZXZl
bCBhcyBUSU9DTV9DVFMsIHNvClRJT0NNR0VUIHJlcG9ydHMgQ1RTIGFzc2VydGVkIHdoaWxlIHRy
YW5zbWlzc2lvbiBpcyBibG9ja2VkLgoKUmVjb3JkIHRoZSBDVFMgcG9sYXJpdHkgcGVyIHZhcmlh
bnQgYW5kIHJlcG9ydCB0aGUgbG9naWNhbCBDVFMgc3RhdGUuClVzZSB0aGUgZXhpc3RpbmcgcG9s
YXJpdHkgZm9yIHRoZSBvcmlnaW5hbCBFU1AzMi4KCk9uIHRoZSBXYXZlc2hhcmUgRVNQMzItUDQt
TW9kdWxlLURFVi1LSVQsIFVBUlQxIGludGVybmFsIGxvb3BiYWNrCnZlcmlmaWVkIHRoYXQgVElP
Q01HRVQgcmVwb3J0cyBDVFMgZGVhc3NlcnRlZCB3aGlsZSB0cmFuc21pc3Npb24gaXMKYmxvY2tl
ZCBhbmQgYXNzZXJ0ZWQgd2hlbiB0cmFuc21pc3Npb24gcmVzdW1lcy4KCkVTUDMyLVMzIGhhcmR3
YXJlIHRlc3RpbmcgaXMgcGVuZGluZy4KCkFJIGFzc2lzdGVkIHdpdGggZHJpdmVyIGRldmVsb3Bt
ZW50IGFuZCB0aGUgbG9vcGJhY2sgdGVzdC4KU2lnbmVkLW9mZi1ieTogVsOtdG9yIEh1Z28gU2ls
dmEgPHZpdG9yaGcyMDA4MEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy90dHkvc2VyaWFsL2VzcDMy
X3VhcnQuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jCmluZGV4IDdkNThhNDEuLmFiMGY3Mzkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMKKysrIGIvZHJpdmVy
cy90dHkvc2VyaWFsL2VzcDMyX3VhcnQuYwpAQCAtMTQwLDYgKzE0MCw3IEBAIHN0cnVjdCBlc3Az
Ml91YXJ0X3ZhcmlhbnQgewogCWNvbnN0IGNoYXIgKnR5cGU7CiAJYm9vbCBoYXNfY2xrY29uZjsK
IAlib29sIG5lZWRzX3JlZ191cGRhdGU7CisJYm9vbCBjdHNfYWN0aXZlX2xvdzsKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZXNwMzJfdWFydF92YXJpYW50IGVzcDMyX3ZhcmlhbnQgPSB7CkBA
IC0xNzIsNiArMTczLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBlc3AzMl91YXJ0X3ZhcmlhbnQg
ZXNwMzJzM192YXJpYW50ID0gewogCS5yeF9mbG93X3RocmVzaF9tYXNrID0gRVNQMzJTM19VQVJU
X1JYX0ZMT1dfVEhSSEQsCiAJLnR5cGUgPSAiRVNQMzJTMyBVQVJUIiwKIAkuaGFzX2Nsa2NvbmYg
PSB0cnVlLAorCS5jdHNfYWN0aXZlX2xvdyA9IHRydWUsCiAJLmxvb3BiYWNrX21hc2sgPSBVQVJU
X0xPT1BCQUNLLAogCS5zd19ydHNfbWFzayA9IFVBUlRfU1dfUlRTLAogCS5zd19kdHJfcmVnID0g
VUFSVF9DT05GMF9SRUcsCkBAIC0xOTEsNiArMTkzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBl
c3AzMl91YXJ0X3ZhcmlhbnQgZXNwMzJwNF92YXJpYW50ID0gewogCS5yeF9mbG93X3RocmVzaF9t
YXNrID0gRVNQMzJQNF9VQVJUX1JYX0ZMT1dfVEhSSEQsCiAJLnR5cGUgPSAiRVNQMzItUDQgVUFS
VCIsCiAJLm5lZWRzX3JlZ191cGRhdGUgPSB0cnVlLAorCS5jdHNfYWN0aXZlX2xvdyA9IHRydWUs
CiAJLmxvb3BiYWNrX21hc2sgPSBFU1AzMlA0X1VBUlRfTE9PUEJBQ0ssCiAJLnN3X3J0c19tYXNr
ID0gRVNQMzJQNF9VQVJUX1NXX1JUUywKIAkuc3dfZHRyX3JlZyA9IFVBUlRfQ09ORjFfUkVHLApA
QCAtMzMyLDEyICszMzUsMTQgQEAgc3RhdGljIHZvaWQgZXNwMzJfdWFydF9zZXRfbWN0cmwoc3Ry
dWN0IHVhcnRfcG9ydCAqcG9ydCwgdW5zaWduZWQgaW50IG1jdHJsKQogCiBzdGF0aWMgdW5zaWdu
ZWQgaW50IGVzcDMyX3VhcnRfZ2V0X21jdHJsKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCiB7CisJ
Y29uc3Qgc3RydWN0IGVzcDMyX3VhcnRfdmFyaWFudCAqdmFyaWFudCA9IHBvcnRfdmFyaWFudChw
b3J0KTsKIAl1MzIgc3RhdHVzID0gZXNwMzJfdWFydF9yZWFkKHBvcnQsIFVBUlRfU1RBVFVTX1JF
Ryk7CisJYm9vbCBjdHNuID0gc3RhdHVzICYgVUFSVF9DVFNOOwogCXVuc2lnbmVkIGludCByZXQg
PSBUSU9DTV9DQVI7CiAKIAlpZiAoc3RhdHVzICYgVUFSVF9EU1JOKQogCQlyZXQgfD0gVElPQ01f
RFNSOwotCWlmIChzdGF0dXMgJiBVQVJUX0NUU04pCisJaWYgKGN0c24gIT0gdmFyaWFudC0+Y3Rz
X2FjdGl2ZV9sb3cpCiAJCXJldCB8PSBUSU9DTV9DVFM7CiAKIAlyZXR1cm4gcmV0OwotLSAKMi41
Ni4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
