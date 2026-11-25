Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D70606A329
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ex8qFdcU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sKG8uOqc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=svpIRYHLtE9OXAtoW6ixt7I96MitYsAQbH4iTLx1y7E=; b=ex8qFdcUfN81Xvs34bsIuCJyrB
	WD4AUyDKVHw2kwOfpFOlxmEzCoeFNJatAb8l65SkgxgKpT0fHFDRbhU70wTX4aEVIn5OqG5gtK0hP
	R/uBVkX3q1vRXbyqwC5gMYj1YjO2LR5K0khNNL0PZGFb6i4y/4GkJyKweMox5acFX7Cyo6GsEtv5N
	z/1ymZOqNuKfJUeeQ3zvNMMEpFrkpCJwxs8YB7HrpSE46qfU5mkYkCpAc/A6Uxmag1GH/4aOxjalT
	H8ojJHEnGoO8em/Nwa+Xpkz6avrrnYZ5Zj30o04TYuNcSYzSAFvQ12UDL+zk3VCFkciHRdPmELmBY
	rKdYJUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMS7-0000000BYXa-1998;
	Wed, 25 Nov 2026 23:31:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMS3-0000000BYSl-13DD
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:31:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so82288305e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649457; x=1796254257; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1z+y7fmEUMtLnG3lTMWhkUey//yqaPCMXeCiS+uEMnc=;
        b=sKG8uOqcAzyFc6Lodnq36F5llsgUD+ItUzCL24NJ2qrv6NAXSjsFmsjP4Z3Tq10ffM
         eA3IWzx8OneWUBqBskUemnN0QpigNxTR2x/CeNbuHEflnrYFAGA2Q9SAKgfoeDjIuCFj
         24XiDndDgDHmauGWteyopFGt95ssn4BiV4H2QQQrNZ9GpkufJcaQa+8N387Tn6b3i7Q7
         9cYYc2wkW04tyQoNfmGwDDSvt/2XBMymJo1EoeA/PxxO+4JMQHmZ3muPKML/JlLJ2ZHf
         rt2Qyg9IJsH857oWzSkocZivxpwJxTKt4qoeQGrIIG/JgSAReXgipGNABhoP5q07+Wku
         AkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649457; x=1796254257;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1z+y7fmEUMtLnG3lTMWhkUey//yqaPCMXeCiS+uEMnc=;
        b=HiqTBfNoVpPCWagiW7CC5e/KlhElxveq7CnNwtiuY+GZZwgD5GJPSOHVhjhtQ3b7Fb
         7zg9Wt1GF8N4z29IHsEupIHHja/86c5uC2U783xODqKTnjbPTuxS3WaHQhmIWYaXb34/
         GzXZmE9dmMQmxxHQE9h143ihVq+M4Q+2VimW6xHK2L2GpIgcYX51SWqJFPuJLf8dW9RN
         ptII4RGG14ykQyyb6N42Vfl/LPuD9+a+RttJA3ASvY/U088ppduD7cBGBIgFTAau859S
         eGo5dpVgExVzdPplI+Y8NYxlYL5nDhARrTY9vphN8y2+I+fBFx+b9+Tw7vAfzf5hs9Yu
         a2Vw==
X-Gm-Message-State: APuU4Z/pnNfnH8QHy1nGQthsbgPAjtaseOwh9WcmzSRUTrdjhVyuDi4q
	Hxf6uNBz0Ezjh0dhAGwWj1r5syGaJ4+yCx2qLRIsZY7s3w4g2Ka3LAmVV6Dr6/kPeSk=
X-Gm-Gg: AZFdTZcPCtHmhOu4WK++l/Nq87m8Z9D5MwUSTQ8x/yP1i2cbAayDTWRdgCBFjHdhi3s
	XU28U7zk8NFNSVXpyq2sP4W1B3Ltt8Iv7P2a4yYwMsVhhOQ7tzZU8MY+gDNvLmBn+5hr0R5fu5C
	WODiOgREk/nl5pa9o0Slc0hUW6/xBHKl2fnie8mxAvkcWxtilsU9FaPGt2RSY6ybT3rPFq8HENd
	tg5kUMijl7WAxJCgHc3SQXFmLK/GN5CNY/wCPyAf7AroSuZcdtyUeFB9gYFAMVBOaIfVPYGwxRW
	uxgbNGlb80jmfZnanq/tzl8mdv5RUGxytNxHpTJBGUZGs7xbx3V+s3IHK5Zwnqsrk7DVOv+bLbz
	Ie4T7LB0pScJNnM93V9i2aBTqlVfMmyXrIo04Kf+Dgfp6waPoiAtqOlZuiF1UT4cIi5JBRzdCZQ
	znimCCWqtoy+KvTivQcbZWBCl/SF8We5UeaWRFsGXQOr/ryh+ei+aow0oVYqK+LK1A3PslJ/5K0
	VnRfkCcJXTi7sGq22WZN/FKdhUtxjGMxTLXOPx8b0LNLsGhEa4jUEcVUYkzFYmNg6kCx3KDmrgN
	ImaODZL3/0/8HEyXguRNQOehz6PRivathTH69QN3f8R8N2mwTtScdJgwhim2nKYDK6cE3WgIqGO
	NiJWW9MsnbLk=
