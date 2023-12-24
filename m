Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797A2C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 01:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sCsoV3i70AmseGJoDtUJYunUP1z3nNfJ1TiFycq9ic=; b=47yPVwlsYWXMdn
	PiUea/mm8jVbeCGPJ7zbMbe3jYp1Cd3SUPYBkqzQs30vKFOtp/qGXDq0D4ZiOHmmmSVZdQSl2DPbB
	Eb76Y/1fff7tAsCOmIhKR79xSZuEnF3431gGWHHmGIKEh83VOkETISSmXLfcfZEC4aCGUiYNULzGw
	B81gSyJoGOr4Y0Egj9zzi+w7uyddBzEqxbAYVIC4T7rwenlUieogkmgqocfGWtCf4JYZX4/a9dnJu
	eo9o+3GrQPmwZG2Q/RYk1cZHjQnF0JIfEvKmXf64qAWz11sE3CgjPofnTpUetAzaENyFr2Mp1f35W
	GndQ/b71LQUm4x27YB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHDE9-008hsg-2e;
	Sun, 24 Dec 2023 01:24:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHDE5-008hrV-1b
	for linux-riscv@lists.infradead.org;
	Sun, 24 Dec 2023 01:24:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9AEA7CE0AD2
	for <linux-riscv@lists.infradead.org>; Sun, 24 Dec 2023 01:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC5FC43395
	for <linux-riscv@lists.infradead.org>; Sun, 24 Dec 2023 01:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703381055;
	bh=/H0+iF+fDn9DTrAW4o9tox8uhqnr94eocMPWRFJRU0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T15Ae/+AuOnYFc6GQj3tfN5c8UaAV7WLR512HkGl/SPDPgxKE73XQJoiFRNmkquuW
	 YpUcorvbZh4FeJFfxveoQFJFj1WUaJaAA/Fxk0fNm6lVvaoJDq7pcHcCG2IK7nswf+
	 2RS6/02jRB1AkQq9UBlwjd1iIMIrs3vb/6MaJzMVVCaC/aUmDohu0+8y99KtQdZzaU
	 G6sTCb6MWYl6kPN3brqRrdObKMSxRZGW7CwKQxCH1zzP8C1AHSMj7ZUIQGhS0p9gxB
	 AFJoiC6k79mkDLhR+M2YZPq0MziKmGoLk8uKhIQPTvZLJBkX2qH80/rmEjnx+iw5r2
	 f9i/yk960zRFg==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d4e529f24so12075485e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 17:24:14 -0800 (PST)
X-Gm-Message-State: AOJu0YyOuc5fy3Z+jcW8c2OCL9oBt6mPiVtkwpHKpT9Aic28WM42hh3L
	mY0lYiOsbxETpVuuqmP/Tu6DD5oU4fghRRKMa1k=
X-Google-Smtp-Source: AGHT+IFV03RN5WCJzhq8Igd5aRzeZ4KAuFjP6kgdpuUrRLl5b1fqLLswglB+c7zzEB8AJXSmZi03yHMQG3vLjaAlLrs=
X-Received: by 2002:a05:600c:748:b0:40c:35fd:be08 with SMTP id
 j8-20020a05600c074800b0040c35fdbe08mr1371260wmn.122.1703381053321; Sat, 23
 Dec 2023 17:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-5-guoren@kernel.org>
 <ZYUZ8QUJxCL93Fgv@LeoBras> <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
 <e3f1521a9f04463587d07d0c99534d5a@AcuMS.aculab.com> <CAJF2gTRD827Fbs_2FxBP=Z8yudfAAqG6dA+a9eq74RMOz2WDnw@mail.gmail.com>
 <9d4d15e8e3e944b8bd18e8bc1d54f59c@AcuMS.aculab.com>
