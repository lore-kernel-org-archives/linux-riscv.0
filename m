Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152A8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 04:49:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C31A061078
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 04:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C31A061078
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Bcxs6ea0IOFyNlFLPdNzxyHowxlSG2skd6S3BpPZQY=; b=KBuxiO4yLLhJQf
	pHTHyXjtLrkSpAbRKpNFSy7H0crVEyglSOzhG6qHfow7spUyikbBoqX1yTH7S/dnhz4ODd+1Ujlyx
	scIt1qr8dJMeESYUXYc0x0Rqm362pkpluyeKS3xqqDkIKTF7Zw99wMByddLs8FK3TB34oKF9/v4iK
	5PvAtdGrVSTiCy5o311m3/OjQ6Gt9wkS4MWc5AEjqB9TIxcVAkfzfm4n9ezOn64Pzdq4lKfQZNC/V
	RyRWx34g8eDVTtJYPfU8qRY/LpY8SVbbrtsI22EQ6GGAOsYxv+hL4k/w8TSXD7yHW/ckcF6O0b2UY
	MZ2RpF3cjum0GEIMRHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfEOU-000dpj-Li; Tue, 26 Oct 2021 04:49:02 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfEOQ-000doo-TZ
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 04:49:00 +0000
Received: by mail-oi1-x230.google.com with SMTP id q129so18821602oib.0
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 21:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QUu57E+IbafflI6/qVuHyQy7kRwajg1mknD459Ucq7I=;
 b=T8WI27PGDwenRdxbOfKA3S8HDZp6sbhIYxqeZCLhTLN8rjreR9bE81IbHgyxIXWZDN
 tfiz3zX8hZ98FBrMRlHLhXGjJR7QyTqpTTo76DmaTboNPKkLZTftb9grrBzZGXJZJMZ2
 qQNrLs7a2o0D/fB8RmiTp7WV7e3Z4d+z3ZTe8qQX+Ayl03TcVgJd61dlM8KcEG2ckILv
 w0rld49kC3zcx0mj4gy3KLH4VOr+rh2GWb5FL8aISjJOO/UHp42QlfzDo5ae4NAyouwq
 VJIdniD5FIqowWM+CY/FCMQajtRI81OoYsunNKlf6BfaDVngZcP25jYNmsjDer9/zmDM
 DZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QUu57E+IbafflI6/qVuHyQy7kRwajg1mknD459Ucq7I=;
 b=oRE3823S2t9JYgnZalYtEi/anG/HpSKd040yyvASLEZDFnjNxkOaQWIloZeIdhcs5d
 LtgCcloquJkNvCT4kXTOKJHRnp9LQ7tRJwtDZPFEnjRSBg6hUDEiGyzmX59Gygn0mXlX
 aQub3c21an3OyTbM3VdnezoBciOSelS9WEpsBuSv3C/Vqt5RT8KLZOtr70uePoB3+kR2
 Q2FV5EfbMKERx4tuTB/KQlHNi7pgfwKgWvDpjTM5uUO9wX7L7I/ExGBTnCA3iljr1uRi
 FVYbv4RnQdUSz8qtQ1c5UFyFXP+7NVkYDFtefmP8z6I79dZRYG8XGuT7vpk3KPPdKyGF
 xzjQ==
X-Gm-Message-State: AOAM530PQji9ukO+A8kFEjc8MbOo4ll5KTYYl30xEiIkJKh4n9v6JJo9
 /oDxGKebiSu6yj7vSiLPxWqCZ17ETJDEvSitdP48WA==
X-Google-Smtp-Source: ABdhPJzJuju7W8fVQKSWN7LZOO+GImj6gI5G1vJrPU/fI3FVbgnKwQQU/7onk+tN13HsakK+UGRKvBeTK8zMxSd6LyU=
X-Received: by 2002:a05:6808:ec9:: with SMTP id
 q9mr25537738oiv.160.1635223734188; 
 Mon, 25 Oct 2021 21:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <YUyWYpDl2Dmegz0a@archlinux-ax161>
 <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
 <YWhg8/UzjJsB51Gd@archlinux-ax161>
 <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
 <990a894c-1806-5ab2-775e-a6f2355c2299@ghiti.fr>
 <CA+zEjCt28iYQARQa=8Nsw8+_j0PuEee==gUqjKjasMo+w2Ohwg@mail.gmail.com>
