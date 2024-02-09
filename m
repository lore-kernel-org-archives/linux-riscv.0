Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FFAC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 06:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHW+yK+4GTWgeaZx/F6fKeaLn8shYT4INwo8varqCvk=; b=LitmERCzfQ9Zv/
	d/Bkz6j8inOh0p0D5ttI+ownrrRTDO/8b5uAv7W6MVYXIm3hMleo4CTRY6FLr+qVqzIhGTVLFBbX9
	779SFMGGgrioex4iwbb7frll78XCGHDjdtRDVEMnfAkG3QJ2cgSF9qDXvfzYxRpTtry7nOJISGYgg
	sbsGrXTC2WqBgjUuodbJeBOeXYZyfI+Q2fXvbPno1hJX0NcrVd7DaXnLgX9ay3msbvotCdvcZYU6u
	daIY15VbsWV72z8wO8An4yUOWJy44fca8IBUHnd5lXBQz34D83mwJyuoOEVYGh06Vznf/Vc/eT+A/
	dP8J5nVcWBAgQHNCsAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZK-0000000GFjc-48yW;
	Fri, 09 Feb 2024 06:41:02 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZI-0000000GFhK-27mm
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 06:41:01 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5114cd44f6aso792870e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 22:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1707460857; x=1708065657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNljdwCtgXX7yfrlqeBRJqsYJccdvVcfZVPFTIAjXvY=;
        b=ce1bRbH/DZZmgRiWrtaZHZ/I39JTd0I9AutxKTU2WYsVBar9kNFHuXZ7i7FPPvtmEJ
         Tc71Ecyn11JGQKjuFM8t8pibSSlFOwFFmfxOdcS9MR4VX+tLVm3uBw/npONZUzQptP4S
         n86U9G4uJQWzf0jR3M2/PXfRexZGHgmEa51XiasLyBCThzBhHXr0JpNtvaaeyt8BCht8
         rLGccMJqbWVVySm7Gb9OdsVCaNR62AylEs5dKF/FsjMyjvrWPsbDqeDzkoGZjW3fqIr7
         lsob9Fpc8Af7ggr865HrW4+zsx1nXI0D0+mvbcwJ0AeJ8lDBen074/LBUxu3BUPrmD5i
         vj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707460857; x=1708065657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNljdwCtgXX7yfrlqeBRJqsYJccdvVcfZVPFTIAjXvY=;
        b=rLg5Xq0/Xpz6iTcZFBX+z78sm4BFruDWyldKZ7bzZZaKndPLVHy+CWKgL+I0wl5s8G
         belt94PZNEIbW4EaY3gubaYPE8Fm8BOUImx3WIZz+E6dV8AVPBZBfm9a04i2sjR06yPk
         oN94HEqjuvhVvL1vOVUPBb0WXSCsD5BfPAUMpqOxaFQ9VOxTIMS3k7asZzDynfpvbw5F
         arbDWTz7aW7AevrbgqPM6oVWMZM7pQ0OJzyj7CxZSzijS47uORaKdBuAjfdExar7Fsll
         lWK0eb6uSMzg59ea875jsq5dizKMsonZ0qh4HGpqFLE9B6NwM5PyecmI2h8VlhjD8FPg
         DtkA==
X-Gm-Message-State: AOJu0YxMDmw8g8tg0ESnZXxNsVeUoEj3nXyA2YzqJs9y2o2n4/VCC+5h
	sG+Wcu717P78KlLydKCKb/+nA6CBiJ6LyGbLZi2VS8bxhFxgpFomiY09N41YGHzReYLIm/AO+o8
	kiWg=
