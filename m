Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F89C433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 06:12:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17E5220702
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 06:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5p6/lQP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2pCwUgIs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17E5220702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X9fNP+uSEJyfcrzsw0t4XaejfUJ7fZvFzI1lXdXLxdM=; b=o5p6/lQPPvLxHt/XEuB6hx0uW
	0kwbmSCqe+VcvKBlS4ySAHbrCoTCj6Pv36BoWHMviX1wxgSqWXGbRZvShw6vVUNrNov0Ab7AIpt4P
	0QyVfGNMWuLsJpjHCTi/BwsIWA4skBc1c1zCYMPUOtofeexkdspU3zBq1bw1lOL5SZro1tQkweyTe
	cmp3z+wni41xAzP4KtNkQsFsJnEq9F8bjR8cgIbVQTj66U8O+zc/+DSImvPf9h4WKLIKmlRu/2Fl0
	oN+dlUEPmwx62SSNT6M+PULFzRCdo17ea9fk3xft5gFWGlG2L5kXlgmfSo1yqnfiQpimvut/nmDpi
	W5hwZgUkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpQYD-0006UH-1B; Sun, 28 Jun 2020 06:12:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpQYA-0006U3-7C
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 06:12:23 +0000
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4D1421473
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593324741;
 bh=MaEKsg6egy9Wkdm/kWLie4m5P0W1BsCSneDgGcQBAgA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2pCwUgIshw5Jtg7FSTHrUAsO6kRgUWtBjQnrG4PHqZuG209tR0M/HEl7lJy/l3bZn
 b6mh9um0+gZZzDvvMxA4eYO//saa3RTb4+A25vpywXFvYVqR8kPYzdNykzu9swHTQO
 gAdy5TY3BWaypBMHp8CoRz+uA68e5rSHkljZb0R8=
Received: by mail-lj1-f182.google.com with SMTP id n23so14440398ljh.7
 for <linux-riscv@lists.infradead.org>; Sat, 27 Jun 2020 23:12:20 -0700 (PDT)
X-Gm-Message-State: AOAM5334H4A3bbZTT/F/ij/DenrJoIWVW23lCU7q5hkSm+drvsfdNyDl
 /4U5VZyfn16U/rjH8lFwNxO4BAc7QyKhCQkOMlk=
X-Google-Smtp-Source: ABdhPJwOLXYcVriN4WTovhjiJ8y+DUyBj9KfGoziRBbU0PTHaerO/enEPu+Wtu+nCnBa4bct3gK+/AmZ+XdmTiuWaZ4=
X-Received: by 2002:a2e:2a42:: with SMTP id q63mr5541912ljq.265.1593324739220; 
 Sat, 27 Jun 2020 23:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <1593274802-46332-1-git-send-email-guoren@kernel.org>
 <20200628115945.335b92c517cb8a8fa87be759@kernel.org>
