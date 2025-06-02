Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAC1C61CE5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrHqRyfse2MCMhTtCOhs6Mq0X4Uezm98/Yvu+WS92kw=; b=tlgghyiaa/Rq9s
	24vdBvMUq/V3rYK0CjeQOk3eCVv72mt/82cO8mLND5GNUG/e5WM50xhO6gKYWJThqZ9EJPNWYOyJj
	chrfst9joS+yJC9M0CVPqAnZ6SPrznMWCIFkzwO1qfWDjnMQcchTKZfLF+DOzypXKQtauoo/ByDmN
	ASiGGf7BUh0U6FA9yV4FqNg2nlS19tXNqctio2pSfAbOVlGL58GmmhwVsV5+AGno52bWuSy3QkOCf
	7k83CriO/jkay0NFc6eQ5zFN2vs1Pm/Wrb/q7qffXp18pEGAi3wTyTR36ko20xWhLh2gEYJKbveiz
	gCrjc3/8SbHgZC8A0Qsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBVy-00000008gz0-2aqI;
	Mon, 02 Jun 2025 20:12:10 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMB5K-00000008ZlA-06zf
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 19:44:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22c33677183so38305355ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748893477; x=1749498277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60pgDrU15Q1dZJENX35Q0Xke0F/FZ5IdLg55ZZD51Ko=;
        b=rNYLiNv8dT8Tvf/9l1SQv1TAHmR+utDvzQueA2QPPAEg5Jw6CqsCNRO/xmqynvpELz
         C3xSCFuIHINg9NB9PuyKk96y3sHhqbez2mRlwSvGPJ7HJQ/ZHmTau38so3mtPq9PxQty
         FoSc8Yb1k1nByV6elWwsz0ugdp4keIrHsrdFOoXszczK1od82psDQ3E5VFbiwI0dL0+V
         JabracJTvXtpQIi2hLQQBk/3sApsRe1+xUZZxXD45s6b70Wp1PAgcCsFTmzPTnZHgBqx
         PU31vaYbJOE3X0BDHKqbCZ5mYjM8OZZAPlDmr5ywU+3p9f5iC3dAlvzkjuU8b4+o5tof
         fXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893477; x=1749498277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60pgDrU15Q1dZJENX35Q0Xke0F/FZ5IdLg55ZZD51Ko=;
        b=mpf1TYgU369ED3+moT3D7bdzND8Px9GR4OWfmM641c6IFqRWnIc5Vu3W+ws3bhqu7H
         8JSKjSX0Y23QBf2APgc+hDaICO+MtT7ntfDKv6dEJ00o1qBpu40tq/hKlhpEWjtf4rJa
         XIqBQpGbV2Ku1qs3KQmjzIo59fnBTeS8GkhpOX6srLe1oAzesJMSsf/YjKoA7TP7g0No
         IpopRIZMw+vRnjY59e8YqV/yrrT5WP8doJd3jQfO4jtOWdjGtzQcwkxCqA97kCnLHVH5
         BPViz/3oUmODk+Pq44OyBFNFmirskOTOxYSW8NhDumBgXvbHF8mdhP3YGSZ1yQeoyEnP
         ByYQ==
X-Gm-Message-State: AOJu0YyC57DSuVnpBa0lk4hnB9SH/AuiCgseBjsEe7KufbB9C9rwKLsi
	xDfYzrRA5wwJxIiuCb5cpTpLZhEQ9eMS8UUvu35TBgQCPKFPbjVp06H6q0nrvxDlBudBAvb7H1B
	mJ8dhsL8=
X-Gm-Gg: ASbGncs+R1q4a+vK171omzD9tYLFG9bBqVXsvlNBMVZn2NwYwzAhgs0LgCO5v8OB0h5
	1M7P+hlN9dTR/AfDQBhGYxz2HSu9ivLH7YQOtkvHjJAIfzvvwY5aLEipyDt8zaw9PHcOGO0e662
	hnp/4xir8G/SV6PdMJRR1LpMIn+idUXluKCRupWMO2E8wLxH3977qoqOqfRaBiYpueRrftmRfPO
	Q9h4MU9OqHxK+Wetf6ISnqkbawaNuefrXKoCIt0UsUjWNn6IEEbFMjKz5GpYeXGUHpNS5d4Tql7
	BkLHQ9E7ycX4UGX7CiM4h3XAcJ2OGzWGDgpBrzsO+NCj7pjW+5gr
X-Google-Smtp-Source: AGHT+IEIHHsZjf4J0ml+6mpE8+yLkKp4H4vo8G9A6uKjKuNPrdkWTI2+f9FxJdyW+FDKO7b9LwW15A==
X-Received: by 2002:a17:903:185:b0:234:986c:66c4 with SMTP id d9443c01a7336-23538ed95c2mr178422005ad.1.1748893476789;
        Mon, 02 Jun 2025 12:44:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm74589615ad.97.2025.06.02.12.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:44:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 2/3] riscv: process: use unsigned int instead of unsigned long for put_user()
Date: Mon,  2 Jun 2025 21:39:15 +0200
Message-ID: <20250602193918.868962-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_124438_058183_8FCB6632 
X-CRM114-Status: GOOD (  11.02  )
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

VGhlIHNwZWNpZmljYXRpb24gb2YgcHJjdGwoKSBmb3IgR0VUX1VOQUxJR05fQ1RMIHN0YXRlcyB0
aGF0IHRoZSB2YWx1ZSBpcwpyZXR1cm5lZCBpbiBhbiB1bnNpZ25lZCBpbnQgKiBhZGRyZXNzIHBh
c3NlZCBhcyBhbiB1bnNpZ25lZCBsb25nLiBDaGFuZ2UKdGhlIHR5cGUgdG8gbWF0Y2ggdGhhdCBh
bmQgYXZvaWQgYW4gdW5hbGlnbmVkIGFjY2VzcyBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3Byb2Nlc3MuYwppbmRleCAxNWQ4Zjc1OTAyZjguLjllZTZkODE2Yjk4YiAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Nlc3MuYwpAQCAtNTcsNyArNTcsNyBAQCBpbnQgZ2V0X3VuYWxpZ25fY3RsKHN0
cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCB1bnNpZ25lZCBsb25nIGFkcikKIAlpZiAoIXVuYWxpZ25l
ZF9jdGxfYXZhaWxhYmxlKCkpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JcmV0dXJuIHB1dF91c2Vy
KHRzay0+dGhyZWFkLmFsaWduX2N0bCwgKHVuc2lnbmVkIGxvbmcgX191c2VyICopYWRyKTsKKwly
ZXR1cm4gcHV0X3VzZXIodHNrLT50aHJlYWQuYWxpZ25fY3RsLCAodW5zaWduZWQgaW50IF9fdXNl
ciAqKWFkcik7CiB9CiAKIHZvaWQgX19zaG93X3JlZ3Moc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCi0t
IAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
