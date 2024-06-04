Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15966C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QivfiTTHjK4g7BpnrhTrL+A9N/GfDoJGQlHWDzTL86Q=; b=jDvAHgL6r9vlWR
	dq9mTlM60qd0SAbQr3lUEdJZW5y9ahVqlpGCwJWlX2fGlbv1t9B6+CK6XNfJR5EtuxcaNi+6JhU1Y
	q7Khd8zjnvRNMy6Mgy9dBtcoyZfEi0GV+vPVCM3gryGXgk7MckBilJ+DRPY+8aAL2IccqHNEk9wbP
	Dzu27UgUo3AHdtaCWAu5NZd3BbL+RBgw6oD3w/AVHvmjvOf56W7/3Cmc1mWDPPSFXgT9kVXJ2IspZ
	mcSBETvFRd2bbZruk3Z0s3+arjdB+cvPEIzEcnz4+GR4/vAGAwUhj40mbX/Iv2b6Ej1LY3LJNwKQD
	1XOjx1yTV6Vy5UwIgaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZr-00000002MBB-3V1V;
	Tue, 04 Jun 2024 12:47:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZn-00000002M6o-2jks
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:47:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f6176b0420so3740505ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505261; x=1718110061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjP9cWqi8MF5LcHAVib0g8zUfroe29LCYWJfLV/r52Y=;
        b=qAeLLAX1Z4xXV2UaaR1nwOGOafn1I/o5vtjQDcE1tPttNk4yGTWFRR55D0oRO83lyy
         2Qws2p9Wve86eJz/gTEWMaQH4d5XJ9j6jJQLYhoQ8RTgTJsVBfaM1UIB4XYnOC6gzPW+
         NOYfnEa3L4EsIX0q1HWKG2C9aBel1nVY1wJzNAjWoPPBTgrRTFysYMrbdNs9fbpqAK92
         I/Mt9+Jpz8r9vNc9S++gyShQA5BTvwWe1yQK0m+2c3eNwhMamBSZM4YBoi8EHHJ5bObs
         j0kans5i1X1D9IUei8OaAS04e3DbX0uzq+vTQpPwaEO6C48uHhyxnTdbGgpLezHCd2We
         p4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505261; x=1718110061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjP9cWqi8MF5LcHAVib0g8zUfroe29LCYWJfLV/r52Y=;
        b=D5d4HVH5wKThkyoEDMtiToDSrN7wv8cCwfjHzTdA+WICfRBHw8uTC4kMGS02RPf/48
         cNifCZjvdIvqykFoayBh1Y8/EjSdQLnNqDLGEOVtzqmTIIXInNadZgEm1ouhuJWy9/US
         4OU9Icmh+QUG0GHGvIUpu5SK11/6bn960UIuVClvtWLKacw2r5kSjqpZd3lkC7a7tI1B
         S5G4GFtVxtIrhuHzPslvoX9mQk97MnkiePi3nuLTo9dm1UEoGTT156811MGoy/ey5faB
         hZ7voOoZwuP+r33kWWoKQLmps2N7WL4h7ytfBh2Kd4aB3s4NB5/xwp93nwHTMG3ZUwJJ
         k46w==
X-Forwarded-Encrypted: i=1; AJvYcCWFrIEi5eLcewtaDbw84neSo5l1olH7hJ89ZVpOEoYvuQTCVzYdYzFEp/hIeeJKCDr9WwOvCl4cX9Z4VqNiMDUmtc+8JFxWz5NyW543T3vj
X-Gm-Message-State: AOJu0YyFhd6aelUcd5MLELDtuR9cJrCQMC6uy9YccXEsVG1FChJ1PcqQ
	2KglYLBRjYr/k1PeEq4SELq9JzT5isTkXvzWO5I4xLN+nLZQm/WYrp1VMcjeGEM=
