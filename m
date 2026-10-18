Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908CDCCA490
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 11:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnuny3RKPum6dSTgSVlFRWNUgReL+vN6M4zhNWMYyzI=; b=QUNtgmf0xB9e8d
	/33oimpF3USFPuPaHfgDAMZJnYVSyRoANVts6p0VpMI0yrFEngM/NHiE6kb9kVQ1easpL/WPvAscJ
	TIDLFfj1veTCywUiWDwwRgFP7CssLnnGMmucmYwLgurwyB+T0Tz8GneIs7IIIgwOGJxwH7PR+ldGF
	x05Ws0urtCaPfKZ6+uAuyFPD6hSWiYufxUhRt24hrVWuzlsP80H+KsR6xhHgGhQyulN/arUMRLrLO
	uKOgvxw0EUTV6ecvUdAFmhZ0P/gAjNkXbi/kuHMaCwD+YfHdT6ZgE6DxvGM0kUdAkwWf6DqILzOSb
	nU7egshY0uLd7z8h97wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIP2M-00000005nMV-0U5S;
	Sun, 18 Oct 2026 11:26:46 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIP2J-00000005nM8-1sDD
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 11:26:44 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-8a83d2706fdso7962487b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Oct 2026 04:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792322802; cv=none;
        d=google.com; s=arc-20260327;
        b=Nd4J0hcrSD5tFZgZ+oJ+DFf5VICBQ6MmbXL4YfHDraONnUOHcn/AtN5jDRkUIabHCk
         4S8NhZGJCdJvB+ma3lmD+B8yfbcAvyaIGgUz+s40d2WCjdP9fW3ojhkTpU3SpmmzJGJd
         KgjfWjcQAiKm/5koc92W/ZYwhdikK9F/NmXbxmpm0bJ7dWndOMtAG4MmRNpr2MHoWEoZ
         hqNRh7QNmh/P6A4J/HLWBFly43tCcZ1jx2TlnrNMVMgGcA2CoRwHjHQPPkwssPHzloFX
         o0giNRVOWKsC1MydhW3ldpNbEOczCbCt6Jv2KtRJB5P5zRENgOnfWW1CRLaA+coo+06W
         5OVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NhzoLDMF9fIYZAWZHTa2hSuGikJ44i2nkFzcvTVosrg=;
        fh=B18ncoG7A7pWM6GQDutMZxy9jhqz2toQBxwIGmgXSxk=;
        b=U1VC3s693gdgw2NZzWj1niQMuMmik7eMUTp82Kd5ztfjAYWEmTZHdUyLHS9/YEgYnv
         BIrzbe6HtWn2Y8/YQ1HDmbtR2EuuGcGTy2lhlDSig5YD5m7b+oNoTB/HsdG40I42/dED
         frWX5BK95ejOkT3mge6CYoRJkibOJoQ+qD3z++LjaEJQZ6qBuwLgFcgruu6LIBaWePjk
         LSJMTAQqrSldgYVTMVDu1YEn0MC8Rp9OQoq5MJmzs42efAt3noO8N/w18n5Ow9x+YYtO
         bo1XD2hd4AIQ+ejwXWiEQ0+Zoi4dBbW3loQzwr+PQokim4zFUoks4/1vl9PqKPc/30Ni
         zMew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322802; x=1792927602; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NhzoLDMF9fIYZAWZHTa2hSuGikJ44i2nkFzcvTVosrg=;
        b=IGP8VfExWY+DOrJxCuwjAsE3uzel3x06J6NLl93pJ7QWhmNVkny13JfABKpF2xyj93
         O6rx5/NmpGSbWDjeneIK7T5sRRL39sSpiPo2EYlcG88XdI590LroeKAdGFvnVNrmN1i5
         X9YQ4rHDLyDhd80FHcWxU0CJT0GFJAEjbI8t2FYAenofRFaXnwBRIaU7Roy5z1+2+FpZ
         SX3cUgWD8/xXfbe5SeTWuJNmq+E7nZfxFBxhKuaYwNiY1JDh+luhYyULIhPgj3aDClGF
         zlTeyaWR9VDDfs7S5jyhIvvp0Eps5A1OKkXfcfjIkhEX6POWEzyxQuS7fASUZIQSq9UU
         /brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322802; x=1792927602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhzoLDMF9fIYZAWZHTa2hSuGikJ44i2nkFzcvTVosrg=;
        b=FF8LznYXg3MpaIe9YiKeBm8eh1B0fDaNediV0jcTRYVz4Wg31IeWFK3wo9e95rrJOe
         LEutKqeVYrNOvRYgPt6/gFWxIQlpOnU00rklz4LMcAHrXWIn/SYqmf748OTQI20eFeR5
         29iLhnHEFqL9zNOpAyr6i+c6syMSAHt85s5nD6wlYhnK0O+JU8lssnFls4xYbWO11v+N
         xg3HoOC8xMar/6eq33PVuz9mIW8+Og+cmXqAVYWws89fXrMyx+K3nZSfMRfLT8m4JpRd
         8MLQFthASKDvz4VIF2OssEGZthiCHhFr4P0YL6JwQY6couvTvV+RBR0P3Dycc7sGTPun
         8JFg==
