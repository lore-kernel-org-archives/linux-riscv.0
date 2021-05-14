Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA71C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 06:35:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F57B61446
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 06:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F57B61446
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UcilsHmfnAJf7R7VwvOAu+JBLWVYfA6/TUjK7p3ZenI=; b=mbWpRKuEYOXUlUCVpGHYAJs/A
	ufOINKWVB7j4S7pnXy7LzKmx+jopueDjJgVywBoFtLzJNgTpZ5VGXZbCdMgbBRJnnekN35eyxPuRX
	RXwXpB0zJqsrjz2G6Ypb4pqOhRE9Pozmy/s/KoTnt3kd35oAeuw2IMJw0o2IA5mTvzE8SLlVDcgkn
	ZOOPsD2EdDeZS1JIciYhyXvS5ngATyIaCtQO4L+CNF2xxDrgHnAXP5KfOxNKvsNqbXr39mUrgP+5S
	/OZqvSdLClxqj87bPFDL59H88VDm33Y7KQM1SycSN+QuzOFDdvW+8svx9EEfPI7JhVzs7J0BHms3S
	sj5Mrnudw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhRPH-007J8g-0F; Fri, 14 May 2021 06:34:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhROy-007J3j-CJ; Fri, 14 May 2021 06:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=VXceOUtE5LSPd2DlJFL6vCZQ0yv1XPzn5JDz73q2p4U=; b=c+rbsEiKQpHX/+LjOaL/Hj8hpy
 FIf6oyy7honjydbhcVQtN9b+MrT1h/xQhrwY98KTHO5rbB/Jd4VwwhykW+wwwsCsCYVICIVaokmE9
 X2v2EkndNP7crA1AEPSXJmhw17yB7OMsxtdujbx0KHyh5v1DsoEi9B0EFdQJoJOScwCHPnbvI/wRr
 79fjF8E5Oyv09zz0IDV3WQy9s2jDPlQjensA5K02NO6qisw/lXeFCWqaB73UUJ47DL1NWurUnMnVz
 20n2Hm529Gva4VuW50n1ZhvCE2pS4IbfyFHhZrAlafU5FyalQ/JVGyhH0URWugGQypi6jmoJMi77Y
 vT7hiiXA==;
