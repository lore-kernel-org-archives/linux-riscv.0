Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B71CD37AC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 20:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntfhTGo1djcWkSz4g54GQZaYZrT9pPJtaEVnHrC2BTI=; b=pV4pD1syjHXA1o
	fJiz20T+VIzcMCewtvj6pfiEaUHsM9+m91qQeWaMY3EJinSeLyp75JUu3kya70m7uu09UCXdHkGgM
	mVOol8wch3d0AbVXnnezlF8Dy/pOUC4BQlsMHbpPJQiU8v78sTWJt8F2GXlxCgc0W6y9FwMTCKnuZ
	sp1hTucyO4AJsugBmgYMcicgQupWp5WijCm//B65z5qfBUZP5Fij0YbvUXQNJAsuloMNTd+YeoCeE
	OH7IWv80Jt7LemIcnMAr7OHrAw7739QM9O3tdWCvC7VVxLLq4jMAQULk21Qklsticey/ZbnF9YbSs
	ASGhPgD3urbu18CYpp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGFp-00000003iWa-3SRA;
	Wed, 13 May 2026 20:32:29 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXIu-0000000075h-0JQ9;
	Wed, 06 May 2026 08:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778054904; x=1809590904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bfdMAsgvM6p8hWk2sdmIXhE1O1tOVF0HFNlReXBroqU=;
  b=Dz/cQ3E8f9AklFBRhwbF19T+JYs+BluhUf4F9JQQ76Zy3alib3cjR7vQ
   uSgeIgQomnTNgZOSZ7x24LXSoc+IoohdXMZxACoW7VS1x+rgjnWlmrQz7
   C1u/zImBCSmMoyFb4bifj0d1LfIxWsccWFYzTNlUojbvYkc0fPDcDULgD
   bqyIPuSnh6i+TmE4nscWuYkw4osM/5sSzAjOx9+3bRNJsQIL2zjrsLqag
   bHkEjbEO81hVGDCfke+to4uup+uMnc6jA7R50rgUetM9uP/rKgZD4mkDu
   uJ1By6FdtKWsRWue+fC8UBkSENfnkrGlLYjYGHjSEWj9Szq/nLHeZnad+
   A==;
X-CSE-ConnectionGUID: MmMFvwZCQLewcyBwlWjNrw==
X-CSE-MsgGUID: dKPa6oOPR+SZmZUz/KuDQg==
X-IronPort-AV: E=Sophos;i="6.23,219,1770595200"; 
   d="scan'208";a="18975878"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:08:18 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:20934]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.153:2525] with esmtp (Farcaster)
 id 4c3798b6-d4c5-412e-bccc-51de55c2e359; Wed, 6 May 2026 08:08:17 +0000 (UTC)
