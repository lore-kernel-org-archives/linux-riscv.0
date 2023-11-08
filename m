Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A5DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEUEPL95yHNT6MZArtGacguqkJQHzTKMuvBkh0RLV/c=; b=OFFygjvuwnnOP2
	oR4Gvlx4BSLc9mEcgEXgojlr6Kdth+skRUqu33rwJOuO1CIxRNeE85a6Ls3q5V1EQDdr8uJieML/p
	OCQFzusc8TRnzcVxeBd0I/nZEW1WtybaILcBQgijriCWusIOM7MWFA7uKTaXDL8hT6kjbpP+kojqm
	uH92tW+gbWcEo7YyW0vqGIMUtim4hgn6/gnqjlNAQ/iMmdKmzW1d/JsEey4NzUbIZVS8KPL5pk7UY
	Bl8LPZ6rhJuKLdsl/AZXu5ZSQUwfUUYx80gBaOrDvuAlhgZpjVBL1gmKxegPKO2UFPqNBvWKZUdBF
	WbBtjAeuuZ6iaoZEXaCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0liU-004Khc-1D;
	Wed, 08 Nov 2023 16:47:46 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0liQ-004Kgr-2g
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 16:47:45 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c595f5dc84so11463361fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699462060; x=1700066860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pz2ORLk0kX13nQ9ymAHGPqfg2j02tcbAp1xY9AcNr8=;
        b=cSp8NBPY+8EDJaFP8ewVuCpbT43Y/DM73Z65hpTVTtGZ5Ob2IP/N/iI5E/iw/4PqwL
         4XOb/WtB2MaLohxpqsVvjU+HXUlvhYQyrap0MCkrFIordfjfV1MldOWM/1Q4mR++ka0r
         0/ZPWJsq5+rVTUi+CNZ7+oagYBXoQtUJy6fI5iu69/owpz5zdcPgiw0GhZeAAyKhfOcd
         T8ZNTo8LRCVsBPq/pzLYd6SWpGK9F+I7LvthdRe7ZVTETiagHhyaehcF4DUggxC3SCq8
         3J1iH8dzkNZp3fv6baPJd2wARNJRJiJAY88LNqWrJdRBoAlUjGxifE2hdTvxxJusw0jg
         qIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699462060; x=1700066860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pz2ORLk0kX13nQ9ymAHGPqfg2j02tcbAp1xY9AcNr8=;
        b=pT0qcLaG3fkR0A32gHUNQAC59+r17H57rxe5kNt5BQB3Pr4tBtKhj//QBAqHhCqweC
         MddwAUg4s3XBYZ7lNg+2xUS4eBUhVM3yVELW6k/QvLq1DllyrLB70CGhhjJOcRZ7+/hY
         ZfmxoIoik2FUGvf1j1QEmheMMEdJM2DhM+RXoBzPTROktzBYQnpHcP5kCJ9osMcenOST
         3gLO4YpMDynN31A9zFbvtyX3Hv/QF5LT2sJ4f+EY6zoJujkgMORoyDmmrzQe+veJfzHu
         AmiqZV1b1uaR0VWMfylVtHdnoxjBDfYXi6JbmQVg43a/nQgjH2JTAwrZdDt4DmG0YlFx
         ywJw==
X-Gm-Message-State: AOJu0YwLINnev3v8XV9fJ3POHeOiLdnVMTOnhk7sgIfbDkjzut8PSbRr
	oc1ItU7YoX48y6zXxK89NwNXsVmNJgVOlWuAe3PVTzDnmDZhFEvzCUL/tg==
X-Google-Smtp-Source: AGHT+IHBCyQWRfYTEPjqwNF0fuyXBQboVtUT0QSKTvFHtdwWCwfNgS48bDg/2CrmRAaZ6Qxp9Zsv/5d253cYjFPsk5w=
X-Received: by 2002:a2e:9d0e:0:b0:2c3:c4b8:19ec with SMTP id
 t14-20020a2e9d0e000000b002c3c4b819ecmr984244lji.18.1699462059646; Wed, 08 Nov
 2023 08:47:39 -0800 (PST)
