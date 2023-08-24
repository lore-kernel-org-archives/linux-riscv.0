Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41D2C6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1ZARG65zaV020Sjkf7PaFxeDk6UfKDMIVtqJbC5r/g=; b=zDrEheYkGlsuUP
	beBw09oCSu55IRCQUP58cKdrngATmEru0bb3f4iCZqknoAqbGcaa6/6vRYVUJSTwV0K95F0uKVsZp
	jPVUbj0ydbiNkbt/YbdvizfprQpzX2DDmU1FZ5ZBQa36TaWyAHG0ZUuSQMq0YRlbSXUiTmEhEZhTN
	DZnzbjaM4MZWAWz3ZYSvgkZothsJ6gaWgz92KeEA/qoLIlXfhuR9YnuymdMdR7znVvONmmL9eeS8F
	Eu1zg9quUMns5C6y6LevPFAKCcuuM5BXodJzdGMZBwAL0g2g13tMcetRAnNpzwe/gIGkVKrmjQyxk
	z7ZFbm/fRDdwiCgcnx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEQJ-003YDY-2M;
	Thu, 24 Aug 2023 17:47:11 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEQF-003YCf-2G
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 17:47:09 +0000
Received: from [192.168.0.107] (unknown [111.197.209.91])
	by APP-05 (Coremail) with SMTP id zQCowAAnQgmTl+dkmArTBA--.2605S2;
	Fri, 25 Aug 2023 01:47:00 +0800 (CST)
Message-ID: <3ba51c81-7eca-b1b5-c89d-47b292b65641@iscas.ac.cn>
Date: Fri, 25 Aug 2023 01:46:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 bmeng@tinylab.org, guoren@kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
 <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
 <20230823-captive-abdomen-befd942a4a73@wendy>
 <20230823-facelift-ovary-41f2eb4d9eac@spud>
 <4677fc33-6e76-21e6-2a7f-f12670bc1ce2@iscas.ac.cn>
 <4177c0c5-4d36-75e1-84e2-c6ac82b74e50@iscas.ac.cn>
 <20230824-stick-neutron-839dfdfa0538@spud>
From: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Organization: ISCAS
In-Reply-To: <20230824-stick-neutron-839dfdfa0538@spud>
X-CM-TRANSID: zQCowAAnQgmTl+dkmArTBA--.2605S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw48Xw47WFy3ArW5WFWDtwb_yoW5ZFyxpa
	yrKFyDKrWUXr48Jrn7tr1UX3Wjyr4ft34rXr1DJrW5Jr909F1FqFykZr1j9F9rZr4rCr40
	yr45WasrZr1qyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07beAp5UUUUU=
X-Originating-IP: [111.197.209.91]
X-CM-SenderInfo: 50lqwzhlqj6xxhqjqxpvfd2hldfou0/1tbiCQYNCmTnYihoYAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_104708_103598_07783B9C 
X-CRM114-Status: GOOD (  19.50  )
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

