Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27C0C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPFM8xynkGxgXlIWvAFBkIRSMqWGJX82B95x8ZlRLVA=; b=OMHxe0sNsBDrG2
	zml1HyKs/J4ZT8xjVuCqPab9P/8HMim1nXgnEWSbsgbfotxIsSXMyopFXKj9VMCKUP39ScOajN5B2
	QGH2KLHXS1Je9uL5V7k9uZpR5N9deHn+ZCeWIzXLEFfheGSsp6k+AlF0h+cSjTnNSaU5EldT7X9OC
	1XSHeKQ48OIb305UWtdmo7VAdYeOJB4B+v/AUsUnkROoaxlvaILPLVjRZ2pSzX/k+XqvnWJYiMBSo
	XZeaOQjI18reuGq4vp1hfxfWCdXnO/H2tq3Ln+X7oXU5IWdAiqoFiYTxyqn5pmFOfe0EZo1sD8Bds
	YomFxDr+0MqlPwu4zB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywsH-00DifZ-DS; Wed, 08 Jun 2022 14:41:33 +0000
Received: from forward500j.mail.yandex.net ([5.45.198.250])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywsD-00Diaw-0I
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 14:41:32 +0000
Received: from myt5-ca6a6e6c0c8f.qloud-c.yandex.net (myt5-ca6a6e6c0c8f.qloud-c.yandex.net [IPv6:2a02:6b8:c12:3b1a:0:640:ca6a:6e6c])
	by forward500j.mail.yandex.net (Yandex) with ESMTP id E12756CB67AF;
	Wed,  8 Jun 2022 17:41:14 +0300 (MSK)
Received: from myt6-016ca1315a73.qloud-c.yandex.net (myt6-016ca1315a73.qloud-c.yandex.net [2a02:6b8:c12:4e0e:0:640:16c:a131])
	by myt5-ca6a6e6c0c8f.qloud-c.yandex.net (mxback/Yandex) with ESMTP id jHhEC4bm6W-fBg4bMNT;
	Wed, 08 Jun 2022 17:41:14 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1654699274;
	bh=kbcWG7z8hVYH/9ji+sJIvTclsAnw9XhdMRAxX2veCeY=;
	h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
	b=d+FYZIQfI623WY4DWp0DvX/qyw9CAjhvrgGyXVEBveQVm2xFf/8wfbjM0Ve6JjP5c
	 I+W0AufQYClhW2qe6tNXClkucR4AUecvdGN+aEsB1dIg0PBObMWJn3Aemclkq7/nKU
	 +sRET8c3nyVnamnYBb9Gi8jp/vrWG+ausqsvvH8Y=
Authentication-Results: myt5-ca6a6e6c0c8f.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt6-016ca1315a73.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id biE6ZnHqZS-fAMuNMp1;
	Wed, 08 Jun 2022 17:41:10 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Date: Wed, 8 Jun 2022 17:41:07 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: John Garry <john.garry@huawei.com>
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>, =?UTF-8?B?Sm/Do28g?=
 =?UTF-8?B?TcOhcmlv?= Domingos <joao.mario@tecnico.ulisboa.pt>, Nikita
 Shubin <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-perf-users@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v3 3/4] RISC-V: Added generic pmu-events mapfile
Message-ID: <20220608174107.7b94e545@redslave.neermore.group>
In-Reply-To: <9e981523-6032-fd24-08f9-0ef771cd1c2e@huawei.com>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
	<20220607131648.29439-4-nikita.shubin@maquefel.me>
	<9e981523-6032-fd24-08f9-0ef771cd1c2e@huawei.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_074129_432608_0D48A07D 
X-CRM114-Status: GOOD (  20.08  )
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

