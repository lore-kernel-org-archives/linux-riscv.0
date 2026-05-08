Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AB6CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xACYzYB5KzTayRFI6Gf8A12OwABu82jTOxo0EcBxXcQ=; b=n4TOU3noT30/7A
	CIF/UE/N1Xe6bRuzkwpZ9yO9JdmEKha2AxgGcxDZKmKFv/bAtrwH6YbCMPq3OpzKROf557eq8rRTl
	s62A0NUVo1lxi4Xi/uVv3Eh06cv99MAwCJ3kGIwKFXPoLLaf9ci/KAOMVNxytynArdJcgTZc5Qlnm
	81LYfBTVJeu1/tKUNhES67uQxs+WD+ddsvzrnMDQZa/+8Tu7NtrX+GBQamdKONqOEp25Agw7qvAnf
	lcpyFfOBJjNm112ZVXO4xyixDuP7vnzfjfK6BTcI/MRt/XJcL48cQ5UL+a1rt4Q6ClfR5CkQdPQf4
	bQOw7gRcp/ee6YOrVExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGFq-00000003iWk-07vP;
	Wed, 13 May 2026 20:32:30 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGPy-00000005yKu-0DeD;
	Fri, 08 May 2026 08:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1778228322; x=1809764322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=he6DON9jfdhSLBt5e/vXn3CElWPL4k8qbH0NcK/2obw=;
  b=Q3svk8JQCv2yXSuuxa5vh0czRbMDIcYMa/PhinKBT2PmKAXhcMO/G9Bn
   M0UTAitGJLykdym7W21D5jDFyhtzheysmWAeZvgBd/7e3tqhth3/Wdau1
   ge9AQMGAPHto7o+0Tr4/XbuqaibjhF+gbo8UfNffTlNXGrnh+ZyuF5des
   YMvvyhp/KEApS6fzU6YAbRN0Fx7tCHzAc385ouqKWqF2KT+l5z8IXqE25
   ag5OMBLcy61d/az4Xm16BXhTCxz6X7+nVhoeOOxmAgWBhzfNHwkKyChVd
   mJdw2ljtaT7HAe01phX9qFo0yr042U/AhYUmewvcNK9LE/l/ytJbWYvq9
   Q==;
X-CSE-ConnectionGUID: T2XNpIqvShm0IOn66vQpwQ==
X-CSE-MsgGUID: K+8ujvsvQ+aWk2f8+1q5Sw==
X-IronPort-AV: E=Sophos;i="6.23,223,1770595200"; 
   d="scan'208";a="18948631"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 08:18:34 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:1235]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.77:2525] with esmtp (Farcaster)
 id 181a188e-b1e1-456f-b102-a9f2c8f54015; Fri, 8 May 2026 08:18:34 +0000 (UTC)
X-Farcaster-Flow-ID: 181a188e-b1e1-456f-b102-a9f2c8f54015
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 8 May 2026 08:18:31 +0000
Received: from dev-dsk-itazur-1b-11e7fc0f.eu-west-1.amazon.com (172.19.66.53)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 8 May 2026 08:18:18 +0000
From: Takahiro Itazuri <itazur@amazon.com>
To: <fvdl@google.com>, <seanjc@google.com>, <ljs@kernel.org>
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
	<yuzenghui@huawei.com>, <zhengqi.arch@bytedance.com>, <zulinx86@gmai.com>
Subject: Re: [PATCH v12 10/16] KVM: guest_memfd: Add flag to remove from direct map
Date: Fri, 8 May 2026 08:18:10 +0000
Message-ID: <20260508081812.12345-1-itazur@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAPTztWb67XZvfcMVnbegDNNW0LJa9UsaTGx3M898xJUJrekk0w@mail.gmail.com>
References: <CAPTztWb67XZvfcMVnbegDNNW0LJa9UsaTGx3M898xJUJrekk0w@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.66.53]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_011842_202064_8150B894 
X-CRM114-Status: GOOD (  35.01  )
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

