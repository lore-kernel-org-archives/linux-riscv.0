Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B3FF532CE
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 04:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srlOM3pjCTmepkx3eBfUhaTWmfsmC/lteNJk+VbVNw0=; b=ZkUF9iu3ZzYmbg
	sw7V9VDbDDvDFssZO/XW8GcLApoHRqJn3FGxW53Oz1ytekLpeyVMeQgxE7cRgsyJbGF5BeVujTcsB
	ERopWXF6EB+EkyvbyqtEAfID6MK2ooTHjRn7+X3POMMtZ74dI1OA/Dm1AJdWazztXIYjBKDhobVES
	QKmiJX8tZi0ymxxhuCeMb0C3mlCcGuQiZuvHI4GVt26xUX9zcakXseWCHjOLtW9z4UIniXjKXPIRe
	J+CQUXDzEPRo/bHOHN3hZKZOK5lfnf3WNSgA0jfw1MX07XpJOTkeD+z2bxHQzptia1+IjdQGQQ871
	1iEDeo2oWDf4B/dd83xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sz0-00000000WYq-2l4V;
	Tue, 24 Mar 2026 04:03:10 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4syw-00000000WYQ-0b24;
	Tue, 24 Mar 2026 04:03:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bDy1WqzyWZ4QXi9V76+nhfaX5tyIvisESl1ex2cgViU=;
	b=ZdiH1pglApVl4a6IeiYB/RNIPfMQalqh1J1N6H54h+m4wVAkBIL12akP2v0PgO4JxJv57h8AL
	Sz/Bww8R1NtzLrMTjBlHDOVrLDCImsP+6ecp+QIQd2fWrygKLGWJO1InyvsolTRvUDIfiWTeLx6
	ALNTxdX6ngOuZZaJRk7Pqc4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4ffx7B5xTXzRhRB;
	Tue, 24 Mar 2026 11:56:54 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A0A44404AD;
	Tue, 24 Mar 2026 12:02:59 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Mar 2026 12:02:57 +0800
Message-ID: <4cfde40c-673a-12b0-dfc5-703d582d6ea9@huawei.com>
Date: Tue, 24 Mar 2026 12:02:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<peterz@infradead.org>, <feng.tang@linux.alibaba.com>,
	<pawan.kumar.gupta@linux.intel.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <safinaskar@gmail.com>, <rppt@kernel.org>,
	<ardb@kernel.org>, <leitao@debian.org>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <tangyouling@kylinos.cn>,
	<sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
	<eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<kevin.brodsky@arm.com>, <samuel.holland@sifive.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323095548.fa4e13d6e8ae5005ae585e13@linux-foundation.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260323095548.fa4e13d6e8ae5005ae585e13@linux-foundation.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_210306_854967_59797CDB 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMDI2LzMvMjQgMDo1NSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiBPbiBNb24sIDIzIE1h
