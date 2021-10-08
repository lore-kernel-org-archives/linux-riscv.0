Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50703C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 18:47:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D6160F4B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 18:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10D6160F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=elDans+pAIzlb3NBPzKLZ7TK0dL0N9cwOvYBCoWXRw0=; b=szVIe3CeF4GnFGWcoasyX71Zrk
	whk3blEw+LnA0gwGMEk8aH5PgR4Zyz++PPecqGGYlWy+8bYLtU87qtLQCCz/3E9IoWpnXZzufM/4+
	Y/N/7yTkURdqolo0q8QsfkFccvKLyH4KLK93zx56jdjVkrqvRghs4jyfWJ6sdxscJt45ptsoL/Hsu
	UjBpIaxnH5PCpRerSlkurSta7eq5e+Qi5qoB7HyCR/2RQrdDm3R3LYni6+D81EGUEcdtHQC8EFqQ9
	8dkUko0fpg/dP7kgpFMKhy7Pyf+uHFwrGq28WpVgMtMyIktbW93+6tyorw23tuRDsgspBqQPC2b9c
	dL698d3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYutZ-003thl-86; Fri, 08 Oct 2021 18:47:01 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYutV-003thL-Bn
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 18:46:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id v11so3934780pgb.8
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 11:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=quuSqZ0dONVuv9mo4TeP3YIzWz+O416I07kQnnw7STA=;
 b=VP3FxMvbz5TL9ETbQUQchYZN5L4JzqpHPf5RtFeE3ZfDwplk+2AwbE5NYJyD1Dwm64
 OURJONO70AuDhhUUMsC6mqZ0G6vpAdpP88r9Vat/ksn3WojuY1MZE2iby4R/hU8ULX1g
 D5tF5tPYrB+h8S+lezt7+hxCysnobBIbL9yDUtqZ6s/E4NZYhAJIyuqj/yk3upT3mVoC
 D2B84lQfOuy11lNLZbdj5WLptstGzspyTbtIPgniNYtZfX4pE78j+I5Yb8Sb09PlYEF1
 QGrIKY+xG+/pJIw5Oxli7c2qFSNLq7bwRSQYjwaNYbsqfW4hfmsh66cpOKPD89L8UKOW
 HgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=quuSqZ0dONVuv9mo4TeP3YIzWz+O416I07kQnnw7STA=;
 b=tyON3z2CaODLNRAa5e0CrJOgQCnUWzkiB0WMPn2SFTbxw/ulM57yZFEuDDwKt6pmJf
 mTV4ee6QwGNGKBq69AZ/6ONsQe7xrlq/WQQkoz8QYJU3cumABXlrE9CdMHZ7G6jBhWcD
 uhLL2dt5T+a/dMYeSQ8siYSX45/oSw4DWCDn+b+0J5N2PG9f7FNG+ZyFkSFwgqkAeCsr
 qteEtliW6f74xAca12EDadp24C5+ZSTqypxzkoVZAZD35lTqD7mrEsyt0l7+Snyted3+
 1JdstxER4Zo9mewEFNlANrxyIi7AU+BbXzl9NhcotB1bjrFYxBIbMUURveqkCRbwzDT4
 TA7Q==
X-Gm-Message-State: AOAM5302/qzMa7UGX3xhhdykhqonbLW1rTczitaW9j3ZJ4uIdtnrPK75
 mhiBCpmZcFhBwKDZVwPo3fr2sw==
X-Google-Smtp-Source: ABdhPJxAT5BQrmJ3JUtPZaaQj9/pOPmAgQLcheO9hTXDYLo9/eegEa4BrfVFO430mNlT7+7pI3Tbjw==
X-Received: by 2002:a63:b214:: with SMTP id x20mr6037587pge.460.1633718816009; 
 Fri, 08 Oct 2021 11:46:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k17sm73056pff.214.2021.10.08.11.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 11:46:55 -0700 (PDT)
Date: Fri, 08 Oct 2021 11:46:55 -0700 (PDT)
X-Google-Original-Date: Fri, 08 Oct 2021 10:00:34 PDT (-0700)
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
In-Reply-To: <YUyWYpDl2Dmegz0a@archlinux-ax161>
CC: elver@google.com, akpm@linux-foundation.org, ryabinin.a.a@gmail.com,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 ndesaulniers@google.com, 
 Arnd Bergmann <arnd@arndb.de>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_114657_471498_6FC8F3D4 
X-CRM114-Status: GOOD (  30.17  )
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

