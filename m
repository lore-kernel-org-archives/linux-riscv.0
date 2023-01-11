Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B8BC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UafCgbPh6Hw5QZqCgKneT5ehOSkbdMtGUb5e8BLRhkA=; b=Rt2hzZPrrv/xfU
	wf9JJoyq6H4bxfu0ToDYPeLtrNpInBF1mAXwtr1huZHvb89zBV4ITx28ac4YihTN+2AoOP7WjY8Zz
	Rn+nKGHl6bEd2Vp3NwznskHImC6DkFVpMVnxlFZWpx88R49TKjIdGw0fwbs62dF/dAdljaQEE5yGi
	/W2Q7lER4ULMhWkctp7El8lrdB1O3mRGsy7zxSP6F9JwJleXVzses9JQmhKc53MiGOYQE8rnZPZ+b
	8vVA5JvnNjIYywYmXjtWWWoMHPfX97aFJcQJMYwMJJg57U4NXsP5wv0Ab8itKIsCScHrsl9F6aut9
	2+jQt8ntZSTTkGT90dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbNO-00BeRZ-OA; Wed, 11 Jan 2023 13:42:46 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbNK-00BeQ5-LY
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:42:45 +0000
Received: by mail-ej1-x62b.google.com with SMTP id l22so7179711eja.12
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 05:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdD3sHVKIKl40hqz9dJKJoDzK60cQj5uZEqs8YAmOoA=;
        b=ebzzRthBDy47qOs4P75Rib8cz38vs9ZrSKwdYuJ9Y6rMQR+DlHI+dYcfhA6KqAk/wi
         azYU0gU3JCEZI8ybv9vaMXUC8Up76uyihxkIsrZZoF+w3psOgLL9tMajIISwXSPlGxAo
         6/ZoL+DmbovQ+UItQxgNQfGPhLqQv9XjWB4l2NSLZidtAjG3NwDNxHkig4dtxdeQA3OM
         hGEjRlEpx4/N7tWKPkkbGKyEphVN8PkJN06L/orp97sgTZgMzU/4IhJL3eCGUHriuydX
         ACMXvp2/oEUNhMEnsQaKjg6iPvzRS+e46egoU2A5WCxlPK/7pSUNwU5OoTM8Hok022li
         c0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdD3sHVKIKl40hqz9dJKJoDzK60cQj5uZEqs8YAmOoA=;
        b=lTCWf2YIcz5XIhib+SrowxhDCVZVIwECnd8512y0p+m1GVS3YgyrdzyJwMxQqlwnI6
         h2smWHNqExVdT0YX5zMitHZ4esXY1JL+FWYflkpYUweZh83VXFf0GS+RX7u3K/F2K2JS
         +5c+8tW8f8QOP1VtNApKcuQyupb6egw1oTR64rn16ItluVA1oUzDGu97JAHeKjl1RYNt
         AWuGDqyKln1gl2zzAEo8UNritPOy4Na/eLdNU3rJfCThvUUXvVdGCr2J8aPOzm3i9WwH
         84qkjIyaIVs+Lxq7RxL/zCL36bMTjztqG48d+H4QImopGnZzQycl2EuUMhIFP1QyqlaA
         Lzuw==
X-Gm-Message-State: AFqh2krce4nK/5S2q52e4ELyGpxWD2y5HvQkL+gQY+6rexBQf656DjAG
	XvQunWt29peDbeoV5U1uM9EMUM/RMHnFUFfcpxNhBQ==
X-Google-Smtp-Source: AMrXdXu3yzSZGPcc93x7FMTL8fB9rqMYYm2AXOfa1u7lImvPmI8joV9NyByXulwZOtT3VdbeRJuWLkXwxLdnb/+EnsQ=
X-Received: by 2002:a17:906:a10d:b0:7f7:a985:181f with SMTP id
 t13-20020a170906a10d00b007f7a985181fmr6939424ejy.523.1673444558201; Wed, 11
 Jan 2023 05:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20230109181755.2383085-1-heiko@sntech.de> <20230109181755.2383085-5-heiko@sntech.de>
 <20230110093936.nzc3nkrkqkkzxkaq@orel> <1994655.QkHrqEjB74@diego>
 <20230110111647.vg4fdclz4hzcuaj3@orel> <20230111123436.6qq3syh24prrs7o7@orel> <CAEg0e7gJgpoiGjfLeedba0-r=dCE1Z_qkU53w_+-cVjsuqaC3A@mail.gmail.com>
