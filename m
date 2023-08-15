Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D4FC0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/N8ymCfOMjveJ8wgawGkWwgeO1ZN3SZv0mGhbONOyg=; b=V0Ed8gECsP+aRh
	/qyCS6FeClxEFdCOM5lvPzesDT2NJzq/wlImXt7BH9uJH8Z6ZJVeE/ueTpxW6u/HyqgnY+PMaVkqK
	4292Mn0i1OLQ9HCHdlNE0ZlrvG8u2/0EEUVAyr5CI+Hd+rMSXeAROx41C2ffuaSLEc/k5P8KpXYFi
	PbrlkAnoq36f1bRQgdZV/KBm+oC4eCFluMKFmLVRM+sl14lh7WPMZ1GgrG3GELavu3LBW0nakihHj
	Q+PNJDQ7uiWbnjC/Df7XsMuoguI3SlgepyeinD8gNT3BgYBqHFJtP8BCIdhzg/gUQZyl5YidAjeX9
	E/1ScvaCH+3V9Bd456Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzEK-002Et6-17;
	Tue, 15 Aug 2023 18:57:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzEH-002Esn-20;
	Tue, 15 Aug 2023 18:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6q9H0EGIZdYIA1aw018Rfdr2C7CsA37nWOPa7IWAobY=; b=gzZgc+te6gl6DdvYFn5xVxPLpf
	9qSI8Yp3DgXR+GvT7SwQlPQ0Pim/wjFsygFqEQR+StLe+KJC8U2oH/rJibqHBgehmVOztTaigK6Qa
	J3zOYTMuxvKRMK7BDLxgR+XftSTTY5XHDq6+/LOeqaPUebT0XJSgpf2wQUS8GWJxPIEdvTHx4ZRzG
	aibjqakeKB7vSdDjrJqeuS7F00PcK5Ecjv8qQcx10ofwT4BjSGHxLtUJL0Q3bwnLmbvvOtjtjXN2S
	s46fkK0FXS1IH6x+eMYFD2Zqev+euaIzimPacKT1kh26kzzqwOxS5DWH+5BqTlJi2S4Y4Bd1OIgyc
	RxNv6PUA==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzEG-00C2IE-0J;
	Tue, 15 Aug 2023 18:57:20 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 93785404DF; Tue, 15 Aug 2023 15:57:17 -0300 (-03)
Date: Tue, 15 Aug 2023 15:57:17 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Leo Yan <leo.yan@linaro.org>, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/6] perf parse-regs: Refactor architecture functions
Message-ID: <ZNvKjeFkXY8ezf9e@kernel.org>
References: <20230606014559.21783-1-leo.yan@linaro.org>
 <CAP-5=fV1m440mKc0R=m5C4N2NtoiixchtnpX2eR3PA_5hXbqEQ@mail.gmail.com>
 <ZNvCxM/ULdUfzHtR@kernel.org>
 <ZNvHx+KxIL6JzEl/@kernel.org>
 <ZNvJdsVmmAWLmfH6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNvJdsVmmAWLmfH6@kernel.org>
X-Url: http://acmel.wordpress.com
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

