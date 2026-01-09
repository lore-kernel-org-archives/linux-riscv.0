Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4811DD167F7
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjNY0zkwarK9C06z4cfOFo3+r73gfLP3BMQIKTu1D04=; b=VsF1lT92ADOtoy
	wqveeQGmCrLbWUb91DXpj5q4BdPnBtOyYZuW0U2PBcLG8/H6Skq6xs3PB/6hyUQFifyMvF67KPa9F
	q2bXlMuBct+EfqnWYiOKGuLYyLMIAiHM9kZttzaS6Age6SoTX9l10L7ngBntbJDv/FKRO5+wS1er3
	GcKGojRfE9OzCOiVs79pslFmKW95L0ABl9sYf6VLpUbxv2nojlEeWUN1p3tM7ZR4e3W4aio6dAOr5
	X8pYWxslOpjAljxLjHakCcTeVKVRTf5FX951nbYGqxux0KF9355wv9PA5qHW9KtGJlJ/rHrcDlWjl
	WU3wrQ7nUtR5h3wBHpbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Gd-000000024jS-1ql8;
	Fri, 09 Jan 2026 09:58:51 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Ga-000000024it-3Pok
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:58:50 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-78f89501423so32006997b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767952727; x=1768557527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRyjYSTtXcl5FXFODcJzwoMzy+oOw8NWF5mztWKmicQ=;
        b=OZEw607M3qaQSHc9QHmDKLfB/zbNR8e6u+64PxtTYiavDMaxfFCXTs/pYqD4/KH8zM
         6BxcNqyE6PgofMv5sqBKEExFcIb3sVLE+SzlS6vIVw4VgGkOi4Np4KsYmTPQ4pk4jLTH
         o0kHcc/hF6/x1zFQs1cKwEcwFU8TV4Y8emYSsMt6cVNqgJ5vZZI5cth7j4/MBkUNDBhu
         52gh66HWRv9kN8OEdPCDjwMym9QVpnJEDFukyyYjY8YsgDzSvXWnzCYQkSzvO4oTkDCn
         nNEOUVIm+BdXHcS5Seqahxag4uBlRSy2RPH8TEcbRKZ6GxAyZyQO5GDJOB1v/qJgXkrU
         v+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952727; x=1768557527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRyjYSTtXcl5FXFODcJzwoMzy+oOw8NWF5mztWKmicQ=;
        b=DMPf+nRs4/X2iQCfIeKEYWbaiFAX1JKunjscJDfUqGGXKLNPiNikgXqCRaXcaULG5h
         1axFG56IyyM61qmHpb4aJpWsugvzXcZHYdPVCg9Zsbpx6cXoarCuXMS+3r6tjv/+dKUl
         0YAF/cYh8yWzyfJ6DybIDURPm47UR/Wa/fUI5zijyNZJD8Q6T+S8qtJ1wq6XjYPoJWvx
         evoNeoN51//OEQi/XGTURvBlAFKSwOiqfgQcz3HU23KO4A8VzDjuEKQ7Lsvxl9unWnL4
         Utp6oIxGmJUk0qBrfTPz3XJwkoZh9oNcD2V9xaLzXS3nlGwqPtZZM61HjH6i0CGvwqwG
         si/g==
X-Forwarded-Encrypted: i=1; AJvYcCVKbvr3/RAD1R0o6N/D2eYPbAyjA8LADqbCKxS6xQMSh7vMRN4rhMLfoL4BQK1nrM3huv08RHbwxvN45w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP5CscqRkbqx3cJgpUiCrYUQ9JRyttnoRcNspqMk6sFyXQM+2H
	FXeRVglS9SWgwpXDoU+LYUDmlyg4e8GeZ9XCbm7RsjzP3cYE1zbtyLlRilZOrTY0d3OpRB1SuBc
	H+1t1xMdwi/FIddfbFn5aSFun2dtwf9YJfTsiBgEvyA==
X-Gm-Gg: AY/fxX45uDscj9gGQZzoUMZS7Q9Xvfo4zxFVAKn4r1nJ01UN3Y3CxjJrdEEWDfPI3Iw
	85eOPS7IrfdOJd2/6Yl+jNCSBILo8EtsnYdtLfdPAp3KE2NMy/Oq6oukbV1fOs/gpW0GgZi/Kix
	WPXSuuo5ie9iN44F9EnYF3J/pbfNBLMvdSabOYNFYkHtlwwdTHH+zckIVG0DX6OgBYe9ZnRn+s1
	iDzRl7AUTS7gKMV9K1ay3xn+FPW/9Gw48VkIznud40E2HyoGh8gWTA8HXqMj5TQjRVHpS16eo+x
	egrvEHbVthCC1rloq+H1AZFuQ8oh7UyB0YrRrdu42Gk=