SGVsbG8sIEpvaG4uCgpPbiBXZWQsIDggSnVuIDIwMjIgMTE6NDU6NTMgKzAxMDAKSm9obiBHYXJy
eSA8am9obi5nYXJyeUBodWF3ZWkuY29tPiB3cm90ZToKCj4gT24gMDcvMDYvMjAyMiAxNDoxNiwg
TmlraXRhIFNodWJpbiB3cm90ZToKPiA+IEZyb206IEpvw6NvIE3DoXJpbyBEb21pbmdvcyA8am9h
by5tYXJpb0B0ZWNuaWNvLnVsaXNib2EucHQ+Cj4gPiAKPiA+IFRoZSBwbXUtZXZlbnRzIG5vdyBz
dXBwb3J0cyBjdXN0b20gZXZlbnRzIGZvciBSSVNDLVYsIHBsdXMgdGhlCj4gPiBjeWNsZSwgdGlt
ZSBhbmQgaW5zdHJldCBldmVudHMgd2VyZSBkZWZpbmVkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKb8OjbyBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0Pgo+
ID4gVGVzdGVkLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+Cj4gPiAtLS0K
PiA+ICAgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YgIHwgMTQg
KysrKysrKysrKysrKwo+ID4gICAuLi4vcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jpc2N2LWdlbmVy
aWMuanNvbiAgfCAyMAo+ID4gKysrKysrKysrKysrKysrKysrKyAyIGZpbGVzIGNoYW5nZWQsIDM0
IGluc2VydGlvbnMoKykKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2
ZW50cy9hcmNoL3Jpc2N2L21hcGZpbGUuY3N2Cj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4g
dG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29uCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxl
LmNzdgo+ID4gYi90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi40ZjJhYTE5OWQ5Y2IK
PiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jp
c2N2L21hcGZpbGUuY3N2Cj4gPiBAQCAtMCwwICsxLDE0IEBACj4gPiArIyBGb3JtYXQ6Cj4gPiAr
IwlNSURSLFZlcnNpb24sSlNPTi9maWxlL3BhdGhuYW1lLFR5cGUKPiA+ICsjCj4gPiArIyB3aGVy
ZQo+ID4gKyMJTUlEUglQcm9jZXNzb3IgdmVyc2lvbiAgCj4gCj4gQVJNLCBubz8KCkkndmUgbWVz
c2VkIHdpdGggLS1jYy1jbWQgYmFkbHkgYW5kIGRpZG4ndCBpbmNsdWRlIGV2ZXJ5IG9uZSBpbiBj
b3ZlcgpsZXR0ZXIsIHNvcnJ5IGZvciB0aGF0LCBhdHRhY2hpbmcgbGluayB0byBjb3ZlciBsZXR0
ZXI6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA2MDcxMzE2NDguMjk0MzktMS1u
aWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lLwoKVGhleSBhcmUgQVJNIGluc3BpcmVkIGluZGVlZC4K
Cgo+IAo+ID4gKyMJCVZhcmlhbnRbMjM6MjBdIGFuZCBSZXZpc2lvbiBbMzowXSBzaG91bGQgYmUg
emVyby4KPiA+ICsjCVZlcnNpb24gY291bGQgYmUgdXNlZCB0byB0cmFjayB2ZXJzaW9uIG9mIEpT
T04gZmlsZQo+ID4gKyMJCWJ1dCBjdXJyZW50bHkgdW51c2VkLgo+ID4gKyMJSlNPTi9maWxlL3Bh
dGhuYW1lIGlzIHRoZSBwYXRoIHRvIEpTT04gZmlsZSwgcmVsYXRpdmUKPiA+ICsjCQl0byB0b29s
cy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi8uCj4gPiArIwlUeXBlIGlzIGNvcmUsIHVuY29y
ZSBldGMKPiA+ICsjCj4gPiArIwo+ID4gKyNGYW1pbHktbW9kZWwsVmVyc2lvbixGaWxlbmFtZSxF
dmVudFR5cGUKPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNj
di9yaXNjdi1nZW5lcmljLmpzb24KPiA+IGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlz
Y3YvcmlzY3YtZ2VuZXJpYy5qc29uIG5ldyBmaWxlIG1vZGUKPiA+IDEwMDY0NCBpbmRleCAwMDAw
MDAwMDAwMDAuLjAxM2U1MGVmYWQ5OQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvdG9vbHMv
cGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29uICAKPiAKPiB3aGVy
ZSBvciBob3cgYXJlIHRoZXNlIHJlZmVyZW5jZWQ/CgpDdXJyZW50bHkgdGhleSBhcmUgbm90IHJl
ZmVyZW5jZWQgaW4gdGhpcyB2ZXJzaW9uIG9mIHNlcmllcyBhdCBhbGwsCnRoZWlyIHB1cnBvc2Ug
aXMgdG8gYmUgdXNlZCBsaWtlICJBcmNoU3RkRXZlbnQiLgoKVGhyb3VnaCBhbnkgUklTQ1YgaW1w
bGVtZW50YXRpb24gc2hvdWxkIGhhdmUgYXQgbGVhc3QgdGhlc2UgMyBldmVudHMuCgpZb3VycywK
TmlraXRhIFNodWJpbi4KCj4gCj4gPiBAQCAtMCwwICsxLDIwIEBACj4gPiArWwo+ID4gKyAgewo+
ID4gKyAgICAiUHVibGljRGVzY3JpcHRpb24iOiAiQ1BVIEN5Y2xlcyIsCj4gPiArICAgICJFdmVu
dENvZGUiOiAiMHgwMCIsCj4gPiArICAgICJFdmVudE5hbWUiOiAicmlzY3ZfY3ljbGVzIiwKPiA+
ICsgICAgIkJyaWVmRGVzY3JpcHRpb24iOiAiQ1BVIGN5Y2xlcyBSSVNDLVYgZ2VuZXJpYyBjb3Vu
dGVyIgo+ID4gKyAgfSwKPiA+ICsgIHsKPiA+ICsgICAgIlB1YmxpY0Rlc2NyaXB0aW9uIjogIkNQ
VSBUaW1lIiwKPiA+ICsgICAgICAiRXZlbnRDb2RlIjogIjB4MDEiLAo+ID4gKyAgICAgICJFdmVu
dE5hbWUiOiAicmlzY3ZfdGltZSIsCj4gPiArICAgICAgIkJyaWVmRGVzY3JpcHRpb24iOiAiQ1BV
IHRpbWUgUklTQy1WIGdlbmVyaWMgY291bnRlciIKPiA+ICsgIH0sCj4gPiArICB7Cj4gPiArICAg
ICJQdWJsaWNEZXNjcmlwdGlvbiI6ICJDUFUgSW5zdHJ1Y3Rpb25zIiwKPiA+ICsgICAgICAiRXZl
bnRDb2RlIjogIjB4MDIiLAo+ID4gKyAgICAgICJFdmVudE5hbWUiOiAicmlzY3ZfaW5zdHJldCIs
Cj4gPiArICAgICAgIkJyaWVmRGVzY3JpcHRpb24iOiAiQ1BVIHJldGlyZWQgaW5zdHJ1Y3Rpb25z
IFJJU0MtViBnZW5lcmljCj4gPiBjb3VudGVyIgo+ID4gKyAgfQo+ID4gK10KPiA+IFwgTm8gbmV3
bGluZSBhdCBlbmQgb2YgZmlsZSAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
