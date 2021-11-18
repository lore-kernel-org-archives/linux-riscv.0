Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BC7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 08:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C9461B3A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 08:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0C9461B3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvyipDgXHQTlvbgwOMt0A+5+eEcRZokuZlLW0jDUwpo=; b=pLFcqC9lEO3831
	rfBgUf2Du6H9dkr136dfi+oTctGzmKZrhQA5znEmn13QqilRzR782boDHnLJZINiDxo81imE47I9O
	rsOsJXZ6MaHDmUvqWnN6+BziHAJdl4+6yXxSU/vZD1I4fsr7r6HG2LC6mt0bM4LMHPd6bzZUOooGG
	mO5F+GoKgIzTk1XPthu6FUBN/AsYBU22V5VlVrHmYqajvONvR/puHbzFcl1Zwz3MIvCMQhodQ3jxZ
	WnmHZD0oxde0geVzqNdJ8Ojljzl5E60RLJgUNgVLLBYW+pu2gezoWMzanJNEHnx5eiPKesiziEZy1
	JU8Hf/y+Z+oZU64qHXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mncLI-0079Rk-20; Thu, 18 Nov 2021 08:00:24 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mncLE-0079RB-De
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 08:00:23 +0000
Received: by mail-yb1-xb32.google.com with SMTP id i194so15536921yba.6
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 00:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cjaIdqH3Tr5wRO+7pUjhME8zDn2Y1gx66Mdaqk0LMXw=;
 b=BDEos3WFMMkIzvikWSc2hxoEvZf5YobiXPHnx/CogOjLlU9zvCJEaVkno52MncNCZl
 aCnYEHS5cyOo69srTchbw/DBSgrcKwLO6VH8tQvHnx0PWExOjvifdRyl9p8RCt1/UQRQ
 xbvWBY9B53jLsHGGSvWeCw1SPtMIc2Tgj0Vp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cjaIdqH3Tr5wRO+7pUjhME8zDn2Y1gx66Mdaqk0LMXw=;
 b=6rm/RqnIRdED/AcJ7JUMUbrwqfIy0rbcewkmBkKV1ZErHIbL+LBVWooYbW3d8VfK4R
 3LhOLJOOT2VebCEwq3cpi15ysn9XYCS5G0BpmeiDL0G74bm7BNuvuSUnqVMlcUolQbNf
 iksThjl37UEWCpmdSEjS1Jihq+QB7+gaqAeW1G5gcF/N1kSTLO9gpY/+pc12wP2oEL1v
 HrhMBjatVyNCgg8QqBrlxxKKoam9iVmEG5pkobsPTm1BsAE0ZQygnUT85GXLZQHpyWqk
 jOGHtg/vsGFku6qQMw2fHbSkTjhG3Xnwfr+H06k9C/luRkC3x23rp7fVdAIGU0xVYdmf
 AOJA==
X-Gm-Message-State: AOAM532ggiw1GsZBGhSIdqmLYg9CpCecvdaMhCWDbfpRPHidLztnqJfF
 ULK7tKRIvnJBomfVLLP+9Qh+vPrGtiA94WowVsu1
X-Google-Smtp-Source: ABdhPJx07/LcqbbSErcbqb+J/eUhxLNdmi5vtb7PCUDuzboEmMSk2zUm/CdNYM5PduSmAs/4a/I8gCHE22+xO3ZFAnc=
X-Received: by 2002:a5b:98e:: with SMTP id c14mr25462051ybq.458.1637222419667; 
 Thu, 18 Nov 2021 00:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
 <20211117152523.66f4ee8e@redslave.neermore.group>
In-Reply-To: <20211117152523.66f4ee8e@redslave.neermore.group>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 18 Nov 2021 00:00:09 -0800
Message-ID: <CAOnJCULUmmtr=n3yB2e1x_DtyRGTZxVLW-OZOy2aWHS=nOK2gw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce pmu-events support for HiFive Unmatched
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: =?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_000021_702609_0972A6FE 
X-CRM114-Status: GOOD (  23.70  )
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

