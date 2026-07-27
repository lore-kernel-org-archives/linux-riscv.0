Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD75C531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rxyvw8RzmNs+KI2WsCdMPJJZtCEW8lweZtMDFjEv08=; b=PG2Tbf2JGhGy7j
	rAE+9cMbS6jtqJxp/TyBHzdDeZkm2CqKrQBLDTEdP4eUQKLiAbvzQI5+cZMKpOHwXUlUWQoJ1S+Dc
	LV6+Aub+ERH57jkrkRmK4EdMF4S9jaPDZyfiN2C6HrETdqGQB9ulZPOGzO5knED+MvEAim8WHG/Nt
	W6xaHRqn9li/x+29PBAKsnPJC/b9aWI5OjFUjsaFnoNVMz73Cjv/vOf77yAgC1WIQs3UktXaidg9Y
	zaFOQvRawz7s8c1m8vhXSy5FdynsYrV8WqbQ8qjzigy18DmVBTO8xB+zumym7CcKgmoVDYeSTdPtx
	FilwMDTnXDev17AX1vMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMiH-000000035ur-1rFP;
	Mon, 27 Jul 2026 14:53:53 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMiD-000000035sC-1Vuw
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 14:53:52 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51c10e86e52so391341cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 07:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785164027; cv=none;
        d=google.com; s=arc-20260327;
        b=VynGECykWo6ptTQePdluEQ7NKumbLfYjhoHs1Z0GySHC8v4S/A7vbg1ABdXp79epGg
         Mo2tQO/5xGxMfWZs+7vLFP0/KiPplU3kzwbMhdBZqrxJzvKO7SMEJQ8gPTe4rMhsc3hp
         OklUlsICNLVmcSPF3JTt7VO4j/Lmy9jYDcgGdLdWPA+YPOgYXHGfgX1hTtZNVj11sFRa
         vGkholxZBJcDQopUdcTrZIkzDbNqWJjLomJ4P3xlQcAXi6EweZOw36oFXXLPc/RN+Sd2
         sFUU5aACySZzrksro1LMDWua35D7OrYSvm4PjG14Ntr7UFaX8cq2f61Lhxk9hux2Fv5h
         ogLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HBlnivitJQK60dpXDn/ZTN6OnP1/cWmlbn1S1eH9KWM=;
        fh=YYnNYWS5JTBkGuI6kGh6eRVgtCKBJbvEpqsgp+52uVQ=;
        b=ITCvATB6xk+z/BlC4rPufJg/v0Kber61vmgOZhXI8eRwNNUswyGWzgVU0j4t5LmwKx
         8PF17HIFJ666Z7SSEaZYQeShJg95aQsYzHEfDKmkGj3juKU/AZ1QMamVzRxdSvl+f2Rd
         wkv6+2H19L95e/LObl/A1SwfxwA8AZepjKINPgv9sHBeCSYgRmK5iiPFf7uHqgQxeOpr
         W6LwREViqul+Oa6mpqnRU7ectWWpoLDznQLQBWn+aUJEqejtHTZCAPrTO4g+ptS+erMk
         iP4VaTecNcRMXzj+zZBHayCQZmkr8t0QdxHTf8V0KCl4T3IhliEO/KzFJgsjMhaMluUP
         OEOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785164027; x=1785768827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HBlnivitJQK60dpXDn/ZTN6OnP1/cWmlbn1S1eH9KWM=;
        b=b+35sy63m3dF0XD8JK4khpbF6UK4ADK2wdlxPs4CekWBAf7xYNHKIykYupNL8RIVtK
         JFAi4MVnJFiDa85gj4688LwspY1XfrqK8W+t9rJcv+UbItU/1YEy5YhLSMR6W9Us/zC5
         bxrDKYbHcm1p8UDLjDJVG/WtCvpi76GrOX2/3zYzfMs9eV3ooAztm9C/kMmFsqNjGgCE
         GvhzXAXaK7owD+Gf9gYjUWoNxxlVkoZ3AxRi9KWkH5nYUKXWt2mnI1OAmzmCkmJsgtEh
         OeurScYYhUYHEqCpcZuvVF6e3yTJUrsbDuipn+xTd/AQ0KviEsc4lAg47DT8cYAQBfV4
         /zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164027; x=1785768827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBlnivitJQK60dpXDn/ZTN6OnP1/cWmlbn1S1eH9KWM=;
        b=bxDoIKNZ8lq3XxOJWoRgD3CcEhy4iT5wMRJMf7tshWnAQtmj4sob3+qSe9x13Hz44D
         Efhc1mVtOImhFZeL6/MHr1O5Eyp37a+r0z5R6rZGmzXQdpUksGQKrKWp+wlYP7GPoS+E
         M/qXRphZsQO96ZFdPkihkM5kUHlefEBYzu3072ihNwI10PaEYGStIuA+y4jxl85pBYzG
         lzL72bIozAeizMuMVS5oZAMclZp4bzzGd0PpaTirMczDXMxj/48n7mQWLxpeEZ5Z3v2p
         Fr/MwxvI8nwyHQRbozsgARiFP8UeWikrin8sETsv6dmBf4XRr4e4X9BfJeaszKOpye+8
         Oa+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqlX2/sVymWJV26nxNGFNhyWsRNkJa5grOM4m4y7kvac9M7ICPSLpDLDjFKg+tdzeBQc+Oo9KhLSX6osw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0+SLwuhxZynMGRe6VPboXxiF0QMtQe7QInJMOlQzDWgxRNS6Z
	L36AsOBB01cz4DitfWo/sK+Q7qjUL6p8oSh0ceYYQ0Kc40KhZlcsTkFU4XRm6D4FOYja10h47ME
	Jkftj666KrEPzFg2YBMmT8YxJGhhHlftuKhPVfNhP
