Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BD5E64AB6
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzyctAsDf2h/M7dCWRCyelqT2q5vty0bgJFNXyF9tlQ=; b=eRUbSeZd3s0brf
	zAneesopttd4WYYnbP29HGqtuG9RZ09vG+W0mMWZ6uWcpV0IlJvxQENTb2L0NZH2We/fO5VyYwAlI
	5vONI3EVAHOPEWQTVvLcZ/nW3Uq0u9Lw5ctWrgAPntj3pwHD23FRSf5U/tqiskzsh5ou2USFqd8v5
	Tyn3xPWOAy2vLD/mQAhx8cBgxKN3PU2pn+xWxSHGraqitaEi9t49DnX3QgsZBNOW5eKMgJnxh0AIq
	KBysLnxOwf5E2TXkLQKzsI04Cx+8sRJFUJ6dJPUS6SjaTiac0WE40IpSRDkt5VqqLQl8fAtTrghaO
	blnyYTjBrCjTEGSE+0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUWq-00000009sYK-3mv8;
	Tue, 03 Dec 2024 15:09:32 +0000
Received: from mta-03.yadro.com ([89.207.88.253])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUWm-00000009sVg-369K
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 15:09:31 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 557CDE000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1733238564; bh=KVf8hUXjuSbpowAqOIXHXS+rzS1wgLVqN7lbHQj+6/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=llHi3zmx7xcvhjyT89cZ2koxmci/3H0mU5tImgKXosoBVk7NUx1KTsYI1ab1FsxTt
	 DT+foFkWPf2/WYAzP2bbUy2zxZOqZ1oYjHg/IvEu2gfNYKk/uVkdThv2ZIi5HcS9us
	 ucAtBJRRMQrajTP9grIZfw2tDXHOmIYT6iRuQPpJaqSxLT7idu1BKB++/JxwwkkacN
	 7Ribugnj+ALzHJCQMgjWR0okLR4Y1I/rVJ0VHDpLEIqllJD0veIIp6ExCXv+ynkOHR
	 LwPaPa0YbiuJBNGm/m9GCe1OcnUFoDvaZ8LfQhv9X0qCg/QN/VqQkdhlsaxq54NMav
	 bKvk0r1BFOvbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1733238564; bh=KVf8hUXjuSbpowAqOIXHXS+rzS1wgLVqN7lbHQj+6/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=m5S6eSbuDOMCFjzdM3z0oVwZE6BnHmcMVD0V+Aky94CumetunpIgGS8DuW61OO+6s
	 EyFiQsejo+6bFTCTuZMqnisJezak/5+TPqxROaP/qfKLQYZ8gCdNLk6HZlzHbGrlmB
	 EoN31rvuM4IP2Gs+M1/WErfcLKqCKHsr/JTHSJZ7TaSHy/J7Tv0iaCyn1/3XLKEXhj
	 IkMkZKpbVRi8PxsDaV7QFocUFJy22wo/u5TrkdTO5Yizk3GXfuJywA4RvIahwG+7r2
	 MczUiRj9Lgnn0+aImev/go4OcZipcyP1WMZJZ/y0RH8vXmlK6aqytl8tQLXMh0t/9h
	 etVYJbKG1XYQA==
Message-ID: <990b942d-fe91-4bda-a38e-1eb47f2f6086@yadro.com>
Date: Tue, 3 Dec 2024 18:09:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt
 improvements
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Andy Chiu
	<andybnac@gmail.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor
	<nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, Bill Wendling
	<morbo@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<llvm@lists.linux.dev>, <bjorn@rivosinc.com>, <puranjay12@gmail.com>,
	<alexghiti@rivosinc.com>, <yongxuan.wang@sifive.com>,
	<greentime.hu@sifive.com>, <nick.hu@sifive.com>, <nylon.chen@sifive.com>,
	<tommy.wu@sifive.com>, <eric.lin@sifive.com>, <viccent.chen@sifive.com>,
	<zong.li@sifive.com>, <samuel.holland@sifive.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <87ldwxot7i.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
In-Reply-To: <87ldwxot7i.fsf@all.your.base.are.belong.to.us>
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_070929_672032_83E78AA7 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

