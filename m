Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46CEC7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 02:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LndWmk/9AAsvZv9E89udWJuZSZ9AdpfJokLD//KVc+A=; b=vE9qTJs6eU9LZl
	U8IdBgEt2ueKOR2wTnNRYzg5vpF7MA8wpIYMxUIgGxhRiM0oxDN9j9rda+6WYaGrWWG1prBgRHTh+
	n4qPPS83IHbBB5NUXjyX7sYr3+caylOcF4sITAEEueUTiiZXkO+PVh7fhnp0+vebAye2qdsEUVlDi
	d2nz9dnEC7uk/DTQruzk2aW9RlLIWGwckV6aWoYvjfXfgivCy1u5euPk/vL/ze+eATlDzXysGQU7X
	9ebafST2qyBdUkusKddsgej37VS6mbJhuQpb5yPlg3omF6XVcf773xZaShXlY9ljtiVFCxIc6+WTQ
	8wmXtyfnmsfmvQ/HvCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS5AF-0000000BpW8-0m9b;
	Thu, 19 Jun 2025 02:38:07 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS5AC-0000000BpVn-2zHs
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 02:38:05 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-711a3dda147so3562897b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 19:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750300684; x=1750905484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJvyWk8eVLm4Tc980PDphhjuFD7XIh64AkzzgoplEgI=;
        b=H9CvqTL9U+Kor5xbS2mkgKlVAmlSyNPo1ah4U00q2LmqRmXma03GhFQNBr5aQVdy+r
         eNl5qbXtYtbgsuvjVDNisAag2Xehzbkz1tuWIrNoVhFMvlgBtVpykmzB0Y+4jEUdEVzo
         hb12UMjG4mGAJ7xGlIPvOBRnkgMOiN3ANo6e9bNo0jG/TVYfAuUlcpEcS/9yuIfsJ9SH
         s/kx2mWMFqEKZpDSkpr4PoDeu12koMRRb0JmZsisLSVpH9t/zglHBRPnbkpQutQQn9pW
         GIHFGKEVDtJ+hAHdScfbPMaQCxc0ygh4UMD3IRgeiyZKiS8qjQVIKUCwTM13u5mBKn4Y
         /Djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300684; x=1750905484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJvyWk8eVLm4Tc980PDphhjuFD7XIh64AkzzgoplEgI=;
        b=m9N8O/Lpgbf674iz4ACiC1haX8t08k077IT9DjrGHcuik70oJRwcNmt3IrH2JvSknA
         7J9eleDzcDReO8I9kSGmh2NTZBRRFfoQtio2tG82VQpKIAk/UhbaSZNYMMO234L3AtMT
         T/5PiXBAR6BT54nCJUxc2KmfPiPnc/2233G1rJOSt1lcXhc5BPhMTLC/f6hczChIhbRY
         XWVvkP1j/TagiXPjKYdtqbQHF8Nxtv8t8zhkJeS77jLgh0S12o1HxvbWFpkpqXmlQf9Q
         BBkPzCUV3YQ/7nkera9b9FnVulqfDDbuztnnXN1M9176L/PGDhq4YspJGJYoQ7spc9lb
         txcg==
X-Forwarded-Encrypted: i=1; AJvYcCV4d2TK8cCrKCVz86rsi17zVaPd0jjBeeDAYm1M+Ln/d/Mz6dXK65VhodQYjODJrjppjdvvgZP9ggVpUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYasdNNVYxgwlgimGbPzEqdE0yYu209NXMb5xKkJDKCdjgVzFH
	5oUGpn0mO/Bht1eUDt0RSaaKtjEPuUijbyKzPpTC10xzq9V5awZf/LiHQaAUeFSMRzBTm6xHmbF
	3H8smbuytBZ2sECf9u7OawBtMs1GjdLlHMTo5eAbLmg==
X-Gm-Gg: ASbGncuwhspJgTlVFnhwMjUHiGN/GZveM6d5uMLopmmRhfrTD+qcbQf9c7RG8julEfb
	fe9c1ZZQmgXOp1CIakrBNnagSUGyO8HrPTQ66oeUO98/1JLJwePx1hLt3yrSkmYmnDhj1TvupmQ
	3lAJAqGs39P+KtGyZfnH6Gp0KfyqNXC/EFWJfjrJeNQNyCa0PNLkqW
X-Google-Smtp-Source: AGHT+IFLz3Vl5G1STkCpTHnFizE3p8mAf9pvpCYG1N2QfqDuoM9RrsfGR/H2ltgphKQYCTDpc5ZM+HFUSOw07SlczgM=
X-Received: by 2002:a05:690c:8e0d:b0:70e:7503:1181 with SMTP id
 00721157ae682-7117543370amr238070227b3.18.1750300683598; Wed, 18 Jun 2025
 19:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-5-guodong@riscstar.com>
 <aFEFBss3RT7NbQkV@vaman>
