Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D19C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 15:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xQDWNoY7XBS6tCiA+rkx7dcK9TQg8/APfF1Y5FQxO8=; b=HYAjiRtsjR/z03
	MhJU8tYhI8gP/SUl4TpMVwVUfX1o/vcF4qpwyWT8ok1hBwwppLMOUvkNTdcZCnLVZa7RbptNNtXhI
	bJpmIOecHXj3ADNF4F/xMkUSe4Cdsq6CVewSHe7mrQZi1cWhvo37L6cJ0ve67Wa3OsHpe71EYQD61
	TAN4RkvTYSQ/MKKQm+vOdvOsqklpbl2IlkqGlhqE64C+OYHGGQMutO3p9Ac8G0qoxXgkT7QcwNQt0
	IU1cu2woydFUAJmMvIWkpvPlLq1U/jRO3ZU1C2M0UKwqy/Yzn8qHun+m+K1H8eD9VPzUSagBBUiSZ
	dL07gbj6VrOxOuDdXp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbMvh-00DkJV-1C;
	Wed, 30 Aug 2023 15:16:25 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbMvd-00DkI7-1a;
	Wed, 30 Aug 2023 15:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693408581; x=1724944581;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kuhHM9Pb2S9UA4HVLvALcSSOlQFsYNKCJA5urnK1yJE=;
  b=jWhyVza+RI5GDaggHVHW0YlwJ/nKSHJND1tc6XYIPNngLTs9a+7LVQrK
   NokuOLo6+phbgE6fGPJ/AIaNMvhClqr++UGYSPJomwy3zDVOkiQEy+7E8
   qXc7KH80G8/HQJg4X2X1NwpF67Cm3KN2Qq9Y7Mn7CGoL1joSl1zn8JaAr
   toTptMRyjEUr3Wn8Yn4lNdxjF4Tec1l4agAHkg1BBzlk75lQgY6oH0EYm
   dM3TQb6pWbItMPfZ3e1bSCfwSJCryVDHggxwJHEuy3Vh92wqLpXvcr6Os
   Bk/+LJleH6HGmtEbSmiz97EhPhZtUv7YqvNT5oNjUwpX5THEW5u5Zge6w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439614370"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="439614370"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 08:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804574149"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="804574149"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.93.25.116]) ([10.93.25.116])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 08:12:21 -0700
Message-ID: <30ffe039-c9e2-b996-500d-5e11bf6ea789@linux.intel.com>
Date: Wed, 30 Aug 2023 23:12:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Wang <wei.w.wang@intel.com>, Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_081621_612154_9A648A57 
X-CRM114-Status: GOOD (  25.68  )
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

