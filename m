Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6094C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 17:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFziBA/tHD8XjnNYnu0B0LM5moSMbzlNVz7WuM/couU=; b=c19kvEMbO+aVQ/
	oAGShGXG3mCNnxSlog3F3kstxYp6n3SU4u6WojmmkhoIEleRXJjVc83LsGH9t9ID8c5fu6NosOD3/
	Gty0LlIipiW8EBntMaso+gjkQ81hcxeIfVrt/lwh799bPQA8aKykTg6+mxchkJEeVXUsbHZit8fGj
	Dqfq3WTyWEGsJ0P+Kr9CHs7FnjJqYRjYkumHJvLO5ppv5nQOM0SGJzWNGXyII0nLoK7bZXCpvAJqA
	vniBj1QdnZfQ5utEc+SW2v9o9f1pJj6icKeYNPfnqjaYM/vrzDR88JYbZ17t1pr9xfCDZUWW7r2s6
	ICxASKVGSwpbXgkBPWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICSB-0025oU-Ec; Wed, 18 Jan 2023 17:42:27 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICS7-0025lX-NO
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 17:42:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id bk15so27567058ejb.9
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 09:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpEuzue5d7ygPxB29FruCUnMnsWzWZ3lXy2MX+rDytc=;
        b=W4GyWlsm8ALFRSIsMwvrTySOOS9hTBdV1OpvndBADGEMCQmWskkBoGTZ10dO14lWCf
         9s1n4M/XC9OkFc3nvfoiyyKAMYrMlPJ0ppYyY+z8s2eN1loLgOBwv4z6v+2FLlrF90bv
         6ZQb0cEa3IV6p0ZdEwQIujwy2ozbVyqJAY7e6Yk5uyW9Llgr7+WvB5XW3wcqIg/dx2yT
         17z5d97RmSdOjf5TThzOxk0Us4hQ4yEz6sdImR7U3ItWvIdR8t6+FSY2EQHJLxcM+eqW
         5J2agrByKnKRNQN3SrcInPeeW4duGeXWPdMGDvkLB3GJ62GM7FerjTYlFLjh3dYLIy/B
         FVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpEuzue5d7ygPxB29FruCUnMnsWzWZ3lXy2MX+rDytc=;
        b=g9++/oP4+qmBGdUNz8UyKinHQbZdgSwQgvCnOFzfYOa/1G3EfGftFJBDb6KFAAh38L
         aeO9MTbcFLUhl8N0D9P51qVxtZqzLKrLfvpRc4OIfsuke94bemWUYBTIfRTdZoUI4Cmd
         8J5TS93GAJRkZQa6nS6N5/8COsCOLA6y7bY8bCtfbtHlL1+shxOjzjodSISA1Cvfg/mw
         SwjY13fZCNVJ2mg2zRMCR5Q6zzg0wviMmS2ZrSabbPKi2OiXM1ZLUp/IyA5Fs5FdtSFo
         P9T8ca1WdD9WXJhmF0hXPmzktFtvquzhqatgOP6UbbYQ/cdZnsxsm+gN2ejCHf7W3g7X
         Yg0w==
X-Gm-Message-State: AFqh2krj3xSU7RbJdZuWvvHP33yS+qosqCwy2Rr3GZjZ2tvs+6+NGLGY
	ZXJkuA6drtBqKq9+/BoArbzOCGwJNAYtXeCrtv4=
X-Google-Smtp-Source: AMrXdXuMaX0n1Hxu6XGSukmrVfG28F8T8Ib+RkX+SQ8+JvzXGjjDRpkDNnyAZVdVPrYouEW9ECCsgOvI5WFVc49eZlI=
X-Received: by 2002:a17:906:40d7:b0:836:e897:648a with SMTP id
 a23-20020a17090640d700b00836e897648amr470430ejk.94.1674063739084; Wed, 18 Jan
 2023 09:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20230105030614.26842-1-tong@infragraf.org> <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net> <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org> <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org> <d91bbb9e-484b-d43d-e62d-0474ff21cf91@iogearbox.net>
 <7159E8F8-AE66-4563-8A29-D10D66EFAF3D@infragraf.org> <CAADnVQLf_UhRP76i9+OaLGrmuoM942QebMXT3OA3mgrP_UV0KA@mail.gmail.com>
 <d807b7fb-dbd2-8e4c-812c-48a1a01c190e@csgroup.eu>
