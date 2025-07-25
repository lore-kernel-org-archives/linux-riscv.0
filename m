Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD479C87FCD
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPE2Tmyleu1of8Nk1xBQcSERQpgk1yMR/QQJWKnw7i0=; b=fYcnU4VoYMF5t4
	gucrS9dcvATBXheSc8301IUZO/fJij+vFPsmxQp3kJ5wH78r+JCnkKIl63tZouybThrCpSuLBZREz
	TS/PaQRiEwehm85dwTYwPvpdBlMQ5yG/gwRzru0AKS6XmRG0nXMFQBuWtyYKlTEsu1U7lLbDSC5RG
	+z/41GUa9/BE8UfLwHfMtHUCZ/J3g2zaIe73kFn8rFGBVyoTz8War8vTtRL3MtsEeqsaiNjR1xKKW
	mJO6+9R5RAppOpjgAexCdDeB3wXT6hk1Gq25CYvGripmajKeOQ2skLdtFh2W+TatBxWVQYJhqDedJ
	onpiQzUZS9od5vYncwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufF4C-00000009U7b-1VXk;
	Fri, 25 Jul 2025 09:50:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufF3Z-00000009U5y-3zpl
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 09:49:39 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso3821880a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753436976; x=1754041776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+QogGvDSzP05F9z4DFbDysLCaCmeaQSN6DrVd5j6fY=;
        b=fL6/dddogKTpT8ocZoBgN8s7RvgBSF2Qcbh7xUmd83pEMf78Xn/Z3aEgsjeZLfLDk0
         wHyZeZNMnmQMyMOBsCNws60gRJokjpGEap8NoOfatqfdHLdye3GtlC7kp3YKAuBckkVZ
         Gecy/dWUVVJYVd552E/gBdlNHpyUb6wR2AklilL4vJwVwZ4STuYD0ODQwHxrsQzsY9HS
         v9uHlqGwwkRXJt7hROsvYuTYn2h0n4/6XeLuVf7tEn19bV+e3g6FOAEr+nhNAyLW0MZ6
         0ZYPnaDQMvapxnuo9I0kW10vVZIsoSTWjSto8Le7XR/gqF+2W/5Id+5tbZbKXTA89UAP
         4kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753436976; x=1754041776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+QogGvDSzP05F9z4DFbDysLCaCmeaQSN6DrVd5j6fY=;
        b=m5/82wjFnxBhs2Fg+sppMNLG67uXDWSnU2gYS7KwQ/7uxyOR4uy/IFBdsmNE+8M4/n
         4tkjkLGRd7+A5Mx4vqcBJa1roQwJeNGi/uORjB8AQ1VJXGcBD+zxq2zyf9SBAhz62Wxv
         tCh9cC6VCc2q5wpIiujxN4wPJ80NFtcfhAmuwdNTfqnfAks/MW6HUGxrGDzzuaXYtjSl
         +gkC4MypF5Itb7MC7m9VFURx5nUuMqE/YqN9HqB6D0PXXTQQe39hh7PaUaCbjwRJDhlL
         HyhOI7J3hH3liyAP3JBp2eUqh0jqtP/axbEiy9xuCOGWWM8/mb/EXuVKWfeWPULLq+MV
         PSDw==
X-Forwarded-Encrypted: i=1; AJvYcCU2YxiHjkOsl8g6W5L0Bd7Tnb/m7iozUWABd2L0pcEIj6bOX7RyzeLWgVWxRiM1xnyr2zzgcdy9ZmfZjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlbZTYAeqvOw0PZIbWvIm+Pk6M524PVkuyxhTbkwMQW/24qdbH
	zynUkc+gusaOh10qWplIfp/6+4G65bLO6aj7vwjlAExKYu+dyDZCpjul+mX3833WsXLPY7u6M2C
	KyiKu08CN7Kt1c5AiDYehrQ2aHIVZztpN6rZYsgc=
