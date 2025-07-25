Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5F8C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 11:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0XCZ4srQ3XiXE0ym5rKUv6MKDzo2744o7c10s+xaBg=; b=XKY+D4rrNflf2A
	BtUT45lKTHyvVr4Mo2QA6rXfFwdCTKGWaPDupMqCaY1fUWpZJ8uKDBeADUTkFBeKEpAG2Ez2aGq+4
	PmgJ9iw+DYejGIP4/VobFwZckBHWRuAI0qQS8zEijbpjYOGAGks33DVHEW54xLAtPX70KRjI2vGZw
	Vy/Niag0ctH9PWMwXmKVxVWzZONpyDecClL2IiXbpjDGTj0kEx2m6ZiTT5aQWAi/LoABzIYMHsf2a
	aI0Bd4gFqhmAJla6Ep8uUgYdHhBIqy4iXI46VAq6SNIAGYgIHQtYBw4ereEPWqXK3oovz60urqVc8
	Pv+0H9lJenr464vrvw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGM2-00000009gah-1IPV;
	Fri, 25 Jul 2025 11:12:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFVT-00000009ZK0-0e70
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 10:18:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so114519f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753438705; x=1754043505; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYZ9wBxVry26yCtTrzlfpW7Eh8IcQ/VBZk5LVzMoGIg=;
        b=k1gw/5z4TzsWvIW4BLtgOBXM9eQ+mY+0xmX0Nih61UtVKDwE/+ARrlk17jREwdqP+G
         aacv2cmaNlnC4yRNwfrzEGLFf+d0zoOCsyfi3whZgPYzfM1tck3dLjX9NjEtbFXGLpDs
         BAAJHyiyDfyJAimJUdwYfi4NSJGG22nYQbtFL9aGpsODFLVid8FC9j5IvLRGmDgAVVJl
         yNNEc++lPfWvvmi21ieGizFf7dHgD2EL5RcxQ22hFPRFto+GtyVrAWNpTvjS6GjtGqgl
         6dfPKpQ7Asrxo8wSehwzTS0pZxhmcMespZ7ZWUi7nr7F6EtRMXnAewMwBFMu0QqF6gBq
         /rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438705; x=1754043505;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYZ9wBxVry26yCtTrzlfpW7Eh8IcQ/VBZk5LVzMoGIg=;
        b=sVKvhhy53qg8ixsfiSe4QsM9E6jIEAtvM+VDOOq9i0c/IsupB7qDVt+RuS0AsuGKVu
         8JbzYpKfmmciVfeiSFyhogD9/LeYbBn0vDUDiLz6VLC5VTUh0ErZgPpv+usPRZAq1vLb
         BTnAtBjNVD1MUloZGdAQ4VPnahuP0DQU0RnJopZZnKGsihIdRMD0Ev0+lAYVABzsadtT
         /nvtp/6ZDs9Zq48xOL1JOLUVstrNZTglEuFIHn1yKispLibtTE7Tdq4dcwmMSQ+vq01J
         I9mpD2Hu57cqFkNuj+kgbIUASD1M5vOdCfk4+Tg5YYP6OJgqP3R2JvftwKN9R3QjNkO3
         Ee4Q==
X-Forwarded-Encrypted: i=1; AJvYcCURL1/ibOUPToXOzD+EHx/b6Q/BgFxSNLUTKpes9zjC2+Z1CbopwRHqhGOW0DVHHEmupf8AupVR7Plkng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxht3SrFqLv3m1KYjNh+wXar9D3Vdned3ZMH4nSYVioy9pcGg2
	NbxmD/ZoInp8WDDo79c2Gg+F4Fqb6ti00gUzHTZTI+LRiAysXFcfRME5+/BXELFB6Ig=
X-Gm-Gg: ASbGnctMIp/TFscD90gCeMAWO75uYAyDDAp9yKm9fpUTwp84OIF7J+jrfcl5UDWL+SS
	rpxxVLk5KltBe5clzUKmbCsPrP/0uy+i4QHa7pwHXS4BOVcENchG6/+rG5QPkfW+kSvCxKXFVkA
	nWc9NJPr4QX8RcOk8SO9vVhIvbt+RVm0dgkTyjzg9+LQ32gD09SLR4ZWaXNLj5kBkBj9OcCD4T3
	DB9P4YNU+J8yYgfymnqsejwuq3Y1HHaWRAIVQogC2Eefz5MCuVHzzDR90YKMeatsenddldRKp0y
	UXl38PKh/YAur8i7C3rIdwyoeAaBeNxbhyuN0zzAgAtrb8ZIK51LYcOdFA2DbhWtVntljzT5Tdo
	xyj2bsJz7RYbSfLN7LnZrFQNf5jD2nw==
