Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372B0EE14D6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l63Et/iGMeI74q8XX8OalSRXQeFjwlE/qtMRkLIB/lY=; b=HVbQi6tCfKVZBb
	hsrI/Gz5fitqLmURIVEf0RuWFg3btUVNM5LQiZZwCiqpSb26DkxT9VNiYQcsKv9OABJ9Q3BZbzMjV
	2+lHh0AfFlrkP3MuIvQLik9auIILq4cN8x0RaSzvsv4FRiTKHmYFnznn4Ff3hGBn+uh4KM/rahaTr
	q16bN3ckpPQVG/d//MRAxlPsNAGudRmq3i6tdI9Dq2Q9h+jlc4ytMgL3HzRMEY8G8P70YN93fn8DS
	MWy8ZAvOST8sQ3Uu9FhZazyqMmQ/M55o9rjk7pMjq9TcFycczHXmUw1cw/SvguAVH+pAnIHjSJY+n
	2Yx5jYYhqn4QjhW/dlTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAxw-00Bdlc-1N;
	Thu, 07 Sep 2023 09:06:20 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAxr-00Bdjo-0k
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 09:06:18 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso13334751fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694077571; x=1694682371; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwR4d+5UoVgi3hAZhhlc3KZ970LG1A0zS/bDs+8zFKk=;
        b=uy64YXLGEOROR1sD22TxeXb5WNO2wcurBTmBfdapkKKuETPSD4Kgu5bAJP0VGcBzhr
         y291YuzZo45yqXQ7iwjrVKrGEKfib5rEJhnR4M/CZe2VhBtnFkXaEYCzV+FuHSBuocFy
         usLLeBGJXpOdkgkyTK6tZ2QWrCaIeuUL42iT3QNf/niFX4fRdy5kcDFE845/06pma2hj
         jT0oMVB0JElVPZSBXWj4Q6cXzEUHRr3bC5oG8zG25thQuQHgcDN8sU7p8w97PoBe7lGF
         lmo98bv6pk2ehn6dBGlKfMRSBX95DY1UMeTmvV2WINSBtosP7Y/Yv8FIb7RdgEWgqAkk
         9CWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694077571; x=1694682371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwR4d+5UoVgi3hAZhhlc3KZ970LG1A0zS/bDs+8zFKk=;
        b=JL49SHvsgkPJM7RlJB72xugvMPrQXtjsbWeJzwwejjPl7U51UGXyVtGuVeBNczzNP/
         R563rfaHSBXm+EiubDBee0n1oAfFXblqxGpHGyeSSqnB6orgn97SkBsZ2Mw+xNBkUobl
         eunLBnoXNIzOfKkjMxeiY2+JQKjZZhxtKsgTQYogle8KjYoLbBfEYQxNj/7uCa9kRLNa
         1/smTzb/iLI1Ag1HBb+iY8L0voSLpV4srUd6yhOdBFWvK3WsIhVC3hqnkgnTxR+kYcdV
         cG0Rhmv0r4kDmKF49eNBS/Yd1BAJaXieVW///RnwkIzSq3cIVNhsFKTbt064Tk3/pskb
         ywWw==
X-Gm-Message-State: AOJu0Yz0ok3NiAbt4MqC3CtQSzVq7eTKY8Ev8IU3w2iEMtAsnKDRp3f5
	UMN9H8vKbvyss4ABOZ79TNJIu4/LKpN2ffJrT7+4pg==
