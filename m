Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63ADCD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 20:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FOVueLRWzxUmNfBkVrs2pHlgRcLbZKceQ01wv2u9KU=; b=pTMTT4XfkST7LA
	x0Ldd8ADFx0nGwSNk8pGlbbhocVLFYRwLcHicQ9uWwk7XZgu9fbN75YSvxy76raQlVS9qh/61CS/W
	MjhSRYspQ1J4BudQVt+WsjaBlp5C3GShUrW8M/rFkJIwTNKZtLpYBK0E28tQKGe1KodZgiJEd4kDP
	WKaFYsfX/UB9EzrR7HpKKKQ9cup2XTt+P7bk4H3NWrQC9aUkaKTFpicRbyyPNOc9eBF5vx1c134Yr
	9iVkrxiV5EPG5zEcEmgkyiSQmMFMswwFkLtuRrhQZQ8MXfrZbt/WMg5hWEGOiq4AAGCDlx6gXNjRz
	e4ouImdOVD1biy6ir+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKMbf-0000000HSSw-14HJ;
	Tue, 05 May 2026 20:43:03 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKMbd-0000000HSSA-0h5L
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 20:43:02 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12c8d0945b3so1761c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 13:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778013778; cv=none;
        d=google.com; s=arc-20240605;
        b=l0J8/ana7Ip0pIVCc1AOWzYaokk0qjnl7Rk6Wigm+f2wUsOS9olZdkO6tPRG/Vy570
         IICSlatRMY6Z44o9kwuTHZrGwz99SeqkSSwucAXO5AxafXhV2z/Fk58Fxdvl4HYEl0mm
         pmKSS0zaBnjjzg38OyteEmo1ulN2PhNTcgwTsPRSf0RwUwEuV0KaBkxZ/r9zPYq6nUEk
         0Fh4wHcfCu42GCIcHUck4vT1bgrfRqZW63nT73f5p7n2EVeL9FVVsbd2KRdLiUiMgwbp
         EsvGNp79gY3imQHyP9xlSBqaF0/By4OvlKkVDe00tJbl1xl6vTeVYCl7wMbdtcDZbM+t
         zgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aWEGxma8SuORLQaPs+73ZSwOWcKgsiDRBuZcLtSIbsA=;
        fh=XD9ORgAZ9Wwyt5VbEbIgWOsTfF3dh0cHa38wmyn0YJk=;
        b=SN3pxZx+NI4/ZCelS5/5QMEs3tWQ+mp2zhODKqWIbaP2PL2Shqupd/6oGx60hoKOIT
         p9UxWXPiPssAArO657k9OeuYu1/1airVZC0nKGM0ZIbZ8hOL1+K09wF34nrXt13GYwXl
         s3WMtPR7A6wWtGestpKKTNI0xhMMRPvieRtO6OWDCYfn78rr7g3yar31r90BrBhkT8OA
         h1ygMR/Aj8jKsHmFwpWP4IqBUsuQe+FvZkkwwiNteisAZiLLYi6T1070LgdPB+DNxb53
         jBDQ1n8w4613RrLRqxwDoGXoQ21DDNt+OMDucGwPze4l52R5eawrVWJt40ggBVp/yAeD
         IoCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778013778; x=1778618578; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWEGxma8SuORLQaPs+73ZSwOWcKgsiDRBuZcLtSIbsA=;
        b=uHuOMI8QKT2Wjp9Qe7L9TaOrdM9kIZ6GVz1w9Y4y1N2gvi5e7H2YUxdeuIVr+XvcOP
         43WTX10U+x4wAsehb0GluhTAAyuUlw5GGg6fxUuUXRujsVVev5wD6SvRQPlaiGBoAgEM
         mWz8pDP0qGYvDR/bucQA036vcYaW7Cdp46Vb9FB4v8w+DR+3CLzQ5VOqkFwOAyTUyC0w
         2zgSk22V46qThuBycHEh5Lbgk88UJpgGxaLyYq5oQMZ+GiM4Cj+zmfdybom4rxuTRHbM
         3xnkbRhehuokvzcUl7aWquhFALl9BC0NL4VoK50XpnDQN3rt0cXpskEN06pGPTJ6NDQy
         Tjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778013778; x=1778618578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aWEGxma8SuORLQaPs+73ZSwOWcKgsiDRBuZcLtSIbsA=;
        b=Sqe7rVUzslPYwjlnJDljFPFrbjYCErxRq2zIbjgTi3twMp64PlVFs5m9Up8UrI6DhP
         HYoTcE4Xi/6KfETSrFEZjDY8x64N/3fbVzB4NXWxQQJHjEgZtx/4z2xgTO3rzqr5k04H
         KANgddgre9qAeTOfvfa0abzS++R8R6rY0aThfjzELnf062q02QAVd6tRlwJgGtEBd984
         89rEbYhKOseo5csEPWp+topG84uBFPrJXoEUVfz2tixVr+GMIdjjlI71xICUhKgJ3H1a
         mybrlBJbVfQu/dybbVznrm3LkPA/iWwLe3JGvruMUF40ThvGNgiJsfX6+Yh0RU5Kul8T
         wITw==
