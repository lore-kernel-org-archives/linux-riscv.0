Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9157EC0219D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7ykaFQgUW2URChN/x9K9vaTG8p/Z9RarhIuLl2falQ=; b=hymcZWluzZ8IhD
	oMYOLIf0NIWnasp65OCnRa9a7fL1M24uycxu+oC4NjrysiYxWxJ5N/ZKDtwJhStUmsnX/rQ/nXJHp
	OI3I0/g505q5x8hctnlkIxtO/Pa1nO3D/a4eqNYf6ON1NZp/l6mu1APPFDRewudyPz9dh90wXd1Nw
	PnntMM2TkGA0DEDtgjgxbQM8u9CalDfg27LuoMWmeiHl9tI243aSe/rqr7/dhDys+CHMWcxJStS54
	eHx+W4Te+TkedUPvYL31B42ag03DOO8ljb+chDNEbLkFPBWwXTDb+MVa34NbqZXTTFOV5OaNjjie4
	hF5g+f9bIm5VBKDw5NMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thap0-00000001Pvi-0r1i;
	Mon, 10 Feb 2025 20:56:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaml-00000001PeE-08WN
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SLAa1BKEsAml/EQbXgNElXATdgTAKpFsheqm1ORqCrY=; b=S4OHI5wBFt9UBwZjkrXUX6SFYi
	YrJqFm2bwGfHk7SWR+GG7xTreu0n3XATV2Tlhe9pYWNGAcGutSZUrfUtbDJfLXPvN1LIEMCyrVixA
	o0L/nGlJbUtWmXTgGA4eXgjQyQ+EeGhSvEZJwn7TAcEJCYU3acEuPbIkojPvlmp9UMFHOZL0hEmEL
	h6qbGTTwXv8G4ge196bvBAjnNJjl7C0on5Kz5t/8X2LQuKOFvZ2fFBLsMSOrfGHCETYEYpsIVQlWS
	YsUwK2qy4T+ci9g0ilJeN72gF870wlLGV1SB54U/+6okrEBvoqPGc5AQPikQ3wbIYRsZV1CarWmD6
	W8T2dE+g==;
Received: from mail-yw1-x1141.google.com ([2607:f8b0:4864:20::1141])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thamg-00000000G3L-3X06
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:53:41 +0000
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-6f7031ea11cso46347017b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739220815; x=1739825615; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLAa1BKEsAml/EQbXgNElXATdgTAKpFsheqm1ORqCrY=;
        b=OE5ByWn7lXRqpdroxoCnt+swpdv0oP8EP9bkJvAKH93ACEE6BoG7w0qQs4Tb7UDAEI
         4q+FiaczU7CQ7Lp0xJo7sZIFwMkBaAuYtI6b5WArY8LVxpHhALYgot/9bJS/cmRwOFm4
         5qH4WsooF03nsPbE/+Rgr5xhb83Rmn+nZQkCjk8Ycaz8AwoGfQoCJYPgJEK1OyeeLxvh
         8+Ul99q7PrQFQOhTBH8U9iYxPb5XQwh5BzFtWSfExChwNGmZjAmaONWjHldQNgYxTqTK
         sLOSYXsVD0Q0n1+5sVzP9NFubyrDZ6el6vwvIRKY+CYTztkTCVDuKLthtNw+ZcgnUbTD
         DFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220815; x=1739825615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLAa1BKEsAml/EQbXgNElXATdgTAKpFsheqm1ORqCrY=;
        b=XK7roEAxbWi24u+rsBH6ccg4H+q5PAvw0y8F9ribQ2//86SyhMp3wJpmnnQ0DY+5Ov
         fyfCnndhvKQc/Q59NCR1XZ0+Y79tEVJoLOQaeaskvlh+JRwkrR+cMvPFxB8J+yRUS8Bg
         kUXaLIzc8wcILjgbD1sbj7qSkPPeb0xuQaH2XVaHHYe0pOmbuNLja2o3LoxVjsGHuRMH
         QXCifkwCB4RPKklpgN02iZR60lBZovMa8Vx8a5u+0B9RZMJU3dG+nY9SYzoYzax1V4lS
         rQkFzovsvjXIu6uVjjQKQvcZduQlYCKgoVwmJXoV3/IVjBKWD4U1vMwW06X4OVYpSBCo
         jBZg==
