Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA32DC001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jvxkEJlULKUtog82MKtzYvdPeJE7L1KnSC99iV7DbA=; b=QZT3EIznFSkoPx
	OYLQnt1KN2TVHgDkm+BBDyoGCrbKoEuZObE/w08JJGpYaOWuuRfhj9mRZgMCQMekK2sUuge9MCFn3
	WDVnU/vjXE5hRohZKQjo5z0fBwG2ue+oeF6rqtXA6ya7lcEY1ljHEKtnuFrQKeThbQRZvbSYHfwBP
	PT51944WNwtNCSQaJLr5qxRaetCSQ9ccOT0tOaKt0Q0K3xhBsHSvnhnl2OgumeX/MSM4kiHxA+002
	lfPFC0dXQVC6V8gCYHHLp6xctxVRDZlkLDlyemeR7EWJ0DitsNkb94CE/XCor2VykCrfRzJhbtZxj
	KYIkYkKQgiUoPJeJy4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVPv-00GWnp-22;
	Mon, 31 Jul 2023 16:06:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVPs-00GWm5-0a
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 16:06:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-316feb137a7so4933248f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690819596; x=1691424396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zT40P5kFEYJdNbKpdpMzY4q3SIu8zo9VS8U/UistRcU=;
        b=qlsKjlMPSFUyTcM/PjPCc+rdwyRY3gp0AVih9dF+26W19C6HC8vxVMOpKDtuF6TJxk
         QafF1HQRezHMGaBKLdWegYplAKZEKZ3tYME5DmydZ2wLC2H2ZIpqXJH7BHMbss34dmIr
         VnQT3XxMY9A1RHP6A5nXMNdmbiQx0LuXCjkd03rlv0j6cae/rSG8DcBJyC4nz/opA+Wo
         IjMXuDnJvO8ewS+92FTibL9UT75cCvV5Y/9pFNQmwFw3OMcda28tXzCFzImZsYeuD32N
         t/JhAH+kl9Hh9EeSk/vdig4ZLyfdSHEqrfD+twgoykNfbGjpvGHmM4a5uxYaqmCyvUad
         LSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690819596; x=1691424396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zT40P5kFEYJdNbKpdpMzY4q3SIu8zo9VS8U/UistRcU=;
        b=Zf9YGI7B2XVr68MVgDdc/D5l+drNBgqEpJu/Wc9BZdyGZLPF3YbYivKqF4bchG75wd
         JXc2VY8K8VtccTmCpokmFON2lHeVOdbCY9P3FgDhSNMXuKzIf59n8rXia3U+U5kH1Zu8
         Oad4Xbc8J0Y/HK5pQWToAvmvs4Gc9yy9yc6D4IBcKSuzl8AGHEFUrV3tfvRxgGqBB9TO
         BKjN5ESaleRw6cIrGACbledcz1MaDQJ6LExcsJvKHzGFJP9dViVRqrf+N0W5dZk3+PiP
         6LKCgtS2WwEHiu+Kq3vwLk0x1lnt38e3xjbVxjdPudLhpq8ouT7a1oDC4JWopJ3B9uXG
         JnlQ==
X-Gm-Message-State: ABy/qLa7D5T1OQzk9WgrbI+ERmhvTGOkmsyGtDjzJ/vFBM+/iQMmEz3w
	BhIvimcsJ6VUcIcu4lek8p+ezCG7OkznIJu/VmV08g==
X-Google-Smtp-Source: APBJJlF+BDencYo+LTfAMkZHqtnCV+zm+jRthazIG9YKGK5eIXIfmAkh9croBuRU4xtoao9hS+6hV+7hCS+8S97wY28=
X-Received: by 2002:adf:d84a:0:b0:317:61d8:3c7e with SMTP id
 k10-20020adfd84a000000b0031761d83c7emr194456wrl.26.1690819596395; Mon, 31 Jul
 2023 09:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
 <20230727141428.962286-10-alexghiti@rivosinc.com> <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
 <CAHVXubgVAe1WsiZx5Ay+3KPK4u24k_vsnTwFFmBeVsHrGXwhfw@mail.gmail.com>
 <CAHVXubj80rQRShuDS09BeTrfR6nux0A68EMWLbeat8fd_Y3YdA@mail.gmail.com> <CAP-5=fWwzuGZ6a6Z38ndsb7gw7_uwS0a2VGXx08hMeiK8eZ91w@mail.gmail.com>