X-Google-Smtp-Source: AGHT+IE8wijIs7nBE2lAM+asVyiMEjL4UrorzZ1e540mUci5kPZaEXedGsRaMEEhVJegjQvm1F51AQ==
X-Received: by 2002:a17:902:ec8c:b0:1f2:ffbc:7156 with SMTP id d9443c01a7336-1f636fcf230mr129979715ad.1.1717505261548;
        Tue, 04 Jun 2024 05:47:41 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:47:41 -0700 (PDT)
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
Subject: [PATCH v6 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Date: Tue,  4 Jun 2024 14:45:40 +0200
Message-ID: <20240604124550.3214710-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054743_789637_B1C86DBB 
X-CRM114-Status: GOOD (  16.58  )
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
aHdjYXAuaCB8ICA1ICsrKy0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDU1ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNTggaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggNTQz
ZTNlYTJkYTBlLi4zOTE1YzljYjA4OGIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTgyLDcg
KzgyLDEwIEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFDQVMJCTczCiAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWEFOREVTUE1VCQk3NAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJTU9QCQk3NQot
CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNBCQk3NgorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pD
QgkJNzcKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTc4CisjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfWkNGCQk3OQogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKIAogI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJMTI4CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggZDIw
ZTIzNmNlYzhiLi41M2M3Y2E1OTBhMjIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTExMSw2
ICsxMTEsOSBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUoY29uc3Qgc3Ry
dWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKIAogI2RlZmluZSBfX1JJU0NWX0lTQV9FWFRf
REFUQShfbmFtZSwgX2lkKSBfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIE5VTEwsIDAs
IE5VTEwpCiAKKyNkZWZpbmUgX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoX25hbWUsIF9p
ZCwgX3ZhbGlkYXRlKSBcCisJCQlfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIE5VTEws
IDAsIF92YWxpZGF0ZSkKKwogLyogVXNlZCB0byBkZWNsYXJlIHB1cmUgImxhc3NvIiBleHRlbnNp
b24gKFprIGZvciBpbnN0YW5jZSkgKi8KICNkZWZpbmUgX19SSVNDVl9JU0FfRVhUX0JVTkRMRShf
bmFtZSwgX2J1bmRsZWRfZXh0cykgXAogCV9SSVNDVl9JU0FfRVhUX0RBVEEoX25hbWUsIFJJU0NW
X0lTQV9FWFRfSU5WQUxJRCwgX2J1bmRsZWRfZXh0cywgXApAQCAtMTIyLDYgKzEyNSwzNyBAQCBz
dGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lz
YV9leHRfZGF0YSAqZGF0YSwKICNkZWZpbmUgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUX1ZBTElE
QVRFKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywgX3ZhbGlkYXRlKSBcCiAJX1JJU0NWX0lTQV9FWFRf
REFUQShfbmFtZSwgX2lkLCBfc3ViX2V4dHMsIEFSUkFZX1NJWkUoX3N1Yl9leHRzKSwgX3ZhbGlk
YXRlKQogCitzdGF0aWMgaW50IHJpc2N2X2V4dF96Y2FfZGVwZW5kcyhjb25zdCBzdHJ1Y3Qgcmlz
Y3ZfaXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSBjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0
bWFwKQoreworCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAs
IFJJU0NWX0lTQV9FWFRfWkNBKSkKKwkJcmV0dXJuIDA7CisKKwlyZXR1cm4gLUVQUk9CRV9ERUZF
UjsKK30KK3N0YXRpYyBpbnQgcmlzY3ZfZXh0X3pjZF92YWxpZGF0ZShjb25zdCBzdHJ1Y3Qgcmlz
Y3ZfaXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2Jp
dG1hcCkKK3sKKwlpZiAoX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFw
LCBSSVNDVl9JU0FfRVhUX1pDQSkgJiYKKwkgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2QpKQorCQlyZXR1cm4gMDsKKworCXJldHVy
biAtRVBST0JFX0RFRkVSOworfQorCitzdGF0aWMgaW50IHJpc2N2X2V4dF96Y2ZfdmFsaWRhdGUo
Y29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKKwkJCQkgIGNvbnN0IHVuc2ln
bmVkIGxvbmcgKmlzYV9iaXRtYXApCit7CisJaWYgKElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkK
KwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJs
ZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pDQSkgJiYKKwkgICAgX19yaXNjdl9pc2FfZXh0
ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2YpKQorCQlyZXR1cm4g
MDsKKworCXJldHVybiAtRVBST0JFX0RFRkVSOworfQorCiBzdGF0aWMgY29uc3QgdW5zaWduZWQg
aW50IHJpc2N2X3prX2J1bmRsZWRfZXh0c1tdID0gewogCVJJU0NWX0lTQV9FWFRfWkJLQiwKIAlS
SVNDVl9JU0FfRVhUX1pCS0MsCkBAIC0yMDIsNiArMjM2LDIxIEBAIHN0YXRpYyBjb25zdCB1bnNp
Z25lZCBpbnQgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHNbXSA9IHsKIAlSSVNDVl9JU0FfRVhUX1hM
SU5VWEVOVkNGRwogfTsKIAorLyoKKyAqIFpjKiBzcGVjIHN0YXRlcyB0aGF0OgorICogLSBDIGFs
d2F5cyBpbXBsaWVzIFpjYQorICogLSBDK0YgaW1wbGllcyBaY2YgKFJWMzIgb25seSkKKyAqIC0g
QytEIGltcGxpZXMgWmNkCisgKgorICogVGhlc2UgZXh0ZW5zaW9ucyB3aWxsIGJlIGVuYWJsZWQg
YW5kIHRoZW4gdmFsaWRhdGVkIGRlcGVuZGluZyBvbiB0aGUKKyAqIGF2YWlsYWJpbGl0eSBvZiBG
L0QgUlYzMi4KKyAqLworc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl9jX2V4dHNbXSA9
IHsKKwlSSVNDVl9JU0FfRVhUX1pDQSwKKwlSSVNDVl9JU0FfRVhUX1pDRiwKKwlSSVNDVl9JU0Ff
RVhUX1pDRCwKK307CisKIC8qCiAgKiBUaGUgY2Fub25pY2FsIG9yZGVyIG9mIElTQSBleHRlbnNp
b24gbmFtZXMgaW4gdGhlIElTQSBzdHJpbmcgaXMgZGVmaW5lZCBpbgogICogY2hhcHRlciAyNyBv
ZiB0aGUgdW5wcml2aWxlZ2VkIHNwZWNpZmljYXRpb24uCkBAIC0yNDgsNyArMjk3LDcgQEAgY29u
c3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoZiwgUklTQ1ZfSVNBX0VYVF9mKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QShkLCBSSVNDVl9JU0FfRVhUX2QpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHEsIFJJU0NWX0lT
QV9FWFRfcSksCi0JX19SSVNDVl9JU0FfRVhUX0RBVEEoYywgUklTQ1ZfSVNBX0VYVF9jKSwKKwlf
X1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoYywgUklTQ1ZfSVNBX0VYVF9jLCByaXNjdl9jX2V4dHMp
LAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHYsIFJJU0NWX0lTQV9FWFRfdiksCiAJX19SSVNDVl9J
U0FfRVhUX0RBVEEoaCwgUklTQ1ZfSVNBX0VYVF9oKSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJT
RVRfVkFMSURBVEUoemljYm9tLCBSSVNDVl9JU0FfRVhUX1pJQ0JPTSwgcmlzY3ZfeGxpbnV4ZW52
Y2ZnX2V4dHMsCkBAIC0yNjcsNiArMzE2LDEwIEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0
X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmYSwgUklT
Q1ZfSVNBX0VYVF9aRkEpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VY
VF9aRkgpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aRkhN
SU4pLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpjYSwgUklTQ1ZfSVNBX0VYVF9aQ0EpLAorCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjYiwgUklTQ1ZfSVNBX0VYVF9aQ0IsIHJpc2N2
X2V4dF96Y2FfZGVwZW5kcyksCisJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoemNkLCBS
SVNDVl9JU0FfRVhUX1pDRCwgcmlzY3ZfZXh0X3pjZF92YWxpZGF0ZSksCisJX19SSVNDVl9JU0Ff
RVhUX0RBVEFfVkFMSURBVEUoemNmLCBSSVNDVl9JU0FfRVhUX1pDRiwgcmlzY3ZfZXh0X3pjZl92
YWxpZGF0ZSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSks
CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemJiLCBSSVNDVl9JU0FfRVhUX1pCQiksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoemJjLCBSSVNDVl9JU0FfRVhUX1pCQyksCi0tIAoyLjQ1LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
