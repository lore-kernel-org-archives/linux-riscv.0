Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E49CC07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 18:11:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7B261370
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 18:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB7B261370
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHJri7NVU0GFXnNHn+ACP0SSUu8eK53e1EvZnfeZlVQ=; b=zgskcebCAzgZ1V
	Rk93ksopCW9CqUmVZv+2irWHHlZ0zZcqz4KLa+fTS98crhWkX8FIoS/BRHO7et+u8fQ+SBjS1giPj
	+haGxCng8IiQzUxWe/4RCSbOiig5moVljaijqc0iEPBD6UtSJl0i4TXte6JUni+eygRN6XdcA0hU6
	NGg3/3jvXQvRpvZ3ezB5AngDoIRtpkkXwnk62GxWL9UZ4umsYmW5Ugoax0bBKGAvEdS2wSCBlOSyO
	yukdBYxtiVvAmRPchvm0DZzPyvIDN89qJ0EJ+ii6rAe8ZxL/oAiNnl7ixEHOC0NyTgJkv7sCSOXQb
	YX95gI2+Xak7t+kZwmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Ms1-00B7yV-8B; Tue, 13 Jul 2021 18:11:01 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Mrl-00B7xl-Qs
 for linux-riscv@lists.infradead.org; Tue, 13 Jul 2021 18:10:47 +0000
Received: by mail-vs1-f45.google.com with SMTP id a22so6253052vso.1
 for <linux-riscv@lists.infradead.org>; Tue, 13 Jul 2021 11:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qlhl2E4nqEvej10lWriIdCXDfOfI/z5zwQZ0hljp3Qc=;
 b=th+X9eSD4+CjNSfXuaTh1DYaEJuC6V/m4XWOp4IFH9NvebMiyL06pzX+VpbWkNj3mv
 L0aFdMafZWkCVxOIIr9zUILtBeSYC7PtGL8UtWRLs1TidmI2veRdcEjunPj+E8XgsY+e
 RKwrPISJg6AHmzFxv8UZoZsv0kzkP1kWIbLsw8ttIYVDz+UXVd99IM+iKz/F/1/WzkJs
 SYEAVL0u/yqNiCY4v1bS/QHe7GSeUuOwRCzoJ9k45f60Ttel4aaaQMlVPUkxaI5l2Oei
 UvGq9DB2wwiBNBjp1IYojyTkPjqRKH+vCErra+9YEpfwy4rUXt0g9oRhvp5QrFFrJPJy
 hkvw==
X-Gm-Message-State: AOAM530dcYAbcv3Xz7gO8bNlHev9R/yoIVE6xfgUUFgJveFxNVCtmgtD
 cxq8q1u5zz9jYTktIcDgyWWprgLasy4x+iN9i2s=
X-Google-Smtp-Source: ABdhPJzePsGsxOA9mqBP7SE9ett5dB4ezFPwOrW7KOdf7lH79pezfcjEWLC1BHM6GAPhc1Dl5k1pOmVQ5W5h+wTAFeY=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr7981244vsd.42.1626199844405;
 Tue, 13 Jul 2021 11:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <3e1dbea4-3b0f-de32-5447-2e23c6d4652a@gmail.com>
 <60c1f087-1e8b-8f22-7d25-86f5f3dcee3f@gmail.com>
 <20210710014915.GA149706@roeck-us.net>
In-Reply-To: <20210710014915.GA149706@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jul 2021 20:10:33 +0200
Message-ID: <CAMuHMdWrrP37Kfp4yC8G5f6SvMtD6u_=JkqX-Nd97FS_mayYWQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
To: Guenter Roeck <linux@roeck-us.net>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_111045_912095_F6EA22B8 
X-CRM114-Status: GOOD (  29.05  )
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