X-Received: by 2002:a05:600c:5901:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb861467c8mr335670965e9.7.1795649457193;
        Wed, 25 Nov 2026 15:30:57 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm31083635f8f.46.2026.11.25.15.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:56 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 06/19] irqchip: Add Espressif ESP32-P4 interrupt matrix support
Date: Wed, 25 Nov 2026 23:30:07 +0000
Message-ID: <20261125233020.1380594-7-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153059_345072_B3012F19 
X-CRM114-Status: GOOD (  19.93  )
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

UmVnaXN0ZXIgYSBjaGlsZCBJUlEgZG9tYWluIGZvciB0aGUgRVNQMzItUDQgaW50ZXJydXB0IG1h
dHJpeC4KQWxsb2NhdGUgYSBDTElDIGV4dGVybmFsIGludGVycnVwdCBpbnB1dCBmb3IgZWFjaCBw
ZXJpcGhlcmFsIGludGVycnVwdAphbmQgcHJvZ3JhbSB0aGUgcm91dGUgd2hlbiB0aGUgaW50ZXJy
dXB0IGlzIGFjdGl2YXRlZC4gU3VwcG9ydAphY3RpdmUtaGlnaCBsZXZlbCBpbnRlcnJ1cHRzIGZv
ciBzb3VyY2UgbnVtYmVycyAwIHRocm91Z2ggMTI3LgoKRGlzY29ubmVjdCBmaXJtd2FyZSByb3V0
ZXMgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBJUlEgZG9tYWluLiBPbgpFU1AzMi1QNCByZXZpc2lv
biAzLngsIGFsc28gY2xlYXIgdGhlIHRocmVlIGFkZGl0aW9uYWwgcm91dGluZyByZWdpc3RlcnMu
CgpUZXN0ZWQgb24gYSBXYXZlc2hhcmUgRVNQMzItUDQtTW9kdWxlLURFVi1LSVQuIFZlcmlmaWVk
IHRoYXQgcGVyaXBoZXJhbAppbnRlcnJ1cHRzIHdlcmUgZGVsaXZlcmVkIHRvIHRoZSBDTElDIHRo
cm91Z2ggdGhlIG1hdHJpeC4KCkFJIGFzc2lzdGVkIHdpdGggZHJpdmVyIGRldmVsb3BtZW50IGFu
ZCB2YWxpZGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogVsOtdG9yIEh1Z28gU2lsdmEgPHZpdG9yaGcy
MDA4MEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9pcnFjaGlwL01ha2VmaWxlICAgICAgICAgICAg
IHwgICAxICsKIGRyaXZlcnMvaXJxY2hpcC9pcnEtZXNwMzJwNC1pbnRtdHguYyB8IDEzOSArKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTQwIGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lycWNoaXAvaXJxLWVzcDMycDQtaW50bXR4
LmMKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUgYi9kcml2ZXJzL2lycWNo
aXAvTWFrZWZpbGUKaW5kZXggNDA4ZDA2YzIwYWI4Li43NzJkOTU1OGJiYzggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaXJxY2hpcC9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUK
QEAgLTEwMyw2ICsxMDMsNyBAQCBvYmotJChDT05GSUdfQ1NLWV9NUElOVEMpCQkrPSBpcnEtY3Nr
eS1tcGludGMubwogb2JqLSQoQ09ORklHX0NTS1lfQVBCX0lOVEMpCQkrPSBpcnEtY3NreS1hcGIt
aW50Yy5vCiBvYmotJChDT05GSUdfUklTQ1ZfSU5UQykJCSs9IGlycS1yaXNjdi1pbnRjLm8KIG9i
ai0kKENPTkZJR19SSVNDVl9FU1AzMlA0X0NMSUMpCSs9IGlycS1lc3AzMnA0LWNsaWMubworb2Jq
LSQoQ09ORklHX1JJU0NWX0VTUDMyUDRfQ0xJQykJKz0gaXJxLWVzcDMycDQtaW50bXR4Lm8KIG9i
ai0kKENPTkZJR19SSVNDVl9BUExJQykJCSs9IGlycS1yaXNjdi1hcGxpYy1tYWluLm8gaXJxLXJp
c2N2LWFwbGljLWRpcmVjdC5vCiBvYmotJChDT05GSUdfUklTQ1ZfQVBMSUNfTVNJKQkJKz0gaXJx
LXJpc2N2LWFwbGljLW1zaS5vCiBvYmotJChDT05GSUdfUklTQ1ZfSU1TSUMpCQkrPSBpcnEtcmlz
Y3YtaW1zaWMtc3RhdGUubyBpcnEtcmlzY3YtaW1zaWMtZWFybHkubyBpcnEtcmlzY3YtaW1zaWMt
cGxhdGZvcm0ubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1lc3AzMnA0LWludG10
eC5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1lc3AzMnA0LWludG10eC5jCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMGZjMWE3Yjc4ZjhmCi0tLSAvZGV2L251bGwKKysr
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1lc3AzMnA0LWludG10eC5jCkBAIC0wLDAgKzEsMTM5IEBA
CisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisvKiBFc3ByZXNzaWYg
RVNQMzItUDQgaW50ZXJydXB0IG1hdHJpeCAqLworCisjaW5jbHVkZSA8bGludXgvYml0cy5oPgor
I2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+CisjaW5jbHVkZSA8bGludXgvaW5pdC5oPgorI2luY2x1
ZGUgPGxpbnV4L2lvLmg+CisjaW5jbHVkZSA8bGludXgvaXJxLmg+CisjaW5jbHVkZSA8bGludXgv
aXJxY2hpcC5oPgorI2luY2x1ZGUgPGxpbnV4L2lycWRvbWFpbi5oPgorI2luY2x1ZGUgPGxpbnV4
L29mLmg+CisjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPgorCisjZGVmaW5lIENMSUNfRklS
U1RfRVhUX0lSUQkxNgorI2RlZmluZSBDTElDX0xBU1RfRVhUX0lSUQk0NworI2RlZmluZSBJTlRN
VFhfTlJfTUFQX1JFR1MJMTI4CisjZGVmaW5lIElOVE1UWF9NQVBfTUFTSwkJR0VOTUFTSyg1LCAw
KQorI2RlZmluZSBJTlRNVFhfTUFQX0RJU0FCTEVECTAKKyNkZWZpbmUgSU5UTVRYX1YzX0ZJUlNU
X0VYVFJBX1NPVVJDRQkxMzMKKyNkZWZpbmUgSU5UTVRYX1YzX0xBU1RfRVhUUkFfU09VUkNFCTEz
NQorCitzdGF0aWMgY29uc3Qgc3RydWN0IGlycV9jaGlwIGVzcDMycDRfaW50bXR4X2NoaXAgPSB7
CisJLm5hbWUJCT0gIkVTUDMyLVA0IGludGVycnVwdCBtYXRyaXgiLAorCS5pcnFfbWFzawk9IGly
cV9jaGlwX21hc2tfcGFyZW50LAorCS5pcnFfdW5tYXNrCT0gaXJxX2NoaXBfdW5tYXNrX3BhcmVu
dCwKKwkuaXJxX3NldF90eXBlCT0gaXJxX2NoaXBfc2V0X3R5cGVfcGFyZW50LAorfTsKKworc3Rh
dGljIGludCBlc3AzMnA0X2ludG10eF9kb21haW5fYWxsb2Moc3RydWN0IGlycV9kb21haW4gKmRv
bWFpbiwKKwkJCQkgICAgICAgdW5zaWduZWQgaW50IHZpcnEsIHVuc2lnbmVkIGludCBucl9pcnFz
LAorCQkJCSAgICAgICB2b2lkICphcmcpCit7CisJc3RydWN0IGlycV9md3NwZWMgKmZ3c3BlYyA9
IGFyZzsKKwlzdHJ1Y3QgaXJxX2Z3c3BlYyBwYXJlbnRfZndzcGVjID0geworCQkuZndub2RlID0g
ZG9tYWluLT5wYXJlbnQtPmZ3bm9kZSwKKwkJLnBhcmFtX2NvdW50ID0gMiwKKwkJLnBhcmFtWzFd
ID0gSVJRX1RZUEVfTEVWRUxfSElHSCwKKwl9OworCXVuc2lnbmVkIGludCBjbGljX2lycTsKKwlp
bnQgcmV0OworCisJaWYgKG5yX2lycXMgIT0gMSB8fCAhZndzcGVjIHx8IGZ3c3BlYy0+cGFyYW1f
Y291bnQgIT0gMikKKwkJcmV0dXJuIC1FSU5WQUw7CisJaWYgKGZ3c3BlYy0+cGFyYW1bMF0gPj0g
SU5UTVRYX05SX01BUF9SRUdTIHx8CisJICAgIGZ3c3BlYy0+cGFyYW1bMV0gIT0gSVJRX1RZUEVf
TEVWRUxfSElHSCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwkvKiBUaGUgSVJRIGRvbWFpbiBjb3Jl
IHNlcmlhbGl6ZXMgYWxsb2NhdGlvbiBhY3Jvc3MgdGhlIGhpZXJhcmNoeS4gKi8KKwlmb3IgKGNs
aWNfaXJxID0gQ0xJQ19GSVJTVF9FWFRfSVJROyBjbGljX2lycSA8PSBDTElDX0xBU1RfRVhUX0lS
UTsKKwkgICAgIGNsaWNfaXJxKyspIHsKKwkJaWYgKCFpcnFfZmluZF9tYXBwaW5nKGRvbWFpbi0+
cGFyZW50LCBjbGljX2lycSkpCisJCQlicmVhazsKKwl9CisJaWYgKGNsaWNfaXJxID4gQ0xJQ19M
QVNUX0VYVF9JUlEpCisJCXJldHVybiAtRU5PU1BDOworCisJcmV0ID0gaXJxX2RvbWFpbl9zZXRf
aHdpcnFfYW5kX2NoaXAoZG9tYWluLCB2aXJxLCBmd3NwZWMtPnBhcmFtWzBdLAorCQkJCQkgICAg
JmVzcDMycDRfaW50bXR4X2NoaXAsIE5VTEwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisK
KwlwYXJlbnRfZndzcGVjLnBhcmFtWzBdID0gY2xpY19pcnE7CisJcmV0dXJuIGlycV9kb21haW5f
YWxsb2NfaXJxc19wYXJlbnQoZG9tYWluLCB2aXJxLCBucl9pcnFzLCAmcGFyZW50X2Z3c3BlYyk7
Cit9CisKK3N0YXRpYyB2b2lkIGVzcDMycDRfaW50bXR4X3NldF9yb3V0ZSh2b2lkIF9faW9tZW0g
KmJhc2UsIHVuc2lnbmVkIGludCBzb3VyY2UsCisJCQkJICAgICB1bnNpZ25lZCBpbnQgY2xpY19p
cnEpCit7CisJdm9pZCBfX2lvbWVtICpyZWcgPSBiYXNlICsgNCAqIHNvdXJjZTsKKwl1MzIgdmFs
ID0gcmVhZGwocmVnKTsKKworCXdyaXRlbCgodmFsICYgfklOVE1UWF9NQVBfTUFTSykgfCBjbGlj
X2lycSwgcmVnKTsKK30KKworc3RhdGljIGludCBlc3AzMnA0X2ludG10eF9hY3RpdmF0ZShzdHJ1
Y3QgaXJxX2RvbWFpbiAqZG9tYWluLAorCQkJCSAgIHN0cnVjdCBpcnFfZGF0YSAqZGF0YSwgYm9v
bCByZXNlcnZlKQoreworCWVzcDMycDRfaW50bXR4X3NldF9yb3V0ZShkb21haW4tPmhvc3RfZGF0
YSwgaXJxZF90b19od2lycShkYXRhKSwKKwkJCQkgaXJxZF90b19od2lycShkYXRhLT5wYXJlbnRf
ZGF0YSkpOworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9pZCBlc3AzMnA0X2ludG10eF9kZWFj
dGl2YXRlKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sCisJCQkJICAgICAgc3RydWN0IGlycV9k
YXRhICpkYXRhKQoreworCWVzcDMycDRfaW50bXR4X3NldF9yb3V0ZShkb21haW4tPmhvc3RfZGF0
YSwgaXJxZF90b19od2lycShkYXRhKSwKKwkJCQkgSU5UTVRYX01BUF9ESVNBQkxFRCk7Cit9CisK
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgaXJxX2RvbWFpbl9vcHMgZXNwMzJwNF9pbnRtdHhfZG9tYWlu
X29wcyA9IHsKKwkuYWxsb2MJCT0gZXNwMzJwNF9pbnRtdHhfZG9tYWluX2FsbG9jLAorCS5mcmVl
CQk9IGlycV9kb21haW5fZnJlZV9pcnFzX2NvbW1vbiwKKwkudHJhbnNsYXRlCT0gaXJxX2RvbWFp
bl90cmFuc2xhdGVfdHdvY2VsbCwKKwkuYWN0aXZhdGUJPSBlc3AzMnA0X2ludG10eF9hY3RpdmF0
ZSwKKwkuZGVhY3RpdmF0ZQk9IGVzcDMycDRfaW50bXR4X2RlYWN0aXZhdGUsCit9OworCitzdGF0
aWMgaW50IF9faW5pdCBlc3AzMnA0X2ludG10eF9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSwKKwkJCQkgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCkKK3sKKwlzdHJ1Y3QgaXJx
X2RvbWFpbiAqcGFyZW50X2RvbWFpbiwgKmRvbWFpbjsKKwl2b2lkIF9faW9tZW0gKmJhc2U7CisJ
dW5zaWduZWQgaW50IHNvdXJjZTsKKworCWlmICghcGFyZW50KQorCQlyZXR1cm4gLUVOT0RFVjsK
KworCXBhcmVudF9kb21haW4gPSBpcnFfZmluZF9ob3N0KHBhcmVudCk7CisJaWYgKCFwYXJlbnRf
ZG9tYWluKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCWJhc2UgPSBvZl9pb21hcChub2RlLCAwKTsK
KwlpZiAoIWJhc2UpCisJCXJldHVybiAtRU5PTUVNOworCisJLyogRGlzY29ubmVjdCByb3V0ZXMg
bGVmdCBieSBmaXJtd2FyZSBiZWZvcmUgYWxsb2NhdGluZyBJUlFzLiAqLworCWZvciAoc291cmNl
ID0gMDsgc291cmNlIDwgSU5UTVRYX05SX01BUF9SRUdTOyBzb3VyY2UrKykKKwkJZXNwMzJwNF9p
bnRtdHhfc2V0X3JvdXRlKGJhc2UsIHNvdXJjZSwgSU5UTVRYX01BUF9ESVNBQkxFRCk7CisKKwkv
KiBTa2lwIHRoZSBzdGF0dXMgYW5kIGNsb2NrIHJlZ2lzdGVycyBiZXR3ZWVuIHJvdXRpbmcgYmFu
a3MuICovCisJaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUsICJlc3AsZXNwMzJwNC12
My1pbnRtdHgiKSkgeworCQlmb3IgKHNvdXJjZSA9IElOVE1UWF9WM19GSVJTVF9FWFRSQV9TT1VS
Q0U7CisJCQkgc291cmNlIDw9IElOVE1UWF9WM19MQVNUX0VYVFJBX1NPVVJDRTsgc291cmNlKysp
CisJCQllc3AzMnA0X2ludG10eF9zZXRfcm91dGUoYmFzZSwgc291cmNlLCBJTlRNVFhfTUFQX0RJ
U0FCTEVEKTsKKwl9CisKKwlkb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV9oaWVyYXJjaHkocGFy
ZW50X2RvbWFpbiwgMCwgMCwKKwkJCQkJICAgICBvZl9md25vZGVfaGFuZGxlKG5vZGUpLAorCQkJ
CQkgICAgICZlc3AzMnA0X2ludG10eF9kb21haW5fb3BzLCBiYXNlKTsKKwlpZiAoIWRvbWFpbikg
eworCQlpb3VubWFwKGJhc2UpOworCQlyZXR1cm4gLUVOT01FTTsKKwl9CisKKwlyZXR1cm4gMDsK
K30KKworSVJRQ0hJUF9ERUNMQVJFKGVzcDMycDRfaW50bXR4LCAiZXNwLGVzcDMycDQtaW50bXR4
IiwgZXNwMzJwNF9pbnRtdHhfaW5pdCk7CitJUlFDSElQX0RFQ0xBUkUoZXNwMzJwNF92M19pbnRt
dHgsICJlc3AsZXNwMzJwNC12My1pbnRtdHgiLCBlc3AzMnA0X2ludG10eF9pbml0KTsKLS0gCjIu
NTYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
