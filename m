Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498C9606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URD8HG/p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcXc/cd6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z8KI9ZuinXwbrp+wIWYpd4b761Io3kFzM0Rk1teGyf8=; b=URD8HG/pFqhkGoQvuXcuzzGL7w
	vQ2VQc9j0yyRF5Sm4dlbubCnlDWLm2uabVnPgATOv/qOnp9wF258btHhf3ie09j+kezEEEDuRWKrQ
	P+MqQCCR13dQ3H4em4kRiXywJB1eJw7jAHFsDdOJGPr718cs1bf/ZwVlowiUew7/1voV+Mdl5VT/a
	oZiK/8YkKvfAEr3xwkcdKeY8Es8/d1+JYMSlrjJMjWP0KQKGE8aXD3jVw7niXbZ3Q3rF/NT99gfvB
	U1aNXUoDQUwrG8VpTl0Te6k2DPGI0hgUVe1hQ1Esgzzl/FSKv8Uy9G2j/cJSHVZqeU0ytCv+FPYGS
	EWHKauKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5D-00000001cFW-2RNe;
	Sun, 22 Nov 2026 19:18:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD58-00000001cF7-35ux
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 19:18:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4b467581b98so23417355e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 11:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375112; x=1795979912; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDGrHZ64R98bB1s+kS6i0+RRrZ5nwW+M1pWL62MVuNM=;
        b=LcXc/cd6dY5nGHEJkXAyNTw81xExDFFk4o62KMxbFmBamoQndzjPKW+etKVWQpTkRK
         AlEXnIXxqnQ+0A08klSssk8FhiKmYXm8ou2RdS8FYCftbEjDWBhLlEvskl3DIS0MMP2l
         AioQ6nKp7GfwX1tQEsfII2rBR1JYiH1rEhvtZID8DnosB3PUIB5ubMNBSEoZG5zwt5gR
         6YO2lvK/a6O8m9UW4/+zWGmP4wLIe8rFSjPTcewQQw7oZgNKLZUSt2Uaf++ZR7Jxfaan
         Z6pKwnFU1M+pHyqdPf55gKrqiko4S1rjcYo+9GqqT0EMpwrbqrjz+hoKd3zrrE8rxxxx
         rowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375112; x=1795979912;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EDGrHZ64R98bB1s+kS6i0+RRrZ5nwW+M1pWL62MVuNM=;
        b=wm4miA5OJjn4vneYqoC6jI/cGM+dAvBlA6LJmDYGVrThkXMcgAMsf6ylnYBeEf2Z6N
         +LcRbVWGjm8EG9AomsoQlq5DhRoAkxNXXAz4ACl1/6OTttor1NV0WcYqr/9ZpQ8u77dY
         6SFeLxmglO4MBLh/4dJ82rNwTa9H8fFY0G/sshnUfM6RAszKgo6v9ZOeml6fDHUyadlV
         I8ana+tPJppapIXm4JWxY/nR0tRsfczLzVn5T1B4P2aq5e+UtbN7YGFPDrybWww4u7QW
         eiu3rhcKftDlhsd5Kn/lhGmiSGMKVS6IfP/0B6ZreR+OKxmCfwZHnTFkzpJBQdnaYeb3
         /K3g==
X-Forwarded-Encrypted: i=1; AL+hErH6Dh+yUt+9PVryy81cipWv5Vbtb8ikFTG+vTR652mqaUD9ME2fOlk87KKoer81DlMf+B99KnpafEyf5w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Fq/Y5EfNsiz0DSnXCTM44zR92+zrpZt+DP+ucR2W8R8Sss3So
	IWLoN/v1kGaCHUPsmfpCbHYprABQSKCJ7yK6T05h+A/X0RrnfadWzk5v
