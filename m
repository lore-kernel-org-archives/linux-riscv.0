Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C412C43327
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvG27sDR5xf7B+fXpA+sd8RIyySlSBVJaG8xCQZcH5A=; b=Lo0ApOGwMhFfVl
	TyXQ1Que3djZu+lTY57SSQpNbamLLa+3tEmHH6RB1vvEp6ZTYKQoekSqiGrNT491z8PPIn/O8FtHl
	8/Pcp/QjQQRyHFSN8/Zt4A0RZ0orW4hCYhFh5H4SN8/WDRM2HrToB1zaeU8q6GFWYQ5MMCkSAH/QF
	M+oGtJwdiAI4FYMvj4Q3f6SQwMJBPLxb7dakpxoV49VxNpCmkbfKyuwyCByxjQ8lZXrZfFHREzVXo
	cvEGzi0nlZW9cD7jwV9yWrtbEx/OthIjH8bWGZyeN5Gwd03stpMkRLT6PUrAutxT1160u0q/iqFTs
	0Y8maZc90Cqo/sLoYCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8Ua-0000000BYDa-2CCH;
	Fri, 26 Jun 2026 15:29:20 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8UX-0000000BYCA-2Yr7
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 15:29:19 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782487742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9yV2d4U6Iq5tvwMQAZTQglaDvuPvKN3XGu5+n1GLLQ=;
	b=wIhePOhyn6G6N5ff0edE/tWPIL0KMu4yLFZwEwWoqZZHrBK6tCDf3vdBAO8t9df+oI6kuQ
	xLnpFgOEs4zA46/+kNEFwdQe2/mKKSiElfQZLqTo8viWrcXcy9xwbuopsxn4/7w4KV94aW
	uCiQ2fhh93vV19Hi8UBA0NS234VnMPI=
Date: Fri, 26 Jun 2026 15:28:43 +0000
Message-Id: <DJJ35VLH2PE5.DFD8OYXEOH97@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Brendan Jackman" <brendan.jackman@linux.dev>
To: "Takahiro Itazuri" <itazur@amazon.com>, <seanjc@google.com>,
 <ljs@kernel.org>
Cc: <Liam.Howlett@oracle.com>, <ackerleytng@google.com>,
 <agordeev@linux.ibm.com>, <ajones@ventanamicro.com>,
 <akpm@linux-foundation.org>, <alex@ghiti.fr>, <andrii@kernel.org>,
 <aou@eecs.berkeley.edu>, <ast@kernel.org>, <baolu.lu@linux.intel.com>,
 <catalin.marinas@arm.com>, <chenhuacai@kernel.org>, <corbet@lwn.net>,
 <coxu@redhat.com>, <daniel@iogearbox.net>, <dave.hansen@linux.intel.com>,
 <david@kernel.org>, <dev.jain@arm.com>, <itazur@amazon.co.uk>,
 <jackmanb@google.com>, <jannh@google.com>, <jhubbard@nvidia.com>,
 <jmattson@google.com>, <joey.gouly@arm.com>, <john.fastabend@gmail.com>,
 <jolsa@kernel.org>, <jthoughton@google.com>, <kas@kernel.org>,
 <kernel@xen0n.name>, <kpsingh@kernel.org>, <kvm@vger.kernel.org>,
 <kvmarm@lists.linux.dev>, <lenb@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <loongarch@lists.linux.dev>,
 <lorenzo.stoakes@oracle.com>, <luto@kernel.org>, <maobibo@loongson.cn>,
 <martin.lau@linux.dev>, <maz@kernel.org>, <mhocko@suse.com>,
 <mingo@redhat.com>, <mlevitsk@redhat.com>, <nikita.kalyazin@linux.dev>,
 <oupton@kernel.org>, <palmer@dabbelt.com>, <patrick.roy@linux.dev>,
 <pavel@kernel.org>, <pbonzini@redhat.com>, <peterx@redhat.com>,
 <peterz@infradead.org>, <pfalcato@suse.de>, <pjw@kernel.org>,
 <prsampat@amd.com>, <rafael@kernel.org>, <riel@surriel.com>,
 <rppt@kernel.org>, <ryan.roberts@arm.com>, <sdf@fomichev.me>,
 <shijie@os.amperecomputing.com>, <skhan@linuxfoundation.org>,
 <song@kernel.org>, <surenb@google.com>, <suzuki.poulose@arm.com>,
 <svens@linux.ibm.com>, <tabba@google.com>, <tglx@kernel.org>,
 <thuth@redhat.com>, <urezki@gmail.com>, <vannapurve@google.com>,
 <vbabka@kernel.org>, <will@kernel.org>, <willy@infradead.org>,
 <wu.fei9@sanechips.com.cn>, <x86@kernel.org>,
 <yang@os.amperecomputing.com>, <yangyicong@hisilicon.com>,
 <yonghong.song@linux.dev>, <yosry@kernel.org>, <yu-cheng.yu@intel.com>,
 <yuzenghui@huawei.com>, <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v12 00/16] Direct Map Removal Support for guest_memfd
