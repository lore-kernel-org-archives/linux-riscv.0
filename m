Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BF0C61D97
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsyQm2iPZgfK4XydD4sHlSk8lBQdp/jp14pA18m0Ajs=; b=2oimIUWJ1nHZhC
	279+9onGBhNl4WjVBQ9dqsO/mcadPuP91wgIkOpyn5BXTLrL2RPeq1bbTmAFf69NK+hja0B7fgqaw
	s7c0QFJNdp9DIwnvdaedVhWW5wR6mekJH2GnOtboR/Pud3YgsOyvrEgDa7ITissSnHKcMCl2YHPo2
	qnRoPvCrFbq0cLwa/H3qiUu2V4fLcn/zBwQt9Rnfxy+guHm/D1sJ3r4bneFF2AqVPPU4b9SEMZwEr
	l3ZrwUhcXOn5w5HXNhDD7zvLlcPxRMk5A3dh9s0kLbBV/BoHStD1N+EK2z9LJad8wuYa3OGErOQz5
	L+75UmR3ufonZ7WeCJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuWc-00Gufe-2G; Mon, 23 Jan 2023 10:58:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuWY-00GueZ-LR
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 10:58:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso8213724wmq.5
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 02:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GurJgwjoFQNdZqxTjXXtdzYvuIXsPElEsE5t8iRI348=;
        b=g4dvnAt/e720eUN0Hw3mkuPvGH+bA9swS9a77z573C2TdQWW6YccWP0BkoVi78A7fD
         9k0EDsHOFkjnhw2wOEifD+LuTl/asks5WHcBsVRuAWdUJEmWeCb5sfiPEmcBupKXco7L
         GbvFD/7MEwApELk4GAbMkvKPw8jqR4On0BEH3X+b1r7t6TVjEb9KegIn8YBGFz3Vv8fw
         Jh0FiWJzDYchnJxivLRKF4Wflf4aRgMtJaDCLIK/Po9RydhxUm8dX6Qe93tyzuQYH5D1
         Lg/g6wjAGZI6WGgQ22tQbhjn6II6Mckqt+Hjv3IKqVUmi0cBYkGR5LBWB5l5q+psIVBr
         2gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GurJgwjoFQNdZqxTjXXtdzYvuIXsPElEsE5t8iRI348=;
        b=X+v4fDzWi6gNFSR0xarezA/o9zS+IAkVs4NcyVAXK4tzgD9P0ItV6wuu6zqdsHaQb0
         xL+YSg/qKY/wqFbRRhTHNR20RbMNiKgGlbJBDAowy+LKlJ4JmzhFTZwi79c8ndianLIc
         +kJtLtxGIGlAjCu0k5fNRGNTxcb54+n7czy9xQsKTdylolAuIEj3HCmD8vS3sovHycEh
         gjzMKMTA8hAUuM5zcxaug04ZCHrjXHSLFe7V1s5k3tSTbroSRw+xjqZgYUnJS1B1cCqe
         WIvHcRzvfbQrh4lNSHsdUaQX80MbB6KsuchIkv26GuhQeZLHQWAY7cKQDtRvDvpNHooM
         edTg==
X-Gm-Message-State: AFqh2kqVzP+rEXj1keY1HKDXCPlMi2PeMllh6sbQEkjhTr2OsGMkAdy6
	JnL+t3EN9Avxjf8qvxeV9pkbHA==
X-Google-Smtp-Source: AMrXdXsPRwYrnaXw9xX4B1eeQb0D5xrFH9eOI3n097aQpLYDHeyfCXKP4eQdFGO4lnW4dO+O4hOv4w==
X-Received: by 2002:a05:600c:3545:b0:3c6:e60f:3f4a with SMTP id i5-20020a05600c354500b003c6e60f3f4amr23649013wmq.1.1674471479963;
        Mon, 23 Jan 2023 02:57:59 -0800 (PST)
Received: from ?IPV6:2a02:8011:e80c:0:c17d:2d7f:4a94:488b? ([2a02:8011:e80c:0:c17d:2d7f:4a94:488b])
        by smtp.gmail.com with ESMTPSA id s5-20020a1cf205000000b003b47b80cec3sm10322397wmc.42.2023.01.23.02.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 02:57:59 -0800 (PST)
Message-ID: <20dbac19-d510-c8f5-fd3d-588cb08a3afa@isovalent.com>
Date: Mon, 23 Jan 2023 10:57:58 +0000
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
 <43e6cd9f-ac54-46da-dba9-d535a2a77207@isovalent.com>
 <26e09ae3-dc7a-858d-c15c-7c2ff080d36d@csgroup.eu>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <26e09ae3-dc7a-858d-c15c-7c2ff080d36d@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_025802_957877_1BA9E815 
