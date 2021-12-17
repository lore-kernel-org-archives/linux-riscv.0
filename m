Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2304FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QGrfeJx+/yIytPaykxI5NBUFq+nlc9aDiut2rp5Gdfs=; b=Ojdq/Mth6PLe/JM1YpYVyOxSs+
	GPbbT2pZCy7VUkcfdn1xiNVsvBW7yW/KEA3FQMhZ6q5oOjJqmhxaK7Qu8EKlMYfSxudIE2C+pqYll
	nPMkvhu79AZvMxfD5GkqYAPxBimIn20+KZ7nK6gUOKDP2mEnkPX1LquDoQpgqcQMEyE5p9NLrLtAM
	BLL+BZXPhn2TURwFyr7SCg6/88S9fJf5sKxDLMmEzStZoYxcj5A719DfG1pVXaeOO8/aiy8xh9t6k
	f6Q2H1qDN1fhrVeBET0/jgYNAIw/yp7g8iZkvIQP4LKXk5jXF5kyH8w9Kb5hqiPhFkOgzjyaPzr5y
	QZlVxanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myIJ7-00Bzt8-2m; Fri, 17 Dec 2021 18:50:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myI5D-00BtKt-BM
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 18:35:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id q17so2564166plr.11
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 10:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RfxHFpZlqmWmrOhX0SjTdet5aAn/GTXiRTdFAF3tpYc=;
 b=yiSdDzJy9t3MFVNvLefD1QaSkWAgSg9kAqDILstEXGo211Dy9ErJtv8lNLZvexjSTR
 3CJzGfexnMQ9AAUAqJ5BHKADLhNF6alDqA8WY0eSchMVCUamBSIwcDj2E3wFNDhSytp6
 jvqhR1NiHuKNO7Y9BcFTojEX50NQtaaASJLmDdveB3G/afhkWoIJ4RFrjIRtqq1gkxJy
 jq5Psn6et0he6rj0J5oq80XViS/5uaqREOeDidCXq1UNX49R9Zt9M52fm4SdCHkelkrs
 VpbZ4ZRzrNzrm3O26cXcJUnI+cKVII7kqfbnrgCMLvdepGucKGWJ8HamPrcmpPrcU3d8
 y4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RfxHFpZlqmWmrOhX0SjTdet5aAn/GTXiRTdFAF3tpYc=;
 b=Ug52KMU8rFSBTw9nprYQ1Er8T0uIW85lZf/B49QEjCRvGnKc/wCORrXvWmUL+aLjjQ
 M/Ya1ZjKAADQj734x9I9fOU9eV1ylyf30ubkyGFzO/UvfKgxVMGmQx1NDARGeZF5zsoz
 oZxdm17gQ3QHDrhlPooi1xIiMtrnhrPXhpNUpn79MkcB///u8F2qne7F2ueEB+ECCt4a
 LW9ln+pfHmNcKqUTVqc0ypMyKImp/1yuI9zvUgCSY24GNG/jkZdB3Z/D2O3AyH8mNb1e
 R5npRQulFlg16gWdVCSqkD41wagCQ1suKdWBX0ihqM7Ru/z4QCuhYCDU9BYs+4dBkzaj
 mrFg==
X-Gm-Message-State: AOAM533SZhqpU/1B4XUwGCDn5DXsYjo1QGus33PRj1T91cK/tT5Zhdkk
 URj4DAhORE/Am477QnQ7WLVtTVBmgCW0Jw==
X-Google-Smtp-Source: ABdhPJxkJbjeR0+y6x9OUMjUg99fl6xT5+a06/VihxboH47Qaux5H75KbE/JVWhizbVkzidNnpgYfA==
X-Received: by 2002:a17:90b:314b:: with SMTP id
 ip11mr13325893pjb.133.1639766153894; 
 Fri, 17 Dec 2021 10:35:53 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id m3sm8856760pgj.25.2021.12.17.10.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 10:35:53 -0800 (PST)