References: <aeennZlV60k81OBf@google.com>
 <20260506080753.14517-1-itazur@amazon.com>
In-Reply-To: <20260506080753.14517-1-itazur@amazon.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_082917_807901_E8B31046 
X-CRM114-Status: GOOD (  15.51  )
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

T24gV2VkIE1heSA2LCAyMDI2IGF0IDg6MDcgQU0gVVRDLCBUYWthaGlybyBJdGF6dXJpIHdyb3Rl
Ogo+IEhpIExvcmVuem8gYW5kIFNlYW4sCj4KPiBBcG9sb2dpZXMgZm9yIHRoZSBkZWxheWVkIHJl
cGx5IOKAlCBOaWtpdGEgaXMgbGVhdmluZyBBbWF6b24sIGFuZCBJJ20KPiB0YWtpbmcgb3ZlciB0
aGlzIHNlcmllcyBnb2luZyBmb3J3YXJkLiBUaGFua3MgZm9yIHlvdXIgcGF0aWVuY2UuCj4KPiBP
biBUdWUsIEFwciAyMSwgMjAyNiBhdCAwMTo0MDowMFBNICswMDAwLCBMb3JlbnpvIFN0b2FrZXMg
d3JvdGU6Cj4+IEhtLCBnaXZlbiB0aGlzIHRvdWNoZXMgYSBmYWlyIGJpdCBvZiBtbSwgSSB3b25k
ZXIgaWYgd2Ugc2hvdWxkbid0IHRyeSB0byBkbyB0aGlzCj4+IHRocm91Z2ggdGhlIG1tIHRyZWU/
Cj4KPiBPbiBUdWUsIEFwciAyMSwgMjAyNiBhdCAwNDozNjowMFBNICswMDAwLCBTZWFuIENocmlz
dG9waGVyc29uIHdyb3RlOgo+PiBZZWFoLCB3aGVuIHRoZSB0aW1lIGNvbWVzLCB0aGUgbW0gcGll
Y2VzIGRlZmluaXRlbHkgbmVlZCB0byBnbyB0aHJvdWdoIHRoZSBtbQo+PiB0cmVlLiAgSWRlYWxs
eSwgSSB0aGluayB0aGlzIHdvdWxkIGJlIG1lcmdlZCBpbiB0d28gc2VwYXJhdGUgcGFydHMsIHdp
dGggYWxsIG1tCj4+IGNoYW5nZXMgZ29pbmcgdGhyb3VnaCB0aGUgbW0gdHJlZSwgYW5kIHRoZW4g
dGhlIEtWTSBjaGFuZ2VzIHRocm91Z2ggdGhlIEtWTSB0cmVlCj4+IHVzaW5nIGEgc3RhYmxlIHRv
cGljIGJyYW5jaC90YWcgZnJvbSBBbmRyZXcuCj4KPiBUaGFua3MgZm9yIHRoZSBndWlkYW5jZS4g
VGhlIHNwbGl0IG1ha2VzIHNlbnNlIHRvIG1lOyBJJ20gcGxhbm5pbmcgdG8KPiBmb2xsb3cgdGhp
cyBhcHByb2FjaCB3aXRoIHBhdGNoZXMgMS02IChtbSkgZ29pbmcgdGhyb3VnaCB0aGUgbW0gdHJl
ZQo+IGFuZCBwYXRjaGVzIDctMTYgKEtWTSkgdGhyb3VnaCB0aGUgS1ZNIHRyZWUgb24gdG9wIG9m
IGEgc3RhYmxlCj4gYnJhbmNoL3RhZyBmcm9tIG1tLiBJJ2xsIGNvbmZpcm0gdGhlIGV4YWN0IGJv
dW5kYXJ5IGFuZCBjb29yZGluYXRpb24KPiBkZXRhaWxzIGFzIEkgcHJlcGFyZSB0aGUgcmVwb3N0
Lgo+Cj4gT24gVHVlLCBBcHIgMjEsIDIwMjYgYXQgMDE6NDA6MDBQTSArMDAwMCwgTG9yZW56byBT
dG9ha2VzIHdyb3RlOgo+PiBJbiBhbnkgY2FzZSwgd2UgZGVmaW5pdGVseSBuZWVkIGEgcmViYXNl
IG9uIHNvbWV0aGluZyBub3QtbmV4dCA6KSBpZiBub3QgbW0gdGhlbgo+PiBMaW51cydzIHRyZWUg
YXQgbGVhc3QgbWF5YmU/Cj4+Cj4+IEknbSBzZWVpbmcgYSBsb3Qgb2YgY29uZmxpY3RzIGFnYWlu
c3QgbW0tdW5zdGFibGUsIGl0IGNhbid0IGI0IHNoYXphbSBldmVuIHBhdGNoCj4+IDEgYW5kIGlu
IExpbnVzJ3MgdHJlZSBpdCdzIGZhaWxpbmcgYXQgYW4gbW0gcGF0Y2ggKG1tOiBpbnRyb2R1Y2UK
Pj4gQVNfTk9fRElSRUNUX01BUCkuCj4KCkp1c3QgYXMgYW4gRllJLCBJIGFtIGdvbm5hIGxvb2sg
YXQgdHJ5aW5nIHRvIG1vdmUgdGhpcyBmb3J3YXJkIGEgYml0CndoaWxlIFRha2FoaXJvIHJhbXBz
IHVwIG9uIHRha2luZyBvdmVyIChJIHNwb2tlIHRvIGhpbSBhYm91dCB0aGlzIG9mZgpsaXN0KS4K
Ck15IHVsdGVyaW9yIG1vdGl2ZSBpcyB0aGF0IHRoaXMgd291bGQgZ2l2ZSBtZSBhbiBleGN1c2Ug
dG8gYWRkCkFMTE9DX1VOTUFQUEVEIChmb3JtZXJseSBfX0dGUF9VTk1BUFBFRCkgYW5kIHRoZSBt
ZXJtYXAgWzBdIHdoaWNoCnVuYmxvY2tzIHZhcmlvdXMgc2VjdXJpdHkgbm9uc2Vuc2UgaW5jbHVk
aW5nIEFTSSBbMV0uIChCdXQgYWxzbywgdGhpcwpmZWF0dXJlIGlzIGEgZ29vZCBpZGVhKS4KClsw
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAzMjAtcGFnZV9hbGxvYy11bm1hcHBl
ZC12Mi0wLTI4YmYxYmQ1NGY0MUBnb29nbGUuY29tLwpbMV0gaHR0cHM6Ly9saW51eGFzaS5kZXYK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