In-Reply-To: <9d4d15e8e3e944b8bd18e8bc1d54f59c@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 24 Dec 2023 09:24:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQjixePmc8qNJZB+kfyzjVb+NqFHR6GOow-aNhN883CQA@mail.gmail.com>
Message-ID: <CAJF2gTQjixePmc8qNJZB+kfyzjVb+NqFHR6GOow-aNhN883CQA@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
To: David Laight <David.Laight@aculab.com>
Cc: Leonardo Bras <leobras@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "charlie@rivosinc.com" <charlie@rivosinc.com>, 
	"xiao.w.wang@intel.com" <xiao.w.wang@intel.com>, "david@redhat.com" <david@redhat.com>, 
	"panqinglin2020@iscas.ac.cn" <panqinglin2020@iscas.ac.cn>, 
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, "willy@infradead.org" <willy@infradead.org>, 
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_172421_998326_0BDFDD4D 
X-CRM114-Status: GOOD (  23.45  )
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

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgNjozMeKAr1BNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogR3VvIFJlbgo+ID4gU2VudDogMjMgRGVj
ZW1iZXIgMjAyMyAwMjo1Mwo+ID4KPiA+IE9uIEZyaSwgRGVjIDIyLCAyMDIzIGF0IDc6NTLigK9Q
TSBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdodEBhY3VsYWIuY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gRnJvbTogR3VvIFJlbgo+ID4gPiA+IFNlbnQ6IDIyIERlY2VtYmVyIDIwMjMgMTE6MjUKPiA+
ID4gLi4uCj4gPiA+ID4gPiA+ICsjZGVmaW5lIFRBU0tfU0laRSAgICAoaXNfY29tcGF0X3Rhc2so
KSA/IFwKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICBUQVNLX1NJWkVfMzIgOiBU
QVNLX1NJWkVfNjQpCj4gPiA+ID4gSSB3b3VsZCByZW1vdmUgaXNfY29tcGF0X3Rhc2soKSBpbiB0
aGUgbmV4dCB2ZXJzaW9uIGJlY2F1c2UgeW91ciBwYXRjaAo+ID4gPiA+IGNvbnRhaW5zIHRoYXQu
Cj4gPiA+Cj4gPiA+IERvZXMgVEFTS19TSVpFIGdldCB1c2VkIGluIGFjY2Vzc19vaygpID8KPiA+
ID4gSWYgc28gdGhlIHJlcGVhdGVkIGV4cGFuc2lvbiBvZiB0aGF0ICdtZXNzJyB3aWxsIHNsb3cg
dGhpbmdzIGRvd24uCj4gPiA+Cj4gPiA+IE9UT0ggYWNjZXNzX29rKHB0ciwgbGVuKSBjYW4ganVz
dCBjaGVjayAocHRyIHwgKHB0ciArIGxlbikpIDwgMCkKPiA+ID4gYW5kIHJlbHkgb24gdGhlIHBh
Z2UgZmF1bHRzIGZvciBldmVyeXRoaW5nIGVsc2UuCj4gPiBPciBkbyB5b3Ugd2FudCB0byBkaXNj
dXNzIHRoZSBiYWQgc2lkZSBlZmZlY3Qgb2YgaXNfY29tcGF0X3Rhc2soKT8KPiA+Cj4gPiBZZXMs
IHRlc3RfdGhyZWFkX2ZsYWcoVElGXzMyQklUKSB3b3VsZCBzbG93IGRvd24gYWNjZXNzX29rKCku
IEJ1dCBpZgo+ID4gd2UgdXNlIFRBU0tfU0laRV9NQVgsIFZBX0JJVFMgc3RpbGwgbmVlZHMgcGd0
YWJsZV9sNV9lbmFibGVkLAo+ID4gcGd0YWJsZV9sNF9lbmFibGVkIGRldGVjdGF0aW9uIGZvciBy
aXNjdi4KPiA+Cj4gPiBJdCdzIG5vdCBvbmx5IGZvciBjb21wYXQgbW9kZSwgYnV0IGFsc28gU3Yz
OSwgU3Y0OCwgU3Y1Ny4gQWxsIHRyZWF0Cj4gPiBUQVNLX1NJWkVfTUFYIGFzIDB4ODAwMDAwMDAw
MDAwMDAwMCwgcmlnaHQ/IFRoZW46Cj4gPiBhY2Nlc3Nfb2socHRyLCBsZW4pIGNhbiBqdXN0IGNo
ZWNrIChwdHIgfCAocHRyICsgbGVuKSkgPCAwKQo+ID4KPiA+IEl0J3MgYW5vdGhlciBmZWF0dXJl
IGFuZCBkb2VzIG5vdCByZWxhdGUgdG8gY29tcGF0IG1vZGUuCj4KPiBDb21wYXQgbW9kZSBqdXN0
IG1ha2VzIGl0IHdvcnNlLi4uCkl0J3MgaGFyZCB0byBvYnNlcnZlLgoKPgo+IE9uZSBwb3NzaWJp
bGl0eSB3b3VsZCBiZSB0byBzYXZlIHRoZSB0YXNrJ3MgbWF4IHVzZXIgYWRkcmVzcwo+IGluIHRo
ZSB0YXNrIHN0cnVjdHVyZSBpdHNlbGYgLSB0aGF0IHdvdWxkIHNhdmUgYWxsIHRoZSBjb25kaXRp
b25hbHMKPiBhdCBhIGNvc3Qgb2YgYW4gZXh0cmEgdmFsdWUgaW4gdGhlIHRhc2sgc3RydWN0dXJl
LgpJdCB3b3VsZCBzdGlsbCBjYXVzZSBtZW1vcnkgbG9hZCBvcGVyYXRpb24sIGFsdGhvdWdoIGl0
IGlzICR0cC0+eHh4LgpJZiB3ZSB3YW50IHRvIGdhaW4gb2JzZXJ2YWJpbGl0eSBiZW5lZml0cywg
Imp1c3QgY2hlY2sgKHB0ciB8IChwdHIgKwpsZW4pKSA8IDApIiBpcyBiZXR0ZXIuCgo+Cj4gVGhl
cmUgaXMgYWxzbyB0aGUgcXVlc3Rpb24gb2Ygd2hldGhlciBhIG5vcm1hbGx5IDY0LWJpdCB0YXNr
Cj4gY2FuIGFjdHVhbGx5IG1ha2UgdGhlIGNvbXBhdCBtbWFwKCkgc3lzdGVtIGNhbGw/Ck5vLgoK
PiBPbiB4ODYgdGhhdCBpcyBjZXJ0YWlubHkgcG9zc2libGUgKElJUkMgd2luZSBkb2VzIGl0KSwg
eDg2Cj4gdXNlcnNwYWNlIGNhbiBmbGlwIGJldHdlZW4gMzJiaXQgYW5kIDYzYml0IG1vZGUgd2l0
aG91dCBhCj4gc3lzdGVtIGNhbGwuClJJU0MtViBjYW4ndCBkbyB0aGF0IGJlY2F1c2UgaXQgbmVl
ZHMgc3N0YXR1eC51eGw9MzIvNjQsIHdoaWNoIGNhbgpvbmx5IGJlIG1vZGlmaWVkIGluIFMtbW9k
ZS4KCgo+Cj4gICAgICAgICBEYXZpZAo+Cj4gLQo+IFJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lk
ZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSwo+
IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1
byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