X-Gm-Gg: ASbGncv8ZNgezAyesrwoqoSwEEF/Fu2ivZtDh+TjLQvGlrKGnvTmcPlj7FNZR6ezky0
	Q/y8zhqXJPqbt4gmSZaFjspqlAARiDi8AkrL36FsbOU5usmLJ3kMsjz/qxaSoQ3IgL81rzazSTu
	SzndMAUjm3XG3lSUnV2hqe5pCeGsvoha7Gtc75EA2PkijUI7LIOYyU7GLF8agFKFltOP1fC1pQl
	jSs
X-Google-Smtp-Source: AGHT+IHbQhmoPTowDtuv9MyQr+06tJmA20b2rQw8QzJfj9UkT5NQyxB3bOjfSQshD1HsIkfy6JYzIIixC3o72OjLS3Q=
X-Received: by 2002:a17:907:96a4:b0:ae3:5e2a:493 with SMTP id
 a640c23a62f3a-af6196064fbmr155836066b.49.1753436975879; Fri, 25 Jul 2025
 02:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
 <e4d9cac8-f7e0-4f69-85ac-19cba4a612c9@riscstar.com>
In-Reply-To: <e4d9cac8-f7e0-4f69-85ac-19cba4a612c9@riscstar.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 25 Jul 2025 15:19:18 +0530
X-Gm-Features: Ac12FXyLmbtHl6m_gAHAKxjdQmSiJjupIJX-J6mWVKAmZAYjo54yCmxxq2UJkcA
Message-ID: <CANAwSgQKQUxejwPTrsn=VgDjrsQc4qvKBrVJeWOirf-EtngDFg@mail.gmail.com>
Subject: Re: spacemit: P1 PMIC support on Banana pi F3 testing
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, 
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_024937_992901_4229D23D 
X-CRM114-Status: GOOD (  27.59  )
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

