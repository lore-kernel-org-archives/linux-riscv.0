Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9897CC87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCNAxv5hNrYkCKObOG0+IXdhvwYWvVN4poEYA9fXueI=; b=F7BJA6SQR5hWiw
	kOKZsJW5q/tZGTmFJ1u0U8GD+6TjFAPdYKYTRqINyo9kQt4sl3WZ3j3JAZXzH9rxKH03ja+vKWDkX
	jMwGDTnJ5PP0jspt6PFa4h1fusAC6BnzQCamf0dgJpqSyMm3hnl2BZ0DP4z/bx/5gQPHmvCbtom2a
	ePxXqE0KA6I2yKgOm1OQRqzXrtFUG2c2kbSfxr0257OXIfAdUb2Ef6W20X7oSQ6po59sv4C/AagcH
	1A7zgAETyWAGbmIJLEcHqxkPA//LwheG034soVTgWxnwnAw5sS92zfOcPrmuEYqSck6XcozVK0175
	hy+rMuj6523pGJEijgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufNRl-0000000AUZ5-3v02;
	Fri, 25 Jul 2025 18:47:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufNRj-0000000AUYQ-3HHi
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 18:47:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso123447f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753469226; x=1754074026; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PcwJfFG0dMINHTXL+EGs7wi5PgpNiUrzuZGSnnkqAU=;
        b=IubQYY3lK6oHGYBC+EU4EdlUZ04xPNbDhKZ8cgDCNinWGBAhB9opxYyQkqykutBmPB
         aNSuA0yQo9ABJa0BZgcqQKN5B49S0DxxsWemp1u+4NeWqqMMN4WiYUugKx9xKPyjPGVS
         CYhQBzRWxR9oSBpbacsfZ61B/sNqLJQD86tP7RscyPWiX/bMlVjVjquLVwSrFH39ei5A
         Pl1873wmU1IrmqmPJP6E2USKVtAkDcxVshb3OMMp93iaFKjeX+GJhP6gTyLYPJRsIqre
         fvA8SrKvJojrcDOFa8RTJzC6Toar61kFWclTM2jb1uz/uV+3Nv2Ka6N10MzktX5WUZGL
         +GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469226; x=1754074026;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2PcwJfFG0dMINHTXL+EGs7wi5PgpNiUrzuZGSnnkqAU=;
        b=sVyYUUxkUN7nKF6G0FrQUFaKzovs5j8PRv23Nl728NhpWX6SKSbUfCQRozLR8Qs7xp
         DWH0bqXOh7fEgYkR4Q5b5RpGE6TFeJv47gtkFg3pra/e2dKbuCQc0TeJqbMNlkHdVqqs
         hEAb0zN4mBmP7Wg8D8tq93ZMsg3qklKODroXZSCWb/WQ7qOZnA2OCctUiZSNaEXv6ZC5
         7KRlgRty8lGsAAFZQyY+qNoxbugyf+GZnhbbVUfbQgnb8+8nKtDVHsupGAFJ9y57n6vx
         pEhPSRAMQLBW1GdbJ/CRo2kHeDAozNBD3TyCcSPdFp4+Vr5kGT3n3SCnuv0Gv2WGBUGk
         sSNw==
X-Forwarded-Encrypted: i=1; AJvYcCWEBlA0AmprEKvbaBX3Qq710qEf4S4t83Nft3N9OK7L5KdRtW4epgvSdbuYP7dLDGVK9v7OAkZDd+RGnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKeNJaLiWR/1heY9VxUpJ0OtrVmjFTv7DZEWWkswsN++eegPm8
	YRKatip49/I7wUNrfAu/EqBs5fgArVorKmlUR50MENQjuV+elTw3HeaEUnrLe+UNvuc=