T24gOC8yNS8yMyAwMTozMywgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIEZyaSwgQXVnIDI1LCAy
MDIzIGF0IDAxOjMwOjM2QU0gKzA4MDAsIE1pbmd6aGVuZyBYaW5nIHdyb3RlOgo+PiBPbiA4LzI0
LzIzIDE5OjMyLCBNaW5nemhlbmcgWGluZyB3cm90ZToKPj4+IE9uIDgvMjMvMjMgMjE6MzEsIENv
bm9yIERvb2xleSB3cm90ZToKPj4+PiBPbiBXZWQsIEF1ZyAyMywgMjAyMyBhdCAxMjo1MToxM1BN
ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+Pj4+IE9uIFRodSwgQXVnIDE3LCAyMDIzIGF0
IDAzOjIwOjI0UE0gKzAwMDAsCj4+Pj4+IHBhdGNod29yay1ib3QrbGludXgtcmlzY3ZAa2VybmVs
Lm9yZyB3cm90ZToKPj4+Pj4+IEhlbGxvOgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgcGF0Y2ggd2FzIGFw
cGxpZWQgdG8gcmlzY3YvbGludXguZ2l0IChmaXhlcykKPj4+Pj4+IGJ5IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKPj4+Pj4+Cj4+Pj4+PiBPbiBUaHUsIDEwIEF1ZyAyMDIz
IDAwOjU2OjQ4ICswODAwIHlvdSB3cm90ZToKPj4+Pj4+PiBCaW51dGlscy0yLjM4IGFuZCBHQ0Mt
MTIuMS4wIGJ1bXBlZFswXVsxXSB0aGUgZGVmYXVsdAo+Pj4+Pj4+IElTQSBzcGVjIHRvIHRoZSBu
ZXdlcgo+Pj4+Pj4+IDIwMTkxMjEzIHZlcnNpb24gd2hpY2ggbW92ZXMgc29tZSBpbnN0cnVjdGlv
bnMgZnJvbSB0aGUKPj4+Pj4+PiBJIGV4dGVuc2lvbiB0byB0aGUKPj4+Pj4+PiBaaWNzciBhbmQg
WmlmZW5jZWkgZXh0ZW5zaW9ucy4gU28gaWYgb25lIG9mIHRoZSBiaW51dGlscwo+Pj4+Pj4+IGFu
ZCBHQ0MgZXhjZWVkcwo+Pj4+Pj4+IHRoYXQgdmVyc2lvbiwgd2Ugc2hvdWxkIGV4cGxpY2l0bHkg
c3BlY2lmeWluZyBaaWNzciBhbmQKPj4+Pj4+PiBaaWZlbmNlaSB2aWEgLW1hcmNoCj4+Pj4+Pj4g
dG8gY29wZSB3aXRoIHRoZSBuZXcgY2hhbmdlcy4gYnV0IHRoaXMgb25seSBvY2N1cnMgd2hlbgo+
Pj4+Pj4+IGJpbnV0aWxzID49IDIuMzYKPj4+Pj4+PiBhbmQgR0NDID49IDExLjEuMC4gSXQncyBh
IGRpZmZlcmVudCBzdG9yeSB3aGVuIGJpbnV0aWxzIDwgMi4zNi4KPj4+Pj4+Pgo+Pj4+Pj4+IFsu
Li5dCj4+Pj4+PiBIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6Cj4+Pj4+PiAgwqDCoCAt
IFt2NV0gcmlzY3Y6IEhhbmRsZSB6aWNzci96aWZlbmNlaSBpc3N1ZSBiZXR3ZWVuIGdjYyBhbmQg
YmludXRpbHMKPj4+Pj4+ICDCoMKgwqDCoCBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2Mv
Y2EwOWY3NzJjY2NhCj4+Pj4+ICpzaWdoKiBzbyB0aGlzIGJyZWFrcyB0aGUgYnVpbGQgZm9yIGdj
Yy0xMSAmIGJpbnV0aWxzIDIuMzcgdy8KPj4+Pj4gIMKgwqDCoMKgQXNzZW1ibGVyIG1lc3NhZ2Vz
Ogo+Pj4+PiAgwqDCoMKgwqBFcnJvcjogY2Fubm90IGZpbmQgZGVmYXVsdCB2ZXJzaW9ucyBvZiB0
aGUgSVNBIGV4dGVuc2lvbiBgemljc3InCj4+Pj4+ICDCoMKgwqDCoEVycm9yOiBjYW5ub3QgZmlu
ZCBkZWZhdWx0IHZlcnNpb25zIG9mIHRoZSBJU0EgZXh0ZW5zaW9uIGB6aWZlbmNlaScKPj4+Pj4K
Pj4+Pj4gSSdsbCBoYXZlIGEgcG9rZSBsYXRlci4KPj4+PiBTbyB1aCwgYXJlIHdlIHN1cmUgdGhh
dCB0aGlzIHNob3VsZCBub3QgYmU6Cj4+Pj4gLcKgwqDCoMKgwqDCoCBkZXBlbmRzIG9uIChDQ19J
U19DTEFORyAmJiBDTEFOR19WRVJTSU9OIDwgMTcwMDAwKSB8fAo+Pj4+IChDQ19JU19HQ0MgJiYg
R0NDX1ZFUlNJT04gPCAxMTAxMDApCj4+Pj4gK8KgwqDCoMKgwqDCoCBkZXBlbmRzIG9uIChDQ19J
U19DTEFORyAmJiBDTEFOR19WRVJTSU9OIDwgMTcwMDAwKSB8fAo+Pj4+IChDQ19JU19HQ0MgJiYg
R0NDX1ZFUlNJT04gPD0gMTEwMTAwKQo+Pj4+Cj4+Pj4gTXkgZ2NjLTExLjEgKyBiaW51dGlscyAy
LjM3IHRvb2xjaGFpbiBidWlsdCBmcm9tIHJpc2N2LWdudS10b29sY2hhaW4KPj4+PiBkb2Vzbid0
IGhhdmUgdGhlIGRlZmF1bHQgdmVyc2lvbnMgJiB0aGUgYWJvdmUgZGlmZiBmaXhlcyB0aGUgYnVp
bGQuCj4+PiBJIHJlcHJvZHVjZWQgdGhlIGVycm9yLCB0aGUgY29tYmluYXRpb24gb2YgZ2NjLTEx
LjEgYW5kCj4+PiBiaW51dGlscyAyLjM3IGRvZXMgY2F1c2UgZXJyb3JzLiBXaGF0IGEgc3VycHJp
c2UsIHNpbmNlIGJpbnV0aWxzCj4+PiAyLjM2IGFuZCAyLjM4IGFyZSBmaW5lLgo+Pj4KPj4+IEkg
dXNlZCBnaXQgYmlzZWN0IHRvIGxvY2F0ZSB0aGlzIGNvbW1pdFsxXSBmb3IgYmludXRpbHMuCj4+
PiBJJ2xsIHRlc3QgdGhpcyBkaWZmIGluIG1vcmUgZGV0YWlsIGxhdGVyLiBUaGFua3MhCj4+Pgo+
Pj4gWzFdIGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1j
b21taXQ7aD1mMGJhZTI1NTJkYjFkZDRmMTk5NTYwOGZiZjY2NDhmY2VlNGU5ZTBjCj4+Pgo+PiBI
aSwgQ29ub3IuCj4+IFRoZSBhYm92ZSBlcnJvciBkb2VzIG9yaWdpbmF0ZSBmcm9tIGxpbmtbMV0g
bWVudGlvbmVkIGFib3ZlLCB3aGljaCB3YXMKPj4gcmVzb2x2ZWQgaW4gZ2NjLTEyLjEuMFsyXSwg
YW5kIGdjYy0xMS4zLjAgbWFkZSB0aGUgYmFja3BvcnRbM10uCj4+IFNvIGdjYy0xMS4yLjAgY29t
YmluZWQgd2l0aCBiaW51dGlscyAyLjM3IHByb2R1Y2VzIHRoZSBzYW1lIGVycm9yLgo+PiBJIHRo
aW5rIHdlIHNob3VsZCBkbyB0aGUgZm9sbG93aW5nIGRpZmYgdG8gZml4IGl0Ogo+PiAtwqDCoMKg
wqDCoMKgIGRlcGVuZHMgb24gKENDX0lTX0NMQU5HICYmIENMQU5HX1ZFUlNJT04gPCAxNzAwMDAp
IHx8IChDQ19JU19HQ0MgJiYKPj4gR0NDX1ZFUlNJT04gPCAxMTAxMDApCj4+ICvCoMKgwqDCoMKg
wqAgZGVwZW5kcyBvbiAoQ0NfSVNfQ0xBTkcgJiYgQ0xBTkdfVkVSU0lPTiA8IDE3MDAwMCkgfHwg
KENDX0lTX0dDQyAmJgo+PiBHQ0NfVkVSU0lPTiA8IDExMDMwMCkKPiBUaGF0IHNvdW5kcyBnb29k
IHRvIG1lLiBDYW4geW91IG1ha2UgdGhhdCBhIHJlYWwgcGF0Y2ggcGxlYXNlPwoKT2tleS4KSnVz
dCBhIHF1ZXN0aW9uLCBJIHNlZSB0aGF0IHRoZSBwcmV2aW91cyBwYXRjaCBoYXMgYmVlbiBtZXJn
ZWQKaW50byA2LjUtcmM3LCBhbmQgbm93IGEgbmV3IGZpeCBwYXRjaCBzaG91bGQgYmUgc2VudCBv
dXQgYmFzZWQKb24gdGhhdCwgcmlnaHQ/CgoKQmVzdMKgUmVnYXJkcywKTWluZ3poZW5nLgoKPgo+
IFRoYW5rcyBmb3Igd29ya2luZyBvbiBpdCA6KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