X-Forwarded-Encrypted: i=1; AKwUvBwRPYWN+Wv2u4KAQzHnz5Es7qKwGIs9PPWUFKHx6C+ZKrajHfI0HEIFp8Y5myIUVTIAzeqSRvTEpPkdGw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKIIHCieSjAFkoBAFbWPsH7XOGyqka5LUMRjPSzcka1Wpv8onXQ
	YXE9ESGSjyrnv/TS/YM53uLTpjT825Ua3U+SmdBvnAFztaf06BjRNtWFVYrlPAPdvywu40PZRO4
	hfP63otfmUBDDsNIWUrtUeOAuTx3Qgfo=
X-Gm-Gg: AYBFou3PZmlbGHC+BZ+oF8qqIqFtQM7SAZ9Z9Vnob5cqO+zr/T+UC0sVP3+73SC4p9p
	NHbh461ZhY1Aq5TQiNB96lwrd9e1tdn8uIbNII6JAIDceS0K3QopW0c9ZsTgQnBoWkq8budxhnG
	zTERsUDqLXxGfqwQl6e2Fwi02FdgVBoUYPx3bDvPE+PQnWMBMUzIi1rfEFlQonEqhK/Of2z9uSF
	FpvLPcJvRxYqDFVoWwtV9eMOaq8HPEn08QjvEEYuGi/g6QXah9Gnw4zohjMJT4zB5MFocifUW3k
	dOuUs51qFjA8ukBbHshZlm7wAM14EE3lUqLapkXgMtxVsr+lKFkpC2gr7+/Kp904hQ==
X-Received: by 2002:a05:690c:61c4:b0:8ab:43f7:f058 with SMTP id
 00721157ae682-8b0f220ed99mr12799007b3.107.1792322802028; Sun, 18 Oct 2026
 04:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com>
 <20261016103846.73ff2980@gandalf.local.home> <CALsPMBMeXHd1TN89bHCtS3G0M8MFiimf8w=qKayxuYCad8v_Gw@mail.gmail.com>
In-Reply-To: <CALsPMBMeXHd1TN89bHCtS3G0M8MFiimf8w=qKayxuYCad8v_Gw@mail.gmail.com>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sun, 18 Oct 2026 13:26:31 +0200
X-Gm-Features: AclHuK_Bu-XBvleBAPZGj2NXrLZoPlWgyD8jpOn4PYJbzTp9oCFNZXr4st981AQ
Message-ID: <CALsPMBN6dii8mQNf=fxwBhcBGvs_Xr+7_fr=F3GTtp5Rwi8xGQ@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: mm: Trace TLB flush requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_042643_507173_B3C3E650 
X-CRM114-Status: GOOD (  18.52  )
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

