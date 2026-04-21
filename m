Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3021F8FA94
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ludijwXpe5aogxHdaogO+juMG3a05wrqK61Cb2R/J2Y=; b=PZdCaDBBiKJ5Hq
	MmP9Zhay/Y1TFQ6ztnn706/o70+IH5aJZvFbvJ+e81hif2Mus2Bv3QhWQJ6WCmgDRT4IkLdc34zVc
	AvADTTUmJegHR252AawChHzOiSme1LF5dYCD+UTdOHXwsayUoxigIVJGLZrJZRREZiiV+wuN9GYJp
	k630vAWOtWMBWjLFU+VamlO8niBCDoHglP4lfWpUh9Za/14iceUt0LzhV3+PGSRq5zD9wGI26dE10
	CjtKnoRC2aCmSUfwY/qBYcIjSCfyQ/GYjQBSCurnSG4VQP2ihwvjY7az53apQTFEhUnE4CUNMf6Sw
	sALIf4lO3gnZW/Ok1FZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDjr-00000008tqh-094w;
	Tue, 21 Apr 2026 16:14:15 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDjo-00000008tqI-1Iu8
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 16:14:13 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-479ae363aaeso2378753b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 09:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776788051; cv=none;
        d=google.com; s=arc-20240605;
        b=UM/TqsBxA5UE/hmOMow3kjrQZ+8BE+GRmeS6ZY17Ox0HEz0VDulbuM0OLLbWxpEp6l
         dPIs2cHrkAMsxRs0YDg8QyafwZ3wIYY/LdFcIYUxXcxuQLlRrpY7TYfXuDBbBjxNjyx0
         dNcMrEp+KH8DJwhSaewL7+UqLfiuONJLnX+hbjoRosn+Lj6ON2oVIvv6V73V+gHiut6Z
         I1AtcYvV1WERKqu7mSg7TH6XGosfYaq4vAYaOqqAeO/Z+63SWj4echALSZOJgCppzLFx
         5Lf2L9kCKOnIuDufsrqkgDgVVmNifgb0pq1DyKpaGleKhfLOOsV/+QSpRZXCSng8Hv2q
         LxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        fh=xQMqOZmzD2vlDGmrbaNvOFCMjv8SAvVu1wx2+gxqU/0=;
        b=AJOY1buIOGHojyXri2uO8a6Zfh63KPxTf7GqgLt6cTMQcXq1jlleEwtYuQ829aJDxF
         cu/8e2vaC7EiQwBtqHWLyiXIB/jJO3WQGvtBjI4qyG/wsomb+z3IqWhJcFQqg63g8LkV
         91ZQpERG0DyQQkgn/031Ik1gnAM1AItcfAekouOOjsgab5ZZGbzkDWDGVSXeHDSu700z
         RaW2oNoEE/ErxlmkfpJrZQbUTMV21cQfNk8AzUhZxsRzBYFFlEb1fuFPGvToOF5C85a0
         NhZ8y3r2JQpxQLKZP4FVTHKoLGMLlSj0qB4eUouUhSfgnX+UjIb4MIgKiA5N8MJDjZpj
         jKJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776788051; x=1777392851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        b=oKmyuNYzDT5KzqVSN9mkH/uPL4em6s4y5vrjXb3FqiGaO0m0jAvWG3keOJvRGlQa3O
         M7X5wbqzkseglKfjr+38VhrXT6HLBTpALSiWjqCH3jHCkj9Xh9JkTVA0kEccQe7LLkUo
         S8QvgnV9jvXNQD3dH7NkN+E570KX7EznDD4pv6DogoCA0Xf6rRmiQuIYxKm7K/qfC5/e
         71EPIvBy2Qz7j55jROaTf/HemekiLjUKrkcIPM+wmpTJf0NY1/GczryDTNN94DwGmyfh
         /A7us5wpmRf7mTNVnUM6RZu9R0m8hJjDjDuohTZmj2YJvAfwO01qpckF/3Rh0OawOUO4
         9uIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776788051; x=1777392851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PoH5cen/vhOZ0DzwkKLECtpXsvLoy+/ZJjPSwZrY7fU=;
        b=Ldhaq0st6NtOUU38yt4zaODb/fk28AIjUZcTUlz8zBHUnAiDUZaMH0iuG1sERvsBxp
         ZMXjOr8OcWVOrHWUUaWON5rRQlf/QR277AKqFPIzV2XNS9135kHhF1ZLK8Yd2VNK3Pdb
         NmJ7/kKRLnId1bGyDoL/9992sZ/D8ycuqxFbS9/azgxdJU2faV96x7mQzMCBPwHaZlP7
         30zz8LsjQ81XV+XbDwf4MOmospQ912oFHIYQ/eZwAvecTHhh1KWwKi7xi4DnMua46QQ3
         IobVmw03nL4X9oyEcSN71Nl0n+06/5odFEPAh5jAWI1taAse+vmEV5PZosB10zE/NCo2
         wL/A==