In-Reply-To: <CA+zEjCt28iYQARQa=8Nsw8+_j0PuEee==gUqjKjasMo+w2Ohwg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 26 Oct 2021 06:48:42 +0200
Message-ID: <CACT4Y+YB8bjqxFfSrXKbfETXJAUxH=HR+kizC0T-AZLArY3A5A@mail.gmail.com>
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Alexandre ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, elver@google.com,
 akpm@linux-foundation.org, 
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
 ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>,
 kasan-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_214858_979351_44DE6F11 
X-CRM114-Status: GOOD (  50.74  )
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

T24gVHVlLCAyNiBPY3QgMjAyMSBhdCAwNjozOSwgQWxleGFuZHJlIEdoaXRpCjxhbGV4YW5kcmUu
Z2hpdGlAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIEZyaSwgT2N0IDE1LCAy
MDIxIGF0IDM6MDggUE0gQWxleGFuZHJlIGdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPiA+
Cj4gPiBPbiAxMC8xNC8yMSA4OjMxIFBNLCBBbGV4IEdoaXRpIHdyb3RlOgo+ID4gPiBIaSBOYXRo
YW4sCj4gPiA+Cj4gPiA+IExlIDE0LzEwLzIwMjEgw6AgMTg6NTUsIE5hdGhhbiBDaGFuY2VsbG9y
IGEgw6ljcml0IDoKPiA+ID4+IE9uIEZyaSwgT2N0IDA4LCAyMDIxIGF0IDExOjQ2OjU1QU0gLTA3
MDAsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4gPj4+IE9uIFRodSwgMjMgU2VwIDIwMjEgMDc6
NTk6NDYgUERUICgtMDcwMCksIG5hdGhhbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gPj4+PiBPbiBU
aHUsIFNlcCAyMywgMjAyMSBhdCAxMjowNzoxN1BNICswMjAwLCBNYXJjbyBFbHZlciB3cm90ZToK
PiA+ID4+Pj4+IE9uIFdlZCwgMjIgU2VwdCAyMDIxIGF0IDIyOjU1LCBOYXRoYW4gQ2hhbmNlbGxv
cgo+ID4gPj4+Pj4gPG5hdGhhbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+Pj4+PiBDdXJyZW50
bHksIHRoZSBhc2FuLXN0YWNrIHBhcmFtZXRlciBpcyBvbmx5IHBhc3NlZCBhbG9uZyBpZgo+ID4g
Pj4+Pj4+IENGTEFHU19LQVNBTl9TSEFET1cgaXMgbm90IGVtcHR5LCB3aGljaCByZXF1aXJlcwo+
ID4gPj4+Pj4+IEtBU0FOX1NIQURPV19PRkZTRVQgdG8KPiA+ID4+Pj4+PiBiZSBkZWZpbmVkIGlu
IEtjb25maWcgc28gdGhhdCB0aGUgdmFsdWUgY2FuIGJlIGNoZWNrZWQuIEluIFJJU0MtVidzCj4g
PiA+Pj4+Pj4gY2FzZSwgS0FTQU5fU0hBRE9XX09GRlNFVCBpcyBub3QgZGVmaW5lZCBpbiBLY29u
ZmlnLCB3aGljaCBtZWFucwo+ID4gPj4+Pj4+IHRoYXQKPiA+ID4+Pj4+PiBhc2FuLXN0YWNrIGRv
ZXMgbm90IGdldCBkaXNhYmxlZCB3aXRoIGNsYW5nIGV2ZW4gd2hlbgo+ID4gPj4+Pj4+IENPTkZJ
R19LQVNBTl9TVEFDSwo+ID4gPj4+Pj4+IGlzIGRpc2FibGVkLCByZXN1bHRpbmcgaW4gbGFyZ2Ug
c3RhY2sgd2FybmluZ3Mgd2l0aCBhbGxtb2Rjb25maWc6Cj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+PiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1sZ3BoaWxpcHMt
bGIwMzVxMDIuYzoxMTc6MTI6Cj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+PiBlcnJvcjogc3RhY2sgZnJh
bWUgc2l6ZSAoMTQ0MDApIGV4Y2VlZHMgbGltaXQgKDIwNDgpIGluIGZ1bmN0aW9uCj4gPiA+Pj4+
Pj4gJ2xiMDM1cTAyX2Nvbm5lY3QnIFstV2Vycm9yLC1XZnJhbWUtbGFyZ2VyLXRoYW5dCj4gPiA+
Pj4+Pj4gc3RhdGljIGludCBsYjAzNXEwMl9jb25uZWN0KHN0cnVjdCBvbWFwX2Rzc19kZXZpY2Ug
KmRzc2RldikKPiA+ID4+Pj4+PiAgICAgICAgICAgICBeCj4gPiA+Pj4+Pj4gMSBlcnJvciBnZW5l
cmF0ZWQuCj4gPiA+Pj4+Pj4KPiA+ID4+Pj4+PiBFbnN1cmUgdGhhdCB0aGUgdmFsdWUgb2YgQ09O
RklHX0tBU0FOX1NUQUNLIGlzIGFsd2F5cyBwYXNzZWQKPiA+ID4+Pj4+PiBhbG9uZyB0bwo+ID4g
Pj4+Pj4+IHRoZSBjb21waWxlciBzbyB0aGF0IHRoZXNlIHdhcm5pbmdzIGRvIG5vdCBoYXBwZW4g
d2hlbgo+ID4gPj4+Pj4+IENPTkZJR19LQVNBTl9TVEFDSyBpcyBkaXNhYmxlZC4KPiA+ID4+Pj4+
Pgo+ID4gPj4+Pj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGlu
dXgvaXNzdWVzLzE0NTMKPiA+ID4+Pj4+PiBSZWZlcmVuY2VzOiA2YmFlYzg4MGQ3YTUgKCJrYXNh
bjogdHVybiBvZmYgYXNhbi1zdGFjayBmb3IgY2xhbmctOAo+ID4gPj4+Pj4+IGFuZCBlYXJsaWVy
IikKPiA+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtl
cm5lbC5vcmc+Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gUmV2aWV3ZWQtYnk6IE1hcmNvIEVsdmVyIDxl
bHZlckBnb29nbGUuY29tPgo+ID4gPj4+Pgo+ID4gPj4+PiBUaGFua3MhCj4gPiA+Pj4+Cj4gPiA+
Pj4+PiBbIFdoaWNoIHRyZWUgYXJlIHlvdSBwbGFubmluZyB0byB0YWtlIGl0IHRocm91Z2g/IF0K
PiA+ID4+Pj4KPiA+ID4+Pj4gR2FoLCBJIHdhcyBpbnRlbmRpbmcgZm9yIGl0IHRvIGdvIHRocm91
Z2ggLW1tLCB0aGVuIEkgY2MnZCBuZWl0aGVyCj4gPiA+Pj4+IEFuZHJldyBub3IgbGludXgtbW0u
Li4gOi8gQW5kcmV3LCBkbyB5b3Ugd2FudCBtZSB0byByZXNlbmQgb3IgY2FuIHlvdQo+ID4gPj4+
PiBncmFiIGl0IGZyb20gTEtNTD8KPiA+ID4+Pgo+ID4gPj4+IEFja2VkLWJ5OiBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+ID4gPj4+Cj4gPiA+Pj4gKGFzc3VtaW5n
IHlvdSBzdGlsbCB3YW50IGl0IHRocm91Z2ggc29tZXdoZXJlIGVsc2UpCj4gPiA+Pgo+ID4gPj4g
VGhhbmtzLCBpdCBpcyBub3cgaW4gbWFpbmxpbmUgYXMgY29tbWl0IDE5NTMyODY5ZmViOSAoImth
c2FuOiBhbHdheXMKPiA+ID4+IHJlc3BlY3QgQ09ORklHX0tBU0FOX1NUQUNLIikuCj4gPiA+Pgo+
ID4gPj4+Pj4gTm90ZSwgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oIG1lbnRpb25zIEtB
U0FOX1NIQURPV19PRkZTRVQgaW4KPiA+ID4+Pj4+IGNvbW1lbnQgKGNvcGllZCBmcm9tIGFybTY0
KS4gRGlkIFJJU0MtViBqdXN0IGZvcmdldCB0byBjb3B5IG92ZXIgdGhlCj4gPiA+Pj4+PiBLY29u
ZmlnIG9wdGlvbj8KPiA+ID4+Pj4KPiA+ID4+Pj4gSSBkbyBzZWUgaXQgZGVmaW5lZCBpbiB0aGF0
IGZpbGUgYXMgd2VsbCBidXQgeW91IGFyZSByaWdodCB0aGF0Cj4gPiA+Pj4+IHRoZXkgZGlkCj4g
PiA+Pj4+IG5vdCBjb3B5IHRoZSBLY29uZmlnIGxvZ2ljLCBldmVuIHRob3VnaCBpdCB3YXMgcHJl
c2VudCBpbiB0aGUgdHJlZQo+ID4gPj4+PiB3aGVuCj4gPiA+Pj4+IFJJU0MtViBLQVNBTiB3YXMg
aW1wbGVtZW50ZWQuIFBlcmhhcHMgdGhleSBzaG91bGQgc28gdGhhdCB0aGV5IGdldAo+ID4gPj4+
PiBhY2Nlc3MgdG8gdGhlIG90aGVyIGZsYWdzIGluIHRoZSAiZWxzZSIgYnJhbmNoPwo+ID4gPj4+
Cj4gPiA+Pj4gWWEsIGxvb2tzIGxpa2Ugd2UganVzdCBzY3Jld2VkIHRoaXMgdXAuICBJJ20gc2Vl
aW5nIHNvbWUgd2FybmluZ3MgbGlrZQo+ID4gPj4+Cj4gPiA+Pj4gICAgIGNjMTogd2FybmluZzog
4oCYLWZzYW5pdGl6ZT1rZXJuZWwtYWRkcmVzc+KAmSB3aXRoIHN0YWNrIHByb3RlY3Rpb24KPiA+
ID4+PiBpcyBub3Qgc3VwcG9ydGVkIHdpdGhvdXQg4oCYLWZhc2FuLXNoYWRvdy1vZmZzZXQ94oCZ
IGZvciB0aGlzIHRhcmdldAo+ID4gPj4KPiA+ID4+IEhtbW0sIEkgdGhvdWdodCBJIGRpZCBhIEdD
QyBidWlsZCB3aXRoIHRoaXMgY2hhbmdlIGJ1dCBJIG11c3Qgbm90IGhhdmUKPiA+ID4+IDovCj4g
PiA+Pgo+ID4gPj4+IHdoaWNoIGlzIGhvdyBJIGVuZGVkIHVwIGhlcmUsIEknbSBhc3N1bWluZyB0
aGF0J3Mgd2hhdCB5b3UncmUKPiA+ID4+PiB0YWxraW5nIGFib3V0Cj4gPiA+Pj4gaGVyZT8gIExN
SyBpZiB5b3Ugd2VyZSBwbGFubmluZyBvbiBzZW5kaW5nIGFsb25nIGEgZml4IG9yIGlmIHlvdQo+
ID4gPj4+IHdhbnQgbWUgdG8KPiA+ID4+PiBnbyBmaWd1cmUgaXQgb3V0Lgo+ID4gPj4KPiA+ID4+
IEkgdG9vayBhIGxvb2sgYXQgbW92aW5nIHRoZSBsb2dpYyBpbnRvIEtjb25maWcgbGlrZSBhcm02
NCBiZWZvcmUgc2VuZGluZwo+ID4gPj4gdGhpcyBjaGFuZ2UgYW5kIEkgZGlkIG5vdCByZWFsbHkg
dW5kZXJzdGFuZCBpdCB3ZWxsIGVub3VnaCB0byBkbyBzby4gSQo+ID4gPj4gdGhpbmsgaXQgd291
bGQgYmUgYmVzdCBpZiB5b3Ugd2VyZSBhYmxlIHRvIGRvIHRoYXQgc28gdGhhdCBub3RoaW5nIGdl
dHMKPiA+ID4+IG1lc3NlZCB1cC4KPiA+ID4+Cj4gPiA+Cj4gPiA+IEknbGwgZG8gaXQgdG9tb3Jy
b3csIEknbSB0aGUgbGFzdCBvbmUgd2hvIHRvdWNoZWQga2FzYW4gb24gcmlzY3YgOikKPiA+ID4K
PiA+Cj4gPiBBZGRpbmcgS0FTQU5fU0hBRE9XX09GRlNFVCBjb25maWcgbWFrZXMga2FzYW4ga2Vy
bmVsIGZhaWxzIHRvIGJvb3QuCj4gPiBJdCByZWNlaXZlcyBhICp3cml0ZSogZmF1bHQgYXQgdGhl
IGJlZ2lubmluZyBvZiBhIG1lbWJsb2NrX2FsbG9jCj4gPiBmdW5jdGlvbiB3aGlsZSBwb3B1bGF0
aW5nIHRoZSBrZXJuZWwgc2hhZG93IG1lbW9yeTogdGhlIHRyYXAgYWRkcmVzcyBpcwo+ID4gaW4g
dGhlIGthc2FuIHNoYWRvdyB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgYW5kIHRoaXMgY29ycmVzcG9u
ZHMgdG8gYQo+ID4ga2VybmVsIGFkZHJlc3MgaW4gaW5pdF9zdGFjay4gVGhlIHF1ZXN0aW9uIGlz
OiBob3cgZG8gSSBwb3B1bGF0ZSB0aGUKPiA+IHN0YWNrIHNoYWRvdyBtYXBwaW5nIHdpdGhvdXQg
dXNpbmcgbWVtYmxvY2sgQVBJPyBJdCdzIHdlaXJkLCBJIGRvbid0Cj4gPiBmaW5kIGFueXRoaW5n
IG9uIG90aGVyIGFyY2hpdGVjdHVyZXMuCj4KPiBAa2FzYW46IEFueSBpZGVhIHdoYXQgd2UgYXJl
IGRvaW5nIHdyb25nIGluIHJpc2N2IHRvIGVuY291bnRlciB0aGUKPiBhYm92ZSBzaXR1YXRpb24/
CgpIaSBBbGV4LCBQYWxtZXIsCgpUaGUgcGF0Y2ggY2hhbmdlcyB0aGUgZGVmaW5pdGlvbiBvZiB0
aGUgS0FTQU5fU0hBRE9XX09GRlNFVCBjb25zdC4KRG9lcyBpdCdzIHZhbHVlIGNoYW5nZSBhcyBh
IHJlc3VsdCBvciBub3Q/IEhhdmUgeW91IHRyaWVkIHRvIHByaW50IGl0CmJlZm9yZS9hZnRlcj8K
SWYgdmFsdWUgZG9lcyBub3QgY2hhbmdlLCB0aGVuIHRoaXMgaXMgbW9yZSBteXN0ZXJpb3VzLiBJ
ZiBpdCBjaGFuZ2VzLAp0aGVuIHRoZXJlIGxvdHMgb2YgcG9zc2libGUgZXhwbGFuYXRpb25zIChw
b2ludHMgdG8gdW5tYXBwZWQgcmVnaW9uLApvdmVybGFwcyB3aXRoIHNvbWV0aGluZyksIGJ1dCB3
ZSBuZWVkIHRvIGtub3cgdmFsdWVzIGJlZm9yZS9hZnRlciB0bwphbnN3ZXIgdGhpcy4KCgo+IFRo
YW5rcywKPgo+IEFsZXgKPgo+ID4KPiA+IEFuZCBqdXN0IGEgc2hvcnQgbm90ZTogSSBoYXZlIHJl
YWxpemVkIHRoaXMgd2lsbCBicmVhayB3aXRoIHRoZSBzdjQ4Cj4gPiBwYXRjaHNldCBhcyB3ZSBk
ZWNpZGUgYXQgcnVudGltZSB0aGUgYWRkcmVzcyBzcGFjZSB3aWR0aCBhbmQgdGhlIGthc2FuCj4g
PiBzaGFkb3cgc3RhcnQgYWRkcmVzcyBpcyBkaWZmZXJlbnQgYmV0d2VlbiBzdjM5IGFuZCBzdjQ4
LiBJIHdpbGwgaGF2ZSB0bwo+ID4gZG8gbGlrZSB4ODYgYW5kIG1vdmUgdGhlIGthc2FuIHNoYWRv
dyBzdGFydCBhdCB0aGUgZW5kIG9mIHRoZSBhZGRyZXNzCj4gPiBzcGFjZSBzbyB0aGF0IGl0IGlz
IHRoZSBzYW1lIGZvciBib3RoIHN2MzkgYW5kIHN2NDguCj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+
IEFsZXgKPiA+Cj4gPgo+ID4gPiBUaGFua3MsCj4gPiA+Cj4gPiA+IEFsZXgKPiA+ID4KPiA+ID4+
IENoZWVycywKPiA+ID4+IE5hdGhhbgo+ID4gPj4KPiA+ID4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiA+ID4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+ID4+Cj4g
PiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