T24gVGh1LCAyMyBTZXAgMjAyMSAwNzo1OTo0NiBQRFQgKC0wNzAwKSwgbmF0aGFuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gT24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgMTI6MDc6MTdQTSArMDIwMCwgTWFy
Y28gRWx2ZXIgd3JvdGU6Cj4+IE9uIFdlZCwgMjIgU2VwdCAyMDIxIGF0IDIyOjU1LCBOYXRoYW4g
Q2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+IEN1cnJlbnRseSwgdGhl
IGFzYW4tc3RhY2sgcGFyYW1ldGVyIGlzIG9ubHkgcGFzc2VkIGFsb25nIGlmCj4+ID4gQ0ZMQUdT
X0tBU0FOX1NIQURPVyBpcyBub3QgZW1wdHksIHdoaWNoIHJlcXVpcmVzIEtBU0FOX1NIQURPV19P
RkZTRVQgdG8KPj4gPiBiZSBkZWZpbmVkIGluIEtjb25maWcgc28gdGhhdCB0aGUgdmFsdWUgY2Fu
IGJlIGNoZWNrZWQuIEluIFJJU0MtVidzCj4+ID4gY2FzZSwgS0FTQU5fU0hBRE9XX09GRlNFVCBp
cyBub3QgZGVmaW5lZCBpbiBLY29uZmlnLCB3aGljaCBtZWFucyB0aGF0Cj4+ID4gYXNhbi1zdGFj
ayBkb2VzIG5vdCBnZXQgZGlzYWJsZWQgd2l0aCBjbGFuZyBldmVuIHdoZW4gQ09ORklHX0tBU0FO
X1NUQUNLCj4+ID4gaXMgZGlzYWJsZWQsIHJlc3VsdGluZyBpbiBsYXJnZSBzdGFjayB3YXJuaW5n
cyB3aXRoIGFsbG1vZGNvbmZpZzoKPj4gPgo+PiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIv
b21hcGZiL2Rpc3BsYXlzL3BhbmVsLWxncGhpbGlwcy1sYjAzNXEwMi5jOjExNzoxMjoKPj4gPiBl
cnJvcjogc3RhY2sgZnJhbWUgc2l6ZSAoMTQ0MDApIGV4Y2VlZHMgbGltaXQgKDIwNDgpIGluIGZ1
bmN0aW9uCj4+ID4gJ2xiMDM1cTAyX2Nvbm5lY3QnIFstV2Vycm9yLC1XZnJhbWUtbGFyZ2VyLXRo
YW5dCj4+ID4gc3RhdGljIGludCBsYjAzNXEwMl9jb25uZWN0KHN0cnVjdCBvbWFwX2Rzc19kZXZp
Y2UgKmRzc2RldikKPj4gPiAgICAgICAgICAgIF4KPj4gPiAxIGVycm9yIGdlbmVyYXRlZC4KPj4g
Pgo+PiA+IEVuc3VyZSB0aGF0IHRoZSB2YWx1ZSBvZiBDT05GSUdfS0FTQU5fU1RBQ0sgaXMgYWx3
YXlzIHBhc3NlZCBhbG9uZyB0bwo+PiA+IHRoZSBjb21waWxlciBzbyB0aGF0IHRoZXNlIHdhcm5p
bmdzIGRvIG5vdCBoYXBwZW4gd2hlbgo+PiA+IENPTkZJR19LQVNBTl9TVEFDSyBpcyBkaXNhYmxl
ZC4KPj4gPgo+PiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGlu
dXgvaXNzdWVzLzE0NTMKPj4gPiBSZWZlcmVuY2VzOiA2YmFlYzg4MGQ3YTUgKCJrYXNhbjogdHVy
biBvZmYgYXNhbi1zdGFjayBmb3IgY2xhbmctOCBhbmQgZWFybGllciIpCj4+ID4gU2lnbmVkLW9m
Zi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+Pgo+PiBSZXZpZXdl
ZC1ieTogTWFyY28gRWx2ZXIgPGVsdmVyQGdvb2dsZS5jb20+Cj4KPiBUaGFua3MhCj4KPj4gWyBX
aGljaCB0cmVlIGFyZSB5b3UgcGxhbm5pbmcgdG8gdGFrZSBpdCB0aHJvdWdoPyBdCj4KPiBHYWgs
IEkgd2FzIGludGVuZGluZyBmb3IgaXQgdG8gZ28gdGhyb3VnaCAtbW0sIHRoZW4gSSBjYydkIG5l
aXRoZXIKPiBBbmRyZXcgbm9yIGxpbnV4LW1tLi4uIDovIEFuZHJldywgZG8geW91IHdhbnQgbWUg
dG8gcmVzZW5kIG9yIGNhbiB5b3UKPiBncmFiIGl0IGZyb20gTEtNTD8KCkFja2VkLWJ5OiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgoKKGFzc3VtaW5nIHlvdSBzdGls
bCB3YW50IGl0IHRocm91Z2ggc29tZXdoZXJlIGVsc2UpCgo+PiBOb3RlLCBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2thc2FuLmggbWVudGlvbnMgS0FTQU5fU0hBRE9XX09GRlNFVCBpbgo+PiBjb21t
ZW50IChjb3BpZWQgZnJvbSBhcm02NCkuIERpZCBSSVNDLVYganVzdCBmb3JnZXQgdG8gY29weSBv
dmVyIHRoZQo+PiBLY29uZmlnIG9wdGlvbj8KPgo+IEkgZG8gc2VlIGl0IGRlZmluZWQgaW4gdGhh
dCBmaWxlIGFzIHdlbGwgYnV0IHlvdSBhcmUgcmlnaHQgdGhhdCB0aGV5IGRpZAo+IG5vdCBjb3B5
IHRoZSBLY29uZmlnIGxvZ2ljLCBldmVuIHRob3VnaCBpdCB3YXMgcHJlc2VudCBpbiB0aGUgdHJl
ZSB3aGVuCj4gUklTQy1WIEtBU0FOIHdhcyBpbXBsZW1lbnRlZC4gUGVyaGFwcyB0aGV5IHNob3Vs
ZCBzbyB0aGF0IHRoZXkgZ2V0Cj4gYWNjZXNzIHRvIHRoZSBvdGhlciBmbGFncyBpbiB0aGUgImVs
c2UiIGJyYW5jaD8KCllhLCBsb29rcyBsaWtlIHdlIGp1c3Qgc2NyZXdlZCB0aGlzIHVwLiAgSSdt
IHNlZWluZyBzb21lIHdhcm5pbmdzIGxpa2UKCiAgICBjYzE6IHdhcm5pbmc6IOKAmC1mc2FuaXRp
emU9a2VybmVsLWFkZHJlc3PigJkgd2l0aCBzdGFjayBwcm90ZWN0aW9uIGlzIG5vdCBzdXBwb3J0
ZWQgd2l0aG91dCDigJgtZmFzYW4tc2hhZG93LW9mZnNldD3igJkgZm9yIHRoaXMgdGFyZ2V0Cgp3
aGljaCBpcyBob3cgSSBlbmRlZCB1cCBoZXJlLCBJJ20gYXNzdW1pbmcgdGhhdCdzIHdoYXQgeW91
J3JlIHRhbGtpbmcgCmFib3V0IGhlcmU/ICBMTUsgaWYgeW91IHdlcmUgcGxhbm5pbmcgb24gc2Vu
ZGluZyBhbG9uZyBhIGZpeCBvciBpZiB5b3UgCndhbnQgbWUgdG8gZ28gZmlndXJlIGl0IG91dC4K
Cj4KPj4gPiAtLS0KPj4gPiAgc2NyaXB0cy9NYWtlZmlsZS5rYXNhbiB8IDMgKystCj4+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gPgo+PiA+IGRp
ZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLmthc2FuIGIvc2NyaXB0cy9NYWtlZmlsZS5rYXNh
bgo+PiA+IGluZGV4IDgwMWM0MTViYWM1OS4uYjllOTRjNWU3MDk3IDEwMDY0NAo+PiA+IC0tLSBh
L3NjcmlwdHMvTWFrZWZpbGUua2FzYW4KPj4gPiArKysgYi9zY3JpcHRzL01ha2VmaWxlLmthc2Fu
Cj4+ID4gQEAgLTMzLDEwICszMywxMSBAQCBlbHNlCj4+ID4gICAgICAgICBDRkxBR1NfS0FTQU4g
Oj0gJChDRkxBR1NfS0FTQU5fU0hBRE9XKSBcCj4+ID4gICAgICAgICAgJChjYWxsIGNjLXBhcmFt
LGFzYW4tZ2xvYmFscz0xKSBcCj4+ID4gICAgICAgICAgJChjYWxsIGNjLXBhcmFtLGFzYW4taW5z
dHJ1bWVudGF0aW9uLXdpdGgtY2FsbC10aHJlc2hvbGQ9JChjYWxsX3RocmVzaG9sZCkpIFwKPj4g
PiAtICAgICAgICAkKGNhbGwgY2MtcGFyYW0sYXNhbi1zdGFjaz0kKHN0YWNrX2VuYWJsZSkpIFwK
Pj4gPiAgICAgICAgICAkKGNhbGwgY2MtcGFyYW0sYXNhbi1pbnN0cnVtZW50LWFsbG9jYXM9MSkK
Pj4gPiAgZW5kaWYKPj4gPgo+PiA+ICtDRkxBR1NfS0FTQU4gKz0gJChjYWxsIGNjLXBhcmFtLGFz
YW4tc3RhY2s9JChzdGFja19lbmFibGUpKQo+PiA+ICsKPj4gPiAgZW5kaWYgIyBDT05GSUdfS0FT
QU5fR0VORVJJQwo+PiA+Cj4+ID4gIGlmZGVmIENPTkZJR19LQVNBTl9TV19UQUdTCj4+ID4KPj4g
PiBiYXNlLWNvbW1pdDogNDA1NzUyNTczNmIxNTliZDQ1NjczMmQxMTI3MGFmMmNjNDllYzIxZgo+
PiA+IC0tCj4+ID4gMi4zMy4wLjUxNC5nOTljOTllZDgyNQo+PiA+Cj4+ID4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
