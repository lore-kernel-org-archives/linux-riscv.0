Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3357EC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 05:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q89wjk9LnV3uDaq2hTGZbkPFKNEiezvhkVyLIzFK9CU=; b=KfcJHHJPfjZVatz4tleT2pK70H
	uPLejO7s1XVmlkHmt64bZBIHFGrWGAszQsYsWrNmR7dVoUnUv7etEBwEeL2JdoAXtY6wuaxo4GDTR
	C8/BjGDTwJY5DojIwI+v8KLmAyF4W7zVgXL4o75cneUdo9EFzi76JCPA/7ECTNsaO+O0bhQPy7uYr
	hCwdw532GH9iC4mvyl0l5cuoRl5YDTUZqfVTQ3zfQSha2jCNIZU3bO+jpVnmwYGmsn4mdXd69yOQ9
	Xd/5MOpN8tRqHherMqeGZrTHewgWQNCzsrUP5/7591HyMXwaFFTHEQ0Ncris2pMIhpZfwsFIrH3Oz
	2lpVTWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rym8V-0000000C5dJ-0dwj;
	Mon, 22 Apr 2024 05:22:39 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rym8S-0000000C5ca-1GNW
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 05:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713763356; x=1745299356;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZKqatucqlCT9kWZz8IX/UslCh9aEuPFTXZOmstfs/CU=;
  b=lE/YPNbhnJwgEwITJyFieqdud+Hsr95PUSs0sHRDw1sktoQSPoPHH9nt
   nEXUatZQrQc3E+lnRBMoDu2Rc4mSlxE2puInTb0io7HpGx/klZaFpYVKd
   VR9RmTFzkBhNG6nk5264xZFTUvK402s7bCYucU4vBEE/k7ACk0GRjzjfQ
   f7vbvhN4OYbgSq1JCn/RbXLyXNxfbi0BD6LPfmq86ZKBOPcXEzy8e0OMU
   K44ywQe4HBguzo6t3z+1Fxd7Chu1r8AIT4BnGiUW9aFxRrxD3u/zvgxBe
   UKAYai4kx0YejnhLv2rlnewuYEJ0I+iMNm++cbWOpkNEunUeNSOWYavnz
   g==;
