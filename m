Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5189C6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxJLFd7Sa3V5muPxGhjpvLR5MwpQ8Sn0ApTPFX6Mhqg=; b=J28hjzxl6kgioH
	V9/+RofGefi5SB9RP6OPOigBlvsnID+e5xVYSpV2UJL/NhwrLvy5GWQzNumJhyO/gSGsXwJ6gxkbN
	DcAjytPN07LhY0EzxGvc3yyYiyFT0ouNwGbrPqCnNIyacgO7kSL/cjQWQj5Bm96jx/Bc7jhaCOcqZ
	0pnVky16PApS/meOWvndJoOrMHsHs4y6Nv9gGXPsT+M1kuLdRKOvhYukS3vja7FIKqKd1NmkmQI57
	+b9q0YnM7MeZmbd3YSMTGyQruMr0ircslrtMhzFU73DISCH9nwsfNc6FNPUDqsKcKZqUyZhAEQvKQ
	osnJh/ofswG8J2uoWlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHoK4-00Ey9g-5n; Tue, 17 Jan 2023 15:56:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHo73-00Eu57-FT
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 15:43:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b7so5025174wrt.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 07:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7To1PtEGVp3/tPOk0JXLL+U9DaqHG+W01y2JfF1hK5I=;
        b=sqjNmW/XT9f6bMUz2HReEOEm15NNiVvPMxUXTumv8HXRcwKFSzVq7Sn7osexqENlED
         cxpgAQoVCMBcA79O0bs/6PdcgcYa/TCGcPRaPZH025Da/t856WXh9yyikX2+AO+uKUnh
         N/OeBwjz/VL3hTVLOWDw0z7c7IzRwqNe2Ce/AGJOzFkyMqwHDc2CeYEacuaLbTZ5uI6W
         sWCWb3Bh5+J4VBpHVjxd4368wMNeEWsviX25PYwG6Dq6KYh8qxIr/YflMdXoWlib7AyQ
         rtoZqZ3C3qfWKwOcfB1ILORxKgwThZUzHy8KkJQFu+nsJhPv4IlmTQt+X32frJsjt9Fv
         8zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7To1PtEGVp3/tPOk0JXLL+U9DaqHG+W01y2JfF1hK5I=;
        b=ewBT+XZKHpz+MGp7jrKKRdTCgqb+beVr9BZ39TvXq7xkv1jgltiJ8aHl3dD7RQuFAH
         9xPqarhJDFn5YDssirEeM2tLDIOoYbAB1z0AJeAhMG/ZtkM2yeENYK6RYuDu0f8NlorV
         956XrWzSu8msrv5CHKeviX8YY6f4iAmfOk6ViShnmYi/q5DQ+bFvbv2wFFlofvfbnXer
         x7R78U/Nnc2NajeoGGOn979PVTtWhFFG/orKforOFu0Ehkt25XaJItZAonhMZLx2I5An
         EYLKHL4btyWfXL1Aix58gMvc578H79b3oCJE0t7m0mBUmFN2FsOjPgzY8v5zduNfvQcX
         rRPw==
X-Gm-Message-State: AFqh2kow/6bRvkZ4ogVnEx2OiuE/PYdzwDPsCsowLUAUYZDTvu2CVAx3
	AM9aExvUWgY9mjfzh1q8thZYBw==
X-Google-Smtp-Source: AMrXdXtTN1BLtD1pbah3CZTaOxF4sW540xUc7Q3jg68foOOF4e44hppWy+ht1PSRvVqSopEM+M//jg==
X-Received: by 2002:a5d:4384:0:b0:2bd:f8c8:9786 with SMTP id i4-20020a5d4384000000b002bdf8c89786mr2922814wrq.64.1673970175526;
        Tue, 17 Jan 2023 07:42:55 -0800 (PST)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id a1-20020a5d4d41000000b002bdef155868sm9467141wru.106.2023.01.17.07.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 07:42:55 -0800 (PST)
