Return-Path: <SRS0=lw90=JS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C098AC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 15:27:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 157726144B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Apr 2021 15:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 157726144B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=isovalent.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l0L/cSEdFmFDBF+6pLhasvVrwsK0G51WR/ZmK4nnsnk=; b=MmFaOlVTpf1yzwZh7Kl98TVRr
	qVB+UIPwsodJxvq1cVHQ04bloJnyYe4grOiQJ3eHX3ShMpfxZtbdNzCqBazMZcLypbNcukQYIAoDu
	uz/kOeiZM9NePq2F7N2kVCZOyECm7xh8ohfvQqILRhCWx8DmUgkDoMYOVpdu4rZW47N1VL6HI599r
	4cULwJFRCN8RV7y8LAYp6bzbgnMo15qrMznWunZiWRCuh+c95X11aBVO3K4Tlh9Ua7nhY+xl7hgO/
	zlcRfhkVmLvVpBZcQo75p8GweWTbdYBib9jbgV8Ik7R1et/x3XvsjK5ooenmo7/q53kBgLYTshoX6
	dyVVCgaFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZEl6-00Eg9w-N5; Wed, 21 Apr 2021 15:27:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZEl1-00Eg91-7z
 for linux-riscv@desiato.infradead.org; Wed, 21 Apr 2021 15:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=gKdt8Wk+0o9N/o4Eeh7jFivsYAp+6odRUk2hDoOYTNE=; b=oAoTCmD3NqYL/EyRQ8dummksGz
 +xTAdQw+ar0rZm9FnAKicRnuaaRK8nuiXFvX+htyYZIpQI8DMJ3u3f2/ULfLcoaDVP1wav+lAs7/o
 ihoh8b0S8ovhwyTSLksF/GDxn7guWvRRQULNaSKIz4JukWSOZPgQPMweU7nNf/80XvfldgjvsvuRF
 d5kdArOGCmY5C1N7WoQT6i8PC0lcF25/KB+dftT2XONjzY8s/8EbuWODXHvKtCU5psrfcoELLy1ex
 D59lYljOlhrJVIq49W79TslszcbDLx55jTsu4JoA0Btfi8djJ0oJBH4DrT4JIyJmQYPtMMAsJmCWm
 g3dJK/Uw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZEkx-00Czr8-8L
 for linux-riscv@lists.infradead.org; Wed, 21 Apr 2021 15:27:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so1517302wmd.3
 for <linux-riscv@lists.infradead.org>; Wed, 21 Apr 2021 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isovalent-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gKdt8Wk+0o9N/o4Eeh7jFivsYAp+6odRUk2hDoOYTNE=;
 b=Ld1STCnsE1eouA8OovEt+JR3kvLhy+38SIeXNlwIkDlOiLq05bK7Xtf0K9jrzy0JBg
 l7Vv9cqjwitQLtZanAgbC4FHzf0jZYrRiLFa1aiMF+HviBubCWXTbitrlhIeZgclqfrr
 rNSiHWguSr/4GVnfTLurIDqrGY85zcHBi1fjyNVIwnwt04M07BxCWghuUhWyyCRBw0PQ
 kODch46wzB/NfbSZH3OkAXLF7Scy075Euz1AgKCdsC/jqLZFujuUsUSTB9qK2x31ltBH
 td1grGFzAsMrRdOHHH0QYY+3dvXwt//4U27ImWFpSaFnt7wVbc0SpT/Y+WZBQRPuwY4A
 rcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gKdt8Wk+0o9N/o4Eeh7jFivsYAp+6odRUk2hDoOYTNE=;
 b=KP5TYouSql+y0Hp/0B6b7v1Ns7laZ5MT+JxgVVK93fkODxvBDgk/alJp4SFl2nRzMd
 b6xwmZFrOZ9Dan3jnVnktHnAcHQpllm457zxsLvCSjEMVWiTiYWSJWPpFTBo/ox1Qs8f
 W1D5UPLbDkHVm70MgwhFe9KjNUA0lxjreKRuJLgVnUde8wlKSeHoUo1NGRGGTF1/xc5H
 s+1am9B6AmUugAPCXuKGYaOi1OEoWnlz8nSSS8knClwZaP4IwuaSTipSepQUzcICH9vr
 YdMr0Pdn/Uc7QlCTlGb2/WG3DG3taHU94vuwxa+Zybv2q20JopI76OUg1cMhQYhoMCGP
 +qrw==
X-Gm-Message-State: AOAM532bPflhq0VUIphNzdVHeu+CI/IRj9nmV9RvzD2T71s1aqxws3Bn
 nB903fOPlMbngvppnjxqIDJq9g==