X-Forwarded-Encrypted: i=1; AJvYcCWDndoPuurS5pFGB5LNBGfdsd8BEOyZoUMlKAyq41cUWAy/HolTlALRiUX+Kbu5elpdix1OjKwz4B+DPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoiCEry+b9Y5o4grP8eUM0OIZwoWp8302XG6U7r6HCKcVPMj0x
	3qWYd/rNkRRlOvhF05Ap8sMY9IZAUKVH0tnUzJTiMWdemZVruhg4UnHpJbRvnRU=
X-Gm-Gg: ASbGncsbyERvIQn+YzZseVPKl5h8Lb6pvUidaUe5PvmwAeHfKVyDD7WUPBeXpC4/yAb
	LXVbyR5F/z2hiE9sXRZ2qq6+hoIj3YSHy5dgst/XRmdVG/x1iFGjO5cAAQ60ugdaMB6UdVqRC4Y
	PUpg0PL3gnZ0bnCu8hgb77BOlZ1J8/XnidvgIDgyTIW/VDvJ0rMXmOw8U9d/a4sfZnex+eW6Nwj
	ZnV+8W0SEEHRcKsTHfTdJxj711ZzmgduKpbbmPWaR9qLBJYApKYekCowJuRzS5VR0KatXpm3O7S
	Pxc=
X-Google-Smtp-Source: AGHT+IH0bbRLBOuosMUk1KWSGgc288AFzfJ4nEB6hFoRhqUOD7HEq12omD4VxMkgi+HrRIX9zaTKoA==
X-Received: by 2002:a05:690c:4801:b0:6f9:8916:3b69 with SMTP id 00721157ae682-6f9b2844150mr129922107b3.5.1739220814933;
        Mon, 10 Feb 2025 12:53:34 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd39430sm18231937b3.48.2025.02.10.12.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:53:34 -0800 (PST)
Date: Mon, 10 Feb 2025 12:53:32 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	"palmer@dabbelt.com Anup Patel" <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6pnTG7YoiDW_Gkq@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
 <Z6o1bQLJ8aUyjvrQ@ghost>
 <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_205339_054733_454C9C05 
