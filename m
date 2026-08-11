Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A838C5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 08:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASeDCI1SnEwlZZXYef0No2PN/2N4EKVhBNrbMVuof8E=; b=fqlcCuAX+G1znD
	ym3DIYFMSog3p8U76UlpMoJObLAe50M1atMNm7PM6ebNThLglibZQz0SpYa86Pn3DyZftFtc811nn
	gkj2iyt+m0OWMFnpcHvvbngtRt32KSLGjISHqmF9Okvz4t5rZTuhjSiGd4lC3FEnsiSW+Dn/rCSFe
	0Ll3UNXoL1W5haRi4da7j9dZAUun7+7eWJvFJVZBrV/efBg9ffwgCHz/aUvFdCU1ZZzDH7uTe8dv3
	rk45ik/1aWwS7qXYsreobvDKvqxB1s5qEJuBldFN95aVrsAcKfJwTszt0IZOGYuUDetEymbPiKYAz
	7T7yMPooa95Kh1Zln86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthZ3-0000000DZiQ-3Hjp;
	Tue, 11 Aug 2026 08:10:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthYz-0000000DZgj-47OR
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 08:10:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so24444255e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786435819; x=1787040619; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRDEH2ssIQhIkVPOR6PkKFR0aBPP8ALbaUyGO3LvVVE=;
        b=IbCB4UCt65CWD7whx42PKHjHdRoRnSSGa0kkGnLuKqXAxAnpad3VEZmuuHcAq3b54J
         H/O1DeFRcJ7LHZQjBvDAW3JfZ27Cl2PDXTt6henxcQjnMHDQF/byEJO/fBYVB9LkVJFe
         idXL/r4d0U5HA/MJfwirD9JN70sPjTnqOzEWgetCfqNClPZTJwgYFfqKYRuOSb+k5Zar
         v56Zj7G/065dFzrmzC4Pf1Y2Px9X0IWd5A5yPXxYW2VCoP5QIllBwh5MWRAzNjJXwfUN
         goxTi2UeY0PqWTK0k12Zmt1M0ppIxt5VjpPBopjzt7S/JPIGDzTrEod6HAWg9EScVXEC
         F2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786435819; x=1787040619;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRDEH2ssIQhIkVPOR6PkKFR0aBPP8ALbaUyGO3LvVVE=;
        b=fhX4VCbycgAK30LltihQBdaZgc9IAWNcTYGU1rBaHzW5U9CR+sP0ixTUXzvrQg+w1u
         T+1tQ67U/msdNKFZOBQ72GjNkEEkOxCl0nvkZlh+KpnerzixP0UOZnoSXQSbGoy1cvmC
         FqzFqEhuT9WXMnuOE5Y0cj9Z8nJCRaK2WWLf5GwUp6ghc3sWnsZFublEOxlv8Tv4rTai
         4wBrtQC5hnAKwA+CJQGSEbq26HY9VN6q7JPYFk+SWBgfstLOXzbXQchnDxDF+hJvB//Q
         YKzQKunRLu0500Kd2i5hDO2fp4t00aujRpp9bPqBcYM2pQ/bb2+FYxInDed2K9CNplwB
         64Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rqj7LWYrqDnI1lW3+tC9Wjku9nTMtKIvkDENxDrhiiuX56peoCYT11fJyyZmunlfKNGbl0eb1yk2nFb/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx3HCyttd7s45MMCajALkVvT9/BAQHrMvmuDJWgZQ0fWPMLYAy
	aYeK1JGnLIMyxoiOp1OvYWJNHGszg6H/WHKUNjKBgQx8hpMg54EWjX+J
X-Gm-Gg: AR+sD10ei/+18H6HenrzhoYKtBNyHtJdfojJaEdrxHvAzNNXYQ/BVOAvu0RDcT8pAFP
	gpAC+lCUmxFk09JCFZoQknePWNF1PZmRafTuboFOdj3HDGdwNdvwpbZBM+1mhDGkd9zS1p+feM/
	f5/Lkqg6wEmHUGHokzv/IVsZU2fmxGMQlisgnGtmYEBSnuasLiz7Q1A2tYhsIaKB1RmQ91gCJkG
	QoiVO2zHkFmysbkLV+yjkoSwx7uNfl6WAdVgHTGbPEHE2/GlFhcUzpxhn0If+TndcXw0+12UcCS
	w0wznme0eDlkZkfdhNlFt4wkc4O/wpzFcg2jEOGJpwd1zfQwUT3cen0FEPiy8OTK8coMMG2GuJH
	Kms9h7fiOE2r1dqVD2Om9qO2t2NyqVflJTs86f5MDCWBfpsGDFKw1DOIBQCcJb3rhcwqIMffIpD
	pj11lIhPZ0SfJjeSWu0K+9tnk2I124iGALab8WwK4Bw1gf3YMTT1z+NzbxiOROq81xnL8MBFiTo
	OT79Ot+oQzFa7XUEfEOvu7gD/AOoABtpx4=
