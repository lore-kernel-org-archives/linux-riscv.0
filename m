Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179F4C3DA5D
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 02:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sq9v0J6FSRiAKwky5VvY6Dnxe58PXc67r/JpYohNSw=; b=HkONzx2Q+sr6el
	0S4D2ms8I4BqF01jLLuZofEXcQTAQleBx3USpXHbogGqIUGCaDDPJf2rlx0xoU7V+WqrsmY1xg8Rj
	tYvKHrCnGw0gxSMzxfooDQ+KTXS9hLJuJXTyN3a3hObBYmC7GQij2GPE34Ptl7Zf3M/LVJycjyxJt
	i8vuACN0CBHYco1WrbylvLt6OtVqkZTZusA7dYBvd0DOPoJwK6esAkmygmRfW7UQ3h4UYzqcHhZzI
	Q3K515/b7DLWASLul8EzTKJ6wHUR+9wC15zaPIAyYkogHZ79i13D4yoO5U3m3PXcfN6KZyugy1nO1
	gz4COumrh2C0rS0BDPyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW542-0000000B7Nk-1DED;
	Tue, 23 Jul 2024 02:15:42 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW53y-0000000B7Mh-42nL
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 02:15:41 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2610623f445so2392843fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 19:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721700938; x=1722305738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJdZfAkdVNg0Q3730C/uHig6sfe5OttmDP7Ke1DUOwU=;
        b=hMhqf9TXNC5mNHu6GLuJGL0KX6iKkyO0oSRaV3QgHOso78OXS94VfBtiKLmxVCcAf1
         gGoMxK8ou5Pp0qx9qXF7Un0Yc7ULL48xX5Yy9UONNYcaaUP5gEIRTSsz4xwz5nkWWooz
         u1gYSMaPt1HHw/9GywpYfzaCIZyAQPdPRJjy3HAakbo7qupnPGRMFpZXpzpzXPQwHvd4
         G/RzBJE51A9S/oyYUC8WVfkMeOgL9CK8otyb5utoEnFBjLD417qnEBA9ppjXDHWjx92J
         /5UX+SK0Y5LHc6KNphc1dr1rWr5dcIQWiOo3pTW9CIYcNvPtPaluwRaD+x3Rbu6TkJ52
         Xh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721700938; x=1722305738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJdZfAkdVNg0Q3730C/uHig6sfe5OttmDP7Ke1DUOwU=;
        b=C+Dnk9rIChVHLKBHCjJUzPlCNJG/7dC5Of1AaZ1z4BoHsLO1e2grvfXCjQqTgGverO
         KcQ+WdZ4XFTeSkEj206w2g9Ego9/D6ZxYBJyjI0+YaT2Z0bijqfDcGRBC2ETUY96VL3E
         s2drDQXF0ni5qeE5DxV3ti5+YxoR6h+SZ783nG17WSjmu33ACgy/hGc7IqA8VLRBL6HX
         GNRM5LllPkmFjCB6BUQMp89I1fxfoYyTWxr/17MGVH6Lj2mwmgT88ZOQZrZjLy5wy5ZT
         2ZsdRVAIVXEYo5qkXUD6W9a0d9Qrs3C0jmLmqNSJv42TZuKhwXDIrpOlMhRozkYSSCIl
         eZoA==
X-Forwarded-Encrypted: i=1; AJvYcCU+/KXUboAAOeJVUP2cnKgeSXFaCIT7N/VfM1jtROmQsW2sw8VxOGghlIaojgqIUfBCbu1Q/SzhaFcv9JxR9IDkHHMOJC95NT+88Lxp2fp6
X-Gm-Message-State: AOJu0YyXwqk7Oof0ckPt7El0UcGXHhGSYsUSTX2g7EKJwq5kOZ0gauwS
	CJ97kepxCSCga6+xqHXFCvwXda2bdhfwigd3T9yopFGLYZjC0tIkufq9fgXpVfDppbkc7NaFDqh
	sKGjXejVOgGt+1GeTBXDEHv743UeiWOlEvVd1WA==
X-Google-Smtp-Source: AGHT+IFgpbVGn9CsI8xN/1EVf0wd3TbR54+Ws9lZ6TW/kxWDhj3Zfq1y+37Tr2mCsWlBgNY3lZVyku/q5trpn/3/hAI=
X-Received: by 2002:a05:6870:8196:b0:25e:24d5:4d54 with SMTP id
 586e51a60fabf-2612164d7admr8380917fac.35.1721700937722; Mon, 22 Jul 2024
 19:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240722042037.27934-1-cuiyunhui@bytedance.com> <20240722-pantyhose-salvaging-96faac4b4661@spud>
