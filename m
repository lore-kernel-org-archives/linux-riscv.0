Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809FEC46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZQwwSv51PatG7zllcRO8rDXVd51IFm9rdViQadqpEE=; b=42aaL71eF2qcQc
	3KgvRj6AT39GPc1hpGNSV/2Rnd7kqR8EjsBQWzVBZ8ELGyyCkF/TCtqdFStVQ2nDzu183mTQO2koo
	pnUQDSGrD/ek4rpLI08HsfuUJtPYd6kUeuDu6X9FDkgn7eZjt0g8QOgS6RMyCO+Ca/OrR5Vm/5JTi
	r5XnHmz5+npu71ubPSZMAIbnuVLRI8z3QhTpWDL3i+Hrg8f74Hy3avJgubNPpirpyP7YLcGgb2s6Y
	7deEwCRnYMQSJnwg+trZf8n9fcBTLG/tUkClwzj7WhuDMW2LkueEueUD2dgw65zpJO/7QZ8k9ZwR1
	QYS87R79Z8tJQ95r8A/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzNN-007jmh-GV; Wed, 04 Jan 2023 08:43:57 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzEJ-007fep-SI
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:34:37 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Nn2q72YyDzJpwR;
	Wed,  4 Jan 2023 16:30:27 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 4 Jan 2023 16:34:26 +0800
Message-ID: <c5bdf7af-112e-e92c-7df0-8bc8a652bcd8@huawei.com>
Date: Wed, 4 Jan 2023 16:34:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 1/9] riscv/kprobe: Prepare the skeleton to implement
 RISCV OPTPROBES feature
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Chen Guokai
	<chenguokai17@mails.ucas.ac.cn>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-2-chenguokai17@mails.ucas.ac.cn>
 <87wn64vmoq.fsf@all.your.base.are.belong.to.us>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <87wn64vmoq.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003436_234935_BE3EC4B1 
X-CRM114-Status: GOOD (  10.89  )
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

CgrlnKggMjAyMy8xLzMgMjowMywgQmrDtnJuIFTDtnBlbCDlhpnpgZM6Cj4gQ2hlbiBHdW9rYWkg
PGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cj4gCj4+IEZyb206IExpYW8g
Q2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPj4KPj4gUHJlcGFyZSBza2VsZXRvbiB0byBp
bXBsZW1lbnQgb3B0aW1pemVkIGtwcm9iZSBvbiBSSVNDViwgaXQgaXMgY29uc2lzdAo+PiBvZiBN
YWtmaWxlLCBLY29uZmlnIGFuZCBzb21lIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBmaWxlczoga3By
b2JlLmggYW5kCj4+IG9wdC5jIG9wdC5jIGluY2x1ZGUgc29tZSBtYWNybywgdHlwZSBkZWZpbml0
aW9uIGFuZCBmdW5jdGlvbnMgcmVxdWlyZWQKPj4gYnkga3Byb2JlIGZyYW1ld29yaywgb3B0X3Ry
YW1wb2xpbmUuUyBwcm92aWRlIGEgcGllY2Ugb2YgYXNzZW1ibHkgY29kZQo+PiB0ZW1wbGF0ZSB1
c2VkIHRvIGNvbnN0cnVjdCB0aGUgZGV0b3VyIGJ1ZmZlciBhcyB0aGUgdGFyZ2V0IG9mIGxvbmcg
anVtcAo+PiBpbnN0cnVjdGlvbihzKSBmb3IgZWFjaCBvcHRpbXplZCBrcHJvYmUuCj4gCj4gVGhp
cyBpcyBwcmV0dHkgbXVjaCBqdXN0IHJlaXRlcmF0aW5nIHdoYXQgZGlmZi1zdGF0IHNheXMuIFBs
ZWFzZSB0cnkgdG8KPiBleHBsYWluIHdoeSBhIGNlcnRhaW4gY2hhbmdlIGlzIGRvbmUsIGluc3Rl
YWQgb2Ygd2hhdC4gV2hhdCBpcyBhbHJlYWR5Cj4gaW4gdGhlIHBhdGNoLgoKVGhhbmtzIGZvciB5
b3VyIHN1Z2dlc3Rpb24sIGkgd2lsbCBleHBsYWluIGZ1cnRoZXIgaW4gbmV4dCByZXZpc2lvbi4K
Cj4gCj4+IFNpbmNlIHRoZSBqdW1wIHJhbmdlIG9mIFBDLXJlbGF0aXZlIGluc3RydWN0aW9uIEpB
TCBpcyArLy0yTSwgdGhhdCBpcwo+PiB0b28gc21hbGwgdG8gcmVhY2ggdGhlIGRldG91ciBidWZm
ZXIsIGhlbmNlIHRoZSBmb3VkYW1lbnRhbCBpZGVhIHRvCj4+IGFkZHJlc3MgT1BUUFJPQkVTIG9u
IFJJU0NWIGlzIHJlcGxhY2UgJ0VCUkVBSycgd2l0aCAnQVVJUEMvSkFMUicuIHdoaWNoCj4+IG1l
YW5zIGl0IG5lZWRzIHRvIGNsb2JiZXIgb25lIG1vcmUgaW5zdHJ1Y3Rpb24gYmVzaWRlIHRoZSBr
cHJvYmUKPj4gaW5zdHJ1Y3Rpb24sIGZ1cnRoZXJtb3JlLCBSSVNDViBzdXBwb3J0cyBoeWJpcmQg
UlZJIGFuZCBSVkMgaW4gc2luZ2xlCj4+IGtlcm5lbCBiaW5hcnksIHNvIGluIHRoZW9yeSBhIHBh
aXIgb2YgJ0FVSVBDL0pBTFInIGlzIGFib3V0IHRvIGNsb2JiZXIKPj4gMTAgYnl0ZXMoMyBSVkMg
YW5kIDEgUlZJLCAyIGJ5dGVzIGlzIHBhZGRpbmcgZm9yIGFsaWdubWVudCkgYXQgd29yc3QKPj4g
Y2FzZS4gVGhlIHNlY29uZCBoYXJkc29tZSBwcm9ibGVtIGlzIGxvb2tpbmcgZm9yIG9uZSBpbnRl
Z2VyIHJlZ2lzdGVyIGFzCj4+IHRoZSBkZXN0aW5hdGlvbiBvZiAnQVVJUEMvSkFMUicgd2l0aG91
dCBhbnkgc2lkZS1lZmZlY3QuCj4gCj4gVGhlcmUgYXJlIGEgbnVtYmVyIG9mIHNwZWxsaW5nIGVy
cm9ycywgcGxlYXNlIHVzZSBhIHNwZWxsY2hlY2tlciBhbmQgaWYKPiB5b3UgcmVmZXJlbmNlIGEg
ZmlsZSAoZS5nLiBNYWtlZmlsZSksIG1ha2Ugc3VyZSBpdCBpcyBjb3JyZWN0bHkgc3BlbGxlZAo+
IG91dC4KPiAKPiBUaGUgY29tbWVudHMgYWJvdmUgYXBwbGllcyB0byBhbGwgdGhlIGNvbW1pdCBt
ZXNzYWdlcyBvZiB0aGlzIHNlcmllcy4KClRoYW5rcyBmb3IgcmV2aWV3aW5nLCBpIHdpbGwgY29y
cmVjdCB0aGVzZSBzcGVsbGluZyBlcnJvcnMuCgo+IAo+IAo+IEJqw7ZybgoKLS0gCkJSLApMaWFv
LCBDaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