In-Reply-To: <d807b7fb-dbd2-8e4c-812c-48a1a01c190e@csgroup.eu>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 18 Jan 2023 09:42:07 -0800
Message-ID: <CAADnVQKAAhbL-9qGPfRFsfw3oh6KnrEpeYLnfhrKUSzX8VmFuQ@mail.gmail.com>
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Tonghao Zhang <tong@infragraf.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Hao Luo <haoluo@google.com>, 
	John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>, KP Singh <kpsingh@kernel.org>, 
	Yonghong Song <yhs@fb.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_094223_811325_63DAE32F 
X-CRM114-Status: GOOD (  49.48  )
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

T24gVHVlLCBKYW4gMTcsIDIwMjMgYXQgMTE6MzYgUE0gQ2hyaXN0b3BoZSBMZXJveQo8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPgo+Cj4KPiBMZSAxOC8wMS8yMDIzIMOgIDAz
OjIxLCBBbGV4ZWkgU3Rhcm92b2l0b3YgYSDDqWNyaXQgOgo+ID4gT24gVHVlLCBKYW4gMTcsIDIw
MjMgYXQgNjoxMyBQTSBUb25naGFvIFpoYW5nIDx0b25nQGluZnJhZ3JhZi5vcmc+IHdyb3RlOgo+
ID4+Cj4gPj4KPiA+Pgo+ID4+PiBPbiBKYW4gMTcsIDIwMjMsIGF0IDExOjU5IFBNLCBEYW5pZWwg
Qm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PiB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gMS8x
Ny8yMyAzOjIyIFBNLCBUb25naGFvIFpoYW5nIHdyb3RlOgo+ID4+Pj4+IE9uIEphbiAxNywgMjAy
MywgYXQgMzozMCBQTSwgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1PiB3cm90ZToKPiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBMZSAxNy8wMS8yMDIz
IMOgIDA2OjMwLCBUb25naGFvIFpoYW5nIGEgw6ljcml0IDoKPiA+Pj4+Pj4KPiA+Pj4+Pj4KPiA+
Pj4+Pj4+IE9uIEphbiA5LCAyMDIzLCBhdCA0OjE1IFBNLCBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+Cj4gPj4+
Pj4+Pgo+ID4+Pj4+Pj4gTGUgMDYvMDEvMjAyMyDDoCAxNjozNywgRGFuaWVsIEJvcmttYW5uIGEg
w6ljcml0IDoKPiA+Pj4+Pj4+PiBPbiAxLzUvMjMgNjo1MyBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToKPiA+Pj4+Pj4+Pj4gTGUgMDUvMDEvMjAyMyDDoCAwNDowNiwgdG9uZ0BpbmZyYWdyYWYu
b3JnIGEgw6ljcml0IDoKPiA+Pj4+Pj4+Pj4+IEZyb206IFRvbmdoYW8gWmhhbmcgPHRvbmdAaW5m
cmFncmFmLm9yZz4KPiA+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+PiBUaGUgeDg2XzY0IGNhbid0IGR1
bXAgdGhlIHZhbGlkIGluc24gaW4gdGhpcyB3YXkuIEEgdGVzdCBCUEYgcHJvZwo+ID4+Pj4+Pj4+
Pj4gd2hpY2ggaW5jbHVkZSBzdWJwcm9nOgo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+ICQgbGx2
bS1vYmpkdW1wIC1kIHN1YnByb2cubwo+ID4+Pj4+Pj4+Pj4gRGlzYXNzZW1ibHkgb2Ygc2VjdGlv
biAudGV4dDoKPiA+Pj4+Pj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAgPHN1YnByb2c+Ogo+ID4+Pj4+
Pj4+Pj4gICAgICAgICAgIDA6ICAgICAgIDE4IDAxIDAwIDAwIDczIDc1IDYyIDcwIDAwIDAwIDAw
IDAwIDcyIDZmIDY3IDAwIHIxCj4gPj4+Pj4+Pj4+PiA9IDI5MTE0NDU5OTAzNjUzMjM1IGxsCj4g
Pj4+Pj4+Pj4+PiAgICAgICAgICAgMjogICAgICAgN2IgMWEgZjggZmYgMDAgMDAgMDAgMDAgKih1
NjQgKikocjEwIC0gOCkgPSByMQo+ID4+Pj4+Pj4+Pj4gICAgICAgICAgIDM6ICAgICAgIGJmIGEx
IDAwIDAwIDAwIDAwIDAwIDAwIHIxID0gcjEwCj4gPj4+Pj4+Pj4+PiAgICAgICAgICAgNDogICAg
ICAgMDcgMDEgMDAgMDAgZjggZmYgZmYgZmYgcjEgKz0gLTgKPiA+Pj4+Pj4+Pj4+ICAgICAgICAg
ICA1OiAgICAgICBiNyAwMiAwMCAwMCAwOCAwMCAwMCAwMCByMiA9IDgKPiA+Pj4+Pj4+Pj4+ICAg
ICAgICAgICA2OiAgICAgICA4NSAwMCAwMCAwMCAwNiAwMCAwMCAwMCBjYWxsIDYKPiA+Pj4+Pj4+
Pj4+ICAgICAgICAgICA3OiAgICAgICA5NSAwMCAwMCAwMCAwMCAwMCAwMCAwMCBleGl0Cj4gPj4+
Pj4+Pj4+PiBEaXNhc3NlbWJseSBvZiBzZWN0aW9uIHJhd190cC9zeXNfZW50ZXI6Cj4gPj4+Pj4+
Pj4+PiAwMDAwMDAwMDAwMDAwMDAwIDxlbnRyeT46Cj4gPj4+Pj4+Pj4+PiAgICAgICAgICAgMDog
ICAgICAgODUgMTAgMDAgMDAgZmYgZmYgZmYgZmYgY2FsbCAtMQo+ID4+Pj4+Pj4+Pj4gICAgICAg
ICAgIDE6ICAgICAgIGI3IDAwIDAwIDAwIDAwIDAwIDAwIDAwIHIwID0gMAo+ID4+Pj4+Pj4+Pj4g
ICAgICAgICAgIDI6ICAgICAgIDk1IDAwIDAwIDAwIDAwIDAwIDAwIDAwIGV4aXQKPiA+Pj4+Pj4+
Pj4+Cj4gPj4+Pj4+Pj4+PiBrZXJuZWwgcHJpbnQgbWVzc2FnZToKPiA+Pj4+Pj4+Pj4+IFsgIDU4
MC43NzUzODddIGZsZW49OCBwcm9nbGVuPTUxIHBhc3M9MyBpbWFnZT1mZmZmZmZmZmEwMDBjMjBj
Cj4gPj4+Pj4+Pj4+PiBmcm9tPWtwcm9iZS1sb2FkIHBpZD0xNjQzCj4gPj4+Pj4+Pj4+PiBbICA1
ODAuNzc3MjM2XSBKSVQgY29kZTogMDAwMDAwMDA6IGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNj
IGNjIGNjCj4gPj4+Pj4+Pj4+PiBjYyBjYyBjYyBjYyBjYwo+ID4+Pj4+Pj4+Pj4gWyAgNTgwLjc3
OTAzN10gSklUIGNvZGU6IDAwMDAwMDEwOiBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBjYyBj
Ywo+ID4+Pj4+Pj4+Pj4gY2MgY2MgY2MgY2MgY2MKPiA+Pj4+Pj4+Pj4+IFsgIDU4MC43ODA3Njdd
IEpJVCBjb2RlOiAwMDAwMDAyMDogY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MgY2MKPiA+
Pj4+Pj4+Pj4+IGNjIGNjIGNjIGNjIGNjCj4gPj4+Pj4+Pj4+PiBbICA1ODAuNzgyNTY4XSBKSVQg
Y29kZTogMDAwMDAwMzA6IGNjIGNjIGNjCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gJCBicGZf
aml0X2Rpc2FzbQo+ID4+Pj4+Pj4+Pj4gNTEgYnl0ZXMgZW1pdHRlZCBmcm9tIEpJVCBjb21waWxl
ciAocGFzczozLCBmbGVuOjgpCj4gPj4+Pj4+Pj4+PiBmZmZmZmZmZmEwMDBjMjBjICsgPHg+Ogo+
ID4+Pj4+Pj4+Pj4gICAgICAgMDogICBpbnQzCj4gPj4+Pj4+Pj4+PiAgICAgICAxOiAgIGludDMK
PiA+Pj4+Pj4+Pj4+ICAgICAgIDI6ICAgaW50Mwo+ID4+Pj4+Pj4+Pj4gICAgICAgMzogICBpbnQz
Cj4gPj4+Pj4+Pj4+PiAgICAgICA0OiAgIGludDMKPiA+Pj4+Pj4+Pj4+ICAgICAgIDU6ICAgaW50
Mwo+ID4+Pj4+Pj4+Pj4gICAgICAgLi4uCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gVW50aWwg
YnBmX2ppdF9iaW5hcnlfcGFja19maW5hbGl6ZSBpcyBpbnZva2VkLCB3ZSBjb3B5IHJ3X2hlYWRl
ciB0bwo+ID4+Pj4+Pj4+Pj4gaGVhZGVyCj4gPj4+Pj4+Pj4+PiBhbmQgdGhlbiBpbWFnZS9pbnNu
IGlzIHZhbGlkLiBCVFcsIHdlIGNhbiB1c2UgdGhlICJicGZ0b29sIHByb2cgZHVtcCIKPiA+Pj4+
Pj4+Pj4+IEpJVGVkIGluc3RydWN0aW9ucy4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gTkFDSy4K
PiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gQmVjYXVzZSB0aGUgZmVhdHVyZSBpcyBidWdneSBvbiB4
ODZfNjQsIHlvdSByZW1vdmUgaXQgZm9yIGFsbAo+ID4+Pj4+Pj4+PiBhcmNoaXRlY3R1cmVzID8K
PiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gT24gcG93ZXJwYyBicGZfaml0X2VuYWJsZSA9PSAyIHdv
cmtzIGFuZCBpcyB2ZXJ5IHVzZWZ1bGwuCj4gPj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IExhc3QgdGlt
ZSBJIHRyaWVkIHRvIHVzZSBicGZ0b29sIG9uIHBvd2VycGMvMzIgaXQgZGlkbid0IHdvcmsuIEkg
ZG9uJ3QKPiA+Pj4+Pj4+Pj4gcmVtZW1iZXIgdGhlIGRldGFpbHMsIEkgdGhpbmsgaXQgd2FzIGFu
IGlzc3VlIHdpdGggZW5kaWFuZXNzLiBNYXliZSBpdAo+ID4+Pj4+Pj4+PiBpcyBmaXhlZCBub3cs
IGJ1dCBpdCBuZWVkcyB0byBiZSB2ZXJpZmllZC4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gU28g
cGxlYXNlLCBiZWZvcmUgcmVtb3ZpbmcgYSB3b3JraW5nIGFuZCB1c2VmdWxsIGZlYXR1cmUsIG1h
a2Ugc3VyZQo+ID4+Pj4+Pj4+PiB0aGVyZSBpcyBhbiBhbHRlcm5hdGl2ZSBhdmFpbGFibGUgdG8g
aXQgZm9yIGFsbCBhcmNoaXRlY3R1cmVzIGluIGFsbAo+ID4+Pj4+Pj4+PiBjb25maWd1cmF0aW9u
cy4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gQWxzbywgSSBkb24ndCB0aGluayBicGZ0b29sIGlz
IHVzYWJsZSB0byBkdW1wIGtlcm5lbCBCUEYgc2VsZnRlc3RzLgo+ID4+Pj4+Pj4+PiBUaGF0J3Mg
dml0YWwgd2hlbiBhIHNlbGZ0ZXN0IGZhaWxzIGlmIHlvdSB3YW50IHRvIGhhdmUgYSBjaGFuY2Ug
dG8KPiA+Pj4+Pj4+Pj4gdW5kZXJzdGFuZCB3aHkgaXQgZmFpbHMuCj4gPj4+Pj4+Pj4KPiA+Pj4+
Pj4+PiBJZiB0aGlzIGlzIGFjdGl2ZWx5IHVzZWQgYnkgSklUIGRldmVsb3BlcnMgYW5kIGNvbnNp
ZGVyZWQgdXNlZnVsLCBJJ2QgYmUKPiA+Pj4+Pj4+PiBvayB0byBsZWF2ZSBpdCBmb3IgdGhlIHRp
bWUgYmVpbmcuIE92ZXJhbGwgZ29hbCBpcyB0byByZWFjaCBmZWF0dXJlIHBhcml0eQo+ID4+Pj4+
Pj4+IGFtb25nIChhdCBsZWFzdCBtYWpvciBhcmNoKSBKSVRzIGFuZCBub3QganVzdCBoYXZlIG1v
c3QgZnVuY3Rpb25hbGl0eSBvbmx5Cj4gPj4+Pj4+Pj4gYXZhaWxhYmxlIG9uIHg4Ni02NCBKSVQu
IENvdWxkIHlvdSBob3dldmVyIGNoZWNrIHdoYXQgaXMgbm90IHdvcmtpbmcgd2l0aAo+ID4+Pj4+
Pj4+IGJwZnRvb2wgb24gcG93ZXJwYy8zMj8gUGVyaGFwcyBpdCdzIG5vdCB0b28gbXVjaCBlZmZv
cnQgdG8ganVzdCBmaXggaXQsCj4gPj4+Pj4+Pj4gYnV0IGRldGFpbHMgd291bGQgYmUgdXNlZnVs
IG90aGVyd2lzZSAnaXQgZGlkbid0IHdvcmsnIGlzIHRvbyBmdXp6eS4KPiA+Pj4+Pj4+Cj4gPj4+
Pj4+PiBTdXJlIEkgd2lsbCB0cnkgdG8gdGVzdCBicGZ0b29sIGFnYWluIGluIHRoZSBjb21pbmcg
ZGF5cy4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBQcmV2aW91cyBkaXNjdXNzaW9uIGFib3V0IHRoYXQg
c3ViamVjdCBpcyBoZXJlOgo+ID4+Pj4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjEwNDE1MDkzMjUwLjMzOTEyNTctMS1KaWFubGlu
Lkx2QGFybS5jb20vIzI0MTc2ODQ3PQo+ID4+Pj4+PiBIaSBDaHJpc3RvcGhlCj4gPj4+Pj4+IEFu
eSBwcm9ncmVzcz8gV2UgZGlzY3VzcyB0byBkZXByZWNhdGUgdGhlIGJwZl9qaXRfZW5hYmxlID09
IDIgaW4gMjAyMSwgYnV0IGJwZnRvb2wgY2FuIG5vdCBydW4gb24gcG93ZXJwYy4KPiA+Pj4+Pj4g
Tm93IGNhbiB3ZSBmaXggdGhpcyBpc3N1ZT8KPiA+Pj4+Pgo+ID4+Pj4+IEhpIFRvbmcsCj4gPj4+
Pj4KPiA+Pj4+PiBJIGhhdmUgc3RhcnRlZCB0byBsb29rIGF0IGl0IGJ1dCBJIGRvbid0IGhhdmUg
YW55IGZydWl0ZnVsbCBmZWVkYmFjayB5ZXQuCj4gPj4+Pj4KPiA+Pj4+PiBJbiB0aGUgbWVhbnRp
bWUsIHdlcmUgeW91IGFibGUgdG8gY29uZmlybSB0aGF0IGJwZnRvb2wgY2FuIGFsc28gYmUgdXNl
ZAo+ID4+Pj4+IHRvIGR1bXAgaml0dGVkIHRlc3RzIGZyb20gdGVzdF9icGYua28gbW9kdWxlIG9u
IHg4Nl82NCA/IEluIHRoYXQgY2FuIHlvdQo+ID4+Pj4+IHRlbGwgbWUgaG93IHRvIHByb2NlZWQg
Pwo+ID4+Pj4gTm93IEkgZG8gbm90IHRlc3QsIGJ1dCB3ZSBjYW4gZHVtcCB0aGUgaW5zbiBhZnRl
ciBicGZfcHJvZ19zZWxlY3RfcnVudGltZSBpbiB0ZXN0X2JwZi5rby4gYnBmX21hcF9nZXRfaW5m
b19ieV9mZCBjYW4gY29weSB0aGUgaW5zbiB0byB1c2Vyc3BhY2UsIGJ1dCB3ZSBjYW4KPiA+Pj4+
IGR1bXAgdGhlbSBpbiB0ZXN0X2JwZi5rbyBpbiB0aGUgc2FtZSB3YXkuCj4gPj4+Cj4gPj4+IElz
c3VlIGlzIHRoYXQgdGhlc2UgcHJvZ3MgYXJlIG5vdCBjb25zdW1hYmxlIGZyb20gdXNlcnNwYWNl
IChhbmQgdGhlcmVmb3JlIG5vdCBicGZ0b29sKS4KPiA+Pj4gaXQncyBqdXN0IHNpbXBsZSBicGZf
cHJvZ19hbGxvYyArIGNvcHkgb2YgdGVzdCBpbnNucyArIGJwZl9wcm9nX3NlbGVjdF9ydW50aW1l
KCkgdG8gdGVzdAo+ID4+PiBKSVRzIChzZWUgZ2VuZXJhdGVfZmlsdGVyKCkpLiBTb21lIG9mIHRo
ZW0gY291bGQgYmUgY29udmVydGVkIG92ZXIgdG8gdGVzdF92ZXJpZmllciwgYnV0Cj4gPj4+IG5v
dCBhbGwgbWlnaHQgYWN0dWFsbHkgcGFzcyB2ZXJpZmllciwgaWlyYy4gRG9uJ3QgdGhpbmsgaXQn
cyBhIGdvb2QgaWRlYSB0byBhbGxvdyBleHBvc2luZwo+ID4+PiB0aGVtIHZpYSBmZCB0YmguCj4g
Pj4gSGkKPiA+PiBJIG1lYW4gdGhhdCwgY2FuIHdlIGludm9rZSB0aGUgYnBmX2ppdF9kdW1wIGlu
IHRlc3RfYnBmLmtvIGRpcmVjdGx5ID8uIGJwZl9wcm9nX2dldF9pbmZvX2J5X2ZkIGNvcHkgdGhl
IGluc24gdG8gdXNlcnNwYWNlLCBidXQgd2Ugb25seSBkdW1wIGluc24gaW4gdGVzdF9icGYua28K
PiA+Pgo+ID4+ICAgICAgICAgICAgICAgICAgaWYgKGJwZl9kdW1wX3Jhd19vayhmaWxlLT5mX2Ny
ZWQpKSB7Ly8gY29kZSBjb3BpZWQgZnJvbSBicGZfcHJvZ19nZXRfaW5mb19ieV9mZCwgbm90IHRl
c3RlZAo+ID4+Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGZvciBtdWx0aS1mdW5j
dGlvbiBwcm9ncmFtcywgY29weSB0aGUgSklUZWQKPiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICogaW5zdHJ1Y3Rpb25zIGZvciBhbGwgdGhlIGZ1bmN0aW9ucwo+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKi8KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHByb2ct
PmF1eC0+ZnVuY19jbnQpIHsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgcHJvZy0+YXV4LT5mdW5jX2NudDsgaSsrKSB7Cj4gPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZW4gPSBwcm9nLT5hdXgtPmZ1bmNbaV0t
PmppdGVkX2xlbjsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGltZyA9ICh1OCAqKSBwcm9nLT5hdXgtPmZ1bmNbaV0tPmJwZl9mdW5jOwo+ID4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnBmX2ppdF9kdW1wKDEsIGxlbiwgMSwg
aW1nKTsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnBmX2ppdF9kdW1wKDEsIHVsZW4sIDEsIHByb2ctPmJwZl9mdW5jKTsKPiA+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4+ICAgICAgICAgICAgICAgICAgfQo+ID4KPiA+
IExldCdzIG5vdCByZWludmVudCB0aGUgd2hlZWwuCj4gPiBicGZ0b29sIHByb2cgZHVtcCBqaXRl
ZAo+ID4gaXMgb3VyIHN1cHBvcnRlZCBjb21tYW5kLgo+ID4gcHBjIGlzc3VlIHdpdGggYnBmdG9v
bCBpcyByZWxhdGVkIHRvIGVuZGlhbm5lc3Mgb2YgZW1iZWRkZWQgc2tlbGV0b24uCj4gPiB3aGlj
aCBtZWFucyB0aGF0IG5vbmUgb2YgdGhlIGJwZnRvb2wgcHJvZyBjb21tYW5kcyB3b3JrIG9uIHBw
Yy4KPiA+IEl0J3MgYSBiaWdnZXIgaXNzdWUgdG8gYWRkcmVzcyB3aXRoIGNyb3NzIGNvbXBpbGF0
aW9uIG9mIGJwZnRvb2wuCj4gPgo+ID4gYnBmdG9vbCBzdXBwb3J0cyBnbnUgYW5kIGxsdm0gZGlz
YXNzZW1ibGVyLiBJdCByZXRyaWV2ZXMgYW5kCj4gPiBwcmludHMgQlRGLCBsaW5lIGluZm8gYW5k
IHNvdXJjZSBjb2RlIGFsb25nIHdpdGggYXNtLgo+ID4gVGhlIHVzZXIgZXhwZXJpZW5jZSBpcyBh
dCBkaWZmZXJlbnQgbGV2ZWwgY29tcGFyaW5nIHRvIGJwZl9qaXRfZHVtcC4KPgo+IEhpIEFsZXhl
aSwKPgo+IEZhaXIgZW5vdWdoLCB3ZSBhcmUgZ29pbmcgdG8gdHJ5IGFuZCBmaXggYnBmdG9vbC4K
Pgo+IEJ1dCBmb3IgdGVzdF9icGYua28gbW9kdWxlLCBob3cgZG8geW91IHVzZSBicGZ0b29sIHRv
IGR1bXAgdGhlIEJQRiB0ZXN0cwo+ID8gRXZlbiBvbiB4ODYgSSBoYXZlIG5vdCBiZWVuIGFibGUg
dG8gdXNlIGJwZnRvb2wgZm9yIHRoYXQgdW50aWwgbm93Lgo+IENhbiB5b3UgdGVsbCBtZSBob3cg
eW91IGRvID8KCnRlc3RfYnBmLmtvIGlzIHVzZWZ1bCB0byBKSVQgZGV2ZWxvcGVycyB3aGVuIHRo
ZXkncmUgc3RhcnRpbmcKdG8gd29yayBvbiBpdCwgYnV0IGl0cyB0ZXN0IGNvdmVyYWdlIGlzIGlu
YWRlcXVhdGUgZm9yIHJlYWwKd29ybGQgYnBmIHVzYWdlIGNvbXBhcmluZyB0byBzZWxmdGVzdHMv
YnBmLgpKb2hhbiBBbG1ibGFkaCBkaWQgc29tZSBncmVhdCBhZGRpdGlvbnMgdG8gdGVzdF9icGYu
a28gYmFjayBpbiAyMDIxLgpTaW5jZSB0aGVuIHRoZXJlIHdhc24ndCBtdWNoLgoKSGVyZSBpdCdz
IGltcG9ydGFudCB0byBkaXN0aW5ndWlzaCB0aGUgdGFyZ2V0IHVzZXIuCklzIGl0IGEga2VybmVs
IEpJVCBkZXZlbG9wZXIgb3IgdXNlciBzcGFjZSBicGYgcHJvZyBkZXZlbG9wZXI/CldoZW4gaXQn
cyBhIGtlcm5lbCBkZXZlbG9wZXIgdGhleSBjYW4gZWFzaWx5CmFkZCBwcmludF9oZXhfZHVtcCgp
IGluIHRoZSByaWdodCBwbGFjZXMuClRoYXQncyB3aGF0IEkgZGlkIHdoZW4gSSB3YXMgZGV2ZWxv
cGluZyBicGYgdHJhbXBvbGluZS4KYnBmIGlzIG1vcmUgdGhhbiBqdXN0IEpJVC4gVGhlcmUgYXJl
IHRyYW1wb2xpbmUsIGtmdW5jcywgZGlzcGF0Y2guClRoZSBrZXJuZWwgZGV2cyBzaG91bGQgbm90
IGFkZCBhIGRlYnVnIGNvZGUuCkxvbmcgYWdvIGJwZl9qaXRfZW5hYmxlPTIgd2FzIHVzZWZ1bCB0
byB1c2VyIHNwYWNlIGJwZiBkZXZlbG9wZXJzLgpUaGV5IHdhbnRlZCB0byBzZWUgaG93IEpJVGVk
IGNvZGUgbG9vayBsaWtlIHRvIG9wdGltaXplIGl0IGFuZCB3aGF0IG5vdC4KTm93ICdwZXJmIHJl
Y29yZCcgY2FwdHVyZXMgYnBmIGFzbSBhbmQgYW5ub3RhdGVzIGl0IGluICdwZXJmIHJlcG9ydCcs
CnNvIHBlcmZvcm1hbmNlIGFuYWx5c2lzIHByb2JsZW0gaXMgc29sdmVkIHRoYXQgd2F5LgpicGZ0
b29sIHByb2cgZHVtcCBqaXQgYWRkcmVzc2VkIHRoZSBuZWVkcyBvZiB1c2VycyBhbmQgYWRtaW5z
IHdobwp3YW50IHRvIHVuZGVyc3RhbmQgd2hhdCBicGYgcHJvZ3MgYXJlIGxvYWRlZCBhbmQgd2hh
dCBhcmUgdGhleSBkb2luZy4KQm90aCAnZHVtcCBqaXRlZCcgYW5kICdkdW1wIHhsYXRlZCcgYXJl
IHVzZWZ1bCBmb3IgdGhpcyBjYXNlLgpTbyBicGZfaml0X2VuYWJsZT0yIHJlbWFpbmVkIHVzZWZ1
bCB0byBrZXJuZWwgZGV2ZWxvcGVycyBvbmx5IGFuZAppbiB0aGF0IHNlbnNlIGl0IGJlY29tZSBh
IGtlcm5lbCBkZWJ1ZyBmZWF0dXJlIGZvciBhIG5hcnJvdyBzZXQgb2YKSklUIGRldmVsb3BlcnMu
IE9uIHg4NiBicGZfaml0X2R1bXAoKSB3YXMgbmVnbGVjdGVkIGFuZCBicm9rZW4uCkkgc3VzcGVj
dCB0aGUgb3RoZXIgYXJjaHMgd2lsbCBmb2xsb3cgdGhlIHNhbWUgZmF0ZS4gSWYgbm90IGFscmVh
ZHkuCkhhdmluZyBhIHN5c2N0bCBmb3Iga2VybmVsIGRldmVsb3BlcnMgaXMgbm90IHNvbWV0aGlu
ZyB0aGUga2VybmVsCmRldmVsb3BlcnMgc2hvdWxkIGhhdmUgYXJvdW5kLiBIZW5jZSB0aGUgY2xl
YW51cCBvZiB0aGlzIHBhdGNoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