X-CSE-ConnectionGUID: LgEkOKuMT+KiS/HcsTNckA==
X-CSE-MsgGUID: URRjKfetSCOyPSqdMugGDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="34683066"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="34683066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 22:22:31 -0700
X-CSE-ConnectionGUID: 3AUe3Y+NQx2mxryv5T9TlQ==
X-CSE-MsgGUID: N7gOqtsFQ8W23/Oj5az/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="23952539"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa006.fm.intel.com with ESMTP; 21 Apr 2024 22:22:26 -0700
Message-ID: <2f2750cd-a5bf-4486-8f50-c93d246f8b0c@linux.intel.com>
Date: Mon, 22 Apr 2024 13:21:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] iommu/riscv: Paging domain support
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <301244bc3ff5da484b46d3fecc931cdad7d2806f.1713456598.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_222236_412956_5249A3ED 
X-CRM114-Status: GOOD (  26.51  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNC8xOS8yNCAxMjozMiBBTSwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gSW50cm9kdWNlIGZp
cnN0LXN0YWdlIGFkZHJlc3MgdHJhbnNsYXRpb24gc3VwcG9ydC4KPiAKPiBQYWdlIHRhYmxlIGNv
bmZpZ3VyZWQgYnkgdGhlIElPTU1VIGRyaXZlciB3aWxsIHVzZSB0aGUgc2FtZSBmb3JtYXQKPiBh
cyB0aGUgQ1BV4oCZcyBNTVUsIGFuZCB3aWxsIGZhbGxiYWNrIHRvIGlkZW50aXR5IHRyYW5zbGF0
aW9uIGlmIHRoZQo+IHBhZ2UgdGFibGUgZm9ybWF0IGNvbmZpZ3VyZWQgZm9yIHRoZSBNTVUgaXMg
bm90IHN1cHBvcnRlZCBieSB0aGUKPiBJT01NVSBoYXJkd2FyZS4KPiAKPiBUaGlzIGNoYW5nZSBp
bnRyb2R1Y2VzIElPVElOVkFMLlZNQSBjb21tYW5kLCByZXF1aXJlZCB0byBpbnZhbGlkYXRlCj4g
YW55IGNhY2hlZCBJT0FUQyBlbnRyaWVzIGFmdGVyIG1hcHBpbmcgaXMgdXBkYXRlZCBhbmQvb3Ig
cmVtb3ZlZCBmcm9tCj4gdGhlIHBhZ2luZyBkb21haW4uIEludmFsaWRhdGlvbnMgZm9yIHRoZSBu
b24tbGVhZiBwYWdlIGVudHJpZXMgd2lsbAo+IGJlIGFkZGVkIHRvIHRoZSBkcml2ZXIgY29kZSBp
biBzZXBhcmF0ZSBwYXRjaCBzZXJpZXMsIGZvbGxvd2luZyBzcGVjCj4gdXBkYXRlIHRvIGNsYXJp
Znkgbm9uLWxlYWYgY2FjaGUgaW52YWxpZGF0aW9uIGNvbW1hbmQuIFdpdGggdGhpcyBwYXRjaCwK
PiBhbGxvd2luZyBvbmx5IDRLIG1hcHBpbmdzIGFuZCBrZWVwaW5nIG5vbi1sZWFmIHBhZ2UgZW50
cmllcyBpbiBtZW1vcnkKPiB0aGlzIHNob3VsZCBiZSBhIHJlYXNvbmFibGUgc2ltcGxpZmljYXRp
b24uCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5j
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZyB8ICAgMSArCj4gICBk
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgfCA0NjcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQ2NiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAoKWy4uLl0KCj4gKwo+ICAgc3RhdGljIGludCByaXNjdl9pb21tdV9hdHRh
Y2hfZG9tYWluKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11LAo+ICAgCQkJCSAgICAg
c3RydWN0IGRldmljZSAqZGV2LAo+ICAgCQkJCSAgICAgc3RydWN0IGlvbW11X2RvbWFpbiAqaW9t
bXVfZG9tYWluKQo+ICAgewo+ICAgCXN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9p
b21tdV9md3NwZWNfZ2V0KGRldik7Cj4gKwlzdHJ1Y3QgcmlzY3ZfaW9tbXVfZG9tYWluICpkb21h
aW47Cj4gICAJc3RydWN0IHJpc2N2X2lvbW11X2RjICpkYzsKPiArCXN0cnVjdCByaXNjdl9pb21t
dV9ib25kICpib25kID0gTlVMTCwgKmI7Cj4gKwlzdHJ1Y3QgcmlzY3ZfaW9tbXVfY29tbWFuZCBj
bWQ7Cj4gICAJdTY0IGZzYywgdGEsIHRjOwo+ICAgCWludCBpOwo+ICAgCj4gQEAgLTc2OSw2ICs4
MzgsMjAgQEAgc3RhdGljIGludCByaXNjdl9pb21tdV9hdHRhY2hfZG9tYWluKHN0cnVjdCByaXNj
dl9pb21tdV9kZXZpY2UgKmlvbW11LAo+ICAgCQl0YSA9IDA7Cj4gICAJCXRjID0gUklTQ1ZfSU9N
TVVfRENfVENfVjsKPiAgIAkJZnNjID0gRklFTERfUFJFUChSSVNDVl9JT01NVV9EQ19GU0NfTU9E
RSwgUklTQ1ZfSU9NTVVfRENfRlNDX01PREVfQkFSRSk7Cj4gKwl9IGVsc2UgaWYgKGlvbW11X2Rv
bWFpbi0+dHlwZSAmIF9fSU9NTVVfRE9NQUlOX1BBR0lORykgewo+ICsJCWRvbWFpbiA9IGlvbW11
X2RvbWFpbl90b19yaXNjdihpb21tdV9kb21haW4pOwo+ICsKPiArCQl0YSA9IEZJRUxEX1BSRVAo
UklTQ1ZfSU9NTVVfUENfVEFfUFNDSUQsIGRvbWFpbi0+cHNjaWQpOwo+ICsJCXRjID0gUklTQ1Zf
SU9NTVVfRENfVENfVjsKPiArCQlpZiAoZG9tYWluLT5hbW9fZW5hYmxlZCkKPiArCQkJdGMgfD0g
UklTQ1ZfSU9NTVVfRENfVENfU0FERTsKPiArCQlmc2MgPSBGSUVMRF9QUkVQKFJJU0NWX0lPTU1V
X1BDX0ZTQ19NT0RFLCBkb21haW4tPnBnZF9tb2RlKSB8Cj4gKwkJICAgICAgRklFTERfUFJFUChS
SVNDVl9JT01NVV9QQ19GU0NfUFBOLCB2aXJ0X3RvX3Bmbihkb21haW4tPnBnZF9yb290KSk7Cj4g
Kwo+ICsJCWJvbmQgPSBremFsbG9jKHNpemVvZigqYm9uZCksIEdGUF9LRVJORUwpOwo+ICsJCWlm
ICghYm9uZCkKPiArCQkJcmV0dXJuIC1FTk9NRU07Cj4gKwkJYm9uZC0+ZGV2ID0gZGV2Owo+ICAg
CX0gZWxzZSB7Cj4gICAJCS8qIFRoaXMgc2hvdWxkIG5ldmVyIGhhcHBlbi4gKi8KPiAgIAkJcmV0
dXJuIC1FTk9ERVY7Cj4gQEAgLTc4NywxMiArODcwLDM5MCBAQCBzdGF0aWMgaW50IHJpc2N2X2lv
bW11X2F0dGFjaF9kb21haW4oc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUsCj4gICAJ
CXhjaGc2NCgmZGMtPnRhLCB0YSk7Cj4gICAJCXhjaGc2NCgmZGMtPnRjLCB0Yyk7Cj4gICAKPiAt
CQkvKiBEZXZpY2UgY29udGV4dCBpbnZhbGlkYXRpb24gd2lsbCBiZSByZXF1aXJlZC4gSWdub3Jp
bmcgZm9yIG5vdy4gKi8KPiArCQlpZiAoISh0YyAmIFJJU0NWX0lPTU1VX0RDX1RDX1YpKQo+ICsJ
CQljb250aW51ZTsKPiArCj4gKwkJLyogSW52YWxpZGF0ZSBkZXZpY2UgY29udGV4dCBjYWNoZSAq
Lwo+ICsJCXJpc2N2X2lvbW11X2NtZF9pb2Rpcl9pbnZhbF9kZHQoJmNtZCk7Cj4gKwkJcmlzY3Zf
aW9tbXVfY21kX2lvZGlyX3NldF9kaWQoJmNtZCwgZndzcGVjLT5pZHNbaV0pOwo+ICsJCXJpc2N2
X2lvbW11X2NtZF9zZW5kKGlvbW11LCAmY21kLCAwKTsKPiArCj4gKwkJaWYgKEZJRUxEX0dFVChS
SVNDVl9JT01NVV9QQ19GU0NfTU9ERSwgZnNjKSA9PSBSSVNDVl9JT01NVV9EQ19GU0NfTU9ERV9C
QVJFKQo+ICsJCQljb250aW51ZTsKPiArCj4gKwkJLyogSW52YWxpZGF0ZSBsYXN0IHZhbGlkIFBT
Q0lEICovCj4gKwkJcmlzY3ZfaW9tbXVfY21kX2ludmFsX3ZtYSgmY21kKTsKPiArCQlyaXNjdl9p
b21tdV9jbWRfaW52YWxfc2V0X3BzY2lkKCZjbWQsIEZJRUxEX0dFVChSSVNDVl9JT01NVV9EQ19U
QV9QU0NJRCwgdGEpKTsKPiArCQlyaXNjdl9pb21tdV9jbWRfc2VuZChpb21tdSwgJmNtZCwgMCk7
Cj4gKwl9Cj4gKwo+ICsJLyogU3luY2hyb25pemUgZGlyZWN0b3J5IHVwZGF0ZSAqLwo+ICsJcmlz
Y3ZfaW9tbXVfY21kX2lvZmVuY2UoJmNtZCk7Cj4gKwlyaXNjdl9pb21tdV9jbWRfc2VuZChpb21t
dSwgJmNtZCwgUklTQ1ZfSU9NTVVfSU9USU5WQUxfVElNRU9VVCk7Cj4gKwo+ICsJLyogVHJhY2sg
ZG9tYWluIHRvIGRldmljZXMgbWFwcGluZy4gKi8KPiArCWlmIChib25kKQo+ICsJCWxpc3RfYWRk
X3JjdSgmYm9uZC0+bGlzdCwgJmRvbWFpbi0+Ym9uZHMpOwo+ICsKPiArCS8qIFJlbW92ZSB0cmFj
a2luZyBmcm9tIHByZXZpb3VzIGRvbWFpbiwgaWYgbmVlZGVkLiAqLwo+ICsJaW9tbXVfZG9tYWlu
ID0gaW9tbXVfZ2V0X2RvbWFpbl9mb3JfZGV2KGRldik7CgpDYWxsaW5nIGlvbW11X2dldF9kb21h
aW5fZm9yX2RldigpIGluIHRoZSBkb21haW4gYXR0YWNoaW5nIHBhdGggaXMgdmVyeQpmcmFnaWxl
IGJlY2F1c2UgaXQgaGVhdmlseSBkZXBlbmRzIG9uIHRoZSBvcmRlciBvZiBjYWxsaW5nIHRoZSBh
dHRhY2gKY2FsbGJhY2sgYW5kIHNldHRpbmcgdGhlIGRvbWFpbiBwb2ludGVyIGluIHRoZSBjb3Jl
LgoKUGVyaGFwcyB0aGUgZHJpdmVyIGNhbiB1c2UgZGV2X2lvbW11X3ByaXZfc2V0L2dldCgpIHRv
IGtlZXAgdGhlIGFjdGl2ZQpkb21haW4gaW4gdGhlIHBlci1kZXZpY2UgcHJpdmF0ZSBkYXRhPwoK
PiArCWlmIChpb21tdV9kb21haW4gJiYgISEoaW9tbXVfZG9tYWluLT50eXBlICYgX19JT01NVV9E
T01BSU5fUEFHSU5HKSkgewo+ICsJCWRvbWFpbiA9IGlvbW11X2RvbWFpbl90b19yaXNjdihpb21t
dV9kb21haW4pOwo+ICsJCWJvbmQgPSBOVUxMOwo+ICsJCXJjdV9yZWFkX2xvY2soKTsKPiArCQls
aXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShiLCAmZG9tYWluLT5ib25kcywgbGlzdCkgewo+ICsJCQlp
ZiAoYi0+ZGV2ID09IGRldikgewo+ICsJCQkJYm9uZCA9IGI7Cj4gKwkJCQlicmVhazsKPiArCQkJ
fQo+ICsJCX0KPiArCQlyY3VfcmVhZF91bmxvY2soKTsKPiArCj4gKwkJaWYgKGJvbmQpIHsKPiAr
CQkJbGlzdF9kZWxfcmN1KCZib25kLT5saXN0KTsKPiArCQkJa2ZyZWVfcmN1KGJvbmQsIHJjdSk7
Cj4gKwkJfQo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9CgpCZXN0IHJlZ2FyZHMsCmJhb2x1
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
