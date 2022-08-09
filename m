Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497D3C19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 06:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2PaHvMtRFLlxuQCK8G5+YSpJjXPhmwsiO/tiHeBaN8=; b=Fpf4wI+7tDy51Doh06dlULav+P
	DI3LXxoUurvVPcdW+SZ11UA1ViHzciZr8mFrZKhygk9JyFpeVXVjhrwcvorfwtzzzdcQQO7zcTTeA
	9ApT46iPEQMLupFRhU9ZJcrZ6VLaJ9qt3zJ0JvildGy4EadudOWdHDZgSOK4A8sOqASwrsdd3OGrD
	1NElV7ELdLTk6utNIexOxbtx6jLYCZoppSjJJAINuGQYBLTyqsFzL3jtPZw76cnYoH44IfNjTIR//
	Ps5MaHWk9mzkCmBGot9IXs/Ji8/3hBVFJpIJBPsg/nqV6kVG/Q248/JJBEMo4hLijcEuP89FLsTNm
	ekc+LfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLJCg-002AVh-8a; Tue, 09 Aug 2022 06:59:02 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLJCW-002API-BZ; Tue, 09 Aug 2022 06:58:56 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R591e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0VLov6Aw_1660028320;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VLov6Aw_1660028320)
          by smtp.aliyun-inc.com;
          Tue, 09 Aug 2022 14:58:41 +0800
Subject: Re: [PATCH V5 0/6] RISC-V fixups to work with crash tool
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 anup@brainfault.org, heiko@sntech.de, guoren@kernel.org, mick@ics.forth.gr,
 alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com,
 dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 crash-utility@redhat.com, huanyi.xj@alibaba-inc.com,
 heinrich.schuchardt@canonical.com, k-hagio-ab@nec.com,
 hschauhan@nulltrace.org, yixun.lan@gmail.com
References: <20220802121818.2201268-1-xianting.tian@linux.alibaba.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <b79ab47e-a1e2-eb21-0611-bcbc8b7802c5@linux.alibaba.com>
Date: Tue, 9 Aug 2022 14:58:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220802121818.2201268-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_235853_667301_B89FBC00 
X-CRM114-Status: GOOD (  20.01  )
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