In-Reply-To: <20240722-pantyhose-salvaging-96faac4b4661@spud>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 23 Jul 2024 10:15:26 +0800
Message-ID: <CAEEQ3wn1NbZJXyr3KaRNisjtMjs8cPPa6hrZ80Zp4NMg46C_MQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] riscv/mm/fault: add show_pte() before die()
To: Conor Dooley <conor@kernel.org>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, surenb@google.com, 
	peterx@redhat.com, alexghiti@rivosinc.com, willy@infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_191539_033800_7B622B8D 
X-CRM114-Status: GOOD (  19.57  )
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

SGkgQ29ub3IsCgpPbiBUdWUsIEp1bCAyMywgMjAyNCBhdCAxOjI44oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDIyLCAyMDI0IGF0IDEy
OjIwOjM3UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBXaGVuIHRoZSBrZXJuZWwgZGlz
cGxheXMgIlVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0Cj4gPiB2aXJ0
dWFsIGFkZHJlc3MiLCB3ZSB3b3VsZCBsaWtlIHRvIGNvbmZpcm0gdGhlIHN0YXR1cyBvZiB0aGUg
dmlydHVhbAo+ID4gYWRkcmVzcyBpbiB0aGUgcGFnZSB0YWJsZS4gU28gYWRkIHNob3dfcHRlKCkg
YmVmb3JlIGRpZSgpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1
aUBieXRlZGFuY2UuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPgo+IFRoZSBwYXRjaHdvcmsgYXV0b21hdGlvbiByZXBvcnRzOgo+
ICsgICAgICAxIC4uL2FyY2gvcmlzY3YvbW0vZmF1bHQuYzozOTo0OiB3YXJuaW5nOiBmb3JtYXQg
c3BlY2lmaWVzIHR5cGUgJ3Vuc2lnbmVkIGxvbmcnIGJ1dCB0aGUgYXJndW1lbnQgaGFzIHR5cGUg
J3BoeXNfYWRkcl90JyAoYWthICd1bnNpZ25lZCBsb25nIGxvbmcnKSBbLVdmb3JtYXRdCk9rYXks
IEknbGwgdXBkYXRlIGl0IGluIHYzLgoKPgo+IENoZWVycywKPiBDb25vci4KPgo+ID4gLS0tCj4g
PiAgYXJjaC9yaXNjdi9tbS9mYXVsdC5jIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlzY3YvbW0v
ZmF1bHQuYwo+ID4gaW5kZXggNTIyNGYzNzMzODAyLi42NjZkMjgyYThiZjQgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQu
Ywo+ID4gQEAgLTIyLDYgKzIyLDU4IEBACj4gPgo+ID4gICNpbmNsdWRlICIuLi9rZXJuZWwvaGVh
ZC5oIgo+ID4KPiA+ICtzdGF0aWMgdm9pZCBzaG93X3B0ZSh1bnNpZ25lZCBsb25nIGFkZHIpCj4g
PiArewo+ID4gKyAgICAgcGdkX3QgKnBnZHAsIHBnZDsKPiA+ICsgICAgIHA0ZF90ICpwNGRwLCBw
NGQ7Cj4gPiArICAgICBwdWRfdCAqcHVkcCwgcHVkOwo+ID4gKyAgICAgcG1kX3QgKnBtZHAsIHBt
ZDsKPiA+ICsgICAgIHB0ZV90ICpwdGVwLCBwdGU7Cj4gPiArICAgICBzdHJ1Y3QgbW1fc3RydWN0
ICptbSA9IGN1cnJlbnQtPm1tOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFtbSkKPiA+ICsgICAgICAg
ICAgICAgbW0gPSAmaW5pdF9tbTsKPiA+ICsKPiA+ICsgICAgIHByX2FsZXJ0KCJDdXJyZW50ICVz
IHBndGFibGU6ICVsdUsgcGFnZXNpemUsICVkLWJpdCBWQXMsIHBnZHA9MHglMDE2bHhcbiIsCj4g
PiArICAgICAgICAgICAgICBjdXJyZW50LT5jb21tLCBQQUdFX1NJWkUvU1pfMUssIFZBX0JJVFMs
Cj4gPiArICAgICAgICAgICAgICAobW0gPT0gJmluaXRfbW0gPyBfX3BhX3N5bWJvbChtbS0+cGdk
KSA6Cj4gPiArICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyl2aXJ0X3RvX3BoeXMobW0tPnBn
ZCkpKTsKPiA+ICsKPiA+ICsgICAgIHBnZHAgPSBwZ2Rfb2Zmc2V0KG1tLCBhZGRyKTsKPiA+ICsg
ICAgIHBnZCA9IHBnZHBfZ2V0KHBnZHApOwo+ID4gKyAgICAgcHJfYWxlcnQoIlslMDE2bHhdIHBn
ZD0lMDE2bHgiLCBhZGRyLCBwZ2RfdmFsKHBnZCkpOwo+ID4gKyAgICAgaWYgKHBnZF9ub25lKHBn
ZCkgfHwgcGdkX2JhZChwZ2QpIHx8IHBnZF9sZWFmKHBnZCkpCj4gPiArICAgICAgICAgICAgIGdv
dG8gb3V0Owo+ID4gKwo+ID4gKyAgICAgcDRkcCA9IHA0ZF9vZmZzZXQocGdkcCwgYWRkcik7Cj4g
PiArICAgICBwNGQgPSBwNGRwX2dldChwNGRwKTsKPiA+ICsgICAgIHByX2NvbnQoIiwgcDRkPSUw
MTZseCIsIHA0ZF92YWwocDRkKSk7Cj4gPiArICAgICBpZiAocDRkX25vbmUocDRkKSB8fCBwNGRf
YmFkKHA0ZCkgfHwgcDRkX2xlYWYocDRkKSkKPiA+ICsgICAgICAgICAgICAgZ290byBvdXQ7Cj4g
PiArCj4gPiArICAgICBwdWRwID0gcHVkX29mZnNldChwNGRwLCBhZGRyKTsKPiA+ICsgICAgIHB1
ZCA9IHB1ZHBfZ2V0KHB1ZHApOwo+ID4gKyAgICAgcHJfY29udCgiLCBwdWQ9JTAxNmx4IiwgcHVk
X3ZhbChwdWQpKTsKPiA+ICsgICAgIGlmIChwdWRfbm9uZShwdWQpIHx8IHB1ZF9iYWQocHVkKSB8
fCBwdWRfbGVhZihwdWQpKQo+ID4gKyAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICsg
ICAgIHBtZHAgPSBwbWRfb2Zmc2V0KHB1ZHAsIGFkZHIpOwo+ID4gKyAgICAgcG1kID0gcG1kcF9n
ZXQocG1kcCk7Cj4gPiArICAgICBwcl9jb250KCIsIHBtZD0lMDE2bHgiLCBwbWRfdmFsKHBtZCkp
Owo+ID4gKyAgICAgaWYgKHBtZF9ub25lKHBtZCkgfHwgcG1kX2JhZChwbWQpIHx8IHBtZF9sZWFm
KHBtZCkpCj4gPiArICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+ID4gKyAgICAgcHRlcCA9
IHB0ZV9vZmZzZXRfbWFwKHBtZHAsIGFkZHIpOwo+ID4gKyAgICAgaWYgKCFwdGVwKQo+ID4gKyAg
ICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAgIHB0ZSA9IHB0ZXBfZ2V0KHB0ZXAp
Owo+ID4gKyAgICAgcHJfY29udCgiLCBwdGU9JTAxNmx4IiwgcHRlX3ZhbChwdGUpKTsKPiA+ICsg
ICAgIHB0ZV91bm1hcChwdGVwKTsKPiA+ICtvdXQ6Cj4gPiArICAgICBwcl9jb250KCJcbiIpOwo+
ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgdm9pZCBkaWVfa2VybmVsX2ZhdWx0KGNvbnN0IGNoYXIg
Km1zZywgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gICAgICAgICAgICAgICBzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKPiA+ICB7Cj4gPiBAQCAtMzEsNiArODMsNyBAQCBzdGF0aWMgdm9pZCBkaWVfa2Vy
bmVsX2ZhdWx0KGNvbnN0IGNoYXIgKm1zZywgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gICAgICAg
ICAgICAgICBhZGRyKTsKPiA+Cj4gPiAgICAgICBidXN0X3NwaW5sb2NrcygwKTsKPiA+ICsgICAg
IHNob3dfcHRlKGFkZHIpOwo+ID4gICAgICAgZGllKHJlZ3MsICJPb3BzIik7Cj4gPiAgICAgICBt
YWtlX3Rhc2tfZGVhZChTSUdLSUxMKTsKPiA+ICB9Cj4gPiAtLQo+ID4gMi4zOS4yCj4gPgo+ID4K
ClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
