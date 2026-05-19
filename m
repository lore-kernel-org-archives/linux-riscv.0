Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9E9CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 18:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Navpl5Tl9DXwIAag1N5Ll0HHQzUwzgu1/+FPlY1uQWw=; b=fmRwEQglJlU3Gh
	TTBBg82l9gHSonKkljNPJId7YI5cruH0qZfoc2RCWAfqCiC9rwnIuBGzH4VfOnCnzSRECofNCmAKK
	v5ZC8VwdsoRlsb1E1zB4NaGgYmRRXBtKkyEEZOuAqTOWbGsMm0oeEknAGPZEQzXNJEpfNLF1H4SiX
	XVUZ5cX9YDgXXWN4Vk43hr2ZeGu9CvJiZdzNUfV2RtMox2EHuWo+9Rv/+eL6sAbJ8xOmSsNMUoKqB
	t+oCh92oSuzE5W2c5ru/5+fYmf/HRXRU04CXfIXhkvb4JMYSPAnhS+4HmRwGfVcv9GL06PuFo/aYf
	d6jUgr+u9TfqICi4USvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPX4-00000002Y0y-1NfI;
	Tue, 19 May 2026 18:51:10 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPWz-00000002XzO-2uzv
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 18:51:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso810193666b.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 11:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779216664; cv=none;
        d=google.com; s=arc-20240605;
        b=EPaflgix/VKCHfLlCBgTT/u976UClIFH1m5ma8U/2K1K1dVC1S+jdcRGe9zKfWD29u
         CTXebrijZw80WxXgIFMcNUJXI26PPI9njbdz1D9PWyi732YKsnaGu1tZYwf4unth4qk4
         eceOKH3YfmijdgEnkAAR+jJy82ZkrcmE0jGU/8lFjM0LtrohBs0hFgchwdPZMjFzLV48
         fjbFSdanfAl/0hvQMda6bGqjjhewFK4iGnLq2R7dTcuHUE1Iv5z4byBIunidyN6EUdqw
         7ApNp8rlZo+vYSqTa6fgzPlVFmz0wQd5Co7thka3/3KqN0Vxg2Hvhb5BBff5BArekc/C
         yDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auNMmPsKKmQDwMQx6p+X+IoKw+T0n0UlnhHmOoR8kKE=;
        fh=NztYhxoMOEBINAmEqV3xOEqcxjMEeiE3B7i0DabVZHQ=;
        b=VP2+5EG3Ucy6DcTT/ry1GfDQypboGBSWcyeTMFFi7nvMe+VYPtO9IJ0JfQKex7uxKV
         15kzQCRcAzc0K1KCWU/TN2kL4X/V7KsrRXxtpPkOob3LimNeoWzZzs5rM5CZuO5NV4ym
         Q/1pHz2bhzu2vVbnBNTbrom/SfAYfXkp6BE3IMvru9BRaVErjiH/ZqNSHzC8mV+6BveN
         nmhGAcxgs0kKXPA44vEoqBhh/ZLXPw6tfLQt0SM2zPFOB9ELtJpFCaE7GNgJUQpLSC9G
         RJvvBm6Yzn97QCPQ0LOnO8qqGXNJdew9PI5c2yENhNII14z4Xejl67RuL0pCfAg4f2p1
         qFBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779216664; x=1779821464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auNMmPsKKmQDwMQx6p+X+IoKw+T0n0UlnhHmOoR8kKE=;
        b=BM1POPyekBuzYCjy8pOMcL3CHknkLvojBisKgMPTypLjyf8jN1mB6yjDDqJ9Lik9+9
         k4OANUD90KVGC6GBGIpdorObbUBSGOAcXQyNcSL7Py41MVpBm1rMzTUweuwZn+TTrflT
         AF02mnW/lpVRqlZ3NWYxKTDbVcqrJPxCssdpiazpX4uMK2vZzsjIpaPeXSmqE27azMJf
         iNV7fKrHnrt0fCrAxAiukt1yFL9TlekOxUFJ+/Y60InTreesougC/igx6KasR72XYyzp
         a9Y2imxlCzOMW/9/GSfZRGd026v2ilxra8MZg+h64nfarz6JAZ03cotnQCeWZqM4/b+f
         R9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216664; x=1779821464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auNMmPsKKmQDwMQx6p+X+IoKw+T0n0UlnhHmOoR8kKE=;
        b=O5p8wMf9j6yV32FVMcX898q0x055EjPRR+1xm7893DiaL3qL1LfWHfWwNNQ7dd6WbJ
         43r24IkWgORD8RasHlnGRbiVJbudIVSdjFf5zDLrQBfj6ZabPJzAY5r5+ht9aRlF4QR0
         tXHa0o3PiW7mpIiwjN8h7K/izED73jkZICE3J4aVkI5oebT8nkYd4jb/g1y3/s8RBv9b
         66GJOs3aqrBOqIjgnNGSs8h8kG0+y5+UoUczLFPAKD4E8BwWQ9I0LoIrQLN1HEe3Z96f
         xfGBHTcsQHJ74Vx4SoP5/PvJE//BTBK6CA4jFIU5+EfEe3BbhfepBZO9J1eKbRQMRr5k
         OQ/g==
