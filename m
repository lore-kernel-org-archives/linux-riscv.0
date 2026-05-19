Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B909CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNnU93xME4o8iQ46xDl4EHGArPcxrXR4Dbhjm9wStuA=; b=Le50O9XXGEmGjY
	XKjS2WDS/yK4XN1p6PkSUpUqAnF5SFU1mlchctIBCzDlMKj7q8NsZeRTqheOHYk06WpmjSBtgjMkk
	Kh71MWYrSdJtT8TFzBujsuSbBF/EaImFwtUUsgKvStMxRO7FKtGHYwlYtvdy8QYRYs2lf9RtOV+7o
	bje1JnqjchYDzbzhS5l4V8spdEZrAKnpmfEh2xM2rixTSZhy81JOoXO25UAXLqjEIxx8gorKDObdu
	OVHPqWuSw89YvydrFMpYvwvZdDkdhcAWqNcAFVJ3m7FkoFy+PYyvQt3EQKR0T7oksCyIZW3aOrB/f
	dBNI3M6mvHyitZLd26YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRa6-00000002nOC-0jA0;
	Tue, 19 May 2026 21:02:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRa3-00000002nNP-2knp
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 21:02:24 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-bd3d7c29b4dso610830566b.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 14:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779224542; cv=none;
        d=google.com; s=arc-20240605;
        b=lKBDzlUNIYvUnUFX+i91m7oLBq/ZYNutgGgc5heipyJ3qkOsaeU8XVHXU95qbbalSp
         6Fsi/P6xJ2xYqprphhjIVigL1IG7dkcvfdrCkEvys37zWSiQ3mg0sMPkehRNieJtzlPN
         N0kKRWnFlGlfChJIIBEwnQnAMFLeCAbCDTTNqcknvdrdsKEX9PFe2uARLPTROTEIXo5b
         Xf8idMXeVPYnb29w4DA36IFQXrGVwQKB8Um8grRdGsOlbh/YKiZHtFCnj5XWhrcgacEI
         TDV3HaFYCP+NwNhn9Dq/zuNDbn36OOFSHfBd0r3YvlKWyTWbxj3oTHkO7thYv+LvQUt+
         ghnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        fh=TahwFHxHkPBJuBbqbvL1qkacvb0NKjx/g35fkNJv5TE=;
        b=XLMefZxjQexjnToZ25rS/dWsq8W0uqeoUxpGSAv5xUGbCO4XCntgfQRbjfel/ulJ9e
         7rRgw15ZBxIQNekv7nRNvUBbnS9RWXSI8cbZaEkCL9Atr28mq9ANfX/N8W2uO+UU2Nqf
         uCbat1D4sZGBt0wg7wij2w/k9x4encPKFcdv/MEwVIg+Uv3cKhY+2W3U4EAWESk2+QjB
         8NyTjfsEY9CY+y8EjX/Plu70D0WDWEoZPjVzvc81+ISE7VNJGAwIHZsE5j2P1jyiygLe
         iynOSCjngBlTfUp/zZX6qo8CVI1fdmGwpYpw6LZbmqUkaTQwalcJidkH3GTLmh5StHC4
         I/Og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779224542; x=1779829342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        b=l1mEbMj+4SyX8YW5uec1guFTXOaSMjX755UbpZ2u4TtDMenGLGuODsCHN8jB4GHUz3
         AbogcLMDMfX1ZbN2FVQfNZRYLHaJWSvTxM+sjxrct/Qy3hJtybFklal2MggUmzvNxe9R
         phjcsRHr0W6GR8uZb93XNMkKm+BTma0KgeUeKi9NJphtMQ2B5iu9ou8XFk3+4gjtEPNA
         YhYr2uCJL3tPoFu/fGqjvcIzKNjVmtdulkHfyybn2RnsRqUXaZ7UzBommKusI2d+DfQz
         oZDBJWMrtPEVi5++81aMwh+iE0wrbWz2a5yrGK6/MKXpbUlgBQNNH8ebgjZ+pKO8Zx39
         SiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779224542; x=1779829342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        b=tDP67SJLNcn7VPAC4Yy49lL8mIlG2e3s2JsbJg3mqu9cQgpXyPLN8jy2u6EJ9AcJPF
         KSHRjqWBFOigetSuEyRmXGk3q140S2oiPRPY2F7p+mH9OP+abQmQPAtvS/DcS76LnPyu
         Lp5wZdqJfka27/GL5M5b0zUK3ByTKA33zpZKa2s7r7XzbQkCqhZeWGNOfU4z8W//BIB2
         8Stsop/dHQ5YUkqWDN6GZMImVM6nxFJdp3zMqAz29kXgpGadpm44sR8LVmbVe9UiRLgf
         NtmjPlLPG+qKbdhqF+kc8ajdoLTZWppnPwszqaUCMmQULEDPgxYAJyYHAB+LCXLiOKJN
         SAHw==
