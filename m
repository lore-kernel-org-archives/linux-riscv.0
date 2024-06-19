Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE00C2BA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpbC/iRFJy5ll6Mmnm7uFReg2aY76ppoHesqcyloE5A=; b=PRTq05IJR+UGUN
	xQemtIs6GTFn3xy564tzIWvUmK+84UL+0yNRDsbs9AEJT4xVkyF3jVVwz0w3c/EBmrxvr1N8bni+H
	yY/KwZUa0QJBcs+f49DD7XvOyEtg0m2budg+XdR+ldpcIIL6Kxt+1TXlwlAtliZZapyp9bDTMZm5i
	La1g5P80seyn8ZbixdvUQHrV8DphFW4T7x33w6+ItsWOsm41DB1Xaiqn/gwbdllvdzqwHNnB0ZBfy
	WSJfcJps9w5H8zIDr6R/GWllKLXSUPUfYOt06E84FYlhO2EbvFlrMESeb2odUHWaJdc1rQvJahnF3
	+87Tor9tGOVpAmZIxGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbs-000000010AR-29Yx;
	Wed, 19 Jun 2024 11:36:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbX-00000000zpY-1dRv
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jun 2024 11:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=luuWYSLXcV5+8J7r5WvQusu30sDK3pgwQTMW2O5hJ3s=; b=jgyHsN2lG4cMlpe82Ejq9gPhkC
	uBLDRyw2BTPdzDMBwiYdEQ8yk3sl4kt+hpxKV7AnvvoEbg/wFHPKledOUPVfkgl5xNTEMmqqf7lZE
	J+O0EdQ9Wk9GX/zMfJUDmOZY54Df6vvIVZ8eRqNn3z5hh3gge8o6bTo8rjRWYzyxWhC2OuTcZwiki
	Jpj1U34wM6WA355CDQMktWHNSUL/KqdhTGbwX7bOXmi1A5G0HvIqSWVqzwyUNC+8tQic6fx5T/LrN
	Dk6A4XXXkL+Kb9YVBq80j5Ss64dyL/pociNEYZRX42zSzgRiZe3vfgmKVPt0lhZX0hqGywN3+NpbF
	EHHPdxNA==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbS-00000007LAt-07B6
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4247ae93738so1135e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796946; x=1719401746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luuWYSLXcV5+8J7r5WvQusu30sDK3pgwQTMW2O5hJ3s=;
        b=XibpvgYevdlRzKILsD5XpA4Lw65MFZTX4QIdA+1wZUMY5O7jVv8U6vvkjQu+KmrfJi
         N54/WHST7qctjKtfAF8P7vuvYDisncUcXZr6z0EKWn+FO2HXc3NVFq6LoGr9T9kv28Wv
         SiS7W/ZN0R1f8yGu4x/MAlRvtkQw4ILvg/qx+qZ0vgPnMEYa5bozpg3T/xe6N6nbGHix
         ROWTLDEuTcNuJ1Nqvvz1hFrygchq//DoRav8GA3CAO+aPA+kAKmG5hMt0iri4KBmzD2o
         DH0Wa+5+4O2hodCqtXmpnen/a7/zfFDtDb+HQoFkgvf6WhP3TA7O3pB0hgmk6AwnxfMa
         kFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796946; x=1719401746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luuWYSLXcV5+8J7r5WvQusu30sDK3pgwQTMW2O5hJ3s=;
        b=TlOfk8Um9wsZ3RvMrAp2f1pD2OFiXIhLm+pZ3F3Ix42BdZaxQcVPaOQ2KVStcwvNmY
         GZnuCF26vKSscWl2SF8uWpO0/BBBPz5J0z2lHRKinYJVCMw1J3VthNCLrkZoj1n6MydB
         bAsVpq1Vmad1itLf2U8J+uR7/ZMh2P+u3PjWyach1VD3pqexpLBihyKuzV69ll3+EX0p
         GWMfGzJUPn5PRC9X2IiKUnb05EHxdnbXuWUR5xmbiuvfhBzuPBCyqJPOw9RVDD6pfVEA
         XeLUhpLZGLopfUZj9Pky3paYsX9PTIntKav6wLRi46w3cUDe/R4krv95fHBNNBqEymlX
         NPRw==
