Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED78C04FFF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DPQTJ9I3jZBDPwr2IK6SJhiJXDEATrFX6C7Ib9c0cM=; b=ac5nA84zg0XaR6
	yeMmzpD7EDo9EdU+y72W3lBXsIvtbVFbIRIWdzhDwVoxyFEQML06cqoDeCvl0Qc5b9L5o2B5qsQzU
	XUCJUidlfriUTntioJaJZsjsc4Q0qQshBpVENxVNxfilsJICjwI8+BXVSkxuVQSvrPgjZNJjwIYeb
	0N9efBf6VgDsznI4lJuOeHCpXzdDcnprEf+CPTi/BJUJULThCW9BbPP8CjDWkO2mfrH27xUHYzM1P
	RNrZO1mxOvwUwcVA8lTZWiJ9fLCt3QGZzqzt7ntvd8+ivH9sqYpYNLyDUgdBx1mYa8gXr7zr3lbgn
	E8saJF9bzXHzMbtT8uig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7p-00000002CpM-3tjd;
	Thu, 18 Apr 2024 12:44:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7U-00000002CRV-3fUK
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-349bd110614so143260f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444239; x=1714049039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAM+PbC/Wqgx6Q9RB0x39wuP2KdW0QgVrrLDnXaQ5i0=;
        b=wnVYidbXmNp1IhU/WYnCVFMlBTc+hKwJd6BPRESneAq+ZgFkfXOlEVs3/HMeoYaEgZ
         FzGKlrDDz3Sa2wPciQpU0IxW26FJixABu89QKnlqN404iXcorJwueFcs1eImRUavSkQD
         CIjGt03ekqiQ/601MHAD/0hinNZbyEUoZWkKOJtsiC/kpUGtRHXw3hr/yz78SZNPDIdT
         QfY3cgN194Qy3oA09WpBBXQZHCg5S6UhUzMp0MIacA+RmbOYG3JhGTLLgnKLdLHgDqNW
         oTl2KmmUVrSFgheDanRUpK3hkzV6GBtOr8ScPv6k7O+bT1H18BH0hBVw7Sa+vJD5u4l1
         rqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444239; x=1714049039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAM+PbC/Wqgx6Q9RB0x39wuP2KdW0QgVrrLDnXaQ5i0=;
        b=YGh1Yr652jRlMYQVTzOR/t4HUiH+u2HQFJ2boc0CIpjrf2jCGf1vOTam0uDwGiKY7g
         Wsa6yHjiiEliKxsW8dySWBIPY5E8pycAw6CrvUGM59lm0G2P3x/bb6AdUxeyiuye6n/J
         tLKJ6hmSimHWCmf8pvSAPakTwvDZM0JDmbiTwPSw6Not5QFL033Tg4KQHPe4MQAO0l90
         nswfC6PaeBzl5aE5Y1xfPcn2QwSNUjtwd5HiAhB+YQU/uz/2Myaf7vz4Tm752geTh37B
         eSKtx1GSHMkr0jRL5u/Z90S03nAoZgI3f3pqKMdNPFi5FGazKF6okLzGq22VWWzJUl8L
         BtDA==
X-Forwarded-Encrypted: i=1; AJvYcCUkN72CfDXAC/EL3/oCuAwM0tYhBrlD7GtBTgnQ4X0M8BKghECzXXTc78C4MEmHanRwuJFTvg4TBwX4ckr4/tl14LU8mz271/DHgKZOt/bV
X-Gm-Message-State: AOJu0Yzf0PujKcDgPogVLPyXvxrCueoAMYDbF7f2kHnDdq838PypJONn
	aaksJ4T/wK5rGgBlxerxvOsC/n1kP61K/ZO0GBdwD+1TPbcWkOkvvrTfIc1hL7w=
X-Google-Smtp-Source: AGHT+IEfRUjBsR081et3wJOadMgBsrPT+MF87MwTDvd2ymBdOvFDiLCp8AN/vnIfSdOc1TYzaATntQ==
X-Received: by 2002:adf:f60c:0:b0:343:3f59:c97e with SMTP id t12-20020adff60c000000b003433f59c97emr1553063wrp.6.1713444238851;
        Thu, 18 Apr 2024 05:43:58 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:43:57 -0700 (PDT)
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
Subject: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Date: Thu, 18 Apr 2024 14:42:27 +0200
Message-ID: <20240418124300.1387978-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054404_965787_F7872521 
X-CRM114-Status: UNSURE (   9.89  )
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

VGhlIFpjKiBzdGFuZGFyZCBleHRlbnNpb24gZm9yIGNvZGUgcmVkdWN0aW9uIGludHJvZHVjZXMg
bmV3IGV4dGVuc2lvbnMuClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBaY2EsIFpjZiwgWmNk
IGFuZCBaY2IuIFpjZSwgWmNtdCBhbmQgWmNtcAphcmUgbGVmdCBvdXQgb2YgdGhpcyBwYXRjaCBz
aW5jZSB0aGV5IGFyZSB0YXJnZXRpbmcgbWljcm9jb250cm9sbGVycy8KZW1iZWRkZWQgQ1BVcyBp
bnN0ZWFkIG9mIGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIHwgNCArKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA0ICsr
KysKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CmluZGV4IDU0M2UzZWEyZGEwZS4uYjc1NTFiYWQzNDFiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CkBAIC04Miw2ICs4MiwxMCBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pBQ0FTCQk3MwogI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1hBTkRFU1BNVQkJNzQKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9a
SU1PUAkJNzUKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0EJCTc2CisjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfWkNCCQk3NworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDRAkJNzgKKyNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9aQ0YJCTc5CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJ
MTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCAxMTViYTAwMWYxYmMuLjA5ZGVlMDcxMjc0
ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjYxLDYgKzI2MSwxMCBAQCBjb25zdCBzdHJ1
Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6ZmEsIFJJU0NWX0lTQV9FWFRfWkZBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
ZmgsIFJJU0NWX0lTQV9FWFRfWkZIKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmhtaW4sIFJJ
U0NWX0lTQV9FWFRfWkZITUlOKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2EsIFJJU0NWX0lT
QV9FWFRfWkNBKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2IsIFJJU0NWX0lTQV9FWFRfWkNC
KSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2QsIFJJU0NWX0lTQV9FWFRfWkNEKSwKKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6Y2YsIFJJU0NWX0lTQV9FWFRfWkNGKSwKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6YmEsIFJJU0NWX0lTQV9FWFRfWkJBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmMsIFJJU0NW
X0lTQV9FWFRfWkJDKSwKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
