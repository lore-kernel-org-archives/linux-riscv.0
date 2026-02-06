Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B7EEE2094
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DENNtL+FLTzRjqVBQ13AWGbrWC/QiHJ/nVix6roD4Y=; b=4nUpeQCkZGW4Id
	AvJrxgRtfGpJM+0dNED+bp2mf2wOxjwsB2162ESvKyK0dBWGkjx3yNurUlOls2dRFh27An5z4ZdMR
	ToB0EO8o2PPsnLL1iq+gAvdQIlt6GuSSViaunqf3t/KRvQ7yFzIdOiRBYIkvz6dPwibAYKwUFY99a
	oxuFPKDledZyW2cuIF2BhXiSSxa+IJDKUBsUMMEiDY7LqOFJg/Giy6PAf8SDI57VOAuvezRV+KzQA
	VsW/TX6286voL6AhgX78SraedUChMON5UHDygvYnxVJcU6oZOzJMAWRqKqU/v50PxmXXGiRxkMZ3U
	6iikrgwVpinTJWEuSaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKpd-0000000BISB-110e;
	Fri, 06 Feb 2026 12:21:05 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKpa-0000000BIRE-0rWU
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:21:04 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-3540266d356so1373041a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 04:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380461; x=1770985261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOZtDu7jSNri6wkbo2wj70FyVnPCcpHXFtiLHwbu29Y=;
        b=dVn1GdrwYYxSHC6xyoavaGe8infhBqOYl6Z8+GkcRGeRms+OIEPUnHAhJ08vwbjHVP
         ZVHKTX9JRhM2EUNU943XpXWBjWzoMhMpv/znK2ixiBBYUtZBU8zwmD1+ayu8V8SEXjWZ
         ji0xEwoyhRx89Gfoo0RQ4LD2MtbJmbzQhrng7zRWcW9MdORgrEOSaKAhwxbsxFH4L55U
         2NTsEfeE4EMuK5g490zLUdgOj+xHv0HMEQtrBHU/Ry5OP79kSl6tFuYWxcZ8Wc4yA3RT
         G68vtCMN8KRlidc6mVtwdxkHWuMlNV0M6Cxd04d07ai6x32dsVf1mAk/3OWEE32jzUWp
         +45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380461; x=1770985261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOZtDu7jSNri6wkbo2wj70FyVnPCcpHXFtiLHwbu29Y=;
        b=mBHgErNxjucSH30NNFVoPmToR3lXlLJX6tZZ+KqEuTtTaCCe18hchBdhWIRJ19fbs/
         5kONMyQQ8O4M+Q+3QpE3uUH0Kdwm/IWshamQxDyhu9+sWwBYWbXjyf+woq1sOnHMxhb7
         5M9DgpOZg8pysaARwAk30asyTh7A63asEsNrEGHCVThWtFUEu0yaAz9D74HxyVc6yGjN
         r4H6uPRI7bILF/WLT+chpQROmwOhsQvHuowDaB9lVwH2yb7gP3W87pBWRkfzZrjHSXjq
         PvG8AH9q0ByFgcAFzVRyjHA+rA4EUUgQBl3cxo3k6fOqTUNYV75jMbpi6ZS049bCbdyD
         YN7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtBavxI90QJ7I9YIHfteCq9urjfNXxvm1y7tkHpY4R16FbhsRIasuiUEuP8eP37DMqyL+0RNH0pIIpqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyApKLE3VTVJYUr46m3sQAVrQo8sd6z7IoFM9h0M8ace4CZTtXp
	3NwG15ZeSr5d8nRABXkbHhDEW0HxHCU6FmkJr9bhqni+NR0DntjowuFi
X-Gm-Gg: AZuq6aJg6L0NtxPYxuCnyHncKIaKIU/lD+JWMsYZgUU2eBp+AYnxPjkBMAkMNlD7Aty
	CjozIKA0Trs7VTza01sI8j4x7jutr6y98Z6LKNF7STrZP5MX3H2iPDb3SnWyr0PInjx1HpjhMj/
	k17oYek+l1VPP+hse8784RG61I26qr1zHtWvDA+Wv4zfVFRUU1pT26C3k/9N5ccab4b2KarsbJF
	OmgOUoAeAqpjCyX4FDBl91xIQeKko8kbMXKgdQ7gC/tXIuljOQ8CVfsfX/+4H09BBa5Lq0Y/5dA
	n3Sp1ECLpsskeJKRH+zgXIX18F5v8nSllDxRJ10EONeE1+Q3vo2P9px8Gz7T1e5Pf181yA+XOpd
	ikgFO7kWyk5ts8/siOY3ncZSEghcV73+ZkJAFTDbZ3T3cgr1OzpJolxviRR3zw6160VH4JPQQC1
	8i27GiGp6ObVX65jHG5qk=
