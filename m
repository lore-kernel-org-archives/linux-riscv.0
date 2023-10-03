Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F2E7AD72
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pvyl/WRWX5Zn2mqaERGgG4jcL+qnhGEaRuNM+FXalq8=; b=IgGHjUAheUD17E
	VzVTKLWwJG9pUj4epaCQ3mml6CbcNhVlVHmoL+Wq5T8Ti/bFnJ+TGrNkbzc4kHH4d5kl22NCGDkq7
	iKNiis2QDRkIuxi0OfGdDKYo7pUn8h4t8YPV2CXMi8a5Ho2OIws9sJsIoTDQLBV1eSV0SDWrWt86b
	8UL5J/1pRl2E79K33rXECxvx85hbFtWlX2Rv2k5yGrON5e5HjvAJPo87kbgNSZt3ibff/bF3yGmvY
	jaHWoox2ko7vMGg9sRsaw+zxnKQLv1j9b3EMeztAoj7PIhP9eJq0vrckGcyccpgHejAdNyR2Ke1Ij
	UFq3TjrvkELW1eHHZqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhTP-00EtRb-0P;
	Tue, 03 Oct 2023 15:38:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhTL-00EtRC-1K
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 15:38:09 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5048156976cso1272499e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696347483; x=1696952283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArI9kt0KOowwB7EYnbkzew0Sjhg00yX3Kal9qOzNpu8=;
        b=ZXvgri+mQPcBT38G0YImYqDXJ6T3e0rT1ahL7AJU4QaE5JeCbhDoXWg8ZWjC7rSfqa
         5mdUVy7S6AMnw0bC/nfp99swqHdLDYKOlOeGEE6LJlC+Wj8+D661LHIrekY/tRV1lDx9
         hi98PhhD0REEjuWDkBuET+XeEZrfhVroHNxqDRpePnuSo7lm9qHXtbuPj3t+ss1ukRxM
         GJyyUBFMWxZ7DXs1jMcjWYn0nmsa57wDKubcBw3HNY6ake9+ClwUTXG5aOw+jqZPdvtS
         alVcQUceeaGh6qmqrGn8XqnFD6eDZyk8E3E5/rzXZ3D+u9rtIjcRHGzDBxLhl4DcsAz4
         BObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696347483; x=1696952283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArI9kt0KOowwB7EYnbkzew0Sjhg00yX3Kal9qOzNpu8=;
        b=A2JOD2aqOdOYGNJunH32aYE3Zyf/IWNUoiJilobTifrx/L4Hj9ANgRtx3Fj5SL/PHj
         ziMOB0jWoH6qQ+qDv7WP864JwQWj0viL/x8Bftha43LyDtVU7glESypeT5IUnk4yASce
         7ED5c0GXzSaFDgpbC6+V8MWGPstwTla5J90S6LXBzOGSrMEi3TLQSs6N2vTkHJ8d4C76
         2SuxQgd99+xXZmtHGnxiLcEtj/R9vnXTSD6pJwbWHIWkB527s+BElOba4neIFl3YHw/C
         qLA5HMQeK++xurZbCqIELHrAZqDU+AQPvtVEFdRmgNQoZj9l1ohh5oDvRYN8PqWLqsOF
         lqWA==
X-Gm-Message-State: AOJu0Yw6Xhuot5n6ZVWNV8spZbSSZ2k6mES47OOe2qnco8XLABC3fFv/
	xtakOLk5vZXIzXQxqXErtvEoImFfRMBYP+X803E=
X-Google-Smtp-Source: AGHT+IEIitcdr/L1oHpzp/5ApN/DzTbfClnPQPNJMtYUonc+Yj14sO/Gz2ruo3LD59mstDjFLxqJIZB7Vyi4trjzno8=
X-Received: by 2002:a05:6512:2342:b0:503:317b:8b76 with SMTP id
 p2-20020a056512234200b00503317b8b76mr15141498lfu.21.1696347483334; Tue, 03
 Oct 2023 08:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230926150316.1129648-1-cleger@rivosinc.com> <20230930-patchy-curdle-ef5ee6e1a17c@spud>
 <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com> <20231002-spearman-doze-70cc026ac13e@spud>
 <693e6584-1e66-48c0-aa7c-61d9f88abd4c@rivosinc.com> <CAP6exYLtQuyqMgG6jRAhizp-52ebu3OLNSXe8a8xvLALYFD3kA@mail.gmail.com>
 <FF617BC9-0FE4-4468-8FF9-06BD8A8115E2@jrtc27.com>
