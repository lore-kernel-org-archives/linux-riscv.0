Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA90CC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Dec 2022 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6q0/++GV68fRYUJYZf4DFiECPYf398eZhY5qbBEZSFI=; b=BltlU2/PZl/Fwo
	nnfRHr/nwQtdxqKNVr8H29QxGx5SzxAqwmf5xJfA/07/BIbjfYiJJwEjjBKKyzFOMMn0Tn29d7kPP
	dFO6riLAaTNLhpEbBww8CD3wHEYWojTQ3SGAPGgx2LRwsLPHvuxKlv8vX7sgdUU1kLhfLAr3XUscW
	bcoAP10icvciXyfMsouOQU4hBO7SHRQt7JzoOGuLzOuq1tyuzfiRVByJ5/BALZSNmMrpH0j7WhNpr
	Ttc0ORVX5YWr2dsdpgV+A7DxDyMfY1W4oQsUSF3aqvDy7vup8LV0dXtJS1jlod4gOA3tpGpzP/oFe
	NcIZtvnR/DoMte7e9F6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6ySJ-003hQ7-VD; Sun, 18 Dec 2022 18:32:12 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6yS4-003hPG-HF
	for linux-riscv@lists.infradead.org; Sun, 18 Dec 2022 18:31:58 +0000
Received: by mail-qt1-x835.google.com with SMTP id a16so6725891qtw.10
        for <linux-riscv@lists.infradead.org>; Sun, 18 Dec 2022 10:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6KoHvcGTx1RcWeXNiJbyqXJGMqsYoj3r/slahxN0do=;
        b=AXETmQ2+NJJH9dhNzAPwQ0s/HvEQF7jcqqUCJVlG45c91ucHbLsnCqKo61bi/1AxsV
         WbR8WRagXpTp0rVjwLIGQM30a1S47wrJW+Z1j9N+MPtFq9WWws7hma6/BRHw66QW8T4q
         G67j+3VBYBNneXjsrJNhe2zVwMTBr7TMKLIr0VHkXMfEE3awqCSAUF2M6Sc52bhm+mFh
         YKlC38KVcYTaDIXKmZQdv5bEnmiiBi+jROD5I/dc3yzAGrlFvxG4ikTdVFfY177W3DhC
         xki87bEvgwQydNUbKwT9qKQ+0846myxixMIMjFqKO6k3hZUiG0ixF+V8OxXRwD2vw8pf
         FXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6KoHvcGTx1RcWeXNiJbyqXJGMqsYoj3r/slahxN0do=;
        b=KgwFGw9qiFaQzVg8azgOPHGQhJMTWSD5qKtBPNgp+cySMzLTcO57JrKjr1ozGAXPgr
         zkaW9vTfn/T6JZS1c9OkxCC6iRsK9mYCFSIqiqTDw7MilMVVfOlEovzlAkN1poRVCK8R
         +5gUQ6vtr/RlE21xCvPHAbxAIDo0asdDchbfyaFwHN6/ocu8Ym8QQ8IdmvkbkOgQA2r+
         q2Xx+X1bPlAFDM06KSYVEjfp9gOperooLaw3hI6yFK18V3DFW8P2Ka8N4NjTpkVn7hFs
         TEnCoX+YZna9GMyHi2YOB1QsxdExrR1wC/HgqpUBpcyIPlXGrFrgZO84CGzAnseWiCNP
         5lFQ==
X-Gm-Message-State: ANoB5plB/IExWcbuxwMXu0QnDnV3HmxvLSfjKb0CzIzOnKV6iMp4Fi8f
	9JEb7h+so/cxosyuPhmBVCAEPkw30bRdOUyWvpMATA==
X-Google-Smtp-Source: AA0mqf5ABkKhlDT/MO5rrqjzXb8ZbVq5G52EEI25mfQE+l9Q5TztddrpvmEjk73i7QcTQ8HFrykkl5VMG32NOyDWolA=
X-Received: by 2002:ac8:754e:0:b0:3a7:e16a:6a7 with SMTP id
 b14-20020ac8754e000000b003a7e16a06a7mr17572456qtr.288.1671388310693; Sun, 18
 Dec 2022 10:31:50 -0800 (PST)
