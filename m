Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E054AC83F01
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hybb2qcqI/eM+/Yb6xUTcRP7FqPYaFIWSJmJE7cwFa8=; b=tNdIAuNpf5/a+A
	nqA3Gu0nSBI7gXU5XoXTVriBlpbUHu0x9G/Ce7PdChUh8idx+P+22Sa10dBSJk9xJWFN8nnHwF4H8
	/9HLvF5OYzG5sSFrGUpRhnQA3Nw9+C7WeQAKj05fEUF6EWVRiZy6THvalVS1cD1Wiu311z248QFkm
	KL58DZknYEWF157mIgvOvq38TDTGfH90h9C9jGjrDunF4t64kuJnF9Ew7eLxFBjT+ly2f64t7yOYr
	qpIG7sFD5/FH8psWp3DYnpUMvJX3gOkvrmoCYg17vbwtq6EI3e1owWBDYKjxFT77QVIQzqZ3CiCob
	kz6+byPQdxanuOj5xb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhTX-00FLDG-1p;
	Thu, 31 Aug 2023 13:12:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhTQ-00FLA3-0e
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 13:12:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31781e15a0cso601968f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 06:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693487553; x=1694092353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUYKChQYfJZZ8DPO0whW/zno6UWIarXDmyfOm92F8UA=;
        b=gT+vFZ42RdJ6gnLLr8WT+mDJz64+f7Up7VWNrhNgfizBKAMOHBUtg2/0KEs3Nz3tKr
         VgTNnOdQA22sPTdGqOxkhC9aJVzgeqoZCdtH/wRJdJhHdj8RkNMWfR4iO407l5pFFfu1
         /QrpMPkrX+pVqLvBLwskotFCNjAiJh36J6xQrf24vrcN4qceL68UQMA31+uzvlLxAAbl
         Dsq/zR0MSu3gMPvAKqbbAlG4YPAJdvvqFQkzEounuaAcK2N7/pEl8v5QUpfgSph3Y1tD
         LBZs7jiFAomnGmP/w3zJYnokB2OUChAY4/rIiquIgjjcDCFPs6l3jOGBXrgtSFln3k5h
         s0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693487553; x=1694092353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUYKChQYfJZZ8DPO0whW/zno6UWIarXDmyfOm92F8UA=;
        b=WJmHugycDzuVXxkVDP8yJ2G4DS6zEgIj5TsqyCXoLnw0+P5K21uduOzIgomj5NBnRd
         yUBOGzc8BhlXUbeT+KFiMnvsLTfvBnZKAeWEyCDn5Yss4pDWpDw63MbSfB0Gep2HjVMa
         mXYhoHcdgtothLADekMAEMYhJzJkIkExs3EmtaXH/Ssm6KSUFVsiG7qyNyY/XGwrut2b
         V+cmh44W2qQNWfccZDJrmHwiT+fiMPztY6c5NTXV3lg9FwUGw57FNZwiseD2TjBWHBA9
         xXdDF0fd5+WJwnI5VLDctvE0TqOP3MipVxsvZLM9r50DRoRDDSrG85RUczKTRqpUDm9f
         VJoQ==
X-Gm-Message-State: AOJu0YzXVuL6+NsZGgHssRt/xqbQohQe4EHHEFBYSCx9jZe8qS7Ysx6h
	Dd7UYZyU/CN5ZeJahaX9PT0=
X-Google-Smtp-Source: AGHT+IEmRLcQA4Zh4qOEOVWO+OJdUOgzn5p2uNiV+/qiisIBP67acZzJXuCuSC/kJMqcbfCWT7qEVg==
X-Received: by 2002:a5d:668f:0:b0:317:6a7c:6e07 with SMTP id l15-20020a5d668f000000b003176a7c6e07mr3756142wru.32.1693487553087;
        Thu, 31 Aug 2023 06:12:33 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-54-170-241-106.eu-west-1.compute.amazonaws.com. [54.170.241.106])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b00317f70240afsm2206607wrc.27.2023.08.31.06.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 06:12:32 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	pulehui@huawei.com,
	conor.dooley@microchip.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yhs@fb.com,
	kpsingh@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v4 2/4] riscv: extend patch_text_nosync() for multiple pages
Date: Thu, 31 Aug 2023 13:12:27 +0000
Message-Id: <20230831131229.497941-3-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230831131229.497941-1-puranjay12@gmail.com>
References: <20230831131229.497941-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_061236_239858_748B6AB3 
X-CRM114-Status: GOOD (  15.74  )
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