X-Google-Smtp-Source: AGHT+IEDhflFCI5m8yckBlcrHhcrQQ3ldJE+rE+09x08ZsDb/7emc/oMoKtCCmmPX+z/DuDjiayT1g==
X-Received: by 2002:a05:6512:3e6:b0:511:6f2e:d23f with SMTP id n6-20020a05651203e600b005116f2ed23fmr303429lfq.43.1707460856741;
        Thu, 08 Feb 2024 22:40:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaL+yEba5wm8i34ZSQJNQMvgW6J8dd/cBl9IdEWc4gJ7MotgFZlcF2vvfMBwq4KUmx959cSuSlRe3Qlxhu4KfyqJb2tOoRm5+/3LKr8WMyPrWXCd0f7xaUwI4heMRaEmdtkB03hUfP5VdCbRxXOVGwsR0+FM1Q1eZoT/7ZQi1h75nUQBGOq452eMVDPqEQ8vJwybjkXHa2P2956nsp4ell4ZmZvfFkG8AKEkC5PDV4EWdVxBuTYDqOJNmx1zA9X/5CFXLdE444VW797AcovWMNx1QCzp6cwWLS/G62gqSwdVZ7fcJQ43MAnuGCwwog6JYyd6M9ml084zVece5wtDbgMfpl4Sv8asE365tfO4DEl6+vtRyJF4xLh/1HFvY125EiYDehiYJ38vOgbELtcCFGs1wHqol92ZvncDJ8YfqeD45mSFdS2XDr27wJOT5rd7XW3hSmOGw68GuLvIa3T/ZLkytmvs8fxKFIPSkDmohuOir+dLdnL5vTzPWCnggEtTBV8+3Up3TAwJMviLwjRq8UIczfXtPNcmhJcCpHztwzbuA+uoNBNHblC7eiGpy4q6IiD5jrEguUynT7b6FxUPuJSZP2dHgF7k3mj4f4LPHzEr2SG3i88ssWGkRqdrNHQ1ZI5rCrEBFNLjuxg5HalTNGp3XqhWOgEjQbRp0tTDcJBB+XKMkl+LYW0RvJXS3pvfghirr/1o+ONtKmvg7GmB48p+6rxDPAoGvj1ZFLP/6Akd+iMWgHO2//OKQD3DXKwQbHq347V96eRJyHRponH2izjQ8kzxgOZfAdrZFvAV4u8iMvFhUbNVQzAWmHSpTX+SbxrqrlkuyDYJfZ5RTU9vYpeWj1ZGKimEXlKvhwx0IsnA==
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id vb9-20020a170907d04900b00a370a76d3a0sm441180ejc.123.2024.02.08.22.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:40:56 -0800 (PST)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Brendan Sweeney <turtwig@utexas.edu>,
	Andrew Waterman <andrew@sifive.com>,
	Brendan Sweeney <brs@berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Hans Boehm <hboehm@google.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH v2 1/6] mm: Add dynamic memory consistency model switching
Date: Fri,  9 Feb 2024 07:40:45 +0100
Message-ID: <20240209064050.2746540-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
References: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_224100_575149_0753982A 
X-CRM114-Status: GOOD (  24.05  )
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