In-Reply-To: <20200628115945.335b92c517cb8a8fa87be759@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 28 Jun 2020 14:12:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTCHMHp-+RoG8DoDhbJStzmOf5AK=Z3K26FUmd_hbgR=g@mail.gmail.com>
Message-ID: <CAJF2gTTCHMHp-+RoG8DoDhbJStzmOf5AK=Z3K26FUmd_hbgR=g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup compile error BUILD_BUG_ON failed
To: Masami Hiramatsu <mhiramat@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdW4gMjgsIDIwMjAgYXQgMTA6NTkgQU0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFt
YXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIDI3IEp1biAyMDIwIDE2OjIwOjAyICsw
MDAwCj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4KPiA+IEZyb206IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBVbmZvcnR1bmF0ZWx5LCB0aGUgY3VycmVudCBj
b2RlIGNvdWxkbid0IGJlIGNvbXBpbGVkLCBiZWNhdXNlCj4gPiBCVUlMRF9CVUdfT04gbmVlZHMg
YSBzdGF0aWMgZGVmaW5lZCB2YWx1ZSwgbm90IGEgZHluYW1pYwo+ID4gdmFyaWFibGUgd2l0aCBh
MCByZWdzLiBKdXN0IHVzZSBpdCBpbmxpbmUgYXMgYSBzb2x1dGlvbi4KPiA+Cj4gPiAgIENDICAg
ICAgYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2gubwo+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4v
aW5jbHVkZS9saW51eC9rZXJuZWwuaDoxMSwKPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2lu
Y2x1ZGUvbGludXgvbGlzdC5oOjksCj4gPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRl
L2xpbnV4L3ByZWVtcHQuaDoxMSwKPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUv
bGludXgvc3BpbmxvY2suaDo1MSwKPiA+ICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3Jpc2N2
L2tlcm5lbC9wYXRjaC5jOjY6Cj4gPiBJbiBmdW5jdGlvbiDigJhmaXhfdG9fdmlydOKAmSwKPiA+
ICAgICBpbmxpbmVkIGZyb20g4oCYcGF0Y2hfbWFw4oCZIGF0IGFyY2gvcmlzY3Yva2VybmVsL3Bh
dGNoLmM6Mzc6MTc6Cj4gPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozOTI6Mzg6IGVycm9y
OiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzIwNeKAmSBkZWNsYXJlZCB3aXRoIGF0
dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxlZDogaWR4ID49IF9fZW5kX29mX2ZpeGVk
X2FkZHJlc3Nlcwo+ID4gICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2Nv
bXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCj4gPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozNzM6NDog
bm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQo+
ID4gICAgIHByZWZpeCAjIyBzdWZmaXgoKTsgICAgXAo+ID4gICAgIF5+fn5+fgo+ID4gLi9pbmNs
dWRlL2xpbnV4L2NvbXBpbGVyLmg6MzkyOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDi
gJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZCj4gPiAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0
aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18pCj4gPiAgIF5+fn5+
fn5+fn5+fn5+fn5+fn4KPiA+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOTozNzogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNvbXBpbGV0aW1lX2Fzc2VydOKAmQo+ID4gICNk
ZWZpbmUgQlVJTERfQlVHX09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCghKGNv
bmQpLCBtc2cpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+Cj4gPiAuL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6NTA6Mjogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19PTl9NU0figJkKPiA+ICAgQlVJTERf
QlVHX09OX01TRyhjb25kaXRpb24sICJCVUlMRF9CVUdfT04gZmFpbGVkOiAiICNjb25kaXRpb24p
Cj4gPiAgIF5+fn5+fn5+fn5+fn5+fn4KPiA+IC4vaW5jbHVkZS9hc20tZ2VuZXJpYy9maXhtYXAu
aDozMjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJTERfQlVHX09O4oCZCj4g
PiAgIEJVSUxEX0JVR19PTihpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzKTsKPiA+ICAg
Xn5+fn5+fn5+fn5+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4
LmFsaWJhYmEuY29tPgo+ID4gQ2M6IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5v
cmc+Cj4gPiBDYzogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgYXJj
aC9yaXNjdi9rZXJuZWwvcGF0Y2guYyB8IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9wYXRjaC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ID4gaW5kZXggZDRh
NjRkZi4uZjhlODRmMiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMK
PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiA+IEBAIC0yMCw3ICsyMCw3IEBA
IHN0cnVjdCBwYXRjaF9pbnNuIHsKPiA+ICB9Owo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX01NVQo+
ID4gLXN0YXRpYyB2b2lkICpwYXRjaF9tYXAodm9pZCAqYWRkciwgaW50IGZpeG1hcCkKPiA+ICtz
dGF0aWMgaW5saW5lIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFwKQo+Cj4g
V291bGQgd2UgYmUgYmV0dGVyIHRvIHVzZSAiX19hbHdheXNfaW5saW5lIiBhcyBzYW1lIGFzIGZp
eF90b192aXJ0PwpPawoKPiBBbmQgYWxzbywgY291bGQgeW91IGFkZCBhIGNvbW1lbnQgd2h5IHdl
IG5lZWQgdG8gbWFrZSBpdCBpbmxpbmU/CkkndmUgbWVudGlvbmVkIGluIGNvbW1lbnQ6Cj4gPiBC
VUlMRF9CVUdfT04gbmVlZHMgYSBzdGF0aWMgZGVmaW5lZCB2YWx1ZSwgbm90IGEgZHluYW1pYwo+
ID4gdmFyaWFibGUgd2l0aCBhMCByZWdzLgoKaWR4IG11c3QgYmUgYSBjb25zdCB1bnNpZ25lZCBp
bnQgb3IgaXQgd2lsbCBjYXVzZSBjb21waWxlIGVycm9yIHdpdGgKQlVJTERfQlVHX09OLgoKLyoK
ICogJ2luZGV4IHRvIGFkZHJlc3MnIHRyYW5zbGF0aW9uLiBJZiBhbnlvbmUgdHJpZXMgdG8gdXNl
IHRoZSBpZHgKICogZGlyZWN0bHkgd2l0aG91dCB0cmFuc2xhdGlvbiwgd2UgY2F0Y2ggdGhlIGJ1
ZyB3aXRoIGEgTlVMTC1kZWZlcmVuY2UKICoga2VybmVsIG9vcHMuIElsbGVnYWwgcmFuZ2VzIG9m
IGluY29taW5nIGluZGljZXMgYXJlIGNhdWdodCB0b28uCiAqLwpzdGF0aWMgX19hbHdheXNfaW5s
aW5lIHVuc2lnbmVkIGxvbmcgZml4X3RvX3ZpcnQoY29uc3QgdW5zaWduZWQgaW50IGlkeCkKewog
ICAgICAgIEJVSUxEX0JVR19PTihpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzKTsKICAg
ICAgICByZXR1cm4gX19maXhfdG9fdmlydChpZHgpOwp9CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