X-Gm-Message-State: AOJu0Yy8BGo0zn33f8VGgt66mdPJl2l/QujAsAKozP5PAEK9u+6Tol0j
	lr6kcI1YJDFUzxQ8+BDOqfs2jBY637kd2oOWLXE6RKQm54k5F2UoQriLOJeQrbDrmquVlrmgAoX
	6PKm7vgrjqB7Ag4455d1dk90BdRo36mJxU2mk/zWEq2phbiAEBjMOVRJDcsw=
X-Gm-Gg: AeBDievJTER+vebkgh/eU6el8Zx3pTUJoo7vS7Cu0RBMY+9QLVywAZU8PkeCH/Cneg/
	da5PZQNU6NtUe0Tf13vU4OcHUO56i8hAqHnIoxNqoUzwoZGjx2Hk4eO5wo6XH5UhXq9wPVLDp7Q
	B/GURVTh6mEq7ouToFUxfcBs3VqmQgbq1OzA4XGW5V56qxyZPpBMMkh3hBrucjeGJa/LHZG9NKJ
	B35mipyvkjd9IuKZO2rc2IRg0WhpswO0SfMB5QgyLHGfkjHE/RQcNhuKlq0nwk866SUBshoX0R2
	H96hZjuuI6fug7Vap+uxd+zAEd49bA==
X-Received: by 2002:a05:7022:6183:b0:11a:2c18:9e70 with SMTP id
 a92af1059eb24-13203eb0c48mr13410c88.11.1778013777871; Tue, 05 May 2026
 13:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024805.1316480-2-irogers@google.com> <177751952104.2274119.14762312333480941665.git-patchwork-notify@kernel.org>
 <CAP-5=fVLcfx6_T-o7mJ650K3SX+N+T3YYOY+ibZKJGT8V56NVg@mail.gmail.com>
In-Reply-To: <CAP-5=fVLcfx6_T-o7mJ650K3SX+N+T3YYOY+ibZKJGT8V56NVg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 5 May 2026 13:42:45 -0700
X-Gm-Features: AVHnY4LZYgRX5tX2o2GOGvjJhkF8Llo6dB7Z-hyRMxpBodU2GezE0_CMCc4wYpU
Message-ID: <CAP-5=fUuxMUeZTNShmrzi064LjNgkLbJiGtEPS6mWqZ9ijaVJw@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] perf unwind: Refactor get_entries to allow dynamic
 libdw/libunwind selection
To: namhyung@kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org
Cc: linux-riscv@lists.infradead.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_134301_213003_A08BD0AB 
X-CRM114-Status: GOOD (  22.78  )
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