X-CRM114-Status: GOOD (  12.01  )
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

MjAyMy0wMS0yMyAwNzo1NyBVVEMrMDAwMCB+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4KPiAKPiAKPiBMZSAxNy8wMS8yMDIzIMOgIDE2OjQyLCBRdWVudGlu
IE1vbm5ldCBhIMOpY3JpdMKgOgo+Pgo+PiBJbiB0aGUgbWVhbnRpbWUsIHlvdSBjb3VsZCBkaXNh
YmxlIHRoZSB1c2Ugb2Ygc2tlbGV0b25zIGluIGJwZnRvb2wsIGJ5Cj4+IHJlbW92aW5nICJjbGFu
Zy1icGYtY28tcmUiIGZyb20gRkVBVFVSRV9URVNUUyBmcm9tIHRoZSBNYWtlZmlsZS4gWW91Cj4+
IHNob3VsZCBnZXQgYSBmdW5jdGlvbmFsIGJpbmFyeSwgd2hpY2ggd291bGQgb25seSBtaXNzIGEg
ZmV3IGZlYXR1cmVzCj4+IChuYW1lbHksIHByaW50aW5nIHRoZSBwaWRzIG9mIHByb2dyYW1zIGhv
bGRpbmcgcmVmZXJlbmNlcyB0byBCUEYKPj4gcHJvZ3JhbXMsIGFuZCB0aGUgImJwZnRvb2wgcHJv
ZyBwcm9maWxlIiBjb21tYW5kKS4KPiAKPiBPaywgd2l0aCAiY2xhbmctYnBmLWNvLXJlIiByZW1v
dmVkLCBicGZ0b29sIGRvZXNuJ3QgY29tcGxhaW4uCj4gCj4gSG93ZXZlciwgZG9lcyBpdCB3b3Jr
IGF0IGFsbCA/CgpZZXMgaXQgZG9lcy4KCj4gCj4gSSBzdGFydGVkIGEgJ3RjcGR1bXAnLCBJIGNv
bmZpcm1lZCB3aXRoICcgYnBmX2ppdF9lbmFibGUgPT0gMicgdGhhdCBhIAo+IEJQRiBqaXR0ZWQg
cHJvZ3JhbSBpcyBjcmVhdGVkIGJ5IHRjcGR1bXAuCj4gCj4gJ2JwdG9vbCBwcm9nIHNob3cnIGFu
ZCAnYnBmdG9vbCBwcm9nIGxpc3QnIHJldHVybnMgbm8gcmVzdWx0LgoKQnBmdG9vbCB3b3JrcyB3
aXRoIGVCUEYsIG5vdCB3aXRoIHRoZSBvbGRlciAiY2xhc3NpYyIgQlBGIChjQlBGKSB1c2VkIGJ5
CnRjcGR1bXAuIFlvdSBzaG91bGQgc2VlIHByb2dyYW1zIGxpc3RlZCBpZiB5b3UgbG9hZCBhbnl0
aGluZyBlQlBGLCBmb3IKZXhhbXBsZSBieSB1c2luZyBCQ0MgdG9vbHMsIGJwZnRyYWNlLCBvciBs
b2FkIGFuIGVCUEYgcHJvZ3JhbSBhbnkgb3RoZXIKd2F5IGZyb20gdXNlciBzcGFjZToKCgkkIGVj
aG8gImludCBtYWluKHZvaWQpIHtyZXR1cm4gMDt9IiB8IFwKCQljbGFuZyAtTzIgLXRhcmdldCBi
cGYgLWMgLW8gZm9vLm8gLXggYyAtCgkjIGJwZnRvb2wgcHJvZyBsb2FkIGZvby5vIC9zeXMvZnMv
YnBmL2ZvbyB0eXBlIHhkcAoJIyBicGZ0b29sIHByb2cgbGlzdAoJIyBicGZ0b29sIHByb2cgZHVt
cCBqaXRlZCBuYW1lIG1haW4KCSMgcm0gL3N5cy9mcy9icGYvZm9vCgpJIGtub3cgdGNwZHVtcCBp
dHNlbGYgY2FuIHNob3cgdGhlIGNCUEYgYnl0ZWNvZGUgZm9yIGl0cyBwcm9ncmFtcywgYnV0IEkK
ZG9uJ3Qga25vdyBvZiBhbm90aGVyIHdheSB0byBkdW1wIHRoZSBKSVQtZWQgaW1hZ2UgZm9yIGNC
UEYgcHJvZ3JhbXMuCkRyZ24gY291bGQgcHJvYmFibHkgZG8gaXQsIHdpdGgga2VybmVsIGRlYnVn
IHN5bWJvbHMuCgpRdWVudGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