In-Reply-To: <CAEg0e7gJgpoiGjfLeedba0-r=dCE1Z_qkU53w_+-cVjsuqaC3A@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 11 Jan 2023 14:42:27 +0100
Message-ID: <CAAeLtUBdLrHwwiNhOxeeeAf2u3YeoSN0tzuLX+YUoiOrPZm2uw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different str* implementations
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org, 
	jszhang@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_054242_731223_92C9E60C 
X-CRM114-Status: GOOD (  25.40  )
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

RHJldywKCnRoZSByZWFzb24gd2h5IGFsaWdubWVudCBpcyBjcml0aWNhbCBmb3IgY29ycmVjdG5l
c3Mgb2Ygb3B0aW1pc2F0aW9ucwppbiB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIGlzIHRoYXQgZXhj
ZXB0aW9uIHNlbWFudGljcyBtdXN0IGJlIHJldGFpbmVkCndoZW4gY3Jvc3NpbmcgcGFnZSBib3Vu
ZGFyaWVzLgoKUGhpbGlwcC4KCk9uIFdlZCwgMTEgSmFuIDIwMjMgYXQgMTQ6MzksIENocmlzdG9w
aCBNw7xsbG5lcgo8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PiB3cm90ZToKPgo+Cj4KPiBP
biBXZWQsIEphbiAxMSwgMjAyMyBhdCAxOjM0IFBNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiBPbiBUdWUsIEphbiAxMCwgMjAyMyBhdCAxMjoxNjo0
N1BNICswMTAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+ID4gT24gVHVlLCBKYW4gMTAsIDIwMjMg
YXQgMTE6NDY6NDBBTSArMDEwMCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj4+ID4gPiBIaSBBbmRy
ZXcsCj4+ID4gPgo+PiA+ID4gQW0gRGllbnN0YWcsIDEwLiBKYW51YXIgMjAyMywgMTA6Mzk6MzYg
Q0VUIHNjaHJpZWIgQW5kcmV3IEpvbmVzOgo+PiA+ID4gPiBPbiBNb24sIEphbiAwOSwgMjAyMyBh
dCAwNzoxNzo1NFBNICswMTAwLCBIZWlrbyBTdHVlYm5lciB3cm90ZToKPj4gPiA+ID4gPiBGcm9t
OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+Cj4+ID4gPiA+ID4KPj4g
PiA+ID4gPiBEZXBlbmRpbmcgb24gc3VwcG9ydGVkIGV4dGVuc2lvbnMgb24gc3BlY2lmaWMgUklT
Qy1WIGNvcmVzLAo+PiA+ID4gPiA+IG9wdGltaXplZCBzdHIqIGZ1bmN0aW9ucyBtaWdodCBtYWtl
IHNlbnNlLgo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gVGhpcyBhZGRzIGJhc2ljIGluZnJhc3RydWN0
dXJlIHRvIGFsbG93IHBhdGNoaW5nIHRoZSBmdW5jdGlvbiBjYWxscwo+PiA+ID4gPiA+IHZpYSBh
bHRlcm5hdGl2ZXMgbGF0ZXIgb24uCj4+ID4gPiA+ID4KPj4gPiA+ID4gPiBUaGUgTGludXgga2Vy
bmVsIHByb3ZpZGVzIHN0YW5kYXJkIGltcGxlbWVudGF0aW9ucyBmb3Igc3RyaW5nIGZ1bmN0aW9u
cwo+PiA+ID4gPiA+IGJ1dCB3aGVuIGFyY2hpdGVjdHVyZXMgd2FudCB0byBleHRlbmQgdGhlbSwg
dGhleSBuZWVkIHRvIHByb3ZpZGUgdGhlaXIKPj4gPiA+ID4gPiBvd24uCj4+ID4gPiA+Cj4+ID4g
PiA+IEFuZCB0aGUgY29tcGlsZXIgcHJvdmlkZXMgYnVpbHRpbnMuIEluIHRoZSBwcmV2aW91cyBz
ZXJpZXMgaXQgYXBwZWFyZWQKPj4gPiA+ID4gdG8gYmUgYSBiYWQgaWRlYSB0byBjb21waWxlIHRo
ZSBrZXJuZWwgd2l0aCB0aGUgY29tcGlsZXIncyBidWlsdGlucwo+PiA+ID4gPiBkaXNhYmxlZC4g
SG93IHdpbGwgdGhlIG9wdGltaXplZCBzdHJpbmcgZnVuY3Rpb25zIHdoaWNoIHdpbGwgYmUgYmFz
ZWQKPj4gPiA+ID4gb24gdGhpcyBwYXRjaCBiZSBzZWxlY3RlZD8KPj4gPiA+Cj4+ID4gPiB5ZXAs
IHRoZSBjb25zZW5zdXMgc2VlbWluZ2x5IHdhcyB0aGF0IHRoZSBjb21waWxlciBrbm93cyBiZXN0
IHdoZW4KPj4gPiA+IHRvIHVzZSBidWlsdGlucyBmb3Igc29tZSBjYXNlcyAod2hpY2ggaXMgcHJv
YmFibHkgY29ycmVjdCksIGhlbmNlIHRoZSBtb3ZlCj4+ID4gPiBhd2F5IGZyb20gdGhlIGlubGlu
ZSBiYXNlcy4KPj4gPiA+Cj4+ID4gPiBTbyBJIGd1ZXNzIHRoZSBmaXJzdCBkZWNpc2lvbiBpcyB0
aGUgY29tcGlsZXIncyB3ZXRoZXIgdG8gdXNlIGEgYnVpbHRpbiBvcgo+PiA+ID4gdGhlIGtlcm5l
bCBzdHJpbmcgZnVuY3Rpb24gKHNhbWUgYXMgZm9yIG1lbSopIC4KPj4KPj4gSGkgSGVpa28sCj4+
Cj4+IFRoaW5raW5nIGFib3V0IHRoaXMgc29tZSBtb3JlLCBJJ2Qgc3RpbGwgbGlrZSB0byB1bmRl
cnN0YW5kIGhvdy93aGVuIHRoZQo+PiBjb21waWxlciBtYWtlcyB0aGlzIGNob2ljZS4gQXJlIGNv
bXBpbGVyIGZsYWdzIGludm9sdmVkPyBPciBkbyBzb21lCj4+IGhldXJpc3RpY3MgZGljdGF0ZSB0
aGUgY2hvaWNlPwo+Cj4KPiAxKSBBcmNoLWluZGVwZW5kZW50IGV4cGFuc2lvbiBpcyB1c2VkIGUu
Zy4gZm9yIGNhbGN1bGF0aW5nIHRoZSByZXN1bHQgZm9yIHN0YXRpY2FsbHkga25vd24gc3RyaW5n
cy4KPiAyKSBBcmNoLXNwZWNpZmljIGV4cGFuc2lvbiAobm90IG1haW5saW5lLCBidXQgbXkgc2Vy
aWVzIGNhbiBiZSBmb3VuZCBoZXJlOiBbMV0pIGNhbiBkbyB3aGF0ZXZlciBpcyByZWFzb25hYmxl
Lgo+IE15IHNlcmllcyBlbWl0cyBhIGJvdW5kZWQgdW5yb2xsZWQgY29tcGFyaXNvbiBsb29wIGZv
ciBzdHIobiljbXAgd2l0aCBhIGJvdW5kIHRoYXQgY2FuIGJlIGFkanVzdGVkIHZpYSBmbGFnLgo+
IEJ1dCBpdCBvbmx5IHRyaWdnZXJzIGlmIGJvdGggc3RyaW5ncyBhcmUga25vd24gdG8gYmUgYWxp
Z25lZC4KPgo+IFsxXSBodHRwczovL2djYy5nbnUub3JnL3BpcGVybWFpbC9nY2MtcGF0Y2hlcy8y
MDIyLU5vdmVtYmVyLzYwNTk5My5odG1sCj4KPiBCUgo+IENocmlzdG9waAo+Cj4+Cj4+IFRoYW5r
cywKPj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