Message-ID: <43e6cd9f-ac54-46da-dba9-d535a2a77207@isovalent.com>
Date: Tue, 17 Jan 2023 15:42:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tonghao Zhang <tong@infragraf.org>, Andrii Nakryiko <andrii@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Hao Luo <haoluo@google.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Hou Tao <houtao1@huawei.com>, KP Singh <kpsingh@kernel.org>,
 Yonghong Song <yhs@fb.com>, Martin KaFai Lau <martin.lau@linux.dev>,
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
 <376f9737-f9a4-da68-8b7f-26020021613c@isovalent.com>
 <21b09e52-142d-92f5-4f8b-e4190f89383b@csgroup.eu>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <21b09e52-142d-92f5-4f8b-e4190f89383b@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_074301_809340_23B1848B 
X-CRM114-Status: GOOD (  29.66  )
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

MjAyMy0wMS0xNyAxNDo1NSBVVEMrMDAwMCB+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4KPiAKPiAKPiBMZSAxNy8wMS8yMDIzIMOgIDE1OjQxLCBRdWVudGlu
IE1vbm5ldCBhIMOpY3JpdMKgOgo+PiBbVm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNv
dXJyaWVycyBkZSBxdWVudGluQGlzb3ZhbGVudC5jb20uIETDqWNvdXZyZXogcG91cnF1b2kgY2Vj
aSBlc3QgaW1wb3J0YW50IMOgIGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbiBdCj4+Cj4+IDIwMjMtMDEtMTcgMTQ6MjUgVVRDKzAwMDAgfiBDaHJpc3RvcGhlIExl
cm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+Pgo+Pj4KPj4+IExlIDE3LzAxLzIw
MjMgw6AgMTU6MTgsIFRvbmdoYW8gWmhhbmcgYSDDqWNyaXQgOgo+Pj4+Cj4+Pj4KPj4+Pj4gT24g
SmFuIDE3LCAyMDIzLCBhdCA3OjM2IFBNLCBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxl
cm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBMZSAxNy8wMS8y
MDIzIMOgIDA4OjMwLCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0IDoKPj4+Pj4+Cj4+Pj4+Pgo+
Pj4+Pj4gTGUgMTcvMDEvMjAyMyDDoCAwNjozMCwgVG9uZ2hhbyBaaGFuZyBhIMOpY3JpdCA6Cj4+
Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+PiBPbiBKYW4gOSwgMjAyMywgYXQgNDoxNSBQTSwgQ2hyaXN0
b3BoZSBMZXJveQo+Pj4+Pj4+PiA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToK
Pj4KPj4gWy4uLl0KPj4KPj4+Pj4+Pj4gU3VyZSBJIHdpbGwgdHJ5IHRvIHRlc3QgYnBmdG9vbCBh
Z2FpbiBpbiB0aGUgY29taW5nIGRheXMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFByZXZpb3VzIGRpc2N1
c3Npb24gYWJvdXQgdGhhdCBzdWJqZWN0IGlzIGhlcmU6Cj4+Pj4+Pj4+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIxMDQxNTA5MzI1MC4z
MzkxMjU3LTEtSmlhbmxpbi5MdkBhcm0uY29tLyMyNDE3Njg0Nz0KPj4KPj4gQ2hyaXN0b3BoZSwg
YXBvbG9naWVzIGZyb20gZHJvcHBpbmcgdGhlIGRpc2N1c3Npb24gdGhlIGxhc3QgdGltZSwgaXQK
Pj4gc2VlbXMgeW91ciBsYXN0IG1lc3NhZ2Ugb24gdGhhdCB0aHJlYWQgZGlkbid0IG1ha2UgaXQg
dG8gbXkgaW5ib3ggYXQgdGhlCj4+IHRpbWUgOi8uIFRoYW5rcyBhIGxvdCBmb3IgbG9va2luZyBp
bnRvIHRoYXQgYWdhaW4hCj4+Cj4+Pj4+Pj4gSGkgQ2hyaXN0b3BoZQo+Pj4+Pj4+IEFueSBwcm9n
cmVzcz8gV2UgZGlzY3VzcyB0byBkZXByZWNhdGUgdGhlIGJwZl9qaXRfZW5hYmxlID09IDIgaW4g
MjAyMSwKPj4+Pj4+PiBidXQgYnBmdG9vbCBjYW4gbm90IHJ1biBvbiBwb3dlcnBjLgo+Pj4+Pj4+
IE5vdyBjYW4gd2UgZml4IHRoaXMgaXNzdWU/Cj4+Pj4+Pgo+Pj4+Pj4gSGkgVG9uZywKPj4+Pj4+
Cj4+Pj4+PiBJIGhhdmUgc3RhcnRlZCB0byBsb29rIGF0IGl0IGJ1dCBJIGRvbid0IGhhdmUgYW55
IGZydWl0ZnVsbCBmZWVkYmFjayB5ZXQuCj4+Pj4+Cj4+Pj4+IEhpIEFnYWluLAo+Pj4+Pgo+Pj4+
PiBJIHRlc3RlZCBhZ2FpbiwgdGhlIHByb2JsZW0gaXMgc3RpbGwgdGhlIHNhbWUgYXMgb25lIHll
YXIgYWdvOgo+Pj4+Pgo+Pj4+PiByb290QHZnb2lwOn4jIC4vYnBmdG9vbCBwcm9nCj4+Pj4+IGxp
YmJwZjogZWxmOiBlbmRpYW5uZXNzIG1pc21hdGNoIGluIHBpZF9pdGVyX2JwZi4KPj4+PiBJdCBz
ZWVtIHRvIGJlIG5vdCByaWdodCBlaGRyLT5lX2lkZW50W0VJX0RBVEFdLiBEbyB3ZSBjYW4gcHJp
bnQgdGhlIHJlYWwgdmFsdWU/Cj4+Pj4gLyoKPj4+PiAgICAqIGVfaWRlbnRbRUlfREFUQV0KPj4+
PiAgICAqLwo+Pj4+ICNkZWZpbmUgRUxGREFUQU5PTkUgICAgIDAKPj4+PiAjZGVmaW5lIEVMRkRB
VEEyTFNCICAgICAxCj4+Pj4gI2RlZmluZSBFTEZEQVRBMk1TQiAgICAgMgo+Pj4+ICNkZWZpbmUg
RUxGREFUQU5VTSAgICAgIDMKPj4+Pgo+Pj4+IGJwZl9vYmplY3RfX2VsZl9pbml0Ogo+Pj4+IG9i
ai0+ZWZpbGUuZWhkciA9IGVoZHIgPSBlbGY2NF9nZXRlaGRyKGVsZik7Cj4+Pj4KPj4+Pj4gbGli
YnBmOiBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBza2VsZXRvbiBCUEYgb2JqZWN0ICdwaWRfaXRlcl9i
cGYnOiAtNDAwMwo+Pj4+PiBFcnJvcjogZmFpbGVkIHRvIG9wZW4gUElEIGl0ZXJhdG9yIHNrZWxl
dG9uCj4+Pj4+Cj4+Pj4+IHJvb3RAdmdvaXA6fiMgdW5hbWUgLWEKPj4+Pj4gTGludXggdmdvaXAg
Ni4yLjAtcmMzLTAyNTk2LWcxYzJjOWMxM2UyNTYgIzI0MiBQUkVFTVBUIFR1ZSBKYW4gMTcKPj4+
Pj4gMDk6MzY6MDggQ0VUIDIwMjMgcHBjIEdOVS9MaW51eAo+Pj4+IE9uIG15IHBjLCBlbGYgaXMg
bGl0dGxlIGVuZGlhbi4KPj4+PiAjIHJlYWRlbGYgLWggdG9vbHMvYnBmL2JwZnRvb2wvcGlkX2l0
ZXIuYnBmLm8KPj4+PiBFTEYgSGVhZGVyOgo+Pj4+ICAgICBNYWdpYzogICA3ZiA0NSA0YyA0NiAw
MiAwMSAwMSAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMAo+Pj4+ICAgICBDbGFzczogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEVMRjY0Cj4+Pj4gICAgIERhdGE6ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMidzIGNvbXBsZW1lbnQsIGxpdHRsZSBlbmRpYW4gIyB4ODZfNjQKPj4+
PiAgICAgVmVyc2lvbjogICAgICAgICAgICAgICAgICAgICAgICAgICAxIChjdXJyZW50KQo+Pj4+
ICAgICBPUy9BQkk6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVOSVggLSBTeXN0ZW0gVgo+
Pj4+ICAgICBBQkkgVmVyc2lvbjogICAgICAgICAgICAgICAgICAgICAgIDAKPj4+PiAgICAgVHlw
ZTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSRUwgKFJlbG9jYXRhYmxlIGZpbGUpCj4+
Pj4gICAgIE1hY2hpbmU6ICAgICAgICAgICAgICAgICAgICAgICAgICAgTGludXggQlBGCj4+Pj4g
ICAgIFZlcnNpb246ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxCj4+Pj4gICAgIEVudHJ5
IHBvaW50IGFkZHJlc3M6ICAgICAgICAgICAgICAgMHgwCj4+Pj4gICAgIFN0YXJ0IG9mIHByb2dy
YW0gaGVhZGVyczogICAgICAgICAgMCAoYnl0ZXMgaW50byBmaWxlKQo+Pj4+ICAgICBTdGFydCBv
ZiBzZWN0aW9uIGhlYWRlcnM6ICAgICAgICAgIDY0ODMyIChieXRlcyBpbnRvIGZpbGUpCj4+Pj4g
ICAgIEZsYWdzOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwCj4+Pj4gICAgIFNpemUg
b2YgdGhpcyBoZWFkZXI6ICAgICAgICAgICAgICAgNjQgKGJ5dGVzKQo+Pj4+ICAgICBTaXplIG9m
IHByb2dyYW0gaGVhZGVyczogICAgICAgICAgIDAgKGJ5dGVzKQo+Pj4+ICAgICBOdW1iZXIgb2Yg
cHJvZ3JhbSBoZWFkZXJzOiAgICAgICAgIDAKPj4+PiAgICAgU2l6ZSBvZiBzZWN0aW9uIGhlYWRl
cnM6ICAgICAgICAgICA2NCAoYnl0ZXMpCj4+Pj4gICAgIE51bWJlciBvZiBzZWN0aW9uIGhlYWRl
cnM6ICAgICAgICAgMTMKPj4+PiAgICAgU2VjdGlvbiBoZWFkZXIgc3RyaW5nIHRhYmxlIGluZGV4
OiAxCj4+Pj4KPj4+Cj4+PiBZZXMsIG11c3QgYmUgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlIGJ1
aWxkLCBJIGdldCBzYW1lIGFzIHlvdSA6Cj4+Pgo+Pj4gJCBMQU5HPSByZWFkZWxmIC1oIHBpZF9p
dGVyLmJwZi5vCj4+PiBFTEYgSGVhZGVyOgo+Pj4gICAgIE1hZ2ljOiAgIDdmIDQ1IDRjIDQ2IDAy
IDAxIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwCj4+PiAgICAgQ2xhc3M6ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBFTEY2NAo+Pj4gICAgIERhdGE6ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMidzIGNvbXBsZW1lbnQsIGxpdHRsZSBlbmRpYW4KPj4+ICAgICBWZXJzaW9u
OiAgICAgICAgICAgICAgICAgICAgICAgICAgIDEgKGN1cnJlbnQpCj4+PiAgICAgT1MvQUJJOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBVTklYIC0gU3lzdGVtIFYKPj4+ICAgICBBQkkgVmVy
c2lvbjogICAgICAgICAgICAgICAgICAgICAgIDAKPj4+ICAgICBUeXBlOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFJFTCAoUmVsb2NhdGFibGUgZmlsZSkKPj4+ICAgICBNYWNoaW5lOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIExpbnV4IEJQRgo+Pj4gICAgIFZlcnNpb246ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMHgxCj4+PiAgICAgRW50cnkgcG9pbnQgYWRkcmVzczogICAg
ICAgICAgICAgICAweDAKPj4+ICAgICBTdGFydCBvZiBwcm9ncmFtIGhlYWRlcnM6ICAgICAgICAg
IDAgKGJ5dGVzIGludG8gZmlsZSkKPj4+ICAgICBTdGFydCBvZiBzZWN0aW9uIGhlYWRlcnM6ICAg
ICAgICAgIDM0NzA0IChieXRlcyBpbnRvIGZpbGUpCj4+PiAgICAgRmxhZ3M6ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDAKPj4+ICAgICBTaXplIG9mIHRoaXMgaGVhZGVyOiAgICAgICAg
ICAgICAgIDY0IChieXRlcykKPj4+ICAgICBTaXplIG9mIHByb2dyYW0gaGVhZGVyczogICAgICAg
ICAgIDAgKGJ5dGVzKQo+Pj4gICAgIE51bWJlciBvZiBwcm9ncmFtIGhlYWRlcnM6ICAgICAgICAg
MAo+Pj4gICAgIFNpemUgb2Ygc2VjdGlvbiBoZWFkZXJzOiAgICAgICAgICAgNjQgKGJ5dGVzKQo+
Pj4gICAgIE51bWJlciBvZiBzZWN0aW9uIGhlYWRlcnM6ICAgICAgICAgMTMKPj4+ICAgICBTZWN0
aW9uIGhlYWRlciBzdHJpbmcgdGFibGUgaW5kZXg6IDEKPj4+Cj4+Pgo+Pj4gV2hlcmVhcyBJIGV4
cGVjdCB0aGUgc2FtZSBhcyBicGZ0b29sIEkgc3VwcG9zZSwgd2hpY2ggaXMgOgo+Pj4KPj4+ICQg
TEFORz0gcmVhZGVsZiAtaCBicGZ0b29sCj4+PiBFTEYgSGVhZGVyOgo+Pj4gICAgIE1hZ2ljOiAg
IDdmIDQ1IDRjIDQ2IDAxIDAyIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwCj4+PiAgICAg
Q2xhc3M6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTEYzMgo+Pj4gICAgIERhdGE6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMidzIGNvbXBsZW1lbnQsIGJpZyBlbmRpYW4KPj4+
ICAgICBWZXJzaW9uOiAgICAgICAgICAgICAgICAgICAgICAgICAgIDEgKGN1cnJlbnQpCj4+PiAg
ICAgT1MvQUJJOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBVTklYIC0gU3lzdGVtIFYKPj4+
ICAgICBBQkkgVmVyc2lvbjogICAgICAgICAgICAgICAgICAgICAgIDAKPj4+ICAgICBUeXBlOiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVYRUMgKEV4ZWN1dGFibGUgZmlsZSkKPj4+ICAg
ICBNYWNoaW5lOiAgICAgICAgICAgICAgICAgICAgICAgICAgIFBvd2VyUEMKPj4+ICAgICBWZXJz
aW9uOiAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MQo+Pj4gICAgIEVudHJ5IHBvaW50IGFk
ZHJlc3M6ICAgICAgICAgICAgICAgMHgxMDAwMjdkMAo+Pj4gICAgIFN0YXJ0IG9mIHByb2dyYW0g
aGVhZGVyczogICAgICAgICAgNTIgKGJ5dGVzIGludG8gZmlsZSkKPj4+ICAgICBTdGFydCBvZiBz
ZWN0aW9uIGhlYWRlcnM6ICAgICAgICAgIDE4NDI4OTYgKGJ5dGVzIGludG8gZmlsZSkKPj4+ICAg
ICBGbGFnczogICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MAo+Pj4gICAgIFNpemUgb2Yg
dGhpcyBoZWFkZXI6ICAgICAgICAgICAgICAgNTIgKGJ5dGVzKQo+Pj4gICAgIFNpemUgb2YgcHJv
Z3JhbSBoZWFkZXJzOiAgICAgICAgICAgMzIgKGJ5dGVzKQo+Pj4gICAgIE51bWJlciBvZiBwcm9n
cmFtIGhlYWRlcnM6ICAgICAgICAgOQo+Pj4gICAgIFNpemUgb2Ygc2VjdGlvbiBoZWFkZXJzOiAg
ICAgICAgICAgNDAgKGJ5dGVzKQo+Pj4gICAgIE51bWJlciBvZiBzZWN0aW9uIGhlYWRlcnM6ICAg
ICAgICAgMzkKPj4+ICAgICBTZWN0aW9uIGhlYWRlciBzdHJpbmcgdGFibGUgaW5kZXg6IDM4Cj4+
Pgo+Pgo+PiBwaWRfaXRlci5icGYubyBzaG91bGQgYmUgZ2VuZXJhdGVkIGZyb20gdGhhdCBjb21t
YW5kIGluIGJwZnRvb2wncyBNYWtlZmlsZToKPj4KPj4gICAgICAgICAgJChPVVRQVVQpJS5icGYu
bzogc2tlbGV0b24vJS5icGYuYyAkKE9VVFBVVCl2bWxpbnV4LmggXAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgJChMSUJCUEZfQk9PVFNUUkFQKQo+PiAgICAgICAgICAgICAgICAgICQoUVVJ
RVRfQ0xBTkcpJChDTEFORykgXAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgLUkkKG9yICQo
T1VUUFVUKSwuKSBcCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAtSSQoc3JjdHJlZSkvdG9v
bHMvaW5jbHVkZS91YXBpLyBcCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAtSSQoTElCQlBG
X0JPT1RTVFJBUF9JTkNMVURFKSBcCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAtZyAtTzIg
LVdhbGwgLWZuby1zdGFjay1wcm90ZWN0b3IgXAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
LXRhcmdldCBicGYgLWMgJDwgLW8gJEAKPj4KPj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0ICIt
dGFyZ2V0IGJwZiIgaXMgc3VwcG9zZWQgdG8gcGljayB0aGUKPj4gZW5kaWFubmVzcyBmb3IgdGhl
IGhvc3QgKHNlZSAibGxjIC0tdmVyc2lvbiB8IGdyZXAgYnBmIi4gSWYgdGhhdCdzIG5vdAo+PiB0
aGUgY2FzZSwgY291bGQgeW91IHBsZWFzZSB0cnkgdG8gdHVybiB0aGF0IGludG8gJy10YXJnZXQg
YnBmZWInIGluIHRoZQo+PiBNYWtlZmlsZSBpbnN0ZWFkPyBJJ2QgYmUgY3VyaW91cyB0byBzZWUg
aWYgaXQgaGVscHMuCj4+Cj4gCj4gSSBndWVzcyBpdCBjYW5ub3Qgd29yayBpZiBpdCBwaWNrcyB0
aGUgZW5kaWFubmVzcyBmb3IgdGhlIGJ1aWxkIGhvc3QuIEl0IAo+IHNob3VsZCBwaWNrIHRoZSBl
bmRpYW5uZXNzIGZvciB0aGUgdGFyZ2V0IGhvc3QuCj4gCj4gVGhhdCdzIHdvcnNlIGl0IHNlZW1z
IHdpdGggYnBmZWIgOiBpdCBmYWlscyBhdCBidWlsZCA6Cj4gCj4gICAgTElOSyAgICAvaG9tZS9j
aGxlcm95L2xpbnV4LXBvd2VycGMvdG9vbHMvYnBmL2JwZnRvb2wvYm9vdHN0cmFwL2JwZnRvb2wK
PiAgICBHRU4gICAgIHZtbGludXguaAo+ICAgIENMQU5HICAgcGlkX2l0ZXIuYnBmLm8KPiAgICBH
RU4gICAgIHBpZF9pdGVyLnNrZWwuaAo+IGxpYmJwZjogZWxmOiBlbmRpYW5uZXNzIG1pc21hdGNo
IGluIHBpZF9pdGVyX2JwZi4KPiBFcnJvcjogZmFpbGVkIHRvIG9wZW4gQlBGIG9iamVjdCBmaWxl
OiBFbmRpYW4gbWlzbWF0Y2gKPiBtYWtlOiAqKiogW01ha2VmaWxlOjIyMjogcGlkX2l0ZXIuc2tl
bC5oXSBFcnJvciA5Mwo+IAo+IAo+IENvbXBsZXRlIGJ1aWxkIGluIGNhc2UgaXQgaGVscHM6Cj4g
Cj4gJCBMQU5HPSBtYWtlIENST1NTX0NPTVBJTEU9cHBjLWxpbnV4LSBBUkNIPXBvd2VycGMKPiAK
PiBBdXRvLWRldGVjdGluZyBzeXN0ZW0gZmVhdHVyZXM6Cj4gLi4uICAgICAgICAgICAgICAgICAg
ICAgICAgIGNsYW5nLWJwZi1jby1yZTogWyAbWzMybW9uG1ttICBdCj4gLi4uICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGx2bTogWyAbWzMxbU9GRhtbbSBdCj4gLi4uICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYmNhcDogWyAbWzMxbU9GRhtbbSBdCj4gLi4u
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYmJmZDogWyAbWzMxbU9GRhtbbSBd
CgpbLi4uXQoKPiAgICBDTEFORyAgIHBpZF9pdGVyLmJwZi5vCj4gICAgR0VOICAgICBwaWRfaXRl
ci5za2VsLmgKPiBsaWJicGY6IGVsZjogZW5kaWFubmVzcyBtaXNtYXRjaCBpbiBwaWRfaXRlcl9i
cGYuCj4gRXJyb3I6IGZhaWxlZCB0byBvcGVuIEJQRiBvYmplY3QgZmlsZTogRW5kaWFuIG1pc21h
dGNoCj4gbWFrZTogKioqIFtNYWtlZmlsZToyMjI6IHBpZF9pdGVyLnNrZWwuaF0gRXJyb3IgOTMK
CgpSaWdodCBzb3JyeSwgSSBmb3Jnb3QgeW91IHdlcmUgY3Jvc3MtY29tcGlsaW5nLiBBcyBmYXIg
YXMgSSB1bmRlcnN0YW5kLAppdCBzZWVtcyB0aGF0IGJwZnRvb2wncyBNYWtlZmlsZSBwaWNrcyB1
cCB0aGUgaG9zdCBlbmRpYW5uZXNzIHdoZW4KYnVpbGRpbmcgdGhlIHNrZWxldG9uIGhlYWRlciBm
aWxlIGFuZCBlbWJlZGRpbmcgdGhlIEJQRiBwcm9ncmFtIGluIGl0LApzbyBsb2FkaW5nIGl0IG9u
IHRoZSB0YXJnZXQgaG9zdCBkb2Vzbid0IHdvcmsuIFdlIHdvdWxkIGxpa2UgaXQgdG8gYnVpbGQK
dGhlIHNrZWxldG9uIHdpdGggdGhlIHRhcmdldCBlbmRpYW5uZXNzIGluc3RlYWQsIGJ1dCBpdCBz
ZWVtcyB0aGF0CmxpYmJwZiBkb2VzIG5vdCBzdXBwb3J0IHRoYXQgKHJlZmVycmluZyB0bwpicGZf
b2JqZWN0X19jaGVja19lbmRpYW5uZXNzKCkgaW4gdG9vbHMvbGliL2JwZi9saWJicGYuYykuCgpJ
IGRvbid0IGtub3cgaWYgdGhlcmUncyBhIHdheSB0byBtYWtlIGxpYmJwZiB3b3JrIGhlcmUsIG9y
IHBsYW5zIHRvIGFkZAppdCAoQW5kcmlpIGRvIHlvdSBrbm93PykuCgpJbiB0aGUgbWVhbnRpbWUs
IHlvdSBjb3VsZCBkaXNhYmxlIHRoZSB1c2Ugb2Ygc2tlbGV0b25zIGluIGJwZnRvb2wsIGJ5CnJl
bW92aW5nICJjbGFuZy1icGYtY28tcmUiIGZyb20gRkVBVFVSRV9URVNUUyBmcm9tIHRoZSBNYWtl
ZmlsZS4gWW91CnNob3VsZCBnZXQgYSBmdW5jdGlvbmFsIGJpbmFyeSwgd2hpY2ggd291bGQgb25s
eSBtaXNzIGEgZmV3IGZlYXR1cmVzCihuYW1lbHksIHByaW50aW5nIHRoZSBwaWRzIG9mIHByb2dy
YW1zIGhvbGRpbmcgcmVmZXJlbmNlcyB0byBCUEYKcHJvZ3JhbXMsIGFuZCB0aGUgImJwZnRvb2wg
cHJvZyBwcm9maWxlIiBjb21tYW5kKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
