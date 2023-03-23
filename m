Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6987C76195
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VvLKhlTBWwJkcNb/JcX84PL0MNOS+JDZz6uYSi27XFU=; b=0sfipCwSMicfm5sysMy+a6voLc
	cV76VzQvXbK57W1NP9IFltWbRn22EJPC/4NRxGWjsmk4/fDaJZfU4eHzX/sE2USBCDq91hlKQ/J+Y
	fnHd41e4LgpizyC89JpnXo936Dqs9AV/E4hq96/DvwGbf+7Xh/YfU1L/uELMYIeVVJXHVsZyiKG4/
	OHObmLAyynNnCfCdeC0thUBizjLTtGRL0LibPyE2LuxcEnAoHB9mvlnlQo3Yx6mqf+i3VXu+DYkNX
	HTL39uy//m+Bb0gpU9i/wV7u7MyU2YERHWW1eTndBxDXPcX8DwVLzVML4nNWyo6F03S7n5rQd+XSd
	ZSthP0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfRq6-002wXF-0o;
	Thu, 23 Mar 2023 20:47:14 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfRpz-002wUp-02
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 20:47:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso3306716pjb.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1679604424;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33hr9ajSe0YnAiQJm19Ru2Vx/JgzBbQYDL+Eh3T+DxA=;
        b=uPUevAsTbPERMZ9UzPnMpWZpA6MU+hTx4tPsxMM/iRRtXOBRNmlA3gGW3k6X40ivbj
         ATIZujp9Ud08EWx/MXuArXsjtSW0P07Cy0p0WLChG7s6/WQKBzWyJXQ0GcPiMGhOL7YM
         vdUBGHPgPs32E03rhnYFNlkxy6U5OKk3Tv8nNeqndvShEF/u5hysNMcGgluxqTJi8o2p
         x7EdmcbmzjoXtrL8goRzRThlLgLIz24guwjPZAOZt1hxnYVGG407lREMog3KH2bpVXFm
         t20/8GNAVrvWRmJs4NT4Kdh3zXuVEWg8NXJGwnbUJP0ae0yjxoLSu1bdNbbtcagVUGWF
         bz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679604424;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33hr9ajSe0YnAiQJm19Ru2Vx/JgzBbQYDL+Eh3T+DxA=;
        b=XoUq3kq3ZxkSYE2xa1XLpNJm8uEKX6vWNuPAnLeoiIw16svULV29gB8ic12JOzRw0H
         NSV4uUgqYho1+2hbfgJqkNFeDVHe4Ms5V9qHbKQ8HPFbFm/YndeTfaAeVm0LFoQgVYdM
         85uayC5h/ltQ/S5ojrmiE2FAN+fuL9ZyDFR3WXGJgrYIABFrKOKqdwf4MhYXmpNDFte0
         tJUNMJKCiDH28rRwTVKEmIoaFEPAkmj635L0Pv3whow31WhRBXAOk9AKtTxHbic7xRDp
         XPSZNZl2NElXX+QyiTrae/0P2b4CoO+GMYYMvl03obUvW0IAIcFhUu7l+v6cwZzcKgNQ
         PsjQ==
X-Gm-Message-State: AO0yUKVuF2zBUNqEgSc8maTorMptACLbZlirAou3t7hqX7JH3lUhoxWe
	ea15jDCQCuWjdekgis+iTbVhQw==
X-Google-Smtp-Source: AKy350a2H1I2/v0FEd3V8KcFa8dpdbVCUU1EG1EKaQttqOIB2bp1YpHz8060guGvg4wLLvbqK16S9g==
X-Received: by 2002:a17:90b:3b4d:b0:234:7ccf:3c7c with SMTP id ot13-20020a17090b3b4d00b002347ccf3c7cmr288308pjb.9.1679604423897;
        Thu, 23 Mar 2023 13:47:03 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l5-20020a17090a4d4500b00233aacab89esm1639744pjh.48.2023.03.23.13.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 13:47:03 -0700 (PDT)