X-Google-Smtp-Source: AGHT+IFW7FLnowocr8JpPLfWWYtEHi7OSPLnkmturePvB00jhuMA0kdr6u8Qb5NpLIfs41qOnuD4QPSn0aG0bk5mMPQ=
X-Received: by 2002:a05:690e:1188:b0:641:f5bc:692b with SMTP id
 956f58d0204a3-6470d2f46b7mr10319192d50.36.1767952727498; Fri, 09 Jan 2026
 01:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
 <20260108-k3-basic-dt-v3-10-ed99eb4c3ad3@riscstar.com> <77f9a001-7f0a-4c29-abcb-501e875da117@sifive.com>
In-Reply-To: <77f9a001-7f0a-4c29-abcb-501e875da117@sifive.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 9 Jan 2026 17:58:36 +0800
X-Gm-Features: AQt7F2phDg1o6vGA0EN2FWkwF5OD2jGO_aKHZYYtROeDAwedA-GsX86VaBlzTIs
Message-ID: <CAH1PCMZ5rKbG8xEbB9jt6TqyB28T5aLgRtf3iJ8Gt6Fk+3XFhQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_015849_111119_8A1ABD7C 
X-CRM114-Status: GOOD (  18.60  )
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

SGksIFNhbXVlbAoKT24gRnJpLCBKYW4gOSwgMjAyNiBhdCAyOjE54oCvQU0gU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyNi0wMS0wOCA2
OjI2IEFNLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gU3BhY2VtaVQgSzMgaXMgZXF1aXBwZWQgd2l0
aCA4IFgxMDAgY29yZXMsIHdoaWNoIGFyZSBSVkEyMyBjb21wbGlhbnQuCj4gPiBBZGQgbm9kZXMg
b2YgdWFydHMsIHRpbWVyIGFuZCBpbnRlcnJ1cHQtY29udHJvbGxlcnMuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+IHYz
OiBSZW1vdmUgInN1cG0iIGZyb20gdGhlIHJpc2N2LGlzYS1leHRlbnNpb25zIGxpc3QuCj4gPiB2
MjogUmVtb3ZlIGFsaWFzZXMgZnJvbSBrMy5kdHNpLCB0aGV5IHNob3VsZCBiZSBpbiBib2FyZCBE
VFMuCj4gPiAgICAgVXBkYXRlZCByaXNjdixpc2EtZXh0ZW5zaW9ucyB3aXRoIG5ldyBleHRlbnNp
b25zIGZyb20gdGhlIGV4dGVuc2lvbnMueWFtbAo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMy5kdHNpIHwgNTQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDU0OCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaSBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmJlOTMzNWZi
YTMyY2I5ZTgxOTE1YjJiOTFjZjA4YzU1YTVlOTY4MDkKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+ID4gWy4uLl0KPiA+ICsK
PiA+ICsgICAgICAgICAgICAgc2ltc2ljOiBpbnRlcnJ1cHQtY29udHJvbGxlckBlMDQwMDAwMCB7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMy1pbXNp
Y3MiLCJyaXNjdixpbXNpY3MiOwo+Cj4gc3R5bGU6IG1pc3Npbmcgc3BhY2UgYWZ0ZXIgY29tbWEK
ClRoYW5rcywgU2FtdWVsLiBJIHdpbGwgZml4IHRoYXQuCgo+Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MCAweGUwNDAwMDAwIDB4MCAweDAwMjAwMDAwPjsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDA+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG1z
aS1jb250cm9sbGVyOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICNtc2ktY2VsbHMgPSA8MD47
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmY3B1MF9p
bnRjIDk+LCA8JmNwdTFfaW50YyA5PiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPCZjcHUyX2ludGMgOT4sIDwmY3B1M19pbnRjIDk+LAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTRfaW50YyA5PiwgPCZj
cHU1X2ludGMgOT4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDwmY3B1Nl9pbnRjIDk+LCA8JmNwdTdfaW50YyA5PjsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICByaXNjdixudW0taWRzID0gPDUxMT47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmlz
Y3YsbnVtLWd1ZXN0LWlkcyA9IDw1MTE+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2
LGhhcnQtaW5kZXgtYml0cyA9IDw0PjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByaXNjdixn
dWVzdC1pbmRleC1iaXRzID0gPDY+Owo+ID4gKyAgICAgICAgICAgICB9Owo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICBzYXBsaWM6IGludGVycnVwdC1jb250cm9sbGVyQGUwODA0MDAwIHsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGszLWFwbGljIiwgInJp
c2N2LGFwbGljIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZTA4MDQw
MDAgMHgwIDB4NDAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgbXNpLXBhcmVudCA9IDwm
c2ltc2ljPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDI+
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHJpc2N2LG51bS1zb3VyY2VzID0gPDUxMj47Cj4gPiArICAgICAg
ICAgICAgIH07Cj4KPiBEb2VzIHRoZSBjaGlwIGFsc28gaGF2ZSBNLW1vZGUgSU1TSUMgYW5kIEFQ
TElDIGluc3RhbmNlcz8gVGhvc2UgbmVlZCB0byBiZQo+IHJlcHJlc2VudGVkIGluIHRoZSBkZXZp
Y2V0cmVlIGFzIHdlbGwsIGZvciBNLW1vZGUgZmlybXdhcmUgdG8gYWNjZXNzIHRoZW0sIGp1c3QK
PiBsaWtlIHRoZSBDTElOVCBiZWxvdy4KClllcywgdGhlIEszIGNoaXAgZG9lcyBoYXZlIE0tbW9k
ZSBJTVNJQyBhbmQgQVBMSUMgaW5zdGFuY2VzLiBDdXJyZW50bHksIHRoZQpib290IGZpcm13YXJl
IChVLUJvb3QpIHRyYW5zZmVycyBpbmZvcm1hdGlvbiBhYm91dCB0aGVzZSBub2RlcyB0byBPcGVu
U0JJLgpIb3dldmVyLCB5b3UgYXJlIGNvcnJlY3QgdGhhdCB0aGV5IHNob3VsZCBiZSBwcm9wZXJs
eSBkZXNjcmliZWQgaW4gdGhlIERULgoKSW4gdGhlIG5leHQgdmVyc2lvbiwgSSB3aWxsIGFkZCB0
aGUgTS1tb2RlIEFQTElDIChtYXBsaWMpIGFuZCBJTVNJQyAobWltc2ljKQpub2RlcyB0byBrMy5k
dHNpLCBmb3IgdG9wb2xvZ3kgcmVwcmVzZW50YXRpb24gYW5kIHBvdGVudGlhbCBmaXJtd2FyZSB1
c2FnZS4KSSB3aWxsIHNldCB0aGVpciBzdGF0dXMgdG8gImRpc2FibGVkIiBiZWNhdXNlIGV4cG9z
aW5nIHRoZW0gYXMgIm9rYXkiIHRvIExpbnV4CmNhdXNlcyBhY2Nlc3MgZmF1bHRzIGR1cmluZyBk
cml2ZXIgcHJvYmluZy4KClBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIGFwcHJvYWNoIChhZGRp
bmcgdGhlbSBidXQga2VlcGluZyB0aGVtIGRpc2FibGVkKQpsb29rcyBva2F5IHRvIHlvdS4KCkJl
c3QgcmVnYXJkcywKR3VvZG9uZyBYdQoKPgo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4KPiA+ICsKPiA+
ICsgICAgICAgICAgICAgY2xpbnQ6IHRpbWVyQGUwODFjMDAwIHsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGszLWNsaW50IiwgInNpZml2ZSxjbGludDAi
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhlMDgxYzAwMCAweDAgMHgw
MDA0MDAwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0g
PCZjcHUwX2ludGMgMz4sIDwmY3B1MF9pbnRjIDc+LAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTFfaW50YyAzPiwgPCZjcHUxX2ludGMgNz4sCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1Ml9pbnRj
IDM+LCA8JmNwdTJfaW50YyA3PiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZjcHUzX2ludGMgMz4sIDwmY3B1M19pbnRjIDc+LAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTRfaW50YyAzPiwgPCZjcHU0
X2ludGMgNz4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwmY3B1NV9pbnRjIDM+LCA8JmNwdTVfaW50YyA3PiwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPCZjcHU2X2ludGMgMz4sIDwmY3B1Nl9pbnRjIDc+LAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTdfaW50
YyAzPiwgPCZjcHU3X2ludGMgNz47Cj4gPiArICAgICAgICAgICAgIH07Cj4gPiArICAgICB9Owo+
ID4gK307Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
