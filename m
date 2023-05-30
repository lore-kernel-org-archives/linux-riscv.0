Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581A3C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+37v4s/IdG1wX0ekQhY0OQDS5ClavADjlnJ6J7TXB64=; b=reZhBL9kYbrgzm
	X5T2uHgOJxUI1bED1wAufRJY+HQcADm+Pwl4jHkEHTyE/Upp7rI5bZiozm4ZM/Su6gIlDrBNyl0zA
	urzaBIKmH3COFKGumkyct18Qld96In+lV3+4GxbNMfOuF2s44lG0vKHtxZByEGYbgetRxgalL2Hm2
	P2aoeWWgW0ge8hEW3GpztHN0jbePDSs1F+DnspkiIFRh+TgS8HbmlP8yu+WBmgWsA4Td0TH3IOI+6
	lF2licjPDpNJI8gft3UnBNwWPBw+y+JBFh4gNWtBiHt45UvtcyU0ndZgkE0aydrS4H73IjfopVEk4
	aFLZgjA13oRm46cl9OLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43i3-00Epva-1W;
	Tue, 30 May 2023 18:04:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43i0-00EpuR-0J
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 18:04:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30af86a966eso565064f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 11:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685469869; x=1688061869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uURBJv3g3ArZjasZD7kZVLWPQS4crCRORUOeGLZEc5w=;
        b=rCUYS0XDeitzk6/vdzhfmQ41b+Q/9ZjTuImmhA13YTNiQ+DUzem67lU9gOA71a9mzs
         cp3bCFVuUTHqp1tmYAjVf4v5ysdDLuzNC1kOoGdYJnRYZKx1iy93cEb2xJULiwdjq0MP
         XuWqfhxnPio9zYN+9Id+54Ut4jFCNzbPQsHtM/XlzyyrAS9W7TKQiZpr3YGwmIMz2bzY
         4npL2miIWklD5rqGaTc0+jsImOSJKWb33VFo39vhdET1GpKEf+LFF3JOd+0Pcl/cKnXN
         wkSFchuNlT2muLwsruVnQe/T6c60AcuxQg3PhFNBvizGDbckiWDUQAIdFHYmYCTDr9x4
         GKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685469869; x=1688061869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uURBJv3g3ArZjasZD7kZVLWPQS4crCRORUOeGLZEc5w=;
        b=R7CVZmh616PkLVVSPpCqiP4gLlKBLFFULFL1CLRJYaaVJL+Gs1lYQZBzLLcDL6L+dn
         P04cdIALmE4UXVShXiHLWef0j31Odmayda1wHfRcwXX9BOh043liNIVT5aAKhmVU5sSn
         bcUh33m9MIEG990eo6clzKgTzP/cDEdhHCmpawiaBgLah6escN7c3xXt09dx55RuQrcQ
         6qm7D6jl1G1byANgeS+ldMOVmgduXU5GTjCV1nHVxTHIk1XfCENAb3///im4N3ifF1Nh
         P38c7nnpUbAuPn7Z3QelIiQ7ArqWW8JHpc+R/IR3V9FIFzNgiCOcSirUjGpY7y40lheu
         B+MQ==
X-Gm-Message-State: AC+VfDx37cBho8pRdAm/9K+VKAvymXv4kUxkpEEDZiPUNnUJ8+7h18jj
	u+TP95fTguUCe/5jEw2qJ/AUKBN6aY2zvQ/NZub1Zw==
X-Google-Smtp-Source: ACHHUZ4TTBov4Ybg5E9FJ1qhnxNQ7HpfJ7GUFJKCEGWtauoRcccHns1I61grv9X0MCvQWxeUv5Og1A6WRUn6K8+U8Y4=
X-Received: by 2002:adf:e84d:0:b0:2f2:9198:f0f with SMTP id
 d13-20020adfe84d000000b002f291980f0fmr2308885wrn.10.1685469868973; Tue, 30
 May 2023 11:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
 <CAHVXubgx3uBEjMLHXTxr0192ZHbSb=qK4NggZyWQTDfgrJt2-g@mail.gmail.com>
 <20230528-darkness-grandly-6cb9e014391d@spud> <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
 <20230528-uneatable-earpiece-3f8673548863@spud> <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
 <20230529-skillet-quarters-3fbc3b6edb3a@spud> <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
 <20230530-polka-trifle-7ccd7a093099@wendy> <92d4aaa8-a1ed-74e1-3a22-df9be1ca1e4a@ghiti.fr>
 <20230530-hatchery-unifier-64d7a2ffe0d0@spud>