T24gV2VkLCBOb3YgMTcsIDIwMjEgYXQgNDoyNSBBTSBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1
YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPgo+IE9uIFR1ZSwgMTYgTm92IDIwMjEgMTU6NDg6MDgg
KzAwMDAKPiBKb8OjbyBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9h
LnB0PiB3cm90ZToKPgo+IEhlbGxvIE1hcmlvIQo+Cj4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNo
IHNlcmllcy4KPgo+IEkgaGF2ZSByZXByb2R1Y2VkIHlvdXIgdGVzdCB3aXRoIHNvbWUgdS1ib290
IGR0cyB0aW5rZXJpbmcsIGFuZCBnb3QKPiBzaW1pbGFyIHJlc3VsdHMuCj4KPiBIb3dldmVyLAo+
Cj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9hdGlzaHAwNC9vcGVuc2JpL3RyZWUvcG11
X3NzY29mcG1mX3YyCj4KPiBPcGVuU0JJIHNzY29mcG1mIGhhcyBiZWVuIG1lcmdlZC4KPgo+ID4g
WzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9hdGlzaHAwNC91LWJvb3QvdHJlZS9oaWZpdmVfdW5tYXRj
aGVkX2R0X3BtdQo+ID4gWzVdCj4gPiBodHRwczovL2dpdGh1Yi5jb20vYXRpc2hwMDQvdS1ib290
L2Jsb2IvaGlmaXZlX3VubWF0Y2hlZF9kdF9wbXUvYXJjaC9yaXNjdi9kdHMvZnU3NDAtYzAwMC5k
dHNpCj4KPiBJcyBtaXNzaW5nIHRoZSBhZGFwdGF0aW9uIGZvciBPcGVuU0JJIGJpdG1hcCBwYXRj
aCBmb3IKPiAicmF3LWV2ZW50LXRvLW1ocG1jb3VudGVycyIuCgpNeSBwYXRjaCB3YXMganVzdCBh
biBleGFtcGxlIGFuZCBwcmVkYXRlcyBiZWZvcmUgdGhlIGJpdG1hcCBwYXRjaApwb3N0ZWQgYnkg
VmluY2VudC4KSSB3aWxsIHVwZGF0ZSB0aGUgVS1ib290IHBhdGNoIGFsb25nIHdpdGggdGhlIG5l
eHQga2VybmVsIHZlcnNpb24uCgo+Cj4gPiBbM10gaHR0cHM6Ly9naXRodWIuY29tL2F0aXNocDA0
L2xpbnV4L3RyZWUvcmlzY3ZfcG11X3Y0Cj4KPiBUaGUgbGluayBpcyBicm9rZW4uCj4KClNvcnJ5
LiBUaGlzIHNob3VsZCBiZQpodHRwczovL2dpdGh1Yi5jb20vYXRpc2hwMDQvbGludXgvdHJlZS9z
YmlfcG11X3Y0Cgo+ID4gWzRdCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1h
aWwvbGludXgtcmlzY3YvMjAyMS1PY3RvYmVyLzAwOTQwOC5odG1sCj4KPiA+IFs2XQo+ID4gaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L29wZW5zYmkvcGF0Y2gvMjAyMTExMDUw
MTMzMDEuMjc2NTYtMS12aW5jZW50LmNoZW5Ac2lmaXZlLmNvbS8KPiA+Cj4KPiBUaGVyZSBpcyBh
IHZlcnNpb24gMiBzdWJtaXR0ZWQsIGFuZCBpdCB3b24ndCBhcHBseSBhcyByZXF1aXJlIHJlYmFz
aW5nCj4gYW5kIHNvbWUgcmVuYW1pbmcuCj4KPiBQbGVhc2Ugc2hhcmUgeW91ciB1LWJvb3QgZHRz
IGNoYW5nZXMgLSB0aGV5IHNob3VsZCBiZSBzbWFsbCBhbmQgcHJvdmlkZQo+IGEgY29tbW9uIGJh
c2UgZm9yIHRoaXMgc2VyaWVzLgo+CgpZZXMuIFRoYXQgd291bGQgYmUgcmVhbGx5IGhlbHBmdWwg
dG8gaGF2ZSBhIERUIHBhdGggd2l0aCBhbGwgdGhlCmVudHJpZXMgZm9yIGVhc2llciB0ZXN0aW5n
LgoKCj4gVGVzdGVkLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+Cj4KPiA+
IFNpZ25lZC1vZmYtYnk6IEpvw6NvIE3DoXJpbyBEb21pbmdvcyA8am9hby5tYXJpb0B0ZWNuaWNv
LnVsaXNib2EucHQ+Cj4gPgo+ID4gVGhpcyB3b3JrIHdhcyBkZXZlbG9wZWQgYXQgSU5FU0MtSUQs
IEluc3RpdHV0byBTdXBlcmlvciBUw6ljbmljbywKPiA+IFVuaXZlcnNpZGFkZSBkZSBMaXNib2Eu
Cj4gPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gICAtIEZpeCBjb21waWxhdGlvbiBl
cnJvcnMgYW5kIHdhcm5pbmdzCj4gPiAgIC0gUmVtb3ZlIHNwYWNlIGlkZW50cwo+ID4gICAtIENv
cnJlY3QgZm9ybWF0dGluZwoKCgo+ID4KPiA+IEpvw6NvIE3DoXJpbyBEb21pbmdvcyAoNCk6Cj4g
PiAgIFJJU0MtVjogQ3JlYXRlIHVuaXF1ZSBpZGVudGlmaWNhdGlvbiBmb3IgU29DIFBNVQo+ID4g
ICBSSVNDLVY6IFN1cHBvcnQgQ1BVSUQgZm9yIHJpc2MtdiBpbiBwZXJmCj4gPiAgIFJJU0MtVjog
QWRkZWQgZ2VuZXJpYyBwbXUtZXZlbnRzIG1hcGZpbGUKPiA+ICAgUklTQy1WOiBBZGRlZCBIaUZp
dmUgVW5tYXRjaGVkIFBNVSBldmVudHMKPiA+Cj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKwo+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUu
YyAgICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysKPiA+ICBkcml2ZXJzL3BlcmYvcmlzY3Zf
cG11X3NiaS5jICAgICAgICAgICAgICAgICAgfCA0NyArKysrKysrKysrCj4gPiAgdG9vbHMvcGVy
Zi9hcmNoL3Jpc2N2L3V0aWwvQnVpbGQgICAgICAgICAgICAgIHwgIDEgKwo+ID4gIHRvb2xzL3Bl
cmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jICAgICAgICAgICB8IDY2ICsrKysrKysrKysrKysK
PiA+ICB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdiAgfCAxNSAr
KysKPiA+ICAuLi4vcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jpc2N2LWdlbmVyaWMuanNvbiAgfCAy
MCArKysrCj4gPiAgLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9pbnN0cnVjdGlvbnMuanNvbiAg
IHwgOTIKPiA+ICsrKysrKysrKysrKysrKysrKysgLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9t
ZW1vcnkuanNvbiAgICAgICAgIHwKPiA+IDMyICsrKysrKysgLi4uL2FyY2gvcmlzY3Yvc2lmaXZl
L3U3NC9taWNyb2FyY2guanNvbiAgICAgIHwgNTcKPiA+ICsrKysrKysrKysrKyAxMCBmaWxlcyBj
aGFuZ2VkLCAzNTEgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9w
ZXJmL2FyY2gvcmlzY3YvdXRpbC9oZWFkZXIuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdgo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NAo+ID4gdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJp
Yy5qc29uIGNyZWF0ZSBtb2RlCj4gPiAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gv
cmlzY3Yvc2lmaXZlL3U3NC9pbnN0cnVjdGlvbnMuanNvbgo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0
Cj4gPiB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zaWZpdmUvdTc0L21lbW9yeS5q
c29uIGNyZWF0ZSBtb2RlCj4gPiAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlz
Y3Yvc2lmaXZlL3U3NC9taWNyb2FyY2guanNvbgo+ID4KPgo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCgotLSAKUmVnYXJkcywKQXRpc2gK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