X-Gm-Gg: ASbGnct4PVgrM3Hl+8IelorKzAH19twZaNlMW2ce/ugeELQPJbh0jeFuU5Y5L+qEB/H
	h0bk5wtIAid04g1BtsAiEfsRgSe7nO73xCko4RSSVbjp0gKHHBacqrio1NPRZ5z8TuzOxNKqIgr
	R61JEWu7h3M0FwVo6dDUuEp+72TOvg2Cvp+zVOsYpFZT8Nu3wHAKlYN8lFF+YuV+QZDCEYTFYw9
	IH3e4F/zX5l7s79IVzWwHhNLQ4uaiX6R5vkKICbISBcFkoff7gBHAD0nyQDtZKW138FJvIvo6QB
	nMP2EFA2YSNaE3vQYTDjFVZxz4dEy/XgkKyNFYu4sjuKdIUcI/EIORyZ4pgN7djV3FwgZp0B7xh
	jEqXlk49B8w3YFRB/WQWyfWmGHo9PKg==
X-Google-Smtp-Source: AGHT+IERcnhDoDHJATyBIDHX/Fz368IlSTKTvTxrXpoOV1OgdXYCGFXhA0fSjBPI2vbo+UxnHhV7RQ==
X-Received: by 2002:a05:6000:1889:b0:3a3:61ab:86c2 with SMTP id ffacd0b85a97d-3b776732d2cmr1202211f8f.7.1753469225927;
        Fri, 25 Jul 2025 11:47:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8c15:2281:5347:b367])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778f26cc1sm574187f8f.82.2025.07.25.11.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:47:05 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 25 Jul 2025 20:47:04 +0200
Message-Id: <DBLCYPBLQBSQ.170ND7Z93GPK4@ventanamicro.com>
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Vivian Wang" <wangruikang@iscas.ac.cn>, "Drew Fustini"
 <fustini@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, "Alexandre Ghiti"
 <alex@ghiti.fr>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Samuel
 Holland" <samuel.holland@sifive.com>, "Drew Fustini"
 <dfustini@tenstorrent.com>, "Andy Chiu" <andybnac@gmail.com>, "Conor
 Dooley" <conor.dooley@microchip.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <cc82c938-def3-4df6-9fc9-fc321af7d54a@iscas.ac.cn>
 <DBL2588APTCA.2XUKQCJ0DW89C@ventanamicro.com>
 <feb3549f-da91-4eaa-a624-b9f35db6ba3c@iscas.ac.cn>
In-Reply-To: <feb3549f-da91-4eaa-a624-b9f35db6ba3c@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_114707_821529_A1284386 
X-CRM114-Status: GOOD (  22.71  )
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