RW0gVHVlLCBBdWcgMTUsIDIwMjMgYXQgMDM6NTI6MzhQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIGVzY3JldmV1Ogo+IEVtIFR1ZSwgQXVnIDE1LCAyMDIzIGF0IDAzOjQ1OjI3UE0g
LTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyBlc2NyZXZldToKPiA+ID4gQWdyZWVkLCBh
cHBsaWVkIHRvIHBlcmYtdG9vbHMtbmV4dCwgc29ycnkgZm9yIHRoZSBkZWxheS4KPiA+IAo+ID4g
SGFkIHRvIGFkZCB0aGlzIHRvIG1ha2UgJ3BlcmYgdGVzdCBweXRob24nIHRvIHdvcmsuIFBsZWFz
ZSBydW4gJ3BlcmYKPiA+IHRlc3QnIGJlZm9yZSBzZW5kaW5nIHBhdGNoZXMuCj4gCj4gT25lIG1v
cmUsIHBsZWFzZSBhbHNvIGRvIGEgJ21ha2UgLUMgdG9vbHMvcGVyZiBidWlsZC10ZXN0Jywgd2l0
aCBpdCBJCj4gY2F1Z2h0IHRoaXM6Cj4gCj4gICAgICAgICAgbWFrZV9ub19saWJ1bndpbmRfTzog
Y2QgLiAmJiBtYWtlIE5PX0xJQlVOV0lORD0xIEZFQVRVUkVTX0RVTVA9L3Zhci9ob21lL2FjbWUv
Z2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QIC1q
MzIgTz0vdG1wL3RtcC55ZUVHeVFxMkhSIERFU1RESVI9L3RtcC90bXAuSVRnb08xNmpqSAo+IGNk
IC4gJiYgbWFrZSBOT19MSUJVTldJTkQ9MSBGRUFUVVJFU19EVU1QPS92YXIvaG9tZS9hY21lL2dp
dC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAtajMy
IE89L3RtcC90bXAueWVFR3lRcTJIUiBERVNURElSPS90bXAvdG1wLklUZ29PMTZqakgKCisjaW5j
bHVkZSAidXRpbC9lbnYuaCIKCkFzIG5vdyB3ZSBuZWVkIGl0IGZvciBwZXJmX2Vudl9fYXJjaCh1
aS0+bWFjaGluZS0+ZW52KQogCj4gICBDQyAgICAgIC90bXAvdG1wLnllRUd5UXEySFIvdXRpbC9l
eHByLWZsZXgubwo+IHV0aWwvdW53aW5kLWxpYmR3LmM6IEluIGZ1bmN0aW9uIOKAmG1lbW9yeV9y
ZWFk4oCZOgo+IHV0aWwvdW53aW5kLWxpYmR3LmM6MTczOjI4OiBlcnJvcjogaW1wbGljaXQgZGVj
bGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcGVyZl9lbnZfX2FyY2jigJkgWy1XZXJyb3I9aW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAxNzMgfCAgICAgICAgIGNvbnN0IGNoYXIgKmFy
Y2ggPSBwZXJmX2Vudl9fYXJjaCh1aS0+bWFjaGluZS0+ZW52KTsKPiAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+Cj4gdXRpbC91bndpbmQtbGliZHcuYzox
NzM6Mjg6IGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiDigJhjb25zdCBjaGFyICrigJkgZnJvbSDi
gJhpbnTigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XZXJy
b3I9aW50LWNvbnZlcnNpb25dCj4gdXRpbC91bndpbmQtbGliZHcuYzogSW4gZnVuY3Rpb24g4oCY
dW53aW5kX19nZXRfZW50cmllc+KAmToKPiB1dGlsL3Vud2luZC1saWJkdy5jOjI1ODoyODogZXJy
b3I6IGluaXRpYWxpemF0aW9uIG9mIOKAmGNvbnN0IGNoYXIgKuKAmSBmcm9tIOKAmGludOKAmSBt
YWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdlcnJvcj1pbnQtY29u
dmVyc2lvbl0KPiAgIDI1OCB8ICAgICAgICAgY29uc3QgY2hhciAqYXJjaCA9IHBlcmZfZW52X19h
cmNoKHVpX2J1Zi5tYWNoaW5lLT5lbnYpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn4KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFz
IGVycm9ycwo+IG1ha2VbNl06ICoqKiBbL3Zhci9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4
dC90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZDo5ODogL3RtcC90bXAueWVFR3lRcTJIUi91dGls
L3Vud2luZC1saWJkdy5vXSBFcnJvciAxCj4gbWFrZVs2XTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4KPiBtYWtlWzVdOiAqKiogWy92YXIvaG9tZS9hY21lL2dpdC9wZXJmLXRv
b2xzLW5leHQvdG9vbHMvYnVpbGQvTWFrZWZpbGUuYnVpbGQ6MTUwOiB1dGlsXSBFcnJvciAyCj4g
bWFrZVs0XTogKioqIFtNYWtlZmlsZS5wZXJmOjY2MjogL3RtcC90bXAueWVFR3lRcTJIUi9wZXJm
LWluLm9dIEVycm9yIDIKPiBtYWtlWzRdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLgo+ICAgQ0MgICAgICAvdG1wL3RtcC55ZUVHeVFxMkhSL3BtdS1ldmVudHMvcG11LWV2ZW50
cy5vCj4gICBMRCAgICAgIC90bXAvdG1wLnllRUd5UXEySFIvcG11LWV2ZW50cy9wbXUtZXZlbnRz
LWluLm8KPiBtYWtlWzNdOiAqKiogW01ha2VmaWxlLnBlcmY6MjM4OiBzdWItbWFrZV0gRXJyb3Ig
Mgo+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6NzA6IGFsbF0gRXJyb3IgMgo+IG1ha2VbMV06ICoq
KiBbdGVzdHMvbWFrZTozMzc6IG1ha2Vfbm9fbGlidW53aW5kX09dIEVycm9yIDEKPiBtYWtlOiAq
KiogW01ha2VmaWxlOjEwMzogYnVpbGQtdGVzdF0gRXJyb3IgMgo+IG1ha2U6IExlYXZpbmcgZGly
ZWN0b3J5ICcvdmFyL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYnCj4g
Cj4gcmVhbAkxbTI5Ljc4NHMKPiB1c2VyCTEwbTQxLjU5N3MKPiBzeXMJMm01NS45NDhzCj4g4qyi
W2FjbWVAdG9vbGJveCBwZXJmLXRvb2xzLW5leHRdJAo+IAo+IEknbSB0cnlpbmcgdG8gZml4Cgot
LSAKCi0gQXJuYWxkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