X-Forwarded-Encrypted: i=1; AFNElJ+uUd48NayodbZGLSlRSqZmOaoXlYRk3xQtWFSPXPji+u+f0/Tc1wFLtio7/wVGwV/Mx2McPjvTjprwQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5pbtvgMuWpCDTSfKSaNw0GxXpq4rVxRp1p5YX7Lo8NOcYIB5c
	BvHLLACwYbp3vNVIokMPk2kCq5D9zf13lX6ZFKlqRDkeirYpOdC7hoprdZz4rTca9VclVsCid2i
	jOBOnOwnDBYFTN5KIZLBsirTKwmvzU9k=
X-Gm-Gg: Acq92OGFfaLDOeBI3HB8JVyfxFg8B7UZ5od1AZzWWgWv/XuCG8tRquBtPK3tRJLDTgq
	jsBjBJpxllEODvFF7CmRu6+EhxnBlzOUGZZr7c3tG0QlmeZS2PjAbhpgNYBQc/hEp/PES5rNHC5
	hwhhOCgS8ckn5krk3e6A8ekPJMyT67mr9O7ld12FzhsFbooHkyXH4ULmvAW7ByPu27ArFPNpz7m
	Z9s9JWnXZZy+zTD2wfQ5LaLWIFVZwkUv/QKfkcX7vetr+wVemyL0tx7JJ7+zYs7NPE1fBYYOZxt
	EgPVA7yyZg==
X-Received: by 2002:a17:907:a68b:b0:bda:2928:ff9a with SMTP id
 a640c23a62f3a-bda292920a3mr99249366b.39.1779216663733; Tue, 19 May 2026
 11:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com> <CAGsJ_4w_-Y8qNLDeLX9OWpLpK01YG2bF-N6_mGypgsauvfCvkA@mail.gmail.com>