X-Gm-Gg: AR+sD10vmaWBftzhHpbpOKlHqpxt+4MFZPo5elPixg11P2lnzgope0ms01AX1jv19rw
	z1MZHCB2b5tXtw0LX6Qvu+3i6S8Fqqo7njVisPfg0EkfBq3xNiBs0ozc+z8G7Bgy0aOWcuRJdVW
	khh+Jfsv153aw1XveecxXYD5Px7W9am1ar6InqhXwArwd3SHOTlhPgumts1mfR2lHWQcjAg6Z3o
	X6bJq7LlEaIO0M2TbKi5AHLaGgd+NmgEOtRXHBVDeL/f9PKKNhOereEpla2inpNvFyHBHs=
X-Received: by 2002:a05:622a:901c:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-529a76e10b3mr32723511cf.11.1785164026709; Mon, 27 Jul 2026
 07:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260724222934.1463812-1-riel@surriel.com> <20260724222934.1463812-3-riel@surriel.com>
In-Reply-To: <20260724222934.1463812-3-riel@surriel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 27 Jul 2026 07:53:35 -0700
X-Gm-Features: AUfX_mxhZprgZ03CyQH1jdCYZ3TPLv3GAQLED7tTn-RB53lD8I6WJHAc-o4mA6w
Message-ID: <CAJuCfpF=S2F3iSu8AxQxoU8KVe=_1d63mjEcd==+u9wBjWqe5Q@mail.gmail.com>
Subject: Re: [PATCH RFC v4 02/12] riscv/mm: add untagged_addr_remote_unlocked()
To: Rik van Riel <riel@surriel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_075350_029913_9159E669 
X-CRM114-Status: GOOD (  26.84  )
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

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgMzozMOKAr1BNIFJpayB2YW4gUmllbCA8cmllbEBzdXJy
aWVsLmNvbT4gd3JvdGU6Cj4KPiBfX2FjY2Vzc19yZW1vdGVfdm0oKSByZWFkcyBhbm90aGVyIHRh
c2sncyBtZW1vcnkgdW5kZXIgdGhlIG1tYXAgbG9jay4gVGhhdAo+IGxvY2sgaXMgY29udGVuZGVk
IG9uIGxhcmdlIG11bHRpLXRocmVhZGVkIHdvcmtsb2Fkcywgd2hlcmUgYW4gbW1hcCgpIG9yCj4g
bXVubWFwKCkgc3RhbGxzIHJlYWRlcnMgbGlrZSAvcHJvYy9QSUQvY21kbGluZSBvciBwcm9jZXNz
X3ZtX3JlYWR2KCkgZXZlbgo+IHRob3VnaCB0aGUgdGFyZ2V0IG1lbW9yeSBpcyByZXNpZGVudCBh
bmQgcmVhY2hhYmxlIHVuZGVyIHRoZSBwZXItVk1BIGxvY2suCj4KPiBSZWFjaGluZyBpdCB1bmRl
ciB0aGUgcGVyLVZNQSBsb2NrIG1lYW5zIGxvb2tpbmcgdXAgdGhlIFZNQSBmaXJzdCwgd2hpY2gK
PiByZXF1aXJlcyB1bnRhZ2dpbmcgdGhlIHJlbW90ZSBhZGRyZXNzIHdpdGhvdXQgdGhlIG1tYXAg
bG9jay4gcmlzY3Yncwo+IHVudGFnZ2VkX2FkZHJfcmVtb3RlKCkgYXNzZXJ0cyB0aGF0IGxvY2sg
YW5kIGhhcyBubyB1bmxvY2tlZCB2YXJpYW50OyB0aGUKPiBnZW5lcmljIHVudGFnZ2VkX2FkZHJf
cmVtb3RlX3VubG9ja2VkKCkgZmFsbHMgYmFjayB0byB1bnRhZ2dlZF9hZGRyKCksCj4gd2hpY2gg
bWFza3MgYWdhaW5zdCBjdXJyZW50LT5tbSwgbm90IHRoZSB0YXJnZXQgbW0uCj4KPiBBZGQgdW50
YWdnZWRfYWRkcl9yZW1vdGVfdW5sb2NrZWQoKSwgd2hpY2ggbWFza3MgQGFkZHIgYWdhaW5zdCB0
aGUgdGFyZ2V0Cj4gbW0gd2l0aG91dCBhc3NlcnRpbmcgdGhlIGxvY2ssIGFuZCByZWRlZmluZSB1
bnRhZ2dlZF9hZGRyX3JlbW90ZSgpIG9uIHRvcAo+IG9mIGl0IHNvIGl0IGtlZXBzIHRoZSBhc3Nl
cnRpb24uCj4KPiBUaGUgbWFzayB3aWR0aCBpcyBtbS0+Y29udGV4dC5wbWxlbiwgd3JpdHRlbiB3
aGlsZSBhIHByb2dyYW0gaXMgc2luZ2xlCj4gdGhyZWFkZWQsIGFuZCBmcm96ZW4gd2l0aCBNTV9D
T05URVhUX0xPQ0tfUE1MRU4gb25jZSBpdCBzcGF3bnMgYSBzZWNvbmQKPiB0aHJlYWQuCj4KPiBU
aGF0IHJlYWQgbmVlZCBub3QgYmUgc3RhYmxlOiBwbWxlbiBpcyBhbHJlYWR5IHJlYWQgbG9ja2xl
c3NseSBieQo+IHVudGFnZ2VkX2FkZHIoKSBhbmQgbW1fdW50YWdfbWFzaygpLCBhbmQgYSByZW1v
dGUgdW50YWcgaXMgYmVzdC1lZmZvcnQuCj4gQW5ub3RhdGUgdGhlIGxvY2tsZXNzIHJlYWRzIHdp
dGggUkVBRF9PTkNFKCkgYW5kIHRoZSB3cml0ZXMgd2l0aAo+IFdSSVRFX09OQ0UoKSwgc28gYSBy
ZWFkZXIgc2VlcyBvbmUgd2hvbGUgdmFsdWUgYW5kIHRoZSBhY2Nlc3NlcyBhcmUKPiBLQ1NBTi1j
bGVhbi4KPgo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC44Cj4gU2lnbmVkLW9m
Zi1ieTogUmlrIHZhbiBSaWVsIDxyaWVsQHN1cnJpZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN1cmVu
IEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL21tdV9jb250ZXh0LmggfCAgNCArKy0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdWFjY2Vzcy5oICAgICB8IDEwICsrKysrKystLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJv
Y2Vzcy5jICAgICAgICAgIHwgMTIgKysrKysrKy0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXVf
Y29udGV4dC5oCj4gaW5kZXggZGJmMjdhNzhkZjZjLi4zY2UxNjc5NmU1YTIgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oCj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oCj4gQEAgLTIxLDcgKzIxLDcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIGFjdGl2YXRlX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKnByZXYsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm5leHQpCj4gIHsKPiAgI2lm
ZGVmIENPTkZJR19SSVNDVl9JU0FfU1VQTQo+IC0gICAgICAgbmV4dC0+Y29udGV4dC5wbWxlbiA9
IDA7Cj4gKyAgICAgICBXUklURV9PTkNFKG5leHQtPmNvbnRleHQucG1sZW4sIDApOwo+ICAjZW5k
aWYKPiAgICAgICAgIHN3aXRjaF9tbShwcmV2LCBuZXh0LCBOVUxMKTsKPiAgfQo+IEBAIC00NCw3
ICs0NCw3IEBAIERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRSh1c2VfYXNpZF9hbGxvY2F0b3IpOwo+
ICAjZGVmaW5lIG1tX3VudGFnX21hc2sgbW1fdW50YWdfbWFzawo+ICBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgbW1fdW50YWdfbWFzayhzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgewo+IC0g
ICAgICAgcmV0dXJuIC0xVUwgPj4gbW0tPmNvbnRleHQucG1sZW47Cj4gKyAgICAgICByZXR1cm4g
LTFVTCA+PiBSRUFEX09OQ0UobW0tPmNvbnRleHQucG1sZW4pOwo+ICB9Cj4gICNlbmRpZgo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCA1ZDRlYzE1NTg0Y2YuLjUzODA2ZTBmN2Rj
ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gQEAgLTE2LDcgKzE2LDcgQEAKPiAg
c3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9fdW50YWdnZWRfYWRkcl9yZW1vdGUoc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkcikKPiAgewo+ICAgICAgICAgaWYgKHJp
c2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TVVBNKSkgewo+IC0gICAg
ICAgICAgICAgICB1OCBwbWxlbiA9IG1tLT5jb250ZXh0LnBtbGVuOwo+ICsgICAgICAgICAgICAg
ICB1OCBwbWxlbiA9IFJFQURfT05DRShtbS0+Y29udGV4dC5wbWxlbik7Cj4KPiAgICAgICAgICAg
ICAgICAgLyogVmlydHVhbCBhZGRyZXNzZXMgYXJlIHNpZ24tZXh0ZW5kZWQ7IHBoeXNpY2FsIGFk
ZHJlc3NlcyBhcmUgemVyby1leHRlbmRlZC4gKi8KPiAgICAgICAgICAgICAgICAgaWYgKElTX0VO
QUJMRUQoQ09ORklHX01NVSkpCj4gQEAgLTMzLDEyICszMywxNiBAQCBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgX191bnRhZ2dlZF9hZGRyX3JlbW90ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
dW5zaWduZQo+ICAgICAgICAgKF9fZm9yY2UgX190eXBlb2ZfXyhhZGRyKSlfX3VudGFnZ2VkX2Fk
ZHJfcmVtb3RlKGN1cnJlbnQtPm1tLCBfX2FkZHIpOyAgXAo+ICB9KQo+Cj4gLSNkZWZpbmUgdW50
YWdnZWRfYWRkcl9yZW1vdGUobW0sIGFkZHIpICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyNkZWZpbmUgdW50YWdnZWRfYWRkcl9yZW1vdGVfdW5sb2NrZWQobW0s
IGFkZHIpICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICB1bnNpZ25l
ZCBsb25nIF9fYWRkciA9IChfX2ZvcmNlIHVuc2lnbmVkIGxvbmcpKGFkZHIpOyAgICAgICAgICAg
ICAgICAgICBcCj4gLSAgICAgICBtbWFwX2Fzc2VydF9sb2NrZWQobW0pOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAoX19mb3JjZSBf
X3R5cGVvZl9fKGFkZHIpKV9fdW50YWdnZWRfYWRkcl9yZW1vdGUobW0sIF9fYWRkcik7ICAgICAg
ICAgICBcCj4gIH0pCj4KPiArI2RlZmluZSB1bnRhZ2dlZF9hZGRyX3JlbW90ZShtbSwgYWRkcikg
KHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIG1tYXBf
YXNzZXJ0X2xvY2tlZChtbSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiArICAgICAgIHVudGFnZ2VkX2FkZHJfcmVtb3RlX3VubG9ja2VkKG1tLCBh
ZGRyKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArfSkKPiArCj4gICNkZWZp
bmUgYWNjZXNzX29rKGFkZHIsIHNpemUpIGxpa2VseShfX2FjY2Vzc19vayh1bnRhZ2dlZF9hZGRy
KGFkZHIpLCBzaXplKSkKPiAgI2Vsc2UKPiAgI2RlZmluZSB1bnRhZ2dlZF9hZGRyKGFkZHIpIChh
ZGRyKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9jZXNzLmMKPiBpbmRleCBiMmRmN2Y3MjI0MWEuLjZhZTc1NTJmZWQwOSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9jZXNzLmMKPiBAQCAtMzU3LDEzICszNTcsMTUgQEAgbG9uZyBzZXRfdGFn
Z2VkX2FkZHJfY3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgYXJn
KQo+ICAgICAgICAgaWYgKG1tYXBfd3JpdGVfbG9ja19raWxsYWJsZShtbSkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVFI7Cj4KPiAtICAgICAgIGlmICh0ZXN0X2JpdChNTV9DT05URVhU
X0xPQ0tfUE1MRU4sICZtbS0+Y29udGV4dC5mbGFncykgJiYgbW0tPmNvbnRleHQucG1sZW4gIT0g
cG1sZW4pIHsKPiAtICAgICAgICAgICAgICAgbW1hcF93cml0ZV91bmxvY2sobW0pOwo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICsgICAgICAgaWYgKHRlc3RfYml0KE1NX0NPTlRF
WFRfTE9DS19QTUxFTiwgJm1tLT5jb250ZXh0LmZsYWdzKSkgewo+ICsgICAgICAgICAgICAgICBp
ZiAoUkVBRF9PTkNFKG1tLT5jb250ZXh0LnBtbGVuKSAhPSBwbWxlbikgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIG1tYXBfd3JpdGVfdW5sb2NrKG1tKTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVCVVNZOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiAg
ICAgICAgIGVudmNmZ191cGRhdGVfYml0cyh0YXNrLCBFTlZDRkdfUE1NLCBwbW0pOwo+IC0gICAg
ICAgbW0tPmNvbnRleHQucG1sZW4gPSBwbWxlbjsKPiArICAgICAgIFdSSVRFX09OQ0UobW0tPmNv
bnRleHQucG1sZW4sIHBtbGVuKTsKPgo+ICAgICAgICAgbW1hcF93cml0ZV91bmxvY2sobW0pOwo+
Cj4gQEAgLTM5NCw3ICszOTYsNyBAQCBsb25nIGdldF90YWdnZWRfYWRkcl9jdHJsKHN0cnVjdCB0
YXNrX3N0cnVjdCAqdGFzaykKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICB9Cj4K
PiAtICAgICAgIGlmICh0YXNrLT5tbS0+Y29udGV4dC5wbWxlbikKPiArICAgICAgIGlmIChSRUFE
X09OQ0UodGFzay0+bW0tPmNvbnRleHQucG1sZW4pKQo+ICAgICAgICAgICAgICAgICByZXQgfD0g
UFJfVEFHR0VEX0FERFJfRU5BQkxFOwo+Cj4gICAgICAgICByZXR1cm4gcmV0Owo+IC0tCj4gMi41
My4wLU1ldGEKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
