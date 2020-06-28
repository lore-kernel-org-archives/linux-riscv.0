Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A566C433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 15:58:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1A420773
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 15:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zd7vJYrj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/G/JA6T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1A420773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MrYixByCiQImrRCCgDKHjrNdBOwg21TuJxAoPubyo/o=; b=Zd7vJYrjIBMPeuFaSdx0JTPfj
	LFDirkK1dFhuJmJs1C9jYTBPbDdA0EJn7wEfYI4UVBMjiQW2JfaBLFOr+2Cgg8vyIPYq7DUj7Gp2r
	2uNa6eWDkdOOWRH0csVk/xeTOj/qnpTZIOKpcCUs7xuluAImTOTPMsgFUBmKnIWTz9blHS5RBpcAJ
	eWVOEhb7BpDa0WvHBlZI5TJyADStOiYhmH9cZ9xhg2TecU6fEMHpxf7bC2NTVt4LQAxCjyi0+AeMd
	N6tdFWpqz36pyB3WhpSrq/4HPtBFRd52oe7Sr9N90cCR3oQNV+Z1kpJOD5TCf25YZzequVd7qKmuU
	F1fOll9vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpZhG-0007QF-Aq; Sun, 28 Jun 2020 15:58:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpZhD-0007Q0-Uf
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 15:58:20 +0000
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0795D20885
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593359898;
 bh=DtSgSNZ/Y8U3u/G8yXdkRl6jp5GXV8zZCwtET5iW7YQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m/G/JA6T3ERyNd0FPHSgEKS8tTNRsohOE46yfF7HKb6YY6w4ZT0/9dyr+ZQBO+Rcy
 5gBbOPMK/QF2j8Z2LUej1qJzRF3Ws9kW8GHyJAbvbC8yAx30F/Z/9mt3tFw8OYtyL6
 CIpjJ3lKhW8+7iD4QmR0L7FWf66sYiVyjIhVoFYc=
Received: by mail-lj1-f177.google.com with SMTP id e4so15433292ljn.4
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 08:58:17 -0700 (PDT)
X-Gm-Message-State: AOAM530lOG9eZ0YkEKBirGoMfLZLGrNjCxSoOsJ6/5bfy9y0hSOmJVEP
 4cbCb6kFFHHqtTC57myxnU8JgSgAOutH1zF8Sxo=
X-Google-Smtp-Source: ABdhPJw4kdL62d9Qc3oTqep1ffBfGno76ikBsgH8wOkGMZ5nl95LHD/hd+wQ0lUVl4czTIHBb//DO1un06L12zHH2/s=
X-Received: by 2002:a2e:a0cc:: with SMTP id f12mr5820411ljm.250.1593359896350; 
 Sun, 28 Jun 2020 08:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <1593274802-46332-1-git-send-email-guoren@kernel.org>
 <20200628115945.335b92c517cb8a8fa87be759@kernel.org>
 <CAJF2gTTCHMHp-+RoG8DoDhbJStzmOf5AK=Z3K26FUmd_hbgR=g@mail.gmail.com>
 <20200628235226.dbbe2256ea6e846abfb63feb@kernel.org>
In-Reply-To: <20200628235226.dbbe2256ea6e846abfb63feb@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 28 Jun 2020 23:58:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTaG6U-A9kwJotbgjYSkMUNsV=Wc-u4GM0i4zr2YCEX_A@mail.gmail.com>
Message-ID: <CAJF2gTTaG6U-A9kwJotbgjYSkMUNsV=Wc-u4GM0i4zr2YCEX_A@mail.gmail.com>
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