U29tZSBhcmNoaXRlY3R1cmVzIGhhdmUgc3VwcG9ydCB0byBjaGFuZ2UgdGhlIG1lbW9yeSBjb25z
aXN0ZW5jeSBtb2RlbAphdCBydW4gdGltZS4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGZpZWxkICdh
Y3RpdmVfbWVtb3J5X2NvbnNpc3RlbmN5X21vZGVsJwp0byB0YXNrX3N0cnVjdCB0aGF0IGFsbG93
cyBhcmNoaXRlY3R1cmUgY29kZSB0byBzdG9yZSB0aGUgYWN0aXZlIG1vZGVsCmFzIGEgcGVyLXBy
b2Nlc3MgcHJvcGVydHkuCgpUbyBhdm9pZCB1c2VsZXNzIG92ZXJoZWFkLCB0aGUgbWVjaGFuaXNt
IG5lZWRzIHRvIGJlIGV4cGxpY2l0bHkKZW5hYmxlZCBpbiB0aGUgYXJjaGl0ZWN0dXJlJ3MgS2Nv
bmZpZy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxs
bmVyQHZydWxsLmV1PgotLS0KIC4uLi9tbS9keW5hbWljLW1lbW9yeS1jb25zaXN0ZW5jeS1tb2Rl
bC5yc3QgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysKIERvY3VtZW50YXRpb24vbW0vaW5kZXgu
cnN0ICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKwogaW5jbHVkZS9saW51eC9zY2hlZC5oICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysKIDQgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vbW0vZHluYW1pYy1tZW1v
cnktY29uc2lzdGVuY3ktbW9kZWwucnN0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9tbS9k
eW5hbWljLW1lbW9yeS1jb25zaXN0ZW5jeS1tb2RlbC5yc3QgYi9Eb2N1bWVudGF0aW9uL21tL2R5
bmFtaWMtbWVtb3J5LWNvbnNpc3RlbmN5LW1vZGVsLnJzdApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwMDAuLjMxMTdjM2Q4MmIyYgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3Vt
ZW50YXRpb24vbW0vZHluYW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0CkBAIC0wLDAg
KzEsNDkgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKKz09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorRHluYW1pYyBtZW1vcnkgY29uc2lz
dGVuY3kgbW9kZWwgc3dpdGNoaW5nCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KKworOkF1dGhvcjogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxu
ZXJAdnJ1bGwuZXU+Cis6RGF0ZTogMSBGZWIgMjAyNAorCitUaGlzIGRvY3VtZW50IGdpdmVzIGFu
IG92ZXJ2aWV3IGFib3V0IGR5bmFtaWMgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsCitzd2l0Y2hp
bmcgZm9yIHVzZXIgbW9kZSBhdCBydW4tdGltZS4KKworTWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVs
cworPT09PT09PT09PT09PT09PT09PT09PT09PQorCitBIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2Rl
bCBpcyBhIHNldCBvZiBndWFyYW50ZWVzIGEgQ1BVIGFyY2hpdGVjdHVyZQorcHJvdmlkZXMgYWJv
dXQgKHJlLSlvcmRlcmluZyBtZW1vcnkgYWNjZXNzZXMuIEVhY2ggYXJjaGl0ZWN0dXJlIGRlZmlu
ZXMKK2l0cyBvd24gbW9kZWwgYW5kIHNldCBvZiBydWxlcyB3aXRoaW4gdGhhdCwgd2hpY2ggYXJl
IGNhcmVmdWxseSBzcGVjaWZpZWQuCitUaGUgcHJvdmlkZWQgZ3VhcmFudGVlcyBoYXZlIGNvbnNl
cXVlbmNlcyBmb3IgdGhlIG1pY3JvYXJjaGl0ZWN0dXJlcyAoZS5nLiwKK3NvbWUgbWVtb3J5IGNv
bnNpc3RlbmN5IG1vZGVscyBhbGxvdyByZW9yZGVyaW5nIHN0b3JlcyBhZnRlciBsb2FkcykgYW5k
Cit0aGUgc29mdHdhcmUgZXhlY3V0ZWQgd2l0aGluIHRoaXMgbW9kZWwgKG1lbW9yeSBjb25zaXN0
ZW5jeSBtb2RlbHMgdGhhdAorYWxsb3cgcmVvcmRlcmluZyBtZW1vcnkgYWNjZXNzZXMgcHJvdmlk
ZSBtZW1vcnkgYmFycmllciBpbnN0cnVjdGlvbnMKK3RvIGVuZm9yY2UgYWRkaXRpb25hbCBndWFy
YW50ZWVzIHdoZW4gbmVlZGVkIGV4cGxpY2l0bHkpLgorCitEZXRhaWxzIGFib3V0IHRoZSBhcmNo
aXRlY3R1cmUtaW5kZXBlbmRlbnQgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsIGFic3RyYWN0aW9u
CitpbiB0aGUgTGludXgga2VybmVsIGFuZCB0aGUgdXNlIG9mIHRoZSBkaWZmZXJlbnQgdHlwZXMg
b2YgbWVtb3J5IGJhcnJpZXJzCitjYW4gYmUgZm91bmQgaGVyZToKKworCURvY3VtZW50YXRpb24v
bWVtb3J5LWJhcnJpZXJzLnR4dAorCitUd28gbW9kZWxzIGNhbiBiZSBpbiBhIHdlYWtlci9zdHJv
bmdlciByZWxhdGlvbi4gSS5lLiwgYSBjb25zaXN0ZW5jeQorbW9kZWwgQSBpcyB3ZWFrZXIvc3Ry
b25nZXIgdGhhbiBhbm90aGVyIG1vZGVsIEIgaWYgQSBwcm92aWRlcyBhIHN1YnNldC9zdXBlcnNl
dAorb2YgdGhlIGNvbnN0cmFpbnRzIHRoYXQgQiBwcm92aWRlcy4KKworU29tZSBhcmNoaXRlY3R1
cmVzIGRlZmluZSBtb3JlIHRoYW4gb25lIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbC4KK09uIHN1
Y2ggYXJjaGl0ZWN0dXJlcywgc3dpdGNoaW5nIHRoZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWwg
YXQgcnVuLXRpbWUKK3RvIGEgc3Ryb25nZXIgb25lIGlzIHBvc3NpYmxlIGJlY2F1c2Ugc29mdHdh
cmUgd3JpdHRlbiBmb3IgdGhlIHdlYWtlciBtb2RlbCBpcworY29tcGF0aWJsZSB3aXRoIHRoZSBj
b25zdHJhaW50cyBvZiB0aGUgc3Ryb25nZXIgbW9kZWwuCisKK0lmIHR3byBtb2RlbHMgYXJlIG5v
dCBpbiBhIHdlYWtlci9zdHJvbmdlciByZWxhdGlvbiwgc3dpdGNoaW5nIGJldHdlZW4KK3RoZW0g
d2lsbCB2aW9sYXRlIHRoZSBjb25zaXN0ZW5jeSBhc3N1bXB0aW9ucyB0aGF0IHRoZSBzb2Z0d2Fy
ZSB3YXMKK3dyaXR0ZW4gdW5kZXIgKGkuZS4sIGNhdXNpbmcgc3VidGxlIGJ1Z3MgdGhhdCBhcmUg
dmVyeSBoYXJkIHRvIGRlYnVnKS4KKworVGhlIGZvbGxvd2luZyByZXN0cmljdGlvbnMgYXBwbHkg
Zm9yIHN3aXRjaGluZyB0aGUgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsCithdCBydW4tdGltZToK
KworKiBPbmx5IHN3aXRjaGluZyBmcm9tIGEgd2Vha2VyIHRvIGEgc3Ryb25nZXIgbW9kZWwgaXMg
c2FmZS4KKyogVGhlIHN0cm9uZ2VyIG1lbW9yeSBtb2RlbCBhZmZlY3RzIGFsbCB0aHJlYWRzIG9m
IGEgcHJvY2Vzcywgd2hlbiBydW5uaW5nIGluIHVzZXIgbW9kZS4KKyogRm9ya2VkIHByb2Nlc3Nl
cyBkZXJpdmUgdGhlaXIgYWN0aXZlIG1lbW9yeSBtb2RlbCBmcm9tIHRoZWlyIHBhcmVudHMuCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL21tL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vbW0v
aW5kZXgucnN0CmluZGV4IDMxZDJhYzMwNjQzOC4uMzZkNDA1MDJiNDIxIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL21tL2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL21tL2luZGV4LnJz
dApAQCAtNDMsNiArNDMsNyBAQCBhYm92ZSBzdHJ1Y3R1cmVkIGRvY3VtZW50YXRpb24sIG9yIGRl
bGV0ZWQgaWYgaXQgaGFzIHNlcnZlZCBpdHMgcHVycG9zZS4KICAgIGFyY2hfcGd0YWJsZV9oZWxw
ZXJzCiAgICBiYWxhbmNlCiAgICBkYW1vbi9pbmRleAorICAgZHluYW1pYy1tZW1vcnktY29uc2lz
dGVuY3ktbW9kZWwKICAgIGZyZWVfcGFnZV9yZXBvcnRpbmcKICAgIGhtbQogICAgaHdwb2lzb24K
ZGlmZiAtLWdpdCBhL2FyY2gvS2NvbmZpZyBiL2FyY2gvS2NvbmZpZwppbmRleCBhNWFmMGVkZDNl
YjguLjg5ZDRlMjdmOWI4MCAxMDA2NDQKLS0tIGEvYXJjaC9LY29uZmlnCisrKyBiL2FyY2gvS2Nv
bmZpZwpAQCAtMTQ3OSw2ICsxNDc5LDIwIEBAIGNvbmZpZyBBUkNIX0hBU19OT05MRUFGX1BNRF9Z
T1VORwogCSAgYWRkcmVzcyB0cmFuc2xhdGlvbnMuIFBhZ2UgdGFibGUgd2Fsa2VycyB0aGF0IGNs
ZWFyIHRoZSBhY2Nlc3NlZCBiaXQKIAkgIG1heSB1c2UgdGhpcyBjYXBhYmlsaXR5IHRvIHJlZHVj
ZSB0aGVpciBzZWFyY2ggc3BhY2UuCiAKK2NvbmZpZyBBUkNIX0hBU19EWU5BTUlDX01FTU9SWV9D
T05TSVNURU5DWV9NT0RFTAorCWJvb2wKKwloZWxwCisJICBBbiBhcmNoIHNob3VsZCBzZWxlY3Qg
dGhpcyBzeW1ib2wgaWYgaXQgc3VwcG9ydHMgc3dpdGNoaW5nCisJICB0aGUgbWVtb3J5IGNvbnNp
c3RlbmN5IG1vZGVsIGF0IHJ1bi10aW1lLgorCitjb25maWcgRFlOQU1JQ19NRU1PUllfQ09OU0lT
VEVOQ1lfTU9ERUwKKwlib29sICJEeW5hbWljIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbCBzdXBw
b3J0IgorCWRlcGVuZHMgb24gQVJDSF9IQVNfRFlOQU1JQ19NRU1PUllfQ09OU0lTVEVOQ1lfTU9E
RUwKKwlkZWZhdWx0IHkKKwloZWxwCisJICBUaGlzIG9wdGlvbiB0dXJucyBvbiB0aGUgc3VwcG9y
dCB0byBzd2l0Y2ggdGhlIG1lbW9yeSBjb25zaXN0ZW5jeQorCSAgbW9kZWwgYXQgcnVudGltZSBv
biBhIHBlci1wcm9jZXNzLWJhc2UuCisKIHNvdXJjZSAia2VybmVsL2djb3YvS2NvbmZpZyIKIAog
c291cmNlICJzY3JpcHRzL2djYy1wbHVnaW5zL0tjb25maWciCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L3NjaGVkLmggYi9pbmNsdWRlL2xpbnV4L3NjaGVkLmgKaW5kZXggZmZlOGY2MThhYjg2
Li41Y2JkM2EzYjgwYWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvc2NoZWQuaAorKysgYi9p
bmNsdWRlL2xpbnV4L3NjaGVkLmgKQEAgLTk3OSw2ICs5NzksMTEgQEAgc3RydWN0IHRhc2tfc3Ry
dWN0IHsKIAkvKiBDYW5hcnkgdmFsdWUgZm9yIHRoZSAtZnN0YWNrLXByb3RlY3RvciBHQ0MgZmVh
dHVyZTogKi8KIAl1bnNpZ25lZCBsb25nCQkJc3RhY2tfY2FuYXJ5OwogI2VuZGlmCisKKyNpZmRl
ZiBDT05GSUdfRFlOQU1JQ19NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUwKKwl1bnNpZ25lZCBsb25n
CQkJbWVtb3J5X2NvbnNpc3RlbmN5X21vZGVsOworI2VuZGlmCisKIAkvKgogCSAqIFBvaW50ZXJz
IHRvIHRoZSAob3JpZ2luYWwpIHBhcmVudCBwcm9jZXNzLCB5b3VuZ2VzdCBjaGlsZCwgeW91bmdl
ciBzaWJsaW5nLAogCSAqIG9sZGVyIHNpYmxpbmcsIHJlc3BlY3RpdmVseS4gIChwLT5mYXRoZXIg
Y2FuIGJlIHJlcGxhY2VkIHdpdGgKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