X-CRM114-Status: GOOD (  48.03  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDk6NDI6MjVQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDEwLzAyLzIwMjUgMTg6MjAsIENoYXJsaWUgSmVua2lucyB3cm90
ZToKPiA+IE9uIE1vbiwgRmViIDEwLCAyMDI1IGF0IDAzOjIwOjM0UE0gKzAxMDAsIENsw6ltZW50
IEzDqWdlciB3cm90ZToKPiA+Pgo+ID4+Cj4gPj4gT24gMTAvMDIvMjAyNSAxNTowNiwgQW5kcmV3
IEpvbmVzIHdyb3RlOgo+ID4+PiBPbiBNb24sIEZlYiAxMCwgMjAyNSBhdCAxMjowNzo0MFBNICsw
MTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+IE9uIDEwLzAy
LzIwMjUgMTE6MTYsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPj4+Pj4gT24gU2F0LCBGZWIgOCwgMjAy
NSBhdCA2OjUz4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3Jv
dGU6Cj4gPj4+Pj4+Cj4gPj4+Pj4+IE9uIEZyaSwgRmViIDA3LCAyMDI1IGF0IDA1OjE5OjQ3UE0g
KzAxMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+Pj4+Pj4+IFByb2JpbmcgdW5hbGlnbmVkIGFj
Y2Vzc2VzIG9uIGJvb3QgaXMgdGltZSBjb25zdW1pbmcuIFByb3ZpZGUgYQo+ID4+Pj4+Pj4gZnVu
Y3Rpb24gd2hpY2ggd2lsbCBiZSB1c2VkIHRvIGxvb2sgdXAgdGhlIGFjY2VzcyB0eXBlIGluIGEg
dGFibGUKPiA+Pj4+Pj4+IGJ5IGlkIHJlZ2lzdGVycy4gVmVuZG9ycyB3aGljaCBwcm92aWRlIHRh
YmxlIGVudHJpZXMgY2FuIHRoZW4gc2tpcAo+ID4+Pj4+Pj4gdGhlIHByb2JpbmcuCj4gPj4+Pj4+
Cj4gPj4+Pj4+IFRoZSBhY2Nlc3MgY2hlY2tlciBpbiBteSBleHBlcmllbmNlIGlzIG9ubHkgdGlt
ZSBjb25zdW1pbmcgb24gc2xvdwo+ID4+Pj4+PiBoYXJkd2FyZS4gSGFyZHdhcmUgdGhhdCBzdXBw
b3J0cyBmYXN0IHVuYWxpZ25lZCBhY2Nlc3NlcyBpc24ndCByZWFsbHkKPiA+Pj4+Pj4gaW1wYWN0
ZWQgYnkgdGhpcz8gQXZvaWRpbmcgYSBsaXN0IG9mIGhhcmR3YXJlIHRoYXQgaGFzIHNsb3cvZmFz
dAo+ID4+Pj4+PiB1bmFsaWduZWQgYWNjZXNzZXMgaW4gdGhlIGtlcm5lbCB3YXMgdGhlIG1haW4g
cmVhc29uIGZvciBkeW5hbWljYWxseQo+ID4+Pj4+PiBjaGVja2luZy4gV2UgZGlkIGludHJvZHVj
ZSB0aGUgY29uZmlnIG9wdGlvbiB0byBjb21waWxlIHRoZSBrZXJuZWwgd2l0aAo+ID4+Pj4+PiBh
c3N1bWVkIHNsb3cvZmFzdCBhY2Nlc3Nlcywgd2hpY2ggb2YgY291cnNlIGhhcyB0aGUgZG93bnNp
ZGUgb2YKPiA+Pj4+Pj4gcmVjb21waWxpbmcgdGhlIGtlcm5lbCBhbmQgSSBhc3N1bWUgdGhhdCB5
b3UgYWxyZWFkeSBjb25zaWRlcmVkIHRoYXQuCj4gPj4+Pj4KPiA+Pj4+PiBUaGUga2NvbmZpZyBv
cHRpb24gZG9lcyBub3QgYWxpZ24gd2l0aCB0aGUgdmlzaW9uIG9mIHJ1bm5pbmcgdGhlIHNhbWUK
PiA+Pj4+PiBrZXJuZWwgaW1hZ2UgYWNyb3NzIHBsYXRmb3Jtcy4KPiA+Pj4+Cj4gPj4+PiBJJ2Qg
d291bGQgYmUgYWR2b2NhdGluZyB0byByZW1vdmUgY29tcGlsZSB0aW1lIG9wdGlvbnMgYXMgd2Vs
bCBhbmQgdXNlCj4gPj4+PiBhbm90aGVyIHdheSB0byBza2lwIHRoZSBwcm9iZSAoc2VlIGJlbG93
KS4KPiA+Pj4+Cj4gPj4+Pj4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSW5zdGVhZCBvZiBoYXZpbmcgYSB0
YWJsZSBpbiB0aGUga2VybmVsLCBzb21ldGhpbmcgdGhhdCB3b3VsZCBiZSBtb3JlCj4gPj4+Pj4+
IHBsYXRmb3JtIGFnbm9zdGljIHdvdWxkIGJlIHRvIGhhdmUgYW4gZXh0ZW5zaW9uIHRoYXQgc2ln
bmFscyB0aGlzCj4gPj4+Pj4+IGluZm9ybWF0aW9uLiBUaGF0IHNlZW1zIGxpa2UgaXQgd291bGQg
YWNjb21wbGlzaCB0aGUgc2FtZSBnb2FsIGFuZAo+ID4+Pj4+PiBsZXZlcmFnZSB0aGUgZXhpc3Rp
bmcgaW5mcmFzdHJ1Y3R1cmUgaW4gdGhlIGtlcm5lbCwgYWxiZWl0IHdpdGggdGhlIG5lZWQKPiA+
Pj4+Pj4gdG8gbWFrZSBhIG5ldyBleHRlbnNpb24uCj4gPj4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBJ
TU8sIGV4cGVjdGluZyBhbiBJU0EgZXh0ZW5zaW9uIHRvIGJlIGRlZmluZWQgZm9yIGFsbCBwb3Nz
aWJsZQo+ID4+Pj4+IG1pY3JvYXJjaGl0ZWN0dXJhbCBjaG9pY2VzIGlzIG5vdCBnb2luZyB0byBz
Y2FsZSBzbyBpdCBpcyBiZXR0ZXIKPiA+Pj4+PiB0byBoYXZlIGluZnJhc3RydWN0dXJlIGluIGtl
cm5lbCBpdHNlbGYgdG8gaW5mZXIgbWljcm9hcmNoaXRlY3R1cmFsCj4gPj4+Pj4gY2hvaWNlcyBi
YXNlZCBvbiBSSVNDLVYgaW1wbGVtZW50YXRpb24gSUQuCj4gPj4+Pgo+ID4+Pj4gU2luY2UgYWRk
aW5nIGFuIGV4dGVuc2lvbiBzZWVtcyBxdWl0ZSB1bmxpa2VseSwgYW5kIHRoYXQgYSBkZXZpY2Ut
dHJlZQo+ID4+Pj4gcHJvcGVydHkgaXMgbGlrZWx5IERUIGNlbnRyaWMgYW5kIG5vdCBhcHBsaWNh
YmxlIHRvIEFDUEkgYXMgd2VsbCwgd2FzIGEKPiA+Pj4+IGNvbW1hbmQgbGluZSBhcmd1bWVudCBj
b25zaWRlcmVkID8KPiA+Pj4+Cj4gPj4+Cj4gPj4+IEkgZGlkIGNvbnNpZGVyIGFkZGluZyBhIGNv
bW1hbmQgbGluZSBvcHRpb24gaW4gYWRkaXRpb24gdG8gdGhlIHRhYmxlLAo+ID4+PiBhbGxvd2lu
ZyBwbGF0Zm9ybXMgd2hpY2ggbmVpdGhlciBoYXZlIGEgdGFibGUgZW50cnkgW3lldF0gbm9yIHdh
bnQgdG8gZG8KPiA+Pj4gdGhlIHNwZWVkIHRlc3QsIHRvIHNldCB3aGF0ZXZlciB0aGV5IGxpa2Uu
IEluIHRoZSBlbmQsIEkgZHJvcHBlZCBpdCwgc2luY2UKPiA+Pj4gSSBkb24ndCBoYXZlIGEgdXNl
IGNhc2UgYXQgdGhpcyB0aW1lLiBIb3dldmVyLCBpZiB3ZSByZWFsbHkgZG9uJ3Qgd2FudCBhCj4g
Pj4+IHRhYmxlLCB0aGVuIEkgY2FuIGxvb2sgaW50byB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbiBp
bnN0ZWFkLgo+ID4+Cj4gPj4gU29ycnkgaWYgSSB3YXNuJ3QgY2xlYXIsIEkgd2Fzbid0IGNvbnNp
ZGVyaW5nIHRoaXMgYXMgYSByZXBsYWNlbWVudCBmb3IKPiA+PiB5b3VyIHRhYmxlIGJ1dCByYXRo
ZXIgYXMgYSByZXBsYWNlbWVudCB0byBDaGFybGllJ3MgY29tcGlsZSB0aW1lIGRlZmluZQo+ID4+
IHRvIHNraXAgbWlzYWxpZ25lZCBzcGVlZCBwcm9iaW5nIHNpbmNlIGl0IGlzIGxpa2UgImxwaj08
eD4iLiBZb3UgY2FuCj4gPj4gc3BlY2lmeSBpdCBvbiBjb21tYW5kIGxpbmUgaWYgeW91IHdhbnQg
dG8gc2tpcCB0aGUgbG9vcCB0aW1lIGRldGVjdGlvbgo+ID4+IG9mIGxvb3BzIHBlciBqaWZmaWVz
IGFuZCBoYXZlIGZhc3RlciBib290Lgo+ID4gCj4gPiBKZXNzZSBzZW50IG91dCBhIHBhdGNoIGZv
ciBhIGtlcm5lbCBwYXJhbWV0ZXIgdG8gc2V0IHRoZSBhY2Nlc3Mgc3BlZWQgdG8KPiA+IHdoYXRl
dmVyIGlzIGRlc2lyZWQgWzFdLgo+IAo+IEhleSBDaGFybGllLAo+IAo+IFRoYW5rcyBidXQgaXQg
c2VlbXMgeW91IGZvcmdvdCB0byBhZGQgdGhlIGxpbmsgPwoKT29wcywgSSBmcmVxdWVudGx5IGRv
IHRoYXQuLi4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwODA1MTcz
ODE2LjM3MjIwMDItMS1qZXNzZUByaXZvc2luYy5jb20vCgo+IAo+IEhhdmluZyBjb25maWd1cmF0
aW9uIG9wdGlvbiArIGNvbW1hbmQgbGluZSBvcHRpb24gc2VlbXMgbGlrZSBzb21ldGhpbmcKPiBw
YXJ0aWN1bGFybHkgaGVhdnkgZm9yIHN1Y2ggZmVhdHVyZS4gVGhlIGlmZGVmZXJ5L2NvbmZpZyBv
cHRpb25zCj4gaW52b2x2ZWQgaW4gdGhlIG1pc2FsaWduZWQgcHJvYmluZyBjb2RlIGlzIGFscmVh
ZHkgcXVpdGUgY29tcGxpY2F0ZWQuIElmCj4gYW5vdGhlciBtZWFuIHRvIHNwZWNpZnkgdGhlIG1p
c2FsaWduZWQgc3BlZWQgYWNjZXNzIGlzIGFkZGVkLCBJIHRoaW5rCj4gYWxsIGNvbmZpZ3VyYXRp
b24gb3B0aW9ucyB0byBzZXQgdGhlIHNwZWVkIG9mIGFjY2Vzc2VzIGNhbiB0aGVuIGJlCj4gcmVt
b3ZlZCBhbmQganVzdCBrZWVwIHRoZSBjb21tYW5kIGxpbmUuIFRoYXQgd2lsbCBjZXJ0YWlubHkg
c2ltcGxpZnkgdGhlCj4gaWZkZWYvY29uZmlnIG9wdGlvbnMuCgpZZWFoIHRoYXQncyB3aHkgaXQg
ZGlkbid0IGdldCBtZXJnZWQgYmVjYXVzZSBpdCBmZWx0IGxpa2Ugb3ZlcmtpbGwuIEkKcmVzcG9u
ZGVkIG9uIHRoZSB0aHJlYWQgdG8gQW51cCBhcyB3aHkgSSB3b3VsZCBwcmVmZXIgY29uZmlnIG9w
dGlvbnMuIEl0Cmp1c3QgY29tZXMgZG93biB0byBjb25maWcgb3B0aW9ucyBiZWluZyByZXF1aXJl
ZCB0byBlbmFibGUgY29tcGlsZXIKZmVhdHVyZXMuIFRoZSBrZXJuZWwgaXMgb25seSBidWlsdCB3
aXRoIHJ2NjRnYyBhbmQgdXNhZ2Ugb2YgYWxsIG90aGVyCmV4dGVuc2lvbnMgcmVxdWlyZXMgaGFu
ZCB3cml0dGVuIGFzc2VtYmx5LiBUaGVyZSBhcmUgZWFzeSBwZXJmb3JtYW5jZQpnYWlucyB3aGVu
IGNvbXBpbGluZyB0aGUga2VybmVsIHdpdGggcnY2NGdjX3piYV96YmJfemJrYiBldGMuClBlcmZv
cm1hbmNlIGZvY3VzZWQga2VybmVscyB3aWxsIG5lZWQgdG8gYmUgcmVjb21waWxlZCBhbnl3YXkg
c28gSSBhbSBvZgp0aGUgb3BpbmlvbiB0aGF0IGdyb3VwaW5nIGluIG90aGVyIHBlcmZvcm1hbmNl
IGZlYXR1cmVzIGFzIGNvbmZpZwpvcHRpb25zIGxpa2UgdGhpcyBpcyB0aGUgZWFzaWVzdCB0aGlu
ZyB0byBkbyBhbmQgcmVkdWNlcyB0aGUgYW1vdW50IG9mCmNvZGUgaW4gdGhlIGtlcm5lbC4KCi0g
Q2hhcmxpZQoKPiAKPiBDbMOpbWVudAo+IAo+ID4gCj4gPiAtIENoYXJsaWUKPiA+IAo+ID4+IC19
Cj4gPj4gLSNlbHNlIC8qIENPTkZJR19SSVNDVl9QUk9CRV9VTkFMSUdORURfQUNDRVNTICovCj4g
Pj4gLXN0YXRpYyB2b2lkIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9j
cHVzKHZvaWQpCj4gPj4gLXsKPiA+PiAtfQo+ID4+IC0jZW5kaWYKPiA+PiAtCj4gPj4gICNpZmRl
ZiBDT05GSUdfUklTQ1ZfUFJPQkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MKPiA+PiAgc3RhdGlj
IHZvaWQgY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3Moc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrIF9fYWx3YXlzX3VudXNlZCkKPiA+PiAgewo+ID4+IEBAIC0zNzAsNiArMzgwLDExIEBAIHN0
YXRpYyBpbnQgX19pbml0IHZlY19jaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVz
KHZvaWQgKnVudXNlZCBfX2Fsd2F5Cj4gPj4gIH0KPiA+PiAgI2VuZGlmCj4gPj4gIAo+ID4+ICtz
dGF0aWMgYm9vbCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc190YWJsZSh2b2lkKQo+ID4+
ICt7Cj4gPj4gKwlyZXR1cm4gZmFsc2U7Cj4gPj4gK30KPiA+PiArCj4gPj4gIHN0YXRpYyBpbnQg
cmlzY3Zfb25saW5lX2NwdV92ZWModW5zaWduZWQgaW50IGNwdSkKPiA+PiAgewo+ID4+ICAJaWYg
KCFoYXNfdmVjdG9yKCkpIHsKPiA+PiBAQCAtMzc3LDYgKzM5Miw5IEBAIHN0YXRpYyBpbnQgcmlz
Y3Zfb25saW5lX2NwdV92ZWModW5zaWduZWQgaW50IGNwdSkKPiA+PiAgCQlyZXR1cm4gMDsKPiA+
PiAgCX0KPiA+PiAgCj4gPj4gKwlpZiAoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfdGFi
bGUoKSkKPiA+PiArCQlyZXR1cm4gMDsKPiA+PiArCj4gPj4gICNpZmRlZiBDT05GSUdfUklTQ1Zf
UFJPQkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MKPiA+PiAgCWlmIChwZXJfY3B1KHZlY3Rvcl9t
aXNhbGlnbmVkX2FjY2VzcywgY3B1KSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9S
X1VOS05PV04pCj4gPj4gIAkJcmV0dXJuIDA7Cj4gPj4gQEAgLTM5MiwxMyArNDEwLDE1IEBAIHN0
YXRpYyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKPiA+
PiAgewo+ID4+ICAJaW50IGNwdTsKPiA+PiAgCj4gPj4gLQlpZiAoIWNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKSkKPiA+PiArCWlmICghY2hlY2tfdW5hbGlnbmVkX2Fj
Y2Vzc190YWJsZSgpICYmCj4gPj4gKwkgICAgIWNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWRfYWxsX2NwdXMoKSkKPiA+PiAgCQljaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9j
cHVzKCk7Cj4gPj4gIAo+ID4+ICAJaWYgKCFoYXNfdmVjdG9yKCkpIHsKPiA+PiAgCQlmb3JfZWFj
aF9vbmxpbmVfY3B1KGNwdSkKPiA+PiAgCQkJcGVyX2NwdSh2ZWN0b3JfbWlzYWxpZ25lZF9hY2Nl
c3MsIGNwdSkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VOU1VQUE9SVEVEOwo+
ID4+IC0JfSBlbHNlIGlmICghY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRf
YWxsX2NwdXMoKSAmJgo+ID4+ICsJfSBlbHNlIGlmICghY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9h
Y2Nlc3NfdGFibGUoKSAmJgo+ID4+ICsJCSAgICFjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vz
c19lbXVsYXRlZF9hbGxfY3B1cygpICYmCj4gPj4gIAkJICAgSVNfRU5BQkxFRChDT05GSUdfUklT
Q1ZfUFJPQkVfVkVDVE9SX1VOQUxJR05FRF9BQ0NFU1MpKSB7Cj4gPj4gIAkJa3RocmVhZF9ydW4o
dmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMsCj4gPj4gIAkJCSAgICBO
VUxMLCAidmVjX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMiKTsKPiA+IAo+
ID4+Cj4gPj4gUmVnYXJkaW5nIHlvdXIgdGFibGUsIGl0IGZlZWxzIGxpa2UgYSBiaXQgZ29pbmcg
YmFjayB0byBvbGQgaGFyZGNvZGVkCj4gPj4gcGxhdGZvcm0gZGVzY3JpcHRpb24gOykuIEkgdGhp
bmsgc29tZSBraW5kIG9mIGF1dG8tZGV0ZWN0aW9uIG9mIHNwZWVkCj4gPj4gKG5vdCBidWlsdGlu
IHRoZSBrZXJuZWwpIGZvciBwbGF0Zm9ybXMgY291bGQgYmUgZ29vZCBhcyB3ZWxsIHRvIHNraXAK
PiA+PiBwcm9iaW5nLgo+ID4+Cj4gPj4gQSBEVCBwcm9wZXJ0eSBhbHNvIHNlZW1zIG9rIHRvIG1l
IHNpbmNlIHRoZSBnb2FsIGlzIHRvIGRlc2NyaWJlCj4gPj4gaGFyZHdhcmUuIFdvdWxkIGEgY29t
bW9uIERUL0FDUEkgcHJvcGVydHkgYmUgYXBwcm9wcmlhdGUgPyBUaGUKPiA+PiBkZXZpY2VfcHJv
cGVydHkgQVBJIHVuaWZpZWQgYm90aCBzbyBpZiB3ZSB1c2VkIHNvbWUgY29tbW9uIHByb3BlcnR5
IHRvCj4gPj4gZGVzY3JpYmUgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHNwZWVkIChib3RoIGluIERU
IGNwdSBub2RlLyBBQ1BJIENQVQo+ID4+IGRldmljZSBwYWNrYWdlKSwgd2UgY291bGQga2VlcCBh
IHNpbmdsZSBwYXJzaW5nIG1ldGhvZC4gQnV0IEknbSBubyBBQ1BJCj4gPj4gZXhwZXJ0IHNvIEkg
ZG9uJ3Qga25vdyBpZiB0aGF0IHJlYWxseSBtYWtlIHNlbnNlLgo+ID4+Cj4gPj4gVGhhbmtzLAo+
ID4+Cj4gPj4gQ2zDqW1lbnQKPiA+Pgo+ID4+Pgo+ID4+PiBUaGFua3MsCj4gPj4+IGRyZXcKPiA+
Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
