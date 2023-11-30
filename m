Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C8FC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCut4hV9OzMz46aizKAs/tNEZn3g4rqNBIzNPMPjXig=; b=DbiMKz4kZCumKT
	1oRIN+AOBTunmDGgGR8RtSZbuUyE03Rnz3y594QqkVaILGl0ZD19IDqXJeuAmzcd7y5668p5BKiVy
	JfYBx+3zMg5hOVSXwK9idQUCoNGwvX6mLqrO1bCmfUbpjU5xo8upEpuC9fYT1RvWA+umhzEjjbALN
	YkIaoVNbvfwUvd3164i3JVIQhUAmsVwWRar7TG20U15SEZEL+gEEawqVHfxD+IP/Q2EoXd9VZN0LN
	fLdoJYm7WWIA9qEJ4C093PDYrX3ThMh1m1W3Ba8+SSlmWPp+5GLWKcCCqJp2xeZvK/jvAJ749ebMG
	m8Biz5Ya7zyFaRZmrgqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8i7F-00B6xv-13;
	Thu, 30 Nov 2023 14:34:09 +0000
Received: from mail-yb1-f169.google.com ([209.85.219.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8i7B-00B6vv-0A
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 14:34:07 +0000
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-da819902678so883503276.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 06:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354843; x=1701959643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjMwvKLpHyQcSSnE02SuxEvq8IHzlQRD3fny3+vWifw=;
        b=Mds7SSfZ78EuIt/tSKjGTW+TBuB0d4qiuJ3dqk4ME5gCja1HfF20Wi+z+XZINAfMc7
         y6CJ5RbwPoD5FrCrZ2nzlP37ZhXHmtT0eLmUnEtaEqUWbB+4+eCTChTQO0Vl0Dj3r2oc
         HpAjU8gMIwONsjuC/bRE1XzyVWx0vZrK++EzSlmN6LAvViRixtaBeMatLWsrMEuWEUSC
         DjuQYyYni/fypwl8s2s1lY4gPxFr+xkoyuzCAnWafORdKN6JqggVHs9cy/a6EBhxgTgG
         bIIJedw5Lq8fQU1cFM2FfHE+kujOwhL10DzkJ3pBQd8f5ISxNTc11syTlT3hBka8eHZ+
         1fag==
X-Gm-Message-State: AOJu0YyidnxkomZd/sqvAGySHhoBRqdDYzfwsv3zIY8Va8nsxudxQrr8
	xkg0UySXtVR9z+MUm1P7rpgCignZIR5acQ==
X-Google-Smtp-Source: AGHT+IEDzVAp70Rub9/a3pq6VA+5UzPNvhU6zf7kkGLsp2INizCNoreGOcy3TTUtdTrSwnxnLb8NgA==
X-Received: by 2002:a81:9305:0:b0:5ca:b84b:5742 with SMTP id k5-20020a819305000000b005cab84b5742mr22748921ywg.35.1701354843106;
        Thu, 30 Nov 2023 06:34:03 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id v127-20020a818585000000b00583b144fe51sm391296ywf.118.2023.11.30.06.34.02
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:34:02 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-da819902678so883466276.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 06:34:02 -0800 (PST)
X-Received: by 2002:a25:ae9a:0:b0:daf:45f7:26a7 with SMTP id
 b26-20020a25ae9a000000b00daf45f726a7mr24459997ybj.17.1701354842128; Thu, 30
 Nov 2023 06:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 15:33:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com>
Message-ID: <CAMuHMdWd3XY8r-Db_JgazCin_xgSmTGttKzAaHGRKAXsM5xJOQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: errata: andes: Probe for IOCP only once in boot stage
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Yu Chien Peter Lin <peterlin@andestech.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_063405_087475_4FABA751 
X-CRM114-Status: GOOD (  30.64  )
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

SGkgUHJhYmhha2FyLAoKT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMTo1NuKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFdlIG5lZWQg
dG8gcHJvYmUgZm9yIElPQ1Agb25seSBvbmNlIGR1cmluZyBib290IHN0YWdlLCBhcyB3ZSB3ZXJl
IHByb2JpbmcKPiBmb3IgSU9DUCBmb3IgYWxsIHRoZSBzdGFnZXMgdGhpcyBjYXVzZWQgdGhlIGJl
bG93IGlzc3VlIGR1cmluZyBtb2R1bGUtaW5pdAo+IHN0YWdlLAo+Cj4gWzkuMDE5MTA0XSBVbmFi
bGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZm
ZmZmZmY4MTAwZDNhMAo+IFs5LjAyNzE1M10gT29wcyBbIzFdCj4gWzkuMDI5NDIxXSBNb2R1bGVz
IGxpbmtlZCBpbjogcmNhcl9jYW5mZCByZW5lc2FzX3VzYmhzIGkyY19yaWljIGNhbl9kZXYgc3Bp
X3JzcGkgaTJjX2NvcmUKPiBbOS4wMzc2ODZdIENQVTogMCBQSUQ6IDkwIENvbW06IHVkZXZkIE5v
dCB0YWludGVkIDYuNy4wLXJjMSsgIzU3Cj4gWzkuMDQzNzU2XSBIYXJkd2FyZSBuYW1lOiBSZW5l
c2FzIFNNQVJDIEVWSyBiYXNlZCBvbiByOWEwN2cwNDNmMDEgKERUKQo+IFs5LjA1MDMzOV0gZXBj
IDogcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4MTAvMHgzZQo+IFs5LjA1NTU1OF0gIHJh
IDogYW5kZXNfZXJyYXRhX3BhdGNoX2Z1bmMrMHg0YS8weDUyCj4gWzkuMDYwNDE4XSBlcGMgOiBm
ZmZmZmZmZjgwMDBkOGMyIHJhIDogZmZmZmZmZmY4MDAwZDk1YyBzcCA6IGZmZmZmZmM4MDAzYWJi
MDAKPiBbOS4wNjc2MDddICBncCA6IGZmZmZmZmZmODE0ZTI1YTAgdHAgOiBmZmZmZmZkODAzNjFl
NTQwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+IFs5LjA3NDc5NV0gIHQxIDogMDAwMDAwMDAwOTAw
MDMxZSB0MiA6IDAwMDAwMDAwMDAwMDAwMDEgczAgOiBmZmZmZmZjODAwM2FiYjIwCj4gWzkuMDgx
OTg0XSAgczEgOiBmZmZmZmZmZjAxNWI1N2M3IGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6IDAw
MDAwMDAwMDAwMDAwMDEKPiBbOS4wODkxNzJdICBhMiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiAw
MDAwMDAwMDAwMDAwMDAwIGE0IDogZmZmZmZmZmY4MTAwZDhiZQo+IFs5LjA5NjM2MF0gIGE1IDog
MDAwMDAwMDAwMDAwMDAwMSBhNiA6IDAwMDAwMDAwMDAwMDAwMDEgYTcgOiAwMDAwMDAwMDA5MDAw
MzFlCj4gWzkuMTAzNTQ4XSAgczIgOiBmZmZmZmZmZjAxNWI1N2Q3IHMzIDogMDAwMDAwMDAwMDAw
MDAwMSBzNCA6IDAwMDAwMDAwMDAwMDAzMWUKPiBbOS4xMTA3MzZdICBzNSA6IDgwMDAwMDAwMDAw
MDhhNDUgczYgOiAwMDAwMDAwMDAwMDAwNTAwIHM3IDogMDAwMDAwMDAwMDAwMDAzZgo+IFs5LjEx
NzkyNF0gIHM4IDogZmZmZmZmYzgwMDNhYmQ0OCBzOSA6IGZmZmZmZmZmMDE1YjExNDAgczEwOiBm
ZmZmZmZmZjgxNTFhMWIwCj4gWzkuMTI1MTEzXSAgczExOiBmZmZmZmZmZjAxNWIxMDAwIHQzIDog
MDAwMDAwMDAwMDAwMDAwMSB0NCA6IGZlZmVmZWZlZmVmZWZlZmYKPiBbOS4xMzIzMDFdICB0NSA6
IGZmZmZmZmZmMDE1YjU3YzcgdDYgOiBmZmZmZmZkOGI2M2E2MDAwCj4gWzkuMTM3NTg3XSBzdGF0
dXM6IDAwMDAwMDAyMDAwMDAxMjAgYmFkYWRkcjogZmZmZmZmZmY4MTAwZDNhMCBjYXVzZTogMDAw
MDAwMDAwMDAwMDAwZgo+IFs5LjE0NTQ2OF0gWzxmZmZmZmZmZjgwMDBkOGMyPl0gcmlzY3Zfbm9u
Y29oZXJlbnRfc3VwcG9ydGVkKzB4MTAvMHgzZQo+IFs5LjE1MTk3Ml0gWzxmZmZmZmZmZjgwMDAy
N2U4Pl0gX2FwcGx5X2FsdGVybmF0aXZlcysweDg0LzB4ODYKPiBbOS4xNTc3ODRdIFs8ZmZmZmZm
ZmY4MDAwMjliZT5dIGFwcGx5X21vZHVsZV9hbHRlcm5hdGl2ZXMrMHgxMC8weDFhCj4gWzkuMTY0
MTEzXSBbPGZmZmZmZmZmODAwMDhmY2M+XSBtb2R1bGVfZmluYWxpemUrMHg1ZS8weDdhCj4gWzku
MTY5NTgzXSBbPGZmZmZmZmZmODAwODVjZDY+XSBsb2FkX21vZHVsZSsweGZkOC8weDE3OWMKPiBb
OS4xNzQ5NjVdIFs8ZmZmZmZmZmY4MDA4NjYzMD5dIGluaXRfbW9kdWxlX2Zyb21fZmlsZSsweDc2
LzB4YWEKPiBbOS4xODA5NDhdIFs8ZmZmZmZmZmY4MDA4NjdmNj5dIF9fcmlzY3Zfc3lzX2Zpbml0
X21vZHVsZSsweDE3Ni8weDJhOAo+IFs5LjE4NzM2NV0gWzxmZmZmZmZmZjgwODg5ODYyPl0gZG9f
dHJhcF9lY2FsbF91KzB4YmUvMHgxMzAKPiBbOS4xOTI5MjJdIFs8ZmZmZmZmZmY4MDg5MjBiYz5d
IHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHg2NAo+IFs5LjE5ODU3M10gQ29kZTogMDAwOSBiN2U5
IDY3OTcgMDE0ZCBhNzgzIDg1YTcgYzc5OSA0Nzg1IDA3MTcgMDEwMCAoMDEyMykgYWVmNwo+IFs5
LjIwNTk5NF0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4KPiBUaGlzIGlz
IGJlY2F1c2Ugd2UgY2FsbGVkIHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCgpIGZvciBhbGwg
dGhlIHN0YWdlcwo+IGR1cmluZyBJT0NQIHByb2JlLiByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0
ZWQoKSBmdW5jdGlvbiBzZXRzCj4gbm9uY29oZXJlbnRfc3VwcG9ydGVkIHZhcmlhYmxlIHRvIHRy
dWUgd2hpY2ggaGFzIGFuIGFubm90YXRpb24gc2V0IHRvCj4gIl9fcm9fYWZ0ZXJfaW5pdCIgZHVl
IHRvIHdoaWNoIHdlIHdlcmUgc2VlaW5nIHRoZSBhYm92ZSBzcGxhdC4gRml4IHRoaXMgYnkKPiBw
cm9iaW5nIGZvciBJT0NQIG9ubHkgb25jZSBpbiBib290IHN0YWdlIGJ5IGhhdmluZyBhIGJvb2xl
YW4gdmFyaWFibGUKPiBpc19pb2NwX3Byb2JlX2RvbmUgd2hpY2ggd2lsbCBiZSBzZXQgdG8gdHJ1
ZSB1cG9uIElPQ1AgcHJvYmUgaW4KPiBlcnJhdGFfcHJvYmVfaW9jcCgpIGFuZCB3ZSBiYWlsIG91
dCBlYXJseSBpZiBpc19pb2NwX3Byb2JlX2RvbmUgaXMgc2V0Lgo+Cj4gV2hpbGUgYXQgaXQgbWFr
ZSByZXR1cm4gdHlwZSBvZiBlcnJhdGFfcHJvYmVfaW9jcCgpIHRvIHZvaWQgYXMgd2Ugd2VyZQo+
IG5vdCBjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlIGluIGFuZGVzX2VycmF0YV9wYXRjaF9mdW5j
KCkuCj4KPiBGaXhlczogZTAyMWFlN2Y1MTQ1ICgicmlzY3Y6IGVycmF0YTogQWRkIEFuZGVzIGFs
dGVybmF0aXZlIHBvcnRzIikKPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gLS0tCj4gdjEtPnYyCj4gKiBBcyBS
SVNDVl9BTFRFUk5BVElWRVNfQk9PVCBzdGFnZSBjYW4gaGFwcGVuIHR3aWNlIGFkZCBhIGlzX2lv
Y3BfcHJvYmVfZG9uZQo+ICAgdmFyaWFibGUgdG8gcHJvYmUgZm9yIElPQ1Agb25seSBvbmNlLgo+
ICogVXBkYXRlZCBjb21taXQgbWVzc2FnZQo+ICogTWFrZSByZXR1cm4gdmFsdWUgb2YgZXJyYXRh
X3Byb2JlX2lvY3AoKSB0byB2b2lkCgpUaGFua3MgZm9yIHRoZSB1cGRhdGUhCgo+IC0tLSBhL2Fy
Y2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCj4gKysrIGIvYXJjaC9yaXNjdi9lcnJhdGEv
YW5kZXMvZXJyYXRhLmMKPiBAQCAtMzgsMjkgKzM4LDM2IEBAIHN0YXRpYyBsb25nIGF4NDVtcF9p
b2NwX3N3X3dvcmthcm91bmQodm9pZCkKPiAgICAgICAgIHJldHVybiByZXQuZXJyb3IgPyAwIDog
cmV0LnZhbHVlOwo+ICB9Cj4KPiAtc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX2lvY3AodW5zaWdu
ZWQgaW50IHN0YWdlLCB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQp
Cj4gK3N0YXRpYyB2b2lkIGVycmF0YV9wcm9iZV9pb2NwKHVuc2lnbmVkIGludCBzdGFnZSwgdW5z
aWduZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQo+ICB7Cj4gKyAgICAgICBz
dGF0aWMgYm9vbCBpc19pb2NwX3Byb2JlX2RvbmU7Cgpkb25lPwoKPiArCj4gICAgICAgICBpZiAo
IUlTX0VOQUJMRUQoQ09ORklHX0VSUkFUQV9BTkRFU19DTU8pKQo+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICBpZiAo
aXNfaW9jcF9wcm9iZV9kb25lKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4KCldoeSBub3Qg
a2VlcCBpdCBzaW1wbGUsIGFuZCBqdXN0IGRvCgogICAgZG9uZSA9IHRydWU7CgpoZXJlPwpDYW4g
YXJjaF9pZCBvciBpbXBpZCBzdWRkZW5seSBjaGFuZ2UsIHNvIHlvdSBoYXZlIHRvIHJlY2hlY2s/
CklmIHRoZSBTQkkgY2FsbCBpbiBheDQ1bXBfaW9jcF9zd193b3JrYXJvdW5kKCkgZmFpbHMsIGlz
IHRoZXJlIHJlYWxseQphIG5lZWQgdG8gdHJ5IGl0IGFnYWluIGxhdGVyPwoKPiAgICAgICAgIGlm
IChhcmNoX2lkICE9IEFOREVTVEVDSF9BWDQ1TVBfTUFSQ0hJRCB8fCBpbXBpZCAhPSBBTkRFU1RF
Q0hfQVg0NU1QX01JTVBJRCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsgICAg
ICAgICAgICAgICByZXR1cm47Cj4KPiAtICAgICAgIGlmICghYXg0NW1wX2lvY3Bfc3dfd29ya2Fy
b3VuZCgpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICBpZiAoIWF4
NDVtcF9pb2NwX3N3X3dvcmthcm91bmQoKSkgewo+ICsgICAgICAgICAgICAgICBpc19pb2NwX3By
b2JlX2RvbmUgPSB0cnVlOwo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICB9Cj4K
PiAgICAgICAgIC8qIFNldCB0aGlzIGp1c3QgdG8gbWFrZSBjb3JlIGNibyBjb2RlIGhhcHB5ICov
Cj4gICAgICAgICByaXNjdl9jYm9tX2Jsb2NrX3NpemUgPSAxOwo+ICAgICAgICAgcmlzY3Zfbm9u
Y29oZXJlbnRfc3VwcG9ydGVkKCk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIHRydWU7Cj4gKyAgICAg
ICBpc19pb2NwX3Byb2JlX2RvbmUgPSB0cnVlOwo+ICB9CgpHcntvZXRqZSxlZXRpbmd9cywKCiAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoK
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