X-Forwarded-Encrypted: i=1; AFNElJ8VCag0o4nnTN+A/ZUPjhbwVtBZJGJJzgMActWMLq9pXSc5ERf5h37dVd1m1WNg/CWvnNyAePcaL7aYaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT0qIIsd8IYsyURHmEk4Rk7KIwwEMDBeOxo6/ABIWRGUQnHPLc
	OSI7TbhoR5dTdKkhDUJXYczZCC0TEIqS75l+4tE7d4NW6d6HeEtRkkrEmYYScoOUKDWU+KPR0rc
	KEe2scVMo8Al9HZyUd71gJlaJztpuGts=
X-Gm-Gg: AeBDievakhm4z3S7gULekV7O3ERs3NXx2rAemfS6foIUSmtlIx8L9fIL5YyyNfFQF42
	6tJp4KMgOYPpxzcoSTWn1tUZJmiv/vSR4UjTSMAYaqSHMe06k5aZpEvg0FD6cM7DqTa+fWsAXhQ
	hevMkOiX3gSK9gXNrY2QtNGK7iLQveKId6dQ2xwcn8TZn2W3wvjctnWeCmtbkk7UinrTFT98oZ2
	4jK2gfbuPEIjEY23EZ6HQJ5jI1/CrzhqB/XKSu7MguJ/kW3XfU3SSBkm/A7AHciJExyQElqPAmj
	q3Kl8jl4uplPqY8/RFaI4HkcWORou+P9dcsTftTr5Vd6WN4TnMv21QXpELWxunKlpP3MDPeRepg
	nF4TrOS55LDtbOXqHAcJCE+kHeCd2/XSBGj8gVyVr
X-Received: by 2002:a05:6808:e68b:b0:479:e826:ccdd with SMTP id
 5614622812f47-479e826d1c3mr2175511b6e.5.1776788051231; Tue, 21 Apr 2026
 09:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260403111516.379795-1-josh.milas@gmail.com> <20260403111516.379795-6-josh.milas@gmail.com>
In-Reply-To: <20260403111516.379795-6-josh.milas@gmail.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 22 Apr 2026 00:13:57 +0800
X-Gm-Features: AQROBzBBI72CSkLDmiqtls647M6PwNy4PB7CMyuLTU7f5ccTrkmAadBqQHw2l3A
Message-ID: <CALbr=LYJKJREwh8KMqsgcXwd+jx0W7gFFFuBk-izNdgzkQU6Pg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S
 board support
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, samuel.holland@sifive.com, unicorn_wang@outlook.com, 
	inochiama@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com, 
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org, 
	chao.wei@sophgo.com, anup@brainfault.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, michael.opdenacker@rootcommit.com, 
	Wang Jiayue <akaieurus@gmail.com>, Yao Zi <me@ziyao.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_091412_355857_D300301F 
