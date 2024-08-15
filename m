Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4242C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBOlSacOFtbkwrYCRFY9YfmBxiW9t5lQgw59Dfq8NFI=; b=cV7KyW7DgLTyz4
	qJiCs1aH9iminTXZtfoCJ5UXOy4a8BHcn0ZsE2Znew6mX9j4aMlrEv532CauavzGxU+jM87GWtXsf
	mKl5jCIF5IAml3OPjOehyTOo9L4vWUYjOOggkqRLPPOqOkRXAM7hJHj9M9321CWGe3QObBsazue2j
	Om979/NAAiNjIJKgpzJuBGykWHBuvLMqgqzIMElXJmn5hO7mMSg5DM6QuCzQHGxlk5NZJf6Jb+SSR
	ysOjZth2vzZKz5FeAtf/o5iAXXXnuV3sySW5yTsA8rci3B96sZKPM1TUyrMalQqynS0sc0/jf913B
	oPP+Yuq7W+aa/uIBe28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebHp-0000000AAxe-0bVE;
	Thu, 15 Aug 2024 14:17:09 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebHm-0000000AAx5-2zaU
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 14:17:08 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so121420466b.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 07:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723731424; x=1724336224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAVLP2QFhmGnxnmeTbf8eFIID24nsinWmxF9a6BsjI4=;
        b=BDlYywwxshKwDUc4psXaBjsUz43eTcOFvCYQ7R5Ts115IQTLLXeoAB9XHLWc6iffko
         lb3y90f2sYAdrJaisKBePhF5uOVGkMBJDaQBqgVOfhv5Cvr0tNcHokH4ooHXSWGKJyE7
         YfAlG3S57o/4I7sTND2TGWsfvUiOKByi8XHIREymLP7GY/G1Z7xTb+yAECahH1QylpS0
         Yzw1W2JoM7vZYWwkuQVBiZr4qZRyhQJODlT5V4Wiw5phlkDHxhXDjMrMCAYnmaK05jO5
         WsrqPyt4Ke2r1u0mMoQU/teXUoUFq+xGwtuFOewGigmAS+PwlR2SLQg9iwKETsmFQEPc
         mXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723731424; x=1724336224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAVLP2QFhmGnxnmeTbf8eFIID24nsinWmxF9a6BsjI4=;
        b=Qvz9PBicxcWxsam4f2456N5qc8yXXl4z5EAYLDe+oUb0OrO1r4QP5DcWuzY425V9+E
         jw2U3vVshavRhpQ0GS/XLPl8BN7+4UMwl/2WODKA1QW64fG5m2i98dflzI6C6D0AcJSp
         b13aP4U4roVPp9JrkYIWWYm8pG46f+xsmkbCa0NzbT9VwTUieCm4kZEcgmfqAEQ0zpu6
         7/r9dYpMRzOFbt5ysRQuh7G5XX7/ZL18C2ToZxdwaLwYuk3sc6RSgodIBSmuBOdUDe7l
         XDTZ2M6zMySZAjCXUthNpcoxVgm6X/ohuc21vcPBgj/1/8ACA3FSGQXzESHRuUMJLUuV
         10Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXttkVHEkupV+6g2jqyVgB2rjbWFM+xChUdcYV8B7nzeg4jqGUaF/1NhBzrAA0fha/vLyL3jvWiNwx1El5d1XNO0jfcjz2sVxK2vwKQ9xJX
X-Gm-Message-State: AOJu0YyueWGWbzsj/Dcg+RSPnh65cMM8fkE9UHbaTlWKf6otz7ARyso3
	3kjtEgVZ1F0YDjMh22wm0O5j7+HOrRIsAEaQoV5hJ/6TczcStajeZPL3/hcggLQ9BhgAwK4cKWC
	2sfvPfydaIAxMKihRQCfrfRL5djpT7glBy+v9aw==
X-Google-Smtp-Source: AGHT+IGZQZVkLs1R94f5r/cOZntuAVJ3giaLkP9ibYuSTl3FYwhnVnxfqxGmllCdLoMsajtZsF2ijZS0FEtKusHWF7c=
X-Received: by 2002:a17:907:f70b:b0:a7a:b895:656f with SMTP id
 a640c23a62f3a-a8366d44eefmr447980366b.38.1723731423795; Thu, 15 Aug 2024
 07:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx> <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx> <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com> <87h6blnaf1.ffs@tglx>
In-Reply-To: <87h6blnaf1.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 15 Aug 2024 19:46:52 +0530
Message-ID: <CAK9=C2V7oL023=u6nodJs76k_0yHZ8PTJs=n1QFqDWCcCnG9kw@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel.holland@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_071706_773740_AA81FCE7 
X-CRM114-Status: GOOD (  25.55  )
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