Date: Thu, 23 Mar 2023 13:47:03 -0700 (PDT)
X-Google-Original-Date: Thu, 23 Mar 2023 13:46:06 PDT (-0700)
Subject: Re: [PATCH v2] riscv: mm: Fix incorrect ASID argument when flushing TLB
In-Reply-To: <mhng-41e9d23d-0d17-4b38-ba7c-1f8369f157d7@palmer-ri-x1c9>
CC: zongbox@gmail.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  guoren@kernel.org, sergey.matyukevich@syntacore.com, aou@eecs.berkeley.edu,
  Paul Walmsley <paul.walmsley@sifive.com>, x5710999x@gmail.com, tim609@andestech.com, peterlin@andestech.com,
  ycliang@andestech.com, Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dylan@andestech.com
Message-ID: <mhng-6b5819a5-7587-415b-bf97-badb96e106a9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_134707_277553_F7F04095 
X-CRM114-Status: GOOD (  31.48  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMSBNYXIgMjAyMyAyMjo0NToxNyBQRFQgKC0wNzAwKSwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gTW9uLCAyMCBNYXIgMjAyMyAxOTo0MjozNyBQRFQgKC0wNzAwKSwgZHlsYW5A
YW5kZXN0ZWNoLmNvbSB3cm90ZToKPj4gT24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMDM6Mjc6MzBQ
TSArMDgwMCwgRHlsYW4gSmhvbmcgd3JvdGU6Cj4+PiBPbiBUdWUsIE1hciAxNCwgMjAyMyBhdCAx
MDoyMjo0M0FNICswODAwLCBab25nIExpIHdyb3RlOgo+Pj4gPiBEeWxhbiBKaG9uZyA8ZHlsYW5A
YW5kZXN0ZWNoLmNvbT4g5pa8IDIwMjPlubQz5pyIMTPml6Ug6YCx5LiAIOS4i+WNiDEyOjI55a+r
6YGT77yaCj4+PiA+ID4KPj4+ID4gPiBDdXJyZW50bHksIHdlIHBhc3MgdGhlIENPTlRFWFRJRCBp
bnN0ZWFkIG9mIHRoZSBBU0lEIHRvIHRoZSBUTEIgZmx1c2gKPj4+ID4gPiBmdW5jdGlvbi4gV2Ug
c2hvdWxkIG9ubHkgdGFrZSB0aGUgQVNJRCBmaWVsZCB0byBwcmV2ZW50IGZyb20gdG91Y2hpbmcK
Pj4+ID4gPiB0aGUgcmVzZXJ2ZWQgYml0IGZpZWxkLgo+Pj4gPiA+Cj4+PiA+ID4gRml4ZXM6IDNm
MWU3ODI5OThjZCAoInJpc2N2OiBhZGQgQVNJRC1iYXNlZCB0bGJmbHVzaGluZyBtZXRob2RzIikK
Pj4+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEeWxhbiBKaG9uZyA8ZHlsYW5AYW5kZXN0ZWNoLmNvbT4K
Pj4+ID4gPiAtLS0KPj4+ID4KPj4+ID4gSGkgRHlsYW4sCj4+PiA+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCwgaWYgSSByZW1lbWJlciBjb3JyZWN0bHksIHRoZXJlIHdhcyBhIHBhdGNoIGZyb20KPj4+
ID4gQWxpc3RhaXIgRnJhbmNpcyBkaWQgdGhlIHNpbWlsYXIgZml4LiBQZXJoYXBzIHdlIHNob3Vs
ZCB0cmFjayB0aGF0Cj4+PiA+IHBhdGNoIHRvIHNlZSB3aHkgaXQgZG9lc24ndCBiZSBtZXJnZWQu
IFRoYW5rcy4KPj4+ID4KPj4+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWls
L2xpbnV4LXJpc2N2LzIwMjItTWFyY2gvMDEzNTU4Lmh0bWwKPj4+ID4KPj4+IEhpIFpvbmcsCj4+
PiBUaGFua3MgZm9yIHRoZSByZW1pbmRlciwgSSBkaWRuJ3Qgbm90aWNlIHRoYXQgQWxpc3RhaXIg
aGFkIHNlbnQgdGhlIHNhbWUgcGF0Y2ggYmVmb3JlLgo+Pj4KPj4+IEhpIFBhbG1lciwgQWxpc3Rh
aXIKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8y
MDIyLU1hcmNoLzAxMzU5Ny5odG1sCj4+PiBUaGlzIHBhdGNoIGRvZXMgbm90IHNlZW0gdG8gYmUg
Y2hlcnJ5LXBpY2tlZCBiYWNrIHRvIHRoZSByZWxlYXNlZCBsaW51eCBrZXJuZWwsCj4+PiBhbmQg
SSBoYXZlIG5vdCBzZWVuIHRoZSB2NCBwYXRjaC4gTWF5IEkgYXNrIGhvdyBpcyB0aGUgZm9sbG93
LXVwIHByb2dyZXNzIG9mIHRoaXMgcGF0Y2g/Cj4KPiBTb3JyeSBhYm91dCB0aGF0LCBJIGd1ZXNz
IEkgbGVmdCBpdCBraW5kIG9mIHZhZ3VlIGFzIHRvIHdobyB3YXMgZG9pbmcKPiB3aGF0LiAgSXQg
bG9va3MgbGlrZSB3ZSd2ZSBlbmRlZCB1cCB3aXRoIGVub3VnaCBpbmNsdWRlcyB0aGF0IHYzCj4g
YWN0dWFsbHkgYnVpbGRzIG5vdywgaXQncyBxdWV1ZWQgdXAgYW5kIHNob3VsZCBlbmQgdXAgaW4g
Zml4ZXMgdG9tb3Jyb3cKPiBtb3JuaW5nLgoKVHVybnMgb3V0IHRoYXQgb25lIHN0aWxsIGZhaWxz
IHNvbWUgY29uZmlncywgYW5kIHRoZSBvbmUgcG9zdGVkIGhlcmUgCmRvZXNuJ3QuICAgU28gSSd2
ZSBnb3QgdGhlIG5ldyBvbmUgb24gZml4ZXMuCgpUaGFua3MhCgo+Cj4gVGhhbmtzIQo+Cj4+Pgo+
Pj4gQmVzdCwKPj4+IER5bGFuCj4+Pgo+Pgo+PiBIaSBQYWxtZXIsCj4+Cj4+IFBpbmcuIEFueSB1
cGRhdGUgb24gdGhpcz8KPj4KPj4gQmVzdCwKPj4gRHlsYW4KPj4KPj4+ID4gPiBDaGFuZ2VzIGZy
b20gdjI6Cj4+PiA+ID4gLSBSZW1vdmUgdW5zdWVkIEVYUE9SVF9TWU1CT0woKQo+Pj4gPiA+IC0t
LQo+Pj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAyICsrCj4+PiA+
ID4gIGFyY2gvcmlzY3YvbW0vY29udGV4dC5jICAgICAgICAgICB8IDIgKy0KPj4+ID4gPiAgYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgMiArLQo+Pj4gPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+ID4gPgo+Pj4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPj4+ID4gPiBpbmRleCA5MDdiOWVmZDM5YTguLjU5N2Q2
ZDhhZWMyOCAxMDA2NDQKPj4+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZs
dXNoLmgKPj4+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPj4+
ID4gPiBAQCAtMTIsNiArMTIsOCBAQAo+Pj4gPiA+ICAjaW5jbHVkZSA8YXNtL2VycmF0YV9saXN0
Lmg+Cj4+PiA+ID4KPj4+ID4gPiAgI2lmZGVmIENPTkZJR19NTVUKPj4+ID4gPiArZXh0ZXJuIHVu
c2lnbmVkIGxvbmcgYXNpZF9tYXNrOwo+Pj4gPiA+ICsKPj4+ID4gPiAgc3RhdGljIGlubGluZSB2
b2lkIGxvY2FsX2ZsdXNoX3RsYl9hbGwodm9pZCkKPj4+ID4gPiAgewo+Pj4gPiA+ICAgICAgICAg
X19hc21fXyBfX3ZvbGF0aWxlX18gKCJzZmVuY2Uudm1hIiA6IDogOiAibWVtb3J5Iik7Cj4+PiA+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jIGIvYXJjaC9yaXNjdi9tbS9j
b250ZXh0LmMKPj4+ID4gPiBpbmRleCA4MGNlOWNhYmE4ZDIuLjZkMWFlYjA2M2U4MSAxMDA2NDQK
Pj4+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+Pj4gPiA+ICsrKyBiL2FyY2gv
cmlzY3YvbW0vY29udGV4dC5jCj4+PiA+ID4gQEAgLTIyLDcgKzIyLDcgQEAgREVGSU5FX1NUQVRJ
Q19LRVlfRkFMU0UodXNlX2FzaWRfYWxsb2NhdG9yKTsKPj4+ID4gPgo+Pj4gPiA+ICBzdGF0aWMg
dW5zaWduZWQgbG9uZyBhc2lkX2JpdHM7Cj4+PiA+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIG51
bV9hc2lkczsKPj4+ID4gPiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgYXNpZF9tYXNrOwo+Pj4gPiA+
ICt1bnNpZ25lZCBsb25nIGFzaWRfbWFzazsKPj4+ID4gPgo+Pj4gPiA+ICBzdGF0aWMgYXRvbWlj
X2xvbmdfdCBjdXJyZW50X3ZlcnNpb247Cj4+PiA+ID4KPj4+ID4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4+PiA+ID4g
aW5kZXggY2U3ZGZjODFiYjNmLi5iYTRjMjcxODdjOTUgMTAwNjQ0Cj4+PiA+ID4gLS0tIGEvYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jCj4+PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVz
aC5jCj4+PiA+ID4gQEAgLTI3LDcgKzI3LDcgQEAgc3RhdGljIHZvaWQgX19zYmlfdGxiX2ZsdXNo
X3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+Pj4gPiA+
ICAgICAgICAgLyogY2hlY2sgaWYgdGhlIHRsYmZsdXNoIG5lZWRzIHRvIGJlIHNlbnQgdG8gb3Ro
ZXIgQ1BVcyAqLwo+Pj4gPiA+ICAgICAgICAgYnJvYWRjYXN0ID0gY3B1bWFza19hbnlfYnV0KGNt
YXNrLCBjcHVpZCkgPCBucl9jcHVfaWRzOwo+Pj4gPiA+ICAgICAgICAgaWYgKHN0YXRpY19icmFu
Y2hfdW5saWtlbHkoJnVzZV9hc2lkX2FsbG9jYXRvcikpIHsKPj4+ID4gPiAtICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBhc2lkID0gYXRvbWljX2xvbmdfcmVhZCgmbW0tPmNvbnRleHQuaWQp
Owo+Pj4gPiA+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBhdG9taWNfbG9u
Z19yZWFkKCZtbS0+Y29udGV4dC5pZCkgJiBhc2lkX21hc2s7Cj4+PiA+ID4KPj4+ID4gPiAgICAg
ICAgICAgICAgICAgLyoKPj4+ID4gPiAgICAgICAgICAgICAgICAgICogVExCIHdpbGwgYmUgaW1t
ZWRpYXRlbHkgZmx1c2hlZCBvbiBoYXJ0cyBjb25jdXJyZW50bHkKPj4+ID4gPiAtLQo+Pj4gPiA+
IDIuMzQuMQo+Pj4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
