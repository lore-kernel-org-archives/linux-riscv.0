Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C5C7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L/IwB7/zJtUMLWyzTaIUVVpzmLOBXGWDZAlNn0uGfpo=; b=2ymaEgT9jYnQMA
	/JI7daJmiylbczhwDia+bEXtuaT5n9NpzCCeEND0pEVAeNWRp/9Zyx/76KYPQZri3aGPgn5LQkRsf
	6g1g1mxRORnHQyt2Q9uvAIZ3guXi+TX8hzr3SrvBn7v3xxM3c1QBisPcaJn2w+GgZlSANq4h0xvLZ
	WYWWh1J46P92CgwRyncbnR75BkbicFMvMyAntWb7VGhAxnjWiFpsJKSA6C7R+SSY+ZFZaEM4qCO3D
	6LHffUl2i2fsIcYajOKTuFabZOTyNlfCbKNjzCcaVx5VWb9ZHj+AQRwlRP4J9Flubxy53xV0rqqjG
	y4otg9g3hZphR7sstSAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiGh-0000000GWXj-32q9;
	Fri, 20 Jun 2025 20:23:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiFY-0000000GWG7-3W6C
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 20:22:14 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23636167b30so21422175ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750450932; x=1751055732; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zR93x1w6dXrRMkMadRB1UTNlrKc0W0v3FGDIv1ERUx4=;
        b=HLwcx28qS7TNQq4cFEJHx8oyioTtLdOmhEn/Guc6xhOkQJ+UHBJ/O89i0s5WlHYpLX
         0gxGQMbUoC5DVL3BD4J3xze58lmI77x7kXJuVzm1EPjcqvF98lfEXvhoSmDy/VF1sKM9
         6xTWz+4HUAzhpVXxD+87VAVmAF4NQLXxmz1eXvn9eDNnihjXqu4bfnOAtApiyEKspeNm
         k8E4tIZ9tqV9oip387gzRP3XVnbZFA2pr60mCrnvtWyHNxage5PERRNJKi9HRCBaJpwD
         XnslXl8oAbByJP/dT3TcDOxQo2vNKZ8b/l5SISYYHY17GZgGv1qSN8TgazdlSt6SyLaH
         /nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750450932; x=1751055732;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zR93x1w6dXrRMkMadRB1UTNlrKc0W0v3FGDIv1ERUx4=;
        b=d8qL1l25lHK9ZAkp21nOxDw71kBGwLLlllqY4Vkv/dSG1vnDpwoafvlbKMCK2UnAo3
         j+aI6WVyJh+BL0RJbUeKEpCRGMuVQPqTAdGYstRa0/9cRyhpa0SnlDgBMrf9xsH/NtDb
         /0DEv0pkD0HcfGp9DEdmwlS+e6GqTAFSeFJwRxc6lMy4WiEPAWJpbPiGx8zFICV31Iiv
         djrDnjJZWMCxnPf45iUoXGxWKKzAaM0HoDVml4pFu7CPf/Iau6NMliOYYgJhKaC53EQi
         13XSIA7x1aEvbNylQSYqz7CfXJdOYEFOuNS+W1gtLuqgWKgkqC5rjoYZDr6NNKeM0thW
         9I/w==
X-Gm-Message-State: AOJu0YxVoSaQIGgXmUM5B4wNEElhKN9cAU0GOxBedI7400d23ba5RsRi
	CQrVRb7T34L7nGqv3c+xpqJso+h4eauuNoEktlubhJnqlIdLdu9TK6pfB3rRHJyfskM=
X-Gm-Gg: ASbGncsWWlRduX5jQthKLmBrQhNb72mj+TRCLy63gF0vXNnTb1qV6bzeMPShx2y5K68
	blgcMeQI7d5O1nC4hoqudf1zOFv090nDeVhndYN4YI1STsqDMk6IXdFjG8nkPY4otjMkeKGWexl
	mROT+67nV16MYhA/ALsr9LlBrQwTwBoYIsybbvgd1vmBTOGCD9wUgm7Rgel/GByrTs/Qiu8VET1
	GVlu/85Sybg+OxLMfubP3lCoYPHNpNcEhjPE3augyi2bt+KbnDXX68/CuNTcRF3hOt1bAYeXlky
	7yqvn1bvShcvHo7Cpr0dtO/k/y7GwxUrhvF2L7QseJZ47swu1LzzNJQ4zkyGdMdfF38+ENTj8Ym
	0DcJKDCa65zJ8E7c1M6QDZ2k25j05WtlMjA==
X-Google-Smtp-Source: AGHT+IGMjAKS+ZR6xDwRzLnhzjJTUfYEfrwovg8rbA1ebQN5xfuztY8xY8dqTmR5sIFHBMzmyc1fcA==
X-Received: by 2002:a17:903:3bc4:b0:224:10a2:cae7 with SMTP id d9443c01a7336-237d9981dc9mr67398695ad.40.1750450932143;
        Fri, 20 Jun 2025 13:22:12 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860fb58sm24239005ad.99.2025.06.20.13.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:22:11 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 0/3] Move duplicated instructions macros into asm/insn.h
