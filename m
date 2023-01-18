Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB75C00A5A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 02:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiKVnE5g2PxWrjVbQj6m18JghgqqC9kzbyr7H4mC34s=; b=w9NQVFNCcNPBcA
	5C2dw/0mDhJUZMMmBa8NMcvzqORqAAa1FYyNXwu5EMPIIpnr/Ps3IsPf7YmCT5lYggbFeNmrjjJiR
	i1ydUrM/Lcd+dd58nGgE3eRYlVUQDq43421h2cWNaAc7pF67F8R14d4Tn1hWnyzjvm7JCfMCqf2FH
	ghQmPkGA1KZ9bpuXPEOrjUcTzss2EEQD8gBFK/SlpORBB//2UMOdfFGleKAk0giW2ezGXIQePCOOO
	oFfCjTkZHO6SNlITJsnX0ZlU7yP3o3t5VEdyX9ecLH9LFVPVzq4D/48ACiEC+g527VeAT9cbq/zIA
	Z7KckbkRxCQaslYxqFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHy5V-00GaP6-8w; Wed, 18 Jan 2023 02:22:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHy5R-00GaNl-Mw
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 02:22:04 +0000
Received: by mail-ej1-x62a.google.com with SMTP id mg12so7551732ejc.5
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 18:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+advyT/5BIKUb5fwkTNOHjhet8rF/l8YyqhXFamTOh0=;
        b=QMqw+wVZPsINTwHd4/KmdeLRt/y/BrPXNBYj3nwyqaDOCGfqE+DRjJiQ8lFAaqLyzK
         ILklkcmRYMHUeE/JvRvd2S2HkSWkrTYoKBTkfRVQ6m7TB1nrnTgbf94Yrc/2FHH72aRc
         u2NGIS9uHMGcmDEQQ29kFy0eXNl6hldOqJ+1jbSimQKgAuM4x4DgCAZYDtK0R3QF02t3
         qDGBVYAgcJN4QoI3EanlLKBx5pANQeemRgjXI9xfPa1OSdGyS6WYvtO9EAa6vrHqQLYe
         fRLA/txn23+DwuGpPY9IMML9FBcrPIgZS/cbeClmuoHDf1bj15KSEbV1385wsrvgqY5E
         jTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+advyT/5BIKUb5fwkTNOHjhet8rF/l8YyqhXFamTOh0=;
        b=karVHBstaChrQy1XZSVR9+WJQE9fcLpQFs2bwayQb6LlgOp4rh45V1goeQCDYQAFr5
         9fdXdnYlYM1Bnz2az8h9uFWEyv2VA8qLNvSTK0rxG6k9D/JEviRWXnlga1wBAjjrBNTs
         5bbsbzJvlc40EY0KT3lN4dcvCm0dlDYFepzyH2ijeOJkgeZBY2WI98WtrC795ev0hkVY
         GtmC6obefWgzoUv+xmnToF+WfZTfP2WC+UplqIi2CRatlI+I72GUrmir0/WhulK7V/qP
         oHdMUQ79ZyQoMMdIvJsSFLrP3x/7it8G20ggWSnhJrezZpB0+9fa8rAN0+JFeEdF0o5w
         5YMQ==
X-Gm-Message-State: AFqh2krrpawpH/lfE14vHoC8aF/GPkun0tYf4MxQ39OXK5zVG3OimMGa
	dsIjIdp+HgJRzb//8DBUEzkgsyqgOEBZvmSYlaM=
X-Google-Smtp-Source: AMrXdXsC3bnTE90KIYSWGJIwtCpPkYXNIcXQACD7qNM6JzO9ctSq9n1iBbUdWEJabAk8cwv58yOAJ37lgr92swbQP/o=
X-Received: by 2002:a17:906:240a:b0:870:1522:2df3 with SMTP id
 z10-20020a170906240a00b0087015222df3mr399518eja.327.1674008519368; Tue, 17
 Jan 2023 18:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20230105030614.26842-1-tong@infragraf.org> <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net> <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org> <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <4380D454-3ED0-43F4-9A79-102BB0E3577A@infragraf.org> <d91bbb9e-484b-d43d-e62d-0474ff21cf91@iogearbox.net>
 <7159E8F8-AE66-4563-8A29-D10D66EFAF3D@infragraf.org>
