Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA1BCD1292
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1EDtNempDgAl2dHBavl1d/Qj/41AN1NFtshhOmiJz0=; b=uXQHhCGXNIjnJx
	MqevZFGi5QkD1dGrNF4Kvg7p5D11sj/y1yPygxhVh5T4F1z/14sYWRQpDMXBP9rIy5KqBx0QfUdx4
	0lMYfmVnvVlwmGT/YgAn2jPib4FbVc1JijhYIouG45iNu3ViIhlciUxCQRnVKvNoQJfWKwqKTpZHJ
	SpatjWo4aXVkIVbNhYRspv2ABXsZf9sRNbVGlDHjvMp4amx+HH6K6SApw39JM7vo1bAu1vPP7vcqQ
	jtjixDQMXmhiwskb8GBnn+w1KQnP+hfJtA0VO4sOmeGlCkNdpAotLArDxtt8OwjE6jtyItCfcFzAt
	xjfnlhv5OhGNkD7lDPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrFQ8-00000007WJy-20JQ;
	Mon, 01 Apr 2024 11:01:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEH6-00000007Nmi-3Muo
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Apr 2024 09:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ztu2FvgPGsMIM9MGAhUC5Pglx6IH/1lc7B3TQ59R8vk=; b=jUV9F9sK7Mg0qTPW8n7EBziDza
	bb3RCEwBPWvFKo+WyZ082S83gt99uS9ph6NT1NVedUhuvsDZwuMnIU/VmBMqljO2zBmjTs4rymbHz
	AlAL5ZwGjGGXoKgA47z/VxSzWsnV3/8nlSl43e4JQxRcsT7gQgGx3yFRCA+PCnMQhLz9iBHUkmpDz
	F47QdjyzelwYxDNyCRidXNFuOVqu+J5/XEjPFkNO+hsJxF8vWOfPZvOJ8z8PdbrZ6JeJ1jD+oVe7r
	nria+77vdHvRSdWRb7SZSmpIJ5bgNC8g3HzxXxXfug6CU9QImDpoKSM+1SD/ga+SSuPSfq19z6hIe
	5sbcMa3g==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEGv-0000000307o-018y
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 09:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711964885;
	bh=06wOk/U0MualMJ4bunj44L58B9nb+s9Iaqf0BY9Iihk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=IKkpukb884sj8Eg4Yw/1yM6F+jVI41WbIFR5wppl38DPIFzg7d+snPhJSh90a3YbB
	 6UxRTezpSmT4wNQmWC70hAfP/JxH0Ch921mvOmRMG6ao7uQPIuZ7OsFD7KR2aH5N87
	 tG0r+nrikfEXbQvrvlxX1XWEKAWH5gay7UPdFl6DDuIhYIr3WnRTZy/d4En7a/hkhB
	 ryU3/OINHUKgVPtbeLhy24Ru35rCA0iPfjdVytimtX+uverHEJe3H4njiECn3UAPIe
	 pNY86YqfqdyTKZh6NivIn+8POtsgH3Jxd+ULYNYtQQqgOUeGD7ZqZngxjW5K5IDaXk
	 qoDfDq7BJ5Z5Q==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8BFC2378148F;
	Mon,  1 Apr 2024 09:47:23 +0000 (UTC)
Message-ID: <ef72ae20-6b68-496a-a819-8818ade0d433@collabora.com>
Date: Mon, 1 Apr 2024 14:46:13 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org,
 Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
 ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com,
 atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
 alexghiti@rivosinc.com, samuel.holland@sifive.com, palmer@sifive.com,
 conor@kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, corbet@lwn.net,
 tech-j-ext@lists.risc-v.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
 akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
 shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
 jerry.shih@sifive.com, hankuan.chen@sifive.com, greentime.hu@sifive.com,
 evan@rivosinc.com, xiao.w.wang@intel.com, charlie@rivosinc.com,
 apatel@ventanamicro.com, mchitale@ventanamicro.com,
 dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com,
 willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org,
 samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org,
 heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com,
 cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com,
 mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com,
 mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, david@redhat.com,
 catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org,
 shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
 jhubbard@nvidia.com
Subject: Re: [PATCH v2 27/27] kselftest/riscv: kselftest for user mode cfi
To: Deepak Gupta <debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
 <20240329044459.3990638-28-debug@rivosinc.com>
 <4b38393a-f69d-4a77-a896-b6cd42c7edcf@collabora.com>
 <CAKC1njQ_RU=uHhrna=MFVdjAMjjQNqZWnkjPoJvO7CxtPMeNuQ@mail.gmail.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <CAKC1njQ_RU=uHhrna=MFVdjAMjjQNqZWnkjPoJvO7CxtPMeNuQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_104809_594840_A9C061B7 
X-CRM114-Status: GOOD (  13.20  )
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