X-Forwarded-Encrypted: i=1; AFNElJ/ajM9Zt9H8rmrkDDfLL3ZeXdPVPKMNjKUSZhEkz11/JM4dhlfgUgHUekz3Uan+35iNB+ZUCP8D5VVjEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFBfM4x9kPP/fOXPbQGYQUg6cWQIYNVP+g3wc0EEEa3gnO+vB5
	/WJADIE19PsCHFi0O+s5i0D6pC77ZcfNttdhi62tSTEp86wgUm8I20ckPLCLbDifIU1gJQL2+St
	SXukAup13PVEcrGssIhukAqzaa+HGChU=
X-Gm-Gg: Acq92OGUdlyp16ep/V0ZlYG+i9nccSGFZxQCX8z49t7ij4KCjZcTYsbnWwRTYGhGYVz
	viC4x14ZO1hN3ZkSl93NwTpS0npe9JqxcWkMMtv2/1WxuoATfmvR7af+aap0fK0iC5GyUrwNytE
	MvT89nt5zQDxT0/Rqd/ulb7iFh+wxsK/I5o+6Cuw7A5X+Rrbxts/Fl9NFjCZZopff9Mpdf9F0mn
	87XAxosicq/sdrHIsZ2iIxqwkiOak8XQzg50erCQEfuN5XKmEFCYwrCC9vJxGhNvcjtHWKW0CZx
	VJVOBGeqmHGFUkN1Eg==
X-Received: by 2002:a17:907:1b1c:b0:bd2:387:6bd with SMTP id
 a640c23a62f3a-bd5177afa91mr920483166b.4.1779224541529; Tue, 19 May 2026
 14:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <agxfLNuLCAT3F4cW@lucifer> <agxnJ8R-G3CRjeTR@lucifer> <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
