Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752C1C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 12:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4u7FKj1Ti9ECSTMtwOBJyFxRu5TQGWs4j0QzFd8Mw8=; b=t1F60rXWYAPF6U
	xo+k+4dbG23Fs1dKPKy5oBrdmsHTA7rD330Q7H9UMFhylfeJ5ibSclDI0DvaJFbohf+7NpRpkrSzX
	5lzj3cpVmcynnnotsCnc69SNqYnEVBltDstNeZkO5tohngboXudrpGbpkaojExUNSCOaQJIi1VE01
	Bc8WBV4fe212X3uJL/446YRdjNc+o4Pn/0DoCE6kzzw8pUsYgLACvu1vGeyxSvLZnaTWTlqLFwF0o
	Nn6nC8ZG+mL+d+KDuP8ipqvEGMXeilcBIv1MCRMb9RR4wnXHjw76WTFOusTqC4s4BhTZ/S8ro9jJ9
	ezU7n9E9P0elbNgehMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgliv-00Aqch-30;
	Mon, 27 Mar 2023 12:13:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglis-00Aqas-1F
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 12:13:16 +0000
Received: by mail-ed1-x52f.google.com with SMTP id er18so24008793edb.9
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1679919189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmNpIzNfG612nyW1bhVMjBSrVg7n0oMr5DFwLjMDXpE=;
        b=cDuZhRwmRdhUa9PzYQnOCAO7avYp1p9ucMyD4vRrNtYqFQH5bgn8DVtNCyN8Qj4VvK
         Asm62i1lbAsqclKyYuS3dfTXUyh00QL2T/stsE3b2Sx0N8SRs+tJ9SGS+Vd2KbNV0AkX
         hw5CANHrzIrrTa3/Xs5D/jhnTJGcP6yRjgC43pz3p7TszeSxD3bfSJhV3+0o/n8EwzHe
         RWrKtvOzwdR4bheDoXFRJzlxwxj0jRwFB5NOdkOOcyb/PW3p7Q9XAVObF8UjkAq4VFBQ
         8Qjv9GhEUT9yAZav3rQsZ81tg86EZG2r/2oPfCWa6/I27FUSJkIxRD8AekAxurhA0GDL
         dYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679919189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmNpIzNfG612nyW1bhVMjBSrVg7n0oMr5DFwLjMDXpE=;
        b=Zc4cj4PpZZthGME1HpxoYEfWMkzcHVlBkvY7A+cnC9GQOeVeO0fW77ckKXSbF4Vjdg
         7C+8tYhYAzFfiow+A8FLuB+kOgSWas2SPPu+MZg5+/ZU/a7b4DL6HWy2STNMHCHs13V9
         m8tFxC+24KzX7KqZQdal8Q+Wt4X8dFCRCgbnHA4NThQASUvgIGq24/Qcnz7k8Hu0fcQ6
         AmbMJTaonE3NBpwDDwANNwCtJuZVI4AHO1/PhfDN6SE+A+TSsDaxfelgqwhdRnIC5JPi
         WuX2qA4J0CgRSSH7/VHtJOAM0qEbw/SWU/q50VPCR8NWHN4ODEV77t3rp0hBeKHFupV8
         V/pA==
X-Gm-Message-State: AAQBX9e7CokM3P9O1viH9S0rxLHx5jwRE5gpubB1kIqoGAJvPgXbqYND
	w/Bz634aa2EHD+bziJVX3qQDEHl13kifwwuloq+DPQ==
X-Google-Smtp-Source: AKy350bq3aqC/oOrLVqEUOhMcf2gp9/VAl1K+i1eN1DDWpJ/F20bJSOj2ABZt74p8o9I/6yRHACDjsmJwyg3dDlkhfc=
X-Received: by 2002:a50:bac5:0:b0:4ab:49b9:686d with SMTP id
 x63-20020a50bac5000000b004ab49b9686dmr5596204ede.1.1679919188663; Mon, 27 Mar
 2023 05:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230324155421.271544-1-alexghiti@rivosinc.com>