T24gRnJpLCBNYXkgMSwgMjAyNiBhdCA2OjQw4oCvQU0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29n
bGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDI5LCAyMDI2IGF0IDg6MjbigK9QTSA8cGF0
Y2h3b3JrLWJvdCtsaW51eC1yaXNjdkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIZWxsbzoK
PiA+Cj4gPiBUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5naXQgKGZpeGVz
KQo+ID4gYnkgTmFtaHl1bmcgS2ltIDxuYW1oeXVuZ0BrZXJuZWwub3JnPjoKPgo+IEhpLAo+Cj4g
V2lsbCB0aGVzZSBwYXRjaGVzIG1lcmdlIGludG8gdGhlIHY3LjEtcmMgc2VyaWVzIGFuZCB0aGVu
IGJhY2sgaW50bwo+IHBlcmYtdG9vbHMtbmV4dD8gSSBkb24ndCBzZWUgdGhlbSBpbiBwZXJmLXRv
b2xzLW5leHQ6Cj4gaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC9saWJ1
bndpbmQ/aD1wZXJmLXRvb2xzLW5leHQKPgo+IE5vcm1hbGx5IGNoYW5nZXMgbGlrZSB0aGlzIGdv
IGZyb20gcGVyZi10b29scy1uZXh0IHRvIHBlcmYtdG9vbHMgYW5kCj4gdGhlbiBpbnRvIExpbnVz
JyB0cmVlLgoKU28gSSBkb24ndCBzZWUgdGhlc2UgY2hhbmdlcyBpbiB0aGUgUklTQy1WIGZpeGVz
IHRyZWU6Cmh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9yaXNjdi9saW51eC5naXQvdHJlZS90b29scy9wZXJmL3V0aWw/aD1maXhlcwoKQXJlIHdlIHN0
aWxsIHdvcmtpbmcgdG8gYnJpbmcgdGhlbSBpbnRvIHBlcmYtdG9vbHMtbmV4dD8KClRoYW5rcywK
SWFuCgoKPiBUaGFua3MsCj4gSWFuCj4KPgo+ID4gT24gU3VuLCAxMiBBcHIgMjAyNiAxOTo0Nzo1
OCAtMDcwMCB5b3Ugd3JvdGU6Cj4gPiA+IEN1cnJlbnRseSwgYm90aCBsaWJkdyBhbmQgbGlidW53
aW5kIGRlZmluZSAndW53aW5kX19nZXRfZW50cmllcycuIFRoaXMKPiA+ID4gY2F1c2VzIGEgZHVw
bGljYXRlIHN5bWJvbCBidWlsZCBmYWlsdXJlIHdoZW4gYm90aCBhcmUgY29tcGlsZWQgaW50bwo+
ID4gPiBwZXJmLgo+ID4gPgo+ID4gPiBUaGlzIGNvbW1pdCByZWZhY3RvcnMgdGhlIERXQVJGIHVu
d2luZCBwb3N0LXByb2Nlc3NpbmcgdG8gYmUKPiA+ID4gY29uZmlndXJhYmxlIGF0IHJ1bnRpbWUg
dmlhIHRoZSAucGVyZmNvbmZpZyBmaWxlIG9wdGlvbgo+ID4gPiAndW53aW5kLnN0eWxlJywgb3Ig
dXNpbmcgdGhlIGFyZ3VtZW50ICctLXVud2luZC1zdHlsZScgaW4gdGhlIGNvbW1hbmRzCj4gPiA+
ICdwZXJmIHJlcG9ydCcsICdwZXJmIHNjcmlwdCcgYW5kICdwZXJmIGluamVjdCcsIGluIGEgc2lt
aWxhciBtYW5uZXIgdG8KPiA+ID4gdGhlIGFkZHIybGluZSBvciB0aGUgZGlzYXNzZW1ibGVyIHN0
eWxlLgo+ID4gPgo+ID4gPiBbLi4uXQo+ID4KPiA+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBs
aW5rczoKPiA+ICAgLSBbdjQsMS84XSBwZXJmIHVud2luZDogUmVmYWN0b3IgZ2V0X2VudHJpZXMg
dG8gYWxsb3cgZHluYW1pYyBsaWJkdy9saWJ1bndpbmQgc2VsZWN0aW9uCj4gPiAgICAgKG5vIG1h
dGNoaW5nIGNvbW1pdCkKPiA+ICAgLSBbdjQsMi84XSBwZXJmIGJ1aWxkIGxvb25nYXJjaDogUmVt
b3ZlIHJlZmVyZW5jZSB0byBtaXNzaW5nIGZpbGUKPiA+ICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3Jpc2N2L2MvODQxZGJmNDg3MWM1Cj4gPiAgIC0gW3Y0LDMvOF0gdG9vbHMgYnVpbGQ6IERl
ZHVwbGljYXRlIHRlc3QtbGlidW53aW5kIGZvciBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcwo+ID4g
ICAgIChubyBtYXRjaGluZyBjb21taXQpCj4gPiAgIC0gW3Y0LDQvOF0gcGVyZiBidWlsZDogQmUg
bW9yZSBwcm9ncmFtbWF0aWMgd2hlbiBzZXR0aW5nIHVwIGxpYnVud2luZCB2YXJpYWJsZXMKPiA+
ICAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQo+ID4gICAtIFt2NCw1LzhdIHBlcmYgdW53aW5kLWxp
YnVud2luZDogTWFrZSBsaWJ1bndpbmQgcmVnaXN0ZXIgcmVhZGluZyBjcm9zcyBwbGF0Zm9ybQo+
ID4gICAgIChubyBtYXRjaGluZyBjb21taXQpCj4gPiAgIC0gW3Y0LDYvOF0gcGVyZiB1bndpbmQt
bGlidW53aW5kOiBNb3ZlIGZsdXNoL2ZpbmlzaCBhY2Nlc3Mgb3V0IG9mIGxvY2FsCj4gPiAgICAg
KG5vIG1hdGNoaW5nIGNvbW1pdCkKPiA+ICAgLSBbdjQsNy84XSBwZXJmIHVud2luZC1saWJ1bndp
bmQ6IFJlbW92ZSBsaWJ1bndpbmQtbG9jYWwKPiA+ICAgICAobm8gbWF0Y2hpbmcgY29tbWl0KQo+
ID4gICAtIFt2NCw4LzhdIHBlcmYgdW53aW5kLWxpYnVud2luZDogQWRkIFJJU0MtViBsaWJ1bndp
bmQgc3VwcG9ydAo+ID4gICAgIChubyBtYXRjaGluZyBjb21taXQpCj4gPgo+ID4gWW91IGFyZSBh
d2Vzb21lLCB0aGFuayB5b3UhCj4gPiAtLQo+ID4gRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4K
PiA+IGh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKPiA+
Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