T24gU3VuLCBKdW4gMjgsIDIwMjAgYXQgMTA6NTIgUE0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFt
YXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIDI4IEp1biAyMDIwIDE0OjEyOjA3ICsw
ODAwCj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPiBPbiBTdW4sIEp1
biAyOCwgMjAyMCBhdCAxMDo1OSBBTSBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwu
b3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gU2F0LCAyNyBKdW4gMjAyMCAxNjoyMDowMiArMDAw
MAo+ID4gPiBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4KPiA+ID4gPiBGcm9tOiBHdW8g
UmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4KPiA+ID4gPiBVbmZvcnR1bmF0
ZWx5LCB0aGUgY3VycmVudCBjb2RlIGNvdWxkbid0IGJlIGNvbXBpbGVkLCBiZWNhdXNlCj4gPiA+
ID4gQlVJTERfQlVHX09OIG5lZWRzIGEgc3RhdGljIGRlZmluZWQgdmFsdWUsIG5vdCBhIGR5bmFt
aWMKPiA+ID4gPiB2YXJpYWJsZSB3aXRoIGEwIHJlZ3MuIEp1c3QgdXNlIGl0IGlubGluZSBhcyBh
IHNvbHV0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gICBDQyAgICAgIGFyY2gvcmlzY3Yva2VybmVsL3Bh
dGNoLm8KPiA+ID4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L2tlcm5l
bC5oOjExLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvbGlz
dC5oOjksCj4gPiA+ID4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9wcmVl
bXB0Lmg6MTEsCj4gPiA+ID4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9z
cGlubG9jay5oOjUxLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3Jpc2N2L2tl
cm5lbC9wYXRjaC5jOjY6Cj4gPiA+ID4gSW4gZnVuY3Rpb24g4oCYZml4X3RvX3ZpcnTigJksCj4g
PiA+ID4gICAgIGlubGluZWQgZnJvbSDigJhwYXRjaF9tYXDigJkgYXQgYXJjaC9yaXNjdi9rZXJu
ZWwvcGF0Y2guYzozNzoxNzoKPiA+ID4gPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozOTI6
Mzg6IGVycm9yOiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzIwNeKAmSBkZWNsYXJl
ZCB3aXRoIGF0dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxlZDogaWR4ID49IF9fZW5k
X29mX2ZpeGVkX2FkZHJlc3Nlcwo+ID4gPiA+ICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRp
b24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA+ID4gPiAuL2luY2x1ZGUvbGlu
dXgvY29tcGlsZXIuaDozNzM6NDogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX2Nv
bXBpbGV0aW1lX2Fzc2VydOKAmQo+ID4gPiA+ICAgICBwcmVmaXggIyMgc3VmZml4KCk7ICAgIFwK
PiA+ID4gPiAgICAgXn5+fn5+Cj4gPiA+ID4gLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6Mzky
OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZ
Cj4gPiA+ID4gICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0
aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+ID4gPiA+ICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+
ID4gPiA+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOTozNzogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmGNvbXBpbGV0aW1lX2Fzc2VydOKAmQo+ID4gPiA+ICAjZGVmaW5lIEJV
SUxEX0JVR19PTl9NU0coY29uZCwgbXNnKSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNn
KQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn4KPiA+ID4gPiAuL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6NTA6Mjogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19PTl9NU0figJkKPiA+ID4gPiAgIEJV
SUxEX0JVR19PTl9NU0coY29uZGl0aW9uLCAiQlVJTERfQlVHX09OIGZhaWxlZDogIiAjY29uZGl0
aW9uKQo+ID4gPiA+ICAgXn5+fn5+fn5+fn5+fn5+fgo+ID4gPiA+IC4vaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9maXhtYXAuaDozMjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJTERf
QlVHX09O4oCZCj4gPiA+ID4gICBCVUlMRF9CVUdfT04oaWR4ID49IF9fZW5kX29mX2ZpeGVkX2Fk
ZHJlc3Nlcyk7Cj4gPiA+ID4gICBefn5+fn5+fn5+fn4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiBDYzogTWFz
YW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KPiA+ID4gPiBDYzogWm9uZyBMaSA8
em9uZy5saUBzaWZpdmUuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5l
bC9wYXRjaC5jIHwgMyArLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gPiA+ID4gaW5kZXgg
ZDRhNjRkZi4uZjhlODRmMiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
YXRjaC5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ID4gPiA+IEBA
IC0yMCw3ICsyMCw3IEBAIHN0cnVjdCBwYXRjaF9pbnNuIHsKPiA+ID4gPiAgfTsKPiA+ID4gPgo+
ID4gPiA+ICAjaWZkZWYgQ09ORklHX01NVQo+ID4gPiA+IC1zdGF0aWMgdm9pZCAqcGF0Y2hfbWFw
KHZvaWQgKmFkZHIsIGludCBmaXhtYXApCj4gPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCAqcGF0
Y2hfbWFwKHZvaWQgKmFkZHIsIGludCBmaXhtYXApCj4gPiA+Cj4gPiA+IFdvdWxkIHdlIGJlIGJl
dHRlciB0byB1c2UgIl9fYWx3YXlzX2lubGluZSIgYXMgc2FtZSBhcyBmaXhfdG9fdmlydD8KPiA+
IE9rCj4gPgo+ID4gPiBBbmQgYWxzbywgY291bGQgeW91IGFkZCBhIGNvbW1lbnQgd2h5IHdlIG5l
ZWQgdG8gbWFrZSBpdCBpbmxpbmU/Cj4gPiBJJ3ZlIG1lbnRpb25lZCBpbiBjb21tZW50Ogo+ID4g
PiA+IEJVSUxEX0JVR19PTiBuZWVkcyBhIHN0YXRpYyBkZWZpbmVkIHZhbHVlLCBub3QgYSBkeW5h
bWljCj4gPiA+ID4gdmFyaWFibGUgd2l0aCBhMCByZWdzLgo+ID4KPiA+IGlkeCBtdXN0IGJlIGEg
Y29uc3QgdW5zaWduZWQgaW50IG9yIGl0IHdpbGwgY2F1c2UgY29tcGlsZSBlcnJvciB3aXRoCj4g
PiBCVUlMRF9CVUdfT04uCj4KPiBBaCwgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uIEkgbWVhbnQg
dGhlIGNvbW1lbnQgbGluZSBpbiB0aGUgY29kZS4KT2suCgo+IEJUVywgY2FuIHdlIGFsc28gdXNl
ICJjb25zdCB1bnNpZ25lZCBpbnQiIGZvciB0aGUgZml4bWFwIGluZGV4IHNvIHRoYXQKPiBubyBv
bmUgbWlzcyBpdCBhbnltb3JlPwpTdXJlLCBhY3R1YWxseSBJJ3ZlIGRvbmUgaXQgaW4gbXkgcGF0
Y2ggVjIuIFRoeCBmb3IgbWVudGlvbi4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
