Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5D6C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 01:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQ6hcqZnhW57K+JBim+WPTBauPv7zAY9sTAQqeOzq9E=; b=FIr5OgPudX4Qo+
	mnOlfmle25trPhQIm1Qx3l5NfpzAzcHQTPNKVvsqZqV7Lfun0YjRp2g68Tvx71mAiGmm9ZvEv0NOb
	Q+bafQoiyXMu1QqxAARIkTygwDoQwM119QHbxVAVs4D69r59XQZ9hgsOf6oi4RscL31xgmWp3tZ8s
	hwueOA+D6RyMlZppKfqnrJd9iDaj+Ujw4jOA9Tyg8UYR8jesD5zWjdr6gykYUh/YKUgbOpLDJlzOS
	xA2ufCz7jbyNBX6IAbzfnoA9Jcsr43z9baQeD4ZxgfHRq539NqCHg/mrdqoxPvWljjpEZNIeRZrhb
	iqwnwcXCtz5TWtGG1TTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyNuK-00C9yF-7R; Fri, 25 Nov 2022 01:53:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyNuH-00C9wt-AF
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 01:53:34 +0000
Received: by mail-pf1-x430.google.com with SMTP id x66so2888188pfx.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 17:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXQVt0h+pcpEUzQ0rG/bapcrBmAHayOWk2YjYsGPK0c=;
        b=L6YegcttMNJWrf/sMnBsIZ2psJKiN3k0P5iY6QHS965IMIzXJFAu618/8qy70uvlnf
         yY3Uir/UEnDb1nN6vLycAulTCcBIOm7kK51BjxnGkzcmUazWTr5deEKD8Bl9uzVrKsDI
         wMaP1ogdR11PgdXJalJYWQZ6q543NMvVAuZCIFHtPXNETiF9FoRdDkGPLnWCi1PlGeyP
         zyrd05JKGjDC02xH3+lSXh95NnmBZ0IY2bnxMiXLF8P/S4YsqlrpVRazsi3cw2XCe1fE
         NMqQ5D+fswnqxXHxYvx8cPAQwbJjZMZIn6M9CzqiP3dw5SDGfFMVbi1f0IPROh18LVvc
         o8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXQVt0h+pcpEUzQ0rG/bapcrBmAHayOWk2YjYsGPK0c=;
        b=5aqbbZo8ZR5mKuiztiKYySrotUxqvBJK1C59S58wxXF1K15amwOzmESeXE4mX0YJsX
         sc8XSIEdSanjm3JR4XUvoFEmDnqQIEp0R9+JUyKwTEPV2CIlOKdZSznsEY0yRO6EG9dd
         gMqmL3McNDs02MRsm2RxcSeSp6jTJbSWzAIoG1F+jZiGBCM+PM29t3JqaF2XcmTNrhvg
         jXT4UZnbor2wfJGoxylOxcbdRh5hId1hTVPSGzSMjSZbfcQmTxBDKv3Uz/8nvF8DW04e
         X67SupRcNgPdkVmnnG1Nj9ObBEQJtbpILejAXEv8Cj183HCFxTFVO7++H736ANIdjd4P
         0jPw==
X-Gm-Message-State: ANoB5pmktBlJUL5CZXHOsNDD8NKmjMupuQpHxZjbnaogoQCdmu2hubkN
	UWjj1sCpwvAuViQhKfrjj/He/Hdedj7z3Sj+B3M=
X-Google-Smtp-Source: AA0mqf5d7INgWCp+sfzP40RVpZ97fEh3UJhx0EHTDJM9/wPMWwRtrnjOHWuEwxfIN8yVh23kVD1U99qz4yhnMKcUmPw=
X-Received: by 2002:aa7:824f:0:b0:56e:8ed7:569f with SMTP id
 e15-20020aa7824f000000b0056e8ed7569fmr8656515pfn.19.1669341211152; Thu, 24
 Nov 2022 17:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
 <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com> <CAJF2gTTWSr0qYTnRORSexEHMqUt-Lj6xZd0O-fUgC+f74FfCZA@mail.gmail.com>
