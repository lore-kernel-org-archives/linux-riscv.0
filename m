Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C401AC35FF6
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gziYNBLUcvXEfBSham/kLJnRZX8Oe5yUB47l09rEeA=; b=1mMAQIpOmbviON
	wrXhQs7s0PFraqtpjSEOvfhRQLPJ34BN5jtzltrRzfM8C6QOU8LySEJY+vKUlVjq6BPQeklim3uqo
	EpDiOH2A9ql5ZVFYT6p4FPRPJ1G6jiz5mwfkrU/KUTAdYig7FX2Mf5z+2fZAcNlkhniVNctc9Mmk3
	Tq5hsKq62LbYWke1r2lhe6F+4tzvDp6wwBKkBEnaeUDY5Ka6r29YFGxq9+/LAVaYieMPO5W9IX56s
	ObatVdonGzHjVVBmCrNVlto8jfKojBFkunlV7kUfEWKHCaF+pSjuTDlGt5h9egLmcNGaPCz0DCTt6
	lfymo1z7es9RYr3RDVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLt-00000003FwO-3NmP;
	Mon, 10 Mar 2025 15:47:37 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treor-000000037dl-1dqX
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2235189adaeso72912165ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619609; x=1742224409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP/QN2TKpQVKty1QPq9K94rdshw9XjhsCR/clUjZxuE=;
        b=RWKI2/Zvh4sAGHgYxNblMeETjQaSygY0Ih6UtJsg6nQy/GdhMy5Kk2BGm3r7h9Wg0T
         ALMlgDXSQ1MDr9YRJQKf4FHzfEuy8IVBv99IZ+JPk5LoTFZhjcCn0n1IVEGUo1kD3UIQ
         6tIqfTqZ49Qg/mWztBXsk7FafO11rPgw90IS4mWLoW8iGP+oR6gTsIEVgVNazci/oeCo
         uPJBa7CY2wfAEx/S5BEWVMJX3Jb6mRj0swEeeLw9YY1wQ1gMNY86pxDm14DY/R6xhMnv
         2LOrMOPvgho8IAxOFbC6srA/Cnd1lv81vVrWAo5JBWjaZVtvD/lu7fRx7Ln1pc4yTW7k
         uiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619609; x=1742224409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CP/QN2TKpQVKty1QPq9K94rdshw9XjhsCR/clUjZxuE=;
        b=QDz9J/Shoiz4CdY1npAGaa2enSVkoWeiJLd0u1YNC9UUlIrDvKntKDkKU0qopBI4Me
         tnhHj17idsRN8cy0bmU5XbbkILTjgcom/srSh+dvm92Y54EQMmuTCg2Ekb7N6r8jQxrH
         UcsBAJPs4Fykm5A8fwXGkORAy0kEztl+mM0pfAhLWh2W0YOrQh8e8mu+is9NPfM/ToQo
         nZAD/9zVPacFgcwvVWfb+2kvduTd6XsmMNYpkB9l26QTOvmuqnAHV3IYLonzY/hMqaRp
         pbSNDbl/Fd+2+NM2tcTsaQHINytRJ9ijJQ7QuWCMoQhg4U/Jz7PYPbvQHbXco4aZDWPq
         AhlA==
X-Forwarded-Encrypted: i=1; AJvYcCXMaqDjiyu/ipyOMxoF0ZGaMXekqsKRavgJwnRZVzwtOOzAbrhLl9uVuSksEa1TfEF58fauxfPCJtmkWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYGD++Z1qyFFPtOLkmRBDqgUOFCFkkWLXVUsEo4rUlhER95n4Q
	MeUdOO5Sw6/hLYEDtGovfLbf/O6WVDrwLA8rRPTToI30S8yrBi54Kxdw1bq40xM=
X-Gm-Gg: ASbGncuy9Mie+X3LVPBsZgEKbNLLeKv3NcQQq5H2EdzHOkuk1abkClAfJbT65BTbiDA
	qEe2HOaCUgJ2Ao2T7ceEYr34m4gnagkE3HaHvHXDi4cpVOjIfpslwVT7vOwIloqfuCpnlrnYgDh
	pRxIqjpnLxnEAbg1e5D2EzeNlwE3LIYvf9Q7cfR79aQ2tRneCkOa2ptqoJ1xqC6AbkZYsagB6LG
	dQIlX1VSmkzMApxcap/3qOyCrriza1Ces/Lo/AnmvB1alX1dz40KDO0PMxylUWz8aI4tYO9BRRF
	vrTI9HK0pvzYIAG96yiyZyspyZWLiTHH1WFdlejxv2IgejmBuTEE9u1U