In-Reply-To: <FF617BC9-0FE4-4468-8FF9-06BD8A8115E2@jrtc27.com>
From: ron minnich <rminnich@gmail.com>
Date: Tue, 3 Oct 2023 09:37:51 -0600
Message-ID: <CAP6exYJ2ksVvVbrs3aJjfpEiXuFs82vsMn4d6Wi=LH0PjpeTfA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Evan Green <evan@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Daniel Maslowski <cyrevolt@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_083807_472975_1A5385E4 
X-CRM114-Status: GOOD (  39.68  )
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

V2hpbGUgaXQgaXMgdHJ1ZSB0aGF0IGl0IHZpb2xhdGVzIHRoZSBzcGVjIHRvZGF5LCBnaXZlbiB0
aGUgZmx1aWRpdHkKb2YgdGhlIHNwZWMgb2YgdGhlIGxhc3QgMTAgeWVhcnMsIEknbSBub3Qgc3Vy
ZSB0aGF0IG1hdHRlcnMgOi0pCgpBbnl3YXksIHRoYXQncyBvdXQgb2Ygc2NvcGUgZm9yIHRoaXMg
ZGlzY3Vzc2lvbiwgdGhvdWdoIEkgYXBwcmVjaWF0ZQp5b3VyIGNsYXJpZmljYXRpb24uIEknbGwg
YnJpbmcgaXQgdXAgZWxzZXdoZXJlLgoKQ2xlbWVudCBwb2ludHMgb3V0IHRoYXQgdGhpcyBzZXJp
ZXMgd291bGQgd29yayBmaW5lIGlmIHRoYXQgYml0IHdlcmUKaGFyZHdpcmVkIHRvIDEsIHdoaWNo
IGlzIGFsbCBJIGNhcmUgYWJvdXQuCgp0aGFua3MKCk9uIE1vbiwgT2N0IDIsIDIwMjMgYXQgNDoy
M+KAr1BNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBPbiAy
IE9jdCAyMDIzLCBhdCAxNjozMiwgcm9uIG1pbm5pY2ggPHJtaW5uaWNoQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gVGhpcyB3YXMgYSB2ZXJ5IGludGVyZXN0aW5nIHJlYWQuIE9uZSBvdGhlciB0
aG91Z2h0IGNyb3NzZWQgbXkgbWluZCwKPiA+IHdoaWNoIGlzIHRoYXQgYSBSSVNDLVYgaW1wbGVt
ZW50YXRpb24gbWlnaHQgbWFrZSB0aGUgYWxpZ25tZW50Cj4gPiBkZWxlZ2F0aW9uIGhhcmQtd2ly
ZWQgdG8gYWx3YXlzIGRlbGVnYXRlIHRvIFMgbW9kZS4gSS5lLCB0aGUgYml0IG1pZ2h0Cj4gPiBi
ZSBXQVJMIGFuZCBhbHdheXMgMS4gRm9yIHdoYXQgSSdtIGRvaW5nLCB0aGlzIHdvdWxkIGFjdHVh
bGx5IGJlCj4gPiBwcmV0dHkgY29udmVuaWVudC4gSnVzdCB3YW50IHRvIG1ha2Ugc3VyZSB0aGlz
IGNvZGUgY2FuIGFjY29tbW9kYXRlCj4gPiB0aGF0IC0tIHdkeXQ/Cj4KPiBTdWNoIGFuIGltcGxl
bWVudGF0aW9uIHdvdWxkIHZpb2xhdGUgdGhlIHNwZWM6Cj4KPiAgIEFuIGltcGxlbWVudGF0aW9u
IHNoYWxsIG5vdCBoYXZlIGFueSBiaXRzIG9mIG1lZGVsZWcgYmUgcmVhZC1vbmx5Cj4gICBvbmUs
IGkuZS4sIGFueSBzeW5jaHJvbm91cyB0cmFwIHRoYXQgY2FuIGJlIGRlbGVnYXRlZCBtdXN0IHN1
cHBvcnQgbm90Cj4gICBiZWluZyBkZWxlZ2F0ZWQuCj4KPiBTdXBwb3J0aW5nIHRoYXQgaXMgdGh1
cyBvdXQgb2Ygc2NvcGUuCj4KPiBKZXNzCj4KPiA+IFdlIGhhdmUgZm91bmQgbG90cyBvZiB2YWx1
ZSBpbiBvdXIgZXhwZXJpbWVudHMgd2l0aCBkZWxlZ2F0aW5nCj4gPiBhbGlnbm1lbnQgdHJhcHMg
dG8gTGludXggLS0gbm90IGxlYXN0IGJlY2F1c2UgdGhleSB0ZW5kIHRvIGxvY2F0ZQo+ID4gcHJv
YmxlbXMgaW4gdGhlIGtlcm5lbCA6LSkgLS0gd2UndmUgZm91bmQgaXNzdWVzIGluIG1vZHVsZSBs
b2FkaW5nLAo+ID4gZWFybHkgc3RhcnR1cCAodGhlcmUncyBhIG5lZWRlZCAuYWxpZ24yIGRpcmVj
dGl2ZSBmb3Igc2JpIHNlY29uZGFyeQo+ID4gc3RhcnR1cCwgQUZBSUNUKSBhbmQgdGhlIHRpbWlu
ZyBjb2RlIGZvciBtaXNhbGlnbmVkIGxvYWQvc3RvcmUKPiA+IGhhbmRsaW5nLgo+ID4KPiA+IEkg
ZG9uJ3Qga25vdyBob3cgeW91IHRlc3QgdGhpcyB1bmFsaWduZWQgdHJhcCBoYW5kbGluZywgYnV0
IGl0IG1pZ2h0Cj4gPiBiZSB3b3J0aHdoaWxlIHRvIHdvcmsgdGhhdCBvdXQuIFlvdSBjYW4gdGVz
dCB2aWEgb3JlYm9vdCBhbmQgdGhlCj4gPiB2aXNpb25maXZlMiwgc2F2ZSB3ZSBoYXZlIG5vdCBm
aWd1cmVkIG91dCB3aHkgU01QIHN0YXJ0dXAgaXMgZ29pbmcKPiA+IHdyb25nLCB5ZXQgOi0pLCBz
byB3ZSdyZSBub3QgYXMgZmVhdHVyZS1jb21wbGV0ZSBhcyBuZWVkZWQuIEJ1dCBzb29uLgo+ID4K
PiA+IFRoYW5rcyEKPiA+Cj4gPiBPbiBNb24sIE9jdCAyLCAyMDIzIGF0IDU6MTnigK9BTSBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4KPiA+Pgo+
ID4+IE9uIDAyLzEwLzIwMjMgMTI6NDksIENvbm9yIERvb2xleSB3cm90ZToKPiA+Pj4gT24gTW9u
LCBPY3QgMDIsIDIwMjMgYXQgMDk6NDA6MDRBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3Rl
Ogo+ID4+Pj4KPiA+Pj4+Cj4gPj4+PiBPbiAzMC8wOS8yMDIzIDExOjIzLCBDb25vciBEb29sZXkg
d3JvdGU6Cj4gPj4+Pj4gT24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgMDU6MDM6MDlQTSArMDIwMCwg
Q2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+ID4+Pj4+PiBTaW5jZSBjb21taXQgNjFjYWRiOSAoIlBy
b3ZpZGUgbmV3IGRlc2NyaXB0aW9uIG9mIG1pc2FsaWduZWQgbG9hZC9zdG9yZQo+ID4+Pj4+PiBi
ZWhhdmlvciBjb21wYXRpYmxlIHdpdGggcHJpdmlsZWdlZCBhcmNoaXRlY3R1cmUuIikgaW4gdGhl
IFJJU0MtViBJU0EKPiA+Pj4+Pj4gbWFudWFsLCBpdCBpcyBzdGF0ZWQgdGhhdCBtaXNhbGlnbmVk
IGxvYWQvc3RvcmUgbWlnaHQgbm90IGJlIHN1cHBvcnRlZC4KPiA+Pj4+Pj4gSG93ZXZlciwgdGhl
IFJJU0MtViBrZXJuZWwgdUFCSSBkZXNjcmliZXMgdGhhdCBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFy
ZQo+ID4+Pj4+PiBzdXBwb3J0ZWQuIEluIG9yZGVyIHRvIHN1cHBvcnQgdGhhdCwgdGhpcyBzZXJp
ZXMgYWRkcyBzdXBwb3J0IGZvciBTLW1vZGUKPiA+Pj4+Pj4gaGFuZGxpbmcgb2YgbWlzYWxpZ25l
ZCBhY2Nlc3NlcyBhcyB3ZWxsIHN1cHBvcnQgZm9yIHByY3RsKFBSX1VOQUxJR04pLgo+ID4+Pj4+
Pgo+ID4+Pj4+PiBIYW5kbGluZyBtaXNhbGlnbmVkIGFjY2VzcyBpbiBrZXJuZWwgYWxsb3dzIGZv
ciBhIGZpbmVyIGdyYWluIGNvbnRyb2wKPiA+Pj4+Pj4gb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNz
ZXMgYmVoYXZpb3IsIGFuZCB0aGFua3MgdG8gdGhlIHByY3RsIGNhbGwsIGNhbgo+ID4+Pj4+PiBh
bGxvdyBkaXNhYmxpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgZW11bGF0aW9uIHRvIGdlbmVyYXRlIFNJ
R0JVUy4gVXNlcgo+ID4+Pj4+PiBzcGFjZSBjYW4gdGhlbiBvcHRpbWl6ZSBpdHMgc29mdHdhcmUg
YnkgcmVtb3Zpbmcgc3VjaCBhY2Nlc3MgYmFzZWQgb24KPiA+Pj4+Pj4gU0lHQlVTIGdlbmVyYXRp
b24uCj4gPj4+Pj4+Cj4gPj4+Pj4+IEN1cnJlbnRseSwgdGhpcyBzZXJpZXMgaXMgdXNlZnVsIGZv
ciBwZW9wbGUgdGhhdCB1c2VzIGEgU0JJIHRoYXQgZG9lcwo+ID4+Pj4+PiBub3QgaGFuZGxlZCBt
aXNhbGlnbmVkIHRyYXBzLiBJbiBhIG5lYXIgZnV0dXJlLCB0aGlzIHNlcmllcyB3aWxsIG1ha2UK
PiA+Pj4+Pj4gdXNlIGEgU0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dpbmcgdG8gcmVxdWVzdCBkZWxl
Z2F0aW9uIG9mIHRoZQo+ID4+Pj4+PiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgdHJhcHMgdG8gdGhl
IFMtbW9kZSBzb2Z0d2FyZS4gVGhpcyBleHRlbnNpb24gaGFzCj4gPj4+Pj4+IGJlZW4gc3VibWl0
dGVkIGZvciByZXZpZXcgdG8gdGhlIHJpc2N2IHRlY2gtcHJzIGdyb3VwLiBBbiBPcGVuU0JJCj4g
Pj4+Pj4+IGltcGxlbWVudGF0aW9uIGZvciB0aGlzIHNwZWMgaXMgYXZhaWxhYmxlIGF0IFsyXS4K
PiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhpcyBzZXJpZXMgY2FuIGJlIHRlc3RlZCB1c2luZyB0aGUgc3Bp
a2Ugc2ltdWxhdG9yIFszXSBhbmQgYW4gb3BlblNCSQo+ID4+Pj4+PiB2ZXJzaW9uIFs0XSB3aGlj
aCBhbGxvd3MgdG8gYWx3YXlzIGRlbGVnYXRlIG1pc2FsaWduZWQgbG9hZC9zdG9yZSB0bwo+ID4+
Pj4+PiBTLW1vZGUuCj4gPj4+Pj4KPiA+Pj4+PiBTb21lIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMg
ZG8gbm90IGJ1aWxkIGZvciBhbnkgY29uZmlncywgc29tZSBhcmUKPiA+Pj4+PiBicm9rZW4gZm9y
IGNsYW5nIGJ1aWxkcyBhbmQgb3RoZXJzIGFyZSBicm9rZW4gZm9yIG5vbW11LiBQbGVhc2UgdHJ5
IHRvPiBidWlsZCB0ZXN0IHRoaXMgbW9yZSB0aG9yb3VnaGx5IGJlZm9yZSB5b3Ugc3VibWl0IHRo
ZSBuZXh0IHZlcnNpb24uCj4gPj4+Pgo+ID4+Pj4gSGkgQ29ub3IsCj4gPj4+Pgo+ID4+Pj4gVGhh
bmtzIGZvciB0aGUgZmVlZGJhY2ssIEknbGwgY2hlY2sgdGhhdC4KPiA+Pj4+Cj4gPj4+Pj4KPiA+
Pj4+PiBBbHNvLCBBSVVJLCB0aGlzIHNlcmllcyBzaG91bGQgYmUgbWFya2VkIFJGQyBzaW5jZSB0
aGUgU0JJIGV4dGVuc2lvbgo+ID4+Pj4+IHRoaXMgcmVsaWVzIG9uIGhhcyBub3QgYmVlbiBmcm96
ZW4uCj4gPj4+Pgo+ID4+Pj4gVGhpcyBzZXJpZXMgZG9lcyBub3QgYWN0dWFsbHkgdXNlcyB0aGUg
U0JJIGV4dGVuc2lvbiBidXQgcHJvdmlkZXMgYSB3YXkKPiA+Pj4+IHRvIGRldGVjdCBpZiBtaXNh
bGlnbmVkIGFjY2Vzc2VzIGFyZSBub3QgaGFuZGxlZCBieSBoYXJkd2FyZSBub3IgYnkgdGhlCj4g
Pj4+PiBTQkkuIEl0IGhhcyBiZWVuIHJlcG9ydGVkIGJ5IFJvbiAmIERhbmllbCB0aGV5IHRoZXkg
aGF2ZSBhIG1pbmltYWwgU0JJCj4gPj4+PiBpbXBsZW1lbnRhdGlvbiB0aGF0IGRvZXMgbm90IGhh
bmRsZSBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFuZCB0aGF0IHRoZXkKPiA+Pj4+IHdvdWxkIGxpa2Ug
dG8gbWFrZSB1c2Ugb2YgdGhlIFBSX1NFVF9VTkFMSUdOIGZlYXR1cmUuIFRoaXMgaXMgd2hhdCB0
aGlzCj4gPj4+PiBzZXJpZXMgYWRkcmVzc2VzIChhbmQgdGh1cyBkb2VzIG5vdCBkZXBlbmQgb24g
dGhlIG1lbnRpb25lZCBTQkkgZXh0ZW5zaW9uKS4KPiA+Pj4KPiA+Pj4gQWgsIEkgbXVzdCBoYXZl
IG1pc3JlYWQgdGhlbi4gQXBvbG9naWVzLgo+ID4+Cj4gPj4gTm8gd29ycmllcywgbWF5YmUgSSBz
aG91bGQgYWN0dWFsbHkgcmVtb3ZlIHRoaXMgZnJvbSB0aGUgY292ZXIgbGV0dGVyIHRvCj4gPj4g
YXZvaWQgYW55IGNvbmZ1c2lvbiAhCj4gPj4KPiA+PiBDbMOpbWVudAo+ID4KPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
