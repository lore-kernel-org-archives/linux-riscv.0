Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A66FCC9AD
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 00:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/O/yV9Wz9796LungCzsuuUKSHIuMGRTuLMIIFu2nBFU=; b=arENC+mmtNpbDR
	ZQcEnxIqUvRS0MHVVnYVDoK9GI3yidIlsDFWxxEvH139OAQHPjeCrDNmp3PXvEbm+SCGzww+nhFrO
	limH69ypd42GOXQs/lg/UG7I/2WM3Ei8WvuB8jqdMMvxusIVoXSu4qzthFiIW0oIwdS/wiCiO6+p7
	8MR2+eSAh15kkH3AGDKM636BGoJAdDUpza2UQzSrohIZIBnX8RWWDObX3YnFZlfy9r3JLfjADRgQe
	9FGKdjtF9J729RHPk5oN57HrrbQNTV/2e81zmDho8rxeZmpshkwHcevNg8rTrnMQ2MeRbkGtoOelV
	nkDiAoJXEm7DiT58vx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkWZ-00000008KYx-0uIe;
	Tue, 10 Mar 2026 00:00:35 +0000
Received: from fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.74.81.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWUH-00000003yHu-2okD;
	Fri, 06 Mar 2026 14:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772808549; x=1804344549;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=Jal/VdxlygY/Jp/VACbX2II5K9b9pb+hAy31tgKOGlo=;
  b=fonT5YtOX03ZXWHcN5zVbmcTqGzvDBPFtKyD9oVxn8RvqIo+6W8KzN5R
   9vvl43mlh6cZ4bPho1Zdb+HCmdaXwMGnG8u1M2qgORzPY2hPAc/S/vW7z
   OifqJSPO2E2ub3KDB9nvRrFtTzlee00Bvxt1UB6cxnCEHrx8HsimtRb5w
   DdHcZp939e9AuA3ROqJLjiMlfmgiJIDZY7QPbtpRwrKMNp5aE+AD3lfsH
   1SZKSI3PVf8MhquUgkCKxGZ0eHGzNh3rrmq9bdru7V7/mwH/4YsAU5qCx
   S7MNCAxoxfk2vH5dT+MqxXwdt4ekkcjmjT9j4CSxCJY+OuO6PAYTgEWeW
   A==;
X-CSE-ConnectionGUID: ljHSVQB7TzG5jw32RYNa5w==
X-CSE-MsgGUID: OUQPopD9QXKeR6PpigJL3Q==
X-IronPort-AV: E=Sophos;i="6.23,105,1770595200"; 
   d="scan'208";a="10442482"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 14:49:04 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:10240]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.46.96:2525] with esmtp (Farcaster)
 id 785449e4-4a3c-45cd-8b65-b1aa1ddf183f; Fri, 6 Mar 2026 14:49:04 +0000 (UTC)
X-Farcaster-Flow-ID: 785449e4-4a3c-45cd-8b65-b1aa1ddf183f
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 6 Mar 2026 14:49:04 +0000
Received: from [192.168.2.180] (10.106.83.26) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Fri, 6 Mar 2026
 14:48:58 +0000
Message-ID: <38deb26a-918c-4743-b35f-92a1330dbf40@amazon.com>
Date: Fri, 6 Mar 2026 14:48:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/15] set_memory: add folio_{zap, restore}_direct_map
 helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Kalyazin, Nikita"
	<kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org"
	<oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com"
	<yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org"
	<willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>,
	"mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org"
	<andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>,
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org"
	<kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>,
	"haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org"
	<jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com"
	<jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>,
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>,
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com"
	<jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>,
	"kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"prsampat@amd.com" <prsampat@amd.com>, "mlevitsk@redhat.com"
	<mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>,
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com"
	<agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com"
	<gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com"
	<thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com"
	<urezki@gmail.com>, "zhengqi.arch@bytedance.com"
	<zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com"
	<gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com"
	<jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org"
	<pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>,
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com"
	<jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco"
	<xmarcalx@amazon.co.uk>
