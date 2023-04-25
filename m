Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DD8C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 08:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbXwKv1UqQjqvsBx0Gy/mHvJG7LqpmCTVTGWmBLsZ1U=; b=RS2EdwEjHriCiK
	vMwitNpxxZDiWQMBYQ+XnR63/WgXoVX+8fh9wv/bMK2Ni1JRbb9s468j4D0maoebi2O1WdMUij5LN
	Uy1gfw7VoM6JWAgOiAEBuGDlTaprYvD4NYwLgKBkTNp2kSFmBYJmu10ZqZyBEjcfA3XwpNI+6HVrQ
	pbUT5w/mqtXH/511sA6rUNEaBlgB5k3mMN3V7tGW7hYLa3rcq5prjEhdh1xsQ+BU5zAMUULp73ia5
	44nSljmMjjjLMLAroeR69m/VUMnIDwIq1+le+2O/wjsxmfBj2Jd+TvF+Z8yD0kaKMeCZ/da3Oy/ZU
	3P2wb9tsKaIpodtK35uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDbE-000RB6-13;
	Tue, 25 Apr 2023 08:00:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDbA-000R8N-3C
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 08:00:30 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4ec816d64afso23373006e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 01:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682409618; x=1685001618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJcVKVJA3HgnW7bSvVOddaHKG/ERA+dvV0Lub2llU+Q=;
        b=EOkcITT5Rq6XWK3ejRIWqvQTkMe0ymO3UjoLJxHU/nMXd+kJfjuDnngRLl0056SRHm
         ThA9qKaCSDNobvcy6jnV68/ursuWUy1LRvfcOiMnvJd6umM5gBHUqjEii9P0KObi7KGh
         BAFvn/jnFZdpnznd05oLdmPYj0b3vIN6GQEhpBNTdSfL4z+ZwxB1QMA9d150A+77EI3i
         plazI1uNEF7MssMeARqn6HbaKObj7K0qUBZHDm45tsXJspZswccglcpyVh33k/az8cYf
         7sxktCdB7+YpplssXVz1+FDrVlx5NHqwNlTaeiZQzIojqvTIoBPoyIpW8YSps41cN/xv
         Ujqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682409618; x=1685001618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJcVKVJA3HgnW7bSvVOddaHKG/ERA+dvV0Lub2llU+Q=;
        b=Z/lsqlAHAURJA8i6duPKLae60RHz3OYvAhFkfmUpvDcC8FbLHeKKLs6VF1Ho/2SBxB
         zDEC0rZL+pL+9DqeUEbDrs9U8p75zqeuznafSCJbIRdoDPZxAN3SeosOoBdm53e4vRCW
         W0a5k1P76hTIlMNJE8WlBxE61aBKpekij4cG4XD83+68GqHLJvWYKYRzx4jYmjUTMTyr
         s5JzBS7NYGm8jKdQp9BMjNPiHXgeAndZyV+2Puh44hTQzffbesaXNKB28dJKJ1sekE7y
         aCXoGHqChz2uTCbkw8nGGqV9yBfvYyI4YKlE69z7UyMk6yaPsFKPiAQ9sn1w99Q8kw1y
         YqbQ==
X-Gm-Message-State: AAQBX9f4ODSZiAyaWPTFQ0l/LYXxlY6iflkWB+dcx04F/kD1zlCoRfXL
	ZcLW2wUbECMS2rHEwPxdYnaOKPIpzTbIH2juH5lSJA==
X-Google-Smtp-Source: AKy350ZxdfhaQD3I1+8v331wKiSztM8EPfAn2hc331pKYjbFsrskYvBdyUu9x9mXAh7RJVZWCXfYiGyWTG2NjZzD97c=
X-Received: by 2002:a2e:9b87:0:b0:2aa:4550:9169 with SMTP id
 z7-20020a2e9b87000000b002aa45509169mr3099317lji.20.1682409617717; Tue, 25 Apr
 2023 01:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-46-atishp@rivosinc.com>
 <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com> <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
 <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
