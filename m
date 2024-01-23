Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5F1C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 23:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BVNziMucAWfeZeiDXH8HmyDtvPGemK/MrVqL6O6sV7w=; b=gHaasAh0md7CJd
	ys3ATaIk/p4WqQPd3AEd70uNz0w1KPttOXBH6/xpxeFGRch/+IUcrlVGk81QvZN2w7WdYMRdGj6HO
	A63h4lWQQ5JqtVqLKYNbnNqbIrkFdI0sf9cKNO6dYfNrKD1STNTdu+CC8ZfLzrLNbebEMpEBMWfSE
	geos2dXPLylYSUpPvDmHk+CuZkycWNKNHIWIr7LgRErzvWxe2NM42cwwYydUQ5kiW14/ipVxbI0RI
	3NkyKr5VPwash+JcwDSBHNbXlS1mf4OLTMnZ+E2soC/OovGu34mnbD/PyJLwQstAv01aCHE1xP3S0
	puy8Np8+aS7k08B0p3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSQEo-000pdE-21;
	Tue, 23 Jan 2024 23:31:26 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSQEl-000paJ-1c
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 23:31:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-290617c6200so1839142a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 15:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706052681; x=1706657481; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPLpv78BJLsbcTo4oE701G/w7O+DnzJaribhl89oWJk=;
        b=mMhkorYiW+frTo7EN2ntNirzkfnX6WIynYQv5XQQAQHfetEBlTYbTmqoFH7+kiaZJc
         KHvFbXxxUFEZ2vsRn9svS/8ZFzpX6HBOqBemqXaX74pv0ofG/FOuoMxAVjG0Revi79KC
         u/yC+1FDvS3oUSxRG9L//4xt2VB/qNwXJeeoqCON21WrJAt/Dm1RKh+JnwJsJqcTshqL
         4XowDfTXTRGjW6ApFaliDbkefDvQLL6ISsV6ZU4VY8pyMcufYBl//5YxaN5j2A23UX7V
         TYXeNaqvWgnAHUcnrG7ims3xP1Y67wZj99A/fS2PUWJXR13LZl9Ns7rHd42f/Yoj86A8
         wkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706052681; x=1706657481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPLpv78BJLsbcTo4oE701G/w7O+DnzJaribhl89oWJk=;
        b=Tua9AgS4zurCUWqHGAO2wWPs0gQpZBxLGiiEUQvY6TwgYwuhnHsp/JrImIssf1Eeok
         wypmEAqqN4N3NPnQ7SQ7V/z0Q1Do4tnsQl+6V9sXzQ5uqjw1hzjkeI6+EfzdOq8RGKg3
         Gfo8SIkdOSw/M9abJfZh5DIpRo40pRTIkr0zY318qj89FvegUqNZW7H8yzz49jA1RGRn
         tkyZdiff7NoOjtY0l+w8LWp6/2cK5jrKWlQ7X0DQE6rKuZeFfhFNR3A9OiHBFGjIyBM0
         hlv8zWwjnvlbcNMQR/8RWtIIeM34AhPLAo46p4t/6hLhXjLSTt0zygbhAw6YzJL8ReJo
         G00g==
X-Gm-Message-State: AOJu0Yyys09BxitTKLTzwpWmQhWJT1Tz10qjrdw7yIpfouFVHSn+x0E+
	/S9p01/ZcM0uKVgykkHsusTbwTDGCRUL26ruFyUJ2KCol98c1ncfvV6W5M9jreE=
X-Google-Smtp-Source: AGHT+IHHSMC8/iZEuQB8Qml5Ex7QP0EZ31R59Xy2rbYb82NH/5U+IKioHdrHvmukE6W6REgdnH4DPg==
X-Received: by 2002:a17:90a:98c:b0:28e:848c:74cd with SMTP id 12-20020a17090a098c00b0028e848c74cdmr3073763pjo.49.1706052681639;
        Tue, 23 Jan 2024 15:31:21 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id eu15-20020a17090af94f00b0028d19ddb1afsm12150698pjb.33.2024.01.23.15.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 15:31:21 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v9 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Tue, 23 Jan 2024 15:29:50 -0800
Message-Id: <20240123-fencei-v9-0-71411bfe8d71@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO5LsGUC/23Qy07DMBAF0F+pvCZoZvwMK/4DsfCTekFSJcgCV
 fl3nIq6EfLyWj7XnrmyNS45ruzldGVLLHnN81TD+HRi/mynjzjkUDMjII6Iekhx8jEPaUwKgjY
 iWWD18mWJKX/fit7eaz7n9Wtefm69BffTvwqie0XBAQYXPRhE7wjpdcllXvPkn/38yfaWQgfJo
 UmqkrxTxK1Dh6kj+UMS8ib5/qaWKA1xE53uSHGXAhDawEVUGYRPlNwIMvCOlEdpmpRVWotRYtB
 E1PutOsqxSVUlCERVrRDSd6Q+SHzsVlepTQKFImJw0JHmKFWTpkrBrahbEwkI/8lt234BbhBl9
 TUCAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706052680; l=2561;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lV3HEfTHxEddjMBrOCEy8vgSa2t7hMJLTJM/Li7jryY=;
 b=eE/8vUQ4mnp83HBoM+DinjzgmoC2nyziyWltlbuhSI/ppEpbLIXS/l47joIaKNXOamXEJDW85
 DNF3bcPoiEFDCK1T8jgp+pP0rYj7Ill0HnKJ0yugVksJ69ECv4DtfyJ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_153123_726400_6299D6A1 
X-CRM114-Status: UNSURE (   9.53  )
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

