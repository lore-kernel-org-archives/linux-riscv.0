Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E192C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 02:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itUcsB6I23axNCRGsODs13/kBn9saVwiNDglXCPE2QA=; b=4D6+2JbQKPJr4g
	84YyroHy4mMG8Es6tF5b+cRZWwnqR0RJuTAenOKeKyGi7PHu/a7jnzLwKMeNE5L8uw0+O2NvQSMIF
	nbkEA1uMYwcHols5LhARpyOtFwT78mbFwAyR8kZPN4itFFpHYjEIVwKMUxKtfjD0DI4Aqhrs+2T5+
	dAJ40tCPzSf3/58du55Y4PCX+68wJ0BHQqTUzivnR7cMtnI7rN6k8j3V0a/gjMPxX5k8OAObxVW/D
	/MORmRz4yhyt7kS9Ek9IldXhDr3WwrzAOG9HZQlTvyD1UEs3/cZP5rGjlEWekh0fLI0t//imC2SGm
	axU5KbWv4H/s6syOcvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy2Le-0041jY-DA; Thu, 24 Nov 2022 02:52:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy2La-0041hX-Ah
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 02:52:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id y4so286767plb.2
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 18:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvd4sOHCwM/Tz1jTF6aSDDIlyxDSP5H5/Tb0HqLBRYs=;
        b=A6DkeACQ2YktFeB5Vt5YKRRaR+jFXoIRUva3iOkAX/0Vrxiic4AYy9FIPNW+Cr1a80
         YHXeMROITXQrmxPTOvi4Zpv5bdbV6jGwQZMO761XGANVgfRVxHvIgM8cSnP8baf/RG5E
         pLbQRQ0/ASu+OFT/VXbFZPMhKBGt6/1RcdOC080szSRuH7gxXvkEzl+yAZQ3jDb/EBpf
         p4KNVpWYUoxg0vVtiTwc2WIQZHYmIb+80+FOS1o+ZPFv7r/jjdqlkHEsSitiUyI5g7wS
         F7rqG6f0YxDwKKng1m9I8rTvU1PjhpqVK9o9OXLmCKhuKzSXoe2GlcOSeBK+1Yu7HN2A
         vUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvd4sOHCwM/Tz1jTF6aSDDIlyxDSP5H5/Tb0HqLBRYs=;
        b=LV2jKCWgHmo7n8pvnsVnIxq5VhKBFrUMDKK/0qR0Ch4yPUiLRK2+3MSCKeHPnF7g4A
         YNyZzLuY6ab1a+66UtkA6oMzYH9u3VHgd0NTI7Va+/Zs7EBm0r2M2DLFsS1ePkVVE3xU
         LDzDSJ5Wnc0lK/uzNZ5HyQtvyUX8+OVcGeRwM/g4ATa0jasQDY5QQzYHNf7+NOYNRuft
         GMdsBHM3vVd4RJcMmot0d0Vl75bgWkR0CkPLbzLrws1LzPbbsvuK6a0e+Wrf9ze//jVs
         2XMp229d4gfrJWwiQ7f2trBoyya3iGceTBppxlFouH5OGf7CeBF9GGZdS6MbQ8FdoBun
         I+2A==
X-Gm-Message-State: ANoB5pltB7KPbNGnZ8B9pD0dQBe/iTViPypLDPcKYp4y8YXL/w1/Jfte
	mH53UhYVsj64ng9LcK/Ncf6kt5dFPgmZuai6T9s=
X-Google-Smtp-Source: AA0mqf7VdHiQFlFhkNBVyaxm2xDm4KDzQkMWS3LnCK0JqI+Mh/VOcN3kXTLrtjhiGs6v99biz0tfNqulYNCmWI4vO5E=
X-Received: by 2002:a17:903:4111:b0:189:596a:1499 with SMTP id
 r17-20020a170903411100b00189596a1499mr1227175pld.157.1669258337569; Wed, 23
 Nov 2022 18:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
 <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com> <CAJF2gTTgTfGAYTWbqqrdZg9bMjbpQfx8GzFzxoq3C4r9HDpz8Q@mail.gmail.com>
