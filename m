Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F5AEFB7E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 02:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPesQK8MF7Q7PxvNCrHkHpMf5qVPE4d/mBhA11RCbnE=; b=4Bo79Zcq4kosHj
	NQJBDlvhN+ajI0Ofu3PhCtAnlAh9SY05YM7xp7S5gWWICMnYlqnBrNIDpOYbGKIjxaFU537ym7t/7
	4bbAFqmJkk05L4kYUyC80vsYIKWCSqR9YLpP3I7gCevc1FYuDN3Oqw9IR6/U/yd30wQegfG0nIKcz
	5ImNck0YslIPzzH48sg6ZdoPOo5zgjlGmZUDykFs0JqibX7U3ni0ZvNi7o3FvmkkIob2MGRm+64b3
	TWD7YONX+dIIji5sll0E8YHhWwFjZ6jiu0bg2ELW+s7wuzWhLXCVQOa50mJrMK84KzcwMcx47auTF
	KLzeROJ7jujTB97gM80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhmw-00000001Kdt-3UMi;
	Tue, 24 Feb 2026 02:04:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhmt-00000001KdY-3xyJ
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 02:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 237B644548
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 02:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F12C2BCB2
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 02:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771898674;
	bh=4w3Y6h6W/nEug5ZtJazWCcCNYp3XbGkU9id86vGZAr8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZhqdbTKYf9yqS5bWH+Dc2fO1rY9aGLwLkIfpSMU+QtvPXFajx/aCScsRwRQqrIWA5
	 zcVLZkUFDWe1HwFfdBwbXQcko4hQ84stiUJbQmf0W6OHuU94eQnDfnxiYZhuvUbx/n
	 lKo2ErjcJtDV5XY7OwY0hrL18YwdMFPSFPRFZ8jn+efG1+BxrhRSkacmEezXwFyw0x
	 7xYa0C2hVfSa194JIkBb8jsVcRs5/egb0xqE7HIyBbymHv9hiHgFUAEdhdZtnHUfPX
	 jCzQwfcaWAo/N4IIxBCikZ4Is+dMujBnaeWSgl1Eiz/AMr968vNukG+5LOT6gN+PqO
	 f7wIdf4w6tsCw==
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4359249bbacso3592888f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 18:04:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsJEvnvV94FQG3dlF8gWz9JDvnNolZm8erFEV8ijjx4ZH9QFA3io3gEHpvT7Q0ztU9NmHDbKdDkkBaoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEkLs42UmckS9zwlSdsMrTx3l94Cs0oKyY8cZJofnvhX1TfVjk
	lG3hOo74m4n+3HW03tV5HUoGS/wTZWvnoQYaYCXFLG4lFVdzrIuGZ7shfDAfRc4Jg/H9Zu2wyiZ
	d8xskcFNpwXWv2LPpiSGkoMnEKZ9QZZ8=
X-Received: by 2002:a05:6000:2384:b0:437:6906:822e with SMTP id
 ffacd0b85a97d-4396ffdf811mr19610869f8f.28.1771898673371; Mon, 23 Feb 2026
 18:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20260125063941.443777-1-guoren@kernel.org> <aZbEGsqXSQzORQ__@pie>
In-Reply-To: <aZbEGsqXSQzORQ__@pie>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Feb 2026 10:04:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQbjDnx_cBEw_3BD9Pezxn3tgX4EZG5P1j_viy+Yg5U+g@mail.gmail.com>
X-Gm-Features: AaiRm53SP5LO-pCuN9qqvurpHSrZAMU1NdkbxBfhDXWz0QDj4-paXiSeyyh7Xa8
Message-ID: <CAJF2gTQbjDnx_cBEw_3BD9Pezxn3tgX4EZG5P1j_viy+Yg5U+g@mail.gmail.com>
Subject: Re: [PATCH V3] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
To: Yao Zi <me@ziyao.cc>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr, 
	leobras@redhat.com, djordje.todorovic@htecgroup.com, 
	aleksa.paunovic@htecgroup.com, arnd@arndb.de, rabenda.cn@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_180436_554260_C0D4B6A1 
X-CRM114-Status: GOOD (  18.99  )
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