In-Reply-To: <CAGsJ_4w_-Y8qNLDeLX9OWpLpK01YG2bF-N6_mGypgsauvfCvkA@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 11:50:51 -0700
X-Gm-Features: AVHnY4JjQJo4iM5wAoXXEGJ4OEpxos0PYW3wieiPnlRi6plEliJjiQongYt0ODQ
Message-ID: <CAHbLzkpbQ4Ca0xC74BJ6iJUVKdpH90qE+E=g7HkDXvcNH1+8+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, jack@suse.cz, 
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_115107_394814_7C607BC3 
X-CRM114-Status: GOOD (  60.83  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgNDowN+KAr0FNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDE5LCAyMDI2IGF0IDU6MjHigK9BTSBZYW5n
IFNoaSA8c2h5ODI4MzAxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBNYXkgMTcs
IDIwMjYgYXQgMTo0NeKAr0FNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJuZWwub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gU2F0LCBNYXkgMiwgMjAyNiBhdCAxOjU44oCvQU0gTWF0dGhldyBXaWxj
b3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gU2F0LCBN
YXkgMDIsIDIwMjYgYXQgMDE6NDQ6MzRBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+ID4g
PiA+IE9uIEZyaSwgTWF5IDEsIDIwMjYgYXQgMTA6NTfigK9QTSBNYXR0aGV3IFdpbGNveCA8d2ls
bHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIEZyaSwg
TWF5IDAxLCAyMDI2IGF0IDA2OjQ5OjU4QU0gKzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gMS4gVGhlcmUgaXMgbm8gZGV0ZXJtaW5pc3RpYyBsYXRlbmN5IGZvciBJL08gY29t
cGxldGlvbi4gSXQgZGVwZW5kcyBvbgo+ID4gPiA+ID4gPiA+IGJvdGggdGhlIGhhcmR3YXJlIGFu
ZCB0aGUgc29mdHdhcmUgc3RhY2sgKGJpby9yZXF1ZXN0IHF1ZXVlcyBhbmQgdGhlCj4gPiA+ID4g
PiA+ID4gYmxvY2sgc2NoZWR1bGVyKS4gU29tZXRpbWVzIHRoZSBsYXRlbmN5IGlzIHNob3J0OyBh
dCBvdGhlciB0aW1lcyBpdCBjYW4KPiA+ID4gPiA+ID4gPiBiZSBxdWl0ZSBsb25nLiBJbiBzdWNo
IGNhc2VzLCBhIGhpZ2gtcHJpb3JpdHkgdGhyZWFkIHBlcmZvcm1pbmcgb3BlcmF0aW9ucwo+ID4g
PiA+ID4gPiA+IHN1Y2ggYXMgbXByb3RlY3QsIHVubWFwLCBwcmN0bF9zZXRfdm1hLCBvciBtYWR2
aXNlIG1heSBiZSBmb3JjZWQgdG8gd2FpdAo+ID4gPiA+ID4gPiA+IGZvciBhbiB1bnByZWRpY3Rh
YmxlIGFtb3VudCBvZiB0aW1lLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBCdXQgZG9lcyB0aGF0
IGFjdHVhbGx5IGhhcHBlbj8gIEkgZmluZCBpdCBoYXJkIHRvIGJlbGlldmUgdGhhdCB0aHJlYWQg
QQo+ID4gPiA+ID4gPiB1bm1hcHMgYSBWTUEgd2hpbGUgdGhyZWFkIEIgaXMgaW4gdGhlIG1pZGRs
ZSBvZiB0YWtpbmcgYSBwYWdlIGZhdWx0IGluCj4gPiA+ID4gPiA+IHRoYXQgc2FtZSBWTUEuICBt
cHJvdGVjdCgpIGFuZCBtYWR2aXNlKCkgYXJlIG1vcmUgbGlrZWx5IHRvIGhhcHBlbiwgYnV0Cj4g
PiA+ID4gPiA+IGl0IHN0aWxsIHNlZW1zIHJlYWxseSB1bmxpa2VseSB0byBtZS4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBJdCBkb2VzbuKAmXQgaGF2ZSB0byBpbnZvbHZlIHVubWFwcGluZyBvciBhcHBs
eWluZyBtcHJvdGVjdCB0bwo+ID4gPiA+ID4gdGhlIGVudGlyZSBWTUHigJRqdXN0IGEgcG9ydGlv
biBvZiBpdCBpcyBzdWZmaWNpZW50Lgo+ID4gPiA+Cj4gPiA+ID4gWWVzLCBidXQgdGhhdCBzdGls
bCBmYWlscyB0byBhbnN3ZXIgImRvZXMgdGhpcyBhY3R1YWxseSBoYXBwZW4iLiAgSG93IG11Y2gK
PiA+ID4gPiBwZXJmb3JtYW5jZSBpcyBhbGwgdGhpcyBjb21wbGV4aXR5IGluIHRoZSBwYWdlIGZh
dWx0IGhhbmRsZXIgYnV5aW5nIHVzPwo+ID4gPiA+IElmIHlvdSBkb24ndCBhbnN3ZXIgdGhpcyBx
dWVzdGlvbiwgSSdtIGp1c3QgZ29pbmcgdG8gZ28gaW4gYW5kIHJpcCBpdAo+ID4gPiA+IGFsbCBv
dXQuCj4gPiA+ID4KPiA+ID4KPiA+ID4gSGkgTWF0dGhldyAoYW5kIExvcmVuem8sIEphbiwgYW5k
IGFueW9uZSBlbHNlIHdobyBtYXkgYmUKPiA+ID4gd2FpdGluZyBmb3IgYW5zd2VycyksCj4gPiA+
Cj4gPiA+IEFzIHByb21pc2VkIGR1cmluZyBMU0YvTU0vQlBGLCB3ZSBjb25kdWN0ZWQgdGhvcm91
Z2gKPiA+ID4gdGVzdGluZyBvbiBBbmRyb2lkIHBob25lcyB0byBkZXRlcm1pbmUgd2hldGhlciBw
ZXJmb3JtaW5nCj4gPiA+IEkvTyBpbiBgZmlsZW1hcF9mYXVsdCgpYCBjYW4gYmxvY2sgYHZtYV9z
dGFydF93cml0ZSgpYC4KPiA+ID4gSSB3YW50ZWQgdG8gZ2l2ZSBhIHF1aWNrIHVwZGF0ZSBvbiB0
aGlzIHF1ZXN0aW9uLgo+ID4gPgo+ID4gPiBOYW56aGUgYXQgWGlhb21pIGNyZWF0ZWQgdHJhY2lu
ZyBzY3JpcHRzIGFuZCByYW4gdmFyaW91cwo+ID4gPiBhcHBsaWNhdGlvbnMgb24gQW5kcm9pZCBk
ZXZpY2VzIHdpdGggSS9PIHBlcmZvcm1lZCB1bmRlcgo+ID4gPiB0aGUgVk1BIGxvY2sgaW4gYGZp
bGVtYXBfZmF1bHQoKWAuIFdlIGZvdW5kIHRoYXQ6Cj4gPiA+Cj4gPiA+IDEuIFRoZXJlIGFyZSB2
ZXJ5IGZldyBjYXNlcyB3aGVyZSB1bm1hcCgpIGlzIGJsb2NrZWQgYnkKPiA+ID4gICAgcGFnZSBm
YXVsdHMuIEkgYXNzdW1lIHRoaXMgaXMgZHVlIHRvIGJ1Z2d5IHVzZXIgY29kZQo+ID4gPiAgICBv
ciBwb29yIHN5bmNocm9uaXphdGlvbiBiZXR3ZWVuIHJlYWRzIGFuZCB1bm1hcCgpLgo+ID4gPiBT
byBJIGFzc3VtZSBpdCBpcyBub3QgYSBwcm9ibGVtLgo+ID4gPgo+ID4gPiAyLiBXZSBvYnNlcnZl
ZCBtYW55IGNhc2VzIHdoZXJlIGB2bWFfc3RhcnRfd3JpdGUoKWAKPiA+ID4gICAgaXMgYmxvY2tl
ZCBieSBwYWdlLWZhdWx0IEkvTyBpbiBzb21lIGFwcGxpY2F0aW9ucy4KPiA+ID4gICAgVGhlIGJs
b2NraW5nIG9jY3VycyBpbiB0aGUgYGR1cF9tbWFwKClgIHBhdGggZHVyaW5nCj4gPiA+ICAgIGZv
cmsoKS4KPiA+ID4KPiA+ID4gV2l0aCBTdXJlbidzIGNvbW1pdCBmYjQ5YzQ1NTMyM2ZmICgiZm9y
azogbG9jayBWTUFzIG9mCj4gPiA+IHRoZSBwYXJlbnQgcHJvY2VzcyB3aGVuIGZvcmtpbmciKSwg
d2Ugbm93IGFsd2F5cyBob2xkCj4gPiA+IGB2bWFfd3JpdGVfbG9jaygpYCBmb3IgZWFjaCBWTUEu
IE5vdGUgdGhhdCB0aGUKPiA+ID4gYG1tYXBfbG9ja2Agd3JpdGUgbG9jayBpcyBhbHNvIGhlbGQs
IHdoaWNoIGNvdWxkIGxlYWQgdG8KPiA+ID4gY2hhaW5lZCB3YWl0aW5nIGlmIHBhZ2UtZmF1bHQg
SS9PIGlzIHBlcmZvcm1lZCB3aXRob3V0Cj4gPiA+IHJlbGVhc2luZyB0aGUgVk1BIGxvY2suCj4g
PiA+Cj4gPiA+IE15IGd1dCBmZWVsaW5nIGlzIHRoYXQgU3VyZW4ncyBjb21taXQgbWF5IGJlIG92
ZXJzaG9vdGluZywKPiA+ID4gc28gbXkgcm91Z2ggaWRlYSBpcyB0aGF0IHdlIG1pZ2h0IHdhbnQg
dG8gZG8gc29tZXRoaW5nIGxpa2UKPiA+ID4gdGhlIGZvbGxvd2luZyAod2UgaGF2ZW4ndCB0ZXN0
ZWQgaXQgeWV0IGFuZCBpdCBtaWdodCBiZQo+ID4gPiB3cm9uZyk6Cj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMKPiA+ID4gaW5kZXggMjMxMWFlN2MyZmY0Li41
ZGRhZjI5N2YzMWEgMTAwNjQ0Cj4gPiA+IC0tLSBhL21tL21tYXAuYwo+ID4gPiArKysgYi9tbS9t
bWFwLmMKPiA+ID4gQEAgLTE3NjIsNyArMTc2MiwxMyBAQCBfX2xhdGVudF9lbnRyb3B5IGludCBk
dXBfbW1hcChzdHJ1Y3QgbW1fc3RydWN0Cj4gPiA+ICptbSwgc3RydWN0IG1tX3N0cnVjdCAqb2xk
bW0pCj4gPiA+ICAgICAgICAgZm9yX2VhY2hfdm1hKHZtaSwgbXBudCkgewo+ID4gPiAgICAgICAg
ICAgICAgICAgc3RydWN0IGZpbGUgKmZpbGU7Cj4gPiA+Cj4gPiA+IC0gICAgICAgICAgICAgICBy
ZXR2YWwgPSB2bWFfc3RhcnRfd3JpdGVfa2lsbGFibGUobXBudCk7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAvKgo+ID4gPiArICAgICAgICAgICAgICAgICogRm9yIGFub255bW91cyBvciB3cml0YWJs
ZSBwcml2YXRlIFZNQXMsIHByZXZlbnQKPiA+ID4gKyAgICAgICAgICAgICAgICAqIGNvbmN1cnJl
bnQgQ29XIGZhdWx0cy4KPiA+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gPiArICAgICAgICAg
ICAgICAgaWYgKCFtcG50LT52bV9maWxlIHx8ICghKG1wbnQtPnZtX2ZsYWdzICYgVk1fU0hBUkVE
KSAmJgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG1wbnQt
PnZtX2ZsYWdzICYgVk1fV1JJVEUpKSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dmFsID0gdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKG1wbnQpOwo+ID4gPiAgICAgICAgICAgICAg
ICAgaWYgKHJldHZhbCA8IDApCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbG9v
cF9vdXQ7Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAobXBudC0+dm1fZmxhZ3MgJiBWTV9ET05U
Q09QWSkgewo+ID4KPiA+IE1heWJlIGEgbGl0dGxlIGJpdCBvZmYgdG9waWMuIFRoaXMgaXMgYW4g
aW50ZXJlc3RpbmcgaWRlYS4gSXQgc2VlbXMKPiA+IHBvc3NpYmxlIHdlIGRvbid0IGhhdmUgdG8g
dGFrZSB2bWEgd3JpdGUgbG9jayB1bmNvbmRpdGlvbmFsbHkuIElJVUMKPiA+IHRoZSB3cml0ZSBs
b2NrIGlzIG1haW5seSB1c2VkIHRvIHNlcmlhbGl6ZSBhZ2FpbnN0IHBhZ2UgZmF1bHQgYW5kCj4g
PiBtYWR2aXNlLCByaWdodD8gSSBnb3QgYSBjcmF6eSBpZGVhIG9mZiB0aGUgdG9wIG9mIG15IGhl
YWQuIFdlIG1heSBiZQo+ID4gYWJsZSB0byBqdXN0IHRha2Ugdm1hIHdyaXRlIGxvY2sgaWZmIHZt
YS0+YW5vbl92bWEgaXMgbm90IE5VTEwuCj4gPgo+ID4gRmlyc3Qgb2YgYWxsLCB3cml0ZSBtbWFw
X2xvY2sgaXMgaGVsZCwgc28gdGhlIHZtYSBjYW4ndCBnbyBvciBiZQo+ID4gY2hhbmdlZCB1bmRl
ciB1cy4KPiA+Cj4gPiBTZWNvbmRseSwgaWYgdm1hLT5hbm9uX3ZtYSBpcyBOVUxMLCBpdCBiYXNp
Y2FsbHkgbWVhbnMgZWl0aGVyIG5vIHBhZ2UKPiA+IGZhdWx0IGhhcHBlbmVkIG9yIG5vIGNvdyBo
YXBwZW5lZCwgc28gdGhlcmUgaXMgbm8gcGFnZSB0YWJsZSB0byBjb3B5LAo+ID4gdGhpcyBpcyBh
bHNvIHdoYXQgY29weV9wYWdlX3JhbmdlKCkgZG9lcyBjdXJyZW50bHkuIFNvIHdlIGNhbiBzaHJp
bmsKPiA+IHRoZSBjcml0aWNhbCBzZWN0aW9uIHRvOgo+ID4KPiA+IGlmICh2bWEtPmFub25fdm1h
KSB7Cj4gPiAgICAgdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKHNyY192bWEpOwo+ID4gICAgIGFu
b25fdm1hX2ZvcmsoZHN0X3ZtYSwgc3JjX3ZtYSk7Cj4gPiAgICAgY29weV9wYWdlX3JhbmdlKGRz
dF92bWEsIHNyY192bWEpOwo+ID4gfQo+ID4KPiA+IEJ1dCBwYWdlIGZhdWx0IGNhbiBoYXBwZW4g
YmVmb3JlIHdyaXRlIG1tYXBfbG9jayBpcyB0YWtlbiwgd2hlbiB3ZQo+ID4gY2hlY2sgdm1hLT5h
bm9uX3ZtYSwgaXQgaXMgcG9zc2libGUgaXQgaGFzIG5vdCBiZWVuIHNldCB1cCB5ZXQuIEJ1dCBp
dAo+ID4gc2VlbXMgdG8gYmUgZXF1aXZhbGVudCB0byBwYWdlIGZhdWx0IGFmdGVyIGZvcmsgYW5k
IHdvbid0IGJyZWFrIHRoZQo+ID4gc2VtYW50aWMuCj4KPiBSZS1yZWFkaW5nIFN1cmVuJ3MgY29t
bWl0IGxvZyBmb3IgZmI0OWM0NTUzMjNmZjgKPiAoImZvcms6IGxvY2sgVk1BcyBvZiB0aGUgcGFy
ZW50IHByb2Nlc3Mgd2hlbiBmb3JraW5nIiksCj4gaXQgc2VlbXMgdGhhdCB2bV9zdGFydF93cml0
ZSgpIGlzIHVzZWQgdG8gcHJvdGVjdAo+IGFnYWluc3QgYSByYWNlIHdoZXJlIGFub25fdm1hIGNo
YW5nZXMgZnJvbSBOVUxMIHRvCj4gbm9uLU5VTEwgZHVyaW5nIGZvcmsuIEluIHRoYXQgc2NlbmFy
aW8sIHdlIGhvbGQgdGhlCj4gbW1hcF9sb2NrIHdyaXRlIGxvY2ssIGJ1dCBub3Qgdm1hX3N0YXJ0
X3dyaXRlKCksIHNvIGEKPiBjb25jdXJyZW50IGFub25fdm1hX3ByZXBhcmUoKSBjb3VsZCBzdGls
bCBpbnN0YWxsIGFuCj4gYW5vbl92bWEuCj4KPiAiICAgIEEgY29uY3VycmVudCBwYWdlIGZhdWx0
IG9uIGEgcGFnZSBuZXdseSBtYXJrZWQgcmVhZC1vbmx5IGJ5IHRoZSBwYWdlCj4gICAgIGNvcHkg
bWlnaHQgdHJpZ2dlciB3cF9wYWdlX2NvcHkoKSBhbmQgYSBhbm9uX3ZtYV9wcmVwYXJlKHZtYSkg
b24gdGhlCj4gICAgIHNvdXJjZSB2bWEsIGRlZmVhdGluZyB0aGUgYW5vbl92bWFfY2xvbmUoKSB0
aGF0IHdhc24ndCBkb25lIGJlY2F1c2UgdGhlCj4gICAgIHBhcmVudCB2bWEgb3JpZ2luYWxseSBk
aWRuJ3QgaGF2ZSBhbiBhbm9uX3ZtYSwgYnV0IHdlIG5vdyBtaWdodCBlbmQgdXAKPiAgICAgY29w
eWluZyBhIHB0ZSBlbnRyeSBmb3IgYSBwYWdlIHRoYXQgaGFzIG9uZS4KPiAiCj4KPiBJZiB0aGF0
IGlzIHRoZSBjYXNlLCB0aGVuIHlvdXIgY2hhbmdlIGRvZXMgbm90IHdvcmsuCj4KPiBOb3dhZGF5
cywgbm9ib2R5IGNhbGxzIGFub25fdm1hX3ByZXBhcmUodm1hKSBkaXJlY3RseS4KPiBJbnN0ZWFk
LCB2bWZfYW5vbl9wcmVwYXJlKCkgaXMgdXNlZCwgYW5kIHdlIGFsd2F5cwo+IHJlcXVpcmUgdGhl
IG1tYXBfbG9jayByZWFkIGxvY2sgYmVmb3JlIGNhbGxpbmcKPiBfX2Fub25fdm1hX3ByZXBhcmUo
KS4gQXMgYSByZXN1bHQsIGFub25fdm1hIGNhbm5vdAo+IHRyYW5zaXRpb24gZnJvbSBOVUxMIHRv
IG5vbi1OVUxMIGR1cmluZyBmb3JrLgo+Cj4gU28gdGhlIG9yaWdpbmFsIHJhY2UgY29uZGl0aW9u
IGhhcyBlZmZlY3RpdmVseQo+IGRpc2FwcGVhcmVkLgoKYW5vbl92bWFfcHJlcGFyZSgpIGhhcyBz
b21lIHVzZWNhc2VzIHRvbywgYnV0IGl0IHNlZW1zIGxpa2UgaXQKcmVxdWlyZXMgdGFraW5nIHJl
YWQgbW1hcF9sb2NrIHRvbyBpZiBJIHJlYWQgdGhlIGNvZGUgY29ycmVjdGx5LgoKPgo+IFlvdSBh
bHNvIG1lbnRpb25lZCB0aGUgbWFkdmlzZSgpIGNhc2UuIElmIEkgdW5kZXJzdGFuZAo+IGNvcnJl
Y3RseSwgbWFkdmlzZSgpIHNob3VsZCB0YWtlIG1tYXBfbG9jayBiZWZvcmUKPiBtb2RpZnlpbmcg
YW5vbl92bWEuIE9ubHkgc29tZSBwYXJ0cyBvZiBtYWR2aXNlKCkgY2FuCj4gc3VwcG9ydCBwZXIt
Vk1BIGxvY2tpbmcuIFRoZXJlZm9yZSwgd2UgcHJvYmFibHkgZG8gbm90Cj4gbmVlZDoKPgo+IGlm
ICh2bWEtPmFub25fdm1hKSB7Cj4gdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKHNyY192bWEpOwo+
IC4uLgo+IH0KCkkgdGhpbmsgd2Ugc3RpbGwgbmVlZCB3cml0ZSB2bWEgbG9jayB0byBzZXJpYWxp
emUgYW5vbl92bWEgZm9yawpvdGhlcndpc2Ugd2UgbWF5IHNlZToKCiAgICAgICAgQ1BVIDAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVIDEKZm9yayAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdl
IGZhdWx0CiAgIHNyYyB2bWEgaGFzIG5vIGFub25fdm1hCiAgICAgICBza2lwIHZtYSBmb3JrCgph
bGxvY2F0ZSBhbm9uX3ZtYSBmb3Igc3JjIHZtYQp2bWFfbmVlZHNfY29weSgpIHNlZXMgYW5vbl92
bWEKY29weSBwYWdlCgpUaGVuIHdlIG1heSBlbmQgdXAgYmVpbmcgbm8gYW5vbl92bWEgZm9yIGRz
dCB2bWEsIGJ1dCB3aXRoIHBhZ2VzIG1hcHBlZCBpbiBpdC4KClRoYW5rcywKWWFuZwoKPgo+ID4K
PiA+IEFueXdheSwganVzdCBhIGNyYXp5IGlkZWEsIEkgbWF5IG1pc3Mgc29tZSBjb3JuZXIgY2Fz
ZXMuCj4KPiBUbyBtZSwgaXQgc2VlbXMgdGhhdCB3ZSBjb3VsZCByZW1vdmUgdm1hX3N0YXJ0X3dy
aXRlKCkKPiBlbnRpcmVseSBub3cuIE9yIGlzIHRoYXQgYW4gZXZlbiBjcmF6aWVyIGlkZWE/CgoK
Pgo+IFRoYW5rcwo+IEJhcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