CgpPbiA3LzE5LzIwMjMgNzo0NCBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKClsuLi5d
Cj4gKwo+ICtzdGF0aWMgc3RydWN0IGZvbGlvICprdm1fZ21lbV9nZXRfZm9saW8oc3RydWN0IGZp
bGUgKmZpbGUsIHBnb2ZmX3QgaW5kZXgpCj4gK3sKPiArCXN0cnVjdCBmb2xpbyAqZm9saW87Cj4g
Kwo+ICsJLyogVE9ETzogU3VwcG9ydCBodWdlIHBhZ2VzLiAqLwo+ICsJZm9saW8gPSBmaWxlbWFw
X2dyYWJfZm9saW8oZmlsZS0+Zl9tYXBwaW5nLCBpbmRleCk7Cj4gKwlpZiAoIWZvbGlvKQpTaG91
bGQgdXNlwqAgaWYgKChJU19FUlIoZm9saW8pKSBpbnN0ZWFkLgoKPiArCQlyZXR1cm4gTlVMTDsK
PiArCj4gKwkvKgo+ICsJICogVXNlIHRoZSB1cC10by1kYXRlIGZsYWcgdG8gdHJhY2sgd2hldGhl
ciBvciBub3QgdGhlIG1lbW9yeSBoYXMgYmVlbgo+ICsJICogemVyb2VkIGJlZm9yZSBiZWluZyBo
YW5kZWQgb2ZmIHRvIHRoZSBndWVzdC4gIFRoZXJlIGlzIG5vIGJhY2tpbmcKPiArCSAqIHN0b3Jh
Z2UgZm9yIHRoZSBtZW1vcnksIHNvIHRoZSBmb2xpbyB3aWxsIHJlbWFpbiB1cC10by1kYXRlIHVu
dGlsCj4gKwkgKiBpdCdzIHJlbW92ZWQuCj4gKwkgKgo+ICsJICogVE9ETzogU2tpcCBjbGVhcmlu
ZyBwYWdlcyB3aGVuIHRydXN0ZWQgZmlybXdhcmUgd2lsbCBkbyBpdCB3aGVuCj4gKwkgKiBhc3Np
Z25pbmcgbWVtb3J5IHRvIHRoZSBndWVzdC4KPiArCSAqLwo+ICsJaWYgKCFmb2xpb190ZXN0X3Vw
dG9kYXRlKGZvbGlvKSkgewo+ICsJCXVuc2lnbmVkIGxvbmcgbnJfcGFnZXMgPSBmb2xpb19ucl9w
YWdlcyhmb2xpbyk7Cj4gKwkJdW5zaWduZWQgbG9uZyBpOwo+ICsKPiArCQlmb3IgKGkgPSAwOyBp
IDwgbnJfcGFnZXM7IGkrKykKPiArCQkJY2xlYXJfaGlnaHBhZ2UoZm9saW9fcGFnZShmb2xpbywg
aSkpOwo+ICsKPiArCQlmb2xpb19tYXJrX3VwdG9kYXRlKGZvbGlvKTsKPiArCX0KPiArCj4gKwkv
Kgo+ICsJICogSWdub3JlIGFjY2Vzc2VkLCByZWZlcmVuY2VkLCBhbmQgZGlydHkgZmxhZ3MuICBU
aGUgbWVtb3J5IGlzCj4gKwkgKiB1bmV2aWN0YWJsZSBhbmQgdGhlcmUgaXMgbm8gc3RvcmFnZSB0
byB3cml0ZSBiYWNrIHRvLgo+ICsJICovCj4gKwlyZXR1cm4gZm9saW87Cj4gK30KWy4uLl0KPiAr
Cj4gK3N0YXRpYyBsb25nIGt2bV9nbWVtX2FsbG9jYXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxv
ZmZfdCBvZmZzZXQsIGxvZmZfdCBsZW4pCj4gK3sKPiArCXN0cnVjdCBhZGRyZXNzX3NwYWNlICpt
YXBwaW5nID0gaW5vZGUtPmlfbWFwcGluZzsKPiArCXBnb2ZmX3Qgc3RhcnQsIGluZGV4LCBlbmQ7
Cj4gKwlpbnQgcjsKPiArCj4gKwkvKiBEZWRpY2F0ZWQgZ3Vlc3QgaXMgaW1tdXRhYmxlIGJ5IGRl
ZmF1bHQuICovCj4gKwlpZiAob2Zmc2V0ICsgbGVuID4gaV9zaXplX3JlYWQoaW5vZGUpKQo+ICsJ
CXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrX3NoYXJlZCht
YXBwaW5nKTsKPiArCj4gKwlzdGFydCA9IG9mZnNldCA+PiBQQUdFX1NISUZUOwo+ICsJZW5kID0g
KG9mZnNldCArIGxlbikgPj4gUEFHRV9TSElGVDsKPiArCj4gKwlyID0gMDsKPiArCWZvciAoaW5k
ZXggPSBzdGFydDsgaW5kZXggPCBlbmQ7ICkgewo+ICsJCXN0cnVjdCBmb2xpbyAqZm9saW87Cj4g
Kwo+ICsJCWlmIChzaWduYWxfcGVuZGluZyhjdXJyZW50KSkgewo+ICsJCQlyID0gLUVJTlRSOwo+
ICsJCQlicmVhazsKPiArCQl9Cj4gKwo+ICsJCWZvbGlvID0ga3ZtX2dtZW1fZ2V0X2ZvbGlvKGlu
b2RlLCBpbmRleCk7Cj4gKwkJaWYgKCFmb2xpbykgewo+ICsJCQlyID0gLUVOT01FTTsKPiArCQkJ
YnJlYWs7Cj4gKwkJfQo+ICsKPiArCQlpbmRleCA9IGZvbGlvX25leHRfaW5kZXgoZm9saW8pOwo+
ICsKPiArCQlmb2xpb191bmxvY2soZm9saW8pOwo+ICsJCWZvbGlvX3B1dChmb2xpbyk7Ck1heSBi
ZSBhIGR1bWIgcXVlc3Rpb24sIHdoeSB3ZSBnZXQgdGhlIGZvbGlvIGFuZCB0aGVuIHB1dCBpdCBp
bW1lZGlhdGVseT8KV2lsbCBpdCBtYWtlIHRoZSBmb2xpbyBiZSByZWxlYXNlZCBiYWNrIHRvIHRo
ZSBwYWdlIGFsbG9jYXRvcj8KCj4gKwo+ICsJCS8qIDY0LWJpdCBvbmx5LCB3cmFwcGluZyB0aGUg
aW5kZXggc2hvdWxkIGJlIGltcG9zc2libGUuICovCj4gKwkJaWYgKFdBUk5fT05fT05DRSghaW5k
ZXgpKQo+ICsJCQlicmVhazsKPiArCj4gKwkJY29uZF9yZXNjaGVkKCk7Cj4gKwl9Cj4gKwo+ICsJ
ZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9ja19zaGFyZWQobWFwcGluZyk7Cj4gKwo+ICsJcmV0dXJu
IHI7Cj4gK30KPiArClsuLi5dCj4gKwo+ICtpbnQga3ZtX2dtZW1fYmluZChzdHJ1Y3Qga3ZtICpr
dm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCj4gKwkJICB1bnNpZ25lZCBpbnQgZmQs
IGxvZmZfdCBvZmZzZXQpCj4gK3sKPiArCWxvZmZfdCBzaXplID0gc2xvdC0+bnBhZ2VzIDw8IFBB
R0VfU0hJRlQ7Cj4gKwl1bnNpZ25lZCBsb25nIHN0YXJ0LCBlbmQsIGZsYWdzOwo+ICsJc3RydWN0
IGt2bV9nbWVtICpnbWVtOwo+ICsJc3RydWN0IGlub2RlICppbm9kZTsKPiArCXN0cnVjdCBmaWxl
ICpmaWxlOwo+ICsKPiArCUJVSUxEX0JVR19PTihzaXplb2YoZ2ZuX3QpICE9IHNpemVvZihzbG90
LT5nbWVtLnBnb2ZmKSk7Cj4gKwo+ICsJZmlsZSA9IGZnZXQoZmQpOwo+ICsJaWYgKCFmaWxlKQo+
ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWlmIChmaWxlLT5mX29wICE9ICZrdm1fZ21lbV9m
b3BzKQo+ICsJCWdvdG8gZXJyOwo+ICsKPiArCWdtZW0gPSBmaWxlLT5wcml2YXRlX2RhdGE7Cj4g
KwlpZiAoZ21lbS0+a3ZtICE9IGt2bSkKPiArCQlnb3RvIGVycjsKPiArCj4gKwlpbm9kZSA9IGZp
bGVfaW5vZGUoZmlsZSk7Cj4gKwlmbGFncyA9ICh1bnNpZ25lZCBsb25nKWlub2RlLT5pX3ByaXZh
dGU7Cj4gKwo+ICsJLyoKPiArCSAqIEZvciBzaW1wbGljaXR5LCByZXF1aXJlIHRoZSBvZmZzZXQg
aW50byB0aGUgZmlsZSBhbmQgdGhlIHNpemUgb2YgdGhlCj4gKwkgKiBtZW1zbG90IHRvIGJlIGFs
aWduZWQgdG8gdGhlIGxhcmdlc3QgcG9zc2libGUgcGFnZSBzaXplIHVzZWQgdG8gYmFjawo+ICsJ
ICogdGhlIGZpbGUgKHNhbWUgYXMgdGhlIHNpemUgb2YgdGhlIGZpbGUgaXRzZWxmKS4KPiArCSAq
Lwo+ICsJaWYgKCFrdm1fZ21lbV9pc192YWxpZF9zaXplKG9mZnNldCwgZmxhZ3MpIHx8Cj4gKwkg
ICAgIWt2bV9nbWVtX2lzX3ZhbGlkX3NpemUoc2l6ZSwgZmxhZ3MpKQo+ICsJCWdvdG8gZXJyOwo+
ICsKPiArCWlmIChvZmZzZXQgKyBzaXplID4gaV9zaXplX3JlYWQoaW5vZGUpKQo+ICsJCWdvdG8g
ZXJyOwo+ICsKPiArCWZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+
ICsKPiArCXN0YXJ0ID0gb2Zmc2V0ID4+IFBBR0VfU0hJRlQ7Cj4gKwllbmQgPSBzdGFydCArIHNs
b3QtPm5wYWdlczsKPiArCj4gKwlpZiAoIXhhX2VtcHR5KCZnbWVtLT5iaW5kaW5ncykgJiYKPiAr
CSAgICB4YV9maW5kKCZnbWVtLT5iaW5kaW5ncywgJnN0YXJ0LCBlbmQgLSAxLCBYQV9QUkVTRU5U
KSkgewo+ICsJCWZpbGVtYXBfaW52YWxpZGF0ZV91bmxvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4g
KwkJZ290byBlcnI7Cj4gKwl9Cj4gKwo+ICsJLyoKPiArCSAqIE5vIHN5bmNocm9uaXplX3JjdSgp
IG5lZWRlZCwgYW55IGluLWZsaWdodCByZWFkZXJzIGFyZSBndWFyYW50ZWVkIHRvCj4gKwkgKiBi
ZSBzZWUgZWl0aGVyIGEgTlVMTCBmaWxlIG9yIHRoaXMgbmV3IGZpbGUsIG5vIG5lZWQgZm9yIHRo
ZW0gdG8gZ28KPiArCSAqIGF3YXkuCj4gKwkgKi8KPiArCXJjdV9hc3NpZ25fcG9pbnRlcihzbG90
LT5nbWVtLmZpbGUsIGZpbGUpOwo+ICsJc2xvdC0+Z21lbS5wZ29mZiA9IHN0YXJ0Owo+ICsKPiAr
CXhhX3N0b3JlX3JhbmdlKCZnbWVtLT5iaW5kaW5ncywgc3RhcnQsIGVuZCAtIDEsIHNsb3QsIEdG
UF9LRVJORUwpOwo+ICsJZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9jayhpbm9kZS0+aV9tYXBwaW5n
KTsKPiArCj4gKwkvKgo+ICsJICogRHJvcCB0aGUgcmVmZXJlbmNlIHRvIHRoZSBmaWxlLCBldmVu
IG9uIHN1Y2Nlc3MuICBUaGUgZmlsZSBwaW5zIEtWTSwKPiArCSAqIG5vdCB0aGUgb3RoZXIgd2F5
ICdyb3VuZC4gIEFjdGl2ZSBiaW5kaW5ncyBhcmUgaW52YWxpZGF0ZWQgaWYgdGhlCmFuIGV4dHJh
ICcswqAgb3IgbWF5YmUgYXJvdW5kPwoKCj4gKwkgKiBmaWxlIGlzIGNsb3NlZCBiZWZvcmUgbWVt
c2xvdHMgYXJlIGRlc3Ryb3llZC4KPiArCSAqLwo+ICsJZnB1dChmaWxlKTsKPiArCXJldHVybiAw
Owo+ICsKPiArZXJyOgo+ICsJZnB1dChmaWxlKTsKPiArCXJldHVybiAtRUlOVkFMOwo+ICt9Cj4g
KwpbLi4uXQo+IFtdCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
