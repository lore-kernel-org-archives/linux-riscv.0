Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791A0CD98C6
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 01:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yp530OVFowiCElOqNxM8r6wfDLLNYfNiK8WI9PEmTXM=; b=FkVCVJziLW6YAP
	2xdJIw5CTpeTmn97wLJf1h6uhB+l9rOf11+eZtdNbfs+5mjTO7Br2dlQQZXk6PnhnRtHM+HVK5932
	kl4qmDmsPd94yycsqyYKyWXhE8owU7YZV8JTU6OyemDv3xOcfqRwCfRnXL+9oViBnmi23K2yd+BQj
	k72yAMPbs4cYSeyG5sIeFeMzRDO6fuooxrfoQufrEn5DOKqWtJluHC4rqX/H5cEGPW89IxZR32Zsw
	jzOxdYpu07xYQJyJp+iHXU0wEy8Fnxb2FklAfUTITVgLP84pixdcr9JKYwG71P2qouhYvJQeZsP7E
	fZJeSN7W/p8XfWHD0xTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUGK-00000008WjL-0UVS;
	Thu, 11 Jun 2026 01:31:16 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXUGF-00000008Wif-3VPx;
	Thu, 11 Jun 2026 01:31:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RBlgvudl+cGjprXWFObeeRS2MUnS8N5YzsCKOc0pnqk=;
	b=3gZH/hNn+g7QWrpLfYH3VIVhOi+KC+luwjGIe9WtEed6xfgF9PTswIocwyjpaWEgUrlrl483x
	xRsRvhaB6WhwMvFr8+me5PjwErrqXqd54SKqfYa3Ow2i+D3OOZmZcCexoeWlyy5YNsYoV0Xjm9e
	xyc3UBr9eQflKVxitdNqgYY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gbPys18dZzcb1Y;
	Thu, 11 Jun 2026 09:22:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E7252025F;
	Thu, 11 Jun 2026 09:30:58 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Jun 2026 09:30:55 +0800
Message-ID: <37f31716-095b-477c-9b0b-946a15275c2e@huawei.com>
Date: Thu, 11 Jun 2026 09:30:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Andrew Morton <akpm@linux-foundation.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>, <bhe@redhat.com>,
	<rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<ruirui.yang@linux.dev>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <kuba@kernel.org>,
	<lirongqing@baidu.com>, <ebiggers@kernel.org>, <paulmck@kernel.org>,
	<leitao@debian.org>, <coxu@redhat.com>, <Liam.Howlett@oracle.com>,
	<ryan.roberts@arm.com>, <osandov@fb.com>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <adityag@linux.ibm.com>, <liaoyuanhong@vivo.com>,
	<seanjc@google.com>, <fuqiang.wang@easystack.cn>, <ardb@kernel.org>,
	<chenjiahao16@huawei.com>, <guoren@kernel.org>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608091000.d88d7f5cc1bc4fa17f5774fe@linux-foundation.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260608091000.d88d7f5cc1bc4fa17f5774fe@linux-foundation.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_183112_542750_069A1099 
X-CRM114-Status: UNSURE (   7.32  )
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

CgpPbiA2LzkvMjAyNiAxMjoxMCBBTSwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiBPbiBNb24sIDgg
SnVuIDIwMjYgMTU6MzQ6NDkgKzA4MDAgSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNv
bT4gd3JvdGU6Cj4gCj4+IFRoZSBjcmFzaCBtZW1vcnkgYWxsb2NhdGlvbiwgYW5kIHRoZSBleGNs
dWRlIG9mIGNyYXNoa19yZXMsIGNyYXNoa19sb3dfcmVzCj4+IGFuZCBjcmFzaGtfY21hIG1lbW9y
eSBhcmUgYWxtb3N0IGlkZW50aWNhbCBhY3Jvc3MgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMsCj4+
IFRoaXMgcGF0Y2ggc2V0IGhhbmRsZSB0aGVtIGluIGNyYXNoIGNvcmUgaW4gYSBnZW5lcmFsIHdh
eSwgd2hpY2ggZWxpbWluYXRlCj4+IGEgbG90IG9mIGR1cGxpY2F0aW9uIGNvZGUuCj4+Cj4+IEFu
ZCBhZGQgc3VwcG9ydCBmb3IgY3Jhc2hrZXJuZWwgQ01BIHJlc2VydmF0aW9uIGZvciBhcm02NCBh
bmQgcmlzY3YuCj4gCj4gZnlpLCBBSSByZXZpZXcgbWlnaHQgaGF2ZSBmb3VuZCBhIGJ1bmNoIG9m
IGlzc3VlcyBpbiBhcmNoLXNwZWNpZmljCj4gY29kZSwgYWxsIG9mIHRoZW0gcHJlLWV4aXN0aW5n
LgoKSGksIEFuZHJld++8jAoKQXMgTWlrZSBjb252ZXllZCwgQmFvcXVhbiBwcm9wb3NlZCBzcGxp
dHRpbmcgb3V0IHRoZSB1bnJlbGF0ZWQgYnVnIGZpeGVzCmludG8gYSBzZXBhcmF0ZSBwYXRjaCBz
ZXQsIGluIG9yZGVyIHRvIGtlZXAgdjE2IGZyb20gZ3Jvd2luZyBleGNlc3NpdmVseS4KCkxpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9haDJMeDdLSEk2MHR6ZDB2QE1pV2lGaS1SM0wt
c3J2LwoKQmVzdCBSZWdhcmRzLApKaW5qaWUKCj4gCj4gCWh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MDYwODA3MzQ1OS4zMTE5MjkwLTEtcnVhbmppbmppZUBodWF3ZWkuY29tCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
