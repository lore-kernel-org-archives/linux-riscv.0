Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293FAC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdsggHIjU/Ayt7XpSRcpJSpD369XM3vnS4ppqZDBcyE=; b=wnNdCNhyhSVzRr
	B53vkB2d1uIA9Z3CHKvRQW4LrZ/ijFshdbjlDF2vNyR05bR+TJvhE7F4y0YaXkLzP0YkcLZ/hEx6E
	iPGLpjrXLJMsKfKD5oO9oAJb5J7jzoSqrjq7+llZTI+WYpMiT+bUsN20VOHYvaKvSnu9h6xdJuYM0
	Y+Cendwcl2qVXzX8ZWOVvAVrpLO2SQiwZ2nzkJ6YM9w0BTCcQMwpZHHrLrKFYAFxyyIG3SeaY+a92
	z/AbCN+yfrYAYj09vp/BxjVR+I9E8G63Ng+AiZV775t+TrF8r7KNiOMeM+KZf+kpCc62OixGKCjMY
	0stAcW9yW0Wx2EWus0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4LN5-0000000BMTP-1hfU;
	Tue, 07 May 2024 14:00:43 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4LN1-0000000BMS3-3q3V
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bE7QxHBl23SqmkvQImsRLD5Ew8sdZ2Sh0oNk8KX8UXI=; b=lF29aSwlz7rdbvZlOKsenoLRqj
	WPB0gv4x5crFU+bqbBAuOVDDVwlxMWUqxkLYMqTigGdwilcGQOdG31W7ChRV00vDImXw9ktfgN2OX
	r/02MyS0yrCoGE1Cz5ctBUr8GdVEkoHYzFUvAy6CXQhvghOyLmRR3WO0vNeCbr48AV33D/mRKEXOd
	Nt5oSU7qQvtojXW4qyTc10bq8fvakg3LaRuuFtOfvSD4Me0QcFHERYeahgWuxk6ea89VOlQ9BH5b4
	NylfnD0+nDTd6MryDtsvcy5lZQJcxNa3lYx8taKNzSWBXk/2zlWKhTlTC/irXHHLQcO13Z0Kl0jXg
	PlInHUHg==;
Received: from [217.161.79.54] (helo=[172.16.0.144])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1s4LMT-008sEA-Fx; Tue, 07 May 2024 15:00:05 +0100
Message-ID: <b7421822-4c07-40e2-b2a4-3599ba6b39da@codethink.co.uk>
Date: Tue, 7 May 2024 15:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
To: Pu Lehui <pulehui@huawei.com>, Xiao Wang <xiao.w.wang@intel.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, haicheng.li@intel.com
References: <20240507104528.435980-1-xiao.w.wang@intel.com>
 <6836eb5c-f135-4e58-987b-987ab446b27c@huawei.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <6836eb5c-f135-4e58-987b-987ab446b27c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_070040_146130_B966AA1A 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcvMDUvMjAyNCAxMzo0NywgUHUgTGVodWkgd3JvdGU6Cj4gCj4gT24gMjAyNC81LzcgMTg6
NDUsIFhpYW8gV2FuZyB3cm90ZToKPj4gVGhlIFpiYSBleHRlbnNpb24gcHJvdmlkZXMgYWRkLnV3
IGluc24gd2hpY2ggY2FuIGJlIHVzZWQgdG8gaW1wbGVtZW50Cj4+IHpleHQudyB3aXRoIHJzMiBz
ZXQgYXMgWkVSTy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWGlhbyBXYW5nIDx4aWFvLncud2FuZ0Bp
bnRlbC5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL3Jpc2N2L0tjb25maWfCoMKgwqDCoMKgwqAgfCAx
OSArKysrKysrKysrKysrKysrKysrCj4+IMKgIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCB8IDE4
ICsrKysrKysrKysrKysrKysrKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwo+PiBpbmRleCA2YmVjMWJjZTY1ODYuLjA2NzkxMjdjYzBlYSAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9yaXNjdi9LY29uZmlnCj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBAQCAtNTg2
LDYgKzU4NiwxNCBAQCBjb25maWcgUklTQ1ZfSVNBX1ZfUFJFRU1QVElWRQo+PiDCoMKgwqDCoMKg
wqDCoCBwcmVlbXB0aW9uLiBFbmFibGluZyB0aGlzIGNvbmZpZyB3aWxsIHJlc3VsdCBpbiBoaWdo
ZXIgbWVtb3J5Cj4+IMKgwqDCoMKgwqDCoMKgIGNvbnN1bXB0aW9uIGR1ZSB0byB0aGUgYWxsb2Nh
dGlvbiBvZiBwZXItdGFzaydzIGtlcm5lbCBWZWN0b3IgCj4+IGNvbnRleHQuCj4+ICtjb25maWcg
VE9PTENIQUlOX0hBU19aQkEKPj4gK8KgwqDCoCBib29sCj4+ICvCoMKgwqAgZGVmYXVsdCB5Cj4+
ICvCoMKgwqAgZGVwZW5kcyBvbiAhNjRCSVQgfHwgJChjYy1vcHRpb24sLW1hYmk9bHA2NCAtbWFy
Y2g9cnY2NGltYV96YmEpCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiAhMzJCSVQgfHwgJChjYy1vcHRp
b24sLW1hYmk9aWxwMzIgLW1hcmNoPXJ2MzJpbWFfemJhKQo+PiArwqDCoMKgIGRlcGVuZHMgb24g
TExEX1ZFUlNJT04gPj0gMTUwMDAwIHx8IExEX1ZFUlNJT04gPj0gMjM5MDAKPj4gK8KgwqDCoCBk
ZXBlbmRzIG9uIEFTX0hBU19PUFRJT05fQVJDSAo+PiArCj4+IMKgIGNvbmZpZyBUT09MQ0hBSU5f
SEFTX1pCQgoKQXQgdGhpcyBwb2ludCB3b3VsZCBpdCBiZSBlYXNpZXIgdG8gYXNrIHRoZSB0b29s
Y2hhaW4gd2hhdCdzIGVuYWJsZWQKYW5kIHB1dCBpbnRvIGtjb25maWcgdmlhIHNvbWUgc29ydCBv
ZiBzY3JpcHQ/CgotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpT
ZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93
d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