X-CRM114-Status: GOOD (  17.08  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCA3OjE24oCvUE0gSm9zaHVhIE1pbGFzIDxqb3NoLm1pbGFz
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGFkZHMgaW5pdGlhbCByaXNjdiBzdXBwb3J0IGZv
ciB0aGUgTWlsay1WIER1byBTIGJvYXJkCj4gWzFdIG1ha2luZyBpdCBwb3NzaWJsZSB0byBib290
IExpbnV4IHRvIHRoZSBjb21tYW5kIGxpbmUuCj4KPiBMaW5rOiBodHRwczovL21pbGt2LmlvL2R1
by1zIFsxXQo+Cj4gU2lnbmVkLW9mZi1ieTogSm9zaHVhIE1pbGFzIDxqb3NoLm1pbGFzQGdtYWls
LmNvbT4KCkdyZWF0IHdvcmssIHRoYW5rcyBKb3NodWEhIEkgcmVhbGx5IGxpa2UgdGhpcyBib2Fy
ZC4KCkkgZW5jb3VudGVyZWQgdGhlIHNhbWUgaXNzdWUgTWljaGFlbCBPcGRlbmFja2VyIHNhdyBp
biB2NCwgYnV0CmVuYWJsaW5nIHRoZSBNRElPLXJlbGF0ZWQgY29uZmlncyByZXNvbHZlZCBpdC4K
CkknbGwga2VlcCB1c2luZyBhbmQgdGVzdGluZyB0aGlzIHNlcmllcyBhbmQgcHJvdmlkZSBmdXJ0
aGVyIGZlZWRiYWNrCmlmIGFueXRoaW5nIGNvbWVzIHVwLiBOZXh0LCBJIHBsYW4gdG8gdGVzdCB0
aGUgYXJtNjQgc2lkZSBhbmQgd2lsbAphbHNvIHRyeSBkZXZlbG9waW5nIGFuIGVmdXNlIGRyaXZl
ci4KClRlc3RlZC1ieTogR3VpLURvbmcgSGFuIDxoYW5ndWlkb25nMDJAZ21haWwuY29tPgpSZXZp
ZXdlZC1ieTogR3VpLURvbmcgSGFuIDxoYW5ndWlkb25nMDJAZ21haWwuY29tPgoKPiAtLS0KPiAg
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZpbGUgICAgICAgICAgIHwgIDEgKwo+ICAu
Li4vYm9vdC9kdHMvc29waGdvL3NnMjAwMC1taWxrdi1kdW8tcy5kdHMgICAgfCA4NSArKysrKysr
KysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAwLW1pbGt2LWR1
by1zLmR0cwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL01ha2Vm
aWxlIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZpbGUKPiBpbmRleCA2ZjY1NTI2
ZDQxOTNiLi41OGNjNmI3MGQ4ZGU0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZp
bGUKPiBAQCAtMSw2ICsxLDcgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAo+ICBkdGItJChDT05GSUdfQVJDSF9TT1BIR08pICs9IGN2MTgwMGItbWlsa3YtZHVvLmR0Ygo+
ICBkdGItJChDT05GSUdfQVJDSF9TT1BIR08pICs9IGN2MTgxMmgtaHVhc2hhbi1waS5kdGIKPiAr
ZHRiLSQoQ09ORklHX0FSQ0hfU09QSEdPKSArPSBzZzIwMDAtbWlsa3YtZHVvLXMuZHRiCj4gIGR0
Yi0kKENPTkZJR19BUkNIX1NPUEhHTykgKz0gc2cyMDAyLWxpY2hlZXJ2LW5hbm8tYi5kdGIKPiAg
ZHRiLSQoQ09ORklHX0FSQ0hfU09QSEdPKSArPSBzZzIwNDItbWlsa3YtcGlvbmVlci5kdGIKPiAg
ZHRiLSQoQ09ORklHX0FSQ0hfU09QSEdPKSArPSBzZzIwNDItZXZiLXYxLmR0Ygo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDAtbWlsa3YtZHVvLXMuZHRzIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAwLW1pbGt2LWR1by1zLmR0cwo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uODYzMjQ3MGY0M2FiMAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDAtbWls
a3YtZHVvLXMuZHRzCj4gQEAgLTAsMCArMSw4NSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+ICsKPiArL2R0cy12MS87Cj4gKwo+ICsjaW5jbHVkZSAi
c2cyMDAwLmR0c2kiCj4gKwo+ICsvIHsKPiArICAgICAgIG1vZGVsID0gIk1pbGstViBEdW8gUyI7
Cj4gKyAgICAgICBjb21wYXRpYmxlID0gIm1pbGt2LGR1by1zIiwgInNvcGhnbyxzZzIwMDAiOwo+
ICsKPiArICAgICAgIGFsaWFzZXMgewo+ICsgICAgICAgICAgICAgICBpMmM0ID0gJmkyYzQ7Cj4g
KyAgICAgICAgICAgICAgIG1tYzAgPSAmc2RoY2kwOwo+ICsgICAgICAgICAgICAgICBzZXJpYWww
ID0gJnVhcnQwOwo+ICsgICAgICAgICAgICAgICBzcGkzID0gJnNwaTM7Cj4gKyAgICAgICB9Owo+
ICsKPiArICAgICAgIGNob3NlbiB7Cj4gKyAgICAgICAgICAgICAgIHN0ZG91dC1wYXRoID0gInNl
cmlhbDA6MTE1MjAwbjgiOwo+ICsgICAgICAgfTsKPiArfTsKPiArCj4gKyZvc2Mgewo+ICsgICAg
ICAgY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsKPiArfTsKPiArCj4gKyZkbWFjIHsKPiAr
ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gKyZlbW1jIHsKPiArICAgICAgIGJ1
cy13aWR0aCA9IDw0PjsKPiArICAgICAgIG5vLTEtOC12Owo+ICsgICAgICAgY2FwLW1tYy1ody1y
ZXNldDsKPiArICAgICAgIG5vLXNkOwo+ICsgICAgICAgbm8tc2RpbzsKPiArICAgICAgIG5vbi1y
ZW1vdmFibGU7Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmZ21hYzAg
ewo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+ICsKPiArJmkyYzQgewo+ICsgICAg
ICAgc3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+ICsKPiArJm1kaW8gewo+ICsgICAgICAgc3RhdHVz
ID0gIm9rYXkiOwo+ICt9Owo+ICsKPiArJnNhcmFkYyB7Cj4gKyAgICAgICBzdGF0dXMgPSAib2th
eSI7Cj4gK307Cj4gKwo+ICsmc2RoY2kwIHsKPiArICAgICAgIGJ1cy13aWR0aCA9IDw0PjsKPiAr
ICAgICAgIG5vLTEtOC12Owo+ICsgICAgICAgZGlzYWJsZS13cDsKPiArICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiArfTsKPiArCj4gKyZzZGhjaTEgewo+ICsgICAgICAgYnVzLXdpZHRoID0gPDQ+
Owo+ICsgICAgICAgY2FwLXNkaW8taXJxOwo+ICsgICAgICAgbm8tbW1jOwo+ICsgICAgICAgbm8t
c2Q7Cj4gKyAgICAgICBub24tcmVtb3ZhYmxlOwo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+
ICt9Owo+ICsKPiArJnNwaTMgewo+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+ICsK
PiArJnVhcnQwIHsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gKyZ1c2Ig
ewo+ICsgICAgICAgZHJfbW9kZSA9ICJob3N0IjsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsK
PiArfTsKPiArCj4gLS0KPiAyLjUzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