In-Reply-To: <20230530-hatchery-unifier-64d7a2ffe0d0@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 30 May 2023 20:04:17 +0200
Message-ID: <CAHVXubgG31moSNOe3fRqFzUSJK9tRWKH1KPP_BO7wRNC4WzxTQ@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@linux-m68k.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_110436_329690_E0775D78 
X-CRM114-Status: GOOD (  40.35  )
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgNzo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAzMCwgMjAyMyBhdCAwNDozMzo0NVBNICsw
MjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPgo+ID4gT24gMzAvMDUvMjAyMyAxMzoyNywg
Q29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBNb24sIE1heSAyOSwgMjAyMyBhdCAwOTozNzoy
OFBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+ID4gT24gMjkvMDUvMjAyMyAy
MTowNiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+ID4gT24gTW9uLCBNYXkgMjksIDIwMjMg
YXQgMDg6NTE6NTdQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPiA+ID4gPiBP
biAyOC8wNS8yMDIzIDE1OjU2LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24g
U3VuLCBNYXkgMjgsIDIwMjMgYXQgMDM6NDI6NTlQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdy
b3RlOgo+ID4gPiA+ID4gPiA+ID4gSG1tbSwgaXQgc3RpbGwgd29ya3MgZm9yIG1lIHdpdGggYm90
aCBjbGFuZyBhbmQgZ2NjLTkuCj4gPiA+ID4gPiA+ID4gZ2NjLTkgaXMgYSBiaXQgb2YgYSByZWxp
YywgZG8geW91IGhhdmUgbW9yZSByZWNlbnQgY29tcGlsZXJzIGx5aW5nCj4gPiA+ID4gPiA+ID4g
YXJvdW5kPyBJZiBub3QsIEkgY2FuIHRyeSBzb21lIG9sZGVyIGNvbXBpbGVycyBhdCBzb21lIHBv
aW50Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBZb3UgZG9uJ3QgaGF2ZSB0byBkbyB0
aGF0IG5vdyBidXQgaXMgdGhlcmUgYSB3YXkgSSBjb3VsZCBnZXQgeW91ciBjb21waWxlZAo+ID4g
PiA+ID4gPiA+ID4gaW1hZ2U/IFdpdGggdGhlIHNoYTEgdXNlZCB0byBidWlsZCBpdD8gU29ycnks
IEkgZG9uJ3Qgc2VlIHdoYXQgaGFwcGVucywgSQo+ID4gPiA+ID4gPiA+ID4gbmVlZCB0byBnZXQg
bXkgaGFuZHMgZGlydHkgaW4gc29tZSBkZWJ1ZyEKPiA+ID4gPiA+ID4gPiBXaGF0IGRvIHlvdSBt
ZWFuIGJ5ICJzaGExIj8gSXQgZmFsbHMgd2l0aCB2Ni40LXJjMSB3aGljaCBpcyBhIHN0YWJsZQo+
ID4gPiA+ID4gPiA+IGhhc2gsIGlmIHRoYXQncyB3aGF0IHlvdSdyZSBsb29raW5nIGZvci4KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE90aGVyd2lzZSwKPiA+ID4gPiA+ID4gPiBodHRwczov
L2dpdGh1Yi5jb20vQ29uY2h1T0QvcmlzY3YtZW52L3JlbGVhc2VzL2Rvd25sb2FkL3YyMDIyLjAz
L3ZtbGludXguYmluCj4gPiA+ID4gPiA+ID4gKGlnbm9yZSB0aGUgcmVsZWFzZSBjcmFwIGhhaGEs
IHRvbyBsYXp5IHRvIGZpbmQgYSBwcm9wZXIgaG9zdGluZwo+ID4gPiA+ID4gPiA+IG1lY2hhbmlz
bSkKPiA+ID4gPiA+ID4gT2ssIEkgZG9uJ3QgZ2V0IG11Y2ggaW5mbyB3aXRob3V0IHRoZSBzeW1i
b2xzLCBjYW4geW91IGFsc28gcHJvdmlkZSB0aGUKPiA+ID4gPiA+ID4gdm1saW51eCBwbGVhc2U/
IEJ1dCBhdCBsZWFzdCB5b3VyIGltYWdlIGRvZXMgbm90IGJvb3QsIG5vdCBkdXJpbmcgdGhlIGVh
cmx5Cj4gPiA+ID4gPiA+IGJvb3QgdGhvdWdoIGJlY2F1c2UgdGhlIG1tdSBpcyBlbmFibGVkLgo+
ID4gPiA+ID4gRG8geW91IHNlZSBhbnl0aGluZyBwcmludCB3aGVuIHlvdSB0cnkgaXQ/IENvcyBJ
IGRvIG5vdC4gSWZmIEkgaGF2ZSB0aW1lCj4gPiA+ID4gPiB0b21vcnJvdywgSSdsbCBnbyBwb2tp
bmcgd2l0aCBnZGIuIEknbSBzb3JyeSBJIGhhdmUgbm90IHJlYWxseSBkb25lIGFueQo+ID4gPiA+
ID4gaW52ZXN0aWdhdGluZywgSSBoYXZlIGJlZW4gcmVhbGx5IGJ1c3kgdGhpcyBsYXN0IHdlZWsg
b3Igc28gd2l0aAo+ID4gPiA+ID4gZHQtYmluZGluZyBzdHVmZiBidXQgSSBzaG91bGQgYmUgZnJl
ZXIgYWdhaW4gZnJvbSB0b21vcnJvdy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBodHRwczovL2dpdGh1
Yi5jb20vQ29uY2h1T0QvcmlzY3YtZW52L3JlbGVhc2VzL2Rvd25sb2FkL3YyMDIyLjAzL3ZtbGlu
dXgKPiA+ID4gPgo+ID4gPiA+IEJldHRlciwgdGhlIHRyYXAgaGFwcGVucyBpbiBrYXNhbl9lYXJs
eV9pbml0KCkgd2hlbiBpdCB0cmllcyB0byBhY2Nlc3MgYQo+ID4gPiA+IGdsb2JhbCBzeW1ib2wg
dXNpbmcgdGhlIEdPVCBidXQgZW5kcyB1cCB3aXRoIGEgTlVMTCBwb2ludGVyLCB3aGljaCBpcyB3
ZWlyZC4KPiA+ID4gPiBTbyB0byBtZSwgdGhpcyBpcyBub3QgcmVsYXRlZCB0byBrYXNhbiwgaXQg
aGFwcGVucyB0aGF0IGthc2FuX2Vhcmx5X2luaXQoKQo+ID4gPiA+IGlzIHRoZSBmaXJzdCBmdW5j
dGlvbiBjYWxsZWQgYWZ0ZXIgZW5hYmxpbmcgdGhlIG1tdSwgSSB0aGluayB5b3UgbWF5IGhhdmUg
YW4KPiA+ID4gPiBpc3N1ZSB3aXRoIHRoZSBmaWxsaW5nIG9mIHRoZSByZWxvY2F0aW9ucy4KPiA+
ID4gWWVhaCwgaXQgcmVwcm9kdWNlcyB3aXRob3V0IEtBU0FOLgo+ID4gPgo+ID4gPiA+IFNvcnJ5
IHRvIGJvdGhlciB5b3UgYWdhaW4sIGJ1dCBpZgo+ID4gPiA+IGF0IHNvbWUgcG9pbnQgeW91IGNh
biByZWNvbXBpbGUgd2l0aCBERUJVR19JTkZPIGVuYWJsZWQsIHRoYXQgd291bGQgYmUKPiA+ID4g
PiBwZXJmZWN0ISBBbmQgYWxzbyBwcm92aWRlIHRoZSB2bWxpbnV4LnJlbG9jcyBmaWxlLiBTb3Jy
eSBmb3IgYWxsIHRoYXQsIHRvbwo+ID4gPiA+IGJhZCBJIGNhbid0IHJlcHJvZHVjZSBpdC4KPiA+
ID4gTmV3IHZtbGludXggJiB2bWxpbnV4LnJlbG9jcyBoZXJlOgo+ID4gPiBodHRwczovL21pY3Jv
Y2hpcHRlY2hub2xvZ3ktbXkuc2hhcmVwb2ludC5jb20vOnU6L2cvcGVyc29uYWwvY29ub3JfZG9v
bGV5X21pY3JvY2hpcF9jb20vRVpwRk54WVlybk5BaDVaM2MtcmYwcFVCQnBkUEdUTGFmcWR0ZmNY
UlVVQmtYdz9lPTdLS01IWAo+ID4gPiBUaGV5J3JlIHByZXR0eSBtYXNzaXZlIHVuZm9ydHVuYXRl
bHkgJiBob3BlZnVsbHkgdGhhdCBpcyBub3Qgc29tZQo+ID4gPiBnYXJiYWdlIGludGVybmFsLW9u
bHkgbGluay4KPiA+ID4gLmNvbmZpZyBpcyBhIHdlZSBiaXQgZGlmZmVyZW50LCBjb3MgZGlmZmVy
ZW50IGJ1aWxkIG1hY2hpbmUsIGJ1dCB0aGUKPiA+ID4gcHJvYmxlbSBzdGlsbCBtYW5pZmVzdHMg
b24gYSBpY2ljbGUuIEkndmUgYWRkZWQgaXQgdG8gdGhlIHRhcmJhbGwganVzdAo+ID4gPiBpbiBj
YXNlLgo+ID4KPiA+Cj4gPiBPayBzbyBJIGhhZCB0byByZWNyZWF0ZSB0aGUgSW1hZ2UgZnJvbSB0
aGUgZmlsZXMgeW91IGdhdmUgbWUgYW5kIGl0IGJvb3RzCj4gPiBmaW5lIHVzaW5nIHFlbXU6IGlz
IHRoYXQgZXhwZWN0ZWQ/IEJlY2F1c2UgeW91IG9ubHkgbWVudGlvbiB0aGUgaWNpY2xlCj4gPiBh
Ym92ZS4KPgo+IFVuZm9ydHVuYXRlbHkgeW91IHNlbnQgdGhpcyBvbmUgcmlnaHQgYXMgSSBsZWZ0
IHdvcmsuLgo+IEkgc3NoJ2VkIGluIHRob3VnaCBhbmQgcmFuIHRoZSB2bWxpbnV4LmJpbiAmIGhh
ZCB0aGUgc2FtZSBpc3N1ZXMuCj4gU2lsbHkgcXVlc3Rpb24gcGVyaGFwcyAtIGlzIGl0IGp1c3Qg
bm90IHBvc3NpYmxlIHRvIGJvb3Qgc29tZXRoaW5nIHRoYXQKPiBoYXMgYmVlbiBoaXQgd2l0aCBg
b2JqY29weSAtTyBiaW5hcnkgdm1saW51eCB2bWxpbnV4LmJpbmAgd2l0aAo+IENPTkZJR19SRUxP
Q0FUQUJMRT8gQXQgdGhpcyBwb2ludCB0aGF0J3MgdGhlIG1haW4gdGhpbmcgdGhhdCBzdGlja3Mg
b3V0Cj4gdG8gbWUgYXMgYmVpbmcgZGlmZmVyZW50LiBZb3UgY291bGRuJ3QgYm9vdCB0aGUgdm1s
aW51eC5iaW4gdGhhdCBJIHNlbnQKPiB5b3UgZWl0aGVyLgoKQWhhaCwgSSB0aGluayB3ZSBmb3Vu
ZCB0aGUgY3VscHJpdCEKCldpdGggQ09ORklHX1JFTE9DQVRBQkxFLCB2bWxpbnV4IGlzIGFjdHVh
bGx5IHN0cmlwcGVkIGZyb20gYWxsIHRoZQpyZWxvY2F0aW9ucyAoc28gdGhhdCBpdCBjYW4gYmUg
c2hpcHBlZCkgYW5kIHZtbGludXgucmVsb2NzIGlzIHdoYXQgeW91CnNob3VsZCB1c2UgaW5zdGVh
ZCwgc2luY2UgaXQgaXMganVzdCBhIGNvcHkgb2Ygdm1saW51eCBiZWZvcmUgdGhlCnJlbW92YWwg
b2YgdGhlIHJlbG9jYXRpb25zIQoKPgo+IENoZWVycywKPiBDb25vci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