X-Google-Smtp-Source: AGHT+IFJTavyxjhxdaZZ701qmmj1qQoYaTn/kfRbKFSawpT28Zk2UYqvQGaxKIpZhSb6/hBu/iAUJVkTBPu3r6ZOQ5U=
X-Received: by 2002:a2e:b013:0:b0:2bc:b29e:8ff7 with SMTP id
 y19-20020a2eb013000000b002bcb29e8ff7mr4344328ljk.20.1694077571114; Thu, 07
 Sep 2023 02:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com> <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
 <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com>
 <CA+V-a8vJJFCKy3pCL2Qp1NogL-K5s9moGDbv3tTvx+z1FeKarw@mail.gmail.com>
 <CAHVXubhLB9Pw51C1ed1Youp9k0qTJKrokUAqf=Xnr+m3BoN5=g@mail.gmail.com>
 <CA+V-a8s0i=VMSbMa6WvOiZpqe_idAhq4cZ0inSdCNy39-rQeAg@mail.gmail.com>
 <CAHVXubjgjAwMOi0J5zZJkuX8RKwgfKp-_=tVTLDvKN=tBBdxNQ@mail.gmail.com> <CA+V-a8uxe=sT7oX4Dk4zppCbYzWdZgWt9Xh4m+pA2+3t8kfnjg@mail.gmail.com>
In-Reply-To: <CA+V-a8uxe=sT7oX4Dk4zppCbYzWdZgWt9Xh4m+pA2+3t8kfnjg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 7 Sep 2023 11:05:59 +0200
Message-ID: <CAHVXubitpk9RxMPc9+ss0y=ZmpOrfv0ocP+UDQktR=TM+gy=KQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_020616_713327_1C6A7365 
X-CRM114-Status: GOOD (  43.24  )
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