Date: Fri, 20 Jun 2025 20:21:56 +0000
Message-Id: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOTCVWgC/x3N0QrCMAxA0V8ZeTbQZVTQXxEpsc00UONoXRmM/
 bvFx/Ny7w5VikqF67BDkaZVP9bhTwPEF9tTUFM3kCPvzuQwSUPOsqFatZDWJWvkr4Tmw5tt5Yw
 UaRovY5zc/IDeWYrMuv0ft/tx/ADolUImcwAAAA==
X-Change-ID: 20250620-dev-alex-insn_duplicate_v5_manual-2c23191c30fb
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=zNnEbdShfnt7dg6Wnhs4FrAsA8snzs7PQOci4sCR+Cw=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJCD72P8Dn9w+tB9qn6mgksQSULDE+I5Uh+Cv1r/Vl9V
 zyHwHKNjlIWBjEOBlkxRRYF84SuFvuz9bP/XHoPM4eVCWQIAxenAExEO4Lhn2L99duffV9+4rU4
 c++cq1De1m3/N17SqX9TLrJw5+2jH7wYGZYK1y25xpz/NbrjiP2VGt+AsASb1/PY1jKVBUxeHRu
 TyA4A
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132213_036004_165BE3B7 
X-CRM114-Status: UNSURE (   5.65  )
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

VGhlIGluc3RydWN0aW9ucyBwYXJzaW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBv
ZiB0aGVtIGhhZCBkaWZmZXJlbnQKaW1wbGVtZW50YXRpb25zLCB3aGljaCBpcyBlcnJvciBwcm9u
ZS4KClNvIGxldCdzIGNvbnNvbGlkYXRlIHRob3NlIG1hY3JvcyBpbiBhc20vaW5zbi5oLgoKdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDIyMDgyNTQ1LjQ1MDQ1
My0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDI1MDUwODA4MjIxNS44ODY1OC0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20v
CnYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDUwODEyNTIwMi4x
MDg2MTMtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwp2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNTA1MTYxNDA4MDUuMjgyNzcwLTEtYWxleGdoaXRpQHJpdm9zaW5j
LmNvbS8KCkNoYW5nZXMgaW4gdjU6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE2LXJjMQoKQ2hhbmdl
cyBpbiB2NDoKLSBSZWJhc2Ugb24gdG9wIG9mIGZvci1uZXh0IChvbiB0b3Agb2YgNi4xNS1yYzYp
CgpDaGFuZ2VzIGluIHYzOgotIEZpeCBwYXRjaCAyIHdoaWNoIGNhdXNlZCBidWlsZCBmYWlsdXJl
cyAobGludXggcmlzY3YgYm90KSwgYnV0IHRoZQogIHBhdGNoc2V0IGlzIGV4YWN0bHkgdGhlIHNh
bWUgYXMgdjIKCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjNQotIEFk
ZCBSQiB0YWdzCi0gRGVmaW5lIFJWX1goKSB1c2luZyBSVl9YX21hc2soKSAoQ2zDqW1lbnQpCi0g
UmVtb3ZlIHVudXNlZCBkZWZpbmVzIChDbMOpbWVudCkKLSBGaXggdGFidWxhdGlvbnMgKERyZXcp
CgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
Ci0tLQpBbGV4YW5kcmUgR2hpdGkgKDMpOgogICAgICByaXNjdjogRml4IHR5cG8gRVhSQUNUIC0+
IEVYVFJBQ1QKICAgICAgcmlzY3Y6IFN0cmVuZ3RoZW4gZHVwbGljYXRlIGFuZCBpbmNvbnNpc3Rl
bnQgZGVmaW5pdGlvbiBvZiBSVl9YKCkKICAgICAgcmlzY3Y6IE1vdmUgYWxsIGR1cGxpY2F0ZSBp
bnNuIHBhcnNpbmcgbWFjcm9zIGludG8gYXNtL2luc24uaAoKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaW5zbi5oICAgICAgICAgIHwgMjA2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LQogYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgfCAgIDIgKy0KIGFyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgIHwgMTQ0ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyAgICAgICAgICAgICB8ICAgMiArLQog
YXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgICAgICAgICAgICAgfCAxMjggKy0tLS0tLS0tLS0t
LS0tLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTg4IGluc2VydGlvbnMoKyksIDI5NCBkZWxldGlv
bnMoLSkKLS0tCmJhc2UtY29tbWl0OiA3MzFlOTk4YzQyOTk3NGNiMTQxYTA0OWMxMzQ3YTljYWI0
NDRlNDRjCmNoYW5nZS1pZDogMjAyNTA2MjAtZGV2LWFsZXgtaW5zbl9kdXBsaWNhdGVfdjVfbWFu
dWFsLTJjMjMxOTFjMzBmYgoKQmVzdCByZWdhcmRzLAotLSAKQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