In-Reply-To: <7159E8F8-AE66-4563-8A29-D10D66EFAF3D@infragraf.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 17 Jan 2023 18:21:46 -0800
Message-ID: <CAADnVQLf_UhRP76i9+OaLGrmuoM942QebMXT3OA3mgrP_UV0KA@mail.gmail.com>
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
To: Tonghao Zhang <tong@infragraf.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
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
X-CRM114-CacheID: sfid-20230117_182201_788841_BAD80A0C 
X-CRM114-Status: GOOD (  37.65  )
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

T24gVHVlLCBKYW4gMTcsIDIwMjMgYXQgNjoxMyBQTSBUb25naGFvIFpoYW5nIDx0b25nQGluZnJh
Z3JhZi5vcmc+IHdyb3RlOgo+Cj4KPgo+ID4gT24gSmFuIDE3LCAyMDIzLCBhdCAxMTo1OSBQTSwg
RGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5ldD4gd3JvdGU6Cj4gPgo+ID4gT24g
MS8xNy8yMyAzOjIyIFBNLCBUb25naGFvIFpoYW5nIHdyb3RlOgo+ID4+PiBPbiBKYW4gMTcsIDIw
MjMsIGF0IDM6MzAgUE0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4gd3JvdGU6Cj4gPj4+Cj4gPj4+Cj4gPj4+Cj4gPj4+IExlIDE3LzAxLzIwMjMgw6AgMDY6
MzAsIFRvbmdoYW8gWmhhbmcgYSDDqWNyaXQgOgo+ID4+Pj4KPiA+Pj4+Cj4gPj4+Pj4gT24gSmFu
IDksIDIwMjMsIGF0IDQ6MTUgUE0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4gd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gTGUgMDYv
MDEvMjAyMyDDoCAxNjozNywgRGFuaWVsIEJvcmttYW5uIGEgw6ljcml0IDoKPiA+Pj4+Pj4gT24g
MS81LzIzIDY6NTMgUE0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gPj4+Pj4+PiBMZSAwNS8w
MS8yMDIzIMOgIDA0OjA2LCB0b25nQGluZnJhZ3JhZi5vcmcgYSDDqWNyaXQgOgo+ID4+Pj4+Pj4+
IEZyb206IFRvbmdoYW8gWmhhbmcgPHRvbmdAaW5mcmFncmFmLm9yZz4KPiA+Pj4+Pj4+Pgo+ID4+
Pj4+Pj4+IFRoZSB4ODZfNjQgY2FuJ3QgZHVtcCB0aGUgdmFsaWQgaW5zbiBpbiB0aGlzIHdheS4g
QSB0ZXN0IEJQRiBwcm9nCj4gPj4+Pj4+Pj4gd2hpY2ggaW5jbHVkZSBzdWJwcm9nOgo+ID4+Pj4+
Pj4+Cj4gPj4+Pj4+Pj4gJCBsbHZtLW9iamR1bXAgLWQgc3VicHJvZy5vCj4gPj4+Pj4+Pj4gRGlz
YXNzZW1ibHkgb2Ygc2VjdGlvbiAudGV4dDoKPiA+Pj4+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwIDxz
dWJwcm9nPjoKPiA+Pj4+Pj4+PiAgICAgICAgICAwOiAgICAgICAxOCAwMSAwMCAwMCA3MyA3NSA2
MiA3MCAwMCAwMCAwMCAwMCA3MiA2ZiA2NyAwMCByMQo+ID4+Pj4+Pj4+ID0gMjkxMTQ0NTk5MDM2
NTMyMzUgbGwKPiA+Pj4+Pj4+PiAgICAgICAgICAyOiAgICAgICA3YiAxYSBmOCBmZiAwMCAwMCAw
MCAwMCAqKHU2NCAqKShyMTAgLSA4KSA9IHIxCj4gPj4+Pj4+Pj4gICAgICAgICAgMzogICAgICAg
YmYgYTEgMDAgMDAgMDAgMDAgMDAgMDAgcjEgPSByMTAKPiA+Pj4+Pj4+PiAgICAgICAgICA0OiAg
ICAgICAwNyAwMSAwMCAwMCBmOCBmZiBmZiBmZiByMSArPSAtOAo+ID4+Pj4+Pj4+ICAgICAgICAg
IDU6ICAgICAgIGI3IDAyIDAwIDAwIDA4IDAwIDAwIDAwIHIyID0gOAo+ID4+Pj4+Pj4+ICAgICAg
ICAgIDY6ICAgICAgIDg1IDAwIDAwIDAwIDA2IDAwIDAwIDAwIGNhbGwgNgo+ID4+Pj4+Pj4+ICAg
ICAgICAgIDc6ICAgICAgIDk1IDAwIDAwIDAwIDAwIDAwIDAwIDAwIGV4aXQKPiA+Pj4+Pj4+PiBE
aXNhc3NlbWJseSBvZiBzZWN0aW9uIHJhd190cC9zeXNfZW50ZXI6Cj4gPj4+Pj4+Pj4gMDAwMDAw
MDAwMDAwMDAwMCA8ZW50cnk+Ogo+ID4+Pj4+Pj4+ICAgICAgICAgIDA6ICAgICAgIDg1IDEwIDAw
IDAwIGZmIGZmIGZmIGZmIGNhbGwgLTEKPiA+Pj4+Pj4+PiAgICAgICAgICAxOiAgICAgICBiNyAw
MCAwMCAwMCAwMCAwMCAwMCAwMCByMCA9IDAKPiA+Pj4+Pj4+PiAgICAgICAgICAyOiAgICAgICA5
NSAwMCAwMCAwMCAwMCAwMCAwMCAwMCBleGl0Cj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBrZXJuZWwg
cHJpbnQgbWVzc2FnZToKPiA+Pj4+Pj4+PiBbICA1ODAuNzc1Mzg3XSBmbGVuPTggcHJvZ2xlbj01
MSBwYXNzPTMgaW1hZ2U9ZmZmZmZmZmZhMDAwYzIwYwo+ID4+Pj4+Pj4+IGZyb209a3Byb2JlLWxv
YWQgcGlkPTE2NDMKPiA+Pj4+Pj4+PiBbICA1ODAuNzc3MjM2XSBKSVQgY29kZTogMDAwMDAwMDA6
IGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjCj4gPj4+Pj4+Pj4gY2MgY2MgY2MgY2Mg
Y2MKPiA+Pj4+Pj4+PiBbICA1ODAuNzc5MDM3XSBKSVQgY29kZTogMDAwMDAwMTA6IGNjIGNjIGNj
IGNjIGNjIGNjIGNjIGNjIGNjIGNjIGNjCj4gPj4+Pj4+Pj4gY2MgY2MgY2MgY2MgY2MKPiA+Pj4+
Pj4+PiBbICA1ODAuNzgwNzY3XSBKSVQgY29kZTogMDAwMDAwMjA6IGNjIGNjIGNjIGNjIGNjIGNj
IGNjIGNjIGNjIGNjIGNjCj4gPj4+Pj4+Pj4gY2MgY2MgY2MgY2MgY2MKPiA+Pj4+Pj4+PiBbICA1
ODAuNzgyNTY4XSBKSVQgY29kZTogMDAwMDAwMzA6IGNjIGNjIGNjCj4gPj4+Pj4+Pj4KPiA+Pj4+
Pj4+PiAkIGJwZl9qaXRfZGlzYXNtCj4gPj4+Pj4+Pj4gNTEgYnl0ZXMgZW1pdHRlZCBmcm9tIEpJ
VCBjb21waWxlciAocGFzczozLCBmbGVuOjgpCj4gPj4+Pj4+Pj4gZmZmZmZmZmZhMDAwYzIwYyAr
IDx4PjoKPiA+Pj4+Pj4+PiAgICAgIDA6ICAgaW50Mwo+ID4+Pj4+Pj4+ICAgICAgMTogICBpbnQz
Cj4gPj4+Pj4+Pj4gICAgICAyOiAgIGludDMKPiA+Pj4+Pj4+PiAgICAgIDM6ICAgaW50Mwo+ID4+
Pj4+Pj4+ICAgICAgNDogICBpbnQzCj4gPj4+Pj4+Pj4gICAgICA1OiAgIGludDMKPiA+Pj4+Pj4+
PiAgICAgIC4uLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gVW50aWwgYnBmX2ppdF9iaW5hcnlfcGFj
a19maW5hbGl6ZSBpcyBpbnZva2VkLCB3ZSBjb3B5IHJ3X2hlYWRlciB0bwo+ID4+Pj4+Pj4+IGhl
YWRlcgo+ID4+Pj4+Pj4+IGFuZCB0aGVuIGltYWdlL2luc24gaXMgdmFsaWQuIEJUVywgd2UgY2Fu
IHVzZSB0aGUgImJwZnRvb2wgcHJvZyBkdW1wIgo+ID4+Pj4+Pj4+IEpJVGVkIGluc3RydWN0aW9u
cy4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBOQUNLLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEJlY2F1c2Ug
dGhlIGZlYXR1cmUgaXMgYnVnZ3kgb24geDg2XzY0LCB5b3UgcmVtb3ZlIGl0IGZvciBhbGwKPiA+
Pj4+Pj4+IGFyY2hpdGVjdHVyZXMgPwo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IE9uIHBvd2VycGMgYnBm
X2ppdF9lbmFibGUgPT0gMiB3b3JrcyBhbmQgaXMgdmVyeSB1c2VmdWxsLgo+ID4+Pj4+Pj4KPiA+
Pj4+Pj4+IExhc3QgdGltZSBJIHRyaWVkIHRvIHVzZSBicGZ0b29sIG9uIHBvd2VycGMvMzIgaXQg
ZGlkbid0IHdvcmsuIEkgZG9uJ3QKPiA+Pj4+Pj4+IHJlbWVtYmVyIHRoZSBkZXRhaWxzLCBJIHRo
aW5rIGl0IHdhcyBhbiBpc3N1ZSB3aXRoIGVuZGlhbmVzcy4gTWF5YmUgaXQKPiA+Pj4+Pj4+IGlz
IGZpeGVkIG5vdywgYnV0IGl0IG5lZWRzIHRvIGJlIHZlcmlmaWVkLgo+ID4+Pj4+Pj4KPiA+Pj4+
Pj4+IFNvIHBsZWFzZSwgYmVmb3JlIHJlbW92aW5nIGEgd29ya2luZyBhbmQgdXNlZnVsbCBmZWF0
dXJlLCBtYWtlIHN1cmUKPiA+Pj4+Pj4+IHRoZXJlIGlzIGFuIGFsdGVybmF0aXZlIGF2YWlsYWJs
ZSB0byBpdCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMgaW4gYWxsCj4gPj4+Pj4+PiBjb25maWd1cmF0
aW9ucy4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBBbHNvLCBJIGRvbid0IHRoaW5rIGJwZnRvb2wgaXMg
dXNhYmxlIHRvIGR1bXAga2VybmVsIEJQRiBzZWxmdGVzdHMuCj4gPj4+Pj4+PiBUaGF0J3Mgdml0
YWwgd2hlbiBhIHNlbGZ0ZXN0IGZhaWxzIGlmIHlvdSB3YW50IHRvIGhhdmUgYSBjaGFuY2UgdG8K
PiA+Pj4+Pj4+IHVuZGVyc3RhbmQgd2h5IGl0IGZhaWxzLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBJZiB0
aGlzIGlzIGFjdGl2ZWx5IHVzZWQgYnkgSklUIGRldmVsb3BlcnMgYW5kIGNvbnNpZGVyZWQgdXNl
ZnVsLCBJJ2QgYmUKPiA+Pj4+Pj4gb2sgdG8gbGVhdmUgaXQgZm9yIHRoZSB0aW1lIGJlaW5nLiBP
dmVyYWxsIGdvYWwgaXMgdG8gcmVhY2ggZmVhdHVyZSBwYXJpdHkKPiA+Pj4+Pj4gYW1vbmcgKGF0
IGxlYXN0IG1ham9yIGFyY2gpIEpJVHMgYW5kIG5vdCBqdXN0IGhhdmUgbW9zdCBmdW5jdGlvbmFs
aXR5IG9ubHkKPiA+Pj4+Pj4gYXZhaWxhYmxlIG9uIHg4Ni02NCBKSVQuIENvdWxkIHlvdSBob3dl
dmVyIGNoZWNrIHdoYXQgaXMgbm90IHdvcmtpbmcgd2l0aAo+ID4+Pj4+PiBicGZ0b29sIG9uIHBv
d2VycGMvMzI/IFBlcmhhcHMgaXQncyBub3QgdG9vIG11Y2ggZWZmb3J0IHRvIGp1c3QgZml4IGl0
LAo+ID4+Pj4+PiBidXQgZGV0YWlscyB3b3VsZCBiZSB1c2VmdWwgb3RoZXJ3aXNlICdpdCBkaWRu
J3Qgd29yaycgaXMgdG9vIGZ1enp5Lgo+ID4+Pj4+Cj4gPj4+Pj4gU3VyZSBJIHdpbGwgdHJ5IHRv
IHRlc3QgYnBmdG9vbCBhZ2FpbiBpbiB0aGUgY29taW5nIGRheXMuCj4gPj4+Pj4KPiA+Pj4+PiBQ
cmV2aW91cyBkaXNjdXNzaW9uIGFib3V0IHRoYXQgc3ViamVjdCBpcyBoZXJlOgo+ID4+Pj4+IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIx
MDQxNTA5MzI1MC4zMzkxMjU3LTEtSmlhbmxpbi5MdkBhcm0uY29tLyMyNDE3Njg0Nz0KPiA+Pj4+
IEhpIENocmlzdG9waGUKPiA+Pj4+IEFueSBwcm9ncmVzcz8gV2UgZGlzY3VzcyB0byBkZXByZWNh
dGUgdGhlIGJwZl9qaXRfZW5hYmxlID09IDIgaW4gMjAyMSwgYnV0IGJwZnRvb2wgY2FuIG5vdCBy
dW4gb24gcG93ZXJwYy4KPiA+Pj4+IE5vdyBjYW4gd2UgZml4IHRoaXMgaXNzdWU/Cj4gPj4+Cj4g
Pj4+IEhpIFRvbmcsCj4gPj4+Cj4gPj4+IEkgaGF2ZSBzdGFydGVkIHRvIGxvb2sgYXQgaXQgYnV0
IEkgZG9uJ3QgaGF2ZSBhbnkgZnJ1aXRmdWxsIGZlZWRiYWNrIHlldC4KPiA+Pj4KPiA+Pj4gSW4g
dGhlIG1lYW50aW1lLCB3ZXJlIHlvdSBhYmxlIHRvIGNvbmZpcm0gdGhhdCBicGZ0b29sIGNhbiBh
bHNvIGJlIHVzZWQKPiA+Pj4gdG8gZHVtcCBqaXR0ZWQgdGVzdHMgZnJvbSB0ZXN0X2JwZi5rbyBt
b2R1bGUgb24geDg2XzY0ID8gSW4gdGhhdCBjYW4geW91Cj4gPj4+IHRlbGwgbWUgaG93IHRvIHBy
b2NlZWQgPwo+ID4+IE5vdyBJIGRvIG5vdCB0ZXN0LCBidXQgd2UgY2FuIGR1bXAgdGhlIGluc24g
YWZ0ZXIgYnBmX3Byb2dfc2VsZWN0X3J1bnRpbWUgaW4gdGVzdF9icGYua28uIGJwZl9tYXBfZ2V0
X2luZm9fYnlfZmQgY2FuIGNvcHkgdGhlIGluc24gdG8gdXNlcnNwYWNlLCBidXQgd2UgY2FuCj4g
Pj4gZHVtcCB0aGVtIGluIHRlc3RfYnBmLmtvIGluIHRoZSBzYW1lIHdheS4KPiA+Cj4gPiBJc3N1
ZSBpcyB0aGF0IHRoZXNlIHByb2dzIGFyZSBub3QgY29uc3VtYWJsZSBmcm9tIHVzZXJzcGFjZSAo
YW5kIHRoZXJlZm9yZSBub3QgYnBmdG9vbCkuCj4gPiBpdCdzIGp1c3Qgc2ltcGxlIGJwZl9wcm9n
X2FsbG9jICsgY29weSBvZiB0ZXN0IGluc25zICsgYnBmX3Byb2dfc2VsZWN0X3J1bnRpbWUoKSB0
byB0ZXN0Cj4gPiBKSVRzIChzZWUgZ2VuZXJhdGVfZmlsdGVyKCkpLiBTb21lIG9mIHRoZW0gY291
bGQgYmUgY29udmVydGVkIG92ZXIgdG8gdGVzdF92ZXJpZmllciwgYnV0Cj4gPiBub3QgYWxsIG1p
Z2h0IGFjdHVhbGx5IHBhc3MgdmVyaWZpZXIsIGlpcmMuIERvbid0IHRoaW5rIGl0J3MgYSBnb29k
IGlkZWEgdG8gYWxsb3cgZXhwb3NpbmcKPiA+IHRoZW0gdmlhIGZkIHRiaC4KPiBIaQo+IEkgbWVh
biB0aGF0LCBjYW4gd2UgaW52b2tlIHRoZSBicGZfaml0X2R1bXAgaW4gdGVzdF9icGYua28gZGly
ZWN0bHkgPy4gYnBmX3Byb2dfZ2V0X2luZm9fYnlfZmQgY29weSB0aGUgaW5zbiB0byB1c2Vyc3Bh
Y2UsIGJ1dCB3ZSBvbmx5IGR1bXAgaW5zbiBpbiB0ZXN0X2JwZi5rbwo+Cj4gICAgICAgICAgICAg
ICAgIGlmIChicGZfZHVtcF9yYXdfb2soZmlsZS0+Zl9jcmVkKSkgey8vIGNvZGUgY29waWVkIGZy
b20gYnBmX3Byb2dfZ2V0X2luZm9fYnlfZmQsIG5vdCB0ZXN0ZWQKPgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIC8qIGZvciBtdWx0aS1mdW5jdGlvbiBwcm9ncmFtcywgY29weSB0aGUgSklUZWQK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgKiBpbnN0cnVjdGlvbnMgZm9yIGFsbCB0aGUgZnVu
Y3Rpb25zCj4gICAgICAgICAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHByb2ctPmF1eC0+ZnVuY19jbnQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBwcm9nLT5hdXgtPmZ1bmNfY250OyBpKyspIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVuID0gcHJvZy0+YXV4LT5m
dW5jW2ldLT5qaXRlZF9sZW47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGltZyA9ICh1OCAqKSBwcm9nLT5hdXgtPmZ1bmNbaV0tPmJwZl9mdW5jOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicGZfaml0X2R1bXAoMSwgbGVuLCAxLCBp
bWcpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicGZf
aml0X2R1bXAoMSwgdWxlbiwgMSwgcHJvZy0+YnBmX2Z1bmMpOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIH0KPiAgICAgICAgICAgICAgICAgfQoKTGV0J3Mgbm90IHJlaW52ZW50IHRoZSB3aGVl
bC4KYnBmdG9vbCBwcm9nIGR1bXAgaml0ZWQKaXMgb3VyIHN1cHBvcnRlZCBjb21tYW5kLgpwcGMg
aXNzdWUgd2l0aCBicGZ0b29sIGlzIHJlbGF0ZWQgdG8gZW5kaWFubmVzcyBvZiBlbWJlZGRlZCBz
a2VsZXRvbi4Kd2hpY2ggbWVhbnMgdGhhdCBub25lIG9mIHRoZSBicGZ0b29sIHByb2cgY29tbWFu
ZHMgd29yayBvbiBwcGMuCkl0J3MgYSBiaWdnZXIgaXNzdWUgdG8gYWRkcmVzcyB3aXRoIGNyb3Nz
IGNvbXBpbGF0aW9uIG9mIGJwZnRvb2wuCgpicGZ0b29sIHN1cHBvcnRzIGdudSBhbmQgbGx2bSBk
aXNhc3NlbWJsZXIuIEl0IHJldHJpZXZlcyBhbmQKcHJpbnRzIEJURiwgbGluZSBpbmZvIGFuZCBz
b3VyY2UgY29kZSBhbG9uZyB3aXRoIGFzbS4KVGhlIHVzZXIgZXhwZXJpZW5jZSBpcyBhdCBkaWZm
ZXJlbnQgbGV2ZWwgY29tcGFyaW5nIHRvIGJwZl9qaXRfZHVtcC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