X-Google-Smtp-Source: AGHT+IE/CwbxNhDp7rRzvfmLqzJMclwTPVUcQ5dvDrzAMSsXdg6waC3I4WKcj3iwXpglVe985eMicg==
X-Received: by 2002:a17:902:e84c:b0:21f:40de:ae4e with SMTP id d9443c01a7336-2245360f020mr151160385ad.9.1741619608740;
        Mon, 10 Mar 2025 08:13:28 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:28 -0700 (PDT)
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
Subject: [PATCH v3 05/17] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Mon, 10 Mar 2025 16:12:12 +0100
Message-ID: <20250310151229.2365992-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081329_430462_C802B6AD 
X-CRM114-Status: GOOD (  12.38  )
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

c2NoZWR1bGVfb25fZWFjaF9jcHUoKSB3YXMgdXNlZCB3aXRob3V0IGFueSBnb29kIHJlYXNvbiB3
aGlsZSBkb2N1bWVudGVkCmFzIHZlcnkgc2xvdy4gVGhpcyBjYWxsIHdhcyBpbiB0aGUgYm9vdCBw
YXRoLCBzbyBiZXR0ZXIgdXNlCm9uX2VhY2hfY3B1KCkgZm9yIHNjYWxhciBtaXNhbGlnbmVkIGNo
ZWNraW5nLiBWZWN0b3IgbWlzYWxpZ25lZCBjaGVjawpzdGlsbCBuZWVkcyB0byB1c2Ugc2NoZWR1
bGVfb25fZWFjaF9jcHUoKSBzaW5jZSBpdCByZXF1aXJlcyBpcnFzIHRvIGJlCmVuYWJsZWQgYnV0
IHRoYXQncyBsZXNzIG9mIGEgcHJvYmxlbSBzaW5jZSB0aGlzIGNvZGUgaXMgcmFuIGluIGEga3Ro
cmVhZC4KQWRkIGEgY29tbWVudCB0byBleHBsaWNpdCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQu
YwppbmRleCA5MGFjNzQxOTEzNTcuLmZmYWM0MjRmYWE4OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYwpAQCAtNjE2LDYgKzYxNiwxMSBAQCBib29sIGNoZWNrX3ZlY3Rvcl91bmFs
aWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAJCXJldHVybiBmYWxzZTsKIAl9
CiAKKwkvKgorCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hlZHVs
ZV9vbl9lYWNoX2NwdSgpIGlzIHVzZWQKKwkgKiBzaW5jZSBrZXJuZWxfdmVjdG9yX2JlZ2luKCkg
dGhhdCBpcyBjYWxsZWQgaW5zaWRlIHRoZSB2ZWN0b3IgY29kZQorCSAqIGV4cGVjdHMgaXJxcyB0
byBiZSBlbmFibGVkIG9yIGl0IHdpbGwgcGFuaWMoKS4KKwkgKi8KIAlzY2hlZHVsZV9vbl9lYWNo
X2NwdShjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCk7CiAKIAlmb3JfZWFj
aF9vbmxpbmVfY3B1KGNwdSkKQEAgLTYzNiw3ICs2NDEsNyBAQCBib29sIGNoZWNrX3ZlY3Rvcl91
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAKIHN0YXRpYyBib29sIHVu
YWxpZ25lZF9jdGwgX19yZWFkX21vc3RseTsKIAotc3RhdGljIHZvaWQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2Vk
KQorc3RhdGljIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCh2b2lkICphcmcg
X19hbHdheXNfdW51c2VkKQogewogCWludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAJbG9u
ZyAqbWFzX3B0ciA9IHBlcl9jcHVfcHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KTsK
QEAgLTY3Nyw3ICs2ODIsNyBAQCBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRf
YWxsX2NwdXModm9pZCkKIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0YXNrcyByZXF1ZXN0
aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQogCSAqIENQVS4KIAkgKi8KLQlzY2hlZHVs
ZV9vbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKTsKKwlvbl9lYWNo
X2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkLCBOVUxMLCAxKTsKIAogCWZvcl9l
YWNoX29ubGluZV9jcHUoY3B1KQogCQlpZiAocGVyX2NwdShtaXNhbGlnbmVkX2FjY2Vzc19zcGVl
ZCwgY3B1KQotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