T24gU2F0LCBPY3QgMTcsIDIwMjYgYXQgNDowM+KAr1BNIFJvbWFuIFN0b3JvemhlbmtvCjxyb21l
dXNtZWlzdGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE9jdCAxNiwgMjAyNiBhdCA0
OjM44oCvUE0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+IHdyb3RlOgo+ID4K
PiA+Cj4gPiBbCj4gPiAgIEkgcmVhbGl6ZWQgSSByZXBsaWVkIHRvIHYyIGFuZCBub3QgdjQgYXMg
dGhlIHRocmVhZCBvZiB2MiBwdXNoZWQgdGhhdCB0bwo+ID4gICB0aGUgdG9wLiBJJ2xsIHJlcGVh
dCBteSBzdGF0ZW1lbnQgaGVyZSB0b28uCj4gPiBdCj4gPgo+ID4gT24gVGh1LCAxNSBPY3QgMjAy
NiAxOTozMjozNCArMDIwMAo+ID4gUm9tYW4gJ0hlZGluJyBTdG9yb3poZW5rbyA8cm9tZXVzbWVp
c3RlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHJh
Y2UvZXZlbnRzL3Jpc2N2X3RsYi5oIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvcmlzY3ZfdGxiLmgK
PiA+Cj4gPiBQbGVhc2UgZG8gbm90IHB1dCBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZXZlbnRzIGlu
IGluY2x1ZGUvdHJhY2UuCj4gPgo+ID4gVGhleSBiZWxvbmcgaW4gdGhlIGFyY2hpdGVjdHVyZS4K
PiA+Cj4gPiBTZWUgdGhlIGV4YW1wbGUgY29kZSBpbiBzYW1wbGVzL3RyYWNlX2V2ZW50cy90cmFj
ZS1ldmVudHMtc2FtcGxlLltjaF0KPiA+IGFzIHdlbGwgYXMgdGhlIE1ha2VmaWxlIHRoZXJlIG9u
IGhvdyB0byBwdXQgdHJhY2UgZXZlbnRzIGluIGRpcmVjdG9yaWVzCj4gPiBvdXRzaWRlIG9mIGlu
Y2x1ZGUvdHJhY2UvCj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+IC0tIFN0ZXZlCj4gPgo+Cj4gSGkg
U3RldmUsCj4KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuCj4KPiBJJ3ZlIG1vdmVkIHRoZSB0cmFj
ZSBldmVudCBkZWZpbml0aW9uIHRvCj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9yaXNjdl90bGIu
aCBpbiB2NSwgZm9sbG93aW5nIHRoZSBleGlzdGluZwo+IFJJU0MtViB0cmFjZXBvaW50IGNvbnZl
bnRpb24uCj4KPiBUaGUgdXBkYXRlZCBwYXRjaCBpcyBhdmFpbGFibGUgaGVyZToKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MTAxNy10bGJfdHJhY2Vwb2ludC12NS0x
LTI1NmZiNTM5M2E3ZkBnbWFpbC5jb20vCj4KPiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0
LgoKSGkgU3RldmUsCgpBIHF1aWNrIHVwZGF0ZTogSSd2ZSBwb3N0ZWQgdjYgd2l0aCBhbiBhZGRp
dGlvbmFsIGZpeCBmb3IKdGhlIGFsaWdubWVudCBvZiB0aGUgZHluYW1pY2FsbHkgc3RvcmVkIENQ
VSBtYXNrLgoKVGhlIHRyYWNlIGV2ZW50IGRlZmluaXRpb24gcmVtYWlucyB1bmRlcgphcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Jpc2N2X3RsYi5oLCBhcyBpbiB2NS4KClRoZSB1cGRhdGVkIHBhdGNo
IGlzIGF2YWlsYWJsZSBoZXJlOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3Yv
MjAyNjEwMTgtdGxiX3RyYWNlcG9pbnQtdjYtMS0xNDQ3NjQyNzg3MGZAZ21haWwuY29tL1QvI3UK
Cj4gLS0KPiBLaW5kIHJlZ2FyZHMsCj4gUm9tYW4gJ0hlZGluJyBTdG9yb3poZW5rbwoKLS0gCktp
bmQgcmVnYXJkcywKUm9tYW4gJ0hlZGluJyBTdG9yb3poZW5rbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