X-Google-Smtp-Source: AGHT+IGn5WRAMtlU5cklPYxIOVfVV5fz2fA+h+TjIZKCuxFwKLN9BLlRRKIt3jUZj5c42/6P+CdRHg==
X-Received: by 2002:a05:6000:430c:b0:3a4:f912:86af with SMTP id ffacd0b85a97d-3b7766d2f23mr452692f8f.2.1753438704893;
        Fri, 25 Jul 2025 03:18:24 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8c15:2281:5347:b367])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b76fc7724esm4655765f8f.32.2025.07.25.03.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:18:24 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 25 Jul 2025 12:18:23 +0200
Message-Id: <DBL2588APTCA.2XUKQCJ0DW89C@ventanamicro.com>
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Vivian Wang" <wangruikang@iscas.ac.cn>, "Drew Fustini"
 <fustini@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, "Alexandre Ghiti"
 <alex@ghiti.fr>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Samuel
 Holland" <samuel.holland@sifive.com>, "Drew Fustini"
 <dfustini@tenstorrent.com>, "Andy Chiu" <andybnac@gmail.com>, "Conor
 Dooley" <conor.dooley@microchip.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
References: <20250719033912.1313955-1-fustini@kernel.org>
 <cc82c938-def3-4df6-9fc9-fc321af7d54a@iscas.ac.cn>
In-Reply-To: <cc82c938-def3-4df6-9fc9-fc321af7d54a@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_031827_193930_3C179D11 
X-CRM114-Status: GOOD (  11.52  )
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

MjAyNS0wNy0yNFQwNTo1NTo1NCswODowMCwgVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2Fz
LmFjLmNuPjoKPiBPbiA3LzE5LzI1IDExOjM5LCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4+IEZyb206
IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAdGVuc3RvcnJlbnQuY29tPgo+PiBDbG9iYmVyaW5nIHRo
ZSB2ZWN0b3IgcmVnaXN0ZXJzIGNhbiBzaWduaWZpY2FudGx5IGluY3JlYXNlIHN5c3RlbSBjYWxs
Cj4+IGxhdGVuY3kgZm9yIHNvbWUgaW1wbGVtZW50YXRpb25zLiBUbyBtaXRpZ2F0ZSB0aGlzIHBl
cmZvcm1hbmNlIGltcGFjdCwgYQo+PiBwb2xpY3kgbWVjaGFuaXNtIGlzIHByb3ZpZGVkIHRvIGFk
bWluaXN0cmF0b3JzLCBkaXN0cm8gbWFpbnRhaW5lcnMsIGFuZAo+PiBkZXZlbG9wZXJzIHRvIGNv
bnRyb2wgdmVjdG9yIHN0YXRlIGRpc2NhcmQgaW4gdGhlIGZvcm0gb2YgYSBzeXNjdGwga25vYjoK
Pgo+IFNvIEkgaGFkIGFuIGlkZWE6IElzIGl0IHBvc3NpYmxlIHRvIGF2b2lkIHJlcGVhdGVkbHkg
ZGlzY2FyZGluZyB0aGUKPiBzdGF0ZSBvbiBldmVyeSBzeXNjYWxsIGJ5IHNldHRpbmcgVlMgdG8g
SW5pdGlhbCBhZnRlciBkaXNjYXJkaW5nLCBhbmQKPiBhdm9pZGluZyBkaXNjYXJkaW5nIHdoZW4g
VlMgaXMgSW5pdGlhbD8gU286Cj4KPiBpZiAoVlMgPT0gQ2xlYW4gfHwgVlMgPT0gRGlydHkpIHsK
PiDCoCDCoCBjbG9iYmVyOwo+IMKgIMKgIFZTID0gSW5pdGlhbDsKPiB9Cj4KPiBUaGlzIHdvdWxk
IGF2b2lkIHRoaXMgcHJvYmxlbSB3aXRoIHN5c2NhbGwtaGVhdnkgdXNlciBwcm9ncmFtcyB3aGls
ZQo+IGFkZGluZyBtaW5pbXVtIG92ZXJoZWFkIGZvciBldmVyeXRoaW5nIGVsc2UuCgpJIHRoaW5r
IHlvdXIgcHJvcG9zYWwgaW1wcm92ZXMgdGhlIGV4aXN0aW5nIGNvZGUsIGJ1dCBpZiBhIHVzZXJz
cGFjZSBpcwp1c2luZyB2ZWN0b3JzLCBpdCdzIGxpa2VseSBhbHNvIHJlc3RvcmluZyB0aGVtIGFm
dGVyIGEgc3lzY2FsbCwgc28gdGhlCnN0YXRlIHdvdWxkIGltbWVkaWF0ZWx5IGdldCBkaXJ0eSwg
YW5kIHRoZSBuZXh0IHN5c2NhbGwgd291bGQgYWdhaW4KbmVlZGxlc3NseSBjbG9iYmVyIHZlY3Rv
ciByZWdpc3RlcnMuCgpQcmVzZXJ2aW5nIHRoZSB2ZWN0b3Igc3RhdGUgc3RpbGwgc2VlbXMgYmV0
dGVyIGZvciB1c2Vyc3BhY2VzIHRoYXQgdXNlCmJvdGggdmVjdG9ycyBhbmQgc3lzY2FsbHMuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