Date: Fri, 17 Dec 2021 10:35:53 -0800 (PST)
X-Google-Original-Date: Fri, 17 Dec 2021 10:35:27 PST (-0800)
Subject: Re: [PATCH 1/1] riscv: default to CONFIG_RISCV_SBI_V01=n
In-Reply-To: <CAAhSdy3CXJAieR3toyhQtk07CiCkUkmK7hB1DiQ5Wrd7JCqcmA@mail.gmail.com>
CC: heinrich.schuchardt@canonical.com, atishp@atishpatra.org, jrtc27@jrtc27.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-5c40ae0c-64e1-4fdb-8203-8a6e142724a6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_103555_498672_14564028 
X-CRM114-Status: GOOD (  28.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNyBEZWMgMjAyMSAwNDowOToyMiBQU1QgKC0wODAwKSwgYW51cEBicmFpbmZhdWx0
Lm9yZyB3cm90ZToKPiArQXRpc2gKPgo+IE9uIEZyaSwgRGVjIDE3LCAyMDIxIGF0IDQ6MTIgUE0g
SGVpbnJpY2ggU2NodWNoYXJkdAo+IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+
IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiAxMi8xNi8yMSAxNzo1MSwgSmVzc2ljYSBDbGFya2Ugd3Jv
dGU6Cj4+ID4gT24gMTYgRGVjIDIwMjEsIGF0IDE0OjE3LCBIZWlucmljaCBTY2h1Y2hhcmR0IDxo
ZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+PiBPbiAx
Mi8xNi8yMSAxNDo0OSwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4+ID4+PiBPbiAxNiBEZWMgMjAy
MSwgYXQgMTI6MzUsIEhlaW5yaWNoIFNjaHVjaGFyZHQgPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fu
b25pY2FsLmNvbT4gd3JvdGU6Cj4+ID4+Pj4KPj4gPj4+PiBUaGUgU0JJIDAuMSBzcGVjaWZpY2F0
aW9uIGlzIG9ic29sZXRlLiBUaGUgY3VycmVudCB2ZXJzaW9uIGlzIDAuMy4KPj4gPj4+PiBIZW5j
ZSB3ZSBzaG91bGQgbm90IHJlbHkgYnkgZGVmYXVsdCBvbiBTQkkgMC4xIGJlaW5nIGltcGxlbWVu
dGVkLgo+PiA+Pj4gSXTigJlzIHdoYXQgQkJMIGltcGxlbWVudHMsIGFuZCBzb21lIHBlb3BsZSBh
cmUgc3RpbGwgdXNpbmcgaXQsCj4+ID4+PiBlc3BlY2lhbGx5IGdpdmVuIGVhcmx5IGhhcmR3YXJl
IHNoaXBwZWQgYmVmb3JlIE9wZW5TQkkgZ3JldyBpbgo+PiA+Pj4gcG9wdWxhcml0eS4KPj4gPj4+
IEplc3MKPj4gPj4KPj4gPj4gRG8geW91IG1lYW4gQkJMIGlzIG5vdCBkZXZlbG9wZWQgYW55bW9y
ZT8KPj4gPj4KPj4gPj4gU29tZSBwZW9wbGUgbWF5IHN0aWxsIGJlIHVzaW5nIGEgMC4xIFNCSS4g
QnV0IHRoYXQgbWlub3JpdHkgc3R1Y2sgb24gYW4gb3V0ZGF0ZWQgc29mdHdhcmUgc3RhY2sgZG9l
cyBub3QganVzdGlmeSBkZWZhdWx0aW5nIHRvIGRlcHJlY2F0ZWQgc2V0dGluZ3MgaW4gZnV0dXJl
IExpbnV4IHJlbGVhc2VzLgo+PiA+Cj4+ID4gQkJMIGlzIHN0aWxsIGFjdGl2ZWx5IG1haW50YWlu
ZWQ7IGl0cyBtb3N0IHJlY2VudCBjb21taXQgd2FzIDI0IGRheXMKPj4gPiBhZ28uIEFsc28sIHRo
ZSBhbW91bnQgb2YgY29kZSBDT05GSUdfUklTQ1ZfU0JJX1YwMSBhZmZlY3RzIGlzIHRpbnksIHNv
Cj4+ID4gSSBzZWUgbm8gdGFuZ2libGUgYmVuZWZpdCBmcm9tIG1ha2luZyB0aGlzIGNoYW5nZSwg
anVzdCB1bm5lY2Vzc2FyeQo+PiA+IGJyZWFrYWdlIG9mIHBlcmZlY3RseSBmdW5jdGlvbmFsIHN5
c3RlbXMuCj4+Cj4+IE9ubHkgdGhlIGRlZmF1bHQgaXMgY2hhbmdlZC4gSG93IGNvdWxkIHRoaXMg
YnJlYWsgYW55IGV4aXN0aW5nIHN5c3RlbT8KPj4gWW91IGNhbiBzdGlsbCBjb21waWxlIHdpdGgg
dGhlIGRlcHJlY2F0ZWQgc2V0dGluZy4KPj4KPj4gSSBjYW4gbm90IHNlZSB3aHkgd2Ugc2hvdWxk
IGtlZXAgYSBkZWZhdWx0IHRoYXQgd2lsbCBjYXVzZSBpc3N1ZXMgb24KPj4gc3lzdGVtcyBjb21w
bHlpbmcgdG8gdGhlIGN1cnJlbnQgU0JJIHNwZWNpZmljYXRpb24uCj4KPiBJIGFncmVlIHdpdGgg
SGVpbnJpY2guCj4KPiBBbG1vc3QgYWxsIFNCSSBpbXBsZW1lbnRhdGlvbnMgKE9wZW5TQkksIEVE
SzIsIEtWTSwgWHZpc29yLCBldGMpIGFyZQo+IHByb3ZpZGluZyBhdCBsZWFzdCBTQkkgdjAuMiBh
bmQgd2UgY2FuJ3QgZW5kbGVzc2x5IHdhaXQgZm9yIEJCTCB0byBtb3ZlCj4gYXdheSBmcm9tIFNC
SSB2MC4xLiBXZSBjYW4ndCB0b3RhbGx5IHJlbW92ZSBTQkkgdjAuMSBidXQgd2Ugc2hvdWxkCj4g
YXQgbGVhc3QgZGlzYWJsZSBpdCBieSBkZWZhdWx0Lgo+Cj4gU2FtZSByYXRpb25hbGUgYXBwbGll
cyB0byB0aGUgc3BpbndhaXQgQ1BVIG9wZXJhdGlvbnMgd2hpY2ggYXJlIG9ubHkKPiByZXF1aXJl
ZCBmb3Igc3lzdGVtcyB1c2luZyBCQkwuIFRoZSBzcGFyc2UgSEFSVCBpZCBzZXJpZXMgZnJvbSBB
dGlzaAo+IGNhbiBpbmNsdWRlIGEgcGF0Y2ggdG8gaGF2ZSBzcGlud2FpdCBDUFUgb3BlcmF0aW9u
cyBkaXNhYmxlZCBieQo+IGRlZmF1bHQuCj4KPiBAQXRpc2gvUGFsbWVyLCB3aGF0IGRvIHlvdSB0
aGluayA/CgpJIGFncmVlIHdpdGggSGVpbnJpY2g6IGl0J3MganVzdCBhIGRlZmNvbmZpZyBjaGFu
Z2UsIHdlJ3JlIG5vdCBkcm9wcGluZyAKc3VwcG9ydCBmb3IgU0JJLTAuMS4gIFRoZSBkZWZjb25m
aWcgaXMgZ2VuZXJhbGx5IG1lYW50IHRvIHJlZmxlY3Qgd2hhdCAKa2VybmVsIGRldmVsb3BlcnMg
YXJlIHVzaW5nLCBhbmQgQUZBSUsgZXZlcnlvbmUgZG9pbmcgdXBzdHJlYW0gCmRldmVsb3BtZW50
IG1vdmVkIG9mZiB0aGUgbGVnYWN5IFNCSSBpbXBsZW1lbnRhdGlvbnMgYXMgb2YgYSB3aGlsZSBh
Z28uICAKVGhlcmUncyBzb21lIGNvc3QgYXNzb2NpYXRlZCB3aXRoIHN1cHBvcnRpbmcgdGhlIG9s
ZCBTQkksIGl0J3Mgbm90IGxpa2UgCnRoaXMgaXMganVzdCBzb21lIGJhY2t1cCBjYWxscyB3ZSdy
ZSBhZGRpbmcuCgpJZiB2ZW5kb3JzIGFyZSBzdGlsbCBzaGlwcGluZyBvbGQgZmlybXdhcmVzIGFz
IHBhcnQgb2YgdGhlaXIgU0RLcyB0aGF0J3MgCmZpbmUsIHRoZXknbGwganVzdCBuZWVkIHRvIGZs
aXAgb24gc3VwcG9ydCBmb3IgaXQgaW4gdGhlaXIgY29uZmlncy4gIFdobyAKa25vd3MsIG1heWJl
IHRoaXMgd2lsbCBldmVuIGJlIHRoZSBudWRnZSB0aGV5IG5lZWQgdG8gc3RvcCBzaGlwcGluZyAK
YW5jaWVudCBmaXJtd2FyZSA7KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
