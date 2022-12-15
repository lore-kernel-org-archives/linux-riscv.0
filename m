Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF7AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yKQfsWUKjnm1T5LtEkrzfKcBuhF/p5Abs0c3IilSyFQ=; b=Gk7cb8S/6becg0
	ma40MZ8ycOuMF89KZLesg6qpVqDBVleh2BkNNmJx2dpICDm4E4dAhNcmlycFcgvKhhAbJwlxCDbef
	9jARnYFVxtobv4BpqYag+IjnbDHYlYi8pf9s7Jf5MFaa3KoGYQ/1LH5js6iJBFkVuWh+F+vZAVsLQ
	B4sGUhPfXnTA2SYFOYqYD0xiFALhYO66WTAjiZrxZ6QJV7Z/o+ZQAibcv/OtFowav4OUUwz986lwD
	sQGkpBi/5qmszZXWN8vp4G3UOgmRYeXPROD+7tQmJd7HQNao6AiOCfMtdpcZRKzYxLZhXVkxBxWuV
	x58CvD5CTTECNfxyavZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jTB-007cnK-K9; Thu, 15 Dec 2022 08:19:57 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5jT8-007ckY-KO
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 08:19:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id bg10so13166261wmb.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 00:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P5JatZUrB4wn6RHIEmLRs1De+PDGwMqcpJtj1hMpn28=;
        b=JLzjunRNOInwlypF9TQNBJoNGaay7JWcNf7YoQGqGXE60pbfIWK4g6E87kqaTlNEjX
         QYWw/I0p6xgHoTGol6FiQPq9nTnuTvFo2YLnBTUg5Ueb5OYw4a8ptZQQTNH7k2Fp3YhD
         npDLW5SBQ5HkMKkUA8u2VTSA1gi+lAkedt2CugVww2Eze30/Pmfi+1tCa5dpR610Yter
         uauMBuCIAdvh+JMFerv+vRM5FDaeSnHgU/XEyIR0kuVkuCIsqJi+Smi0sL2Wb8m6GZ/b
         Uq44xe1xMFDjbmCpGCYxjhjsgdPl3K5A7Kfkec34CCBAFu4a0SBQKbD4NBulirE5Hduj
         A9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5JatZUrB4wn6RHIEmLRs1De+PDGwMqcpJtj1hMpn28=;
        b=Ru2I0uEDbuV82m72xXKYVe1lzRgUHx65uaB6xX9E3GqsyisIQg4McjvSsk686j72wE
         dAe2ooMQJnSROFJP2BThD3OeWVfqBannv2U24bMOYEH9WZ5hOtcVho0x/iUWnFjahDaL
         cqqqVWARS2XFpuO/iogj9dlFWrCPbApvQrqKh+LGlrF6VL6VgxP6dx2CPn567KwpUWFL
         hyvZZGCV3ZX7iwr072P3B71EUXEQZbRknZrGJ/jLqnwZdcNjjN6kmXEnD0m94yW1pXfR
         5pQZwVl489TV5abFYQUBeYjUE4oxbZrMk5Dezj5XOMhoD55JmQQszLngJZQmlUQbjTaM
         wPvw==
X-Gm-Message-State: ANoB5pm8X+L7jlnNx0YX0CEDOPbTAoGDujJKiu6a71IvcQ3X2o1CCCDs
	o1OVgUMln8pPapEnHX6z9mm2Mw==
X-Google-Smtp-Source: AA0mqf5WjGshX/H4Sy5tMFHvg73SLxcJk240JuKos8U0A2iaj5qoJywpDAzH4oFnYFIYMozh6bDxPQ==
X-Received: by 2002:a7b:ce89:0:b0:3d2:3be4:2d9a with SMTP id q9-20020a7bce89000000b003d23be42d9amr3967121wmj.20.1671092392702;
        Thu, 15 Dec 2022 00:19:52 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b003b49bd61b19sm1615436wmg.15.2022.12.15.00.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:19:52 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] riscv: Allow to downgrade paging mode from the command line
Date: Thu, 15 Dec 2022 09:19:48 +0100
Message-Id: <20221215081948.1256610-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_001954_914511_F60E1D56 
X-CRM114-Status: GOOD (  20.98  )
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