ciAyMDI2IDE1OjI3OjQwICswODAwIEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+
IHdyb3RlOgo+IAo+PiBUaGUgY3Jhc2ggbWVtb3J5IGFsbG9jYXRpb24sIGFuZCB0aGUgZXhjbHVk
ZSBvZiBjcmFzaGtfcmVzLCBjcmFzaGtfbG93X3Jlcwo+PiBhbmQgY3Jhc2hrX2NtYSBtZW1vcnkg
YXJlIGFsbW9zdCBpZGVudGljYWwgYWNyb3NzIGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzLAo+PiBU
aGlzIHBhdGNoIHNldCBoYW5kbGUgdGhlbSBpbiBjcmFzaCBjb3JlIGluIGEgZ2VuZXJhbCB3YXks
IHdoaWNoIGVsaW1pbmF0ZQo+PiBhIGxvdCBvZiBkdXBsaWNhdGlvbiBjb2RlLgo+Pgo+PiBBbmQg
YWRkIHN1cHBvcnQgZm9yIGNyYXNoa2VybmVsIENNQSByZXNlcnZhdGlvbiBmb3IgYXJtNjQgYW5k
IHJpc2N2Lgo+IAo+IFRoYW5rcy4gIEFJIHJldmlldyBoYXMgY29tcGxldGVkIGFuZCBpdCBhc2tz
IHF1ZXN0aW9uczoKPiAJaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwMzIzMDcy
NzQ1LjI0ODE3MTktMS1ydWFuamluamllQGh1YXdlaS5jb20KCkkgYmVsaWV2ZSBpdCBpZGVudGlm
aWVkIDQgdmFsaWQgaXNzdWVzOgoKLSBUaGUgYWxyZWFkeSBkaXNjb3ZlcmVkIGNyYXNoa19sb3df
cmVzIG5vdCBleGNsdWRlZCBidWcgaW4gdGhlIGV4aXN0aW5nClJJU0MtViBjb2RlLgoKLSBBbiBl
eGlzdGluZyBtZW1vcnkgbGVhayBpc3N1ZSBpbiB0aGUgZXhpc3RpbmcgUG93ZXJQQyBjb2RlLgoK
LSBUaGUgb3JkZXJpbmcgaXNzdWUgb2YgYWRkaW5nIENNQSByYW5nZXMgdG8gImxpbnV4LHVzYWJs
ZS1tZW1vcnktcmFuZ2UiLgoKLSBBbiBleGlzdGluZyBjb25jdXJyZW5jeSBpc3N1ZS4gQSBDb25j
dXJyZW50IG1lbW9yeSBob3RwbHVnIG1heSBvY2N1cgpiZXR3ZWVuIHJlYWRpbmcgbWVtYmxvY2sg
YW5kIGF0dGVtcHRpbmcgdG8gZmlsbCBjbWVtIGR1cmluZyBrZXhlY19sb2FkKCkKZm9yIGFsbW9z
dCBhbGwgZXhpc3RpbmcgYXJjaGl0ZWN0dXJlc++8jEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEK
cHJhY3RpY2FsIGlzc3VlIGluIHJlYWxpdHkuLgoKIFJhY2UgQ29uZGl0aW9uIFNjZW5hcmlvCgog
IFRpbWVsaW5lOgogIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIFQxOiBrZXhlY19sb2FkKCkgc3lzY2FsbCBzdGFy
dHMKICBUMjoga2V4ZWNfdHJ5bG9jaygpIGFjcXVpcmVzIGtleGVjX2xvY2sKICBUMzogY3Jhc2hf
cHJlcGFyZV9oZWFkZXJzKCkgaXMgY2FsbGVkCiAgVDQ6IGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5n
ZXMoKSBxdWVyaWVzIG1lbWJsb2NrIOKGkiBmaW5kcyAxMDAgbWVtb3J5IHJhbmdlcwogIFQ1OiBj
bWVtID0gYWxsb2NfY21lbSgxMDApIGFsbG9jYXRlcyBidWZmZXIgZm9yIDEwMCByYW5nZXMKICBU
NjogW1JBQ0UgV0lORE9XXSBBbm90aGVyIHByb2Nlc3MgdHJpZ2dlcnMgbWVtb3J5IGhvdHBsdWcK
ICBUNzogYWRkX21lbW9yeSgpIOKGkiBsb2NrX2RldmljZV9ob3RwbHVnKCkg4oaSIG1lbWJsb2Nr
X2FkZF9ub2RlKCkKICBUODogTmV3IG1lbW9yeSByZWdpb24gYWRkZWQgdG8gbWVtYmxvY2sKICBU
OTogYXJjaF9jcmFzaF9wb3B1bGF0ZV9jbWVtKCkgaXRlcmF0ZXM6IG5vdyBmaW5kcyAxMDIgcmFu
Z2VzCiAgVDEwOiBjbWVtLT5yYW5nZXNbMTAwXSDihpIgT1VUIE9GIEJPVU5EUyBXUklURSEKICBU
MTE6IGNtZW0tPnJhbmdlc1sxMDFdIOKGkiBPVVQgT0YgQk9VTkRTIFdSSVRFIQogIFQxMjogS2Vy
bmVsIGNyYXNoIG9yIG1lbW9yeSBjb3JydXB0aW9uCgogIFdoeSBUaGlzIEhhcHBlbnMKCiAgMS4g
RGlmZmVyZW50IGxvY2tzIHVzZWQ6CiAgICAtIGtleGVjX2xvYWQoKSB1c2VzIGtleGVjX3RyeWxv
Y2sgKGF0b21pY190KQogICAgLSBNZW1vcnkgaG90cGx1ZyB1c2VzIGRldmljZV9ob3RwbHVnX2xv
Y2sgKG11dGV4KQogIDIuIE5vIHN5bmNocm9uaXphdGlvbiBiZXR3ZWVuIHRoZXNlIHR3byBvcGVy
YXRpb25zCiAgMy4gVGltZS1vZi1jaGVjayB0byB0aW1lLW9mLXVzZSAoVE9DVE9VKSBpc3N1ZToK
ICAgIC0gU3RlcCBUNC1UNTogV2UgcXVlcnkgdGhlIG51bWJlciBvZiByYW5nZXMgYW5kIGFsbG9j
YXRlIGJ1ZmZlcgogICAgLSBTdGVwIFQ2LVQ5OiBNZW1vcnkgaG90cGx1ZyBhZGRzIG5ldyByYW5n
ZXMgYmV0d2VlbiBxdWVyeSBhbmQKcG9wdWxhdGlvbgoKCgpBbnkgY29tbWVudHMgb3Igc3VnZ2Vz
dGlvbnMgb24gdGhlIGZvbGxvd2luZyBhcHByb2FjaD8KCgppbnQgY3Jhc2hfcHJlcGFyZV9oZWFk
ZXJzKC4uLikKICB7CiAgICAgIHVuc2lnbmVkIGludCBtYXhfbnJfcmFuZ2VzOwogICAgICBzdHJ1
Y3QgY3Jhc2hfbWVtICpjbWVtOwogICAgICBpbnQgcmV0OwoKICAgICAgbG9ja19kZXZpY2VfaG90
cGx1ZygpOwoKICAgICAgbWF4X25yX3JhbmdlcyA9IGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5nZXMo
KTsKICAgICAgLy8gLi4uCiAgICAgIHJldCA9IGFyY2hfY3Jhc2hfcG9wdWxhdGVfY21lbShjbWVt
KTsKICAgICAgLy8gLi4uCgogICAgICB1bmxvY2tfZGV2aWNlX2hvdHBsdWcoKTsKICAgICAgcmV0
dXJuIHJldDsKICB9CgoKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