X-Gm-Gg: AZFdTZfdsXHliOW8pUmXX83dYHy4zoji6imrNS9nqlJjS7DqZ096kw3KdIF+TWaXdVo
	6xTYe4vujrdeXa7by52U3L5WJxf0i1tktdjJ7SZ4F97gaXjLl0NlyteHMXqSAZcPdfOW5agR5vi
	/esVmm7zfwcZEV1sjlHkeKCgEPJwHTVtqU9HhQb6JnmTkDUyvpf1zWGdIKslZlgdGBidZnh1qj1
	KcEed6hn1q0IBzlaaf8+z8o1ruH4CG5cMFIbRB9NEeaGmZdvZaBWooArsWOT7ilYf2KDcSsg06P
	HwZjvs7ZvDprQEgZ6vrEoti8oDclg9IQMp/mw+rc8lXOP4Fnx7Fi9nkuFxFsxFtK3jyLw98bUDn
	wHuha7pGhctlbVM1WNpsgVZ25ndwXVAvXxM4gWR68g7Ys4d9tXmTaET8S0rCI+KR8ZI/pE0djcC
	q3j3RFslqVJkmqmPknwI8W2W+uiQCkUHxdMkRCaS3inVIzjXbHOKpLNOb6um6JdZzzwb6K7UrNe
	7ejJI9oD9TbD8rLQ5mNRSGBIYRBMV8WL/SWWZPXuZ9qrbb/WQyvv8Xu3ygJU+JoN+lxzyE5BLFV
	bcAq2OBWEe/QptJSqJT4pMeblSOtYQmjQawm+2Voconi
X-Received: by 2002:a05:600c:1d0a:b0:4bb:840c:72f2 with SMTP id 5b1f17b1804b1-4bb889323a1mr196357555e9.25.1795375112020;
        Sun, 22 Nov 2026 11:18:32 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm100078295e9.4.2026.11.22.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:18:31 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Yifeng Huang <huangyifeng@eswincomputing.com>,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: clk: eswin: eic7700: EIC7702X hangs when disabling unused D2D/PVT gates