In-Reply-To: <aFEFBss3RT7NbQkV@vaman>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 10:37:52 +0800
X-Gm-Features: AX0GCFusS0Wf6JwTzVWm3sY_lYpO92NDTczE7xfKgCKObXd32EKaOhpP7K8QAJc
Message-ID: <CAH1PCMYL57eEVyx7qy3offcsuKsN23qO73H+YTnffZe4kBxzMA@mail.gmail.com>
Subject: Re: [PATCH 4/8] dma: mmp_pdma: Add SpacemiT PDMA support with 64-bit addressing
To: Vinod Koul <vkoul@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_193804_751965_152E196F 
X-CRM114-Status: GOOD (  16.47  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgMjowMuKAr1BNIFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gMTEtMDYtMjUsIDIwOjU3LCBHdW9kb25nIFh1IHdyb3RlOgo+
ID4gRXh0ZW5kIHRoZSBNTVAgUERNQSBkcml2ZXIgdG8gc3VwcG9ydCBTcGFjZW1pVCBQRE1BIGNv
bnRyb2xsZXJzIHdpdGgKPiA+IDY0LWJpdCBwaHlzaWNhbCBhZGRyZXNzaW5nIGNhcGFiaWxpdGll
cywgYXMgdXNlZCBpbiB0aGUgSzEgU29DLiBUaGlzCj4gPiBjaGFuZ2UgaW50cm9kdWNlcyBhIGZs
ZXhpYmxlIGFyY2hpdGVjdHVyZSB0aGF0IG1haW50YWlucyBjb21wYXRpYmlsaXR5Cj4gPiB3aXRo
IGV4aXN0aW5nIDMyLWJpdCBNYXJ2ZWxsIHBsYXRmb3JtcyB3aGlsZSBhZGRpbmcgNjQtYml0IHN1
cHBvcnQuCj4gPgo+ID4gS2V5IGNoYW5nZXM6Cj4gPiAtIEFkZCBzdHJ1Y3QgbW1wX3BkbWFfY29u
ZmlnIHRvIGFic3RyYWN0IHBsYXRmb3JtLXNwZWNpZmljIGJlaGF2aW9ycwo+ID4gLSBJbXBsZW1l
bnQgNjQtYml0IGFkZHJlc3Mgc3VwcG9ydCB0aHJvdWdoOgo+ID4gICAqIE5ldyBoaWdoIGFkZHJl
c3MgcmVnaXN0ZXJzIChEREFEUkgsIERTQURSSCwgRFRBRFJIKQo+ID4gICAqIERDU1JfTFBBRUVO
IGJpdCBmb3IgTG9uZyBQaHlzaWNhbCBBZGRyZXNzIEV4dGVuc2lvbiBtb2RlCj4gPiAgICogSGVs
cGVyIGZ1bmN0aW9ucyBmb3IgMzIvNjQtYml0IGFkZHJlc3MgaGFuZGxpbmcKPiA+IC0gQWRkICJz
cGFjZW1pdCxwZG1hLTEuMCIgY29tcGF0aWJsZSBzdHJpbmcgd2l0aCBhc3NvY2lhdGVkIGNvbmZp
Zwo+ID4gLSBFeHRlbmQgZGVzY3JpcHRvciBzdHJ1Y3R1cmUgdG8gc3VwcG9ydCA2NC1iaXQgYWRk
cmVzc2VzCj4gPiAtIFJlZmFjdG9yIGFkZHJlc3MgaGFuZGxpbmcgY29kZSB0byBiZSBwbGF0Zm9y
bS1hZ25vc3RpYwo+ID4gLSBBZGQgcHJvcGVyIERNQSBtYXNrIGNvbmZpZ3VyYXRpb24gZm9yIGJv
dGggMzItYml0IGFuZCA2NC1iaXQgbW9kZXMKPiA+Cj4gPiBUaGUgaW1wbGVtZW50YXRpb24gdXNl
cyBhIGNvbmZpZ3VyYXRpb24tYmFzZWQgYXBwcm9hY2ggdG8ga2VlcHMgYWxsCj4gPiBwbGF0Zm9y
bS1zcGVjaWZpYyBjb2RlIGlzb2xhdGVkIGluIGNvbmZpZyBzdHJ1Y3R1cmVzLiBJdCBtYWludGFp
bnMgY2xlYW4KPiA+IHNlcGFyYXRpb24gYmV0d2VlbiAzMi1iaXQgYW5kIDY0LWJpdCBjb2RlIHBh
dGhzLCBwcm92aWRlcyBjb25zaXN0ZW50Cj4gPiBBUEkgZm9yIGJvdGggYWRkcmVzc2luZyBtb2Rl
cyBhbmQgcHJlc2VydmVzIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuCj4KPiBJIHdvdWxkIGFzayBm
b3IgdGhpcyB0byBiZSBzcGxpdCwgZmlyc3QgdG8gdG8gZHJpdmVyIGNoYW5nZXMgZm9yIGFkZGlu
Zwo+IG5ldyBvcHMgYW5kIHRoZW4gYWRkaW5nIG5ldyBzb2Mgc3VwcG9ydC4gVGhpcyB3YXkgdGhl
IHR3byBjaGFuZ2VzIGFyZQo+IGluZGVwZW5kZW50CgpIaSwgVmlub2QKClRoYW5rIHlvdSBmb3Ig
dGhlIGZlZWRiYWNrLiBJIGFncmVlIHdpdGggdGhhdC4KSSdsbCBzZW5kIHYyIHdpdGggdGhpcyBz
cGxpdCBhcHByb2FjaC4KCi0KR3VvZG9uZwoKPgo+IC0tCj4gflZpbm9kCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