MIME-Version: 1.0
References: <CGME20231108112923eucas1p27474e921565e3f175e27e6598f0b71c3@eucas1p2.samsung.com>
 <20231108112909.591987-1-m.szyprowski@samsung.com>
In-Reply-To: <20231108112909.591987-1-m.szyprowski@samsung.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 8 Nov 2023 08:47:03 -0800
Message-ID: <CALs-Hst6fmesQy6g=ZxfKFs5W85quWQRcwP_=okBWKqMA3CQsw@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix potential panic during CPU hot-plug
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_084743_225417_C6ABFEB8 
X-CRM114-Status: GOOD (  23.60  )
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

T24gV2VkLCBOb3YgOCwgMjAyMyBhdCAzOjI54oCvQU0gTWFyZWsgU3p5cHJvd3NraQo8bS5zenlw
cm93c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IENvbW1pdCA1ODRlYTY1NjRiY2EgKCJSSVND
LVY6IFByb2JlIGZvciB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIikgYWRkZWQgYQo+IHRlc3QgZm9y
IHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQuIEl0IGlzIGJlaW5nIHBlcmZvcm1lZCB3aGVuIGdpdmVu
IENQVSBpcwo+IG9ubGluZWQuIFRoZW4sIGFub3RoZXIgdGVzdCBmb3IgbWlzYWxpZ25lZCBhY2Nl
c3MgZW11bGF0aW9uIGhhcyBiZWVuCj4gYWRkZWQgaW4gY29tbWl0IDcxYzU0YjNkMTY5ZCAoInJp
c2N2OiByZXBvcnQgbWlzYWxpZ25lZCBhY2Nlc3Nlcwo+IGVtdWxhdGlvbiB0byBod3Byb2JlIiku
IFRoaXMgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCBkb2Vzbid0IHJlYWxseSBjaGFuZ2UKPiBhZnRl
ciB0aGUgYm9vdCwgc28gaXQgaXMgc3VmZmljaWVudCB0byBkbyB0aGlzIHRlc3Qgb25seSBvbmNl
LiBUaGlzIGhhcwo+IGJlZW4gcGFydGlhbGx5IGFkZGVkIGJ5IGNvbW1pdCBjMjBkMzZjYzJhMjAg
KCJyaXNjdjogZG9uJ3QgcHJvYmUKPiB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIGlmIGFscmVhZHkg
ZG9uZSIpLCBidXQgdGhpcyBvcHRpbWlzYXRpb24gd29ya3MKPiBvbmx5IGlmIFJJU0NWX0hXUFJP
QkVfTUlTQUxJR05FRF9FTVVMQVRFRCBpcyByZXR1cm5lZCBieSB0aGUgbGF0dGVyCj4gY2hlY2su
IE90aGVyd2lzZSB0aGUgJ21pc2FsaWduZWRfYWNjZXNzX3NwZWVkJyBwY3B1IHZhcmxpYWJsZSBp
cwo+IG92ZXJ3cml0dGVuIHdpdGggUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04gdmFs
dWUsIHdoYXQgbWFrZXMgdGhlCj4gZmlyc3QgY2hlY2sgdG8gYmUgYWx3YXlzIHBlcmZvcm1lZC4K
Pgo+IFJlY2VudGx5IEkndmUgbm90aWNlZCB0aGF0IHRoZSBmaXJzdCBjaGVjayBpbnRyb2R1Y2Vk
IGEgcmVncmVzc2lvbiBpbiB0aGUKPiBDUFUgaG90LXBsdWcgbWVjaGFuaXNtLiBUaGlzIGNhbiBi
ZSBvYnNlcnZlZCBhcyBhIGZvbGxvd2luZyBwYW5pYyBvbgo+IFFFbXU6Cj4KPiBDUFUxOiBvZmYK
PiBjcHUxOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25lZCB3b3JkIGFjY2Vz
cyBpcyA3LjAwLCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIGZhc3QKPiBDUFUxOiBvZmYKPiBDUFUx
OiBmYWlsZWQgdG8gY29tZSBvbmxpbmUKPiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0t
LS0tLS0KPiBXQVJOSU5HOiBDUFU6IDAgUElEOiAyMTUgYXQga2VybmVsL3NtcC5jOjQzNyBfX2Zs
dXNoX3NtcF9jYWxsX2Z1bmN0aW9uX3F1ZXVlKzB4OTAvMHgyOTIKPiBNb2R1bGVzIGxpbmtlZCBp
bjoKPiBDUFU6IDAgUElEOiAyMTUgQ29tbTogYmFzaCBOb3QgdGFpbnRlZCA2LjUuMC1yYzErICM3
NTI0Cj4gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+IGVwYyA6IF9fZmx1
c2hfc21wX2NhbGxfZnVuY3Rpb25fcXVldWUrMHg5MC8weDI5Mgo+ICByYSA6IHNtcGNmZF9keWlu
Z19jcHUrMHhlLzB4MWMKPiAuLi4KPiBbPGZmZmZmZmZmODAwYzkwNGE+XSBfX2ZsdXNoX3NtcF9j
YWxsX2Z1bmN0aW9uX3F1ZXVlKzB4OTAvMHgyOTIKPiBbPGZmZmZmZmZmODAwYzlhZTg+XSBzbXBj
ZmRfZHlpbmdfY3B1KzB4ZS8weDFjCj4gWzxmZmZmZmZmZjgwMDEyYjJlPl0gY3B1aHBfaW52b2tl
X2NhbGxiYWNrKzB4MTI0LzB4MzIyCj4gWzxmZmZmZmZmZjgwMDE0MmY4Pl0gX2NwdV91cCsweDIx
OC8weDMyMgo+IFs8ZmZmZmZmZmY4MDAxNDQ1ZT5dIGNwdV91cCsweDVjLzB4OTgKPiBbPGZmZmZm
ZmZmODAwMTRiYjg+XSBjcHVfZGV2aWNlX3VwKzB4MTQvMHgxYwo+IFs8ZmZmZmZmZmY4MDY2ZDY4
ZT5dIGNwdV9zdWJzeXNfb25saW5lKzB4MTAvMHgxOAo+IFs8ZmZmZmZmZmY4MDY2ODBlOD5dIGRl
dmljZV9vbmxpbmUrMHg1Ni8weDcyCj4gWzxmZmZmZmZmZjgwNjY4MTkwPl0gb25saW5lX3N0b3Jl
KzB4OGMvMHhhZQo+IFs8ZmZmZmZmZmY4MDY2MmRkZT5dIGRldl9hdHRyX3N0b3JlKzB4ZS8weDFh
Cj4gWzxmZmZmZmZmZjgwMmI1M2JjPl0gc3lzZnNfa2Zfd3JpdGUrMHgyZS8weDRjCj4gWzxmZmZm
ZmZmZjgwMmI0NzUwPl0ga2VybmZzX2ZvcF93cml0ZV9pdGVyKzB4ZTgvMHgxNGUKPiBbPGZmZmZm
ZmZmODAyMzAxNzA+XSB2ZnNfd3JpdGUrMHgyYTQvMHgzZTAKPiBbPGZmZmZmZmZmODAyMzAzZTg+
XSBrc3lzX3dyaXRlKzB4NWUvMHhjOAo+IFs8ZmZmZmZmZmY4MDIzMDQ2MD5dIHN5c193cml0ZSsw
eGUvMHgxNgo+IFs8ZmZmZmZmZmY4MGE0YThkZT5dIGRvX3RyYXBfZWNhbGxfdSsweGUwLzB4ZjQK
PiBbPGZmZmZmZmZmODAwMDNlOGM+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4NjQKPiBpcnEg
ZXZlbnQgc3RhbXA6IDEyMzM1Cj4gaGFyZGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoMTIzMzUpOiBb
PGZmZmZmZmZmODAwN2U1NDI+XSBjb25zb2xlX3VubG9jaysweDE1Ni8weDE4Ngo+IGhhcmRpcnFz
IGxhc3QgZGlzYWJsZWQgYXQgKDEyMzM0KTogWzxmZmZmZmZmZjgwMDdlNTJjPl0gY29uc29sZV91
bmxvY2srMHgxNDAvMHgxODYKPiBzb2Z0aXJxcyBsYXN0ICBlbmFibGVkIGF0ICgxMjE1NCk6IFs8
ZmZmZmZmZmY4MGE1NjBkMD5dIF9fZG9fc29mdGlycSsweDNiMC8weDQ3MAo+IHNvZnRpcnFzIGxh
c3QgZGlzYWJsZWQgYXQgKDEyMTQ3KTogWzxmZmZmZmZmZjgwMDE5MzQwPl0gX19pcnFfZXhpdF9y
Y3UrMHhhNi8weGQwCj4gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4gLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4ga2VybmVsIEJVRyBhdCBrZXJuZWwv
aXJxX3dvcmsuYzoyNDUhCj4gS2VybmVsIEJVRyBbIzFdCj4gTW9kdWxlcyBsaW5rZWQgaW46Cj4g
Q1BVOiAwIFBJRDogMjE1IENvbW06IGJhc2ggVGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgICA2
LjUuMC1yYzErICM3NTI0Cj4gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+
IGVwYyA6IGlycV93b3JrX3J1bl9saXN0KzB4MzAvMHgzMgo+ICByYSA6IGlycV93b3JrX3J1bisw
eDJhLzB4NGMKPiAuLi4KPiBbPGZmZmZmZmZmODAxMWEzNDY+XSBpcnFfd29ya19ydW5fbGlzdCsw
eDMwLzB4MzIKPiBbPGZmZmZmZmZmODAxMWEzNzI+XSBpcnFfd29ya19ydW4rMHgyYS8weDRjCj4g
WzxmZmZmZmZmZjgwMGM5YWVjPl0gc21wY2ZkX2R5aW5nX2NwdSsweDEyLzB4MWMKPiBbPGZmZmZm
ZmZmODAwMTJiMmU+XSBjcHVocF9pbnZva2VfY2FsbGJhY2srMHgxMjQvMHgzMjIKPiBbPGZmZmZm
ZmZmODAwMTQyZjg+XSBfY3B1X3VwKzB4MjE4LzB4MzIyCj4gWzxmZmZmZmZmZjgwMDE0NDVlPl0g
Y3B1X3VwKzB4NWMvMHg5OAo+IFs8ZmZmZmZmZmY4MDAxNGJiOD5dIGNwdV9kZXZpY2VfdXArMHgx
NC8weDFjCj4gWzxmZmZmZmZmZjgwNjZkNjhlPl0gY3B1X3N1YnN5c19vbmxpbmUrMHgxMC8weDE4
Cj4gWzxmZmZmZmZmZjgwNjY4MGU4Pl0gZGV2aWNlX29ubGluZSsweDU2LzB4NzIKPiBbPGZmZmZm
ZmZmODA2NjgxOTA+XSBvbmxpbmVfc3RvcmUrMHg4Yy8weGFlCj4gWzxmZmZmZmZmZjgwNjYyZGRl
Pl0gZGV2X2F0dHJfc3RvcmUrMHhlLzB4MWEKPiBbPGZmZmZmZmZmODAyYjUzYmM+XSBzeXNmc19r
Zl93cml0ZSsweDJlLzB4NGMKPiBbPGZmZmZmZmZmODAyYjQ3NTA+XSBrZXJuZnNfZm9wX3dyaXRl
X2l0ZXIrMHhlOC8weDE0ZQo+IFs8ZmZmZmZmZmY4MDIzMDE3MD5dIHZmc193cml0ZSsweDJhNC8w
eDNlMAo+IFs8ZmZmZmZmZmY4MDIzMDNlOD5dIGtzeXNfd3JpdGUrMHg1ZS8weGM4Cj4gWzxmZmZm
ZmZmZjgwMjMwNDYwPl0gc3lzX3dyaXRlKzB4ZS8weDE2Cj4gWzxmZmZmZmZmZjgwYTRhOGRlPl0g
ZG9fdHJhcF9lY2FsbF91KzB4ZTAvMHhmNAo+IFs8ZmZmZmZmZmY4MDAwM2U4Yz5dIHJldF9mcm9t
X2V4Y2VwdGlvbisweDAvMHg2NAo+IENvZGU6IDg1MjYgNjA4NCBmMGVmIGY3MWYgZmNlNSA2MGUy
IDY0NDIgNjRhMiA2MTA1IDgwODIgKDkwMDIpIDExMDEKPiAtLS1bIGVuZCB0cmFjZSAwMDAwMDAw
MDAwMDAwMDAwIF0tLS0KPiBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0
aW9uIGluIGludGVycnVwdAo+IFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMKPiBTTVA6IGZh
aWxlZCB0byBzdG9wIHNlY29uZGFyeSBDUFVzIDAtMQo+IC0tLVsgZW5kIEtlcm5lbCBwYW5pYyAt
IG5vdCBzeW5jaW5nOiBGYXRhbCBleGNlcHRpb24gaW4gaW50ZXJydXB0IF0tLS0KPgo+IFRvIGF2
b2lkIGNhbGxpbmcgdGhvc2UgY2hlY2tzIGluIHRoZSBDUFUgaG90LXBsdWcgcGF0aHMgYWdhaW4g
YW5kIGFnYWluLAo+IHNpbXBseSBtb3ZlIHRoZSBjaGVjayBhdCB0aGUgYmVnaW5uaW5nIG9mIHRo
ZSBjaGVja191bmFsaWduZWRfYWNjZXNzKCkKPiBmdW5jdGlvbiBhbmQgcmVseSBvbiB0aGUgdmFs
dWUgZGV0ZXJtaW5lZCBkdXJpbmcgdGhlIHN5c3RlbSBib290Lgo+Cj4gRml4ZXM6IDU4NGVhNjU2
NGJjYSAoIlJJU0MtVjogUHJvYmUgZm9yIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQiKQo+IEZpeGVz
OiBjMjBkMzZjYzJhMjAgKCJyaXNjdjogZG9uJ3QgcHJvYmUgdW5hbGlnbmVkIGFjY2VzcyBzcGVl
ZCBpZiBhbHJlYWR5IGRvbmUiKQo+IEZpeGVzOiA3MWM1NGIzZDE2OWQgKCJyaXNjdjogcmVwb3J0
IG1pc2FsaWduZWQgYWNjZXNzZXMgZW11bGF0aW9uIHRvIGh3cHJvYmUiKQo+IFNpZ25lZC1vZmYt
Ynk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KCkhpIE1hcmVr
LApUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSBoYXBwZW5lZCB0byBzcG90IHRoYXQgYnVnIHRvbwoo
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCgpIGNsb2JiZXJpbmcgdGhlIHBlci1jcHUg
dmFyaWFibGUKYmFjayB0byB1bmtub3duKS4gU2luY2UgSSB3YXMgcmVhcnJhbmdpbmcgdGhhdCBj
b2RlIHRvIHRyeSB0byBydW4gdGhlCnNwZWVkIG1lYXN1cmVtZW50cyBpbiBwYXJhbGxlbCwgSSBt
b3ZlZCB0aGF0IGNoZWNrIGFyb3VuZCB0byBob3BlZnVsbHkKc29sdmUgdGhlIHNhbWUgaXNzdWUg
eW91J3JlIHJlcG9ydGluZy4gQ2FuIHlvdSBzZWUgaWYgdGhpcyBwYXRjaCBhbHNvCmZpeGVzIHlv
dXIgaXNzdWU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzExMDYyMjU4NTUuMzEy
MTcyNC0xLWV2YW5Acml2b3NpbmMuY29tLwouIEl0J3MgYWxzbyBpbiBQYWxtZXIncyBmb3ItbmV4
dCB0cmVlIGFzIDU1ZTBiZjQ5YTBkMCAoIlJJU0MtVjogUHJvYmUKbWlzYWxpZ25lZCBhY2Nlc3Mg
c3BlZWQgaW4gcGFyYWxsZWwiKS4KCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
