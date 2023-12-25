Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ABAC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 21:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFHHXEl1VTdvmhRWscVXRwOuNKq/ccckAtnQpsAnV9o=; b=Gus9BmRPY+hWry
	urRFINeygl6EWVqNmuS3ZzCszxDjH7P2GlBL4L+Ffy7rYgs70EnXv+JFt8GXotLFbWGyf/GFwx72i
	pxDAkIg3HTsYGxdyTKC0FkrGpFaktA+neNLGk2fGakDDda7R1Fzd2I2fBpgun1PaUX1dnlrXbDpVW
	q0Tsc+Bf0Eo2MtEKP8gf/22nI8iVz1xqQGemnDhtYZ+LdfapdS99udfRYqSg+RiXEv06krwkKc4I/
	Cj0fnIXbcTRQOGP1NNyFfItnZKgrUk1P51AGRIHSGtDK8I3jkqiVjJPIYiIfqn/6OmY9aBW7aIA0s
	7DukARFDQ0tS2x0zmLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHsA5-00BHRn-1C;
	Mon, 25 Dec 2023 21:06:57 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHsA0-00BHQu-0b;
	Mon, 25 Dec 2023 21:06:54 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7810c332a2cso345713385a.1;
        Mon, 25 Dec 2023 13:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703538410; x=1704143210; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGDVYoNIIWyiCkgdSSFbUJbJwyQv1O09fglEbTWCQV4=;
        b=lcEYLtoY20t9lQ2cbP6/8vHA+4VncTUWAf7vTV9VkeDUVBAQ32wnID8EoaaL6KV6AL
         KtV6SVKgzgCo6vbn+p2jzaOTComEkfdL1HH43WdMNc3ApVdv0ru5lzQSYiYvVVzUdF1E
         mdnqvxo0eCFPRGrMOJdWT/4EtFMbBP49RvD4qLYNDmzYE/OWm1ckTstSUKG6YV5E3bIj
         aIjcCxxLmaLIA9j56pkZ7FSXxjgATsMAq6VZarGWWKkDqcIiYKdUlx8VNuiwhWPb48Kq
         +Pmqw8QudF2VO5iOA9K9C28AhAVTIYoRI5q5FUCl08A/dCIBaBUjXTaby4fMm3xddRtX
         X3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703538410; x=1704143210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGDVYoNIIWyiCkgdSSFbUJbJwyQv1O09fglEbTWCQV4=;
        b=abOnr4lMU2aQMDqKHkU1ORcC1X/LxcIFcwRfPMDHoS3q4enF1G02M0wpzG/ZQorq3M
         ZZQJ3N53kXYatw1VUbg5LyOQykw6kU6VD7fB+lwkKbdo9BLNMCFNruIA+WNJny4QAmCL
         ch4cCn2YvBNajr6ft+23lVNlramzfNtY4dqvdo2BB//WKtMf7cJYikNhZW/41Rx+U2zC
         tVLUHJMKtGOPl5LPUggGUmJLMusegbKs8WuqiyF6iiQufHFUcS0eWUZBtc/RnqvNeBkM
         E16wg4PsDbyf0RtMi0xEQPik5HJstcuNrWaQLW1Uwg2UDBKms4eIRYqQEbfPPjKVHtGU
         D/sw==
X-Gm-Message-State: AOJu0Yy+JGl6/EpIiUUcvZ7TWZc0uqfkPLgIwRMu+UiIoRbO4eC+H2iE
	C4GUEeX7hgERK7+BriTOAx0LYjuUpvfLlKlIhcI=
X-Google-Smtp-Source: AGHT+IHTfC4IvI32xoqINCBSsocRoTKNzkLjTfpAEtn6LgG4kDC6m58rQ0mR6tMnU/vPvukNQS74BZgTSh6h+p/YqWY=
X-Received: by 2002:a05:620a:14a9:b0:77f:8c54:da15 with SMTP id
 x9-20020a05620a14a900b0077f8c54da15mr7742403qkj.40.1703538409803; Mon, 25 Dec
 2023 13:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20231225103308.1557548-1-peterlin@andestech.com>