X-Google-Smtp-Source: ABdhPJx/Z4/wH0IczXzrpu1/+CHFDyPCB4UahTsagrUa+vs9LV/LiT8hoPliplY5euRpNBomq4NZqQ==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr10451672wmf.17.1619018828018; 
 Wed, 21 Apr 2021 08:27:08 -0700 (PDT)
Received: from [192.168.1.8] ([149.86.81.177])
 by smtp.gmail.com with ESMTPSA id n2sm3159970wmb.32.2021.04.21.08.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 08:27:07 -0700 (PDT)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ian Rogers <irogers@google.com>, Song Liu <songliubraving@fb.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Zi Shen Lim <zlim.lnx@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Shubham Bansal <illusionist.neo@gmail.com>,
 Mahesh Bandewar <maheshb@google.com>, Will Deacon <will@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>, paulburton@kernel.org, Jonathan Corbet
 <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Tobias Klauser <tklauser@distanz.ch>,
 linux-mips@vger.kernel.org, grantseltzer@gmail.com,
 Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Luke Nelson <luke.r.nels@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 KP Singh <kpsingh@kernel.org>, iecedge@gmail.com,
 Simon Horman <horms@verge.net.au>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Yonghong Song <yhs@fb.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 tsbogend@alpha.franken.de, Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, Wang YanQing <udknight@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 bpf <bpf@vger.kernel.org>, Jianlin Lv <Jianlin.Lv@arm.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
 <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
 <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
 <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
 <7dc31256-eb1d-dc93-5e55-2de27475e0c6@csgroup.eu>
From: Quentin Monnet <quentin@isovalent.com>
Message-ID: <c84445eb-8621-9ac2-2e8a-b58b8241903a@isovalent.com>
Date: Wed, 21 Apr 2021 16:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <7dc31256-eb1d-dc93-5e55-2de27475e0c6@csgroup.eu>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_082711_330966_3E2C4A6A 
X-CRM114-Status: GOOD (  27.44  )
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

