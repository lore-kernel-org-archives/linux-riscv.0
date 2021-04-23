Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D940C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 11:30:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB96600CC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 11:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CB96600CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gIFQCuTLzFyEPPSZJ22UQf6oIRlCDpyRsQD+RLMe+WY=; b=BVg+pBEze8eZtAlzV9hxyxcrL
	2w/qGj9cnI2eBG6uMLmoFhteWh5Gjhkv44XY9c3p2zLqYrp7bEYXZta1gHtYTz4s+kYx0PTcDg4Km
	hH9oSPy+fGbysCrGVo3LLli1InL4m7me4VvYGzp2GUWhmRX6ipNCglfsJAw4fVhT9I3nE45oRTFNA
	6x5Kinv6A2k0x7HvKHE98CrHa2W34WlTQpAFAhYXrv5kocuqvlqBxw68ss6YOcQc0yVb5WyLTTQJT
	GDA4U40hps/RMOeWevd6fiUj/Owtgp1BVpfynsKvPpW0GNK802GNqgGEhkVkv/AskPUrhA8m7pGP6
	oMAO+3lmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZu0q-001N4T-B3; Fri, 23 Apr 2021 11:30:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZu0m-001N4E-Am; Fri, 23 Apr 2021 11:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=68/c07PZMcwik1HkH4xDr9Ko7Axr/jhYcFwAqVAm1Co=; b=pOt72VHQtZKpoypE4sAN479sAq
 JHL3eXukkGoKaYY6DF4mCd28PJP2dM9Y8J56KYDKVHNzJhujKL2CbWYtNKfjGENYWxBfVZQ9NU6ci
 +M4xxDROqRzA4DmDBOXphAoJM+RwaXYxjLRmkIjHWDt6w+HB7jq/3XpeVp0M4cYw0wz+mRebU8BQf
 4MpylGj+eiDLZ6JX3LSNLbyUrGBdV2jgRLzrTegbGf/p2IojtEdtyw+XVSNA3fDsNfg0xcmBdH2cY
 vt1VFRmXY+bx+2qsfrnvzdYU4EsN4fCV7yAry9hSil+a8bjrAjYXJfvjkSv4f6zBG8vbfZ2yGy4ai
 mHSxGdyA==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZu0i-00EMbs-5s; Fri, 23 Apr 2021 11:30:14 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FRXBx1lS5z9ttBV;
 Fri, 23 Apr 2021 13:30:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YdSTSv2p5ZBt; Fri, 23 Apr 2021 13:30:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FRXBx0Vjkz9ttBQ;
 Fri, 23 Apr 2021 13:30:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B81628B84D;
 Fri, 23 Apr 2021 13:30:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PdVzE1YVA3q8; Fri, 23 Apr 2021 13:30:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9748F8B765;
 Fri, 23 Apr 2021 13:29:59 +0200 (CEST)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Quentin Monnet <quentin@isovalent.com>,
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
 <be132117-f267-5817-136d-e1aeb8409c2a@csgroup.eu>
 <58296f87-ad00-a0f5-954b-2150aa84efc4@isovalent.com>
 <6a809d3f-c9e3-0eb7-9c1d-a202ad848424@csgroup.eu>
 <ab1c3803-179c-7882-2bba-9eeda5211ad1@isovalent.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <90e2da42-6924-4246-f2f6-cfb2778cd804@csgroup.eu>
Date: Fri, 23 Apr 2021 13:29:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <ab1c3803-179c-7882-2bba-9eeda5211ad1@isovalent.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_043012_547085_35F9F715 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAyMy8wNC8yMDIxIMOgIDEyOjU5LCBRdWVudGluIE1vbm5ldCBhIMOpY3JpdMKgOgo+IDIw
MjEtMDQtMjMgMTI6NDYgVVRDKzAyMDAgfiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxl
cm95QGNzZ3JvdXAuZXU+Cj4+Cj4+Cj4+IExlIDIzLzA0LzIwMjEgw6AgMTI6MjYsIFF1ZW50aW4g
TW9ubmV0IGEgw6ljcml0wqA6Cj4+PiAyMDIxLTA0LTIzIDA5OjE5IFVUQyswMjAwIH4gQ2hyaXN0
b3BoZSBMZXJveQo+Pj4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KPj4+Cj4+PiBbLi4u
XQo+Pj4KPj4+PiBJIGZpbmFsbHkgbWFuYWdlZCB0byBjcm9zcyBjb21waWxlIGJwZnRvb2wgd2l0
aCBsaWJicGYsIGxpYm9wY29kZXMsCj4+Pj4gcmVhZGxpbmUsIG5jdXJzZXMsIGxpYmNhcCwgbGli
eiBhbmQgYWxsIG5lZWRlZCBzdHVmZi4gV2FzIG5vdCBlYXN5IGJ1dCBJCj4+Pj4gbWFkZSBpdC4K
Pj4+Cj4+PiBMaWJjYXAgaXMgb3B0aW9uYWwgYW5kIGJwZnRvb2wgZG9lcyBub3QgdXNlIHJlYWRs
aW5lIG9yIG5jdXJzZXMuIE1heSBJCj4+PiBhc2sgaG93IHlvdSB0cmllZCB0byBidWlsZCBpdD8K
Pj4KPj4gY2QgdG9vbHMvYnBmLwo+Pgo+PiBtYWtlIEFSQ0g9cG93ZXJwYyBDUk9TU19DT01QSUxF
PXBwYy1saW51eC0KPiAKPiBPaywgeW91IGNvdWxkIHRyeSBydW5uaW5nIGRpcmVjdGx5IGZyb20g
dG9vbHMvYnBmL2JwZnRvb2wvIG5leHQgdGltZQo+IGluc3RlYWQuCj4gCj4gUmVhZGxpbmUgYXQg
bGVhc3QgaXMgZm9yIGEgZGlmZmVyZW50IHRvb2wgdW5kZXIgdG9vbHMvYnBmLywgYnBmX2RiZyAo
QnV0Cj4gSSdtIHN0aWxsIG5vdCBzdXJlIHdoZXJlIHRoYXQgbmN1cnNlcyByZXF1aXJlbWVudCB3
YXMgcHVsbGVkIGZyb20pLiBUaGUKPiByZXF1aXJlbWVudHMgZm9yIHNwZWNpZmljIGtlcm5lbCBv
cHRpb25zIHByb2JhYmx5IGNhbWUgZnJvbSB5ZXQgYW5vdGhlcgo+IHRvb2wgKHJ1bnFzbG93ZXIs
IEkgdGhpbmspLgo+IAoKbmN1cnNlcyAob3IgdGVybWNhcCkgaXMgcmVxdWlyZWQgYnkgcmVhZGxp
bmUKCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