In-Reply-To: <CAP-5=fWwzuGZ6a6Z38ndsb7gw7_uwS0a2VGXx08hMeiK8eZ91w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 31 Jul 2023 18:06:25 +0200
Message-ID: <CAHVXubjhM9C1fw_Us=8+RuSJbW0pacFAk9gp7j2=BtMUPy_Byw@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
To: Ian Rogers <irogers@google.com>, Brendan Sweeney <brs@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_090640_220741_1652FC9C 
X-CRM114-Status: GOOD (  46.34  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgNToxMOKAr1BNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAzMSwgMjAyMyBhdCAzOjI34oCvQU0gQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBN
b24sIEp1bCAzMSwgMjAyMyBhdCAxMjoxNeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIElhbiwKPiA+ID4KPiA+ID4gT24g
RnJpLCBKdWwgMjgsIDIwMjMgYXQgNzo1M+KAr1BNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xl
LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCA3OjI4
4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+
ID4gPiA+Cj4gPiA+ID4gPiByaXNjdiBub3cgc3VwcG9ydHMgbW1hcGluZyBoYXJkd2FyZSBjb3Vu
dGVycyBzbyBhZGQgd2hhdCdzIG5lZWRlZCB0bwo+ID4gPiA+ID4gdGFrZSBhZHZhbnRhZ2Ugb2Yg
dGhhdCBpbiBsaWJwZXJmLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiA+IFJldmlld2VkLWJ5
OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+ID4gUmV2aWV3
ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gPiA+ID4gLS0tCj4g
PiA+ID4gPiAgdG9vbHMvbGliL3BlcmYvbW1hcC5jIHwgNjUgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNl
cnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9wZXJm
L21tYXAuYyBiL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+ID4gPiA+ID4gaW5kZXggMGQxNjM0Y2Vk
ZjQ0Li4zNzhhMTYzZjA1NTQgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS90b29scy9saWIvcGVyZi9t
bWFwLmMKPiA+ID4gPiA+ICsrKyBiL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+ID4gPiA+ID4gQEAg
LTM5Miw2ICszOTIsNzEgQEAgc3RhdGljIHU2NCByZWFkX3BlcmZfY291bnRlcih1bnNpZ25lZCBp
bnQgY291bnRlcikKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgc3RhdGljIHU2NCByZWFkX3RpbWVzdGFt
cCh2b2lkKSB7IHJldHVybiByZWFkX3N5c3JlZyhjbnR2Y3RfZWwwKTsgfQo+ID4gPiA+ID4KPiA+
ID4gPiA+ICsjZWxpZiBfX3Jpc2N2X3hsZW4gPT0gNjQKPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXMg
c29tZXRoaW5nIG9mIGFuIG9kZCBndWFyZCwgcGVyaGFwczoKPiA+ID4gPiAjZWxpZiBkZWZpbmVk
KF9fcmlzY3YpICYmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ID4gPiA+Cj4gPiA+ID4gVGhhdCB3YXkg
aXQgaXMgbW9yZSBpbnRlbnRpb24gcmV2ZWFsaW5nIHRoYXQgdGhpcyBpcyByaXNjdiBjb2RlLiBD
b3VsZAo+ID4gPiA+IHlvdSBhZGQgYSBjb21tZW50IHJlbGF0aW5nIHRvIHRoZSBfX3Jpc2N2X3hs
ZW4gPwo+ID4gPgo+ID4gPiBJIGd1ZXNzIEFuZHJldyBhbnN3ZXJlZCB0aGF0IGFscmVhZHkuCj4g
PiA+Cj4KPiBOb3Qgc3VyZS4gSSBzdGlsbCB0aGluayBpdCBsb29rcyB3ZWlyZDoKPiAuLi4KPiAj
aWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKQo+IC4uLgo+ICNlbGlm
IGRlZmluZWQoX19hYXJjaDY0X18pCj4gLi4uCj4gI2VsaWYgX19yaXNjdl94bGVuID09IDY0Cj4g
Li4uCj4gI2Vsc2UKPiBzdGF0aWMgdTY0IHJlYWRfcGVyZl9jb3VudGVyKHVuc2lnbmVkIGludCBj
b3VudGVyIF9fbWF5YmVfdW51c2VkKSB7IHJldHVybiAwOyB9Cj4gc3RhdGljIHU2NCByZWFkX3Rp
bWVzdGFtcCh2b2lkKSB7IHJldHVybiAwOyB9Cj4gI2VuZGlmCj4KPiBUaGUgZmlyc3QgdHdvIGFy
ZSBjbGVhcmx5ICNpZmRlZi1pbmcgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGFzc2VtYmx5Cj4gY29k
ZSwgdW5kZXIgd2hhdCBjb25kaXRpb25zIEkgZ2V0IFJJU0MtViBjb2RlICDCr1wo44OEKS/CryBB
dCBsZWFzdCB3b3J0aAo+IGEgY29tbWVudCBsaWtlICJjc3JyIGlzIG9ubHkgYXZhaWxhYmxlIHdo
ZW4geW91IGhhdmUgeGxlbnMgb2YgNjQKPiBiZWNhdXNlIC4uLiIKCl9fcmlzY3ZfeGxlbiBpbmRp
Y2F0ZXMgcmlzY3Y2NCwgd2hpY2ggaXMgdGhlIG9ubHkgdGFyZ2V0IG9mIHRoaXMKcGF0Y2hzZXQu
IEJ1dCBpZiB5b3UgcHJlZmVyLCBJIGRvbid0IG1pbmQgYWRkaW5nIGJhY2sgdGhlCmRlZmluZWQo
X19yaXNjdikgaWYgSSByZS1zcGluIGEgbmV3IHZlcnNpb24uCgo+Cj4gPiA+ID4KPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsvKiBUT0RPOiBpbXBsZW1lbnQgcnYzMiBzdXBwb3J0ICovCj4gPiA+ID4g
PiArCj4gPiA+ID4gPiArI2RlZmluZSBDU1JfQ1lDTEUgICAgICAweGMwMAo+ID4gPiA+ID4gKyNk
ZWZpbmUgQ1NSX1RJTUUgICAgICAgMHhjMDEKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsjZGVmaW5l
IGNzcl9yZWFkKGNzcikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ID4gPiArKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gKyAgICAgICByZWdpc3RlciB1bnNpZ25lZCBs
b25nIF9fdjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImNzcnIgJTAsICIgI2NzciAgICAgICAgICBc
Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgIDogIj1yIiAoX192KSA6ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICA6ICJtZW1vcnki
KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPgo+ID4gPiA+IFRv
IGF2b2lkIHRoZSBtYWNybyBwYXN0aW5nIHRoYXQgY291bGQgcG90ZW50aWFsbHkgZ28gd2VpcmQs
IGNvdWxkIHRoaXMgYmU6Cj4gPiA+ID4KPiA+ID4gPiBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImNz
cnIgJTAsICUxIiwKPiA+ID4gPiAgIDogIj1yIihfX3YpIC8qIG91dHB1dHMgKi8KPiA+ID4gPiAg
IDogImkiKGNzcikgLyogaW5wdXRzICovCj4gPiA+ID4gICA6ICJtZW1vcnkiIC8qIGNsb2JiZXJz
ICovKQo+ID4KPiA+IEZvcmdvdCB0byBhbnN3ZXIgdGhpcyBvbmU6IGl0IGNvbXBpbGVzLCBidXQg
SSBoYXZlIHRvIGFkbWl0IHRoYXQgSQo+ID4gZG9uJ3QgdW5kZXJzdGFuZCB0aGUgZGlmZmVyZW5j
ZSBhbmQgaWYgdGhhdCdzIGNvcnJlY3QgKGFsbCBtYWNyb3MgaW4KPiA+IGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3NyLmggdXNlICMgdG8gZG8gdGhpcykgYW5kIHdoYXQgYmVuZWZpdHMgaXQKPiA+
IGJyaW5ncy4gQ2FuIHlvdSBlbGFib3JhdGUgbW9yZSBvbiB0aGluZ3MgdGhhdCBjb3VsZCAiZ28g
d2VpcmQiPwo+Cj4gU28gcmF0aGVyIHRoYW4gdXNlIGFuIGlucHV0IGNvbnN0cmFpbnQgZm9yIHRo
ZSBhc20gYmxvY2sgeW91IGFyZSB1c2luZwo+IHRoZSBDIHByZXByb2Nlc3NvciB0byBwYXN0ZSBp
biB0aGUgY3NyIGFyZ3VtZW50LiBJZiBjc3IgaXMgc29tZXRoaW5nCj4gbGlrZSAiMSIgdGhlbiBp
dCBsb29rcyBnb29kIGFuZCB5b3UnbGwgZ2V0ICJjc3JyICUwLDEiLiBJZiB5b3UgcGFzcwo+IHNv
bWV0aGluZyBsaWtlICIxIDw8IDMxIiB0aGVuIHRoYXQgd2lsbCBiZSBwYXN0ZWQgYXMgImNzcnIg
JTAsIDEgPDwKPiAzMSIgYW5kIHRoYXQgc3RhcnRzIHRvIGdldCB3ZWlyZCBpbiB0aGUgY29udGV4
dCBvZiBiZWluZyBpbiB0aGUKPiBhc3NlbWJsZXIgd2hlcmUgaXQgaXMgdW5saWtlbHkgdGhlIEMg
b3BlcmF0b3JzIHdvcmsuIFVzaW5nIHRoZSBpbnB1dAo+IGNvbnN0cmFpbnQgYXZvaWRzIHRoaXMs
IGNhdXNlcyB0aGUgQyBjb21waWxlciB0byBjaGVjayB0aGUgdHlwZSBvZiB0aGUKPiBhcmd1bWVu
dCBhbmQgeW91J2xsIHByb2JhYmx5IGdldCBtb3JlIGludGVsbGlnaWJsZSBlcnJvciBtZXNzYWdl
cyBhcyBhCj4gY29uc2VxdWVuY2UuCj4KClRoYW5rcy4gU28gaWYgSSdtIG5vdCBtaXN0YWtlbiwg
aW4gdGhpcyBleGFjdCBjb250ZXh0LCBnaXZlbiB3ZSBvbmx5CnVzZSBjc3JfcmVhZCgpIHRocm91
Z2ggdGhlIGNzcl9yZWFkX251bSgpIGZ1bmN0aW9uLCBpdCBzZWVtcyBvayByaWdodD8KCj4gPgo+
ID4gVGhhbmtzIGFnYWluLAo+ID4KPiA+IEFsZXgKPiA+Cj4gPiA+ID4KPiA+ID4gPiBBbHNvLCB3
aHkgaXMgdGhpcyBjbG9iYmVyaW5nIG1lbW9yeT8gV29ydGggYWRkaW5nIGEgY29tbWVudC4KPiA+
ID4KPiA+ID4gTm8gaWRlYSwgSSBzZWUgdGhhdCBpdCBpcyBhbHNvIGRvbmUgdGhpcyB3YXkgaW4K
PiA+ID4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaC4gQEF0aXNoIEt1bWFyIFBhdHJhICwg
QFBhbG1lciBEYWJiZWx0ID8KPgo+IEl0IHdvdWxkIHNlZW0gdG8gbWFrZSBzZW5zZSB0aGVuIG5v
dCB0byBoYXZlIGEgbWVtb3J5IGNvbnN0cmFpbnQgdW50aWwKPiB3ZSBrbm93IHdoeSB3ZSdyZSBk
b2luZyBpdD8KPgoKSSBoYXZlIGp1c3QgaGFkIHRoZSBhbnN3ZXIgaW50ZXJuYWxseSAodGhhbmtz
IHRvIEBCcmVuZGFuIFN3ZWVuZXkpOgpjc3IgbW9kaWZpY2F0aW9ucyBjYW4gYWx0ZXIgaG93IHRo
ZSBtZW1vcnkgaXMgYWNjZXNzZWQgKHNhdHAgd2hpY2gKY2hhbmdlcyB0aGUgYWRkcmVzcyBzcGFj
ZSwgc3VtIHdoaWNoIGFsbG93cy9kaXNhbGxvd3MgdXNlcnNwYWNlCmFjY2Vzcy4uLiksIHNvIHdl
IG5lZWQgdGhlIG1lbW9yeSBiYXJyaWVyIHRvIG1ha2Ugc3VyZSB0aGUgY29tcGlsZXIKZG9lcyBu
b3QgcmVvcmRlciB0aGUgbWVtb3J5IGFjY2Vzc2VzLgoKVGhhbmtzLAoKQWxleAoKPiBUaGFua3Ms
Cj4gSWFuCj4KPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQo+ID4gPgo+ID4g
PiBBbGV4Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gSWFuCj4gPiA+ID4K
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgX192OyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiArfSkKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtz
dGF0aWMgdW5zaWduZWQgbG9uZyBjc3JfcmVhZF9udW0oaW50IGNzcl9udW0pCj4gPiA+ID4gPiAr
ewo+ID4gPiA+ID4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0sIF9fdmFs
KSAgICAgICAgICAge1wKPiA+ID4gPiA+ICsgICAgICAgY2FzZSBfX2Nzcl9udW06ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIF9fdmFs
ID0gY3NyX3JlYWQoX19jc3JfbnVtKTsgICAgICAgICAgICBcCj4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgYnJlYWs7IH0KPiA+ID4gPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfMihf
X2Nzcl9udW0sIF9fdmFsKSAgICAgICAgIHtcCj4gPiA+ID4gPiArICAgICAgIHN3aXRjaGNhc2Vf
Y3NyX3JlYWQoX19jc3JfbnVtICsgMCwgX192YWwpICAgICAgICBcCj4gPiA+ID4gPiArICAgICAg
IHN3aXRjaGNhc2VfY3NyX3JlYWQoX19jc3JfbnVtICsgMSwgX192YWwpfQo+ID4gPiA+ID4gKyNk
ZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251bSwgX192YWwpICAgICAgICAge1wK
PiA+ID4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8yKF9fY3NyX251bSArIDAsIF9f
dmFsKSAgICAgIFwKPiA+ID4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8yKF9fY3Ny
X251bSArIDIsIF9fdmFsKX0KPiA+ID4gPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRf
OChfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAgIHtcCj4gPiA+ID4gPiArICAgICAgIHN3aXRjaGNh
c2VfY3NyX3JlYWRfNChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICBcCj4gPiA+ID4gPiArICAg
ICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0gKyA0LCBfX3ZhbCl9Cj4gPiA+ID4g
PiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzE2KF9fY3NyX251bSwgX192YWwpICAgICAg
ICB7XAo+ID4gPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgoX19jc3JfbnVtICsg
MCwgX192YWwpICAgICAgXAo+ID4gPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgo
X19jc3JfbnVtICsgOCwgX192YWwpfQo+ID4gPiA+ID4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3Jf
cmVhZF8zMihfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAge1wKPiA+ID4gPiA+ICsgICAgICAgc3dp
dGNoY2FzZV9jc3JfcmVhZF8xNihfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgIFwKPiA+ID4gPiA+
ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8xNihfX2Nzcl9udW0gKyAxNiwgX192YWwpfQo+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIHJldCA9IDA7Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHN3aXRjaCAoY3NyX251bSkgewo+ID4gPiA+ID4gKyAg
ICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzMyKENTUl9DWUNMRSwgcmV0KQo+ID4gPiA+ID4gKyAg
ICAgICBkZWZhdWx0Ogo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4g
KyAgICAgICB9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHJldHVybiByZXQ7Cj4gPiA+
ID4gPiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfMzIKPiA+ID4gPiA+ICsjdW5kZWYgc3dp
dGNoY2FzZV9jc3JfcmVhZF8xNgo+ID4gPiA+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFk
XzgKPiA+ID4gPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF80Cj4gPiA+ID4gPiArI3Vu
ZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfMgo+ID4gPiA+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nz
cl9yZWFkCj4gPiA+ID4gPiArfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3N0YXRpYyB1NjQgcmVh
ZF9wZXJmX2NvdW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIpCj4gPiA+ID4gPiArewo+ID4gPiA+
ID4gKyAgICAgICByZXR1cm4gY3NyX3JlYWRfbnVtKENTUl9DWUNMRSArIGNvdW50ZXIpOwo+ID4g
PiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgdTY0IHJlYWRfdGltZXN0YW1w
KHZvaWQpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gY3NyX3JlYWRfbnVt
KENTUl9USU1FKTsKPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgI2Vsc2UKPiA+
ID4gPiA+ICBzdGF0aWMgdTY0IHJlYWRfcGVyZl9jb3VudGVyKHVuc2lnbmVkIGludCBjb3VudGVy
IF9fbWF5YmVfdW51c2VkKSB7IHJldHVybiAwOyB9Cj4gPiA+ID4gPiAgc3RhdGljIHU2NCByZWFk
X3RpbWVzdGFtcCh2b2lkKSB7IHJldHVybiAwOyB9Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi4z
OS4yCj4gPiA+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
