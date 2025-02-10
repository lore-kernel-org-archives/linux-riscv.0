Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC77C0219D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 23:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LXtYeLRWg9crOLGuuvPE70Yey2z75YjfI46rFJtsgk=; b=XFVv9IIf/+2IvU
	xAV3Hl7LGwZKaukoHKs0qGaWi1vJfBUOYKUcnTmBHeyploJjjGkl2TcSRBd0alAdkwVY3Gef5P/Sq
	SghL3a9wJ9ymYnhlI5rtc+ALKIzEx92CLG2n4o9fQLBTZa+czCb891BNReDun/C74Szllkv6aHL2x
	UyVKG+2WziLyySO4gA/19S/jh7Qxj6biNQqswFzy5ja0rs5XqerUcjB8zRC7hvPXT654eUPQD7kzg
	nsBh6t1LbK6WWISctK+Gaf1lRVA4ISvD6tqeM4LfbRNlpYnsv2ZmapzIlNcx0cjDtfYBQtp0vdL5+
	NgSGYHpgzHBhKJStetfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdd0-00000001u3j-39JB;
	Mon, 10 Feb 2025 23:55:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS1-00000001VSz-18u7
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso7273785e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223379; x=1739828179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzMhLGWSVmu+B6UkQbjgF0/C3X18++BVbDb7RHWPhdM=;
        b=f6iMZ1HSHak2c6UuxsnzILzW/rkwUGK6MhZ2b33nNmeevkg29ZIj2iJ48ASYJQkoZt
         oRi26nimqFBZfIft8PMzRuXSGjE5dzUsdYtc09/aM7A9OpRcgiKEux19cQW4KHPiyobN
         iCHIU46cr198O3igjJA1Riu6NppBz3jPQqbMQZFyTAHqVYneFS9h7cQMxs0ySyz7qExi
         SR0EC/upvjgLYkkQavEvtXqo2SoqSCZWhKbLmUq8W3lZzNcFkF3vBeNsvk29xNNl5326
         rEUZyP9HgSC1+sZqng2deqHHQJI/56arFwAK1or7K4Q7SuSvyUBaDV+UzzXwH4GwJ6AA
         c8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223379; x=1739828179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzMhLGWSVmu+B6UkQbjgF0/C3X18++BVbDb7RHWPhdM=;
        b=kfmh0cy1jujCdFpFqIs6U6iu8xvfk66Ptq18U2qwSFVcewi1VkVSzl7lEauRulhrHs
         XGgjoNKgrDELMFnFO/158sImkm1uwxVrxKCPVCyMA2htu9n5ryMfDoXKWgtSHUU7iE8w
         SpdchD4Me+Z/CiOXFce7Qm+uNAEjdMld1atGK6M4ldgys/rMfAZrZpDu6XjgSBIW8rv4
         aH5/NgL7T8eAtLb1eqpoUVK33GbEQFl4lky7HMXPcL79crDUsSM0a3zkcC74tC7ySBIi
         aafZQ9VL79i8q6Jpl9TzntLMtq9owUz4r6XyaauhGQ9/oueisYPmTosDPERecqaa7ubC
         cWGg==
X-Forwarded-Encrypted: i=1; AJvYcCVly/0oiISpDcYVj2H+BPxgLpKIR2Bn4FU+IDl5P/ZARkiQSBwhcgGmfZD3KNJ1ctQ5N67xIqfqdfykJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRgUPPtxJpGfrbeR+7tBySXwc1LOG1UDsWneD3wsjcFTqm1sCd
	ey97osoJHsjBy6WynbcSCFIr79vJk1A3asT8BQZ75UbUgPdP6qDkEQLBHCs746Y=
X-Gm-Gg: ASbGncuUWA+Nk3gKgodwCF4x4G0FMTQcM+f2jot5qBl+HYw77r4itiMJIrLG7YTzUwb
	NduXXBP7xcmndyJNVWlosvUoldjOMzsyKxsVSjZCONxDxc0dA/RDH4PRU4QrZDbcSCvtGQ/1qUs
	zfTH4sTBDvic01/ZApDN3u1RgrMoH6Iv8UITtxUpLKqTynT/IEwrvS494I1lMxOU9dOX/A8xFPY
	UYQuKY11vGkT1dVtmimYkGi0/QDd8QfMeT1qNt+9zJ0KITDneLsg/36BMltRwA6NWTBm9LJmteo
	afBj7u4P/W8rksDc
X-Google-Smtp-Source: AGHT+IEdxZi1LVbl9euup4c2vHOS8bchWH6uTAT2rIkrBK2DWGVQXoH4pwkPsigJnMZZocj6TvzXjg==
X-Received: by 2002:a5d:6d0e:0:b0:38d:b34a:679 with SMTP id ffacd0b85a97d-38dc9373577mr10353065f8f.37.1739223379602;
        Mon, 10 Feb 2025 13:36:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:18 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 12/15] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Mon, 10 Feb 2025 22:35:45 +0100
Message-ID: <20250210213549.1867704-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133621_309980_9EDED867 
X-CRM114-Status: GOOD (  14.63  )
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