In-Reply-To: <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 14:02:09 -0700
X-Gm-Features: AVHnY4IdUrtf0zjmci6G1wPksPxXO0JC_jVTm-UIYV_TFA36gqIEv83n9ohB0es
Message-ID: <CAHbLzkrTF7w+T5mGsQuDRuhnTk6evTKBNRcH4oS=nRcUg2zpsg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, surenb@google.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_140223_736888_A1704154 
X-CRM114-Status: GOOD (  54.19  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMTE6NDHigK9BTSBZYW5nIFNoaSA8c2h5ODI4MzAxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAxOSwgMjAyNiBhdCA2OjM54oCvQU0gTG9y
ZW56byBTdG9ha2VzIDxsanNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXkg
MTksIDIwMjYgYXQgMDI6MTI6MTBQTSArMDEwMCwgTG9yZW56byBTdG9ha2VzIHdyb3RlOgo+ID4g
PiBPbiBNb24sIE1heSAxOCwgMjAyNiBhdCAwMjoyMToxNFBNIC0wNzAwLCBZYW5nIFNoaSB3cm90
ZToKPiA+ID4gPiBNYXliZSBhIGxpdHRsZSBiaXQgb2ZmIHRvcGljLiBUaGlzIGlzIGFuIGludGVy
ZXN0aW5nIGlkZWEuIEl0IHNlZW1zCj4gPiA+ID4gcG9zc2libGUgd2UgZG9uJ3QgaGF2ZSB0byB0
YWtlIHZtYSB3cml0ZSBsb2NrIHVuY29uZGl0aW9uYWxseS4gSUlVQwo+ID4gPiA+IHRoZSB3cml0
ZSBsb2NrIGlzIG1haW5seSB1c2VkIHRvIHNlcmlhbGl6ZSBhZ2FpbnN0IHBhZ2UgZmF1bHQgYW5k
Cj4gPiA+ID4gbWFkdmlzZSwgcmlnaHQ/IEkgZ290IGEgY3JhenkgaWRlYSBvZmYgdGhlIHRvcCBv
ZiBteSBoZWFkLiBXZSBtYXkgYmUKPiA+ID4KPiA+ID4gRXJyIG5vLCBpdCBzZXJpYWxpc2VzIGFn
YWluc3QgbGl0ZXJhbGx5IGFueSBtb2RpZmljYXRpb24gb3IgcmVhZCBvZiBhbnkKPiA+ID4gY2hh
cmFjdGVyaXN0aWMgb2YgVk1Bcy4KPgo+IElmIEkgcmVtZW1iZXIgY29ycmVjdGx5LCB5b3UgYXJl
IG5vdCBzdXBwb3NlZCB0byBjaGFuZ2UgVk1BCj4gZmxhZ3Mvc2l6ZS9tbSBwb2ludGVyL3ZtX2Zp
bGUvcGdvZmYvcHJvdCwgZXRjLCB1bmRlciByZWFkIHZtYSBsb2NrIG9yCj4gcmVhZCBtbWFwX2xv
Y2suCj4KPiA+ID4KPiA+ID4gPiBhYmxlIHRvIGp1c3QgdGFrZSB2bWEgd3JpdGUgbG9jayBpZmYg
dm1hLT5hbm9uX3ZtYSBpcyBub3QgTlVMTC4KPiA+ID4KPiA+ID4gRXhjZXB0IGlmIHdlIGRvbid0
IHRha2UgaXQgYW5kIHZtYS0+YW5vbl92bWEgaXMgTlVMTCwgdGhlbiBzb21lYm9keSBjYW4KPiA+
ID4gYW5vbl92bWFfcHJlcGFyZSgpIGFuZCBjaGFuZ2Ugdm1hLT5hbm9uX3ZtYSBtaWR3YXkgdGhy
b3VnaCBhIGZvcmsgYW5kIGNvbXBsZXRlbHkKPiA+ID4gc2NyZXcgdXAgdGhlIGFub25fdm1hIGZv
cmsgaGllcmFyY2h5Lgo+ID4KPiA+IGNvcnJlY3Rpb246IHRoaXMgd29uJ3QgaGFwcGVuIGFzIHBl
ciBCYXJyeSAoc2VlIC0gSSBtYW5hZ2VkIHRvIGNvbmZ1c2UgbXlzZWxmCj4gPiBoZXJlIDopLCBz
aW5jZSBmb3Igdm1hLT5hbm9uX3ZtYSBpbnN0YWxsIHdlIHRha2UgdGhlIG1tYXAgcmVhZCBsb2Nr
Lgo+ID4KPiA+IEJVVCB3ZSBhbHNvIGhhdmUgdG8gY29uc2lkZXIgb3RoZXIgY2FzZXMuCj4gPgo+
ID4gPgo+ID4gPiBTbyBuby4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEZpcnN0IG9mIGFsbCwgd3Jp
dGUgbW1hcF9sb2NrIGlzIGhlbGQsIHNvIHRoZSB2bWEgY2FuJ3QgZ28gb3IgYmUKPiA+ID4gPiBj
aGFuZ2VkIHVuZGVyIHVzLgo+ID4gPgo+ID4gPiB2bWEtPmFub25fdm1hIGNhbiBiZSBjaGFuZ2Vk
Lgo+ID4KPiA+IENvcnJlY3Rpb246IG5vIGl0IGNhbid0IDopCj4KPiBZZXMsIHZtYS0+YW5vbl92
bWEgY2hhbmdlIHNob3VsZCByZXF1aXJlIHRha2luZyByZWFkIG1tYXBfbG9jay4KPgo+ID4KPiA+
ID4KPiA+ID4gPgo+ID4gPiA+IFNlY29uZGx5LCBpZiB2bWEtPmFub25fdm1hIGlzIE5VTEwsIGl0
IGJhc2ljYWxseSBtZWFucyBlaXRoZXIgbm8gcGFnZQo+ID4gPiA+IGZhdWx0IGhhcHBlbmVkIG9y
IG5vIGNvdyBoYXBwZW5lZCwgc28gdGhlcmUgaXMgbm8gcGFnZSB0YWJsZSB0byBjb3B5LAo+ID4g
PiA+IHRoaXMgaXMgYWxzbyB3aGF0IGNvcHlfcGFnZV9yYW5nZSgpIGRvZXMgY3VycmVudGx5LiBT
byB3ZSBjYW4gc2hyaW5rCj4gPiA+ID4gdGhlIGNyaXRpY2FsIHNlY3Rpb24gdG86Cj4gPiA+Cj4g
PiA+IEZpcnN0bHksIHdpdGggbm8gVk1BIHdyaXRlIGxvY2ssICF2bWEtPmFub25fdm1hIG1lYW5z
IGEgZmF1bHQgY2FuIHJhY2UgYW5kCj4gPiA+IHNlY29uZGx5IGNvcHlfcGFnZV9yYW5nZSgpIGNo
ZWNrcyB2bWFfbmVlZHNfY29weSgpLCB0aGVyZSBhcmUgb3RoZXIgY2FzZXMgLSBQRk4KPiA+ID4g
bWFwcywgbWl4ZWQgbWFwcywgVUZGRCBXL1AgKHVnaCksIGd1YXJkIHJlZ2lvbnMuCj4gPiA+Cj4g
PiA+IFNvIHllYWggdGhpcyBpc24ndCBzdWZmaWNpZW50Lgo+ID4KPiA+IEhvd2V2ZXIgdGhpcyBp
cyB0cnVlLi4uCj4KPiBZZXMsIGZhdWx0IGNhbiByYWNlIHdpdGggZm9yay4gQmFzaWNhbGx5IHRo
aXMgaXMgYWN0dWFsbHkgdGhlIHB1cnBvc2UKPiBvZiB0aGlzIGlkZWEuIFdlIGNhbiBoYXZlIGlt
cHJvdmVkIHBhZ2UgZmF1bHQgc2NhbGFiaWxpdHkuIEluIG15Cj4gcHJvcG9zYWwgKHRha2Ugd3Jp
dGUgdm1hIGxvY2sgaWYgdm1hLT5hbm9uX3ZtYSBpcyBub3QgTlVMTCksIHRoZSByYWNlCj4ganVz
dCBoYXBwZW5zIG9uIHRoZSBWTUFzIHdoaWNoIHBhZ2UgZmF1bHQgaGFzIG5vdCBoYXBwZW5lZCBv
biBiZWZvcmUuCgpTb3JyeSwgdGhpcyBpcyBpbmNvcnJlY3QuIFBhZ2UgZmF1bHQgY2FuJ3QgaGFw
cGVuIG9uIHRob3NlIFZNQXMKYmVjYXVzZSBwYWdlIGZhdWx0IG5lZWRzIHRvIGNyZWF0ZSBhbm9u
X3ZtYSwgYnV0IGl0IHJlcXVpcmVzIHRha2luZwptbWFwX2xvY2suCklmIGFub25fdm1hIGlzIG5v
dCBOVUxMLCB2bWEgd3JpdGUgbG9jayB3aWxsIHNlcmlhbGl6ZSBhZ2FpbnN0IHBhZ2UKZmF1bHQu
IFNvIHRoZXJlIHNob3VsZCBiZSBubyByYWNlIHdpdGggcGFnZSBmYXVsdC4gUmVtb3Zpbmcgdm1h
IHdyaXRlCmxvY2sgc3VnZ2VzdGVkIGJ5IEJhcnJ5IG1heSBpbmNyZWFzZSByYWNlLgoKVGhhbmtz
LApZYW5nCgo+IHZtYV9uZWVkc19jb3B5KCkgYWxzbyBza2lwcyB0aGUgVk1BcyB3aGljaCBkb24n
dCBoYXZlIHZtYS0+YW5vbl92bWEuCj4gU28gdGhlcmUgaXMgYmFzaWNhbGx5IG5vIGRpZmZlcmVu
Y2UgaW4gc2VtYW50aWNzIG90aGVyIHRoYW4gbW9yZSBwYWdlCj4gZmF1bHQgcmFjZXMgSUlVQy4g
SXQgc2hvdWxkIGJlIHNhZmUgYXMgbG9uZyBhcyB3ZSBjYW4gZ3VhcmFudGVlIHRoZXJlCj4gaXMg
bm8gd3JpdGFibGUgUFRFIHBvaW50IHRvIGEgc2hhcmVkIHBhZ2UgYWZ0ZXIgZm9yay4KPgo+IEZv
ciBndWFyZCByZWdpb25zLCBpdCBjYW4gYmUgc2VyaWFsaXplZCBieSB2bWEgd3JpdGUgbG9jayBp
Zgo+IHZtYS0+YW5vbl92bWEgZXhpc3RzLiBJZiB2bWEtPmFub25fdm1hIGlzIE5VTEwsIGl0IHdp
bGwgcHJlcGFyZQo+IGFub25fdm1hLCB3aGljaCB3aWxsIHRha2UgcmVhZCBtbWFwX2xvY2sgaWYg
SSByZWFkIHRoZSBjb2RlIGNvcnJlY3RseS4KPgo+IEkgaGF2ZSBub3QgaW52ZXN0aWdhdGVkIFVG
RkQgeWV0Lgo+Cj4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gaWYgKHZtYS0+YW5vbl92bWEpIHsK
PiA+ID4gPiAgICAgdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKHNyY192bWEpOwo+ID4gPiA+ICAg
ICBhbm9uX3ZtYV9mb3JrKGRzdF92bWEsIHNyY192bWEpOwo+ID4gPiA+ICAgICBjb3B5X3BhZ2Vf
cmFuZ2UoZHN0X3ZtYSwgc3JjX3ZtYSk7Cj4gPiA+ID4gfQo+ID4gPgo+ID4gPiBZZWFoIHRoYXQn
cyB0b3RhbGx5IGJyb2tlbiBmbyByZWFzb25zIGFib3ZlIGFzIEkgc2FpZCA6KQo+ID4gPgo+ID4g
PiA+Cj4gPiA+ID4gQnV0IHBhZ2UgZmF1bHQgY2FuIGhhcHBlbiBiZWZvcmUgd3JpdGUgbW1hcF9s
b2NrIGlzIHRha2VuLCB3aGVuIHdlCj4gPiA+ID4gY2hlY2sgdm1hLT5hbm9uX3ZtYSwgaXQgaXMg
cG9zc2libGUgaXQgaGFzIG5vdCBiZWVuIHNldCB1cCB5ZXQuIEJ1dCBpdAo+ID4gPiA+IHNlZW1z
IHRvIGJlIGVxdWl2YWxlbnQgdG8gcGFnZSBmYXVsdCBhZnRlciBmb3JrIGFuZCB3b24ndCBicmVh
ayB0aGUKPiA+ID4gPiBzZW1hbnRpYy4KPiA+ID4KPiA+ID4gSXQgd2lsbCB0b3RhbGx5IGJyZWFr
IGhvdyB0aGUgYW5vbl92bWEgaGllcmFyY2h5IHdvcmtzIDopIFNlZSB0aGUgbGlua3MgYXQgdGhl
Cj4gPiA+IHRvcCBvZiBodHRwczovL2xqcy5pby90YWxrcyBmb3IgYSBsaW5rIHRvIHZhcmlvdXMg
c2xpZGVzIG9uIGFub25fdm1hIGJlaGF2aW91cgo+ID4gPiAoaXQncyByZWFsbHkgYSBwYWluIHRv
IHRoaW5rIGFib3V0IGJlY2F1c2UgaXQncyBhIHN1cGVyIGJyb2tlbiBhYnN0cmFjdGlvbikuCj4g
PiA+Cj4gPiA+IFlvdSBjb3VsZCBlbmQgdXAgd2l0aCBhIENvVyBtYXBwaW5nIHRoYXQncyB1bnJl
YWNoYWJsZSBmcm9tIHJtYXAgYW5kIHlvdSBjb3VsZAo+ID4gPiBnZXQgc29tZSBuYXN0eSBpc3N1
ZXMgd2l0aCBwYWdlIHRhYmxlIGVudHJpZXMgcG9pbnRpbmcgYXQgZnJlZWQgZm9saW9zIDopCj4g
Pgo+ID4gQ29ycmVjdGlvbjogYWN0dWFsbHkgd2Ugc2hvdWxkIGJlIHNhZmUgZ2l2ZW4gbW1hcCBy
ZWFkIGxvY2sgb24gYW5vbl92bWEgaW5zdGFsbC4KPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBB
bnl3YXksIGp1c3QgYSBjcmF6eSBpZGVhLCBJIG1heSBtaXNzIHNvbWUgY29ybmVyIGNhc2VzLgo+
ID4gPgo+ID4gPiBZZWFoIHNvcnJ5IHRvIHB1c2ggYmFjayBoZXJlIGJ1dCB0aGlzIGlzIGp1c3Qg
bm90IGEgdmlhYmxlIGFwcHJvYWNoLgo+Cj4gTm8gd29ycmllcy4gVGhhbmtzIGZvciBhbGwgdGhl
IGZlZWRiYWNrLiBKdXN0IHRyaWVkIHRvIGV4cGxvcmUgd2hldGhlcgo+IHN1Y2ggYW4gaWRlYSBp
cyBmZWFzaWJsZSBvciBub3QuCj4KPiA+ID4KPiA+ID4gQW5kIHRoaXMgaXMgZm9yZ2V0dGluZyB0
aGF0IHdlIGhhdmUgcmVsaWVkIG9uIHBhZ2UgZmF1bHRzIGJlaW5nIGJsb2NrZWQgYnkgZm9yawo+
ID4gPiBfZm9yZXZlcl8sIHdobyBrbm93cyB3aGF0IGVsc2UgaGFzIGJha2VkIGluIGFzc3VtcHRp
b25zIGFib3V0IHRoYXQKPiA+ID4gc2VyaWFsaXNhdGlvbi4KPiA+ID4KPiA+ID4gRm9ya2luZyBp
cyBvbmUgb2YgdGhlIG5hc3RpZXN0IHBhcnRzIG9mIG1tIGFuZCBoYXMgaGFkIG11bHRpcGxlLCBz
dWJ0bGUsIGNvcm5lcgo+ID4gPiBjYXNlIGJyZWFrYWdlcyB0aGF0IGhhdmUgYmVlbiBhIG5pZ2h0
bWFyZSB0byBkZWFsIHdpdGguCj4KPiBZZXMsIHRoaXMgbWlnaHQgYmUgdGhlIGJpZ2dlc3QgY29u
Y2Vybi4gVGhlIHBhZ2UgZmF1bHQgY2FuIHJhY2Ugd2l0aAo+IGZvcmsuIElmIHNvbWUgYXBwbGlj
YXRpb25zIHJlbHkgb24gc3VjaCBzdWJ0bGUgYmVoYXZpb3IsIGl0IG1heSBicmVhaywKPiBidXQg
c3VjaCBhcHBsaWNhdGlvbnMgYXJlIGZyYWdpbGUgdG9vLgo+Cj4gPiA+Cj4gPiA+IFNvIEknbSB2
ZXJ5IG11Y2ggYWdhaW5zdCBjaGFuZ2luZyB0aGlzIGJlaGF2aW91ciB0byB0cnkgdG8gZml4IHNv
bWV0aGluZyBpbiB0aGUKPiA+ID4gZmF1bHQgcGF0aC4KPiA+ID4KPiA+ID4gV2Ugc2hvdWxkIGFk
ZHJlc3MgdGhlIGZhdWx0IHBhdGggaXNzdWVzIGluIHRoZSBmYXVsdCBwYXRoIDopCj4KPiBZZWFo
LCB0aGlzIGlkZWEgd2FzIGluc3BpcmVkIGJ5IEJhcnJ5J3MgIm5vdCB0YWtlIHZtYSByZWFkIGxv
Y2sKPiB1bmNvbmRpdGlvbmFsbHkiIGlkZWEuIE1heWJlIGlycmVsZXZhbnQgdG8gQmFycnkncyBw
cmlvcml0eSBpbnZlcnNpb24KPiBwcm9ibGVtLCBqdXN0IGFuIGlkZWEgZm9yIGZ1cnRoZXIgb3B0
aW1pemF0aW9uIG9uIHBhZ2UgZmF1bHQKPiBzY2FsYWJpbGl0eS4gVGhpcyBwcm9iYWJseSBzaG91
bGQgYmUgYSBzZXBhcmF0ZSB0b3BpYy4KPgo+IFRoYW5rcywKPiBZYW5nCj4KPiA+Cj4gPiBBYm92
ZSBzdGlsbCBhbGwgdHJ1ZSB0aG91Z2guCj4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtz
LAo+ID4gPiA+IFlhbmcKPiA+ID4gPgo+ID4gPiA+IH0KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEJhc2VkIG9uIHRoZSBhYm92ZSwgd2UgbWF5IHdhbnQgdG8gcmUtY2hlY2sgd2hldGhlciBm
b3JrKCkKPiA+ID4gPiA+IGNhbiBiZSBibG9ja2VkIGJ5IHBhZ2UgZmF1bHRzLiBBdCB0aGUgc2Ft
ZSB0aW1lLCBpZiBTdXJlbiwKPiA+ID4gPiA+IHlvdSwgb3IgYW55b25lIGVsc2UgaGFzIGFueSBj
b21tZW50cywgcGxlYXNlIGZlZWwgZnJlZSB0bwo+ID4gPiA+ID4gc2hhcmUgdGhlbS4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBCZXN0IFJlZ2FyZHMKPiA+ID4gPiA+IEJhcnJ5Cj4gPiA+ID4gPgo+ID4g
Pgo+ID4gPiBDaGVlcnMsIExvcmVuem8KPiA+Cj4gPiBTbyBzdGlsbCBhIG5vcGUgOikKPiA+Cj4g
PiBDaGVlcnMsIExvcmVuem8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