SGkgU2VhbiwgRnJhbmssIExvcmVuem8sCgpPbiBUdWUsIEFwciAyMSwgMjAyNiBhdCAxMDowODo0
OEFNIC0wNzAwLCBGcmFuayB2YW4gZGVyIExpbmRlbiB3cm90ZToKPiBPbiBUdWUsIEFwciAyMSwg
MjAyNiBhdCA5OjMxIEFNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3
cm90ZToKPiA+IE1ha2luZyBndWVzdF9tZW1mZCByZXNwb25zaWJsZSBmb3IgemFwcGluZyBhbmQg
cmVzdG9yaW5nIHRoZSBkaXJlY3QgbWFwIG9uIGEgcGVyLQo+ID4gZm9saW8gYmFzaXMgZmVlbHMg
d3JvbmcgZ2l2ZW4gdGhlIGFkZGl0aW9uIG9mIEFTX05PX0RJUkVDVF9NQVAuICBJIGVzcGVjaWFs
bHkgZG9uJ3QKPiA+IGxpa2UgdGhhdCB0aGUgInJ1bGVzIiBmb3Igd2hlbiBhbiBBU19OT19ESVJF
Q1RfTUFQIGZvbGlvIGhhcyBhIGRpcmVjdCBtYXAgd2lsbCB2YXJ5Cj4gPiBiYXNlZCBvbiB0aGUg
b3duZXIsIGFuZCBldmVuIHdpdGhpbiBhbiBvd25lciAoZS5nLiBndWVzdF9tZW1mZCkgd2lsbCBi
ZSBhZCBob2MuCj4gPgo+ID4gRS5nLiBhcyBwZXIgdGhlIHNlcmllcyB0byBhZGQgZ3Vlc3RfbWVt
ZmQgd3JpdGUoKSBzdXBwb3J0WypdOgo+ID4KPiA+ICAgV2hlbiBkaXJlY3QgbWFwIHJlbW92YWwg
aXMgaW1wbGVtZW50ZWQgWzJdCj4gPiAgICAtIHdyaXRlKCkgd2lsbCBub3QgYmUgYWxsb3dlZCB0
byBhY2Nlc3MgcGFnZXMgdGhhdCBoYXZlIGFscmVhZHkKPiA+ICAgICAgYmVlbiByZW1vdmVkIGZy
b20gZGlyZWN0IG1hcAo+ID4gICAgLSBvbiBjb21wbGV0aW9uLCB3cml0ZSgpIHdpbGwgcmVtb3Zl
IHRoZSBwb3B1bGF0ZWQgcGFnZXMgZnJvbQo+ID4gICAgICBkaXJlY3QgbWFwCj4gPgo+ID4gVGhh
dCdzIHByZXR0eSBncm9zcyBBQkksIGJlY2F1c2Ugd2l0aCBLVk1fR01FTV9GT0xJT19OT19ESVJF
Q1RfTUFQLCB1c2Vyc3BhY2UgY2FuCj4gPiB3cml0ZSgpIGV4YWN0bHkgb25jZS4gIFRvIHJlLXdy
aXRlIG1lbW9yeSwgSSBhc3N1bWUgdXNlcnNwYWNlIHdvdWxkIG5lZWQgdG8gZG8gYQo+ID4gUFVO
Q0hfSE9MRSBvciB0cnVuY2F0ZS4KPiA+Cj4gPiBXaGF0J3MgcHJldmVudGluZyB1cyBmcm9tIGhh
bmRsaW5nIHRoaXMgYXV0b21hZ2ljYWxseSBpbiBlLmcuIGZpbGVtYXBfYWRkX2ZvbGlvKCkKPiA+
IGFuZCBmaWxlbWFwX3JlbW92ZV9mb2xpbygpPyAgVGhlbiB0aGUgdXNhZ2UgcnVsZXMgYXJlIHBy
ZXR0eSBzdHJhaWdodGZvcndhcmQ6IHRoZQo+ID4ga2VybmVsIG11c3QgKmFsd2F5cyogYXNzdW1l
IHRoZSBkaXJlY3QgbWFwIGlzIGludmFsaWQgZm9yIGZvbGlvcyBmcm9tCj4gPiBBU19OT19ESVJF
Q1RfTUFQIG1hcHBpbmdzLgo+ID4KPiA+IFRoZW4gaWYgS1ZNIG5lZWRzIHRvIHV0aWxpemUgYSBr
ZXJuZWwgbWFwcGluZywgZS5nLiBpbiBrdm1fZ21lbV9wb3B1bGF0ZSgpLCBLVk0KPiA+IGNvdWxk
IHVzZSBkZWRpY2F0ZWQgdmFyaWFudHMgb2Yga21hcF9sb2NhbF94eHgoKSB0byBkZWFsIHdpdGgg
YSBsb2NhbCBtYXBwaW5nIGZvcgo+ID4gYSBmb2xpby9wYWdlIHdpdGhvdXQgYSBkaXJlY3QgbWFw
LiAgT3IsIEtWTSBjb3VsZCBzaW1wbHkgZGlzYWxsb3cgdGhlIHNwZWNpZmljCj4gPiBzZXF1ZW5j
ZSB0aGF0IHdvdWxkIHJlcXVpcmUgS1ZNIHRvIGRvIHRoZSBtZW1jcHkgKEknbSBwcmV0dHkgc3Vy
ZSB3ZSBjYW4gZG8gdGhhdAo+ID4gd2l0aCBpbi1wbGFjZSBzaGFyZWQ9PnByaXZhdGUgY29udmVy
c2lvbiBzdXBwb3J0KS4KPiA+Cj4gPiBJIHJlYWxpemUgdGhhdCBjb3VsZCB0aHJvdyBhIGJpZyB3
cmVuY2ggaW50byB3cml0ZSgpIHBlcmZvcm1hbmNlLCBidXQgSU1PLCBiZWZvcmUKPiA+IG1lcmdp
bmcgZWl0aGVyIHNlcmllcywgd2UgbmVlZCBhIGNvbXBsZXRlIHN0b3J5IGZvciBleGFjdGx5IGhv
dyB0aGlzIHdpbGwgYWxsIGZpdAo+ID4gdG9nZXRoZXIsIGluIGEgbWFpbnRhaW5hYmxlIGZhc2hp
b24gYW5kIHdpdGggc2FuZSBBQkkuCj4KPiBJIGFncmVlIHdpdGggdGhpcyAtIHRoaXMgYXBwcm9h
Y2ggd291bGQgYWxzbyBhbGxvdyBmb3IgbWVtb3J5IHRoYXQgd2FzCj4gbmV2ZXIgaW4gdGhlIGRp
cmVjdCBtYXAgdG8gYmVnaW4gd2l0aCwgb3IgaGFzIGJlZW4gdGFrZW4gb3V0IGFscmVhZHkKPiAo
Zm9yIHdoaWNoIEkgaGFwcGVuIHRvIGhhdmUgYSB1c2UgY2FzZSA6LSkpLiBndWVzdF9tZW1mZCBh
bmQgb3RoZXIKPiBjb2RlIGNhbiB0aGVuIGFzc3VtZSB0aGF0IEFTX05PX0RJUkVDVF9NQVAgbWVh
bnMgdGhleSBoYXZlIHRvIHRha2UKPiBleHBsaWNpdCBhY3Rpb24gdG8gbWFwIGl0IGlmIG5lZWRl
ZC4gSXQncyBhIGNsZWFuLCBzaW1wbGUgQUJJLgo+Cj4gV2l0aCB0aGUgY3VycmVudCBzZXQgb2Yg
cGF0Y2hlcywgaXQgc2VlbXMgbGlrZSB0aGlzIGNvdWxkbid0IGJlIGRvbmUKPiBpbiBhIGNsZWFu
IG1hbm5lci4KCkFncmVlZCB3aXRoIGJvdGggb2YgeW91LiAgSSdsbCBhZG9wdCB0aGUgZmlsZW1h
cC1sZXZlbCBhcHByb2FjaDoKCi0gTW92ZSB0aGUgemFwL3Jlc3RvcmUgaG9va3MgZnJvbSBndWVz
dF9tZW1mZCBpbnRvIGZpbGVtYXBfYWRkX2ZvbGlvKCkKICAvIGZpbGVtYXBfcmVtb3ZlX2ZvbGlv
KCkuCi0gVGlnaHRlbiBBU19OT19ESVJFQ1RfTUFQIHNlbWFudGljcyBzbyB0aGF0LCBmb3IgZm9s
aW9zIGluIHN1Y2ggYQogIG1hcHBpbmcsIHRoZSBkaXJlY3QgbWFwIGlzIGludmFsaWQgZm9yIHRo
ZSBlbnRpcmUgdGltZSB0aGUgZm9saW8KICByZXNpZGVzIGluIHRoZSBwYWdlIGNhY2hlLgotIERy
b3AgdGhlIHBlci1mb2xpbyBLVk1fR01FTV9GT0xJT19OT19ESVJFQ1RfTUFQIGJvb2trZWVwaW5n
IGluCiAgZm9saW8tPnByaXZhdGUsIHNpbmNlIHRoZSBleGlzdGVuY2Ugb2YgdGhlIGZvbGlvIGlu
IHRoZSBtYXBwaW5nIGlzCiAgaXRzZWxmIHRoZSBzdGF0ZS4KCk9uIGVhY2ggZ3Vlc3QgbWVtb3J5
IHBvcHVsYXRpb24gcGF0aCwKCi0gbWVtY3B5LWJhc2VkIHBvcHVsYXRpb24gZnJvbSB1c2Vyc3Bh
Y2UgZ29lcyB0aHJvdWdoIHRoZSB1c2Vyc3BhY2UKICBtYXBwaW5nIG9mIGd1ZXN0X21lbWZkLCBu
b3QgdGhyb3VnaCB0aGUga2VybmVsIGRpcmVjdCBtYXAsIHNvIHRoZQogIGZpbGVtYXAtbGV2ZWwg
aW52YXJpYW50IGRvZXNuJ3QgYWZmZWN0IGl0LiAgQnV0IHRoaXMgaXMgc2xvdywgd2hpY2gKICBp
cyB3aGF0IG1vdGl2YXRlZCB0aGUgd3JpdGUoKSBzeXNjYWxsIHN1cHBvcnQuCgotIHdyaXRlKCk6
IG1lYW50IHRvIHNwZWVkIHVwIHRoZSB1c2Vyc3BhY2UtbWVtY3B5IGNhc2UgYWJvdmUgYnkgZG9p
bmcKICB0aGUgY29weSBpbiB0aGUga2VybmVsLiAgSSBiZWxpZXZlIEJyZW5kYW4ncyBfX0dGUF9V
Tk1BUFBFRC9tZXJtYXAKICB3b3JrIFsxXSB3b3VsZCBnaXZlIHVzIGEgbG93LW92ZXJoZWFkIHdh
eSB0byBnZXQgdGVtcG9yYXJ5IGtlcm5lbAogIGFjY2VzcyB0byBhbiBBU19OT19ESVJFQ1RfTUFQ
LiAgTGFuZGluZyBtZXJtYXAgbWF5IHRha2UgYSB3aGlsZSwgYnV0CiAgdGhpcyBzZXJpZXMgZG9l
cyBub3QgaW50cm9kdWNlIHRoZSB3cml0ZSgpIHBhdGgsIHNvIG1lcm1hcCBpcyBub3QgYQogIGJs
b2NrZXIgZm9yIG5vdy4KCi0ga3ZtX2dtZW1fcG9wdWxhdGUoKTogdGhpcyBpcyBhIFREWC9TTlAt
b25seSBwYXRoLCBhbmQgTk9fRElSRUNUX01BUAogIGlzIG5vdCBhdmFpbGFibGUgb24gdGhvc2Ug
Vk0gdHlwZXMg4oCUCiAga3ZtX2FyY2hfZ21lbV9zdXBwb3J0c19ub19kaXJlY3RfbWFwKCkgcmV0
dXJucyBmYWxzZSBmb3IKICBLVk1fWDg2X1REWF9WTSBhbmQgS1ZNX1g4Nl9TTlBfVk0sIHdoaWNo
IGFyZSBpdHMgb25seSBjYWxsZXJzCiAgdG9kYXkuICBTbyBpdCBkb2Vzbid0IGludGVyYWN0IHdp
dGggdGhlIGZpbGVtYXAgaW52YXJpYW50IElJVUMuCgpTbywgdW5sZXNzIEknbSBtaXNzaW5nIGFu
eSBwYXRoLCBhZG9wdGluZyB0aGUgZmlsZW1hcC1sZXZlbCBhcHByb2FjaCBpbgp0aGlzIHNlcmll
cyBzaG91bGQgYmUgZmluZS4KCgpJJ2QgbGlrZSB0byBjb25zdWx0IHdpdGggeW91IGZvbGtzIG9u
IGhvdyB0byBwcm9jZWVkIGluIGFkdmFuY2UuICBJbiBhCnNlcGFyYXRlIHJlcGx5IG9uIHRoZSBj
b3ZlciBsZXR0ZXIgdGhyZWFkIFsyXSwgTG9yZW56byBhbmQgU2VhbgpzdWdnZXN0ZWQgdGhhdCB0
aGUgbW0gcGllY2VzIHNob3VsZCBnbyB0aHJvdWdoIHRoZSBtbSBzdWJzeXN0ZW06CgpPbiBUdWUs
IEFwciAyMSwgMjAyNiBhdCAwNDozNjowMFBNICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOgo+IFllYWgsIHdoZW4gdGhlIHRpbWUgY29tZXMsIHRoZSBtbSBwaWVjZXMgZGVmaW5pdGVs
eSBuZWVkIHRvIGdvIHRocm91Z2ggdGhlIG1tCj4gdHJlZS4gIElkZWFsbHksIEkgdGhpbmsgdGhp
cyB3b3VsZCBiZSBtZXJnZWQgaW4gdHdvIHNlcGFyYXRlIHBhcnRzLCB3aXRoIGFsbCBtbQo+IGNo
YW5nZXMgZ29pbmcgdGhyb3VnaCB0aGUgbW0gdHJlZSwgYW5kIHRoZW4gdGhlIEtWTSBjaGFuZ2Vz
IHRocm91Z2ggdGhlIEtWTSB0cmVlCj4gdXNpbmcgYSBzdGFibGUgdG9waWMgYnJhbmNoL3RhZyBm
cm9tIEFuZHJldy4KCkkgc2VlIHR3byByZWFzb25hYmxlIHBhdGhzIHRvIGdldCB0aGVyZSwgYW5k
IHdvdWxkIGFwcHJlY2lhdGUgeW91cgppbnB1dCBvbiB3aGljaCB5b3UgcHJlZmVyOgoKUGF0aCBB
IOKAlCB2YWxpZGF0ZSBvbiBLVk0gc2lkZSBmaXJzdCwgdGhlbiBzcGxpdDoKICAtIFBvc3QgdjEz
IGFzIGEgc2luZ2xlIHNlcmllcyBvbiB0aGUgS1ZNIGxpc3QsIGdhdGhlciBmZWVkYmFjayBhbmQK
ICAgIG1ha2Ugc3VyZSB0aGUgZGVzaWduIGlzIGFjY2VwdGFibGUgdG8gS1ZNIHJldmlld2Vycy4K
ICAtIE9uY2UgdjEzIGxvb2tzIGdvb2QgKCJ0aGUgdGltZSBjb21lcyIpLCBkbyB0aGUgTU0vS1ZN
IHNwbGl0LAogICAgcmViYXNlIHRoZSBNTSBwYXJ0IG9udG8gdGhlIGFwcHJvcHJpYXRlIE1NIGJy
YW5jaCwgYW5kIHBvc3QgdGhlCiAgICBNTSBwYXJ0IHRvIGxpbnV4LW1tIHRvIGJ1aWxkIGNvbnNl
bnN1cyB3aXRoIE1NIG1haW50YWluZXJzLgoKUGF0aCBCIOKAlCBzcGxpdCBlYXJseSBhbmQgc2Vl
ayBNTSBjb25zZW5zdXMgaW4gcGFyYWxsZWw6CiAgLSBXaXRoIHRoZSBmaWxlbWFwIHJld29yayBh
bHJlYWR5IGluIHBsYWNlLCBkbyB0aGUgTU0vS1ZNIHNwbGl0CiAgICBub3cgYW5kIHBvc3QgdGhl
IE1NIHBhcnQgdG8gbGludXgtbW0gZGlyZWN0bHkuICBUaGUgS1ZNIHBhcnQgZm9sbG93cwogICAg
b24gdG9wIG9mIGEgc3RhYmxlIHRvcGljIGZyb20gTU0uCgpXaGljaCBvZiB0aGUgdHdvIHdvdWxk
IHlvdSByYXRoZXIgc2VlPyAgSGFwcHkgdG8gZ28gZWl0aGVyIHdheS4KCgpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMzIwLXBhZ2VfYWxsb2MtdW5tYXBwZWQtdjItMC0yOGJm
MWJkNTRmNDFAZ29vZ2xlLmNvbS8KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MDUwNjA4MDc1My4xNDUxNy0xLWl0YXp1ckBhbWF6b24uY29tLwoKVGFrYWhpcm8KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