T24gMy8zMC8yNCAxOjAyIEFNLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gRnJpLCBNYXIgMjks
IDIwMjQgYXQgMTI6NTDigK9QTSBNdWhhbW1hZCBVc2FtYSBBbmp1bQo+IDx1c2FtYS5hbmp1bUBj
b2xsYWJvcmEuY29tPiB3cm90ZToKPj4KPj4gT24gMy8yOS8yNCA5OjQ0IEFNLCBEZWVwYWsgR3Vw
dGEgd3JvdGU6Cj4+PiBBZGRzIGtzZWxmdGVzdCBmb3IgUklTQy1WIGNvbnRyb2wgZmxvdyBpbnRl
Z3JpdHkgaW1wbGVtZW50YXRpb24gZm9yIHVzZXIKPj4+IG1vZGUuIFRoZXJlIGlzIG5vdCBhIGxv
dCBnb2luZyBvbiBpbiBrZXJuZWwgZm9yIGVuYWJsaW5nIGxhbmRpbmcgcGFkIGZvcgo+Pj4gdXNl
ciBtb2RlLiBUaHVzIGtzZWxmdGVzdCBzaW1wbHkgZW5hYmxlcyBsYW5kaW5nIHBhZCBmb3IgdGhl
IGJpbmFyeSBhbmQKPj4+IGEgc2lnbmFsIGhhbmRsZXIgaXMgcmVnaXN0ZXJlZCBmb3IgU0lHU0VH
Vi4gQW55IGNvbnRyb2wgZmxvdyB2aW9sYXRpb24gYXJlCj4+PiByZXBvcnRlZCBhcyBTSUdTRUdW
IHdpdGggc2lfY29kZSA9IFNFR1ZfQ1BFUlIuIFRlc3Qgd2lsbCBmYWlsIG9uIHJlY2lldmluZwo+
Pj4gYW55IFNFR1ZfQ1BFUlIuIFNoYWRvdyBzdGFjayBwYXJ0IGhhcyBtb3JlIGNoYW5nZXMgaW4g
a2VybmVsIGFuZCB0aHVzIHRoZXJlCj4+PiBhcmUgc2VwYXJhdGUgdGVzdHMgZm9yIHRoYXQKPj4+
ICAgICAgIC0gZW5hYmxlIGFuZCBkaXNhYmxlCj4+PiAgICAgICAtIEV4ZXJjaXNlIGBtYXBfc2hh
ZG93X3N0YWNrYCBzeXNjYWxsCj4+PiAgICAgICAtIGBmb3JrYCB0ZXN0IHRvIG1ha2Ugc3VyZSBD
T1cgd29ya3MgZm9yIHNoYWRvdyBzdGFjayBwYWdlcwo+Pj4gICAgICAgLSBndXAgdGVzdHMKPj4+
ICAgICAgICAgQXMgb2YgdG9kYXkga2VybmVsIHVzZXMgRk9MTF9GT1JDRSB3aGVuIGFjY2VzcyBo
YXBwZW5zIHRvIG1lbW9yeSB2aWEKPj4+ICAgICAgICAgL3Byb2MvPHBpZD4vbWVtLiBOb3QgYnJl
YWtpbmcgdGhhdCBmb3Igc2hhZG93IHN0YWNrCj4+PiAgICAgICAtIHNpZ25hbCB0ZXN0LiBNYWtl
IHN1cmUgc2lnbmFsIGRlbGl2ZXJ5IHJlc3VsdHMgaW4gdG9rZW4gY3JlYXRpb24gb24KPj4+ICAg
ICAgIHNoYWRvdyBzdGFjayBhbmQgY29uc3VtZXMgKGFuZCB2ZXJpZmllcykgdG9rZW4gb24gc2ln
cmV0dXJuCj4+PiAgICAgLSBzaGFkb3cgc3RhY2sgcHJvdGVjdGlvbiB0ZXN0LiBhdHRlbXB0cyB0
byB3cml0ZSB1c2luZyByZWd1bGFyIHN0b3JlCj4+PiAgICAgICAgIGluc3RydWN0aW9uIG9uIHNo
YWRvdyBzdGFjayBtZW1vcnkgbXVzdCByZXN1bHQgaW4gYWNjZXNzIGZhdWx0cwo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+Pj4gLS0tCj4+
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvTWFrZWZpbGUgICAgICAgIHwgICAyICst
Cj4+PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL01ha2VmaWxlICAgIHwgIDEw
ICsKPj4+ICAuLi4vdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL2NmaV9ydl90ZXN0LmggfCAg
ODUgKysrKwo+Pj4gIC4uLi9zZWxmdGVzdHMvcmlzY3YvY2ZpL3Jpc2N2X2NmaV90ZXN0LmMgICAg
ICB8ICA5MSArKysrKwo+Pj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvc2hhZG93
c3RhY2suYyB8IDM3NiArKysrKysrKysrKysrKysrKysKPj4+ICAuLi4vdGVzdGluZy9zZWxmdGVz
dHMvcmlzY3YvY2ZpL3NoYWRvd3N0YWNrLmggfCAgMzkgKysKPj4gUGxlYXNlIGFkZCBnZW5lcmF0
ZWQgYmluYXJpZXMgaW4gdGhlIC5naXRpZ25vcmUgZmlsZXMuCj4gCj4gaG1tLi4uCj4gSSBkb24n
dCBzZWUgYmluYXJ5IGFzIHBhcnQgb2YgdGhlIHBhdGNoLiBXaGljaCBmaWxlIGFyZSB5b3UgcmVm
ZXJyaW5nCj4gdG8gaGVyZSBiZWluZyBiaW5hcnk/CnNoYWRvd3N0YWNrIHdvdWxkIGJlIGdlbmVy
YXRlZCBieSB0aGUgYnVpbGQuIENyZWF0ZSBhIC5naXRpZ25vcmUgZmlsZSBhbmQKYWRkIGl0IHRo
ZXJlLiBGb3IgZXhhbXBsZSwgbG9vayBhdAp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92
ZWN0b3IvLmdpdGlnbm9yZSB0byB1bmRlcnN0YW5kLgoKCj4gCj4+Cj4gCgotLSAKQlIsCk11aGFt
bWFkIFVzYW1hIEFuanVtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