QWRkIDIgZWFybHkgY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMgY2FsbGVkICJubzVsdmwiIGFuZCAi
bm80bHZsIiAodXNpbmcKdGhlIHNhbWUgbmFtaW5nIGFzIHg4NikgdG8gYWxsb3cgYSB1c2VyIHRv
IGRvd25ncmFkZSBmcm9tIHN2NTcgKHRoZQpkZWZhdWx0IG1vZGUgaWYgdGhlIGhhcmR3YXJlIHN1
cHBvcnRzIGl0KSB0byBzdjQ4IG9yIHN2MzkuCgpOb3RlIHRoYXQgZ29pbmcgdGhyb3VnaCB0aGUg
ZGV2aWNlIHRyZWUgdG8gZ2V0IHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lCndvcmtzIHdpdGggQUNQ
SSB0b28gc2luY2UgdGhlIGVmaSBzdHViIGNyZWF0ZXMgYSBkZXZpY2UgdHJlZSBhbnl3YXkgd2l0
aAp0aGUgY29tbWFuZCBsaW5lLgoKQWxzbywgYXMgdGhvc2UgcGFyYW1zIGFyZSB0cmVhdGVkIHZl
cnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2VzcyBhbmQgd2UKdXNlIHN0YW5kYXJkIGRldmljZSB0
cmVlIGZ1bmN0aW9ucyB0aGF0IG1heSBiZSBrYXNhbiBpbnN0cnVtZW50ZWQsIHdlCm9ubHkgZW5h
YmxlIHRoZW0gZm9yICFLQVNBTiBjb25maWd1cmF0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KLS0tCgp2MjoKLSBIb25vciBDTURM
SU5FX0VYVEVORCBhbmQgQ01ETElORV9GT1JDRSBhcyBub3RpY2VkIGJ5IEJqw7ZybgoKIC4uLi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICA1ICstCiBhcmNoL3Jp
c2N2L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3MiArKysrKysrKysrKysr
KysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVy
cy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApp
bmRleCBhNDY1ZDUyNDI3NzQuLjY3NDE1MjRhYTk4MCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKQEAgLTM1NDgsNyArMzU0OCwxMCBAQAog
CQkJZW11bGF0aW9uIGxpYnJhcnkgZXZlbiBpZiBhIDM4NyBtYXRocyBjb3Byb2Nlc3NvcgogCQkJ
aXMgcHJlc2VudC4KIAotCW5vNWx2bAkJW1g4Ni02NF0gRGlzYWJsZSA1LWxldmVsIHBhZ2luZyBt
b2RlLiBGb3JjZXMKKwlubzRsdmwJCVtSSVNDVl0gRGlzYWJsZSA0LWxldmVsIHBhZ2luZyBtb2Rl
LiBGb3JjZXMKKwkJCWtlcm5lbCB0byB1c2UgMy1sZXZlbCBwYWdpbmcgaW5zdGVhZC4KKworCW5v
NWx2bAkJW1g4Ni02NCxSSVNDVl0gRGlzYWJsZSA1LWxldmVsIHBhZ2luZyBtb2RlLiBGb3JjZXMK
IAkJCWtlcm5lbCB0byB1c2UgNC1sZXZlbCBwYWdpbmcgaW5zdGVhZC4KIAogCW5vZnNnc2Jhc2UJ
W1g4Nl0gRGlzYWJsZXMgRlNHU0JBU0UgaW5zdHJ1Y3Rpb25zLgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwppbmRleCBiNTZhMGE3NTUzM2Yu
LmQ5MGZiZTlhZDQ5NCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKKysrIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKQEAgLTc0NiwxNyArNzQ2LDc3IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBkaXNhYmxlX3BndGFibGVfbDQodm9pZCkKIAlzYXRwX21vZGUgPSBTQVRQX01PREVfMzk7CiB9
CiAKKyNpZm5kZWYgQ09ORklHX0tBU0FOCitzdGF0aWMgX19pbml0IGJvb2wgbWF0Y2hfbm9YbHZs
KGNvbnN0IGNoYXIgKmNtZGxpbmUpCit7CisJaWYgKHN0cnN0cihjbWRsaW5lLCAibm81bHZsIikp
IHsKKwkJZGlzYWJsZV9wZ3RhYmxlX2w1KCk7CisJfSBlbHNlIGlmIChzdHJzdHIoY21kbGluZSwg
Im5vNGx2bCIpKSB7CisJCWRpc2FibGVfcGd0YWJsZV9sNSgpOworCQlkaXNhYmxlX3BndGFibGVf
bDQoKTsKKwkJcmV0dXJuIHRydWU7CisJfQorCisJcmV0dXJuIGZhbHNlOworfQorCitzdGF0aWMg
aW50IF9faW5pdCBwcmludF9ubzRsdmwoY2hhciAqcCkKK3sKKwlwcl9pbmZvKCJEaXNhYmxlZCA0
LWxldmVsIGFuZCA1LWxldmVsIHBhZ2luZyIpOworCXJldHVybiAwOworfQorZWFybHlfcGFyYW0o
Im5vNGx2bCIsIHByaW50X25vNGx2bCk7CisKK3N0YXRpYyBpbnQgX19pbml0IHByaW50X25vNWx2
bChjaGFyICpwKQoreworCXByX2luZm8oIkRpc2FibGVkIDUtbGV2ZWwgcGFnaW5nIik7CisJcmV0
dXJuIDA7Cit9CitlYXJseV9wYXJhbSgibm81bHZsIiwgcHJpbnRfbm81bHZsKTsKKyNlbmRpZgor
CiAvKgogICogVGhlcmUgaXMgYSBzaW1wbGUgd2F5IHRvIGRldGVybWluZSBpZiA0LWxldmVsIGlz
IHN1cHBvcnRlZCBieSB0aGUKICAqIHVuZGVybHlpbmcgaGFyZHdhcmU6IGVzdGFibGlzaCAxOjEg
bWFwcGluZyBpbiA0LWxldmVsIHBhZ2UgdGFibGUgbW9kZQogICogdGhlbiByZWFkIFNBVFAgdG8g
c2VlIGlmIHRoZSBjb25maWd1cmF0aW9uIHdhcyB0YWtlbiBpbnRvIGFjY291bnQKICAqIG1lYW5p
bmcgc3Y0OCBpcyBzdXBwb3J0ZWQuCiAgKi8KLXN0YXRpYyBfX2luaXQgdm9pZCBzZXRfc2F0cF9t
b2RlKHZvaWQpCitzdGF0aWMgX19pbml0IHZvaWQgc2V0X3NhdHBfbW9kZSh1aW50cHRyX3QgZHRi
X3BhKQogewogCXU2NCBpZGVudGl0eV9zYXRwLCBod19zYXRwOwogCXVpbnRwdHJfdCBzZXRfc2F0
cF9tb2RlX3BtZCA9ICgodW5zaWduZWQgbG9uZylzZXRfc2F0cF9tb2RlKSAmIFBNRF9NQVNLOwot
CWJvb2wgY2hlY2tfbDQgPSBmYWxzZTsKKworI2lmbmRlZiBDT05GSUdfS0FTQU4KKwkvKgorCSAq
IFRoZSBiZWxvdyBmZHQgZnVuY3Rpb25zIGFyZSBrYXNhbiBpbnN0cnVtZW50ZWQsIHNpbmNlIGF0
IHRoaXMgcG9pbnQKKwkgKiB0aGVyZSBpcyBubyBtYXBwaW5nIGZvciB0aGUga2FzYW4gc2hhZG93
IG1lbW9yeSwgdGhpcyBjYW4ndCBiZSB1c2VkCisJICogd2hlbiBrYXNhbiBpcyBlbmFibGVkLgor
CSAqLworCWludCBjaG9zZW5fbm9kZTsKKwl1bnNpZ25lZCBpbnQgZmR0X2NtZGxpbmVfc2l6ZSA9
IDA7CisKKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfRk9SQ0UpKSB7CisJCWNob3Nl
bl9ub2RlID0gZmR0X3BhdGhfb2Zmc2V0KCh2b2lkICopZHRiX3BhLCAiL2Nob3NlbiIpOworCQlp
ZiAoY2hvc2VuX25vZGUgPj0gMCkgeworCQkJY29uc3QgY2hhciAqZmR0X2NtZGxpbmU7CisKKwkJ
CWZkdF9jbWRsaW5lID0gZmR0X2dldHByb3AoKHZvaWQgKilkdGJfcGEsIGNob3Nlbl9ub2RlLAor
CQkJCQkJICAiYm9vdGFyZ3MiLCBOVUxMKTsKKwkJCWlmIChmZHRfY21kbGluZSkgeworCQkJCWlm
IChtYXRjaF9ub1hsdmwoZmR0X2NtZGxpbmUpKQorCQkJCQlyZXR1cm47CisJCQkJZmR0X2NtZGxp
bmVfc2l6ZSA9IHN0cmxlbihmZHRfY21kbGluZSk7CisJCQl9CisJCX0KKwl9CisKKwlpZiAoSVNf
RU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQpIHx8CisJICAgIElTX0VOQUJMRUQoQ09ORklH
X0NNRExJTkVfRk9SQ0UpIHx8CisJICAgIGZkdF9jbWRsaW5lX3NpemUgPT0gMCAvKiBDT05GSUdf
Q01ETElORV9GQUxMQkFDSyAqLykgeworCQlpZiAobWF0Y2hfbm9YbHZsKENPTkZJR19DTURMSU5F
KSkKKwkJCXJldHVybjsKKwl9CisjZW5kaWYKIAogCWNyZWF0ZV9wNGRfbWFwcGluZyhlYXJseV9w
NGQsCiAJCQlzZXRfc2F0cF9tb2RlX3BtZCwgKHVpbnRwdHJfdCllYXJseV9wdWQsCkBAIC03NzUs
NyArODM1LDggQEAgc3RhdGljIF9faW5pdCB2b2lkIHNldF9zYXRwX21vZGUodm9pZCkKIHJldHJ5
OgogCWNyZWF0ZV9wZ2RfbWFwcGluZyhlYXJseV9wZ19kaXIsCiAJCQkgICBzZXRfc2F0cF9tb2Rl
X3BtZCwKLQkJCSAgIGNoZWNrX2w0ID8gKHVpbnRwdHJfdCllYXJseV9wdWQgOiAodWludHB0cl90
KWVhcmx5X3A0ZCwKKwkJCSAgIHBndGFibGVfbDVfZW5hYmxlZCA/CisJCQkJKHVpbnRwdHJfdCll
YXJseV9wNGQgOiAodWludHB0cl90KWVhcmx5X3B1ZCwKIAkJCSAgIFBHRElSX1NJWkUsIFBBR0Vf
VEFCTEUpOwogCiAJaWRlbnRpdHlfc2F0cCA9IFBGTl9ET1dOKCh1aW50cHRyX3QpJmVhcmx5X3Bn
X2RpcikgfCBzYXRwX21vZGU7CkBAIC03ODYsOSArODQ3LDggQEAgc3RhdGljIF9faW5pdCB2b2lk
IHNldF9zYXRwX21vZGUodm9pZCkKIAlsb2NhbF9mbHVzaF90bGJfYWxsKCk7CiAKIAlpZiAoaHdf
c2F0cCAhPSBpZGVudGl0eV9zYXRwKSB7Ci0JCWlmICghY2hlY2tfbDQpIHsKKwkJaWYgKHBndGFi
bGVfbDVfZW5hYmxlZCkgewogCQkJZGlzYWJsZV9wZ3RhYmxlX2w1KCk7Ci0JCQljaGVja19sNCA9
IHRydWU7CiAJCQltZW1zZXQoZWFybHlfcGdfZGlyLCAwLCBQQUdFX1NJWkUpOwogCQkJZ290byBy
ZXRyeTsKIAkJfQpAQCAtOTc5LDcgKzEwMzksNyBAQCBhc21saW5rYWdlIHZvaWQgX19pbml0IHNl
dHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEpCiAjZW5kaWYKIAogI2lmIGRlZmluZWQoQ09ORklHXzY0
QklUKSAmJiAhZGVmaW5lZChDT05GSUdfWElQX0tFUk5FTCkKLQlzZXRfc2F0cF9tb2RlKCk7CisJ
c2V0X3NhdHBfbW9kZShkdGJfcGEpOwogI2VuZGlmCiAKIAlrZXJuZWxfbWFwLnZhX3BhX29mZnNl
dCA9IFBBR0VfT0ZGU0VUIC0ga2VybmVsX21hcC5waHlzX2FkZHI7Ci0tIAoyLjM3LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