In-Reply-To: <20230324155421.271544-1-alexghiti@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Mar 2023 17:42:57 +0530
Message-ID: <CAAhSdy3L59sUK3nniio8iWvAAR13cMzvXDX+wxyjEOajuuEhxw@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051314_423238_F147D585 
X-CRM114-Status: GOOD (  26.99  )
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgOToyNOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGludGVuZHMgdG8gaW1w
cm92ZSB0bGIgdXRpbGl6YXRpb24gYnkgdXNpbmcgaHVnZXBhZ2VzIGZvcgo+IHRoZSBsaW5lYXIg
bWFwcGluZy4KPgo+IEFzIHJlcG9ydGVkIGJ5IEFudXAgaW4gdjYsIHdoZW4gU1RSSUNUX0tFUk5F
TF9SV1ggaXMgZW5hYmxlZCwgd2UgbXVzdAo+IHRha2UgY2FyZSBvZiBpc29sYXRpbmcgdGhlIGtl
cm5lbCB0ZXh0IGFuZCByb2RhdGEgc28gdGhhdCB0aGV5IGFyZSBub3QKPiBtYXBwZWQgd2l0aCBh
IFBVRCBtYXBwaW5nIHdoaWNoIHdvdWxkIHRoZW4gYXNzaWduIHdyb25nIHBlcm1pc3Npb25zIHRv
Cj4gdGhlIHdob2xlIHJlZ2lvbjogaXQgaXMgYWNoaWV2ZWQgdGhlIHNhbWUgd2F5IGFzIGFybTY0
IGJ5IHVzaW5nIHRoZQo+IG1lbWJsb2NrIG5vbWFwIEFQSSB3aGljaCBpc29sYXRlcyB0aG9zZSBy
ZWdpb25zIGFuZCByZS1tZXJnZSB0aGVtIGFmdGVyd2FyZHMKPiB0aHVzIGF2b2lkaW5nIGFueSBp
c3N1ZSB3aXRoIHRoZSBzeXN0ZW0gcmVzb3VyY2VzIHRyZWUgY3JlYXRpb24uCj4KPiBiYXNlLWNv
bW1pdC10YWc6IHY2LjMtcmMxCj4KPiB2OToKPiAtIFJlbW92ZSBuZXcgQVBJIGFuZCBhcm02NCBw
YXRjaGVzIGFzIGl0IGNyZWF0ZWQgbW9yZSBpc3N1ZXMgdGhhbiBpdAo+ICAgc29sdmVkLCB0aGFu
a3MgQW51cCBmb3IgcmVwb3J0aW5nIHRob3NlIGJ1Z3MhCj4gLSBBZGQgYSBwYXRjaCB0aGF0IG1v
dmVzIHRoZSBsaW5lYXIgbWFwcGluZyBjcmVhdGlvbiBvdXRzaWRlIG9mIHNldHVwX3ZtX2ZpbmFs
Cj4gLSBVc2Ugbm9tYXAgQVBJIGxpa2UgYXJtNjQKPiAtIFJlbW92ZWQgUkIgZnJvbSBBbmRyZXcg
YW5kIEFudXAgYXMgdGhlIHBhdGNoIGNoYW5nZWQgaXRzIGxvZ2ljCj4gLSBGaXgga2VybmVsIHJv
ZGF0YSBzaXplIGNvbXB1dGF0aW9uCj4KPiB2ODoKPiAtIEZpeCBydjMyLCBhcyByZXBvcnRlZCBi
eSBBbnVwCj4gLSBEbyBub3QgbW9kaWZ5IG1lbWJsb2NrX2lzb2xhdGVfcmFuZ2UgYW5kIGZpeGVz
IGNvbW1lbnQsIGFzIHN1Z2dlc3RlZCBieSBNaWtlCj4gLSBVc2UgdGhlIG5ldyBtZW1ibG9jayBB
UEkgZm9yIGNyYXNoIGtlcm5lbCB0b28gaW4gYXJtNjQsIGFzIHN1Z2dlc3RlZCBieSBBbmRyZXcK
PiAtIEZpeCBhcm02NCBkb3VibGUgbWFwcGluZyAod2hpY2ggdG8gbWUgZGlkIG5vdCB3b3JrIGlu
IHY3KSwgYnV0IGVuZHMgdXAgbm90Cj4gICBiZWluZyBwcmV0dHkgYXQgYWxsLCB3aWxsIHdhaXQg
Zm9yIGNvbW1lbnRzIGZyb20gYXJtNjQgcmV2aWV3ZXJzLCBidXQKPiAgIHRoaXMgcGF0Y2ggY2Fu
IGVhc2lseSBiZSBkcm9wcGVkIGlmIHRoZXkgZG8gbm90IHdhbnQgaXQuCj4KPiB2NzoKPiAtIEZp
eCBBbnVwIGJ1ZyByZXBvcnQgYnkgaW50cm9kdWNpbmcgbWVtYmxvY2tfaXNvbGF0ZV9tZW1vcnkg
d2hpY2gKPiAgIGFsbG93cyB1cyB0byBzcGxpdCB0aGUgbWVtYmxvY2sgbWFwcGluZ3MgYW5kIHRo
ZW4gYXZvaWQgdG8gbWFwIHRoZQo+ICAgdGhlIFBVRCB3aGljaCBjb250YWlucyB0aGUga2VybmVs
IGFzIHJlYWQgb25seQo+IC0gQWRkIGEgcGF0Y2ggdG8gYXJtNjQgdG8gdXNlIHRoaXMgbmV3bHkg
aW50cm9kdWNlZCBBUEkKPgo+IHY2Ogo+IC0gcXVpZXQgTExWTSB3YXJuaW5nIGJ5IGNhc3Rpbmcg
cGh5c19yYW1fYmFzZSBpbnRvIGFuIHVuc2lnbmVkIGxvbmcKPgo+IHY1Ogo+IC0gRml4IG5vbW11
IGJ1aWxkcyBieSBnZXR0aW5nIHJpZCBvZiByaXNjdl9wZm5fYmFzZSBpbiBwYXRjaCAxLCB0aGFu
a3MKPiAgIENvbm9yCj4gLSBBZGQgUkIgZnJvbSBBbmRyZXcKPgo+IHY0Ogo+IC0gUmViYXNlIG9u
IHRvcCBvZiB2Ni4yLXJjMywgYXMgbm90ZWQgYnkgQ29ub3IKPiAtIEFkZCBBY2tlZC1ieSBSb2IK
Pgo+IHYzOgo+IC0gQ2hhbmdlIHRoZSBjb21tZW50IGFib3V0IGluaXRyZF9zdGFydCBWQSBjb252
ZXJzaW9uIHNvIHRoYXQgaXQgZml0cwo+ICAgQVJNNjQgYW5kIFJJU0NWNjQgKGFuZCBvdGhlcnMg
aW4gdGhlIGZ1dHVyZSBpZiBuZWVkZWQpLCBhcyBzdWdnZXN0ZWQKPiAgIGJ5IFJvYgo+Cj4gdjI6
Cj4gLSBBZGQgYSBjb21tZW50IG9uIHdoeSBSSVNDVjY0IGRvZXMgbm90IG5lZWQgdG8gc2V0IGlu
aXRyZF9zdGFydC9lbmQgdGhhdAo+ICAgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2VzcywgYXMgYXNr
ZWQgYnkgUm9iCj4KPiBBbGV4YW5kcmUgR2hpdGkgKDMpOgo+ICAgcmlzY3Y6IEdldCByaWQgb2Yg
cmlzY3ZfcGZuX2Jhc2UgdmFyaWFibGUKPiAgIHJpc2N2OiBNb3ZlIHRoZSBsaW5lYXIgbWFwcGlu
ZyBjcmVhdGlvbiBpbiBpdHMgb3duIGZ1bmN0aW9uCj4gICByaXNjdjogVXNlIFBVRC9QNEQvUEdE
IHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBpbmcKCkkgaGF2ZSB0ZXN0ZWQgdGhpcyBzZXJpZXMg
YWdhaW4gb24gUUVNVSBSVjY0IGFuZCBSVjMyLiBJIGFsc28gdHJpZWQKS1ZNIFJWNjQgYW5kIFJW
MzIsIHRoaXMgd29ya3MgZmluZSBhcyB3ZWxsLgoKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BhZ2UuaCB8ICAxOSArKysrKystCj4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgIHwg
MTAyICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9tbS9w
aHlzYWRkci5jICAgICAgfCAgMTYgKysrKysrCj4gIGRyaXZlcnMvb2YvZmR0LmMgICAgICAgICAg
ICAgIHwgIDExICsrLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKSwgMzAg
ZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMzcuMgo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