T24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgNzo0MeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDE1IDIwMjQgYXQgMDg6MzIsIFNh
bXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4gT24gMjAyNC0wOC0xNSA4OjE2IEFNLCBUaG9tYXMgR2xl
aXhuZXIgd3JvdGU6Cj4gPj4gWWVzLiBTbyB0aGUgcmlzY3YgdGltZXIgaXMgbm90IHdvcmtpbmcg
b24gdGhpcyB0aGluZyBvciBpdCBzdG9wcwo+ID4+IHNvbWVob3cuCj4gPgo+ID4gVGhhdCdzIGNv
cnJlY3QuIFdpdGggdGhlIChmaXJtd2FyZSkgZGV2aWNldHJlZSB0aGF0IEVtaWwgaXMgdXNpbmcs
IHRoZSBPcGVuU0JJCj4gPiBmaXJtd2FyZSBkb2VzIG5vdCBoYXZlIGEgdGltZXIgZGV2aWNlLCBz
byBpdCBkb2VzIG5vdCBleHBvc2UgdGhlIChvcHRpb25hbFsxXSkKPiA+IFNCSSB0aW1lIGV4dGVu
c2lvbiwgYW5kIHNiaV9zZXRfdGltZXIoKSBkb2VzIG5vdGhpbmcuCj4KPiBTaWdoLiBEb2VzIFJJ
U0NWIHJlYWxseSBoYXZlIHRvIHJlcGVhdCBhbGwgbWlzdGFrZXMgd2hpY2ggaGF2ZSBiZWVuIG1h
ZGUKPiBieSB4ODYsIEFSTSBhbmQgb3RoZXJzIGJlZm9yZT8gSXQncyBrbm93biBmb3IgZGVjYWRl
cyB0aGF0IHRoZSBrZXJuZWwKPiByZWxpZXMgb24gYSB3b3JraW5nIHRpbWVyLi4uCgpNeSBhcG9s
b2dpZXMgZm9yIHRoZSBkZWxheSBpbiBmaW5kaW5nIGEgZml4IGZvciB0aGlzIGlzc3VlLgoKQWxt
b3N0IGFsbCBSSVNDLVYgcGxhdGZvcm1zIChleGNlcHQgdGhpcyBvbmUpIGhhdmUgU0JJIFRpbWVy
IGFsd2F5cwphdmFpbGFibGUgYW5kIExpbnV4IHVzZXMgYSBiZXR0ZXIgdGltZXIgb3IgU3N0YyBl
eHRlbnNpb24gd2hlbmV2ZXIKaXQgaXMgYXZhaWxhYmxlLgoKV2hlbiBFbWlsIGZpcnN0IHJlcG9y
dGVkIHRoaXMgaXNzdWUsIEkgZGlkIHRyeSB0byBoZWxwIGhpbSByb290IGNhdXNlCnRoZSBpc3N1
ZSBidXQgdW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgdGhpcyBwYXJ0aWN1bGFyIHBsYXRmb3Jt
IGFuZApQTElDIG9uIGFsbCBvdGhlciBSSVNDLVYgcGxhdGZvcm1zIHdvcmtzIGZpbmUuCgpJIGFt
IGFsc28gc3VycHJpc2VkIHRoYXQgbm9uZSBvZiB0aGUgQWxsd2luZXIgZm9sa3MgdHJpZWQgaGVs
cGluZy4KCj4KPiA+IEkgd3JvdGUgYSBwYXRjaCAobm90IHN1Ym1pdHRlZCkgdG8gc2tpcCByZWdp
c3RlcmluZyByaXNjdl9jbG9ja19ldmVudCB3aGVuIHRoZQo+ID4gU0JJIHRpbWUgZXh0ZW5zaW9u
IGlzIHVuYXZhaWxhYmxlLCBidXQgdGhpcyBkb2Vzbid0IGZ1bGx5IHNvbHZlIHRoZSBpc3N1ZQo+
ID4gZWl0aGVyLCBiZWNhdXNlIHRoZW4gd2UgaGF2ZSBubyBjbG9ja2V2ZW50IGF0IGFsbCB3aGVu
Cj4gPiBjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKCkgaXMgY2FsbGVkLgo+Cj4gY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cygpIGlzIGlycmVsZXZhbnQuCj4KPiA+IEhvdyBl
YXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzIGFyZSB3ZSAicmVxdWlyZWQiIHRvIGhhdmUgYSBmdW5j
dGlvbmFsIGNsb2NrZXZlbnQ/Cj4gPiBEbyB3ZSBuZWVkIHRvIHJlZmFjdG9yIGNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3NfYWxsX2NwdXMoKSBzbyBpdCB3b3JrcyBvbiBzeXN0ZW1zCj4gPiB3aGVyZSB0
aGUgb25seSBjbG9ja2V2ZW50IGlzIHByb3ZpZGVkIGJ5IGEgcGxhdGZvcm0gZGV2aWNlPwo+Cj4g
UmlnaHQgYWZ0ZXIgaW5pdC9tYWluOjpsYXRlX3RpbWVfaW5pdCgpIGV2ZXJ5dGhpbmcgY2FuIGRl
cGVuZCBvbiBhCj4gd29ya2luZyB0aW1lciBhbmQgb24gamlmZmllcyBpbmNyZWFzaW5nLgo+Cj4g
SSdtIGFjdHVhbGx5IHN1cnByaXNlZCB0aGF0IHRoZSBib290IHByb2Nlc3MgZ2V0cyB0aGF0IGZh
ci4gVGhhdCdzIGp1c3QKPiBieSBwdXJlIGx1Y2ssIHJlYWxseS4KPgo+IFRoYW5rcywKPgo+ICAg
ICAgICAgdGdseAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