MjAyMS0wNC0yMSAxNToxMCBVVEMrMDIwMCB+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4KPiAKPiAKPiBMZSAyMC8wNC8yMDIxIMOgIDA1OjI4LCBBbGV4ZWkg
U3Rhcm92b2l0b3YgYSDDqWNyaXTCoDoKPj4gT24gU2F0LCBBcHIgMTcsIDIwMjEgYXQgMToxNiBB
TSBDaHJpc3RvcGhlIExlcm95Cj4+IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3Rl
Ogo+Pj4KPj4+Cj4+Pgo+Pj4gTGUgMTYvMDQvMjAyMSDDoCAwMTo0OSwgQWxleGVpIFN0YXJvdm9p
dG92IGEgw6ljcml0IDoKPj4+PiBPbiBUaHUsIEFwciAxNSwgMjAyMSBhdCA4OjQxIEFNIFF1ZW50
aW4gTW9ubmV0Cj4+Pj4gPHF1ZW50aW5AaXNvdmFsZW50LmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+
IDIwMjEtMDQtMTUgMTY6MzcgVVRDKzAyMDAgfiBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dl
YXJib3gubmV0Pgo+Pj4+Pj4gT24gNC8xNS8yMSAxMTozMiBBTSwgSmlhbmxpbiBMdiB3cm90ZToK
Pj4+Pj4+PiBGb3IgZGVidWdnaW5nIEpJVHMsIGR1bXBpbmcgdGhlIEpJVGVkIGltYWdlIHRvIGtl
cm5lbCBsb2cgaXMKPj4+Pj4+PiBkaXNjb3VyYWdlZCwKPj4+Pj4+PiAiYnBmdG9vbCBwcm9nIGR1
bXAgaml0ZWQiIGlzIG11Y2ggYmV0dGVyIHdheSB0byBleGFtaW5lIEpJVGVkIGR1bXBzLgo+Pj4+
Pj4+IFRoaXMgcGF0Y2ggZ2V0IHJpZCBvZiB0aGUgY29kZSByZWxhdGVkIHRvIGJwZl9qaXRfZW5h
YmxlPTIgbW9kZSBhbmQKPj4+Pj4+PiB1cGRhdGUgdGhlIHByb2MgaGFuZGxlciBvZiBicGZfaml0
X2VuYWJsZSwgYWxzbyBhZGRlZCBhdXhpbGlhcnkKPj4+Pj4+PiBpbmZvcm1hdGlvbiB0byBleHBs
YWluIGhvdyB0byB1c2UgYnBmX2ppdF9kaXNhc20gdG9vbCBhZnRlciB0aGlzCj4+Pj4+Pj4gY2hh
bmdlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlhbmxpbiBMdiA8Smlhbmxpbi5M
dkBhcm0uY29tPgo+Pj4+Pgo+Pj4+PiBIZWxsbywKPj4+Pj4KPj4+Pj4gRm9yIHdoYXQgaXQncyB3
b3J0aCwgSSBoYXZlIGFscmVhZHkgc2VlbiBwZW9wbGUgZHVtcCB0aGUgSklUIGltYWdlIGluCj4+
Pj4+IGtlcm5lbCBsb2dzIGluIFFlbXUgVk1zIHJ1bm5pbmcgd2l0aCBqdXN0IGEgYnVzeWJveCwg
bm90IGZvciBrZXJuZWwKPj4+Pj4gZGV2ZWxvcG1lbnQsIGJ1dCBpbiBhIGNvbnRleHQgd2hlcmUg
YnVpZGluZy91c2luZyBicGZ0b29sIHdhcyBub3QKPj4+Pj4gcG9zc2libGUuCj4+Pj4KPj4+PiBJ
ZiBidWlsZGluZy91c2luZyBicGZ0b29sIGlzIG5vdCBwb3NzaWJsZSB0aGVuIG1ham9yaXR5IG9m
IHNlbGZ0ZXN0cwo+Pj4+IHdvbid0Cj4+Pj4gYmUgZXhlcmNpc2VkLiBJIGRvbid0IHRoaW5rIHN1
Y2ggZW52aXJvbm1lbnQgaXMgc3VpdGFibGUgZm9yIGFueSBraW5kCj4+Pj4gb2YgYnBmIGRldmVs
b3BtZW50LiBNdWNoIHNvIGZvciBKSVQgZGVidWdnaW5nLgo+Pj4+IFdoaWxlIGJwZl9qaXRfZW5h
YmxlPTIgaXMgbm90aGluZyBidXQgdGhlIGRlYnVnZ2luZyB0b29sIGZvciBKSVQKPj4+PiBkZXZl
bG9wZXJzLgo+Pj4+IEknZCByYXRoZXIgbnVrZSB0aGF0IGNvZGUgaW5zdGVhZCBvZiBjYXJyeWlu
ZyBpdCBmcm9tIGtlcm5lbCB0byBrZXJuZWwuCj4+Pj4KPj4+Cj4+PiBXaGVuIEkgaW1wbGVtZW50
ZWQgSklUIGZvciBQUEMzMiwgaXQgd2FzIGV4dHJlbWVseSBoZWxwZnVsbC4KPj4+Cj4+PiBBcyBm
YXIgYXMgSSB1bmRlcnN0YW5kLCBmb3IgdGhlIHRpbWUgYmVpbmcgYnBmdG9vbCBpcyBub3QgdXNh
YmxlIGluCj4+PiBteSBlbnZpcm9ubWVudCBiZWNhdXNlIGl0Cj4+PiBkb2Vzbid0IHN1cHBvcnQg
Y3Jvc3MgY29tcGlsYXRpb24gd2hlbiB0aGUgdGFyZ2V0J3MgZW5kaWFuZXNzIGRpZmZlcnMKPj4+
IGZyb20gdGhlIGJ1aWxkaW5nIGhvc3QKPj4+IGVuZGlhbmVzcywgc2VlIGRpc2N1c3Npb24gYXQK
Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMWU2NmEwOS01MTRmLWY0MjYtYjllMi0x
M2JhYWIwYjkzOGJAY3Nncm91cC5ldS8KPj4+Cj4+Pgo+Pj4gVGhhdCdzIHJpZ2h0IHRoYXQgc2Vs
ZnRlc3RzIGNhbid0IGJlIGV4ZXJjaXNlZCBiZWNhdXNlIHRoZXkgZG9uJ3QgYnVpbGQuCj4+Pgo+
Pj4gVGhlIHF1ZXN0aW9uIG1pZ2h0IGJlIGNhbmRpZCBhcyBJIGRpZG4ndCBpbnZlc3RpZ2F0ZSBt
dWNoIGFib3V0IHRoZQo+Pj4gcmVwbGFjZW1lbnQgb2YgImJwZl9qaXRfZW5hYmxlPTIKPj4+IGRl
YnVnZ2luZyBtb2RlIiBieSBicGZ0b29sLCBob3cgZG8gd2UgdXNlIGJwZnRvb2wgZXhhY3RseSBm
b3IgdGhhdCA/Cj4+PiBFc3BlY2lhbGx5IHdoZW4gdXNpbmcgdGhlIEJQRgo+Pj4gdGVzdCBtb2R1
bGUgPwo+Pgo+PiB0aGUga2VybmVsIGRldmVsb3BlcnMgY2FuIGFkZCBhbnkgYW1vdW50IG9mIHBy
aW50ayBhbmQgZHVtcHMgdG8gZGVidWcKPj4gdGhlaXIgY29kZSwKPj4gYnV0IHN1Y2ggZGVidWdn
aW5nIGFpZCBzaG91bGQgbm90IGJlIHBhcnQgb2YgdGhlIHByb2R1Y3Rpb24ga2VybmVsLgo+PiBU
aGF0IHN5c2N0bCB3YXMgdHdvIHRoaW5ncyBhdCBvbmNlOiBkZWJ1Z2dpbmcgdG9vbCBmb3Iga2Vy
bmVsIGRldnMgYW5kCj4+IGludHJvc3BlY3Rpb24gZm9yIHVzZXJzLgo+PiBicGZ0b29sIGppdCBk
dW1wIHNvbHZlcyB0aGUgMm5kIHBhcnQuIEl0IHByb3ZpZGVzIEpJVCBpbnRyb3NwZWN0aW9uIHRv
Cj4+IHVzZXJzLgo+PiBEZWJ1Z2dpbmcgb2YgdGhlIGtlcm5lbCBjYW4gYmUgZG9uZSB3aXRoIGFu
eSBhbW91bnQgb2YgYXV4aWxpYXJ5IGNvZGUKPj4gaW5jbHVkaW5nIGNhbGxpbmcgcHJpbnRfaGV4
X2R1bXAoKSBkdXJpbmcgaml0aW5nLgo+Pgo+IAo+IEkgZ2V0IHRoZSBmb2xsb3dpbmcgbWVzc2Fn
ZSB3aGVuIHRyeWluZyB0aGUgY29tbWFuZCBzdWdnZXN0ZWQgaW4gdGhlCj4gcGF0Y2ggbWVzc2Fn
ZToKPiAKPiByb290QHZnb2lwOn4jIC4vYnBmdG9vbCBwcm9nIGR1bXAgaml0ZWQKPiBFcnJvcjog
Tm8gbGliYmZkIHN1cHBvcnQKPiAKPiBDaHJpc3RvcGhlCgpIaSBDaHJpc3RvcGhlLAoKQnBmdG9v
bCByZWxpZXMgb24gbGliYmZkIHRvIGRpc2Fzc2VtYmxlIHRoZSBKSVQtZWQgaW5zdHJ1Y3Rpb25z
LCBidXQKdGhpcyBpcyBhbiBvcHRpb25hbCBkZXBlbmRlbmN5IGFuZCB5b3VyIHZlcnNpb24gb2Yg
YnBmdG9vbCBoYXMgYmVlbgpjb21waWxlZCB3aXRob3V0IGl0LgoKWW91IGNvdWxkIHRyeSB0byBp
bnN0YWxsIGl0IG9uIHlvdXIgc3lzdGVtIChpdCBpcyB1c3VhbGx5IHNoaXBwZWQgd2l0aApiaW51
dGlscywgcGFja2FnZSAiYmludXRpbHMtZGV2IiBvbiBVYnVudHUgZm9yIGV4YW1wbGUpLiBJZiB5
b3Ugd2FudCB0bwpjcm9zcy1jb21waWxlIGJwZnRvb2wsIHRoZSBsaWJiZmQgdmVyc2lvbiBwcm92
aWRlZCBieSB5b3VyIGRpc3RyaWJ1dGlvbgptYXkgbm90IGluY2x1ZGUgc3VwcG9ydCBmb3IgdGhl
IHRhcmdldCBhcmNoaXRlY3R1cmUuIEluIHRoYXQgY2FzZSB5b3UKd291bGQgaGF2ZSB0byBidWls
ZCBsaWJiZmQgeW91cnNlbGYgdG8gbWFrZSBzdXJlIGl0IHN1cHBvcnRzIGl0LgoKVGhlbiB5b3Ug
Y2FuIGNsZWFuIHVwIHRoZSByZXN1bHRzIGZyb20gdGhlIGxpYmJmZCBwcm9iaW5nOgoKICAgICQg
bWFrZSAtQyB0b29scy9idWlsZC9mZWF0dXJlLyBjbGVhbgoKYW5kIHJlY29tcGlsZSBicGZ0b29s
LgoKSSBob3BlIHRoaXMgaGVscHMsClF1ZW50aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