MjAyNS0wNy0yNVQyMzowMTowMyswODowMCwgVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2Fz
LmFjLmNuPjoKPiBPbiA3LzI1LzI1IDE4OjE4LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+IDIw
MjUtMDctMjRUMDU6NTU6NTQrMDg6MDAsIFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5h
Yy5jbj46Cj4+PiBPbiA3LzE5LzI1IDExOjM5LCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4+Pj4gRnJv
bTogRHJldyBGdXN0aW5pIDxkZnVzdGluaUB0ZW5zdG9ycmVudC5jb20+Cj4+Pj4gQ2xvYmJlcmlu
ZyB0aGUgdmVjdG9yIHJlZ2lzdGVycyBjYW4gc2lnbmlmaWNhbnRseSBpbmNyZWFzZSBzeXN0ZW0g
Y2FsbAo+Pj4+IGxhdGVuY3kgZm9yIHNvbWUgaW1wbGVtZW50YXRpb25zLiBUbyBtaXRpZ2F0ZSB0
aGlzIHBlcmZvcm1hbmNlIGltcGFjdCwgYQo+Pj4+IHBvbGljeSBtZWNoYW5pc20gaXMgcHJvdmlk
ZWQgdG8gYWRtaW5pc3RyYXRvcnMsIGRpc3RybyBtYWludGFpbmVycywgYW5kCj4+Pj4gZGV2ZWxv
cGVycyB0byBjb250cm9sIHZlY3RvciBzdGF0ZSBkaXNjYXJkIGluIHRoZSBmb3JtIG9mIGEgc3lz
Y3RsIGtub2I6Cj4+PiBTbyBJIGhhZCBhbiBpZGVhOiBJcyBpdCBwb3NzaWJsZSB0byBhdm9pZCBy
ZXBlYXRlZGx5IGRpc2NhcmRpbmcgdGhlCj4+PiBzdGF0ZSBvbiBldmVyeSBzeXNjYWxsIGJ5IHNl
dHRpbmcgVlMgdG8gSW5pdGlhbCBhZnRlciBkaXNjYXJkaW5nLCBhbmQKPj4+IGF2b2lkaW5nIGRp
c2NhcmRpbmcgd2hlbiBWUyBpcyBJbml0aWFsPyBTbzoKPj4+Cj4+PiBpZiAoVlMgPT0gQ2xlYW4g
fHwgVlMgPT0gRGlydHkpIHsKPj4+IMKgIMKgIGNsb2JiZXI7Cj4+PiDCoCDCoCBWUyA9IEluaXRp
YWw7Cj4+PiB9Cj4+Pgo+Pj4gVGhpcyB3b3VsZCBhdm9pZCB0aGlzIHByb2JsZW0gd2l0aCBzeXNj
YWxsLWhlYXZ5IHVzZXIgcHJvZ3JhbXMgd2hpbGUKPj4+IGFkZGluZyBtaW5pbXVtIG92ZXJoZWFk
IGZvciBldmVyeXRoaW5nIGVsc2UuCj4+IEkgdGhpbmsgeW91ciBwcm9wb3NhbCBpbXByb3ZlcyB0
aGUgZXhpc3RpbmcgY29kZSwgYnV0IGlmIGEgdXNlcnNwYWNlIGlzCj4+IHVzaW5nIHZlY3RvcnMs
IGl0J3MgbGlrZWx5IGFsc28gcmVzdG9yaW5nIHRoZW0gYWZ0ZXIgYSBzeXNjYWxsLCBzbyB0aGUK
Pj4gc3RhdGUgd291bGQgaW1tZWRpYXRlbHkgZ2V0IGRpcnR5LCBhbmQgdGhlIG5leHQgc3lzY2Fs
bCB3b3VsZCBhZ2Fpbgo+PiBuZWVkbGVzc2x5IGNsb2JiZXIgdmVjdG9yIHJlZ2lzdGVycy4KPgo+
IFdpdGhvdXQgYW55IGRhdGEgdG8gYmFjayBpdCB1cCwgSSB3b3VsZCBzYXkgdGhhdCBteSB1bmRl
cnN0YW5kaW5nIGlzCj4gdGhhdCB0aGlzIHNob3VsZCBiZSBhIHJhcmUgY2FzZSwgb25seSBoYXBw
ZW5pbmcgaWYgZS5nLiBzb21lb25lIGlzCj4gYWRkaW5nIHByaW50ZiBkZWJ1Z2dpbmcgdG8gdGhl
aXIgdmVjdG9yIGNvZGUuIE90aGVyd2lzZSwgdmVjdG9yIGxvb3BzCj4gc2hvdWxkIG5vdCBoYXZl
IHN5c2NhbGxzIGluIHRoZW0uCj4KPiBBIG1vcmUgcmVhc29uYWJsZSB3b3JyeSB3b3VsZCBiZSBw
cm9ncmFtcyB1c2luZyBSVlYgZXZlcnl3aGVyZSBpbiBhbGwKPiBzb3J0cyBvZiBjb21tb24gb3Bl
cmF0aW9ucy4gSW4gdGhhdCBjYXNlLCBhbHRlcm5hdGluZyBzeXNjYWxscyBhbmQKPiB2ZWN0b3Jz
IHdvdWxkIG1ha2UgdGhlIGRpc2NhcmRpbmcgd2FzdGVmdWwuCgpHb29kIHBvaW50LiAgWWVhaCwg
YXV0by12ZWN0b3JpemF0aW9uIG1pZ2h0IGJlIGhpbmRlcmVkLgoKSW4gdGhlIHdvcnN0IGNhc2Us
IHVzZXJzIGNvdWxkIGp1c3Qgbm90aWNlIHRoYXQgaXQncyBzbG93aW5nIHByb2dyYW1zCmRvd24s
IGFuZCBkaXNhYmxlIGl0IHdpdGhvdXQgbG9va2luZyBmb3IgdGhlIGNhdXNlLgoKPj4gUHJlc2Vy
dmluZyB0aGUgdmVjdG9yIHN0YXRlIHN0aWxsIHNlZW1zIGJldHRlciBmb3IgdXNlcnNwYWNlcyB0
aGF0IHVzZQo+PiBib3RoIHZlY3RvcnMgYW5kIHN5c2NhbGxzLgo+Cj4gSWYgd2UgY2FuIGV4cGVj
dCBlLmcuIHVzZXJzcGFjZSBwcm9ncmFtcyB0byBwcmltYXJpbHkgcmVwZWF0ZWRseSB1c2UgUlZW
Cj4gd2l0aCBubyBzeXNjYWxscyBiZXR3ZWVuIGxvb3BzLCAqb3IqIHByaW1hcmlseSByZXBlYXRl
ZGx5IHVzZSBzeXNjYWxscwo+IHdpdGggcmFyZSBvY2N1cnJlbmNlcyBvZiBSVlYgYmV0d2VlbiBz
eXNjYWxscy4gVGhpcyB3YXksIHRoZSBwcmltYXJpbHkKPiBzeXNjYWxsIHByb2dyYW1zIGNhbiBi
ZW5lZml0IGZyb20gc2xpZ2h0bHkgc3dpdGNoaW5nLCBzaW5jZSB0aGVyZSdzIG5vCj4gbmVlZCB0
byBzYXZlIGFuZCByZXN0b3JlIHN0YXRlIGZvciB0aG9zZSBtb3N0IG9mIHRoZSB0aW1lLiBJbiBl
ZmZlY3QsCj4gc3lzY2FsbHMgc2VydmVzIGFzIGEgaGludCB0aGF0IFJWViBpcyBvdmVyLgoKVGhp
cyB3b3VsZCBuZWVkIGRlZXBlciBhbmFseXNpcywgYW5kIHdlIHdpbGwgcHJvYmFibHkgbmV2ZXIg
YmUgY29ycmVjdAp3aXRoIGEgc3lzdGVtLXdpZGUgcG9saWN5IHJlZ2FyZGxlc3MgLS0gYSByb29t
IGZvciBwcmN0bD8KCkkgdGhpbmsgdGhlcmUgbWlnaHQgYmUgYSBsb3Qgb2YgcHJvZ3JhbXMgdGhh
dCBoYXZlIGEgcmVwZWF0aW5nIHBhdHRlcm4Kb2YgY29tcHV0ZSAtPiBzeXNjYWxsIChlLmcuIHRv
IHdyaXRlIHJlc3VsdHMpLCBhbmQgY2xvYmJlcmluZyBpcyBsb3NpbmcKcGVyZm9ybWFuY2UgaWYg
YSBwcm9ncmFtIGRvZXMgbW9yZSB0aGFuIGEgc2luZ2xlIGxvb3AgcGVyIHN3aXRjaC4KCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaGUgcHJpbWFyaWx5IFJW
ViBwcm9ncmFtcwo+IHNob3VsZCBub3QgYmUgc3dpdGNoaW5nIGFzIG11Y2ggLSBpZiB0aGV5IGFy
ZSwgdGhhdCdzIGEgc2lnbiBvZiBDUFUKPiByZXNvdXJjZXMgYmVpbmcgb3ZlcnN1YnNjcmliZWQu
CgpZZXMsIGJ1dCBjbG9iYmVyaW5nIG9ubHkgZ2l2ZXMgYmVuZWZpdHMgb24gYSBzd2l0Y2gsIHNv
IHdlIGRvbid0IHdhbnQgdG8KY2xvYmJlciBpZiB0aGVyZSBhcmUgbW9yZSBzeXNjYWxsIHRoYW4g
c3dpdGNoZXMuCgpXZWxsLCB0aGVyZSBpcyBhIHdheTogYSBzeXNjYWxsIGNvdWxkIGp1c3Qgc2V0
IFZTPUluaXRpYWwsIGFuZCBpZgp1c2Vyc3BhY2UgZG9lc24ndCBkaXJ0eSB2ZWN0b3IgcmVnaXN0
ZXJzLCBhIHJlc3RvcmUgd291bGQgc2V0IHRoZQpyZWdpc3RlcnMgdG8gd2hhdGV2ZXIgdGhlIGlu
aXRpYWwgc3RhdGUgaXMuCk5vIHZlY3RvciByZWdpc3RlcnMgdG91Y2hlZCBvbiBzeXNjYWxsLCBv
ciBzYXZlLgoKVGhpcyB3b3JrcyBhcyB3ZSBkb24ndCBoYXZlIHRvIGRvIGFueXRoaW5nIHdoZW4g
ImNsb2JiZXJpbmciIC0tIHRoZQpyZWdpc3RlcnMgYXJlIHVuc3BlY2lmaWVkIGFmdGVyIGEgc3lz
Y2FsbC4KVGhlIGRvd25zaWRlIGlzIHRoYXQgdXNlcnMgbWlnaHQgKGluY29ycmVjdGx5KSBkZXBl
bmQgb24gdGhlIHVuc3BlY2lmaWVkCnZhbHVlIHdpdGhvdXQgZGlydHlpbmcsIHNvIHRoZSB1bnNw
ZWNpZmllZCB2YWx1ZSBjb3VsZCBjaGFuZ2UgYXQgYW4KYXJiaXRyYXJ5IHBvaW50LCB3aGljaCB3
b3VsZCBwcm92aWRlIHNvbWUgaW50ZXJlc3RpbmcgZGVidWdnaW5nIGNhc2VzLgoKKEFuZCBpdCdz
IHN0aWxsIHN1Ym9wdGltYWwgaWYgc29mdHdhcmUgYWN0dWFsbHkgd2FudHMgdG8gcHJlc2VydmUK
IHZlY3RvcnMgYWNyb3NzIHN5c2NhbGxzLikKCj4gSGF2aW5nIHNhaWQgYWxsIG9mIHRoYXQsIEkg
YW0gYWN0dWFsbHkgc2xpZ2h0bHkgbW9yZSBpbnRlcmVzdGVkIGluIHdoeQo+IHZtdi52LnZpIGlz
ICpzbyBzbG93KiBvbiBTaUZpdmUgWDI4MC4gSSB3b25kZXIgaWYgdGhlcmUgd291bGQgYmUgYSBt
b3JlCj4gbWljcm9hcmNoaXRlY3R1cmFsIGZhdm9yYWJsZSB3YXlzIHRvIGp1c3QgcHV0IGEgYnVu
Y2ggb2Ygb25lcyBpbiBzb21lCj4gdmVjdG9yIHJlZ2lzdGVycz8gV291bGQgMCBiZSBiZXR0ZXI/
CgpObyBpZGVhLCBhbmQgdGhlcmUgYXJlIGEgbG90IG9mIG9wdGlvbnMgdG8gdHJ5LCBidXQgaXQg
d291bGQgYmUgcXVpdGUKc2FkIGlmIHdlIGhhZCB0byBoYXZlIHNwZWNpYWwgY2FzZSBmb3IgZWFj
aCBpbXBsZW1lbnRhdGlvbi4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