SGkgUHJhYmhha2FyLAoKT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAzOjU14oCvUE0gTGFkLCBQcmFi
aGFrYXIKPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFsZXhhbmRy
ZSwKPgo+IE9uIFdlZCwgU2VwIDYsIDIwMjMgYXQgMTo0M+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBTZXAgNiwgMjAy
MyBhdCAyOjI04oCvUE0gTGFkLCBQcmFiaGFrYXIKPiA+IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWls
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEFsZXhhbmRyZSwKPiA+ID4KPiA+ID4gT24gV2Vk
LCBTZXAgNiwgMjAyMyBhdCAxOjE44oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwgU2VwIDYsIDIwMjMgYXQg
MjowOeKAr1BNIExhZCwgUHJhYmhha2FyCj4gPiA+ID4gPHByYWJoYWthci5jc2VuZ2dAZ21haWwu
Y29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSBBbGV4YW5kcmUsCj4gPiA+ID4gPgo+
ID4gPiA+ID4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxOjAx4oCvUE0gQWxleGFuZHJlIEdoaXRp
IDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
SGkgUHJhYmhha2FyLAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBXZWQsIFNlcCA2LCAyMDIz
IGF0IDE6NDnigK9QTSBMYWQsIFByYWJoYWthcgo+ID4gPiA+ID4gPiA8cHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSGkgQWxleGFu
ZHJlLAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gVHVlLCBBdWcgMSwgMjAyMyBhdCA5
OjU44oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToK
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGlzIGZ1bmN0aW9uIHVzZWQgdG8gc2lt
cGx5IGZsdXNoIHRoZSB3aG9sZSB0bGIgb2YgYWxsIGhhcnRzLCBiZSBtb3JlCj4gPiA+ID4gPiA+
ID4gPiBzdWJ0aWxlIGFuZCB0cnkgdG8gb25seSBmbHVzaCB0aGUgcmFuZ2UuCj4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBjYW4gb25seSB1c2Ug
UEFHRV9TSVpFIGFzIHN0cmlkZSBzaW5jZSB3ZSBkb24ndCBrbm93Cj4gPiA+ID4gPiA+ID4gPiB0
aGUgc2l6ZSBvZiB0aGUgdW5kZXJseWluZyBtYXBwaW5nIGFuZCB0aGVuIHRoaXMgZnVuY3Rpb24g
d2lsbCBiZSBpbXByb3ZlZAo+ID4gPiA+ID4gPiA+ID4gb25seSBpZiB0aGUgc2l6ZSBvZiB0aGUg
cmVnaW9uIHRvIGZsdXNoIGlzIDwgdGhyZXNob2xkICogUEFHRV9TSVpFLgo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4g
PiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIHwgMTEgKysrKystLS0t
LQo+ID4gPiA+ID4gPiA+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICB8IDM0
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ID4gPiA+ID4gPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBBZnRlciBhcHBseWluZyB0aGlzIHBhdGNoLCBJIGFtIHNlZWluZyBt
b2R1bGUgbG9hZCBpc3N1ZXMgb24gUlovRml2ZQo+ID4gPiA+ID4gPiA+IChjb21wbGV0ZSBsb2cg
WzBdKS4gSSBhbSB0ZXN0aW5nIGRlZmNvbmZpZyArIFsxXSAocnovZml2ZSByZWxhdGVkCj4gPiA+
ID4gPiA+ID4gY29uZmlncykuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBbnkgcG9pbnRl
cnMgb24gd2hhdCBjb3VsZCBiZSBhbiBpc3N1ZSBoZXJlPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBDYW4geW91IGdpdmUgbWUgdGhlIGV4YWN0IHZlcnNpb24gb2YgdGhlIGtlcm5lbCB5b3UgdXNl
PyBUaGUgdHJhcAo+ID4gPiA+ID4gPiBhZGRyZXNzZXMgYXJlIHZtYWxsb2MgYWRkcmVzc2VzLCBh
bmQgYSBmaXggZm9yIHRob3NlIGxhbmRlZCB2ZXJ5IGxhdGUKPiA+ID4gPiA+ID4gaW4gdGhlIHJl
bGVhc2UgY3ljbGUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGFtIHVzaW5nIG5leHQtMjAyMzA5
MDYsIEl2ZSBwdXNoZWQgYSBicmFuY2ggWzFdIGZvciB5b3UgdG8gaGF2ZSBhIGxvb2suCj4gPiA+
ID4gPgo+ID4gPiA+ID4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9wcmFiaGFrYXJsYWQvbGludXgv
dHJlZS9yemZpdmUtZGVidWcKPiA+ID4gPgo+ID4gPiA+IEdyZWF0LCB0aGFua3MsIEkgaGFkIHRv
IGdldCByaWQgb2YgdGhpcyBwb3NzaWJpbGl0eSA6KQo+ID4gPiA+Cj4gPiA+ID4gQXMtaXMsIEkg
aGF2ZSBubyBpZGVhLCBjYW4geW91IHRyeSB0byAiYmlzZWN0IiB0aGUgcHJvYmxlbT8gSSBtZWFu
Cj4gPiA+ID4gd2hpY2ggcGF0Y2ggaW4gdGhlIHNlcmllcyBsZWFkcyB0byB0aG9zZSB0cmFwcz8K
PiA+ID4gPgo+ID4gPiBPb3BzIHNvcnJ5IGZvciBub3QgbWVudGlvbmluZyBlYXJsaWVyLCB0aGlz
IGlzIHRoZSBvZmZlbmRpbmcgcGF0Y2gKPiA+ID4gd2hpY2ggbGVhZHMgdG8gdGhlIGlzc3VlcyBz
ZWVuIG9uIHJ6L2ZpdmUuCj4gPgo+ID4gT2ssIHNvIGF0IGxlYXN0IEkgZm91bmQgdGhlIGZvbGxv
d2luZyBwcm9ibGVtLCBidXQgSSBkb24ndCBzZWUgaG93Cj4gPiB0aGF0IGNvdWxkIGZpeCB5b3Vy
IGlzc3VlOiBjYW4geW91IGdpdmUgYSB0cnkgYW55d2F5PyBJIGtlZXAgbG9va2luZwo+ID4gaW50
byB0aGlzLCB0aGFua3MKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVz
aC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiBpbmRleCBkZjJhMDgzOGMzYTEuLmI1
NjkyYmM2Yzc2YSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4g
KysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiBAQCAtMjM5LDcgKzIzOSw3IEBAIHZv
aWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ID4gdW5zaWdu
ZWQgbG9uZyBzdGFydCwKPiA+Cj4gPiAgdm9pZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2ln
bmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ID4gIHsKPiA+IC0gICAgICAgX19m
bHVzaF90bGJfcmFuZ2UoTlVMTCwgc3RhcnQsIGVuZCwgUEFHRV9TSVpFKTsKPiA+ICsgICAgICAg
X19mbHVzaF90bGJfcmFuZ2UoTlVMTCwgc3RhcnQsIGVuZCAtIHN0YXJ0LCBQQUdFX1NJWkUpOwo+
ID4gIH0KPiA+Cj4gSSBhbSBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCB0aGUgYWJv
dmUgY2hhbmdlIHRvby4KCkkgY2FuJ3QgcmVwcm9kdWNlIHRoZSBwcm9ibGVtIG9uIG15IFVubWF0
Y2hlZCBvciBRZW11LCBzbyBpdCBpcyBub3QKZWFzeSB0byBkZWJ1Zy4gQnV0IEkgdG9vayBhbm90
aGVyIGxvb2sgYXQgeW91ciB0cmFjZXMgYW5kIHNvbWV0aGluZyBpcwp3ZWlyZCB0byBtZS4gSW4g
dGhlIGZvbGxvd2luZyB0cmFjZSAoYW5kIHRoZXJlIGlzIGFub3RoZXIgb25lKSwgdGhlCnRyYXAg
aXMgdGFrZW4gYXQgMHhmZmZmZmZmZjAxNWNhMDM0LCB3aGljaCBpcyB0aGUgYmVnaW5uaW5nIG9m
CnJ6X3NzaV9wcm9iZSgpOiB0aGF0J3MgYSBwYWdlIGZhdWx0LCBzbyBubyB0cmFuc2xhdGlvbiB3
YXMgZm91bmQgKG9yCmFuIGludmFsaWQgb25lIGlzIGNhY2hlZCkuCgpbICAgMTYuNTg2NTI3XSBV
bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsCmFkZHJlc3Mg
ZmZmZmZmZmYwMTVjYTAzNApbICAgMTYuNTk0NzUwXSBPb3BzIFsjM10KLi4uClsgICAxNi42MjIw
MDBdIGVwYyA6IHJ6X3NzaV9wcm9iZSsweDAvMHg1MmEgW3NuZF9zb2Nfcnpfc3NpXQouLi4KWyAg
IDE2LjcwODY5N10gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFkZHI6IGZmZmZmZmZmMDE1
Y2EwMzQKY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGMKWyAgIDE2LjcxNjU4MF0gWzxmZmZmZmZmZjAx
NWNhMDM0Pl0gcnpfc3NpX3Byb2JlKzB4MC8weDUyYQpbc25kX3NvY19yel9zc2ldCi4uLgoKQnV0
IHRoZW4gaGVyZSB3ZSBhcmUgYWJsZSB0byByZWFkIHRoZSBjb2RlIGF0IHRoaXMgc2FtZSBhZGRy
ZXNzOgpbICAgMTYuODIxNjIwXSBDb2RlOiAwMTA5IDY1OTcgMDAwMCA4NTkzIDVmNjUgNzA5NyA3
ZjM0IDgwZTcgN2FhMCBiN2E5Cig3MTM5KSBmODIyCgpTbyB0aGF0IGxvb2tzIGxpa2UgYSAidHJh
bnNpZW50IiBlcnJvci4gRG8geW91IGtub3cgaWYgeW91IHVhcmNoCmNhY2hlcyBpbnZhbGlkIFRM
QiBlbnRyaWVzPyBJZiB5b3UgZG9uJ3Qga25vdywgSSBoYXZlIGp1c3Qgd3JpdHRlbgpzb21lIHBp
ZWNlIG9mIGNvZGUgdG8gZGV0ZXJtaW5lIGlmIGl0IGRvZXMsIGxldCBtZSBrbm93LgoKRG8gdGhv
c2UgZXJyb3JzIGFsd2F5cyBoYXBwZW4/Cgo+Cj4gQ2hlZXJzLAo+IFByYWJoYWthcgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