In-Reply-To: <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 25 Apr 2023 13:30:06 +0530
Message-ID: <CAHBxVyHg7vTaQJWKoVSD8budVZEYSo1eDOyZyZK7gcJApR7SbA@mail.gmail.com>
Subject: Re: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
To: Dave Hansen <dave.hansen@intel.com>
Cc: linux-kernel@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev, 
	Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com, 
	Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Uladzislau Rezki <urezki@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_010029_027867_D544DCA3 
X-CRM114-Status: GOOD (  41.17  )
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

T24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgNzoxOOKAr1BNIERhdmUgSGFuc2VuIDxkYXZlLmhhbnNl
bkBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gNC8yMS8yMyAxMjoyNCwgQXRpc2ggS3VtYXIgUGF0
cmEgd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAyMSwgMjAyMyBhdCAzOjQ24oCvQU0gRGF2ZSBIYW5z
ZW4gPGRhdmUuaGFuc2VuQGludGVsLmNvbT4gd3JvdGU6Pj4gVGhpcyBjYWxsYmFjayBhcHBlYXJz
IHRvIHNheSB0byB0aGUgaG9zdDoKPiA+Pgo+ID4+ICAgICAgICAgSGV5LCBJICh0aGUgZ3Vlc3Qp
IGFtIHRyZWF0aW5nIHRoaXMgZ3Vlc3QgcGh5c2ljYWwgYXJlYSBhcyBNTUlPLgo+ID4+Cj4gPj4g
QnV0IHRoZSBob3N0IGFuZCBndWVzdCBoYXZlIHRvIGFncmVlIF9zb21ld2hlcmVfIHdoYXQgdGhl
IE1NSU8gaXMgdXNlZAo+ID4+IGZvciwgbm90IGp1c3QgdGhhdCBpdCBpcyBiZWluZyB1c2VkIGFz
IE1NSU8uCj4gPgo+ID4gWWVzLiBUaGUgVFNNIChURUUgU2VjdXJpdHkgTWFuYWdlcikgd2hpY2gg
aXMgZXF1aXZhbGVudCB0byBURFggYWxzbwo+ID4gbmVlZHMgdG8gYmUgYXdhcmUgb2YgdGhlIE1N
SU8gcmVnaW9ucyBzbyB0aGF0IGl0IGNhbiBmb3J3YXJkIHRoZQo+ID4gZmF1bHRzIGFjY29yZGlu
Z2x5LiBNb3N0IG9mIHRoZSBNTUlPIGlzIGVtdWxhdGVkIGluIHRoZSBob3N0Cj4gPiAodXNlcnNw
YWNlIG9yIGtlcm5lbCBlbXVsYXRpb24gaWYgcHJlc2VudCkuIFRoZSBob3N0IGlzIG91dHNpZGUg
dGhlCj4gPiB0cnVzdCBib3VuZGFyeSBvZiB0aGUgZ3Vlc3QuIFRodXMsIGd1ZXN0IG5lZWRzIHRv
IG1ha2Ugc3VyZSB0aGUgaG9zdAo+ID4gb25seSBlbXVsYXRlcyB0aGUgZGVzaWduYXRlZCBNTUlP
IHJlZ2lvbi4gT3RoZXJ3aXNlLCBpdCBvcGVucyBhbgo+ID4gYXR0YWNrIHN1cmZhY2UgZnJvbSBh
IG1hbGljaW91cyBob3N0Lgo+IEhvdyBkb2VzIHRoaXMgbWVjaGFuaXNtIHN0b3AgdGhlIGhvc3Qg
ZnJvbSBlbXVsYXRpbmcgc29tZXRoaW5nIG91dHNpZGUKPiB0aGUgZGVzaWduYXRlZCByZWdpb24/
Cj4KPiBPbiBURFgsIGZvciBpbnN0YW5jZSwgdGhlIGd1ZXN0IHBhZ2UgdGFibGUgaGF2ZSBhIHNo
YXJlZC9wcml2YXRlIGJpdC4KPiBQcml2YXRlIHBhZ2VzIGdldCBURFggcHJvdGVjdGlvbnMgdG8g
KGFtb25nIG90aGVyIHRoaW5ncykga2VlcCB0aGUgcGFnZQo+IGNvbnRlbnRzIGNvbmZpZGVudGlh
bCBmcm9tIHRoZSBob3N0LiAgU2hhcmVkIHBhZ2VzIGNhbiBiZSB1c2VkIGZvciBNTUlPCj4gYW5k
IGRvbid0IGhhdmUgdGhvc2UgcHJvdGVjdGlvbnMuCj4KPiBJZiB0aGUgaG9zdCBnb2VzIGFuZCB0
cmllcyB0byBmbGlwIGEgcGFnZSBmcm9tIHByaXZhdGUtPnNoYXJlZCwgVERYCj4gcHJvdGVjdGlv
bnMgd2lsbCBraWNrIGluIGFuZCBwcmV2ZW50IGl0Lgo+Cj4gTm9uZSBvZiB0aGlzIHJlcXVpcmVz
IHRoZSBndWVzdCB0byB0ZWxsIHRoZSBob3N0IHdoZXJlIGl0IGV4cGVjdHMgTU1JTwo+IHRvIGJl
IGxvY2F0ZWQuCj4KPiA+IEFsbCBvdGhlciBjb25maWRlbnRpYWwgY29tcHV0aW5nIHNvbHV0aW9u
cyBhbHNvIGRlcGVuZCBvbiBndWVzdAo+ID4gaW5pdGlhdGVkIE1NSU8gYXMgd2VsbC4gQUZBSUss
IHRoZSBURFggJiBTRVYgcmVsaWVzIG9uICNWRSBsaWtlCj4gPiBleGNlcHRpb25zIHRvIGludm9r
ZSB0aGF0IHdoaWxlIHRoaXMgcGF0Y2ggaXMgc2ltaWxhciB0byB3aGF0IHBrdm0KPiA+IGRvZXMu
IFRoaXMgYXBwcm9hY2ggbGV0cyB0aGUgZW5saWdodGVuZWQgZ3Vlc3QgY29udHJvbCB3aGljaCBN
TUlPCj4gPiByZWdpb25zIGl0IHdhbnRzIHRoZSBob3N0IHRvIGVtdWxhdGUuCj4KPiBJJ20gbm90
IF9xdWl0ZV8gc3VyZSB3aGF0ICJndWVzdCBpbml0aWF0ZWQiIG1lYW5zLiAgQnV0IFNFViBhbmQg
VERYCj4gZG9uJ3QgcmVxdWlyZSBhbiBpb3JlbWFwIGhvb2sgbGlrZSB0aGlzLiAgU28sIGV2ZW4g
aWYgdGhleSAqYXJlKiAiZ3Vlc3QKPiBpbml0aWF0ZWQiLCB0aGUgcXVlc3Rpb24gc3RpbGwgcmVt
YWlucyBob3cgdGhleSB3b3JrIHdpdGhvdXQgdGhpcyBwYXRjaCwKPiBvciB3aGF0IHRoZXkgYXJl
IG1pc3Npbmcgd2l0aG91dCBpdC4KPgoKTWF5YmUgSSBtaXN1bmRlcnN0b29kIHlvdXIgcXVlc3Rp
b24gZWFybGllci4gQXJlIHlvdSBjb25jZXJuZWQgYWJvdXQgZ3Vlc3RzCmludm9raW5nIGFueSBN
TUlPIHJlZ2lvbiBzcGVjaWZpYyBjYWxscyBpbiB0aGUgaW9yZW1hcCBwYXRoIG9yIHBhc3NpbmcK
dGhhdCBpbmZvcm1hdGlvbiB0byB0aGUgaG9zdCA/CkVhcmxpZXIsIEkgYXNzdW1lZCB0aGUgZm9y
bWVyIGJ1dCBpdCBzZWVtcyB5b3UgYXJlIGFsc28gY29uY2VybmVkCmFib3V0IHRoZSBsYXR0ZXIg
YXMgd2VsbC4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24gaW4gdGhhdCBjYXNlLgpUaGUgZ3Vlc3Qg
aW5pdGlhdGlvbiBpcyBuZWNlc3Nhcnkgd2hpbGUgdGhlIGhvc3Qgbm90aWZpY2F0aW9uIGNhbiBi
ZQptYWRlIG9wdGlvbmFsLgpUaGUgImd1ZXN0IGluaXRpYXRlZCIgbWVhbnMgdGhlIGd1ZXN0IHRl
bGxzIHRoZSBUU00gKGVxdWl2YWxlbnQgb2YgVERYCm1vZHVsZSBpbiBSSVNDLVYpIHRoZSBNTUlP
IHJlZ2lvbiBkZXRhaWxzLgpUaGUgVFNNIGtlZXBzIGEgdHJhY2sgb2YgdGhpcyBhbmQgYW55IHBh
Z2UgZmF1bHRzIHRoYXQgaGFwcGVuIGluIHRoYXQKcmVnaW9uIGFyZSBmb3J3YXJkZWQKdG8gdGhl
IGhvc3QgYnkgdGhlIFRTTSBhZnRlciB0aGUgaW5zdHJ1Y3Rpb24gZGVjb2RpbmcuIFRodXMgVFNN
IGNhbgptYWtlIHN1cmUgdGhhdCBvbmx5IGlvcmVtYXBwZWQgcmVnaW9ucyBhcmUKY29uc2lkZXJl
ZCBNTUlPIHJlZ2lvbnMuIE90aGVyd2lzZSwgYWxsIG1lbW9yeSBvdXRzaWRlIHRoZSBndWVzdApw
aHlzaWNhbCByZWdpb24gd2lsbCBiZSBjb25zaWRlcmVkIGFzIHRoZSBNTUlPIHJlZ2lvbi4KCklu
IHRoZSBjdXJyZW50IENvVkUgaW1wbGVtZW50YXRpb24sIHRoYXQgTU1JTyByZWdpb24gaW5mb3Jt
YXRpb24gaXMgYWxzbwpwYXNzZWQgdG8gdGhlIGhvc3QgdG8gcHJvdmlkZSBhZGRpdGlvbmFsIGZs
ZXhpYmlsaXR5LiBUaGUgaG9zdCBtYXkKY2hvb3NlIHRvIGRvIGFkZGl0aW9uYWwKc2FuaXR5IGNo
ZWNrIGFuZCBiYWlsIGlmIHRoZSBmYXVsdCBhZGRyZXNzIGRvZXMgbm90IGJlbG9uZyB0bwpyZXF1
ZXN0ZWQgTU1JTyByZWdpb25zIHdpdGhvdXQKZ29pbmcgdG8gdGhlIHVzZXJzcGFjZS4gVGhpcyBp
cyBwdXJlbHkgYW4gb3B0aW1pemF0aW9uIGFuZCBtYXkgbm90IGJlIG1hbmRhdG9yeS4KCgo+ID4g
SXQgY2FuIGJlIGEgc3Vic2V0IG9mIHRoZSByZWdpb24ncyBob3N0IHByb3ZpZGVkIHRoZSBsYXlv
dXQuIFRoZQo+ID4gZ3Vlc3QgZGV2aWNlIGZpbHRlcmluZyBzb2x1dGlvbiBpcyBiYXNlZCBvbiB0
aGlzIGlkZWEgYXMgd2VsbCBbMV0uCj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIxMDkzMDAxMDUxMS4zMzg3OTY3LTEtc2F0aHlhbmFyYXlhbmFuLmt1cHB1c3dhbXlA
bGludXguaW50ZWwuY29tLwo+Cj4gSSBkb24ndCByZWFsbHkgc2VlIHRoZSBjb25uZWN0aW9uLiAg
RXZlbiBpZiB0aGF0IHNlcmllcyB3YXMgZ29pbmcKPiBmb3J3YXJkIChJJ20gbm90IHN1cmUgaXQg
aXMpIHRoZXJlIGlzIG5vIGlvcmVtYXAgaG9vayB0aGVyZS4gIFRoZXJlJ3MKPiBhbHNvIG5vIGd1
ZXN0LT5ob3N0IGNvbW11bmljYXRpb24gaW4gdGhhdCBzZXJpZXMuICBUaGUgZ3Vlc3QgZG9lc24n
dAo+IF90ZWxsXyB0aGUgaG9zdCB3aGVyZSB0aGUgTU1JTyBpcywgaXQganVzdCBkZWNsaW5lcyB0
byBydW4gY29kZSBmb3IKPiBkZXZpY2VzIHRoYXQgaXQgZGlkbid0IGV4cGVjdCB0byBzZWUuCj4K
ClRoaXMgaXMgYSByZWNlbnQgdmVyc2lvbiBvZiB0aGUgYWJvdmUgc2VyaWVzIGZyb20gdGR4IGdp
dGh1Yi4gVGhpcyBpcwphIFdJUCBhcyB3ZWxsIGFuZCBoYXMgbm90IGJlZW4gcG9zdGVkIHRvCnRo
ZSBtYWlsaW5nIGxpc3QuIFRodXMsIGl0IG1heSBiZSBnb2luZyB1bmRlciByZXZpc2lvbnMgYXMg
d2VsbC4KQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgdGhlIGFib3ZlIGlvcmVtYXAgY2hhbmdlcyBm
b3IgVERYIG1hcmsgdGhlCmlvcmVtYXBwZWQgcGFnZXMgYXMgc2hhcmVkLgpUaGUgZ3Vlc3QtPmhv
c3QgY29tbXVuaWNhdGlvbiBoYXBwZW4gaW4gdGhlICNWRSBleGNlcHRpb24gaGFuZGxlcgp3aGVy
ZSB0aGUgZ3Vlc3QgY29udmVydHMgdGhpcyB0byBhIGh5cGVyY2FsbCBieSBpbnZva2luZyBUREcu
VlAuVk1DQUxMCndpdGggYW4gRVBUIHZpb2xhdGlvbiBzZXQuIFRoZSBob3N0IHdvdWxkIGVtdWxh
dGUgYW4gTU1JTyBhZGRyZXNzIGlmCml0IGdldHMgYW4gVk1DQUxMIHdpdGggRVBUIHZpb2xhdGlv
bi4KUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZy4KCkFzIEkgc2FpZCBhYm92ZSwgdGhl
IG9iamVjdGl2ZSBoZXJlIGlzIHRvIG5vdGlmeSB0aGUgVFNNIHdoZXJlIHRoZQpNTUlPIGlzLiBO
b3RpZnlpbmcgdGhlIGhvc3QKaXMganVzdCBhbiBvcHRpbWl6YXRpb24gdGhhdCB3ZSBjaG9vc2Ug
dG8gYWRkLiBJbiBmYWN0LCBpbiB0aGlzIHNlcmllcwp0aGUgS1ZNIGNvZGUgZG9lc24ndCBkbyBh
bnl0aGluZyB3aXRoIHRoYXQgaW5mb3JtYXRpb24uClRoZSBjb21taXQgdGV4dCBwcm9iYWJseSBj
YW4gYmUgaW1wcm92ZWQgdG8gY2xhcmlmeSB0aGF0LgoKCj4gSSdtIHN0aWxsIHJhdGhlciBjb25m
dXNlZCBoZXJlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
