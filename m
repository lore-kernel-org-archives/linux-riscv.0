Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B89FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pghigyblac/HcuCmvvUl4V7mEwJE9osSNKCb8nOLNQs=; b=ZVwMCAg2lSHQIY
	A9TwvYe8snV+6U9p5MCmibAi0ksm7vwjBW6h7caxGQk1U3HO3Bef+wWFT7fVoOofzD2lhxb6Rkr5r
	hX4PzL6nT1MmX+qbvNaVLLTBsp9ERjkt1B2Tk5TyvzIxHGp+sj7pRBOurSuUg3HyXvYioWSFG5a2X
	M8QIpNqA+uC6o2fnqGBLX6MuUqMYRMJWseWjZgSH3NwBxetVD2y0piL++iMkwtEzQQndNMnWg2S9Z
	yx40GZvHB3kA8KWvZDjvlnfJWwGgIFBh+puhD4pEzu5FqMOWPwT4yXh9eaoYJlSv4fA5eOaiZCPye
	OaeM4tNM1XGRuoj9+j6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nytCa-00CpHf-79; Wed, 08 Jun 2022 10:46:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nytCW-00CpFa-SI
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 10:46:14 +0000
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LJ3hH55gqz67jfG;
	Wed,  8 Jun 2022 18:42:23 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 12:45:56 +0200
Received: from [10.47.90.54] (10.47.90.54) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 8 Jun
 2022 11:45:55 +0100
Message-ID: <9e981523-6032-fd24-08f9-0ef771cd1c2e@huawei.com>
Date: Wed, 8 Jun 2022 11:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 3/4] RISC-V: Added generic pmu-events mapfile
To: Nikita Shubin <nikita.shubin@maquefel.me>
CC: Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, "Namhyung
 Kim" <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, open list
	<linux-kernel@vger.kernel.org>, "open list:PERFORMANCE EVENTS SUBSYSTEM"
	<linux-perf-users@vger.kernel.org>, "open list:RISC-V ARCHITECTURE"
	<linux-riscv@lists.infradead.org>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
 <20220607131648.29439-4-nikita.shubin@maquefel.me>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <20220607131648.29439-4-nikita.shubin@maquefel.me>
X-Originating-IP: [10.47.90.54]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_034613_232164_84382716 
X-CRM114-Status: GOOD (  12.25  )
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

T24gMDcvMDYvMjAyMiAxNDoxNiwgTmlraXRhIFNodWJpbiB3cm90ZToKPiBGcm9tOiBKb8OjbyBN
w6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0Pgo+IAo+IFRoZSBw
bXUtZXZlbnRzIG5vdyBzdXBwb3J0cyBjdXN0b20gZXZlbnRzIGZvciBSSVNDLVYsIHBsdXMgdGhl
IGN5Y2xlLAo+IHRpbWUgYW5kIGluc3RyZXQgZXZlbnRzIHdlcmUgZGVmaW5lZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKb8OjbyBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlz
Ym9hLnB0Pgo+IFRlc3RlZC1ieTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgo+
IC0tLQo+ICAgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YgIHwg
MTQgKysrKysrKysrKysrKwo+ICAgLi4uL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5l
cmljLmpzb24gIHwgMjAgKysrKysrKysrKysrKysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAz
NCBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZl
bnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9w
ZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24KPiAKPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YgYi90b29s
cy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdgo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi40ZjJhYTE5OWQ5Y2IKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YKPiBA
QCAtMCwwICsxLDE0IEBACj4gKyMgRm9ybWF0Ogo+ICsjCU1JRFIsVmVyc2lvbixKU09OL2ZpbGUv
cGF0aG5hbWUsVHlwZQo+ICsjCj4gKyMgd2hlcmUKPiArIwlNSURSCVByb2Nlc3NvciB2ZXJzaW9u
CgpBUk0sIG5vPwoKPiArIwkJVmFyaWFudFsyMzoyMF0gYW5kIFJldmlzaW9uIFszOjBdIHNob3Vs
ZCBiZSB6ZXJvLgo+ICsjCVZlcnNpb24gY291bGQgYmUgdXNlZCB0byB0cmFjayB2ZXJzaW9uIG9m
IEpTT04gZmlsZQo+ICsjCQlidXQgY3VycmVudGx5IHVudXNlZC4KPiArIwlKU09OL2ZpbGUvcGF0
aG5hbWUgaXMgdGhlIHBhdGggdG8gSlNPTiBmaWxlLCByZWxhdGl2ZQo+ICsjCQl0byB0b29scy9w
ZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi8uCj4gKyMJVHlwZSBpcyBjb3JlLCB1bmNvcmUgZXRj
Cj4gKyMKPiArIwo+ICsjRmFtaWx5LW1vZGVsLFZlcnNpb24sRmlsZW5hbWUsRXZlbnRUeXBlCj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jpc2N2LWdlbmVy
aWMuanNvbiBiL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jpc2N2LWdlbmVyaWMu
anNvbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMTNlNTBl
ZmFkOTkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gv
cmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29uCgp3aGVyZSBvciBob3cgYXJlIHRoZXNlIHJlZmVyZW5j
ZWQ/Cgo+IEBAIC0wLDAgKzEsMjAgQEAKPiArWwo+ICsgIHsKPiArICAgICJQdWJsaWNEZXNjcmlw
dGlvbiI6ICJDUFUgQ3ljbGVzIiwKPiArICAgICJFdmVudENvZGUiOiAiMHgwMCIsCj4gKyAgICAi
RXZlbnROYW1lIjogInJpc2N2X2N5Y2xlcyIsCj4gKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJD
UFUgY3ljbGVzIFJJU0MtViBnZW5lcmljIGNvdW50ZXIiCj4gKyAgfSwKPiArICB7Cj4gKyAgICAi
UHVibGljRGVzY3JpcHRpb24iOiAiQ1BVIFRpbWUiLAo+ICsgICAgICAiRXZlbnRDb2RlIjogIjB4
MDEiLAo+ICsgICAgICAiRXZlbnROYW1lIjogInJpc2N2X3RpbWUiLAo+ICsgICAgICAiQnJpZWZE
ZXNjcmlwdGlvbiI6ICJDUFUgdGltZSBSSVNDLVYgZ2VuZXJpYyBjb3VudGVyIgo+ICsgIH0sCj4g
KyAgewo+ICsgICAgIlB1YmxpY0Rlc2NyaXB0aW9uIjogIkNQVSBJbnN0cnVjdGlvbnMiLAo+ICsg
ICAgICAiRXZlbnRDb2RlIjogIjB4MDIiLAo+ICsgICAgICAiRXZlbnROYW1lIjogInJpc2N2X2lu
c3RyZXQiLAo+ICsgICAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUgcmV0aXJlZCBpbnN0cnVj
dGlvbnMgUklTQy1WIGdlbmVyaWMgY291bnRlciIKPiArICB9Cj4gK10KPiBcIE5vIG5ld2xpbmUg
YXQgZW5kIG9mIGZpbGUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