VGhlIHBhdGNoX2luc25fd3JpdGUoKSBmdW5jdGlvbiBjdXJyZW50bHkgZG9lc24ndCB3b3JrIGZv
ciBtdWx0aXBsZSBwYWdlcwpvZiBpbnN0cnVjdGlvbnMsIHRoZXJlZm9yZSBwYXRjaF90ZXh0X25v
c3luYygpIHdpbGwgZmFpbCB3aXRoIGEgcGFnZSBmYXVsdAppZiBjYWxsZWQgd2l0aCBsZW5ndGhz
IHNwYW5uaW5nIG11bHRpcGxlIHBhZ2VzLgoKVGhpcyBjb21taXQgZXh0ZW5kcyB0aGUgcGF0Y2hf
aW5zbl93cml0ZSgpIGZ1bmN0aW9uIHRvIHN1cHBvcnQgbXVsdGlwbGUKcGFnZXMgYnkgY29weWlu
ZyBhdCBtYXggMiBwYWdlcyBhdCBhIHRpbWUgaW4gYSBsb29wLiBUaGlzIGltcGxlbWVudGF0aW9u
CmlzIHNpbWlsYXIgdG8gdGV4dF9wb2tlX2NvcHkoKSBmdW5jdGlvbiBvZiB4ODYuCgpTaWduZWQt
b2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5jb20+ClJldmlld2VkLWJ5
OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Acml2b3NpbmMuY29tPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jIHwgMzcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0
Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKaW5kZXggNTc1ZTcxZDZjOGFlLi4yYzk3
ZTI0NmY0ZGMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcGF0Y2guYwpAQCAtNTMsMTIgKzUzLDE4IEBAIHN0YXRpYyB2b2lkIHBh
dGNoX3VubWFwKGludCBmaXhtYXApCiB9CiBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfdW5tYXApOwog
Ci1zdGF0aWMgaW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5z
biwgc2l6ZV90IGxlbikKK3N0YXRpYyBpbnQgX19wYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIs
IGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4pCiB7CiAJdm9pZCAqd2FkZHIgPSBhZGRyOwog
CWJvb2wgYWNyb3NzX3BhZ2VzID0gKCgodWludHB0cl90KSBhZGRyICYgflBBR0VfTUFTSykgKyBs
ZW4pID4gUEFHRV9TSVpFOwogCWludCByZXQ7CiAKKwkvKgorCSAqIE9ubHkgdHdvIHBhZ2VzIGNh
biBiZSBtYXBwZWQgYXQgYSB0aW1lIGZvciB3cml0aW5nLgorCSAqLworCWlmIChsZW4gKyBvZmZz
ZXRfaW5fcGFnZShhZGRyKSA+IDIgKiBQQUdFX1NJWkUpCisJCXJldHVybiAtRUlOVkFMOworCiAJ
LyoKIAkgKiBCZWZvcmUgcmVhY2hpbmcgaGVyZSwgaXQgd2FzIGV4cGVjdGVkIHRvIGxvY2sgdGhl
IHRleHRfbXV0ZXgKIAkgKiBhbHJlYWR5LCBzbyB3ZSBkb24ndCBuZWVkIHRvIGdpdmUgYW5vdGhl
ciBsb2NrIGhlcmUgYW5kIGNvdWxkCkBAIC03NCw3ICs4MCw3IEBAIHN0YXRpYyBpbnQgcGF0Y2hf
aW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQogCQls
b2NrZGVwX2Fzc2VydF9oZWxkKCZ0ZXh0X211dGV4KTsKIAogCWlmIChhY3Jvc3NfcGFnZXMpCi0J
CXBhdGNoX21hcChhZGRyICsgbGVuLCBGSVhfVEVYVF9QT0tFMSk7CisJCXBhdGNoX21hcChhZGRy
ICsgUEFHRV9TSVpFLCBGSVhfVEVYVF9QT0tFMSk7CiAKIAl3YWRkciA9IHBhdGNoX21hcChhZGRy
LCBGSVhfVEVYVF9QT0tFMCk7CiAKQEAgLTg3LDE1ICs5MywzNiBAQCBzdGF0aWMgaW50IHBhdGNo
X2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKIAog
CXJldHVybiByZXQ7CiB9Ci1OT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zbl93cml0ZSk7CitOT0tQ
Uk9CRV9TWU1CT0woX19wYXRjaF9pbnNuX3dyaXRlKTsKICNlbHNlCi1zdGF0aWMgaW50IHBhdGNo
X2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKK3N0
YXRpYyBpbnQgX19wYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24s
IHNpemVfdCBsZW4pCiB7CiAJcmV0dXJuIGNvcHlfdG9fa2VybmVsX25vZmF1bHQoYWRkciwgaW5z
biwgbGVuKTsKIH0KLU5PS1BST0JFX1NZTUJPTChwYXRjaF9pbnNuX3dyaXRlKTsKK05PS1BST0JF
X1NZTUJPTChfX3BhdGNoX2luc25fd3JpdGUpOwogI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KIAor
c3RhdGljIGludCBwYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24s
IHNpemVfdCBsZW4pCit7CisJc2l6ZV90IHBhdGNoZWQgPSAwOworCXNpemVfdCBzaXplOworCWlu
dCByZXQgPSAwOworCisJLyoKKwkgKiBDb3B5IHRoZSBpbnN0cnVjdGlvbnMgdG8gdGhlIGRlc3Rp
bmF0aW9uIGFkZHJlc3MsIHR3byBwYWdlcyBhdCBhIHRpbWUKKwkgKiBiZWNhdXNlIF9fcGF0Y2hf
aW5zbl93cml0ZSgpIGNhbiBvbmx5IGhhbmRsZSBsZW4gPD0gMiAqIFBBR0VfU0laRS4KKwkgKi8K
Kwl3aGlsZSAocGF0Y2hlZCA8IGxlbiAmJiAhcmV0KSB7CisJCXNpemUgPSBtaW5fdChzaXplX3Qs
IFBBR0VfU0laRSAqIDIgLSBvZmZzZXRfaW5fcGFnZShhZGRyICsgcGF0Y2hlZCksIGxlbiAtIHBh
dGNoZWQpOworCQlyZXQgPSBfX3BhdGNoX2luc25fd3JpdGUoYWRkciArIHBhdGNoZWQsIGluc24g
KyBwYXRjaGVkLCBzaXplKTsKKworCQlwYXRjaGVkICs9IHNpemU7CisJfQorCisJcmV0dXJuIHJl
dDsKK30KK05PS1BST0JFX1NZTUJPTChwYXRjaF9pbnNuX3dyaXRlKTsKKwogaW50IHBhdGNoX3Rl
eHRfbm9zeW5jKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc25zLCBzaXplX3QgbGVuKQogewog
CXUzMiAqdHAgPSBhZGRyOwotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