In-Reply-To: <CAJF2gTTWSr0qYTnRORSexEHMqUt-Lj6xZd0O-fUgC+f74FfCZA@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Fri, 25 Nov 2022 01:53:19 +0000
Message-ID: <CAAYs2=ifvfY3QW07LXL+B6KH6b3EELMcXuz6ja_rYNE=G4+=qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_175333_392286_C6F0EFE5 
X-CRM114-Status: GOOD (  29.86  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDI05pel5ZGo5ZubIDE1
OjMx5YaZ6YGT77yaCj4KPiBPbiBUaHUsIE5vdiAyNCwgMjAyMiBhdCAxOjI3IEFNIFNvbmcgU2h1
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
ZWFkIGxvb3AuCj4gPgo+ID4gQWN0dWFsbHkgdGhlIHJlZyB0MCBhbHdheXMgc2F2ZXMgdGhlIGFk
ZHJlc3Mgb2YgZnVuY3Rpb24gZW50cnkgd2l0aCA4Qgo+ID4gb2Zmc2V0LCBpdCBzaG91bGQgb25s
eQo+ID4gY2hhbmdlZCBieSB0aGUgSVBNT0RJRlkgb3BzIGluc3RlYWQgb2YgdGhlIGRpcmVjdF9v
cHMuCj4gSG93IGFib3V0Ogo+IHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2Z0cmFjZV9zZXRfZGly
ZWN0X2NhbGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywKPiB1bnNpZ25lZCBsb25nIGFkZHIpCj4g
ewo+ICAgICAgICAgICAgICAgIHJlZ3MtPnQxID0gcmVncy0+dDA7Cj4gICAgICAgICAgICAgICAg
cmVncy0+dDAgPSBhZGRyOwo+Cj4gZGlyZWN0X2NhbGxlcjoKPiBhZGQgc3Asc3AsLT8KPiBzZCB0
MSw/KHNwKQpkaXJlY3RfY2FsbGVyIGFsc28gc2VydmVzIGFzIHRoZSBmaXJzdCB0cmFtcG9saW5l
IGFzIGZ0cmFjZV9jYWxsZXIsIGxpa2UgdGhpczoKYGBgCmZ1bmMgLS0gZGlyZWN0X2NhbGxlcgog
ICAgICAgIC0tIGZ0cmFjZV9bcmVnc11fY2FsbGVyCmBgYApTbyB0aGUgdDEgaW4gdGhpcyBsaW5l
IGhhcyB0byBiZSB0MCB0byBzYXZlIHRoZSBQQy4KPiBzZCByYSw/KHNwKQo+IGNhbGwgZm9vCj4g
bGQgdDEsPyhzcCkKQW5kIHRoaXMgbGluZS4KPiBsZCByYSw/KHNwKQo+IGFkZCBzcCxzcCw/Cj4g
anIgdDEgLy8gPC0gYmFjayB0byBmdW5jdGlvbiBlbnRyeQo+Cj4gQW5kIGRlbGV0ZSBhbGwgbWNv
dW50LWR5bi5TIG1vZGlmaWNhdGlvbi4KPgo+ID4gPj4KPiA+ID4+ICt9Cj4gPiA+PiArCj4gPiA+
PiAgI2VuZGlmIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KPiA+ID4+Cj4g
PiA+PiAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+ID4gPj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL21jb3VudC1keW4uUyBiL2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4u
Uwo+ID4gPj4gaW5kZXggNDY2YzZlZjIxN2IxLi5iODljODVhNTg1NjkgMTAwNjQ0Cj4gPiA+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKPiA+ID4+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL21jb3VudC1keW4uUwo+ID4gPj4gQEAgLTIzMyw2ICsyMzMsNyBAQCBFTkRQUk9D
KGZ0cmFjZV9jYWxsZXIpCj4gPiA+PiAgI2Vsc2UgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJ
VEhfUkVHUyAqLwo+ID4gPj4gIEVOVFJZKGZ0cmFjZV9yZWdzX2NhbGxlcikKPiA+ID4+ICAgICAg
ICAgU0FWRV9BQklfUkVHUyAxCj4gPiA+PiArICAgICAgIFJFR19TICAgeDAsIFBUX1QxKHNwKQo+
ID4gPj4gICAgICAgICBQUkVQQVJFX0FSR1MKPiA+ID4+Cj4gPiA+PiAgZnRyYWNlX3JlZ3NfY2Fs
bDoKPiA+ID4+IEBAIC0yNDEsNyArMjQyLDEwIEBAIGZ0cmFjZV9yZWdzX2NhbGw6Cj4gPiA+Pgo+
ID4gPj4KPiA+ID4+ICAgICAgICAgUkVTVE9SRV9BQklfUkVHUyAxCj4gPiA+PiArICAgICAgIGJu
ZXogICAgdDEsLkxkaXJlY3QKPiA+ID4+ICAgICAgICAganIgdDAKPiA+ID4+ICsuTGRpcmVjdDoK
PiA+ID4+ICsgICAgICAganIgdDEKPiA+ID4+ICBFTkRQUk9DKGZ0cmFjZV9yZWdzX2NhbGxlcikK
PiA+ID4+Cj4gPiA+PiAgRU5UUlkoZnRyYWNlX2NhbGxlcikKPiA+ID4+IC0tCj4gPiA+PiAyLjIw
LjEKPiA+ID4+Cj4gPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IEJlc3QgUmVnYXJkcwo+ID4gPiAg
R3VvIFJlbgo+Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KVGhhbmtzLApTb25n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