Date: Sun, 22 Nov 2026 19:18:30 +0000
Message-ID: <20261122191830.2183513-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_111834_809484_24C91EA4 
X-CRM114-Status: GOOD (  13.27  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiBhIERlZXBDb21wdXRpbmcgRk1MMTNWMDMgYm9hcmQgKEVTV0lOIEVJQzc3MDJYLCBp
LmUuIHR3byBFSUM3NzAwWApkaWVzLCAzMiBHaUIpLCBtYWlubGluZSBoYW5ncyBkdXJpbmcgb3Ig
c2hvcnRseSBhZnRlcgpjbGtfZGlzYWJsZV91bnVzZWQoKSB1bmxlc3MgY2xrX2lnbm9yZV91bnVz
ZWQgaXMgZ2l2ZW4uIE1hcmtpbmcKZ2F0ZV9kMmRfYWNsayAoYW5kLCBhcyBhIHByZWNhdXRpb24s
IGdhdGVfbHNwX3B2dF9wY2xrKSBhcwpDTEtfSVNfQ1JJVElDQUwgaW4gZHJpdmVycy9jbGsvZXN3
aW4vY2xrLWVpYzc3MDAuYyBmaXhlcyBpdCBoZXJlOyBJJ2QKbGlrZSB0byBrbm93IHdoZXRoZXIg
dGhhdCBpcyB0aGUgcmlnaHQgZml4IG9yIHdoZXRoZXIgc29tZXRoaW5nIGVsc2UKc2hvdWxkIGNs
YWltIHRoZXNlIGNsb2Nrcy4KClNldHVwOgotIHY3LjQtcmMzICg0ODQzZjY4NzNmN2MpICsgInJp
c2N2OiBlc3dpbjogZWljNzcwMDogQWRkIHN1cHBvcnQgZm9yCiAgY2xvY2tzLCByZXNldHMsIHBp
bmN0cmwsIEhTUCBidXMsIEkyQyBhbmQgd2F0Y2hkb2ciIHY1CiAgKGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNjEwMTUxMjU0NTQuMTM4MTk0MS0xLXBpbmtlc2gudmFnaGVsYUBlaW5mb2No
aXBzLmNvbSkKICArIGEgbWluaW1hbCBsb2NhbCBib2FyZCBkdHM6IGRpZSAwIG9ubHkgKDQgb2Yg
dGhlIDggaGFydHMsIHVhcnQwLAogIHRoZSBmaXJtd2FyZSByZXNlcnZlZC1tZW1vcnkgcmVnaW9u
cykuCi0gZGVmY29uZmlnICsgUElOQ1RSTF9FSUM3NzAwLCBEV19XQVRDSERPRywgUklTQ1ZfU0JJ
X1YwMS4KLSBPcGVuU0JJIHYxLjMsIFUtQm9vdCAyMDI0LjAxLCBEMkQgZmlybXdhcmUgMS41MSwg
R1JVQiAoRUZJKS4gVW5kZXIKICBFRkkgdGhlIGtlcm5lbCB0YWtlcyBSQU0gZnJvbSB0aGUgRUZJ
IG1lbW9yeSBtYXAsIHNvIGl0IGFsc28gdXNlcyB0aGUKICBzZWNvbmQgZGllJ3MgMTYgR2lCIGFs
dGhvdWdoIHRoZSBkdHMgb25seSBkZXNjcmliZXMgZGllIDAuCi0gUGxhaW4gY29tbWFuZCBsaW5l
OiBlYXJseWNvbj1zYmkgY29uc29sZT10dHlTMCwxMTUyMDBuOCByZGluaXQ9L2luaXQKICAoaW5p
dHJhbWZzIG9ubHkpLiBUbyBmaW5kIHRoZSBjbG9ja3MgSSB1c2VkIGEgbG9jYWwgZGVidWctb25s
eSBvcHRpb24KICB0aGF0IGtlZXBzIG5hbWVkIGNsb2NrcyBvbiBpbiBjbGtfZGlzYWJsZV91bnVz
ZWRfc3VidHJlZSgpIChub3QgbWVhbnQKICBmb3IgbWVyZ2luZyk7IHNvbWUgb2YgdGhvc2UgYm9v
dHMgYWxzbyBoYWQga2VlcF9ib290Y29uIGFuZAogIHRyYWNlX2V2ZW50PWNsazpjbGtfZGlzYWJs
ZSB0cF9wcmludGssIGNhbGxlZCAidHJhY2VkIiBiZWxvdy4KCldoYXQgSSBzZWUgb24gdGhlIHNl
cmlhbCBjb25zb2xlOgoKLSBnYXRlX2QyZF9hY2xrOiBldmVyeSBib290IHRoYXQgZGlzYWJsZWQg
aXQgZmFpbGVkIHRvIHJlYWNoIGluaXQ6IDEKICB0cmFjZWQgYm9vdCB0aGF0IGxlZnQgb25seSB0
aGlzIGdhdGUgb3V0IG9mIGEgbGFyZ2VyIGtlcHQgc2V0LCAzCiAgcGxhaW4gYm9vdHMgdGhhdCBr
ZXB0IG9ubHkgZ2F0ZV9sc3BfcHZ0X3BjbGsgb24gKDIgd2l0aCBhbGwgMzIgR2lCLAogIDEgd2l0
aCBtZW09MTZHKSwgYW5kIHRoZSBzdG9jayBib290cyB3aXRoIG5vdGhpbmcga2VwdCAoMzIgR2lC
IGFuZAogIG1lbT0xNkcpLiBXaXRoIDMyIEdpQiB0aGUgdHJhY2VkIGJvb3Qgc3RvcHMgcmlnaHQg
YXQKICB0aGlzIGdhdGUuIFdpdGggbWVtPTE2RyAoTGludXggb24gZGllIDAgUkFNIG9ubHkpIHRo
ZSBib290IHN0YWxscwogIGJlZm9yZSBpbml0OyB+MjEgcyBsYXRlciBSQ1UgcmVwb3J0cyBhIHN0
YWxsLCBhbmQgQ1BVIDIgdGhlbiBkb2VzIG5vdAogIHJlc3BvbmQgdG8gdGhlIE5NSSAoIkFmdGVy
IDEwIHNlY29uZHMsIHRoZXNlIENQVVMgc3RpbGwgaGF2ZW4ndAogIHJlc3BvbmRlZCB0byB0aGUg
Tk1JOiAyIikuIEtlZXBpbmcgb25seSB0aGlzIGdhdGUgb24sIHdpdGggZXZlcnkKICBvdGhlciB1
bnVzZWQgZ2F0ZSBkaXNhYmxlZCwgYm9vdHMgdG8gYW4gaW5pdHJhbWZzIHNoZWxsIHdpdGggMzIg
R2lCCiAgKDIgYm9vdHMpIGFuZCB3aXRoIG1lbT0xNkcgKDEgYm9vdCkuCgotIGdhdGVfbHNwX3B2
dF9wY2xrOiBpbnRlcm1pdHRlbnQuIEkgaGF2ZSAxMCBib290cyB0aGF0IGRpc2FibGVkIGl0CiAg
d2hpbGUgZ2F0ZV9kMmRfYWNsayBzdGF5ZWQgb24uIEluIDQgb2YgdGhlIDcgdHJhY2VkIG9uZXMg
KHdoaWNoIG1ha2UKICB0aGUgZGlzYWJsZSBwYXNzIG11Y2ggc2xvd2VyOyA1IG9mIHRoZSA3IHdl
cmUgZWFybGllciBtZW09MTZHIGJvb3RzCiAgd2l0aCBvdGhlciBjbG9ja3Mga2VwdCBvbiBhcyB3
ZWxsKSwgdGhlIEQyRCBmaXJtd2FyZSBwcmludGVkLCB3aXRoaW4KICB0ZW5zIG9mIG1pbGxpc2Vj
b25kcywgdGhlIGZvbGxvd2luZyAoZnJvbSBvbmUgb2YgdGhlbTsgY29sb3VyIGNvZGVzCiAgcmVt
b3ZlZCwgYW5kIHRoZSBmaXJzdCBsaW5lJ3MgIkQyRCBOT1RJIiBwcmVmaXggd2FzIGludGVybGVh
dmVkIHdpdGgKICBrZXJuZWwgb3V0cHV0KToKCiAgICBEMkQgTk9USUNFOiDOlFQgNjAuNjkxwrBD
IChwcmV2IDQ2LjMyOSwgY3VyciAxMDcuMDIwKQogICAgRDJEIEZBSUw6IFQ6MTA3LjAyMCBzdHM6
MDAwMDAwMDcgcng6MDBlNjAwMDEgcngyOjAwZTYwMDAxIFtSWCBFUlIgQUxMfFJYIExPQ0FMIExJ
TktVUHxSWCBSRU1PVEUgTElOS1VQXQoKICBhbmQgTGludXggaHVuZy4gSW4gdGhlIG90aGVyIDMg
dHJhY2VkIGJvb3RzIGFuZCBpbiBhbGwgMyBwbGFpbiBib290cywKICBkaXNhYmxpbmcgaXQgY2F1
c2VkIG5vIHZpc2libGUgcHJvYmxlbS4gSSBkb24ndCBrbm93IHdoeSBpdCBpcwogIGludGVybWl0
dGVudC4gQSBqdW1wIGZyb20gNDYgdG8gMTA3IMKwQyBiZXR3ZWVuIHR3byBmaXJtd2FyZSBzYW1w
bGVzCiAgbG9va3MgbGlrZSBhbiBpbnZhbGlkIHNlbnNvciByZWFkIG9uY2UgdGhpcyBjbG9jayBp
cyBvZmYsIGJ1dCBJCiAgY2FuJ3Qgc2VlIHRoZSBmaXJtd2FyZSBzaWRlLgoKLSBXaXRoIGJvdGgg
Z2F0ZXMgbWFya2VkIENMS19JU19DUklUSUNBTCAoZGlmZiBiZWxvdzsgbm8gb3RoZXIgY2hhbmdl
LAogIG5vIGRlYnVnIG9wdGlvbiwgbm8gY2xrX2lnbm9yZV91bnVzZWQpIGFuZCB0aGUgcGxhaW4g
Y29tbWFuZCBsaW5lLAogIHRoZSBib2FyZCBib290cyB3aXRoIGFsbCAzMiBHaUIsIGFuZCA5MiBw
cmV2aW91c2x5IGVuYWJsZWQgdW51c2VkCiAgZ2F0ZXMgYXJlIGRpc2FibGVkICgxMTMgdW5jbGFp
bWVkIGdhdGVzIHdlcmUgb24gaW4gYSBjbGtfaWdub3JlX3VudXNlZAogIGJvb3Q7IHRoZSAyMSBs
ZWZ0IG9uIGFyZSB0aGUgMTkgZmxhZ2dlZCBDTEtfSUdOT1JFX1VOVVNFRCBwbHVzIHRoZXNlCiAg
dHdvKS4gV3JpdGluZyBhbmQgcmVhZGluZyBiYWNrIDI3IHggMSBHaUIgaW4gdG1wZnMgKHNvIHRo
ZSBzZWNvbmQKICBkaWUncyBSQU0gaXMgaW4gdXNlKSBnaXZlcyBpZGVudGljYWwgY2hlY2tzdW1z
LCBhbmQgcmVib290IC1mIHJldHVybnMKICB0byB0aGUgZmlybXdhcmUuCgotIGdhdGVfcHZ0MF9j
bGsgYW5kIGdhdGVfcHZ0MV9jbGsgd2VyZSBkaXNhYmxlZCBpbiBhbGwgb2YgdGhlIGJvb3RzCiAg
YWJvdmUgdGhhdCBrZXB0IG9ubHkgb25lIG9yIGJvdGggb2YgdGhlIHR3byBnYXRlcywgd2l0aG91
dCBwcmV2ZW50aW5nCiAgYm9vdC4gSSBoYXZlIG5vdCBjaGVja2VkIHdoZXRoZXIgdGhlIFBWVCBz
ZW5zb3JzIHN0aWxsIGdpdmUgbGl2ZQogIHJlYWRpbmdzIHdpdGggdGhlbSBvZmYuCgpOb3QgdGVz
dGVkOiBzaW5nbGUtZGllIEVJQzc3MDBYLCBzdXNwZW5kL3Bvd2Vyb2ZmLCB0aGUgc2Vjb25kIGRp
ZSdzCmhhcnRzLCBhbnl0aGluZyBiZXlvbmQgYW4gaW5pdHJhbWZzIHNoZWxsLgoKUXVlc3Rpb25z
OgoxLiBJcyBDTEtfSVNfQ1JJVElDQUwgcmlnaHQgZm9yIGdhdGVfZDJkX2FjbGsgKGF0IGxlYXN0
IG9uIEVJQzc3MDJYLAogICB3aGVyZSB0aGUgRDJEIGxpbmsgaXMgaW4gdXNlKSwgYW5kIGZvciBn
YXRlX2xzcF9wdnRfcGNsaz8gT3Igc2hvdWxkCiAgIERUIGNvbnN1bWVycyAoYSBEMkQgbm9kZSwg
dGhlIFBWVCBub2RlKSBjbGFpbSB0aGVtIGluc3RlYWQ/CjIuIERvZXMgdGhlIEQyRCBmaXJtd2Fy
ZSByZWFkIHRoZSBQVlQgc2Vuc29yIHRocm91Z2ggZ2F0ZV9sc3BfcHZ0X3BjbGssCiAgIGFuZCBh
cmUgZ2F0ZV9wdnQwX2Nsay9nYXRlX3B2dDFfY2xrIG5lZWRlZCBmb3IgbGl2ZSByZWFkaW5ncz8K
ClRoZSBjaGFuZ2UgSSB0ZXN0ZWQ6CgogIEBAIC04MjgsNSArODI4LDYgQEAgc3RhdGljIHN0cnVj
dCBlc3dpbl9jbGtfaW5mbyBlaWM3NzAwX2Nsa3NbXSA9IHsKICAgCQkJQ0xLX1NFVF9SQVRFX1BB
UkVOVCwgRUlDNzcwMF9SRUdfT0ZGU0VUX0RTUF9DRkcsIDMxLCAwKSwKICAgCUVTV0lOX0dBVEVf
VFlQRShFSUM3NzAwX0NMS19HQVRFX0QyRF9BQ0xLLCAiZ2F0ZV9kMmRfYWNsayIsCiAgLQkJCUVJ
Qzc3MDBfQ0xLX0RJVl9EMkRfQUNMS19EWU5NLCBDTEtfU0VUX1JBVEVfUEFSRU5ULAogICsJCQlF
SUM3NzAwX0NMS19ESVZfRDJEX0FDTEtfRFlOTSwKICArCQkJQ0xLX1NFVF9SQVRFX1BBUkVOVCB8
IENMS19JU19DUklUSUNBTCwKICAgCQkJRUlDNzcwMF9SRUdfT0ZGU0VUX0QyRF9BQ0xLLCAzMSwg
MCksCiAgIAlFU1dJTl9HQVRFX1RZUEUoRUlDNzcwMF9DTEtfR0FURV9EMkRfQ0ZHX0NMSywgImdh
dGVfZDJkX2NmZ19jbGsiLAogIEBAIC0xMTc0LDUgKzExNzUsNiBAQCBzdGF0aWMgc3RydWN0IGVz
d2luX2Nsa19pbmZvIGVpYzc3MDBfY2xrc1tdID0gewogICAJRVNXSU5fR0FURV9UWVBFKEVJQzc3
MDBfQ0xLX0dBVEVfTFNQX1BWVF9QQ0xLLCAiZ2F0ZV9sc3BfcHZ0X3BjbGsiLAogICAJCQlFSUM3
NzAwX0NMS19NVVhfU1lTQ0ZHX0NMS19ST09UXzJNVVgxX0dGUkVFLAogIC0JCQlDTEtfU0VUX1JB
VEVfUEFSRU5ULCBFSUM3NzAwX1JFR19PRkZTRVRfTFNQX0VOMCwgMSwgMCksCiAgKwkJCUNMS19T
RVRfUkFURV9QQVJFTlQgfCBDTEtfSVNfQ1JJVElDQUwsCiAgKwkJCUVJQzc3MDBfUkVHX09GRlNF
VF9MU1BfRU4wLCAxLCAwKSwKICAgCUVTV0lOX0dBVEVfVFlQRShFSUM3NzAwX0NMS19HQVRFX0xT
UF9QVlQwX0NMSywgImdhdGVfcHZ0MF9jbGsiLAogICAJCQlFSUM3NzAwX0NMS19GSVhFRF9GQUNU
T1JfUFZUX0RJVjIwLCBDTEtfU0VUX1JBVEVfUEFSRU5ULAoKSGFwcHkgdG8gc2VuZCBhIHByb3Bl
ciBwYXRjaCBvbmNlIHRoZSBwcmVmZXJyZWQgYXBwcm9hY2ggaXMgY2xlYXI7IEkKY2FuIGFsc28g
c2hhcmUgdGhlIGJvYXJkIGR0cyBhbmQgdGhlIHNlcmlhbCBsb2dzLgoKVGhhbmtzLApNZXJ2eW4g
UHJldG9yaXVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