X-Received: by 2002:a05:600c:821b:b0:499:6a92:fff1 with SMTP id 5b1f17b1804b1-4997847e9b5mr25827975e9.18.1786435818734;
        Tue, 11 Aug 2026 01:10:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5ac6e6sm2454288f8f.6.2026.08.11.01.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:10:18 -0700 (PDT)
Date: Tue, 11 Aug 2026 09:10:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, linux-um@lists.infradead.org, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ning Sun <ning.sun@intel.com>, x86@kernel.org,
 tboot-devel@lists.sourceforge.net, Ard Biesheuvel <ardb@kernel.org>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org, Vishal
 Moola <vishal.moola@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 03/22] mm: introduce MMF_KERNEL flag and set it for
 init_mm
Message-ID: <20260811091016.5ca67143@pumpkin>
In-Reply-To: <33fc9d31-2866-4315-9510-0004deb93994@kernel.org>
References: <20260714-remove_pgtable_cdtor-v1-0-44be8a7685d7@arm.com>
	<20260714-remove_pgtable_cdtor-v1-3-44be8a7685d7@arm.com>
	<01f07ea2-8bdd-4450-8a49-548f8b646cfd@kernel.org>
	<33fc9d31-2866-4315-9510-0004deb93994@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_011022_040557_B1BC1700 
X-CRM114-Status: GOOD (  22.91  )
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