X-Forwarded-Encrypted: i=1; AJvYcCXvRQVOnVQwUpsaxFCj37FYgW3r3qvFpKt/NYy0Haw5akJRIFgiwRZQ1Vv2dLVVIEh7iF342ENEe1Rjii0tFLP65Gem5bYOem5JDNT4ctpA
X-Gm-Message-State: AOJu0Yz61KZ/1+xcxzPjKuQz1sC7/YoT5zK8mtpV4qPwimtr2iuDBtb1
	fnZZNsjSvUH5GYl8HWJuGQSK2zkna8kYJaD4qcOMy+75Bvrh48YhudM+Wghk+3Q=
X-Google-Smtp-Source: AGHT+IFzGS/p4a4mBQ/inU2s0uZu8vrDHSaWFV9V52yXQFOztuj4Wss5NZDJltC9s5gFdnIi8Cu3yA==
X-Received: by 2002:a05:600c:3ba5:b0:421:f441:e804 with SMTP id 5b1f17b1804b1-42475c2138amr13486685e9.4.1718796946112;
        Wed, 19 Jun 2024 04:35:46 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:44 -0700 (PDT)
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
Subject: [PATCH v7 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Date: Wed, 19 Jun 2024 13:35:18 +0200
Message-ID: <20240619113529.676940-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_123550_771337_53D76BE4 
X-CRM114-Status: GOOD (  16.22  )
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

VGhlIFpjKiBzdGFuZGFyZCBleHRlbnNpb24gZm9yIGNvZGUgcmVkdWN0aW9uIGludHJvZHVjZXMg
bmV3IGV4dGVuc2lvbnMuClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBaY2EsIFpjZiwgWmNk
IGFuZCBaY2IuIFpjZSwgWmNtdCBhbmQgWmNtcAphcmUgbGVmdCBvdXQgb2YgdGhpcyBwYXRjaCBz
aW5jZSB0aGV5IGFyZSB0YXJnZXRpbmcgbWljcm9jb250cm9sbGVycy8KZW1iZWRkZWQgQ1BVcyBp
bnN0ZWFkIG9mIGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdjYXAuaCB8ICA0ICsrKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgNTUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IDE4ODU5
Mjc3ODQzYS4uYjEyYWUzZjIxNDFjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC04Nyw2ICs4
NywxMCBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RgkJNzgKICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVkU2NEQJCTc5CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklNT1AJCTgwCisjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWkNBCQk4MQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDQgkJODIK
KyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTgzCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNG
CQk4NAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKaW5kZXggYTNhZjk3NmYzNmM5Li5hYTYzMWZlNDliN2MgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKQEAgLTExMSw2ICsxMTEsOSBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNi
b3pfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKIAogI2Rl
ZmluZSBfX1JJU0NWX0lTQV9FWFRfREFUQShfbmFtZSwgX2lkKSBfUklTQ1ZfSVNBX0VYVF9EQVRB
KF9uYW1lLCBfaWQsIE5VTEwsIDAsIE5VTEwpCiAKKyNkZWZpbmUgX19SSVNDVl9JU0FfRVhUX0RB
VEFfVkFMSURBVEUoX25hbWUsIF9pZCwgX3ZhbGlkYXRlKSBcCisJCQlfUklTQ1ZfSVNBX0VYVF9E
QVRBKF9uYW1lLCBfaWQsIE5VTEwsIDAsIF92YWxpZGF0ZSkKKwogLyogVXNlZCB0byBkZWNsYXJl
IHB1cmUgImxhc3NvIiBleHRlbnNpb24gKFprIGZvciBpbnN0YW5jZSkgKi8KICNkZWZpbmUgX19S
SVNDVl9JU0FfRVhUX0JVTkRMRShfbmFtZSwgX2J1bmRsZWRfZXh0cykgXAogCV9SSVNDVl9JU0Ff
RVhUX0RBVEEoX25hbWUsIFJJU0NWX0lTQV9FWFRfSU5WQUxJRCwgX2J1bmRsZWRfZXh0cywgXApA
QCAtMTIyLDYgKzEyNSwzNyBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUo
Y29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKICNkZWZpbmUgX19SSVNDVl9J
U0FfRVhUX1NVUEVSU0VUX1ZBTElEQVRFKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywgX3ZhbGlkYXRl
KSBcCiAJX1JJU0NWX0lTQV9FWFRfREFUQShfbmFtZSwgX2lkLCBfc3ViX2V4dHMsIEFSUkFZX1NJ
WkUoX3N1Yl9leHRzKSwgX3ZhbGlkYXRlKQogCitzdGF0aWMgaW50IHJpc2N2X2V4dF96Y2FfZGVw
ZW5kcyhjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSBjb25zdCB1
bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQoreworCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfWkNBKSkKKwkJcmV0dXJuIDA7CisK
KwlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKK30KK3N0YXRpYyBpbnQgcmlzY3ZfZXh0X3pjZF92YWxp
ZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSAgY29uc3Qg
dW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKK3sKKwlpZiAoX19yaXNjdl9pc2FfZXh0ZW5zaW9u
X2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pDQSkgJiYKKwkgICAgX19yaXNj
dl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2QpKQor
CQlyZXR1cm4gMDsKKworCXJldHVybiAtRVBST0JFX0RFRkVSOworfQorCitzdGF0aWMgaW50IHJp
c2N2X2V4dF96Y2ZfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0
YSwKKwkJCQkgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCit7CisJaWYgKElTX0VO
QUJMRUQoQ09ORklHXzY0QklUKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoX19yaXNjdl9p
c2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pDQSkgJiYK
KwkgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9J
U0FfRVhUX2YpKQorCQlyZXR1cm4gMDsKKworCXJldHVybiAtRVBST0JFX0RFRkVSOworfQorCiBz
dGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3prX2J1bmRsZWRfZXh0c1tdID0gewogCVJJ
U0NWX0lTQV9FWFRfWkJLQiwKIAlSSVNDVl9JU0FfRVhUX1pCS0MsCkBAIC0yMzYsNiArMjcwLDIx
IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHNbXSA9
IHsKIAlSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwogfTsKIAorLyoKKyAqIFpjKiBzcGVjIHN0
YXRlcyB0aGF0OgorICogLSBDIGFsd2F5cyBpbXBsaWVzIFpjYQorICogLSBDK0YgaW1wbGllcyBa
Y2YgKFJWMzIgb25seSkKKyAqIC0gQytEIGltcGxpZXMgWmNkCisgKgorICogVGhlc2UgZXh0ZW5z
aW9ucyB3aWxsIGJlIGVuYWJsZWQgYW5kIHRoZW4gdmFsaWRhdGVkIGRlcGVuZGluZyBvbiB0aGUK
KyAqIGF2YWlsYWJpbGl0eSBvZiBGL0QgUlYzMi4KKyAqLworc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGludCByaXNjdl9jX2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1pDQSwKKwlSSVNDVl9JU0Ff
RVhUX1pDRiwKKwlSSVNDVl9JU0FfRVhUX1pDRCwKK307CisKIC8qCiAgKiBUaGUgY2Fub25pY2Fs
IG9yZGVyIG9mIElTQSBleHRlbnNpb24gbmFtZXMgaW4gdGhlIElTQSBzdHJpbmcgaXMgZGVmaW5l
ZCBpbgogICogY2hhcHRlciAyNyBvZiB0aGUgdW5wcml2aWxlZ2VkIHNwZWNpZmljYXRpb24uCkBA
IC0yODIsNyArMzMxLDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9p
c2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoZiwgUklTQ1ZfSVNBX0VYVF9mKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQShkLCBSSVNDVl9JU0FfRVhUX2QpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHEsIFJJU0NWX0lTQV9FWFRfcSksCi0JX19SSVNDVl9JU0FfRVhUX0RBVEEoYywg
UklTQ1ZfSVNBX0VYVF9jKSwKKwlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoYywgUklTQ1ZfSVNB
X0VYVF9jLCByaXNjdl9jX2V4dHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh2LCBSSVND
Vl9JU0FfRVhUX3YsIHJpc2N2X3ZfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoaCwgUklT
Q1ZfSVNBX0VYVF9oKSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRfVkFMSURBVEUoemljYm9t
LCBSSVNDVl9JU0FfRVhUX1pJQ0JPTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMsCkBAIC0zMDEs
NiArMzUwLDEwIEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4
dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmYSwgUklTQ1ZfSVNBX0VYVF9aRkEpLAog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHpmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aRkhNSU4pLAorCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHpjYSwgUklTQ1ZfSVNBX0VYVF9aQ0EpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
X1ZBTElEQVRFKHpjYiwgUklTQ1ZfSVNBX0VYVF9aQ0IsIHJpc2N2X2V4dF96Y2FfZGVwZW5kcyks
CisJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoemNkLCBSSVNDVl9JU0FfRVhUX1pDRCwg
cmlzY3ZfZXh0X3pjZF92YWxpZGF0ZSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUo
emNmLCBSSVNDVl9JU0FfRVhUX1pDRiwgcmlzY3ZfZXh0X3pjZl92YWxpZGF0ZSksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSksCiAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoemJiLCBSSVNDVl9JU0FfRVhUX1pCQiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemJj
LCBSSVNDVl9JU0FfRVhUX1pCQyksCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