SGkgQWxleCwKCk9uIEZyaSwgMjUgSnVsIDIwMjUgYXQgMDc6MjYsIEFsZXggRWxkZXIgPGVsZGVy
QHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4KPiBPbiA3LzI0LzI1IDQ6NTYgQU0sIEFuYW5kIE1vb24g
d3JvdGU6Cj4gPiBIaSBBbGV4LAo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciB3b3JrIG9uIHRo
ZSBQMSBQTUlDIHBhdGNoIGZvciBTcGFjZW1pdCBLMSBTb0MgLSBCYW5hbmEgUGkgRjMuCj4gPgo+
ID4gSSd2ZSBiZWVuIHRlc3RpbmcgeW91ciBwYXRjaCBzZXJpZXMgZm9yIHRoZSBCYW5hbmEgUGkg
RjMgWzBdIHRvIGVuYWJsZSBTRCBjYXJkCj4gPiBhbmQgZU1NQyBmdW5jdGlvbmFsaXR5LAo+ID4K
PiA+IFswXSBodHRwczovL3BhdGNoZXcub3JnL2xpbnV4LzIwMjUwNzEwMTc1MTA3LjEyODAyMjEt
MS1lbGRlckByaXNjc3Rhci5jb20vCj4gPgo+ID4gV2hpbGUgZGVidWdnaW5nLCBJIGNyb3NzLXJl
ZmVyZW5jZWQgdGhlIHBhdGNoIHdpdGggdGhlIEJQSS1GMy1WMyBib2FyZAo+ID4gc2NoZW1hdGlj
IFsxXQo+ID4gYW5kIG5vdGljZWQgc2V2ZXJhbCBkaXNjcmVwYW5jaWVzIGluIHRoZSBwb3dlciBj
b25maWd1cmF0aW9uOgo+ID4KPiA+IFsxXSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9k
LzE5aUxKNXhuQ0Jfb0s4VmVRamtQR2p6QW4zOVdZeXlsdi92aWV3Cj4gPgo+ID4gSW5jb3JyZWN0
IFZvbHRhZ2UgUmFuZ2VzOiBUaGUgbWluaW11bSBhbmQgbWF4aW11bSB2b2x0YWdlIHZhbHVlcyBm
b3IKPiA+IG11bHRpcGxlIHJlZ3VsYXRvcnMKPiA+IChpbmNsdWRpbmcgQlVDS3MsIEFMRE9zLCBh
bmQgRExET3MpIEluIHRoZSBwYXRjaCwgZG8gbm90IG1hdGNoIHRoZQo+ID4gc3BlY2lmaWNhdGlv
bnMgaW4KPiA+IHRoZSBzY2hlbWF0aWMncyBwb3dlciB0cmVlLgo+Cj4gSSByZWFsbHkgYXBwcmVj
aWF0ZSB5b3UgY2hlY2tpbmcgdGhpcy4KPgo+IFRoZSB2YWx1ZXMgSSB1c2VkIHdlcmUgZGVyaXZl
ZCBmcm9tIHRoZSB2ZW5kb3IgY29kZSB0aGF0IEkKPiBzdGFydGVkIHdpdGguICBJIHdhcyBhc3N1
cmVkIHRoYXQgdGhpcyBiYXNlbGluZSB3b3JrZWQgb24KPiB0aGUgQmFuYW5hIFBpIEJQSS1GMy4K
PgpJIGFtIGp1c3QgZm9sbG93aW5nIGV4YW1wbGVzIGZyb20gU29DIGxpa2UgUm9ja2NoaXAgYW5k
IFNhbXN1bmcuCgo+IEZvciB0aGUgcmVjb3JkLCBJICpkbyogaGF2ZSBhIGZ1bmN0aW9uaW5nIFNE
IGNhcmQgYW5kIGVNTUMuCj4gSSdtIG5vdCBzdXJlIGp1c3Qgbm93IHdoYXQgeW91IGFyZSB1c2lu
ZyBkaWZmZXJzIGZyb20gd2hhdAo+IEkgYW0gdXNpbmcuCj4KPiBJIHdvdWxkIGxpa2UgdG8gdW5k
ZXJzdGFuZCBhbmQgcmVjb25jaWxlIHRoZSBkaWZmZXJlbmNlcyB5b3UKPiBwb2ludCBvdXQgYnV0
IEknbSBub3QgYWJsZSB0byBkbyB0aGF0IGF0IHRoaXMgdGltZTsgbWF5YmUKPiBuZXh0IHdlZWsu
CgpZb3UgYXJlIHVzaW5nIHRoZSBkZWZhdWx0ICByYW5nZXMgIDAuNX4zLjRWQDMuNUEuCkJ1dCBp
biB0aGUgc2NoZW1hdGljJ3MgcG93ZXIgdHJlZSwgY29tcG9uZW50cyBzdWNoIGFzIFAxIChVMTQw
MSkgYW5kIEsxIChVeHh4KQpzcGVjaWZ5IHByZWNpc2Ugdm9sdGFnZSByYW5nZXMsIGZvciBleGFt
cGxlOgowLjnigK9W4oCvwrHigK8xJQoxLjjigK9W4oCvwrHigK8xJQozLjPigK9W4oCvwrHigK8x
JQoKVGhlc2Ugc2FtZSB2b2x0YWdlIHZhbHVlcyBtdXN0IGJlIGFjY3VyYXRlbHkgcmVmbGVjdGVk
IGluIHRoZSBkZXZpY2UgdHJlZSBub2RlCmRlZmluaXRpb25zIHRvIGVuc3VyZSB0aGF0IGFsbCBy
ZWd1bGF0b3JzIHN1cHBseSB0aGUgY29ycmVjdCB2b2x0YWdlCmxldmVscyB0byBkb3duc3RyZWFt
CmNvbXBvbmVudHMuIExhYmVscyBhcmUgdXNlZCB0byBtYXAgZWFjaCByZWd1bGF0b3IgdG8gaXRz
IGNvcnJlc3BvbmRpbmcKaW50ZXJuYWwgbm9kZQppbiB0aGUgZGV2aWNlIHRyZWUuIFVzaW5nIGFw
cHJvcHJpYXRlIGFuZCBjb25zaXN0ZW50IG5hbWVzIGFsbG93cwp0aGVzZSByZWd1bGF0b3JzIHRv
IGJlCmVhc2lseSB0cmFja2VkLiBUaGlzIG1hcHBpbmcgaGVscHMgaW4gdmFsaWRhdGluZyBjb25m
aWd1cmF0aW9ucyB1c2luZwp0aGUgcmVndWxhdG9yX3N1bW1hcnksCndoaWNoIGRpc3BsYXlzIHRo
ZSBhY3RpdmUgcmVndWxhdG9yIHN0YXRlcy4KCkZvciBleGFtcGxlCiQgc3VkbyBjYXQgL3N5cy9r
ZXJuZWwvZGVidWcvcmVndWxhdG9yL3JlZ3VsYXRvcl9zdW1tYXJ5CiByZWd1bGF0b3IgICAgICAg
ICAgICAgICAgICAgICAgdXNlIG9wZW4gYnlwYXNzICBvcG1vZGUgdm9sdGFnZQpjdXJyZW50ICAg
ICBtaW4gICAgIG1heAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHJlZ3VsYXRvci1k
dW1teSAgICAgICAgICAgICAgICAgIDYgICAgNSAgICAgIDAgdW5rbm93biAgICAgMG1WCjBtQSAg
ICAgMG1WICAgICAwbVYKICAgIDEyNTAwMDAwLnBoeS12YnVzLWJvb3N0ICAgICAgIDIKMG1BICAg
ICAwbVYgICAgIDBtVgogICAgMTI1MDAwMDAucGh5LXZidXMgICAgICAgICAgICAgMgowbUEgICAg
IDBtViAgICAgMG1WCiAgICAxMjEwMDAwMC5waHktdmJ1cy1ib29zdCAgICAgICAyCjBtQSAgICAg
MG1WICAgICAwbVYKICAgIDEyMTAwMDAwLnBoeS12YnVzICAgICAgICAgICAgIDIKMG1BICAgICAw
bVYgICAgIDBtVgogICAgMTIxMzAwMDAucGh5LXZidXMgICAgICAgICAgICAgMQowbUEgICAgIDBt
ViAgICAgMG1WCiB2ZGRfbGRvMSAgICAgICAgICAgICAgICAgICAgICAgICAxICAgIDAgICAgICAw
IHVua25vd24gIDEwMDBtVgowbUEgIDEwMDBtViAgMTAwMG1WCiB2ZGRfbGRvMiAgICAgICAgICAg
ICAgICAgICAgICAgICAxICAgIDAgICAgICAwIHVua25vd24gIDE4MDBtVgowbUEgIDE4MDBtViAg
MTgwMG1WCiB2ZGRxX21tYzAgICAgICAgICAgICAgICAgICAgICAgICAwICAgIDAgICAgICAwIHVu
a25vd24gIDE4MDBtVgowbUEgIDE4MDBtViAgMTgwMG1WCiB2ZGRfYWRjICAgICAgICAgICAgICAg
ICAgICAgICAgICAxICAgIDEgICAgICAwIHVua25vd24gIDE4MDBtVgowbUEgIDE4MDBtViAgMTgw
MG1WCgo+Cj4gWW91IHNheSB0aGUgbmFtZXMgZG9uJ3QgbWF0Y2guICBGcm9tIHdoYXQgSSBjYW4g
dGVsbCwgeW91cgo+IG5hbWVzIGFyZSBsaWtlICJkMWQwIiAoRCBvbmUgRCB6ZXJvKSByYXRoZXIg
dGhhbiAiZGxkbyIKPiAoRCBMIEQgTyksIGFuZCB3aGF0IEkgc2VlIGluIHRoZSBkb2N1bWVudCB5
b3UgbGluayB0byB1c2VzCj4gYWxsIGxldHRlcnMuICBJZiBJJ20gbWlzdW5kZXJzdGFuZGluZywg
cGxlYXNlIGV4cGxhaW4uCj4KSSBtaWdodCBoYXZlIHVzZWQgYW4gaW5jb3JyZWN0IG5hbWUgZHVl
IHRvIGEgdHlwbyBlYXJsaWVyLgpCYXNlZCBvbiB0aGUgc2NoZW1hdGljLCB0aGUgY29ycmVjdCBy
ZWd1bGF0b3IgbmFtZXMgYXJlIEJVQ0sxLCBBTERPMSwgYW5kIERMRE8xLgp5b3UgY2FuIHVzZSBp
dCBhY2NvcmRpbmdseS4KCj4gVGhhbmtzLgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC1BbGV4ClRoYW5rcwotQW5hbmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