MIME-Version: 1.0
References: <20220830193701.1702962-1-maskray@google.com> <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu> <20221115004625.x4wl6zbg4iiuxl5t@google.com>
 <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com> <3ec9737e-3d1a-c014-b91a-0e2d406a3b3d@csgroup.eu>
In-Reply-To: <3ec9737e-3d1a-c014-b91a-0e2d406a3b3d@csgroup.eu>
From: Fangrui Song <maskray@google.com>
Date: Sun, 18 Dec 2022 10:31:39 -0800
Message-ID: <CAFP8O3KZTkSbxXJ2yWt4w-F3xWHY_owCs03wN3Bhss57O-E_JQ@mail.gmail.com>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_103156_614188_FFA82874 
X-CRM114-Status: GOOD (  18.80  )
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

T24gU3VuLCBEZWMgNCwgMjAyMiBhdCA4OjU4IEFNIENocmlzdG9waGUgTGVyb3kKPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4KPgo+Cj4gTGUgMDQvMTIvMjAyMiDDoCAwNTo1
MCwgRmFuZ3J1aSBTb25nIGEgw6ljcml0IDoKPiA+IE9uIE1vbiwgTm92IDE0LCAyMDIyIGF0IDQ6
NDYgUE0gRmFuZ3J1aSBTb25nIDxtYXNrcmF5QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4g
T24gMjAyMi0xMS0xNCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiA+Pj4KPiA+Pj4KPiA+Pj4g
TGUgMjgvMDkvMjAyMiDDoCAwNzoyNSwgRmFuZ3J1aSBTb25nIGEgw6ljcml0IDoKPiA+Pj4+IE9u
IFNhdCwgU2VwIDEwLCAyMDIyIGF0IDEyOjUzIEFNIEZhbmdydWkgU29uZyA8bWFza3JheUBnb29n
bGUuY29tPiB3cm90ZToKPiA+Pj4+Pgo+ID4+Pj4+IE9uIDIwMjItMDgtMzAsIEZhbmdydWkgU29u
ZyB3cm90ZToKPiA+Pj4+Pj4gVGhlIGFjdHVhbCBpbnRlbnRpb24gaXMgdGhhdCBubyBkeW5hbWlj
IHJlbG9jYXRpb24gZXhpc3RzLiBIb3dldmVyLCBzb21lCj4gPj4+Pj4+IEdOVSBsZCBwb3J0cyBw
cm9kdWNlIHVubmVlZGVkIFJfKl9OT05FLiAoSWYgYSBwb3J0IGlzIG5vdCBjYXJlIGVub3VnaCB0
bwo+ID4+Pj4+PiBkZXRlcm1pbmUgdGhlIGV4YWN0IC5yZWxbYV0uZHluIHNpemUsIHRoZSB0cmFp
bGluZyB6ZXJvcyBiZWNvbWUgUl8qX05PTkUKPiA+Pj4+Pj4gcmVsb2NhdGlvbnMuIEUuZy4gcG93
ZXJwYzY0bGUgbGQgYXMgb2YgMi4zOCBoYXMgdGhlIGlzc3VlIHdpdGgKPiA+Pj4+Pj4gZGVmY29u
ZmlnLikgUl8qX05PTkUgYXJlIGdlbmVyYWxseSBuby1vcCBpbiB0aGUgZHluYW1pYyBsb2FkZXJz
LiBTbyBqdXN0Cj4gPj4+Pj4+IGlnbm9yZSB0aGVtLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBXaXRoIHRo
ZSBjaGFuZ2UsIHdlIGNhbiByZW1vdmUgQVJDSF9SRUxfVFlQRV9BQlMuIEFSQ0hfUkVMX1RZUEVf
QUJTIGlzIGEKPiA+Pj4+Pj4gYml0IG1pc25vbWVyIGFzIHBvcnRzIG1heSBjaGVjayBSRUxBVkVU
SVZFL0dMT0JfREFUL0pVTVBfU0xPVCB3aGljaCBhcmUKPiA+Pj4+Pj4gbm90IGNhbGxlZCAiYWJz
b2x1dGUgcmVsb2NhdGlvbnMiLiAoVGhlIHBhdGNoIGlzIG1vdGl2YXRlZCBieSB0aGUgYXJtNjQK
PiA+Pj4+Pj4gcG9ydCBtaXNzaW5nIFJfQUFSQ0g2NF9SRUxBVElWRS4pCj4gPj4+Pj4+Cj4gPj4+
Pj4+IFdoaWxlIGhlcmUsIHJlcGxhY2UgImVncmVwIiB3aXRoICJncmVwIiBhcyAiZWdyZXAiIGlz
IGRlcHJlY2F0ZWQgaW4gR05VCj4gPj4+Pj4+IGdyZXAgMy43Lgo+ID4+Pj4+Pgo+ID4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBGYW5ncnVpIFNvbmcgPG1hc2tyYXlAZ29vZ2xlLmNvbT4KPiA+Pj4+Pj4g
LS0tCj4gPj4+Pj4+IFsuLi5dCj4gPj4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBQaW5nLgo+ID4+Pj4K
PiA+Pj4+IFBpbmdeMiA6KQo+ID4+Pgo+ID4+PiBDYW4geW91IGV4cGxhaW4gd2hpY2ggQVJDSF9S
RUxfVFlQRV9BQlMgY2FuIGJlIHJlbW92ZWQgd2l0aCB0aGlzIGNoYW5nZSA/Cj4gPj4+IEhvdyBp
cyB0aGUgdmVyaWZpY2F0aW9uIGRvbmUgaWYgQVJDSF9SRUxfVFlQRV9BQlMgaXMgcmVtb3ZlZCA/
Cj4gPj4KPiA+PiBBbGwgQVJDSF9SRUxfVFlQRV9BQlMgcmVsb2NhdGlvbiB0eXBlcyBjYW4gYmUg
cmVtb3ZlZC4gQXMgZXhwbGFpbmVkLCB0aGUKPiA+PiByZWFsIGludGVudGlvbiBpcyB0byBjaGVj
ayBubyBkeW5hbWljIHJlbG9jYXRpb24sIGFuZCB0aGlzIGlzIGRvbmUgYnkKPiA+PiB0aGUgbmV3
Cj4KPiBXZWxsLCB0aGVyZSB3YXMgYSB0eXBvIGluIG15IHF1ZXN0aW9uLCBJIHdhbnRlZCB0byBh
c2sgJ3doeScsIG5vdCAnd2hpY2gnLgo+Cj4gPj4KPiA+PiAgICAgY21kX3Zkc29fY2hlY2sgPSBp
ZiAkKFJFQURFTEYpIC1yVyAkQCB8IGdyZXAgLXYgX05PTkUgfCBncmVwIC1xICJSX1x3Kl8iOyBc
Cj4gPj4KPiA+PiBpbiB0aGlzIHBhdGNoLgo+ID4+Cj4gPj4gZ3JlcCAtdiBfTk9ORSBpcyB0byB3
b3JrIGFyb3VuZCBzb21lIEdOVSBsZCBwb3J0cyAoYW5kIGxpa2VseSBvbGRlciByZWxlYXNlcwo+
ID4+IG9mIHNvbWUgcG9ydHMgZXZlbiBpZiB0aGVpciBsYXRlc3QgdmVyc2lvbnMgYXJlIGZpeGVk
KSB3aGljaCBwcm9kdWNlCj4gPj4gdW5uZWVkZWQgUl8qX05PTkUgZHluYW1pYyByZWxvY2F0aW9u
cy4KPiA+Cj4gPiBQaW5nIDopCj4KPiBPaywgdGhhdCBzZWVtcyB0byB3b3JrIG9uIHBvd2VycGMu
Cj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1PgoKVGhhbmtzLiBDYW4gYSBtYWludGFpbmVyIHBpY2sgdXAgdGhpcyBjb21taXQ/Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
