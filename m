Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FB6C63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoSAf1P3T3Qi4NC/GaDo7K6a/jtBfGfqsebTPl0/EwI=; b=tf1uWiQqHIfdEk
	NqzU/3ZuKo7gxEtZQzYvl5H2lvDjOCHs4s27YYm9ZUhDBLSy0Ef9RyNIIpTQCGTdqUq+S9GxdaguS
	UkMEMtY550oz6vH55PDbo3ud3VYz01TKFPmuW/q1N14O5lyX7SeN9s9Kk7TrgJIYrz17KqXVsJYni
	n46OGsY4ZeuxzbGIgpKiXqcVzBfjutDh1fshjER4TSDvv10Pv0NVBiu+aBpyY+0G8XDjBqrG5oR/Y
	0TR7CnPfG5jFyFLEvnObEZRtNuGvNGzn3bvYwFsN1NSxh8dH3K2JxPcg8EsHi9YA/5K4ybQy+i9KH
	9GZ8BNAU04nxi3gORo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHn9F-00Eeuc-PV; Tue, 17 Jan 2023 14:41:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHn9C-00Eeu3-4h
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 14:41:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id bk16so30783065wrb.11
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Zd4ckig5+l+fDHoq+3Cg5EEDjyvUymTQ0k84rOwVsY=;
        b=hrBf6+m2UMiJy0DaFTl5CCY2LDHWPJ0TgHDVrEthrBJjHsrWVf9QDjyKzQ/WDzdJps
         1OkBtqw7LO4BHmvyV8LbV+/888Nz0EZD9N9KFeEbAK3FMGDK1EvcCp2MHke+pMqlS8L3
         sJQzOkBPOUUd3IQogsoYCa8SopnmuIZonC6vehv7XNJa9Q4ekvcGZmItPBaTtXktD5xE
         BJrwVlAvuEj9a9B8MGpmNU3HtbbR3WcXx8bakHfzK6ktzcFiICw1L1mGsU9KikIIXAtU
         K3/QHJeQxb7I3UNgAPWXS4Vz/UaQRaNInXNxkkHmBZ7SjuAV2N4+JpYFH9XTxWgF3KmS
         e+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Zd4ckig5+l+fDHoq+3Cg5EEDjyvUymTQ0k84rOwVsY=;
        b=58CNO8AHmQtWRYQoazKNCJ5JD7QwgbyjhRBIquM0uWfD0GAGOSbXcx6Tfpm2811CG5
         prY1aNMqQYMFtfhQBrw4LIka12fGJo5EpODr6YSFjUKA/lPSzOR1uIg+KnKWXxcHniVc
         Ga89gTNEoFHY/wp15hZIr+wgt0jEZ/Fx3TGYZehCfKIHOOVdIBotnsBFAHzXh9yPOdEx
         rUVIwHu1+CDM9v6/pj6anI+tu8pxqb8ZOOurwvFTfwvGWATUgvB1IXOzmAwySVxbN/QM
         UvIMcdmBKc5NXpG/TTQqZxU5ezmdIGJ5kfyhYuppi/R1N5HOV7csn1id0WFsJL4Tp+5X
         fneA==
X-Gm-Message-State: AFqh2kp5FfCr+B5Xkg85KQmH0M7HmGZi/xPHIobABSi+JwdtlTLk2eZO
	HeCKeowRRBl1vsj5AA04IfybLA==
X-Google-Smtp-Source: AMrXdXvOsILeXKcAbS9ORal0WZ3Au5kJfv7Pnr7I72hOal9JtYYKjZzX65kwJNeuOv3u8QxJcdMI+A==
X-Received: by 2002:adf:f0cd:0:b0:2bd:d783:377 with SMTP id x13-20020adff0cd000000b002bdd7830377mr3296826wro.22.1673966467790;
        Tue, 17 Jan 2023 06:41:07 -0800 (PST)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d534a000000b00272c0767b4asm29388590wrv.109.2023.01.17.06.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:41:07 -0800 (PST)