X-Farcaster-Flow-ID: 4c3798b6-d4c5-412e-bccc-51de55c2e359
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 6 May 2026 08:08:17 +0000
Received: from dev-dsk-itazur-1b-11e7fc0f.eu-west-1.amazon.com (172.19.66.53)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 6 May 2026 08:08:03 +0000
From: Takahiro Itazuri <itazur@amazon.com>
To: <seanjc@google.com>, <ljs@kernel.org>
CC: <Liam.Howlett@oracle.com>, <ackerleytng@google.com>,
	<agordeev@linux.ibm.com>, <ajones@ventanamicro.com>,
	<akpm@linux-foundation.org>, <alex@ghiti.fr>, <andrii@kernel.org>,
	<aou@eecs.berkeley.edu>, <ast@kernel.org>, <baolu.lu@linux.intel.com>,
	<borntraeger@linux.ibm.com>, <bp@alien8.de>, <bpf@vger.kernel.org>,
	<catalin.marinas@arm.com>, <chenhuacai@kernel.org>, <corbet@lwn.net>,
	<coxu@redhat.com>, <daniel@iogearbox.net>, <dave.hansen@linux.intel.com>,
	<david@kernel.org>, <derekmn@amazon.com>, <dev.jain@arm.com>,
	<eddyz87@gmail.com>, <gerald.schaefer@linux.ibm.com>, <gor@linux.ibm.com>,
	<haoluo@google.com>, <hca@linux.ibm.com>, <hpa@zytor.com>,
	<itazur@amazon.co.uk>, <jackabt@amazon.co.uk>, <jackmanb@google.com>,
	<jannh@google.com>, <jgg@ziepe.ca>, <jgross@suse.com>, <jhubbard@nvidia.com>,
	<jiayuan.chen@shopee.com>, <jmattson@google.com>, <joey.gouly@arm.com>,
	<john.fastabend@gmail.com>, <jolsa@kernel.org>, <jthoughton@google.com>,
	<kalyazin@amazon.co.uk>, <kas@kernel.org>, <kernel@xen0n.name>,
	<kpsingh@kernel.org>, <kvm@vger.kernel.org>, <kvmarm@lists.linux.dev>,
	<lenb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-pm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <lorenzo.stoakes@oracle.com>, <luto@kernel.org>,
	<maobibo@loongson.cn>, <martin.lau@linux.dev>, <maz@kernel.org>,
	<mhocko@suse.com>, <mingo@redhat.com>, <mlevitsk@redhat.com>,
	<nikita.kalyazin@linux.dev>, <oupton@kernel.org>, <palmer@dabbelt.com>,
	<patrick.roy@linux.dev>, <pavel@kernel.org>, <pbonzini@redhat.com>,
	<peterx@redhat.com>, <peterz@infradead.org>, <pfalcato@suse.de>,
	<pjw@kernel.org>, <prsampat@amd.com>, <rafael@kernel.org>,
	<riel@surriel.com>, <rppt@kernel.org>, <ryan.roberts@arm.com>,
	<sdf@fomichev.me>, <shijie@os.amperecomputing.com>,
	<skhan@linuxfoundation.org>, <song@kernel.org>, <surenb@google.com>,
	<suzuki.poulose@arm.com>, <svens@linux.ibm.com>, <tabba@google.com>,
	<tglx@kernel.org>, <thuth@redhat.com>, <urezki@gmail.com>,
	<vannapurve@google.com>, <vbabka@kernel.org>, <will@kernel.org>,
	<willy@infradead.org>, <wu.fei9@sanechips.com.cn>, <x86@kernel.org>,
	<yang@os.amperecomputing.com>, <yangyicong@hisilicon.com>,
	<yonghong.song@linux.dev>, <yosry@kernel.org>, <yu-cheng.yu@intel.com>,
	<yuzenghui@huawei.com>, <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v12 00/16] Direct Map Removal Support for guest_memfd
Date: Wed, 6 May 2026 08:07:52 +0000
Message-ID: <20260506080753.14517-1-itazur@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aeennZlV60k81OBf@google.com>
References: <aeennZlV60k81OBf@google.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.66.53]
X-ClientProxiedBy: EX19D037UWB002.ant.amazon.com (10.13.138.121) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_010824_171862_412D55E3 
X-CRM114-Status: GOOD (  13.33  )
X-Mailman-Approved-At: Wed, 13 May 2026 13:32:29 -0700
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