In-Reply-To: <20231225103308.1557548-1-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 25 Dec 2023 21:06:04 +0000
Message-ID: <CA+V-a8t7g8ctPQrwdB9tgtmgtGfqQ-k2N-1sSwnjB-b1F71-AQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/16] Support Andes PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_130652_250848_1A72A18C 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTGluLXNhbiwKCk9uIE1vbiwgRGVjIDI1LCAyMDIzIGF0IDEwOjM34oCvQU0gWXUgQ2hpZW4g
UGV0ZXIgTGluCjxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPgo+IEhpIEFsbCwKPgo+
IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgdGhlIEFuZGVzIFBNVSBleHRlbnNpb24sIHdo
aWNoIHNlcnZlcwo+IHRoZSBzYW1lIHB1cnBvc2UgYXMgU3Njb2ZwbWYuIFRvIHVzZSBGRFQtYmFz
ZWQgcHJvYmluZyBmb3IgaGFyZHdhcmUKPiBzdXBwb3J0IG9mIHRoZSBQTVUgZXh0ZW5zaW9ucywg
d2UgZmlyc3QgY29udmVydCBULUhlYWQncyBQTVUgdG8gQ1BVCj4gZmVhdHVyZSBhbHRlcm5hdGl2
ZSwgdGhlbiBhZGQgQW5kZXMgUE1VIGFsdGVybmF0aXZlcy4KPgo+IEl0cyBub24tc3RhbmRhcmQg
bG9jYWwgaW50ZXJydXB0IGlzIGFzc2lnbmVkIHRvIGJpdCAxOCBpbiB0aGUKPiBjdXN0b20gUy1t
b2RlIGxvY2FsIGludGVycnVwdCBlbmFibGUvcGVuZGluZyByZWdpc3RlcnMgKHNsaWUvc2xpcCks
Cj4gd2hpbGUgdGhlIGludGVycnVwdCBjYXVzZSBpcyAoMjU2ICsgMTgpLgo+Cj4gTWFpbmxpbmUg
T3BlblNCSSBoYXMgc3VwcG9ydGVkIEFuZGVzIFBNVSBleHRlbnNpb246Cj4gLSBodHRwczovL2dp
dGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL29wZW5zYmkvdHJlZS9tYXN0ZXIKPiBMaW51eCBw
YXRjaGVzIChiYXNlZCBvbiB2Ni43LXJjNykgY2FuIGJlIGZvdW5kIG9uIEFuZGVzIFRlY2hub2xv
Z3kgR2l0SHViCj4gLSBodHRwczovL2dpdGh1Yi5jb20vYW5kZXN0ZWNoL2xpbnV4L2NvbW1pdHMv
YW5kZXMtcG11LXN1cHBvcnQtdjYKPgo+IFRoZSBQTVUgZGV2aWNlIHRyZWUgbm9kZSB1c2VkIG9u
IEFYNDVNUDoKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNi
aS9ibG9iL21hc3Rlci9kb2NzL3BtdV9zdXBwb3J0Lm1kI2V4YW1wbGUtMwo+Cj4gTG9jdXMgV2Vp
LUhhbiBDaGVuICgxKToKPiAgIHJpc2N2OiBhbmRlczogU3VwcG9ydCBzcGVjaWZ5aW5nIHN5bWJv
bGljIGZpcm13YXJlIGFuZCBoYXJkd2FyZSByYXcKPiAgICAgZXZlbnRzCj4KPiBZdSBDaGllbiBQ
ZXRlciBMaW4gKDE1KToKPiAgIHJpc2N2OiBlcnJhdGE6IFJlbmFtZSBkZWZpbmVzIGZvciBBbmRl
cwo+ICAgaXJxY2hpcC9yaXNjdi1pbnRjOiBBbGxvdyBsYXJnZSBub24tc3RhbmRhcmQgaW50ZXJy
dXB0IG51bWJlcgo+ICAgaXJxY2hpcC9yaXNjdi1pbnRjOiBJbnRyb2R1Y2UgQW5kZXMgaGFydC1s
ZXZlbCBpbnRlcnJ1cHQgY29udHJvbGxlcgo+ICAgZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgQW5k
ZXMgaW50ZXJydXB0IGNvbnRyb2xsZXIgY29tcGF0aWJsZSBzdHJpbmcKPiAgIHJpc2N2OiBkdHM6
IHJlbmVzYXM6IHI5YTA3ZzA0M2Y6IFVwZGF0ZSBjb21wYXRpYmxlIHN0cmluZyB0byB1c2UgQW5k
ZXMKPiAgICAgSU5UQwo+ICAgcGVyZjogUklTQy1WOiBFbGltaW5hdGUgcmVkdW5kYW50IGludGVy
cnVwdCBlbmFibGUvZGlzYWJsZSBvcGVyYXRpb25zCj4gICBSSVNDLVY6IE1vdmUgVC1IZWFkIFBN
VSB0byBDUFUgZmVhdHVyZSBhbHRlcm5hdGl2ZSBmcmFtZXdvcmsKPiAgIHBlcmY6IFJJU0MtVjog
SW50cm9kdWNlIEFuZGVzIFBNVSBmb3IgcGVyZiBldmVudCBzYW1wbGluZwo+ICAgZHQtYmluZGlu
Z3M6IHJpc2N2OiBBZGQgVC1IZWFkIFBNVSBleHRlbnNpb24gZGVzY3JpcHRpb24KPiAgIGR0LWJp
bmRpbmdzOiByaXNjdjogQWRkIEFuZGVzIFBNVSBleHRlbnNpb24gZGVzY3JpcHRpb24KPiAgIHJp
c2N2OiBkdHM6IGFsbHdpbm5lcjogQWRkIFQtSGVhZCBQTVUgZXh0ZW5zaW9uIGZvciBzdW4yMGkt
ZDFzCj4gICByaXNjdjogZHRzOiBzb3BoZ286IEFkZCBULUhlYWQgUE1VIGV4dGVuc2lvbiBmb3Ig
Y3YxODAwYgo+ICAgcmlzY3Y6IGR0czogc29waGdvOiBBZGQgVC1IZWFkIFBNVSBleHRlbnNpb24g
Zm9yIHNnMjA0Mgo+ICAgcmlzY3Y6IGR0czogdGhlYWQ6IEFkZCBULUhlYWQgUE1VIGV4dGVuc2lv
biBmb3IgdGgxNTIwCj4gICByaXNjdjogZHRzOiByZW5lc2FzOiBBZGQgQW5kZXMgUE1VIGV4dGVu
c2lvbiBmb3IgcjlhMDdnMDQzZgo+ClRoZSBhYm92ZSBwYXRjaGVzIGRvbnQgYXBwbHkgY2xlYW5s
eSBvbiB0b3Agb2YgYmVsb3cgYnJhbmNoZXMuIENhbiB5b3UKcGxlYXNlIHJlYmFzZSBhbmQgcmUt
c2VuZC4KCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Bh
bG1lci9saW51eC5naXQvbG9nLz9oPWZpeGVzCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3BhbG1lci9saW51eC5naXQvbG9nLz9oPWZvci1uZXh0Cmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dlZXJ0L3JlbmVzYXMt
ZGV2ZWwuZ2l0L2xvZy8/aD1yZW5lc2FzLWR0cy1mb3ItdjYuOAoKQ2hlZXJzLApQcmFiaGFrYXIK
Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCAgICAgICB8ICAgNiAr
LQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAgMTMg
KysKPiAgYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YSAgICAgICAgICAgICAgICAgICAgIHwgIDEz
IC0tCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaSB8ICAg
MiArLQo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpICAgfCAg
IDQgKy0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpICAgICAgIHwg
ICAyICstCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1jcHVzLmR0c2kgICB8
IDEyOCArKysrKysrKystLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1
MjAuZHRzaSAgICAgICAgIHwgICA4ICstCj4gIGFyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0
YS5jICAgICAgICAgICAgICB8ICAxMCArLQo+ICBhcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJh
dGEuYyAgICAgICAgICAgICAgfCAgMTkgLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJy
YXRhX2xpc3QuaCAgICAgICAgICB8ICAxOSArLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oICAgICAgICAgICAgICAgIHwgICAyICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZW5kb3JpZF9saXN0LmggICAgICAgIHwgICAyICstCj4gIGFyY2gvcmlzY3Yva2VybmVsL2FsdGVy
bmF0aXZlLmMgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWludGMuYyAgICAgICAgICAgICAgfCAgODkgKysrKysrKysrKy0tCj4gIGRyaXZlcnMvcGVy
Zi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyNyArKysrCj4gIGRyaXZlcnMv
cGVyZi9yaXNjdl9wbXVfc2JpLmMgICAgICAgICAgICAgICAgICB8ICA0NyArKysrKy0tCj4gIGlu
Y2x1ZGUvbGludXgvc29jL2FuZGVzL2lycS5oICAgICAgICAgICAgICAgICB8ICAxOCArKysKPiAg
Li4uL2FyY2gvcmlzY3YvYW5kZXMvYXg0NS9maXJtd2FyZS5qc29uICAgICAgIHwgIDY4ICsrKysr
KysrKysKPiAgLi4uL2FyY2gvcmlzY3YvYW5kZXMvYXg0NS9pbnN0cnVjdGlvbnMuanNvbiAgIHwg
MTI3ICsrKysrKysrKysrKysrKysrCj4gIC4uLi9hcmNoL3Jpc2N2L2FuZGVzL2F4NDUvbWVtb3J5
Lmpzb24gICAgICAgICB8ICA1NyArKysrKysrKwo+ICAuLi4vYXJjaC9yaXNjdi9hbmRlcy9heDQ1
L21pY3JvYXJjaC5qc29uICAgICAgfCAgNzcgKysrKysrKysrKysKPiAgdG9vbHMvcGVyZi9wbXUt
ZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YgIHwgICAxICsKPiAgMjQgZmlsZXMgY2hhbmdl
ZCwgNTkyIGluc2VydGlvbnMoKyksIDE1MSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvbGludXgvc29jL2FuZGVzL2lycS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9hbmRlcy9heDQ1L2Zpcm13YXJlLmpzb24K
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L2Fu
ZGVzL2F4NDUvaW5zdHJ1Y3Rpb25zLmpzb24KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Bl
cmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L2FuZGVzL2F4NDUvbWVtb3J5Lmpzb24KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L2FuZGVzL2F4NDUv
bWljcm9hcmNoLmpzb24KPgo+IC0tCj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