SGkgR8O8bnRlciwgVHN1a2Ftb3RvLXNhbiwKCk9uIFNhdCwgSnVsIDEwLCAyMDIxIGF0IDM6NTAg
QU0gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToKPiBPbiBXZWQsIEp1
biAyMywgMjAyMSBhdCAwOTo0MDozOVBNICswOTAwLCBBa2lyYSBUc3VrYW1vdG8gd3JvdGU6Cj4g
PiBUaGlzIHBhdGNoIHdpbGwgcmVkdWNlIGNwdSB1c2FnZSBkcmFtYXRpY2FsbHkgaW4ga2VybmVs
IHNwYWNlIGVzcGVjaWFsbHkKPiA+IGZvciBhcHBsaWNhdGlvbiB3aGljaCB1c2Ugc3lzLWNhbGwg
d2l0aCBsYXJnZSBidWZmZXIgc2l6ZSwgc3VjaCBhcyBuZXR3b3JrCj4gPiBhcHBsaWNhdGlvbnMu
IFRoZSBtYWluIHJlYXNvbiBiZWhpbmQgdGhpcyBpcyB0aGF0IGV2ZXJ5IHVuYWxpZ25lZCBtZW1v
cnkKPiA+IGFjY2VzcyB3aWxsIHJhaXNlIGV4Y2VwdGlvbnMgYW5kIHN3aXRjaCBiZXR3ZWVuIHMt
bW9kZSBhbmQgbS1tb2RlIGNhdXNpbmcKPiA+IGxhcmdlIG92ZXJoZWFkLgo+ID4KPiA+IEZpcnN0
IGNvcHkgaW4gYnl0ZXMgdW50aWwgcmVhY2hlcyB0aGUgZmlyc3Qgd29yZCBhbGlnbmVkIGJvdW5k
YXJ5IGluCj4gPiBkZXN0aW5hdGlvbiBtZW1vcnkgYWRkcmVzcy4gVGhpcyBpcyB0aGUgcHJlcGFy
YXRpb24gYmVmb3JlIHRoZSBidWxrCj4gPiBhbGlnbmVkIHdvcmQgY29weS4KPiA+Cj4gPiBUaGUg
ZGVzdGluYXRpb24gYWRkcmVzcyBpcyBhbGlnbmVkIG5vdywgYnV0IG9mdGVudGltZXMgdGhlIHNv
dXJjZSBhZGRyZXNzCj4gPiBpcyBub3QgaW4gYW4gYWxpZ25lZCBib3VuZGFyeS4gVG8gcmVkdWNl
IHRoZSB1bmFsaWduZWQgbWVtb3J5IGFjY2VzcywgaXQKPiA+IHJlYWRzIHRoZSBkYXRhIGZyb20g
c291cmNlIGluIGFsaWduZWQgYm91bmRhcmllcywgd2hpY2ggd2lsbCBjYXVzZSB0aGUKPiA+IGRh
dGEgdG8gaGF2ZSBhbiBvZmZzZXQsIGFuZCB0aGVuIGNvbWJpbmVzIHRoZSBkYXRhIGluIHRoZSBu
ZXh0IGl0ZXJhdGlvbgo+ID4gYnkgZml4aW5nIG9mZnNldCB3aXRoIHNoaWZ0aW5nIGJlZm9yZSB3
cml0aW5nIHRvIGRlc3RpbmF0aW9uLiBUaGUgbWFqb3JpdHkKPiA+IG9mIHRoZSBpbXByb3Zpbmcg
Y29weSBzcGVlZCBjb21lcyBmcm9tIHRoaXMgc2hpZnQgY29weS4KPiA+Cj4gPiBJbiB0aGUgbHVj
a3kgc2l0dWF0aW9uIHRoYXQgdGhlIGJvdGggc291cmNlIGFuZCBkZXN0aW5hdGlvbiBhZGRyZXNz
IGFyZSBvbgo+ID4gdGhlIGFsaWduZWQgYm91bmRhcnksIHBlcmZvcm0gbG9hZCBhbmQgc3RvcmUg
d2l0aCByZWdpc3RlciBzaXplIHRvIGNvcHkgdGhlCj4gPiBkYXRhLiBXaXRob3V0IHRoZSB1bnJv
bGxpbmcsIGl0IHdpbGwgcmVkdWNlIHRoZSBzcGVlZCBzaW5jZSB0aGUgbmV4dCBzdG9yZQo+ID4g
aW5zdHJ1Y3Rpb24gZm9yIHRoZSBzYW1lIHJlZ2lzdGVyIHVzaW5nIGZyb20gdGhlIGxvYWQgd2ls
bCBzdGFsbCB0aGUKPiA+IHBpcGVsaW5lLgo+ID4KPiA+IEF0IGxhc3QsIGNvcHlpbmcgdGhlIHJl
bWFpbmRlciBpbiBvbmUgYnl0ZSBhdCBhIHRpbWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQWtp
cmEgVHN1a2Ftb3RvIDxha2lyYS50c3VrYW1vdG9AZ21haWwuY29tPgo+Cj4gVGhpcyBwYXRjaCBj
YXVzZXMgYWxsIHJpc2N2MzIgcWVtdSBlbXVsYXRpb25zIHRvIHN0YWxsIGR1cmluZyBib290Lgo+
IFRoZSBsb2cgc3VnZ2VzdHMgdGhhdCBzb21ldGhpbmcgaW4ga2VybmVsL3VzZXIgY29tbXVuaWNh
dGlvbiBtYXkgYmUgd3JvbmcuCj4KPiBCYWQgY2FzZToKPgo+IFN0YXJ0aW5nIHN5c2xvZ2Q6IE9L
Cj4gU3RhcnRpbmcga2xvZ2Q6IE9LCj4gL2V0Yy9pbml0LmQvUzAyc3lzY3RsOiBsaW5lIDY4OiBz
eW50YXggZXJyb3I6IEVPRiBpbiBiYWNrcXVvdGUgc3Vic3RpdHV0aW9uCj4gL2V0Yy9pbml0LmQv
UzIwdXJhbmRvbTogbGluZSAxOiBzeW50YXggZXJyb3I6IHVudGVybWluYXRlZCBxdW90ZWQgc3Ry
aW5nCj4gU3RhcnRpbmcgbmV0d29yazogL2Jpbi9zaDogc3ludGF4IGVycm9yOiB1bnRlcm1pbmF0
ZWQgcXVvdGVkIHN0cmluZwoKPiAjIGZpcnN0IGJhZCBjb21taXQ6IFtjYTZlYWFhMjEwZGVlYzBl
NDFjYmZjMzgwYmY4OWNmMDc5MjAzNTY5XSByaXNjdjogX19hc21fY29weV90by1mcm9tX3VzZXI6
IE9wdGltaXplIHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNzIGFuZCBwaXBlbGluZSBzdGFsbAoKU2Ft
ZSBoZXJlIG9uIHZleHJpc2N2LiBCaXNlY3RlZCB0byB0aGUgc2FtZSBjb21taXQuCgpUaGUgYWN0
dWFsIHNjcmlwdHMgbG9vayBmaW5lIHdoZW4gdXNpbmcgImNhdCIsIGJ1dCBjb250YWluIHNvbWUg
Z2FyYmFnZQp3aGVuIGV4ZWN1dGluZyB0aGVtIHVzaW5nICJzaCAtdiIuCgpUc3VrYW1vdG8tc2Fu
OiBnbGFuY2luZyBhdCB0aGUgcGF0Y2g6CgorICAgICAgIGFkZGkgICAgYTAsIGEwLCA4KlNaUkVH
CisgICAgICAgYWRkaSAgICBhMSwgYTEsIDgqU1pSRUcKCkkgdGhpbmsgeW91IGZvcmdvdCBhYm91
dCBydjMyLCB3aGVyZSByZWdpc3RlcnMgY292ZXIgb25seSA0CmJ5dGVzIGVhY2g/CgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