X-Received: by 2002:a17:90b:1e08:b0:34a:b1ea:664e with SMTP id 98e67ed59e1d1-354b3c8c50fmr2606450a91.15.1770380461134;
        Fri, 06 Feb 2026 04:21:01 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b301d93bsm1528222a91.1.2026.02.06.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:21:00 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org,
	bjorn@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jiang.biao@linux.dev
Subject: [PATCH bpf-next v3 3/3] selftests/bpf: enable fsession_test on riscv64
Date: Fri,  6 Feb 2026 20:20:02 +0800
Message-ID: <20260206122002.1494125-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
References: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_042102_242379_BB72D3C1 
X-CRM114-Status: UNSURE (   9.98  )
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

Tm93IHRoYXQgdGhlIFJJU0MtViB0cmFtcG9saW5lIEpJVCBzdXBwb3J0cyBCUEZfVFJBQ0VfRlNF
U1NJT04sIHJ1bgp0aGUgZnNlc3Npb24gc2VsZnRlc3Qgb24gcmlzY3Y2NCBhcyB3ZWxsIGFzIHg4
Nl82NC4KClNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdtbDJAY2hpbmF0ZWxlY29t
LmNuPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CkFja2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19hcmdzX3Rlc3QuYyB8IDIgKy0KIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19pcF90ZXN0LmMgICB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19hcmdzX3Rlc3QuYyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19hcmdzX3Rlc3QuYwpp
bmRleCAxODBiYTUwOThjYTEuLjA3NWExMTgwZWMyNiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYnBmL3Byb2dzL2dldF9mdW5jX2FyZ3NfdGVzdC5jCisrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19hcmdzX3Rlc3QuYwpAQCAtMTY3LDcg
KzE2Nyw3IEBAIGludCBCUEZfUFJPRyh0cF90ZXN0MikKIH0KIAogX191NjQgdGVzdDdfcmVzdWx0
ID0gMDsKLSNpZiBkZWZpbmVkKGJwZl90YXJnZXRfeDg2KSB8fCBkZWZpbmVkKGJwZl90YXJnZXRf
YXJtNjQpCisjaWYgZGVmaW5lZChicGZfdGFyZ2V0X3g4NikgfHwgZGVmaW5lZChicGZfdGFyZ2V0
X2FybTY0KSB8fCBkZWZpbmVkKGJwZl90YXJnZXRfcmlzY3YpCiBTRUMoImZzZXNzaW9uL2JwZl9m
ZW50cnlfdGVzdDEiKQogaW50IEJQRl9QUk9HKHRlc3Q3KQogewpkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL2dldF9mdW5jX2lwX3Rlc3QuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9nZXRfZnVuY19pcF90ZXN0LmMKaW5kZXggNDNmZjgz
NmE4ZWQ4Li40NWVhYTU0ZDFhYzcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9wcm9ncy9nZXRfZnVuY19pcF90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYnBmL3Byb2dzL2dldF9mdW5jX2lwX3Rlc3QuYwpAQCAtMTA2LDcgKzEwNiw3IEBAIGludCBC
UEZfVVJFVFBST0JFKHRlc3Q4LCBpbnQgcmV0KQogCiBfX3U2NCB0ZXN0OV9lbnRyeV9yZXN1bHQg
PSAwOwogX191NjQgdGVzdDlfZXhpdF9yZXN1bHQgPSAwOwotI2lmIGRlZmluZWQoYnBmX3Rhcmdl
dF94ODYpIHx8IGRlZmluZWQoYnBmX3RhcmdldF9hcm02NCkKKyNpZiBkZWZpbmVkKGJwZl90YXJn
ZXRfeDg2KSB8fCBkZWZpbmVkKGJwZl90YXJnZXRfYXJtNjQpIHx8IGRlZmluZWQoYnBmX3Rhcmdl
dF9yaXNjdikKIFNFQygiZnNlc3Npb24vYnBmX2ZlbnRyeV90ZXN0MSIpCiBpbnQgQlBGX1BST0co
dGVzdDksIGludCBhKQogewotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