SGkgTG9yZW56byBhbmQgU2VhbiwKCkFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5ZWQgcmVwbHkg4oCU
IE5pa2l0YSBpcyBsZWF2aW5nIEFtYXpvbiwgYW5kIEknbQp0YWtpbmcgb3ZlciB0aGlzIHNlcmll
cyBnb2luZyBmb3J3YXJkLiBUaGFua3MgZm9yIHlvdXIgcGF0aWVuY2UuCgpPbiBUdWUsIEFwciAy
MSwgMjAyNiBhdCAwMTo0MDowMFBNICswMDAwLCBMb3JlbnpvIFN0b2FrZXMgd3JvdGU6Cj4gSG0s
IGdpdmVuIHRoaXMgdG91Y2hlcyBhIGZhaXIgYml0IG9mIG1tLCBJIHdvbmRlciBpZiB3ZSBzaG91
bGRuJ3QgdHJ5IHRvIGRvIHRoaXMKPiB0aHJvdWdoIHRoZSBtbSB0cmVlPwoKT24gVHVlLCBBcHIg
MjEsIDIwMjYgYXQgMDQ6MzY6MDBQTSArMDAwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToK
PiBZZWFoLCB3aGVuIHRoZSB0aW1lIGNvbWVzLCB0aGUgbW0gcGllY2VzIGRlZmluaXRlbHkgbmVl
ZCB0byBnbyB0aHJvdWdoIHRoZSBtbQo+IHRyZWUuICBJZGVhbGx5LCBJIHRoaW5rIHRoaXMgd291
bGQgYmUgbWVyZ2VkIGluIHR3byBzZXBhcmF0ZSBwYXJ0cywgd2l0aCBhbGwgbW0KPiBjaGFuZ2Vz
IGdvaW5nIHRocm91Z2ggdGhlIG1tIHRyZWUsIGFuZCB0aGVuIHRoZSBLVk0gY2hhbmdlcyB0aHJv
dWdoIHRoZSBLVk0gdHJlZQo+IHVzaW5nIGEgc3RhYmxlIHRvcGljIGJyYW5jaC90YWcgZnJvbSBB
bmRyZXcuCgpUaGFua3MgZm9yIHRoZSBndWlkYW5jZS4gVGhlIHNwbGl0IG1ha2VzIHNlbnNlIHRv
IG1lOyBJJ20gcGxhbm5pbmcgdG8KZm9sbG93IHRoaXMgYXBwcm9hY2ggd2l0aCBwYXRjaGVzIDEt
NiAobW0pIGdvaW5nIHRocm91Z2ggdGhlIG1tIHRyZWUKYW5kIHBhdGNoZXMgNy0xNiAoS1ZNKSB0
aHJvdWdoIHRoZSBLVk0gdHJlZSBvbiB0b3Agb2YgYSBzdGFibGUKYnJhbmNoL3RhZyBmcm9tIG1t
LiBJJ2xsIGNvbmZpcm0gdGhlIGV4YWN0IGJvdW5kYXJ5IGFuZCBjb29yZGluYXRpb24KZGV0YWls
cyBhcyBJIHByZXBhcmUgdGhlIHJlcG9zdC4KCk9uIFR1ZSwgQXByIDIxLCAyMDI2IGF0IDAxOjQw
OjAwUE0gKzAwMDAsIExvcmVuem8gU3RvYWtlcyB3cm90ZToKPiBJbiBhbnkgY2FzZSwgd2UgZGVm
aW5pdGVseSBuZWVkIGEgcmViYXNlIG9uIHNvbWV0aGluZyBub3QtbmV4dCA6KSBpZiBub3QgbW0g
dGhlbgo+IExpbnVzJ3MgdHJlZSBhdCBsZWFzdCBtYXliZT8KPgo+IEknbSBzZWVpbmcgYSBsb3Qg
b2YgY29uZmxpY3RzIGFnYWluc3QgbW0tdW5zdGFibGUsIGl0IGNhbid0IGI0IHNoYXphbSBldmVu
IHBhdGNoCj4gMSBhbmQgaW4gTGludXMncyB0cmVlIGl0J3MgZmFpbGluZyBhdCBhbiBtbSBwYXRj
aCAobW06IGludHJvZHVjZQo+IEFTX05PX0RJUkVDVF9NQVApLgoKSSdsbCByZWJhc2Ugb250byB2
Ny4xLXJjMSBhbmQgcmVzb2x2ZSB0aGUgY29uZmxpY3RzIGFzIHBhcnQgb2YgdGhlIHNwbGl0LgoK
VGFrYWhpcm8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