References: <20260126164445.11867-1-kalyazin@amazon.com>
 <20260126164445.11867-3-kalyazin@amazon.com>
 <af2d4dcd-60a8-4a5a-b508-d9600b1f2275@kernel.org>
 <e2834fd9-e4ec-473c-90cd-6c3a5049747f@amazon.com>
 <40bd6f9b-d5c0-4844-81bc-d221cd9b058f@kernel.org>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
In-Reply-To: <40bd6f9b-d5c0-4844-81bc-d221cd9b058f@kernel.org>
X-Originating-IP: [10.106.83.26]
X-ClientProxiedBy: EX19D005EUB004.ant.amazon.com (10.252.51.126) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_064910_010505_7F70639E 
X-CRM114-Status: GOOD (  22.95  )
X-Mailman-Approved-At: Mon, 09 Mar 2026 17:00:27 -0700
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
Reply-To: kalyazin@amazon.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAwNi8wMy8yMDI2IDE0OjE3LCBEYXZpZCBIaWxkZW5icmFuZCAoQXJtKSB3cm90ZToKPiBP
biAzLzYvMjYgMTM6NDgsIE5pa2l0YSBLYWx5YXppbiB3cm90ZToKPj4KPj4KPj4gT24gMDUvMDMv
MjAyNiAxNzozNCwgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6Cj4+PiBPbiAxLzI2LzI2
IDE3OjQ3LCBLYWx5YXppbiwgTmlraXRhIHdyb3RlOgo+Pj4+IEZyb206IE5pa2l0YSBLYWx5YXpp
biA8a2FseWF6aW5AYW1hem9uLmNvbT4KPj4+Pgo+Pj4+IFRoZXNlIGFsbG93IGd1ZXN0X21lbWZk
IHRvIHJlbW92ZSBpdHMgbWVtb3J5IGZyb20gdGhlIGRpcmVjdCBtYXAuCj4+Pj4gT25seSBpbXBs
ZW1lbnQgdGhlbSBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGhhdmUgZGlyZWN0IG1hcC4KPj4+PiBJ
biBmb2xpb196YXBfZGlyZWN0X21hcCgpLCBmbHVzaCBUTEIgb24gYXJjaGl0ZWN0dXJlcyB3aGVy
ZQo+Pj4+IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goKSBkb2VzIG5vdCBmbHVzaCBpdCBp
bnRlcm5hbGx5Lgo+Pj4KPj4+ICJMZXQncyBwcm92aWRlIGZvbGlvX3t6YXAscmVzdG9yZX1fZGly
ZWN0X21hcCBoZWxwZXJzIGFzIHByZXBhcmF0aW9uIGZvcgo+Pj4gc3VwcG9ydGluZyByZW1vdmFs
IG9mIHRoZSBkaXJlY3QgbWFwIGZvciBndWVzdF9tZW1mZCBmb2xpb3MuIC4uLgo+Pgo+PiBXaWxs
IHVwZGF0ZSwgdGhhbmtzLgo+Pgo+Pj4KPj4+Pgo+Pj4+IFRoZSBuZXcgaGVscGVycyBuZWVkIHRv
IGJlIGFjY2Vzc2libGUgdG8gS1ZNIG9uIGFyY2hpdGVjdHVyZXMgdGhhdAo+Pj4+IHN1cHBvcnQg
Z3Vlc3RfbWVtZmQgKHg4NiBhbmQgYXJtNjQpLiAgU2luY2UgYXJtNjQgZG9lcyBub3Qgc3VwcG9y
dAo+Pj4+IGJ1aWxkaW5nIEtWTSBhcyBhIG1vZHVsZSwgb25seSBleHBvcnQgdGhlbSBvbiB4ODYu
Cj4+Pj4KPj4+PiBEaXJlY3QgbWFwIHJlbW92YWwgZ2l2ZXMgZ3Vlc3RfbWVtZmQgdGhlIHNhbWUg
cHJvdGVjdGlvbiB0aGF0Cj4+Pj4gbWVtZmRfc2VjcmV0IGRvZXMsIHN1Y2ggYXMgaGFyZGVuaW5n
IGFnYWluc3QgU3BlY3RyZS1saWtlIGF0dGFja3MKPj4+PiB0aHJvdWdoIGluLWtlcm5lbCBnYWRn
ZXRzLgo+Pj4KPj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGNvbnZlcnQgbW0vc2VjcmV0bWVt
LmMgYXMgd2VsbD8KPj4+Cj4+PiBUaGVyZSwgd2UgdXNlCj4+Pgo+Pj4gICAgICAgICAgIHNldF9k
aXJlY3RfbWFwX2ludmFsaWRfbm9mbHVzaChmb2xpb19wYWdlKGZvbGlvLCAwKSk7Cj4+Pgo+Pj4g
YW5kCj4+Pgo+Pj4gICAgICAgICAgIHNldF9kaXJlY3RfbWFwX2RlZmF1bHRfbm9mbHVzaChmb2xp
b19wYWdlKGZvbGlvLCAwKSk7Cj4+Pgo+Pj4gV2hpY2ggaXMgYSBiaXQgZGlmZmVyZW50IHRvIGJl
bG93IGNvZGUuIEF0IGxlYXN0IGxvb2tpbmcgYXQgdGhlIHg4Ngo+Pj4gdmFyaWFudHMsIEkgd29u
ZGVyIHdoeSB3ZSBkb24ndCBzaW1wbHkgdXNlCj4+PiBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2Zs
dXNoKCkuCj4+Pgo+Pj4KPj4+IElmIHNvLCBjYW4geW91IGFkZCBhIHBhdGNoIHRvIGRvIHRoZSBj
b252ZXJzaW9uLCBwbGVlZWVhc3NzZSA/IDopCj4+Cj4+IEFic29sdXRlbHkhCj4+Cj4+Pgo+Pj4+
Cj4+Pj4gUmV2aWV3ZWQtYnk6IEFja2VybGV5IFRuZyA8YWNrZXJsZXl0bmdAZ29vZ2xlLmNvbT4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWtpdGEgS2FseWF6aW4gPGthbHlhemluQGFtYXpvbi5jb20+
Cj4+Pj4gLS0tCj4+Pj4gICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmggICAg
IHzCoCAyICsrCj4+Pj4gICAgYXJjaC9hcm02NC9tbS9wYWdlYXR0ci5jICAgICAgICAgICAgICAg
IHwgMTIgKysrKysrKysrKysrCj4+Pj4gICAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc2V0
X21lbW9yeS5oIHzCoCAyICsrCj4+Pj4gICAgYXJjaC9sb29uZ2FyY2gvbW0vcGFnZWF0dHIuYyAg
ICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4+Pj4gICAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zZXRfbWVtb3J5LmggICAgIHzCoCAyICsrCj4+Pj4gICAgYXJjaC9yaXNjdi9tbS9wYWdlYXR0
ci5jICAgICAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4+Pj4gICAgYXJjaC9zMzkwL2lu
Y2x1ZGUvYXNtL3NldF9tZW1vcnkuaCAgICAgIHzCoCAyICsrCj4+Pj4gICAgYXJjaC9zMzkwL21t
L3BhZ2VhdHRyLmMgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4+Pj4gICAgYXJj
aC94ODYvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oICAgICAgIHzCoCAyICsrCj4+Pj4gICAgYXJj
aC94ODYvbW0vcGF0L3NldF9tZW1vcnkuYyAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysr
KysrKysKPj4+PiAgICBpbmNsdWRlL2xpbnV4L3NldF9tZW1vcnkuaCAgICAgICAgICAgICAgfCAx
MCArKysrKysrKysrCj4+Pj4gICAgMTEgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5o
IGIvYXJjaC9hcm02NC8KPj4+PiBpbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPj4+PiBpbmRleCBj
NzFhMmE2ODEyYzQuLjQ5ZmQ1NGYzYzI2NSAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3NldF9tZW1vcnkuaAo+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
c2V0X21lbW9yeS5oCj4+Pj4gQEAgLTE1LDYgKzE1LDggQEAgaW50IHNldF9kaXJlY3RfbWFwX2lu
dmFsaWRfbm9mbHVzaChjb25zdCB2b2lkICphZGRyKTsKPj4+PiAgICBpbnQgc2V0X2RpcmVjdF9t
YXBfZGVmYXVsdF9ub2ZsdXNoKGNvbnN0IHZvaWQgKmFkZHIpOwo+Pj4+ICAgIGludCBzZXRfZGly
ZWN0X21hcF92YWxpZF9ub2ZsdXNoKGNvbnN0IHZvaWQgKmFkZHIsIHVuc2lnbmVkIGxvbmcKPj4+
PiBudW1wYWdlcywKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHZh
bGlkKTsKPj4+PiAraW50IGZvbGlvX3phcF9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8p
Owo+Pj4+ICtpbnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8p
Owo+Pj4+ICAgIGJvb2wga2VybmVsX3BhZ2VfcHJlc2VudChzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4+
Pj4KPj4+PiAgICBpbnQgc2V0X21lbW9yeV9lbmNyeXB0ZWQodW5zaWduZWQgbG9uZyBhZGRyLCBp
bnQgbnVtcGFnZXMpOwo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL3BhZ2VhdHRyLmMg
Yi9hcmNoL2FybTY0L21tL3BhZ2VhdHRyLmMKPj4+PiBpbmRleCBlMmJkYzNjMWY5OTIuLjBiODhi
MDM0NDQ5OSAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL2FybTY0L21tL3BhZ2VhdHRyLmMKPj4+PiAr
KysgYi9hcmNoL2FybTY0L21tL3BhZ2VhdHRyLmMKPj4+PiBAQCAtMzU2LDYgKzM1NiwxOCBAQCBp
bnQgc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaChjb25zdCB2b2lkCj4+Pj4gKmFkZHIsIHVu
c2lnbmVkIGxvbmcgbnVtcGFnZXMsCj4+Pj4gICAgICAgICByZXR1cm4gc2V0X21lbW9yeV92YWxp
ZCgodW5zaWduZWQgbG9uZylhZGRyLCBudW1wYWdlcywgdmFsaWQpOwo+Pj4+ICAgIH0KPj4+Pgo+
Pj4+ICtpbnQgZm9saW9femFwX2RpcmVjdF9tYXAoc3RydWN0IGZvbGlvICpmb2xpbykKPj4+PiAr
ewo+Pj4+ICsgICAgIHJldHVybiBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlvX2Fk
ZHJlc3MoZm9saW8pLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZvbGlvX25yX3BhZ2VzKGZvbGlvKSwgZmFsc2UpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtp
bnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pCj4+Pj4gK3sK
Pj4+PiArICAgICByZXR1cm4gc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaChmb2xpb19hZGRy
ZXNzKGZvbGlvKSwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmb2xpb19ucl9wYWdlcyhmb2xpbyksIHRydWUpOwo+Pj4+ICt9Cj4+Pgo+Pj4gSXMgdGhlcmUg
YSBnb29kIHJlYXNvbiB3aHkgd2UgY2Fubm90IGhhdmUgdHdvIGdlbmVyaWMgaW5saW5lIGZ1bmN0
aW9ucwo+Pj4gdGhhdCBzaW1wbHkgY2FsbCBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKCkg
Pwo+Pj4KPj4+IElzIGl0IGJlY2F1c2Ugb2Ygc29tZSBmbHVzaGluZyBiZWhhdmlvcj8gKHdoaWNo
IHdlIGNvdWxkIGZpZ3VyZSBvdXQpCj4+Cj4+IFllcywgb24geDg2IHdlIG5lZWQgYW4gZXhwbGlj
aXQgZmx1c2guICBPdGhlciBhcmNoaXRlY3R1cmVzIGRlYWwgd2l0aCBpdAo+PiBpbnRlcm5hbGx5
Lgo+IAo+IFNvLCB3ZSBjYWxsIGEgX25vZmx1c2ggZnVuY3Rpb24gYW5kIGl0IHBlcmZvcm1zIGEg
Li4uIGZsdXNoLiBXaGF0LgoKWWVhaCwgdGhhdCdzIHVuZm9ydHVuYXRlbHkgdGhlIHN0YXR1cyBx
dW8gYXMgcG9pbnRlZCBieSBBbmVlc2ggWzFdCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
a3ZtL3lxNWFqejA3Y3p2ei5mc2ZAa2VybmVsLm9yZy8KCj4gCj4gVGFrZSBhIGxvb2sgYXQgc2Vj
cmV0bWVtX2ZhdWx0KCksIHdoZXJlIHdlIGRvIGFuIHVuY29uZGl0aW9uYWwKPiBmbHVzaF90bGJf
a2VybmVsX3JhbmdlKCkuCj4gCj4gRG8gd2UgZW5kIHVwIGRvdWJsZS1mbHVzaGluZyBpbiB0aGF0
IGNhc2U/CgpZZXMsIGxvb2tzIGxpa2UgdGhhdC4gIEknbGwgcmVtb3ZlIHRoZSBleHBsaWNpdCBm
bHVzaCBhbmQgcmVseSBvbiAKZm9saW9femFwX2RpcmVjdF9tYXAoKS4KCj4gCj4+IERvIHlvdSBw
cm9wb3NlIGEgYmVzcG9rZSBpbXBsZW1lbnRhdGlvbiBmb3IgeDg2IGFuZCBhCj4+ICJnZW5lcmlj
IiBvbmUgZm9yIG90aGVycz8KPiAKPiBXZSBoYXZlIHRvIGZpbmQgYSB3YXkgdG8gaGF2ZSBhIHNp
bmdsZSBzZXQgb2YgZnVuY3Rpb25zIGZvciBhbGwgYXJjaHMKPiB0aGF0IHN1cHBvcnQgZGlyZWN0
bWFwIHJlbW92YWwuCgpJIGJlbGlldmUgRGF2ZSBtZWFudCB0byBhZGRyZXNzIHRoYXQgd2l0aCAK
Zm9saW9fe3phcCxyZXN0b3JlfV9kaXJlY3RfbWFwKCkgWzJdLgoKWzJdIApodHRwczovL2xvcmUu
a2VybmVsLm9yZy9rdm0vOTQwOTUzMWItNTg5Yi00YTU0LWIxMjItMDZhM2NmMDg0NmYzQGludGVs
LmNvbS8KCj4gCj4gT25lIG9wdGlvbiBtaWdodCBiZSB0byBoYXZlIHNvbWUgaW5kaWNhdGlvbiBm
cm9tIHRoZSBhcmNoaXRlY3R1cmUgdGhhdAo+IG5vIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UoKSBp
cyByZXF1aXJlZC4KPiAKPiBDb3VsZCBiZSBhIGNvbmZpZyBvcHRpb24gb3Igc29tZSBzaW1wbGUg
aGVscGVyIGZ1bmN0aW9uLgoKSSdkIGJlIGluY2xpbmVkIHRvIGtub3cgd2hhdCBhcmNoIG1haW50
YWluZXJzIHRoaW5rIGJlY2F1c2UgSSBkb24ndCBoYXZlIAphIHN0cm9uZyBvcGluaW9uIG9uIHRo
YXQuCgo+IAo+IC0tCj4gQ2hlZXJzLAo+IAo+IERhdmlkCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