T24gVGh1LCBGZWIgMTksIDIwMjYgYXQgNDowNeKAr1BNIFlhbyBaaSA8bWVAeml5YW8uY2M+IHdy
b3RlOgo+Cj4gT24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgMDE6Mzk6NDFBTSAtMDUwMCwgZ3VvcmVu
QGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRl
bXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gVGhlIGVhcmx5IHZlcnNpb24gb2YgWHVh
blRpZSBDOTEwIGNvcmUgaGFzIGEgc3RvcmUgbWVyZ2UgYnVmZmVyCj4gPiBkZWxheSBwcm9ibGVt
LiBUaGUgc3RvcmUgbWVyZ2UgYnVmZmVyIGNvdWxkIGltcHJvdmUgdGhlIHN0b3JlIHF1ZXVlCj4g
PiBwZXJmb3JtYW5jZSBieSBtZXJnaW5nIG11bHRpLXN0b3JlIHJlcXVlc3RzLCBidXQgd2hlbiB0
aGVyZSBhcmUgbm90Cj4gPiBjb250aW51ZWQgc3RvcmUgcmVxdWVzdHMsIHRoZSBwcmlvciBzaW5n
bGUgc3RvcmUgcmVxdWVzdCB3b3VsZCBiZQo+ID4gd2FpdGluZyBpbiB0aGUgc3RvcmUgcXVldWUg
Zm9yIGEgbG9uZyB0aW1lLiBUaGF0IHdvdWxkIGNhdXNlCj4gPiBzaWduaWZpY2FudCBwcm9ibGVt
cyBmb3IgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIG11bHRpLWNvcmVzLiBUaGlzCj4gPiBwcm9ibGVt
IHdhcyBmb3VuZCBvbiBzZzIwNDIgJiB0aDE1MjAgcGxhdGZvcm1zIHdpdGggdGhlIHFzcGlubG9j
awo+ID4gbG9jayB0b3J0dXJlIHRlc3QuCj4gPgo+ID4gU28gYXBwZW5kaW5nIGEgZmVuY2Ugdy5v
IGNvdWxkIGltbWVkaWF0ZWx5IGZsdXNoIHRoZSBzdG9yZSBtZXJnZQo+ID4gYnVmZmVyIGFuZCBs
ZXQgb3RoZXIgY29yZXMgc2VlIHRoZSB3cml0ZSByZXN1bHQuCj4gPgo+ID4gVGhpcyB3aWxsIGFw
cGx5IHRoZSBXUklURV9PTkNFIGVycmF0YSB0byBoYW5kbGUgdGhlIG5vbi1zdGFuZGFyZAo+ID4g
YmVoYXZpb3IgdmlhIGFwcGVuZGluZyBhIGZlbmNlIHcubyBpbnN0cnVjdGlvbiBmb3IgV1JJVEVf
T05DRSgpLgo+ID4KPiA+IFRoaXMgcHJvYmxlbSBpcyBvbmx5IG9ic2VydmVkIG9uIHRoZSBzZzIw
NDIgaGFyZHdhcmUgcGxhdGZvcm0gYnkKPiA+IHJ1bm5pbmcgdGhlIGxvY2tfdG9ydHVyZSB0ZXN0
IHByb2dyYW0gZm9yIGhhbGYgYW4gaG91ci4gVGhlIHByb2JsZW0KPiA+IHdhcyBub3QgZm91bmQg
aW4gdGhlIHVzZXIgc3BhY2UgYXBwbGljYXRpb24sIGJlY2F1c2UgaW50ZXJydXB0IGNhbgo+ID4g
YnJlYWsgdGhlIGxpdmVsb2NrLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBMZW9uYXJkbyBCcmFzIDxs
ZW9icmFzQHJlZGhhdC5jb20+Cj4gPiBUZXN0ZWQtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5h
Yy5jbj4KPiA+IENjOiBZYW8gWmkgPG1lQHppeWFvLmNjPgo+ID4gQ2M6IEFsZXhhbmRyZSBHaGl0
aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+IENjOiBQYXVsIFdhbG1zbGV5IDxwandAa2Vy
bmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15
KSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4KPiBXaXRoIHRoZSBwYXRjaCwgSSd2ZSBydW4gaGVhdnkg
bXVsdGktY29yZSBjb21waWxhdGlvbiBsb2FkIG9uIFNHMjA0MiBmb3IKPiBtb3JlIHRoYW4gMTIg
aG91cnMsIGFuZCBvYnNlcnZlZCBubyBzdGFiaWxpdHkgaXNzdWVzLgo+Cj4gVGVzdGVkLWJ5OiBZ
YW8gWmkgPG1lQHppeWFvLmNjPgoKVGh4IGZvciB0aGUgVGVzdGVkLWJ5LCBob3BlIHRoaXMgcGF0
Y2ggY291bGQgYmUgYWRvcHRlZC4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