Message-ID: <376f9737-f9a4-da68-8b7f-26020021613c@isovalent.com>
Date: Tue, 17 Jan 2023 14:41:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tonghao Zhang <tong@infragraf.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.or" <linux-arm-kernel@lists.infradead.or>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Hao Luo <haoluo@google.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>,
 KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <0792068b-9aff-d658-5c7d-086e6d394c6c@csgroup.eu>
 <C811FC00-CE38-4227-B2E8-4CD8989D8B94@infragraf.org>
 <4ab9aafe-6436-b90d-5448-f74da22ddddb@csgroup.eu>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <4ab9aafe-6436-b90d-5448-f74da22ddddb@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_064110_433604_8D9445A3 
X-CRM114-Status: GOOD (  22.06  )
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

MjAyMy0wMS0xNyAxNDoyNSBVVEMrMDAwMCB+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4KPiAKPiAKPiBMZSAxNy8wMS8yMDIzIMOgIDE1OjE4LCBUb25naGFv
IFpoYW5nIGEgw6ljcml0wqA6Cj4+Cj4+Cj4+PiBPbiBKYW4gMTcsIDIwMjMsIGF0IDc6MzYgUE0s
IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4+
Pgo+Pj4KPj4+Cj4+PiBMZSAxNy8wMS8yMDIzIMOgIDA4OjMwLCBDaHJpc3RvcGhlIExlcm95IGEg
w6ljcml0IDoKPj4+Pgo+Pj4+Cj4+Pj4gTGUgMTcvMDEvMjAyMyDDoCAwNjozMCwgVG9uZ2hhbyBa
aGFuZyBhIMOpY3JpdCA6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+PiBPbiBKYW4gOSwgMjAyMywgYXQgNDox
NSBQTSwgQ2hyaXN0b3BoZSBMZXJveQo+Pj4+Pj4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5l
dT4gd3JvdGU6CgpbLi4uXQoKPj4+Pj4+IFN1cmUgSSB3aWxsIHRyeSB0byB0ZXN0IGJwZnRvb2wg
YWdhaW4gaW4gdGhlIGNvbWluZyBkYXlzLgo+Pj4+Pj4KPj4+Pj4+IFByZXZpb3VzIGRpc2N1c3Np
b24gYWJvdXQgdGhhdCBzdWJqZWN0IGlzIGhlcmU6Cj4+Pj4+PiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvcGF0Y2gvMjAyMTA0MTUwOTMyNTAuMzM5MTI1
Ny0xLUppYW5saW4uTHZAYXJtLmNvbS8jMjQxNzY4NDc9CgpDaHJpc3RvcGhlLCBhcG9sb2dpZXMg
ZnJvbSBkcm9wcGluZyB0aGUgZGlzY3Vzc2lvbiB0aGUgbGFzdCB0aW1lLCBpdApzZWVtcyB5b3Vy
IGxhc3QgbWVzc2FnZSBvbiB0aGF0IHRocmVhZCBkaWRuJ3QgbWFrZSBpdCB0byBteSBpbmJveCBh
dCB0aGUKdGltZSA6Ly4gVGhhbmtzIGEgbG90IGZvciBsb29raW5nIGludG8gdGhhdCBhZ2FpbiEK
Cj4+Pj4+IEhpIENocmlzdG9waGUKPj4+Pj4gQW55IHByb2dyZXNzPyBXZSBkaXNjdXNzIHRvIGRl
cHJlY2F0ZSB0aGUgYnBmX2ppdF9lbmFibGUgPT0gMiBpbiAyMDIxLAo+Pj4+PiBidXQgYnBmdG9v
bCBjYW4gbm90IHJ1biBvbiBwb3dlcnBjLgo+Pj4+PiBOb3cgY2FuIHdlIGZpeCB0aGlzIGlzc3Vl
Pwo+Pj4+Cj4+Pj4gSGkgVG9uZywKPj4+Pgo+Pj4+IEkgaGF2ZSBzdGFydGVkIHRvIGxvb2sgYXQg
aXQgYnV0IEkgZG9uJ3QgaGF2ZSBhbnkgZnJ1aXRmdWxsIGZlZWRiYWNrIHlldC4KPj4+Cj4+PiBI
aSBBZ2FpbiwKPj4+Cj4+PiBJIHRlc3RlZCBhZ2FpbiwgdGhlIHByb2JsZW0gaXMgc3RpbGwgdGhl
IHNhbWUgYXMgb25lIHllYXIgYWdvOgo+Pj4KPj4+IHJvb3RAdmdvaXA6fiMgLi9icGZ0b29sIHBy
b2cKPj4+IGxpYmJwZjogZWxmOiBlbmRpYW5uZXNzIG1pc21hdGNoIGluIHBpZF9pdGVyX2JwZi4K
Pj4gSXQgc2VlbSB0byBiZSBub3QgcmlnaHQgZWhkci0+ZV9pZGVudFtFSV9EQVRBXS4gRG8gd2Ug
Y2FuIHByaW50IHRoZSByZWFsIHZhbHVlPwo+PiAvKgo+PiAgICogZV9pZGVudFtFSV9EQVRBXQo+
PiAgICovCj4+ICNkZWZpbmUgRUxGREFUQU5PTkUgICAgIDAKPj4gI2RlZmluZSBFTEZEQVRBMkxT
QiAgICAgMQo+PiAjZGVmaW5lIEVMRkRBVEEyTVNCICAgICAyCj4+ICNkZWZpbmUgRUxGREFUQU5V
TSAgICAgIDMKPj4KPj4gYnBmX29iamVjdF9fZWxmX2luaXQ6Cj4+IG9iai0+ZWZpbGUuZWhkciA9
IGVoZHIgPSBlbGY2NF9nZXRlaGRyKGVsZik7Cj4+Cj4+PiBsaWJicGY6IGZhaWxlZCB0byBpbml0
aWFsaXplIHNrZWxldG9uIEJQRiBvYmplY3QgJ3BpZF9pdGVyX2JwZic6IC00MDAzCj4+PiBFcnJv
cjogZmFpbGVkIHRvIG9wZW4gUElEIGl0ZXJhdG9yIHNrZWxldG9uCj4+Pgo+Pj4gcm9vdEB2Z29p
cDp+IyB1bmFtZSAtYQo+Pj4gTGludXggdmdvaXAgNi4yLjAtcmMzLTAyNTk2LWcxYzJjOWMxM2Uy
NTYgIzI0MiBQUkVFTVBUIFR1ZSBKYW4gMTcKPj4+IDA5OjM2OjA4IENFVCAyMDIzIHBwYyBHTlUv
TGludXgKPj4gT24gbXkgcGMsIGVsZiBpcyBsaXR0bGUgZW5kaWFuLgo+PiAjIHJlYWRlbGYgLWgg
dG9vbHMvYnBmL2JwZnRvb2wvcGlkX2l0ZXIuYnBmLm8KPj4gRUxGIEhlYWRlcjoKPj4gICAgTWFn
aWM6ICAgN2YgNDUgNGMgNDYgMDIgMDEgMDEgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAKPj4g
ICAgQ2xhc3M6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTEY2NAo+PiAgICBEYXRhOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIncyBjb21wbGVtZW50LCBsaXR0bGUgZW5kaWFu
ICMgeDg2XzY0Cj4+ICAgIFZlcnNpb246ICAgICAgICAgICAgICAgICAgICAgICAgICAgMSAoY3Vy
cmVudCkKPj4gICAgT1MvQUJJOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBVTklYIC0gU3lz
dGVtIFYKPj4gICAgQUJJIFZlcnNpb246ICAgICAgICAgICAgICAgICAgICAgICAwCj4+ICAgIFR5
cGU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUkVMIChSZWxvY2F0YWJsZSBmaWxlKQo+
PiAgICBNYWNoaW5lOiAgICAgICAgICAgICAgICAgICAgICAgICAgIExpbnV4IEJQRgo+PiAgICBW
ZXJzaW9uOiAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MQo+PiAgICBFbnRyeSBwb2ludCBh
ZGRyZXNzOiAgICAgICAgICAgICAgIDB4MAo+PiAgICBTdGFydCBvZiBwcm9ncmFtIGhlYWRlcnM6
ICAgICAgICAgIDAgKGJ5dGVzIGludG8gZmlsZSkKPj4gICAgU3RhcnQgb2Ygc2VjdGlvbiBoZWFk
ZXJzOiAgICAgICAgICA2NDgzMiAoYnl0ZXMgaW50byBmaWxlKQo+PiAgICBGbGFnczogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MAo+PiAgICBTaXplIG9mIHRoaXMgaGVhZGVyOiAgICAg
ICAgICAgICAgIDY0IChieXRlcykKPj4gICAgU2l6ZSBvZiBwcm9ncmFtIGhlYWRlcnM6ICAgICAg
ICAgICAwIChieXRlcykKPj4gICAgTnVtYmVyIG9mIHByb2dyYW0gaGVhZGVyczogICAgICAgICAw
Cj4+ICAgIFNpemUgb2Ygc2VjdGlvbiBoZWFkZXJzOiAgICAgICAgICAgNjQgKGJ5dGVzKQo+PiAg
ICBOdW1iZXIgb2Ygc2VjdGlvbiBoZWFkZXJzOiAgICAgICAgIDEzCj4+ICAgIFNlY3Rpb24gaGVh
ZGVyIHN0cmluZyB0YWJsZSBpbmRleDogMQo+Pgo+IAo+IFllcywgbXVzdCBiZSBzb21ldGhpbmcg
d3Jvbmcgd2l0aCB0aGUgYnVpbGQsIEkgZ2V0IHNhbWUgYXMgeW91IDoKPiAKPiAkIExBTkc9IHJl
YWRlbGYgLWggcGlkX2l0ZXIuYnBmLm8KPiBFTEYgSGVhZGVyOgo+ICAgIE1hZ2ljOiAgIDdmIDQ1
IDRjIDQ2IDAyIDAxIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwCj4gICAgQ2xhc3M6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBFTEY2NAo+ICAgIERhdGE6ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMidzIGNvbXBsZW1lbnQsIGxpdHRsZSBlbmRpYW4KPiAgICBWZXJzaW9u
OiAgICAgICAgICAgICAgICAgICAgICAgICAgIDEgKGN1cnJlbnQpCj4gICAgT1MvQUJJOiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBVTklYIC0gU3lzdGVtIFYKPiAgICBBQkkgVmVyc2lvbjog
ICAgICAgICAgICAgICAgICAgICAgIDAKPiAgICBUeXBlOiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFJFTCAoUmVsb2NhdGFibGUgZmlsZSkKPiAgICBNYWNoaW5lOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIExpbnV4IEJQRgo+ICAgIFZlcnNpb246ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMHgxCj4gICAgRW50cnkgcG9pbnQgYWRkcmVzczogICAgICAgICAgICAgICAweDAKPiAg
ICBTdGFydCBvZiBwcm9ncmFtIGhlYWRlcnM6ICAgICAgICAgIDAgKGJ5dGVzIGludG8gZmlsZSkK
PiAgICBTdGFydCBvZiBzZWN0aW9uIGhlYWRlcnM6ICAgICAgICAgIDM0NzA0IChieXRlcyBpbnRv
IGZpbGUpCj4gICAgRmxhZ3M6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAKPiAgICBT
aXplIG9mIHRoaXMgaGVhZGVyOiAgICAgICAgICAgICAgIDY0IChieXRlcykKPiAgICBTaXplIG9m
IHByb2dyYW0gaGVhZGVyczogICAgICAgICAgIDAgKGJ5dGVzKQo+ICAgIE51bWJlciBvZiBwcm9n
cmFtIGhlYWRlcnM6ICAgICAgICAgMAo+ICAgIFNpemUgb2Ygc2VjdGlvbiBoZWFkZXJzOiAgICAg
ICAgICAgNjQgKGJ5dGVzKQo+ICAgIE51bWJlciBvZiBzZWN0aW9uIGhlYWRlcnM6ICAgICAgICAg
MTMKPiAgICBTZWN0aW9uIGhlYWRlciBzdHJpbmcgdGFibGUgaW5kZXg6IDEKPiAKPiAKPiBXaGVy
ZWFzIEkgZXhwZWN0IHRoZSBzYW1lIGFzIGJwZnRvb2wgSSBzdXBwb3NlLCB3aGljaCBpcyA6Cj4g
Cj4gJCBMQU5HPSByZWFkZWxmIC1oIGJwZnRvb2wKPiBFTEYgSGVhZGVyOgo+ICAgIE1hZ2ljOiAg
IDdmIDQ1IDRjIDQ2IDAxIDAyIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwCj4gICAgQ2xh
c3M6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTEYzMgo+ICAgIERhdGE6ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMidzIGNvbXBsZW1lbnQsIGJpZyBlbmRpYW4KPiAgICBWZXJz
aW9uOiAgICAgICAgICAgICAgICAgICAgICAgICAgIDEgKGN1cnJlbnQpCj4gICAgT1MvQUJJOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBVTklYIC0gU3lzdGVtIFYKPiAgICBBQkkgVmVyc2lv
bjogICAgICAgICAgICAgICAgICAgICAgIDAKPiAgICBUeXBlOiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEVYRUMgKEV4ZWN1dGFibGUgZmlsZSkKPiAgICBNYWNoaW5lOiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBvd2VyUEMKPiAgICBWZXJzaW9uOiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4MQo+ICAgIEVudHJ5IHBvaW50IGFkZHJlc3M6ICAgICAgICAgICAgICAgMHgxMDAw
MjdkMAo+ICAgIFN0YXJ0IG9mIHByb2dyYW0gaGVhZGVyczogICAgICAgICAgNTIgKGJ5dGVzIGlu
dG8gZmlsZSkKPiAgICBTdGFydCBvZiBzZWN0aW9uIGhlYWRlcnM6ICAgICAgICAgIDE4NDI4OTYg
KGJ5dGVzIGludG8gZmlsZSkKPiAgICBGbGFnczogICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDB4MAo+ICAgIFNpemUgb2YgdGhpcyBoZWFkZXI6ICAgICAgICAgICAgICAgNTIgKGJ5dGVzKQo+
ICAgIFNpemUgb2YgcHJvZ3JhbSBoZWFkZXJzOiAgICAgICAgICAgMzIgKGJ5dGVzKQo+ICAgIE51
bWJlciBvZiBwcm9ncmFtIGhlYWRlcnM6ICAgICAgICAgOQo+ICAgIFNpemUgb2Ygc2VjdGlvbiBo
ZWFkZXJzOiAgICAgICAgICAgNDAgKGJ5dGVzKQo+ICAgIE51bWJlciBvZiBzZWN0aW9uIGhlYWRl
cnM6ICAgICAgICAgMzkKPiAgICBTZWN0aW9uIGhlYWRlciBzdHJpbmcgdGFibGUgaW5kZXg6IDM4
Cj4gCgpwaWRfaXRlci5icGYubyBzaG91bGQgYmUgZ2VuZXJhdGVkIGZyb20gdGhhdCBjb21tYW5k
IGluIGJwZnRvb2wncyBNYWtlZmlsZToKCgkkKE9VVFBVVCklLmJwZi5vOiBza2VsZXRvbi8lLmJw
Zi5jICQoT1VUUFVUKXZtbGludXguaCBcCgkJCSQoTElCQlBGX0JPT1RTVFJBUCkKCQkkKFFVSUVU
X0NMQU5HKSQoQ0xBTkcpIFwKCQkJLUkkKG9yICQoT1VUUFVUKSwuKSBcCgkJCS1JJChzcmN0cmVl
KS90b29scy9pbmNsdWRlL3VhcGkvIFwKCQkJLUkkKExJQkJQRl9CT09UU1RSQVBfSU5DTFVERSkg
XAoJCQktZyAtTzIgLVdhbGwgLWZuby1zdGFjay1wcm90ZWN0b3IgXAoJCQktdGFyZ2V0IGJwZiAt
YyAkPCAtbyAkQAoKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0ICItdGFyZ2V0IGJwZiIgaXMgc3Vw
cG9zZWQgdG8gcGljayB0aGUKZW5kaWFubmVzcyBmb3IgdGhlIGhvc3QgKHNlZSAibGxjIC0tdmVy
c2lvbiB8IGdyZXAgYnBmIi4gSWYgdGhhdCdzIG5vdAp0aGUgY2FzZSwgY291bGQgeW91IHBsZWFz
ZSB0cnkgdG8gdHVybiB0aGF0IGludG8gJy10YXJnZXQgYnBmZWInIGluIHRoZQpNYWtlZmlsZSBp
bnN0ZWFkPyBJJ2QgYmUgY3VyaW91cyB0byBzZWUgaWYgaXQgaGVscHMuCgpRdWVudGluCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