Received: from pegase2.c-s.fr ([93.17.235.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhROt-00BkbA-TT; Fri, 14 May 2021 06:34:22 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FhJdw0rX3z9sZJ;
 Fri, 14 May 2021 08:34:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2g3l4M-96ajV; Fri, 14 May 2021 08:34:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FhJdv1cGvz9sZM;
 Fri, 14 May 2021 08:34:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E667D8B7F8;
 Fri, 14 May 2021 08:34:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uFPDiVXY0wO1; Fri, 14 May 2021 08:34:10 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D62098B7F6;
 Fri, 14 May 2021 08:34:07 +0200 (CEST)
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <52171382-1eca-58e2-b3d1-b2cc6b431e27@csgroup.eu>
Date: Fri, 14 May 2021 08:34:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <58296f87-ad00-a0f5-954b-2150aa84efc4@isovalent.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_233420_132442_F88D0149 
X-CRM114-Status: GOOD (  17.56  )
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

CgpMZSAyMy8wNC8yMDIxIMOgIDEyOjI2LCBRdWVudGluIE1vbm5ldCBhIMOpY3JpdMKgOgo+IDIw
MjEtMDQtMjMgMDk6MTkgVVRDKzAyMDAgfiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxl
cm95QGNzZ3JvdXAuZXU+Cj4gCj4gWy4uLl0KPiAKPj4gSSBmaW5hbGx5IG1hbmFnZWQgdG8gY3Jv
c3MgY29tcGlsZSBicGZ0b29sIHdpdGggbGliYnBmLCBsaWJvcGNvZGVzLAo+PiByZWFkbGluZSwg
bmN1cnNlcywgbGliY2FwLCBsaWJ6IGFuZCBhbGwgbmVlZGVkIHN0dWZmLiBXYXMgbm90IGVhc3kg
YnV0IEkKPj4gbWFkZSBpdC4KPiAKPiBMaWJjYXAgaXMgb3B0aW9uYWwgYW5kIGJwZnRvb2wgZG9l
cyBub3QgdXNlIHJlYWRsaW5lIG9yIG5jdXJzZXMuIE1heSBJCj4gYXNrIGhvdyB5b3UgdHJpZWQg
dG8gYnVpbGQgaXQ/Cj4gCj4+Cj4+IE5vdywgaG93IGRvIEkgdXNlIGl0ID8KPj4KPj4gTGV0IHNh
eSBJIHdhbnQgdG8gZHVtcCB0aGUgaml0dGVkIGNvZGUgZ2VuZXJhdGVkIGZyb20gYSBjYWxsIHRv
Cj4+ICd0Y3BkdW1wJy4gSG93IGRvIEkgZG8gdGhhdCB3aXRoICdicGZ0b29sIHByb2cgZHVtcCBq
aXRlZCcgPwo+Pgo+PiBJIHRob3VnaHQgYnkgY2FsbGluZyB0aGlzIGxpbmUgSSB3b3VsZCB0aGVu
IGdldCBwcm9ncmFtcyBkdW1wZWQgaW4gYSB3YXkKPj4gb3IgYW5vdGhlciBqdXN0IGxpa2Ugd2hl
biBzZXR0aW5nICdicGZfaml0X2VuYWJsZT0yJywgYnV0IGNhbGxpbmcgdGhhdAo+PiBsaW5lIGp1
c3QgcHJvdmlkZXMgbWUgc29tZSBicGZ0b29sIGhlbHAgdGV4dC4KPiAKPiBXZWxsIHRoZSBwdXJw
b3NlIG9mIHRoaXMgdGV4dCBpcyB0byBoZWxwIHlvdSBmaW5kIHRoZSB3YXkgdG8gY2FsbAo+IGJw
ZnRvb2wgdG8gZG8gd2hhdCB5b3Ugd2FudCA6KS4gRm9yIGR1bXBpbmcgeW91ciBwcm9ncmFtcycg
aW5zdHJ1Y3Rpb25zLAo+IHlvdSBuZWVkIHRvIHRlbGwgYnBmdG9vbCB3aGF0IHByb2dyYW0gdG8g
ZHVtcDogQnBmdG9vbCBpc24ndCB3YWl0aW5nCj4gdW50aWwgeW91IGxvYWQgYSBwcm9ncmFtIHRv
IGR1bXAgaXQsIGluc3RlYWQgeW91IG5lZWQgdG8gbG9hZCB5b3VyCj4gcHJvZ3JhbSBmaXJzdCBh
bmQgdGhlbiB0ZWxsIGJwZnRvb2wgdG8gcmV0cmlldmUgdGhlIGluc3RydWN0aW9ucyBmcm9tCj4g
dGhlIGtlcm5lbC4gVG8gcmVmZXJlbmNlIHlvdXIgcHJvZ3JhbSB5b3UgY291bGQgdXNlIGEgcGlu
bmVkIHBhdGgsIG9yCj4gZmlyc3QgbGlzdCB0aGUgcHJvZ3JhbXMgb24geW91ciBzeXN0ZW0gd2l0
aCAiYnBmdG9vbCBwcm9nIHNob3ciOgo+IAo+IAo+ICAgICAgIyBicGZ0b29sIHByb2cgc2hvdwo+
ICAgICAgMTM4OiB0cmFjaW5nICBuYW1lIGZvbyAgdGFnIGU1NGM5MjJkZmE1NGY2NWYgIGdwbAo+
ICAgICAgICAgICAgICBsb2FkZWRfYXQgMjAyMS0wMi0yNVQwMTozMjozMCswMDAwICB1aWQgMAo+
ICAgICAgICAgICAgICB4bGF0ZWQgMjU2QiAgaml0ZWQgMTU0QiAgbWVtbG9jayA0MDk2QiAgbWFw
X2lkcyA2NAo+ICAgICAgICAgICAgICBidGZfaWQgMjM1CgpHb3QgdGhlIGZvbGxvd2luZyBlcnJv
cjoKCnJvb3RAdmdvaXA6fiMgLi9icGZ0b29sIHByb2cgc2hvdwpsaWJicGY6IGVsZjogZW5kaWFu
bmVzcyBtaXNtYXRjaCBpbiBwaWRfaXRlcl9icGYuCmxpYmJwZjogZmFpbGVkIHRvIGluaXRpYWxp
emUgc2tlbGV0b24gQlBGIG9iamVjdCAncGlkX2l0ZXJfYnBmJzogLTQwMDMKRXJyb3I6IGZhaWxl
ZCB0byBvcGVuIFBJRCBpdGVyYXRvciBza2VsZXRvbgoKCkNocmlzdG9waGUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