T24gMDMuMTIuMjAyNCAxNToxOCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBBbmR5IQo+IAo+ICJh
dG9taWMiIHNwZWxsaW5nIGluIHRoZSBTdWJqZWN0IGxpbmUuCj4gCj4gQW5keSBDaGl1IDxhbmR5
Ym5hY0BnbWFpbC5jb20+IHdyaXRlczoKPiAKPj4gQ2hhbmdlcyBpbiB2MzoKPj4gLSBBZGQgYSBm
aXggdGFnIGZvciBwYXRjaCAxCj4+IC0gQWRkIGEgZGF0YSBmZW5jZSBiZWZvcmUgc2VuZGluZyBv
dXQgcmVtb3RlIGZlbmNlLmkgKDYpCj4+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjQwNjI4LWRldi1hbmR5Yy1keW4tZnRyYWNlLXY0LXYyLTAtMWU1ZjRjYjFm
MDQ5QHNpZml2ZS5jb20vCj4gCj4gSG1tLCB0aGUgZml4ZXMgdGFnIHdhcyBub3QgaW5jbHVkZWQu
Cj4gCj4gQWxzbywgdGhlcmUgd2FzIGEgbG90IG9mIGNvbW1lbnRzIGZyb20gdjIgdGhhdCB3YXMg
bm90IGFkZHJlc3NlZDoKPiAKPiAgICogTWlub3Igc3BlbGxpbmcgbml0cwo+ICAgKiBCcmVha2lu
ZyBESVJFQ1RfQ0FMTCwgYW5kIGluY2x1ZGUgUHVyYW5qYXkncyBDQUxMX09QUyB3b3JrIGluIHRo
ZQo+ICAgICBzYW1lIHNlcmllcyBmb3IgRElSRUNUX0NBTEwsIHRvIGF2b2lkIGJyZWFrYWdlLgoK
WWVzLCBGVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgaXMgY3VycmVudGx5IGJyb2tlbi4gSWYgSSB0
cnkgdG8gaW5zbW9kIApzYW1wbGVzL2Z0cmFjZS9mdHJhY2UtZGlyZWN0LmtvLCBpdCByZXBvcnRz
IGEgZmFpbHVyZToKCgpbICAxNzkuNTMxNDcyXSAtLS0tLS0tLS0tLS1bIGZ0cmFjZSBidWcgXS0t
LS0tLS0tLS0tLQpbICAxNzkuNTMxNzYxXSBmdHJhY2UgZmFpbGVkIHRvIG1vZGlmeQpbICAxNzku
NTMxNzg2XSBbPGZmZmZmZmZmODAwNWY5YWM+XSB3YWtlX3VwX3Byb2Nlc3MrMHgwLzB4MjQKWyAg
MTc5LjUzMjU3N10gIGFjdHVhbDogICA5NzplMjpmYTpmZjoxMzowMDowMDowMApbICAxNzkuNTMz
MjExXSBTZXR0aW5nIGZ0cmFjZSBjYWxsIHNpdGUgdG8gY2FsbCBmdHJhY2UgZnVuY3Rpb24KWyAg
MTc5LjUzNDQwOV0gZnRyYWNlIHJlY29yZCBmbGFnczogOTk5ODAwMDEKWyAgMTc5LjUzNDY5Ml0g
ICgxKSAgICAgdHJhbXA6IGZ0cmFjZV9jYWxsZXIrMHgwLzB4MzQgCihjYWxsX2RpcmVjdF9mdW5j
cysweDAvMHgxNCkKWyAgMTc5LjUzNDY5Ml0gIGV4cGVjdGVkIHRyYW1wOiBmZmZmZmZmZjAxYjBk
MDAwCi4uLgoKPiAKPiBJJ2xsIGhhdmUgYSBsb29rIGF0IHRoZSBiYXJyaWVycyAod2hpY2ggY2Ft
ZSB1cCBhdCBwbHVtYmVycykhCgpUaGFuayB5b3UhCkFmdGVyIHRoaXMgc2VyaWVzIGFuZCB0aGUg
Q0FMTF9PUFMgd29yayBhcmUgZG9uZSwgZHluYW1pYyBGdHJhY2UgZm9yIApSSVNDLVYgd2lsbCBi
ZSBldmVuIG1vcmUgdmFsdWFibGUgaW4gcHJvZHVjdGlvbiB1c2UgY2FzZXMuCgo+IAo+IAo+IENo
ZWVycywKPiBCasO2cm4KPiAKClJlZ2FyZHMsCkV2Z2VuaWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