SGkgUGFsbWVyCgpDb3VsZCB5b3UgcGxlYXNlIGhlbHAgcmV2aWV3IHRoaXMgcGF0Y2ggc2V0P8Kg
IHRoYW5rcy4KCkNyYXNoLXV0aWxpdHkgcGF0Y2ggc2V0IGlzIHJlYWR5KGFja2VkIGJ5IEhBR0lP
IEtBWlVISVRPKSwgbm93IHdhaXRpbmcgCnRoZSBrZXJuZWwgcGF0Y2ggc2V0IG1lcmdlZCBmaXJz
dGx5LgoK5ZyoIDIwMjIvOC8yIOS4i+WNiDg6MTgsIFhpYW50aW5nIFRpYW4g5YaZ6YGTOgo+IEkg
ZXZlciBzZW50IHRoZSBwYXRjaCAxIGluIHRoZSBsaW5rOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIyMDcwODA3MzE1MC4zNTI4MzAt
My14aWFudGluZy50aWFuQGxpbnV4LmFsaWJhYmEuY29tLwo+IEFuZCBwYXRjaCAyLDMgaW4gdGhl
IGxpbms6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2
L3BhdGNoLzIwMjIwNzE0MTEzMzAwLjM2Nzg1NC0yLXhpYW50aW5nLnRpYW5AbGludXguYWxpYmFi
YS5jb20vCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2
L3BhdGNoLzIwMjIwNzE0MTEzMzAwLjM2Nzg1NC0zLXhpYW50aW5nLnRpYW5AbGludXguYWxpYmFi
YS5jb20vCj4KPiBUaGlzIHBhdGNoIHNldCBqdXN0IHB1dCB0aGVzZSBwYXRjaGVzIHRvZ2V0aGVy
LCBhbmQgd2l0aCB0aHJlZSBuZXcgcGF0Y2ggNCwgNSwgNi4KPiB0aGVzZSBzaXggcGF0Y2hlcyBh
cmUgdGhlIGZpeHVwcyBmb3IgbWFjaGluZV9rZXhlYywga2VybmVsIG1vZGUgUEMgZm9yIHZtY29y
ZQo+IGFuZCBpbXByb3ZlbWVudHMgZm9yIHZtY29yZWluZm8sIG1lbW9yeSBsYXlvdXQgZHVtcCBh
bmQgZml4dXAgY2hlZHVsZSBvdXQgaXNzdWUKPiBpbiBtYWNoaW5lX2NyYXNoX3NodXRkb3duKCku
Cj4KPiBUaGUgbWFpbiBjaGFuZ2VzIGluIHRoZSBzaXggcGF0Y2hzIGFzIGJlbG93LAo+IFBhdGNo
IDE6IHVzZSBfX3NtcF9wcm9jZXNzb3JfaWQoKSBpbnN0ZWFkIG9mIHNtcF9wcm9jZXNzb3JfaWQo
KSB0byBjbGVhbnVwCj4gICAgICAgICAgIHRoZSBjb25zb2xlIHByaW50cy4KPiBQYXRjaCAyOiBB
ZGQgVk0gbGF5b3V0LCB2YSBiaXRzLCByYW0gYmFzZSB0byB2bWNvcmVpbmZvLCB3aGljaCBjYW4g
c2ltcGxpZnkKPiAgICAgICAgICAgdGhlIGRldmVsb3BtZW50IG9mIGNyYXNoIHRvb2wgYXMgQVJN
NjQgYWxyZWFkeSBkaWQKPiAgICAgICAgICAgKGFyY2gvYXJtNjQva2VybmVsL2NyYXNoX2NvcmUu
YykuCj4gUGF0Y2ggMzogQWRkIG1vZHVsZXMgdG8gdmlydHVhbCBrZXJuZWwgbWVtb3J5IGxheW91
dCBkdW1wLgo+IFBhdGNoIDQ6IEZpeHVwIHRvIGdldCBjb3JyZWN0IGtlcm5lbCBtb2RlIFBDIGZv
ciB2bWNvcmUuCj4gUGF0Y2ggNTogVXBkYXRlcyB2bWNvcmVpbmZvLnJzdC4KPiBQYXRjaCA2OiBG
aXh1cCBzY2hlZHVsZSBvdXQgaXNzdWUgaW4gbWFjaGluZV9jcmFzaF9zaHV0ZG93bigpCj4KPiBX
aXRoIHRoZXNlIHNpeCBwYXRjaGVzKHBhdGNoIDIgaXMgbXVzdCksIGNyYXNoIHRvb2wgY2FuIHdv
cmsgd2VsbCB0byBhbmFseXplCj4gYSB2bWNvcmUuIFRoZSBwYXRjaGVzIGZvciBjcmFzaCB0b29s
IGZvciBSSVNDVjY0IGlzIGluIHRoZSBsaW5rOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjIwODAxMDQzMDQwLjIwMDMyNjQtMS14aWFudGluZy50aWFuQGxpbnV4LmFs
aWJhYmEuY29tLwo+Cj4gLS0tLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIDEsIHJlbW92ZSB0
aGUgcGF0Y2ggIkFkZCBhIGZhc3QgY2FsbCBwYXRoIG9mIGNyYXNoX2tleGVjKCkiIGZyb20gdGhp
cyBzZXJpZXMKPiAgIG9mIHBhdGNoZXMsIGFzIGl0IGFscmVhZHkgYXBwbGllZCB0byByaXNjdiBn
aXQuCj4gICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9y
aXNjdi9saW51eC5naXQvY29tbWl0Lz9oPWZvci1uZXh0JmlkPTNmMTkwMTExMGE4OWIwZTJlMTNh
ZGIyYWM4ZDFhNzEwMjg3OWVhOTgKPiAgIDIsIGFkZCAnUmV2aWV3ZWQtYnknIGJhc2VkIG9uIHRo
ZSBjb21tZW50cyBvZiB2MS4KPiBDaGFuZ2VzIHYyIC0+IHYzOgo+ICAgdXNlICJyaXNjdiIgaW5z
dGVhZCBvZiAicmlzY3Y2NCIgaW4gcGF0Y2ggNSBzdWJqZWN0IGxpbmUuCj4gQ2hhbmdlcyB2MyAt
PiB2NDoKPiAgIHVzZSAicmlzY3YiIGluc3RlYWQgb2YgInJpc2N2NjQiIGluIHRoZSBzdW1tYXJ5
IG9mIHBhdGNoIDUgc3ViamVjdCBsaW5lLgo+IENoYW5nZXMgdjQgLT4gdjU6Cj4gICBhZGQgYSBu
ZXcgcGF0Y2ggIlJJU0MtVjogRml4dXAgc2NoZWR1bGUgb3V0IGlzc3VlIGluIG1hY2hpbmVfY3Jh
c2hfc2h1dGRvd24oKSIKPgo+IFhpYW50aW5nIFRpYW4gKDYpOgo+ICAgIFJJU0MtVjogdXNlIF9f
c21wX3Byb2Nlc3Nvcl9pZCgpIGluc3RlYWQgb2Ygc21wX3Byb2Nlc3Nvcl9pZCgpCj4gICAgUklT
Qy1WOiBBZGQgYXJjaF9jcmFzaF9zYXZlX3ZtY29yZWluZm8gc3VwcG9ydAo+ICAgIHJpc2N2OiBB
ZGQgbW9kdWxlcyB0byB2aXJ0dWFsIGtlcm5lbCBtZW1vcnkgbGF5b3V0IGR1bXAKPiAgICBSSVND
LVY6IEZpeHVwIGdldHRpbmcgY29ycmVjdCBjdXJyZW50IHBjCj4gICAgcmlzY3Y6IGNyYXNoX2Nv
cmU6IEV4cG9ydCBrZXJuZWwgdm0gbGF5b3V0LCBwaHlzX3JhbV9iYXNlCj4gICAgUklTQy1WOiBG
aXh1cCBzY2hlZHVsZSBvdXQgaXNzdWUgaW4gbWFjaGluZV9jcmFzaF9zaHV0ZG93bigpCj4KPiAg
IC4uLi9hZG1pbi1ndWlkZS9rZHVtcC92bWNvcmVpbmZvLnJzdCAgICAgICAgICB8IDMxICsrKysr
KysrKysrKysrKysrKysKPiAgIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiAgIGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX2NvcmUuYyAgICAgICAg
ICAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysrCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFz
aF9zYXZlX3JlZ3MuUyAgICAgICAgICAgfCAgMiArLQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvbWFj
aGluZV9rZXhlYy5jICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKystLS0KPiAgIGFyY2gv
cmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKwo+ICAgNiBm
aWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX2NvcmUuYwo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
