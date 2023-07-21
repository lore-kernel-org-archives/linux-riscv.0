Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17690C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 03:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTsEhDJXTnAzF7yYg2I3KIIDZB51dBUc9tJuTx5oj9s=; b=gMCrifGQOhk1xl
	HpuEKNQN/TRqwYms0IF9nyPgMn7DPgylbkLXALh2QIZihvTzBFldofEm/iptWTWNSZ2QD0raYwTOL
	xMauCh1tfRC+wGq/lpX1K5MLau8Puez/BGW8ZsMYppqf2hIBamLsXVCn30BPV7OkRdUbVIEZlvamp
	12pa/eEM3FbMOPrCZzIh4Q/J5aED/bcnhFaxqC4EWX7SoQhi4lW4UTfBuL0+h1jHEip7w0SO/lihQ
	qpeQZImpIlthwBPDFPKFhg7XWzD48JSFDTzQFWnt/tQpQh+I9LlHx16qKRWOMeaQc+jqJJqKfuWUZ
	D5FYe7tBuESo790v2imw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMh9X-00ClSW-0k;
	Fri, 21 Jul 2023 03:50:03 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMh9T-00ClRd-2r
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 03:50:01 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-26307d808a4so852853a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 20:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689911398; x=1690516198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PP+KsyysvUIQdJ6ewTv+F8ZGuWEA39fo13NEoHyitfw=;
        b=lfA3gYcio7s8oXJqeQSsLROwIgTtmn9LOUax/z/TlERlxHvwKQzbg+zITQWLHrNzOZ
         i/L6H22njmRWQXVDw7Grf+rfqBo7TsV6x+t0+NtQcXl8lGzjuWq5y+xOk2twOEkV2kSg
         hTb7rlHlVuJtZn1KBuI2WrO3+czJl4IKL+LK/AAfWFFdoSSL20ZV9I39ZDaQw6nHI+Z/
         mcAfy7Q80bUPPoC2zVQNGaWWGFgC7LqKvVArO4LG/X1zh5wn0c3GypldFJz9qgxQ9Ckw
         75pDvcoKVJJv+feLng3AmMxnYUsAVhWv8QuErq/4LdyOVLkF9rrGKdE3sLuRKXnHJiib
         50sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689911398; x=1690516198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PP+KsyysvUIQdJ6ewTv+F8ZGuWEA39fo13NEoHyitfw=;
        b=DEzPyNjyNFp+M1qtsoUMX/nqFIe0X0nHif5IDK14u9gCmsc7qyP0KeX9IHe8txm6qD
         Zmq38/l8pGxrdJUpb0tEK56hztWwU11QzILhLcbPCDyx9hY/qpIyCaCS+N5UdkgKBGOF
         iZG7GNTqAqS+C01TuikIB6Sbi6IzFUAx4htBlYa1u9q3nks1LevxdfCPcfNA6bREEMeu
         3+vFkrQFG09mlkgKKxoRJQmQ1xXqyezZhyzC8btZy7s7/LoRYWfRDw572BERiiyafX7I
         iBmdct4NXcoPd+CUZjSFZluuVPp/dx/fZoY5LuYE2ObnuxBsgPikXZKze+RWIljaf3Ut
         WjVw==
X-Gm-Message-State: ABy/qLb8zWlIBlHXbwOIYS88ewTbRqJM6rbTmYD9kleNG6IcGxr8gFTe
	dSX26duUa4UjdSdjLG5uG/9KcXW6xN2xvAu7PpKUyA==
X-Google-Smtp-Source: APBJJlEr/VjirMVZtMc4cX0uJPsKqRsU32tlCDQs3tsf6K7eUQ4sFLhW24crr5+dorszKseHB0iIVKQGE8YGQVOmfI8=
X-Received: by 2002:a17:90a:5a4c:b0:263:514:5ee3 with SMTP id
 m12-20020a17090a5a4c00b0026305145ee3mr605988pji.32.1689911398194; Thu, 20 Jul
 2023 20:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
 <c26d029e-dabc-9ad2-ed42-bb6ee276e3fb@kernel.org> <CAH2o1u6pMF3MN=oFBcs9kOf-nwnEYfD2Vv=89+DzUanV59R5dw@mail.gmail.com>
 <69800c58-2df8-25e5-09e0-c9929bae2193@kernel.org> <20230720-bully-famine-dfc9a5e688ef@spud>