T24gV2VkLCA1IEF1ZyAyMDI2IDE0OjA3OjAxICswMjAwCiJEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KSIgPGRhdmlkQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiA4LzMvMjYgMTU6NTksIENocmlzdG9w
aGUgTGVyb3kgKENTIEdST1VQKSB3cm90ZToKPiA+IAo+ID4gCj4gPiBMZSAxNC8wNy8yMDI2IMOg
IDE2OjAzLCBLZXZpbiBCcm9kc2t5IGEgw6ljcml0wqA6ICAKPiA+PiBtbSBjb2RlIG9mdGVuIG5l
ZWRzIHRvIGtub3cgd2hldGhlciBzb21lIG1tIHJlcHJlc2VudHMgYSBrZXJuZWwgb3IKPiA+PiB1
c2VyIGFkZHJlc3Mgc3BhY2UuIFRoaXMgaXMgY3VycmVudGx5IGRvbmUgYnkgY29tcGFyaW5nIHRo
ZSBtbQo+ID4+IHBvaW50ZXIgd2l0aCAmaW5pdF9tbTsgYmVzaWRlcyBub3QgYmVpbmcgcGFydGlj
dWxhcmx5IGVsZWdhbnQsIHRoaXMKPiA+PiBpZ25vcmVzIHRoZSBmYWN0IHRoYXQgb3RoZXIgbW0n
cyAoZS5nLiBlZmlfbW0pIG1heSBhbHNvIHJlcHJlc2VudAo+ID4+IHBhcnRzIG9mIHRoZSBrZXJu
ZWwgYWRkcmVzcyBzcGFjZS4KPiA+Pgo+ID4+IEludHJvZHVjZSBhIG5ldyBtbSBmbGFnIE1NRl9L
RVJORUwgYW5kIHNldCBpdCBmb3IgaW5pdF9tbS4KPiA+PiBTdWJzZXF1ZW50IHBhdGNoZXMgd2ls
bCB1c2UgdGhpcyBmbGFnIHRvIHJlcGxhY2UgY29tcGFyaXNvbnMgd2l0aAo+ID4+ICZpbml0X21t
LiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpcyBpbnRyb2R1Y2VkIGZvciBub3cuICAKPiA+IAo+ID4g
RGlkIHlvdSBjb25zaWRlciBwZXJmb3JtYW5jZSBpbXBhY3QgPyBUaGlzIHRlc3QgaXMgdXN1YWxs
eSBkb25lIGluIHF1aXRlCj4gPiBjcml0aWNhbCBtZW1vcnkgaGFuZGxpbmcgZnVuY3Rpb25zLgo+
ID4gCj4gPiBpbml0X21tIGlzIGtub3duIGF0IGxpbmsgdGltZS4gQmVmb3JlIHlvdXIgcGF0Y2gg
MDgvMjIgdGhlcmUgaXMganVzdCBhCj4gPiBjb21wYXJpc29uIG9mIG1tIChyMykgd2l0aCBhIGNv
bnN0YW50IChsb2FkZWQgaW4gcjEwKToKPiA+IAo+ID4gYzAwMTQwNDggPGFzc2VydF9wdGVfbG9j
a2VkPjoKPiA+IGMwMDE0MDQ4OsKgwqDCoCAzZCA0MCBjMSAwOcKgwqDCoMKgIGxpc8KgwqDCoMKg
IHIxMCwtMTYxMTkKPiA+IGMwMDE0MDRjOsKgwqDCoCAzOSA0YSAwMyA5OMKgwqDCoMKgIGFkZGnC
oMKgwqAgcjEwLHIxMCw5MjAKPiA+IGMwMDE0MDUwOsKgwqDCoCA3YyAwMyA1MCAwMMKgwqDCoMKg
IGNtcHfCoMKgwqAgcjMscjEwCj4gPiBjMDAxNDA1NDrCoMKgwqAgNGQgODIgMDAgMjDCoMKgwqDC
oCBiZXFscgo+ID4gLi4uCj4gPiAKPiA+IEFmdGVyIHBhdGNoIDA4LzIyIHdlIGhhdmUsIGl0IGZp
cnN0IGNoZWNrcyB0aGF0IG1tIGlzIG5vdCAwLCB0aGVuIGl0IGxvYWRzIHRoZQo+ID4gd29yZCBs
b2NhdGVkIGF0IG1tKzUyOCB0aGVuIEFORCBpdCB3aXRoIDB4MS4gVGhpcyBsb2FkIG1pZ2h0IGJl
IGNvc3RseS4KPiA+IAo+ID4gYzAwMTQwNDggPGFzc2VydF9wdGVfbG9ja2VkPjoKPiA+IGMwMDE0
MDQ4OsKgwqDCoCAyYyAwMyAwMCAwMMKgwqDCoMKgIGNtcHdpwqDCoCByMywwCj4gPiBjMDAxNDA0
YzrCoMKgwqAgN2MgODUgMjMgNzjCoMKgwqDCoCBtcsKgwqDCoMKgwqAgcjUscjQKPiA+IGMwMDE0
MDUwOsKgwqDCoCA0MSA4MiAwMCAxMMKgwqDCoMKgIGJlccKgwqDCoMKgIGMwMDE0MDYwIDxhc3Nl
cnRfcHRlX2xvY2tlZCsweDE4Pgo+ID4gYzAwMTQwNTQ6wqDCoMKgIDgxIDIzIDAyIDEwwqDCoMKg
wqAgbHd6wqDCoMKgwqAgcjksNTI4KHIzKQo+ID4gYzAwMTQwNTg6wqDCoMKgIDcxIDI5IDAwIDAx
wqDCoMKgwqAgYW5kaS7CoMKgIHI5LHI5LDEKPiA+IGMwMDE0MDVjOsKgwqDCoCA0YyA4MiAwMCAy
MMKgwqDCoMKgIGJuZWxyICAKPiAKPiBJcyB0aGF0IGEgcmVhbCBwcm9ibGVtLCB0aG91Z2g/CgpU
aGUgY29zdCBvZiB0aGUgcmVhZCBpcyBsaWtlbHkgdG8gbWF0dGVyIG1vc3QgaWYgdGhlIGJyYW5j
aCBnZXRzIG1pc3ByZWRpY3RlZC4KSSdkIGFsc28gZ3Vlc3MgdGhlIG1tIGlzbid0IHVzdWFsbHkg
TlVMTCAtIHNvIHRoYXQgYnJhbmNoIG5lZWRzIHRvIHN0YXRpY2FsbHkKcHJlZGljdGVkIGNvcnJl
Y3RseSBhcyB3ZWxsLgpJJ2QgYWxzbyBub3QgYXNzdW1lIHRoYXQgdGhlIG1tIGlzIGluIHRoZSBj
YWNoZSAodW5sZXNzIHRoZSBzdXJyb3VuZGluZyBjb2RlCmhhcyBhbHJlYWR5IGFjY2Vzc2VkIGl0
KSwgdGhlIEwxIGRhdGEgY2FjaGVzIGFyZSBzbWFsbC4KCglEYXZpZAoKCj4gCj4gV2hhdCB3ZSBj
b3VsZCBkbyBpcyB0byBqdXN0IGtlZXAgdGhlID09ICZpbml0X21tIGNoZWNrIGludGVybmFsbHkg
b24gY29uZmlncwo+IHdoZXJlIHdlIGtub3cgdGhhdCB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlIHN1
Y2ggTU0gY29udGV4dC4KPiAKPiBKdXN0IGEgdGhvdWdodC4KPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