In-Reply-To: <CAJF2gTTgTfGAYTWbqqrdZg9bMjbpQfx8GzFzxoq3C4r9HDpz8Q@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Thu, 24 Nov 2022 02:52:06 +0000
Message-ID: <CAAYs2=iJM3d6tqwLjCoE7S1p3JURMYVj54Vry8KiSz1bZakxcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_185218_422863_533AE1AA 
X-CRM114-Status: GOOD (  31.17  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDI05pel5ZGo5ZubIDAy
OjA45YaZ6YGT77yaCj4KPiBPbiBUaHUsIE5vdiAyNCwgMjAyMiBhdCAxOjI3IEFNIFNvbmcgU2h1
YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDIz5pel5ZGo5LiJIDIzOjAy5YaZ6YGT77yaCj4g
PiA+Cj4gPiA+IENvb2wgam9iLCB0aHguCj4gPiA+Cj4gPiA+IE9uIFdlZCwgTm92IDIzLCAyMDIy
IGF0IDEwOjIwIFBNIFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4g
PiA+Pgo+ID4gPj4gVGhpcyBwYXRjaCBhZGRzIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NB
TExTIHN1cHBvcnQgZm9yIFJJU0MtVi4KPiA+ID4+Cj4gPiA+PiBzZWxlY3QgdGhlIERZTkFNSUNf
RlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHRvIHByb3ZpZGUgdGhlCj4gPiA+PiByZWdpc3Rlcl9m
dHJhY2VfZGlyZWN0W19tdWx0aV0gaW50ZXJmYWNlcyBhbGxvd2luZyB1c2VycyB0byByZWdpc3Rl
cgo+ID4gPj4gdGhlIGN1c3RvbWVkIHRyYW1wb2xpbmUgKGRpcmVjdF9jYWxsZXIpIGFzIHRoZSBt
Y291bnQgZm9yIG9uZSBvcgo+ID4gPj4gbW9yZSB0YXJnZXQgZnVuY3Rpb25zLiBBbmQgbW9kaWZ5
X2Z0cmFjZV9kaXJlY3RbX211bHRpXSBhcmUgYWxzbwo+ID4gPj4gcHJvdmlkZWQgZm9yIG1vZGlm
eWluZyBkaXJlY3RfY2FsbGVyLgo+ID4gPj4KPiA+ID4+IFRvIG1ha2UgdGhlIGRpcmVjdF9jYWxs
ZXIgYW5kIHRoZSBvdGhlciBmdHJhY2UgaG9va3MgKGVnLiBmdW5jdGlvbi9mZ3JhcGgKPiA+ID4+
IHRyYWNlciwga1tyZXRdcHJvYmVzKSBjby1leGlzdCwgYSB0ZW1wb3JhcnkgcmVnaXN0ZXIgaXMg
bm9taW5hdGVkIHRvCj4gPiA+PiBzdG9yZSB0aGUgYWRkcmVzcyBvZiBkaXJlY3RfY2FsbGVyIGlu
IGZ0cmFjZV9yZWdzX2NhbGxlci4gQWZ0ZXIgdGhlCj4gPiA+PiBzZXR0aW5nIG9mIHRoZSBhZGRy
ZXNzIGRpcmVjdF9jYWxsZXIgYnkgZGlyZWN0X29wcy0+ZnVuYyBhbmQgdGhlCj4gPiA+PiBSRVNU
T1JFX1JFR1MgaW4gZnRyYWNlX3JlZ3NfY2FsbGVyLCBkaXJlY3RfY2FsbGVyIHdpbGwgYmUganVt
cGVkIHRvCj4gPiA+PiBieSB0aGUgYGpyYCBpbnN0Lgo+ID4gPj4KPiA+ID4+IFNpZ25lZC1vZmYt
Ynk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiA+ID4+IC0tLQo+ID4gPj4g
IGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAxICsKPiA+ID4+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIHwgNiArKysrKysKPiA+ID4+ICBhcmNoL3Jpc2N2L2tlcm5l
bC9tY291bnQtZHluLlMgIHwgNCArKysrCj4gPiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspCj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPj4gaW5kZXggMzllYzhkNjI4Y2Y2Li5kMDgzZWMwOGQw
YjYgMTAwNjQ0Cj4gPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4+ICsrKyBiL2Fy
Y2gvcmlzY3YvS2NvbmZpZwo+ID4gPj4gQEAgLTI3OCw2ICsyNzgsNyBAQCBjb25maWcgQVJDSF9S
VjY0SQo+ID4gPj4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19JTlQxMjggaWYgQ0NfSEFT
X0lOVDEyOAo+ID4gPj4gICAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZiAhWElQ
X0tFUk5FTCAmJiBNTVUgJiYgJChjYy1vcHRpb24sLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9
OCkKPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTIGlm
IEhBVkVfRFlOQU1JQ19GVFJBQ0UKPiA+ID4+ICsgICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19G
VFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMKPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfRlRSQUNF
X01DT1VOVF9SRUNPUkQgaWYgIVhJUF9LRVJORUwKPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVf
RlVOQ1RJT05fR1JBUEhfVFJBQ0VSCj4gPiA+PiAgICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9O
X1RSQUNFUiBpZiAhWElQX0tFUk5FTCAmJiAhUFJFRU1QVElPTgo+ID4gPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Z0cmFjZS5oCj4gPiA+PiBpbmRleCAwMWJlYmIyOGVhYmUuLmJlNGQ1NzU2NjEzOSAxMDA2NDQK
PiA+ID4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiA+ID4+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiA+ID4+IEBAIC0xMTQsNiArMTE0LDEy
IEBAIHN0cnVjdCBmdHJhY2VfcmVnczsKPiA+ID4+ICB2b2lkIGZ0cmFjZV9ncmFwaF9mdW5jKHVu
c2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcgcGFyZW50X2lwLAo+ID4gPj4gICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZnRyYWNlX29wcyAqb3AsIHN0cnVjdCBmdHJhY2VfcmVncyAq
ZnJlZ3MpOwo+ID4gPj4gICNkZWZpbmUgZnRyYWNlX2dyYXBoX2Z1bmMgZnRyYWNlX2dyYXBoX2Z1
bmMKPiA+ID4+ICsKPiA+ID4+ICtzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9mdHJhY2Vfc2V0X2Rp
cmVjdF9jYWxsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+
ID4+ICt7Cj4gPiA+PiArICAgICAgICAgICAgICAgcmVncy0+dDEgPSBhZGRyOwo+ID4gPgo+ID4g
PiBIb3cgYWJvdXQgcmVncy0+dDAgPSBhZGRyOyA/Cj4gPiA+IEFuZCBkZWxldGUgYWxsIG1jb3Vu
dC1keW4uUyBtb2RpZmljYXRpb24uCj4gPiA+Cj4gPiBUaGUgZGlyZWN0X2NhbGxlciBoYXMgdGhl
IHNhbWUgcHJvZ3JhbSBsYXlvdXQgYXMgdGhlIGZ0cmFjZV9jYWxsZXIsIHdoaWNoIG1lYW5zCj4g
PiB0aGUgcmVnIHQwIHdpbGwgbmV2ZXIgYmUgY2hhbmdlZCB3aGVuIGRpcmVjdF9jYWxsZXIgcmV0
dXJucy4KPiA+Cj4gPiBJZiByZWdzLT50MCBjaGFuZ2VzIGhlcmUgYW5kIGZ0cmFjZV9yZWdzX2Nh
bGxlciBleGVjdXRlcyBganIgdDBgLAo+ID4gZGlyZWN0X2NhbGxlciB3aWxsIGVudGVyIHRoZSBk
ZWFkIGxvb3AuCj4gPwo+Cj4gZnRyYWNlX3JlZ3NfY2FsbGVyLT5jYWxsX2RpcmVjdF9mdW5jcy0+
Cj4gYXJjaF9mdHJhY2Vfc2V0X2RpcmVjdF9jYWxsZXItPiBmdHJhY2VfcmVnc19jYWxsZXIganIg
dDAuCj4KPiBPbmx5IGNhbGxfZGlyZWN0X2Z1bmNzIGNhbGwgYXJjaF9mdHJhY2Vfc2V0X2RpcmVj
dF9jYWxsZXIgIQo+Cj4gc3RhdGljIHZvaWQgY2FsbF9kaXJlY3RfZnVuY3ModW5zaWduZWQgbG9u
ZyBpcCwgdW5zaWduZWQgbG9uZyBwaXAsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGZ0cmFjZV9vcHMgKm9wcywgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncykKPiB7Cj4g
ICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IGZ0cmFjZV9nZXRfcmVncyhmcmVncyk7Cj4g
ICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHI7Cj4KPiAgICAgICAgIGFkZHIgPSBmdHJhY2VfZmlu
ZF9yZWNfZGlyZWN0KGlwKTsKPiAgICAgICAgIGlmICghYWRkcikKPiAgICAgICAgICAgICAgICAg
cmV0dXJuOwo+Cj4gICAgICAgICBhcmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxlcihyZWdzLCBh
ZGRyKTsKPiB9Cj4KV2hlbiBkaXJlY3RfY2FsbGVyIGFuZCBmdW5jdGlvbiB0cmFjZXIgY28taG9v
ayBhIGZ1bmN0aW9uLCB0aGUgc2ltcGxlCmRpYWdyYW0gaXMgbGlrZSB0aGlzOgoKYGBgCmZ1bmMg
LT4gZnRyYWNlX3JlZ3NfY2FsbGVyIC0+IGFyY2hfZnRyYWNlX29wc19saXN0X2Z1bmMgLT4KZnVu
Y3Rpb25fdHJhY2VfY2FsbCAvLyB3cml0ZSByaW5nYnVmZmVyCiAgICAgICAgICAgIHwKICAgICAg
ICAgICAgICAgICAtPiBjYWxsX2RpcmVjdF9mdW5jcyAvLyByZWdzLT50MSA9IGRpcmVjdF9jYWxs
ZXIKICAgICAgICAgICAtPiB0MSAhPTAgJiYganIgdDEgLy8gZ290byBkaXJlY3RfY2FsbGVyCmBg
YAoKQW5kIHRoZSBkaXJlY3RfY2FsbGVyIGhhcyBhIHNpbWlsYXIgaW1wbGVtZW50IGFzIGZ0cmFj
ZV9jYWxsZXIuCgpgYGAKZGlyZWN0X2NhbGxlcjoKYWRkIHNwLHNwLC0/CnNkIHQwLD8oc3ApCnNk
IHJhLD8oc3ApCmNhbGwgZm9vCmxkIHQwLD8oc3ApCmxkIHJhLD8oc3ApCmFkZCBzcCxzcCw/Cmpy
IHQwIC8vIDwtIGJhY2sgdG8gZnVuY3Rpb24gZW50cnkKYGBgCgpJZiB3ZSBjaGFuZ2UgcmVncy0+
dDAgYXMgZGlyZWN0X2NhbGxlciBhbmQgZXhlY3V0ZSBganIgdDBgIGRpcmVjdGx5LAp0aGUgZGly
ZWN0X2NhbGxlciB3aWxsIGFsd2F5cyBqdW1wIHRvIGl0c2VsZiBkdWUgdG8gaXRzIGxhc3QgYGpy
YCBpbnN0LgoKYGBgCmZ1bmMgLT4gZnRyYWNlX3JlZ3NfY2FsbGVyIC0+IGFyY2hfZnRyYWNlX29w
c19saXN0X2Z1bmMgLT4KZnVuY3Rpb25fdHJhY2VfY2FsbCAvLyB3cml0ZSByaW5nYnVmZmVyCiAg
ICAgICAgICAgIHwKICAgICAgICAgICAgICAgICAtPiBjYWxsX2RpcmVjdF9mdW5jcyAvLyByZWdz
LT50MCA9IGRpcmVjdF9jYWxsZXIKICAgICAgICAgICAtPiBqciB0MCAvLyBnb3RvIGRpcmVjdF9j
YWxsZXIKCmRpcmVjdF9jYWxsZXI6Ci4uLgpzZCB0MCw/KHNwKQouLi4KbGQgdDAsPyhzMCkKLi4u
CmpyIHQwIC8vIGdvdG8gZGlyZWN0X2NhbGxlciBhbHdheXMKYGBgCgpIb3BlIEkgbWFkZSBpdCBj
bGVhci4KPiA+Cj4gPiBBY3R1YWxseSB0aGUgcmVnIHQwIGFsd2F5cyBzYXZlcyB0aGUgYWRkcmVz
cyBvZiBmdW5jdGlvbiBlbnRyeSB3aXRoIDhCCj4gPiBvZmZzZXQsIGl0IHNob3VsZCBvbmx5Cj4g
PiBjaGFuZ2VkIGJ5IHRoZSBJUE1PRElGWSBvcHMgaW5zdGVhZCBvZiB0aGUgZGlyZWN0X29wcy4K
PiA+ID4+Cj4gPiA+PiArfQo+ID4gPj4gKwo+ID4gPj4gICNlbmRpZiAvKiBDT05GSUdfRFlOQU1J
Q19GVFJBQ0VfV0lUSF9SRUdTICovCj4gPiA+Pgo+ID4gPj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZ
X18gKi8KPiA+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKPiA+ID4+IGluZGV4IDQ2NmM2ZWYyMTdi
MS4uYjg5Yzg1YTU4NTY5IDEwMDY0NAo+ID4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbWNv
dW50LWR5bi5TCj4gPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKPiA+
ID4+IEBAIC0yMzMsNiArMjMzLDcgQEAgRU5EUFJPQyhmdHJhY2VfY2FsbGVyKQo+ID4gPj4gICNl
bHNlIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiA+ID4+ICBFTlRSWShm
dHJhY2VfcmVnc19jYWxsZXIpCj4gPiA+PiAgICAgICAgIFNBVkVfQUJJX1JFR1MgMQo+ID4gPj4g
KyAgICAgICBSRUdfUyAgIHgwLCBQVF9UMShzcCkKPiA+ID4+ICAgICAgICAgUFJFUEFSRV9BUkdT
Cj4gPiA+Pgo+ID4gPj4gIGZ0cmFjZV9yZWdzX2NhbGw6Cj4gPiA+PiBAQCAtMjQxLDcgKzI0Miwx
MCBAQCBmdHJhY2VfcmVnc19jYWxsOgo+ID4gPj4KPiA+ID4+Cj4gPiA+PiAgICAgICAgIFJFU1RP
UkVfQUJJX1JFR1MgMQo+ID4gPj4gKyAgICAgICBibmV6ICAgIHQxLC5MZGlyZWN0Cj4gPiA+PiAg
ICAgICAgIGpyIHQwCj4gPiA+PiArLkxkaXJlY3Q6Cj4gPiA+PiArICAgICAgIGpyIHQxCj4gPiA+
PiAgRU5EUFJPQyhmdHJhY2VfcmVnc19jYWxsZXIpCj4gPiA+Pgo+ID4gPj4gIEVOVFJZKGZ0cmFj
ZV9jYWxsZXIpCj4gPiA+PiAtLQo+ID4gPj4gMi4yMC4xCj4gPiA+Pgo+ID4gPgo+ID4gPgo+ID4g
PiAtLQo+ID4gPiBCZXN0IFJlZ2FyZHMKPiA+ID4gIEd1byBSZW4KPgo+Cj4KPiAtLQo+IEJlc3Qg
UmVnYXJkcwo+ICBHdW8gUmVuClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