SW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgaWNhY2hlIGZsdXNoaW5nIGJ5IGNyZWF0aW5nIGEg
bmV3IHByY3RsIGZsYWcKUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFguIFRoZSBpbnRlcmZh
Y2UgaXMgbGVmdCBnZW5lcmljIHRvIGFsbG93CmZvciBmdXR1cmUgZXhwYW5zaW9ucyBzdWNoIGFz
IHdpdGggdGhlIHByb3Bvc2VkIEogZXh0ZW5zaW9uIFsxXS4KCkRvY3VtZW50YXRpb24gaXMgYWxz
byBwcm92aWRlZCB0byBleHBsYWluIHRoZSB1c2UgY2FzZS4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3Ytai1leHRlbnNpb24KClNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lu
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2VzIGluIHY5OgotIFJlbW92ZSBwcmV2
X2NwdSBmcm9tIG1tIChBbGV4KQotIExpbmsgdG8gdjg6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNDAxMTYtZmVuY2VpLXY4LTAtNDNhNDIxMzRmMDIxQHJpdm9zaW5jLmNvbQoKQ2hhbmdl
cyBpbiB2ODoKLSBPbmx5IGZsdXNoIGljYWNoZSBpZiBtaWdyYXRlZCB0byBkaWZmZXJlbnQgY3B1
IChBbGV4KQotIE1vdmUgZmx1c2hpbmcgdG8gc3dpdGNoX3RvIHRvIGNhdGNoIHBlci10aHJlYWQg
Zmx1c2hpbmcgcHJvcGVybHkKLSBMaW5rIHRvIHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjQwMTEyLWZlbmNlaS12Ny0wLTc4ZjA2MTRlMWRiMEByaXZvc2luYy5jb20KCkNoYW5nZXMg
aW4gdjc6Ci0gQ2hhbmdlICJwZXJfdGhyZWFkIiBwYXJhbWV0ZXIgdG8gInNjb3BlIiBhbmQgcHJv
dmlkZSBjb25zdGFudHMgZm9yIHRoZQogIHBhcmFtZXRlci4KLSBMaW5rIHRvIHY2OiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTA5LWZlbmNlaS12Ni0wLTA0MTE2ZTUxNDQ1Y0ByaXZv
c2luYy5jb20KCkNoYW5nZXMgaW4gdjY6Ci0gRml4dXAgZG9jdW1lbnRhdGlvbiBmb3JtYXR0aW5n
Ci0gTGluayB0byB2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDEwOC1mZW5jZWkt
djUtMC1hYTFlNTFkNzIyMmZAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY1OgotIE1pbm9yIGRv
Y3VtZW50YXRpb24gY2hhbmdlcyAoUmFuZHkpCi0gTGluayB0byB2NDogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MDEwNy1mZW5jZWktdjQtMC1kNGNmMmZiOTA1ZDNAcml2b3NpbmMuY29t
CgpDaGFuZ2VzIGluIHY0OgotIEFkZCBPRkYgZmxhZyB0byBkaXNhbGxvdyBmZW5jZS5pIGluIHVz
ZXJzcGFjZSAoQXRpc2gpCi0gRml4IGRvY3VtZW50YXRpb24gaXNzdWVzIChBdGlzaCkKLSBMaW5r
IHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMjEzLWZlbmNlaS12My0wLWI3
NTE1ODIzOGViN0ByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gQ2hlY2sgaWYgdmFsdWUg
Zm9yY2VfaWNhY2hlX2ZsdXNoIHNldCBvbiB0aHJlYWQsIHJhdGhlciB0aGFuIGluIG1tCiAgdHdp
Y2UgKENsw6ltZW50KQotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
MzExMzAtZmVuY2VpLXYyLTAtMmNiNjIzYWIxYjFmQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2
MjoKLSBGaXgga2VybmVsLWRvYyBjb21tZW50IChDb25vcikKLSBMaW5rIHRvIHYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMTIyLWZlbmNlaS12MS0wLWJlYzA4MTFjYjIxMkByaXZv
c2luYy5jb20KCi0tLQpDaGFybGllIEplbmtpbnMgKDIpOgogICAgICByaXNjdjogSW5jbHVkZSBy
aXNjdl9zZXRfaWNhY2hlX2ZsdXNoX2N0eCBwcmN0bAogICAgICBkb2N1bWVudGF0aW9uOiBEb2N1
bWVudCBQUl9SSVNDVl9TRVRfSUNBQ0hFX0ZMVVNIX0NUWCBwcmN0bAoKIERvY3VtZW50YXRpb24v
YXJjaC9yaXNjdi9jbW9keC5yc3QgfCA5NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2luZGV4LnJzdCB8ICAxICsKIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vbW11LmggICAgICAgfCAgMiArCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3Byb2Nlc3Nvci5oIHwgIDcgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90
by5oIHwgMTMgKysrKysrCiBhcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYyAgICAgICAgIHwgNjcg
KysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jICAgICAg
ICAgICAgfCAxNCArKysrLS0KIGluY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oICAgICAgICAgfCAg
NiArKysKIGtlcm5lbC9zeXMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysKIDkgZmls
ZXMgY2hhbmdlZCwgMjA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNv
bW1pdDogYjg1ZWE5NWQwODY0NzFhZmI0YWQwNjIwMTJhNGQ3M2NkMzI4ZmE4NgpjaGFuZ2UtaWQ6
IDIwMjMxMTE3LWZlbmNlaS1mOWY2MGQ3ODRmYTAKLS0gCi0gQ2hhcmxpZQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