In-Reply-To: <20230720-bully-famine-dfc9a5e688ef@spud>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Thu, 20 Jul 2023 20:49:47 -0700
Message-ID: <CAH2o1u77EpQN6QOatc9vr7NjVk3Yzn=mjFkHmTB13PCxZfbqoQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] RISC-V: drivers/iommu/riscv: Add sysfs interface
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_205000_164866_E4B46F64 
X-CRM114-Status: GOOD (  19.08  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMzowOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBhdCAxMTozNzo1MFBNICsw
MjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gMjAvMDcvMjAyMyAyMDozMCwg
VG9tYXN6IEplem5hY2ggd3JvdGU6Cj4KPiA+ID4+PiArI2RlZmluZSBzeXNmc19kZXZfdG9faW9t
bXUoZGV2KSBcCj4gPiA+Pj4gKyAgICAgY29udGFpbmVyX29mKGRldl9nZXRfZHJ2ZGF0YShkZXYp
LCBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlLCBpb21tdSkKPiA+ID4+PiArCj4gPiA+Pj4gK3N0
YXRpYyBzc2l6ZV90IGFkZHJlc3Nfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hh
ciAqYnVmKQo+ID4gPj4KPiA+ID4+Cj4gPiA+PiBXaGVyZSBpcyB0aGUgc3lzZnMgQUJJIGRvY3Vt
ZW50ZWQ/Cj4gPiA+Pgo+ID4gPgo+ID4gPiBTeXNmcyBmb3Igbm93IGlzIHVzZWQgb25seSB0byBl
eHBvc2Ugc2VsZWN0ZWQgSU9NTVUgbWVtb3J5IG1hcHBlZAo+ID4gPiByZWdpc3RlcnMsIHdpdGgg
Y29tcGxldGUgZG9jdW1lbnRhdGlvbiBpbiB0aGUgUklTQy1WIElPTU1VIEFyY2ggU3BlYwo+ID4g
PiBbMV0sIGFuZCBzb21lIGNvbW1lbnRzIGluIGlvbW11LWJpdHMuaCBmaWxlLgo+ID4gPiBMTUsg
SWYgaXQgd291bGQgYmUgYmV0dGVyIHRvIHB1dCBhIGRlZGljYXRlZCBmaWxlIGRvY3VtZW50aW5n
IHRob3NlCj4gPiA+IHdpdGggdGhlIHBhdGNoIGl0c2VsZi4KPiA+Cj4gPiBJIG1lYW50LCB5b3Ug
Y3JlYXRlZCBuZXcgc3lzZnMgaW50ZXJmYWNlLiBNYXliZSBJIG1pc3NlZCBzb21ldGhpbmcgaW4K
PiA+IHRoZSBwYXRjaHNldCwgYnV0IGVhY2ggbmV3IHN5c2ZzIGludGVyZmFjZSByZXF1aXJlZCBk
b2N1bWVudGluZyBpbgo+ID4gRG9jdW1lbnRhdGlvbi9BQkkvLgo+Cj4gfCBleHBvc2Ugc2VsZWN0
ZWQgSU9NTVUgbWVtb3J5IG1hcHBlZCByZWdpc3RlcnMKPgo+IHwgRW5hYmxlIHN5c2ZzIGRlYnVn
IC8gdmlzaWJpbGl0eSBpbnRlcmZhY2UgcHJvdmlkaW5nIHJlc3RyaWN0ZWQKPiB8IGFjY2VzcyB0
byBoYXJkd2FyZSByZWdpc3RlcnMuCj4KPiBEb2N1bWVudGF0aW9uIHJlcXVpcmVtZW50cyBvZiBz
eXNmcyBzdHVmZiBhc2lkZSwgSSdtIG5vdCBzdXJlIHRoYXQgd2UKPiBldmVuIHdhbnQgYSBzeXNm
cyBpbnRlcmZhY2UgZm9yIHRoaXMgaW4gdGhlIGZpcnN0IHBsYWNlPyBTZWVtcyBsaWtlLCBpZgo+
IGF0IGFsbCwgdGhpcyBzaG91bGQgYmUgZGVidWdmcyBpbnN0ZWFkPyBTZWVtcyBsaWtlIHRoZSBv
bmx5IHVzZSBjYXNlIGZvcgo+IGl0IGlzIGRlYnVnZ2luZy9kZXZlbG9wbWVudC4uLgoKVGhhbmtz
IENvbm9yLCB3aWxsIHN3aXRjaCB0byBkZWJ1Z2ZzLiBUaGlzIHdpbGwgYmUgYSBtb3JlIHN1aXRh
YmxlIGludGVyZmFjZS4KCnJlZ2FyZHMsCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