VGhlIEZXRlQgU0JJIGV4dGVuc2lvbiB3aWxsIG5lZWQgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGUg
bWVtb3J5IGFuZCBkbwppbml0IHRpbWUgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24uIEFkZCBhbiBp
bml0L2RlaW5pdCBjYWxsYmFja3MgdGhhdAphbGxvd3MgdG8gZG8gc28uCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICA5ICsrKysrKysrCiBhcmNoL3Jpc2N2L2t2bS92
Y3B1LmMgICAgICAgICAgICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMg
ICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgNDEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5o
CmluZGV4IDRlZDYyMDNjZGQzMC4uYmNiOTA3NTdiMTQ5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpLmgKQEAgLTQ5LDYgKzQ5LDE0IEBAIHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0
ZW5zaW9uIHsKIAogCS8qIEV4dGVuc2lvbiBzcGVjaWZpYyBwcm9iZSBmdW5jdGlvbiAqLwogCXVu
c2lnbmVkIGxvbmcgKCpwcm9iZSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKKworCS8qCisJICog
SW5pdC9kZWluaXQgZnVuY3Rpb24gY2FsbGVkIG9uY2UgZHVyaW5nIFZDUFUgaW5pdC9kZXN0cm95
LiBUaGVzZQorCSAqIG1pZ2h0IGJlIHVzZSBpZiB0aGUgU0JJIGV4dGVuc2lvbnMgbmVlZCB0byBh
bGxvY2F0ZSBvciBkbyBzcGVjaWZpYworCSAqIGluaXQgdGltZSBvbmx5IGNvbmZpZ3VyYXRpb24u
CisJICovCisJaW50ICgqaW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKKwl2b2lkICgqZGVp
bml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogfTsKIAogdm9pZCBrdm1fcmlzY3ZfdmNwdV9z
YmlfZm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwpA
QCAtNjksNiArNzcsNyBAQCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqa3Zt
X3ZjcHVfc2JpX2ZpbmRfZXh0KAogYm9vbCByaXNjdl92Y3B1X3N1cHBvcnRzX3NiaV9leHQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgaWR4KTsKIGludCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNh
bGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKIHZvaWQga3Zt
X3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK3ZvaWQga3ZtX3Jp
c2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiBpbnQga3ZtX3Jp
c2N2X3ZjcHVfZ2V0X3JlZ19zYmlfc3RhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQg
bG9uZyByZWdfbnVtLAogCQkJCSAgIHVuc2lnbmVkIGxvbmcgKnJlZ192YWwpOwpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCmluZGV4IDYw
ZDY4NGM3NmM1OC4uODc3YmNjODVjMDY3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCkBAIC0xODUsNiArMTg1LDggQEAgdm9pZCBr
dm1fYXJjaF92Y3B1X3Bvc3RjcmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCiB2b2lkIGt2
bV9hcmNoX3ZjcHVfZGVzdHJveShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CisJa3ZtX3Jpc2N2
X3ZjcHVfc2JpX2RlaW5pdCh2Y3B1KTsKKwogCS8qIENsZWFudXAgVkNQVSBBSUEgY29udGV4dCAq
LwogCWt2bV9yaXNjdl92Y3B1X2FpYV9kZWluaXQodmNwdSk7CiAKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCmluZGV4IGQx
YzgzYTc3NzM1ZS4uNDRmNTUxMTQzNDk4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKQEAgLTUwNSw4ICs1MDUsMzgg
QEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJ
CQljb250aW51ZTsKIAkJfQogCisJCWlmICghZXh0LT5kZWZhdWx0X2Rpc2FibGVkICYmIGV4dC0+
aW5pdCAmJgorCQkgICAgZXh0LT5pbml0KHZjcHUpICE9IDApIHsKKwkJCSAgICBzY29udGV4dC0+
ZXh0X3N0YXR1c1tpZHhdID0KKwkJCQkgICAgS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZB
SUxBQkxFOworCQkJICAgIGNvbnRpbnVlOworCQl9CisKIAkJc2NvbnRleHQtPmV4dF9zdGF0dXNb
aWR4XSA9IGV4dC0+ZGVmYXVsdF9kaXNhYmxlZCA/CiAJCQkJCUtWTV9SSVNDVl9TQklfRVhUX1NU
QVRVU19ESVNBQkxFRCA6CiAJCQkJCUtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19FTkFCTEVEOwog
CX0KIH0KKwordm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZjcHUt
PmFyY2guc2JpX2NvbnRleHQ7CisJY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9u
X2VudHJ5ICplbnRyeTsKKwljb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0
OworCWludCBpZHgsIGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsg
aSsrKSB7CisJCWVudHJ5ID0gJnNiaV9leHRbaV07CisJCWV4dCA9IGVudHJ5LT5leHRfcHRyOwor
CQlpZHggPSBlbnRyeS0+ZXh0X2lkeDsKKworCQlpZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlf
U0laRShzY29udGV4dC0+ZXh0X3N0YXR1cykpCisJCQljb250aW51ZTsKKworCQlpZiAoc2NvbnRl
eHQtPmV4dF9zdGF0dXNbaWR4XSA9PSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfVU5BVkFJTEFC
TEUgfHwKKwkJICAgICFleHQtPmRlaW5pdCkKKwkJCWNvbnRpbnVlOworCisJCWV4dC0+ZGVpbml0
KHZjcHUpOworCX0KK30KLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
