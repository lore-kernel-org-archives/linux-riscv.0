Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32063D1AD2A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9HEZbPmlAAMFWBoUa5Fo/++KVBRaJ559ouVPBRSCGfc=; b=ed+GfAkostzFGH
	fIEqQ9L5L+cPdDhHWCaNdgF/W1k4Z2Pb+E6tY1254fyo5BT4ip+FVZfBGP9QP/rs7Y0+K3faW37JT
	fmCtschvT0WQ3bYkdAcBPzUyMY1YO5KLzHX2qcaTi/hYvXztANOx7aN33pzYAXTBizAAOHbjImu8c
	/rTqHAkF7v9kHYTFT10wbjljPe0n0T4Q02s/tr33WHqTnSPHIgqXVyKc+v9Ephq/IWzK1DymG+LJZ
	dQakzE8X0gN3n1tbAfdxsLvkHDvBJwI9iHEHjHsgH/qUSOawHvl17hm34PaRipKgHJjv9YuWWKSJI
	FM6xZrhPml0A2WsMbb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zex-0000000B5LY-0QxL;
	Wed, 16 Oct 2024 08:45:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zWB-0000000B3TH-1CWY
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 08:36:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso4310643f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729067788; x=1729672588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeYqk9ynM30um50YdbGX0Cpn4ob9BfFrAFXR3B+7qOk=;
        b=n37PE8CZ0xKqZcOTDTjbh+NtVT5kUsvodPuW12S2GecQpaG4Om2E71q43uucbT1Boq
         pRBMpTvqVwwlkTINUMOsh9et2CVHIxvADqfTYfiNl7+nNi2E0ScneJ8TnxS/gHzCriAf
         xKtIp4JYYo/RlG6FzVAuDPx2W3pS6osntqgIDgpq0/kBPPLFY93DGSpdyV9bp4a4N9mO
         P02bMzRKQtXEtV63IgUuGp3m3u5oOra1slkAu+/21M84CEQMgQSSmocDePK4ZuI6vSyz
         QNNrVs3qFSeTChenw2DBFMT9tcL6Ja40tkaEII3dl7zoUfbDCW5bkUyfksqa/h/IK+nM
         GVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729067788; x=1729672588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeYqk9ynM30um50YdbGX0Cpn4ob9BfFrAFXR3B+7qOk=;
        b=gRkueWArahcE5cJSW3rlNvC11+RUZv0uMU/rYvy/I5izVBFgvp1UfTInipwJCrmiqu
         zZIDOe5N+UR6JNfI3hr37XaIxn4Ene78bLw+5VJKlzoxIx209iQgxU8QbeZDiC3jQ549
         YgJoM3AN3TPmwCKD2qaEcHXOo9JjsRWF7PCE+10a/4amF7VnEdwaldps5C9iIhD6H5v/
         OTPoIvpnPdBrdoRL4vhv6vL9T1RHgdjcqBIZz0sXhh6RRpHESeVbawLlfTZf0H+sykDI
         f0lEVZoZo+PGDJXYJ/ZX9ZFK12VArLCT9nCQJwXpoVcbaoYTurHb1oToFWoEQivu1Vfi
         +9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHSJz4Q+eIZ8i898GxCjm1ZtJFG6vPX+on28VQzjSVBt8kUeZLNiRMhfjhk/vQUsq7QEHzEuMCPU5bMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWgLfHyg7+VI6N3gSwyEBxiICdBKkMVtDNsqWjXfLquZRmUTT0
	wc3on0GbduVoblcEaoeAzt91ytMRH4yEJdqsHH4KVxoiHWIloamj191wYSL6UY0=
X-Google-Smtp-Source: AGHT+IGNVbDoncQNJfiq09HJCM62LLWy45vzoC8aPLyFn5dzlzYXlZQ1XlwBkH1FA6Tc39+cvfCrgQ==
X-Received: by 2002:a5d:6c62:0:b0:37c:cfba:d16b with SMTP id ffacd0b85a97d-37d86d54839mr2073400f8f.44.1729067787698;
        Wed, 16 Oct 2024 01:36:27 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc123e5sm3692081f8f.95.2024.10.16.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 01:36:27 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>,
	Roman Artemev <roman.artemev@syntacore.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/2] Prevent dynamic relocations in vDSO
Date: Wed, 16 Oct 2024 10:36:23 +0200
Message-Id: <20241016083625.136311-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_013631_614887_F4092A5B 
X-CRM114-Status: UNSURE (   8.48  )
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

UGF0Y2ggMiB1c2VzIGEgZ2VuZXJpYyBmdW5jdGlvbiB0byBtYWtlIHN1cmUgdGhlIHZEU08gb2Jq
ZWN0IGRvZXMgbm90CmNvbnRhaW4gYW55IGR5bmFtaWMgcmVsb2NhdGlvbnMuCgpQYXRjaCAxIHJl
bW92ZXMgYSBkeW5hbWljIHJlbG9jYXRpb24gZnJvbSB2RFNPIGluIHJ2MzIgZm91bmQgd2l0aCBw
YXRjaAoyLgoKdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNzA1
MDYwOTAyLjExMzI5NC0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCnYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDMyNjExMzgzMS4yODMwMjUtMS1hbGV4Z2hpdGlA
cml2b3NpbmMuY29tLwoKQ2hhbmdlcyBpbiB2MzoKLSBBZGQgUkIgYW5kIFRCIGZyb20gQmpvcm4g
YW5kIFZsYWRpbWlyIGZyb20gdjEKLSBVc2UgLWZuby1idWlsdGluIGluc3RlYWQgb2YgdGhlIHBy
ZXZpb3VzIG9wdGlvbiB0aGF0IGRvZXMgbm90IGV4aXN0IGluIGxsdm0KICAoUGFsbWVyKQoKQ2hh
bmdlcyBpbiB2MjoKLSBBZGQgcGF0Y2ggMSAoQmrDtnJuKQoKQWxleGFuZHJlIEdoaXRpICgyKToK
ICByaXNjdjogdmRzbzogUHJldmVudCB0aGUgY29tcGlsZXIgZnJvbSBpbnNlcnRpbmcgY2FsbHMg
dG8gbWVtc2V0KCkKICByaXNjdjogQ2hlY2sgdGhhdCB2ZHNvIGRvZXMgbm90IGNvbnRhaW4gYW55
IGR5bmFtaWMgcmVsb2NhdGlvbnMKCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwg
MTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
