Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC992CAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 02:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxydtpedjRzTtsAxZUoGpMSiZhI2wqGTSl3fquOOakw=; b=Lca+vxpqM1WgCN
	bWaZK2yhOs8hm0jXsr0+yzZrUOdAJN7hFWqIvor2G1jW01SsLQNRgUMOyB9uU24eZR1YcY6fJBsM5
	Wq4mYmNjK0l5WrTbKTIy+FUvgQfN1g+UBLy84gSzKOxe0ZRq10Q/T6pOo525UTEzDxs4xsZhCG+Y4
	f7WMJPicxR9nYBLSA2Iq56iPmmREPGIbG+MWxL8WlLtxq0PHyJZLAJJ++WL+oXL06moqnh9hE+417
	5jug4Zz7diaEORzfBsYh7IgThJFPI3SulZGwTm3BYY4xNy4SpgIHrCofacIErZfTbd05eXyDx6rEB
	mLrPa2Y4BbOTKsORe0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sZ4-0000000C7hp-22CL;
	Tue, 23 Sep 2025 02:15:34 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sZ1-0000000C7hB-3qyB
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 02:15:33 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-30cceb3be82so4305305fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 19:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758593730; x=1759198530; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eQH+Q/BQXEhgQYu1pd1EXuK3o31quj91cNDcQrzCl8=;
        b=Pr1VvCtWDfcC5Fjr2Rn1Qr4PDayEjaRBczm0Q23usQs1pFDiiyY0X83o+/s47Y4J3G
         UFzQovliQY8cELPLwUhOif8zMEoEGvZX3ZMu76CIyONzqnWiGOQeYtISin60Pr2pHCKv
         KAhQj5idgFgjYxtpACDcBz/ZFOGODoeuUt3LemIyCXP2YeA1UltKuaMab/zerFWCSs9H
         MC0v0+pO3Va0R1/X0gtMzFmFG8902FhbDV1mMcwa3VQDtr50YwaM0JRzxrfKANwcfdQ8
         sM7LYUDkJ2nzPZ87R/4DTg5xehBgLG7F8IP2DUC3foJi77CpOiNeNMyrXNiRSIlW30EJ
         30WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758593730; x=1759198530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eQH+Q/BQXEhgQYu1pd1EXuK3o31quj91cNDcQrzCl8=;
        b=WA++pePP0PjHTX7C1Fiv89JbIYw/GKpLi20H9StbunMhmHa0Q/yhoK95AUK0krNd07
         WlRJLV7rJsjvPxu7yfsuhieoAPqLgD4R03/Yn20XzYj1rIyU4XWGSUdY3XsLUMzFUzlv
         I1/ewfJ3TSF9S2A3KJp9nmRwwVk2rSEJwcAoDOCwJtm8DBYy+t9nl0xvjKTdJF6bVSJm
         PqXuat+pPUBgUXi2aKIszbzWjbYCmTxMHR80NwZwFQ3RSbgseT8/pzSqPiEXbl5iFuAS
         /IywzQjDGqy7Bz6DMFztJIXA7zW2AYLx31kXFCEztdbf2/6nOvygq+d9JAv3ZKRRhYDq
         Pa6w==
X-Forwarded-Encrypted: i=1; AJvYcCU/Q4NBZtxWPdm4CONzI9axqUZwheOStqC+DfmLyvfuuI/yCyBEg3+pn3HBQgEhCttuHVyozbBzGkerHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWg/NDHEK+XY4pPaark1i3ayeBIXd49SxUr8+EtNZavBSL3k6U
	nsdKbBrtI60JPVqxJBBzn8nVElCN7TK8krPhjFoj8gIx04yaYmMINCxw9887FOgFBI7IlxjajNH
	BSpo03nH4GErDr7t/EiLQWhP7+TjXzNM17BgUok9Gow==
X-Gm-Gg: ASbGnctN8440Nqk8Kle6fgyZzdmgIXFhFyDvEE6QemXBg+Y6G5G7P5QFT59MwHNx2PX
	NkrUAvcR5mW3L/lfsfH8e44Hi/uwqnLVFpT4BycEsXrhmI1EgwH1IY/qUizicpa0vy0CI1zw9gI
	6+gkLWDsFy4//QOLorQERACL8p+MEdLStdISQMZXxJ7DnQ8Jt/bZY8Koni88vJ/MaTtHqoERY1l
	sTQlf2jgc24Z+B2hq9N
X-Google-Smtp-Source: AGHT+IFo8K2nq2pvsFZGvxQ/MRgGmpmKRhgup8ijbEKRYusV/i24RmK6pHRHQfH8m8ZyulD9ZJHlbp9bEZu7JmN9zoM=
X-Received: by 2002:a05:6871:2b0c:b0:331:15b8:807 with SMTP id
 586e51a60fabf-34c88354f2bmr555585fac.41.1758593729902; Mon, 22 Sep 2025
 19:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
 <20250919070048.94646-2-cuiyunhui@bytedance.com> <ae93899e-372e-425a-ae23-deb4bbab3eeb@rivosinc.com>
 <CAEEQ3wkpNwE14o7cLvf-cXc8xWy-s7_p_5-nShJaadqz6kVnBg@mail.gmail.com>
 <CAEEQ3w=g_-y6AoGYcGLOow6eOd6zX1D6JXyHerortX=VYp1B8g@mail.gmail.com>
 <CAAhSdy3ioaOBxO++XBBWfx9RRH-7BJQDLR0q6sSEr2m8W2cdwg@mail.gmail.com>
 <CAEEQ3wmDFfmbr0fGxNUOX16p0b5zeR8bKTDTePuCFPYaKOyuqg@mail.gmail.com> <CAHBxVyHgdm4amuicRB26Cy-vVd8wCB-YWt5gQW7yh_Bp7fEDhg@mail.gmail.com>
In-Reply-To: <CAHBxVyHgdm4amuicRB26Cy-vVd8wCB-YWt5gQW7yh_Bp7fEDhg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 23 Sep 2025 10:15:18 +0800
X-Gm-Features: AS18NWAaYvaC1hGOJAAqFL22W54c1XHylEK_8p3Zuj7EoyToUMrdjOWGjkTsL6c
Message-ID: <CAEEQ3wm0fmWcyKU8r9d=kpZY4QkGgqwmQzVMBcYJ2pu-aRGSvg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RFC 1/1] drivers: firmware: riscv: add
 unknown NMI support
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, conor@kernel.org, ajones@ventanamicro.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_191532_251454_76139167 
X-CRM114-Status: GOOD (  40.63  )
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

SGkgQXRpc2gsCgpPbiBUdWUsIFNlcCAyMywgMjAyNSBhdCAxOjIw4oCvQU0gQXRpc2ggS3VtYXIg
UGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgMjIsIDIw
MjUgYXQgNDo1OOKAr0FNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90
ZToKPiA+Cj4gPiBIaSBBbnVwLAo+ID4KPiA+IE9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDY6NDDi
gK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTo0MuKAr1BNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIENsw6ltZW50LAo+ID4gPiA+
Cj4gPiA+ID4gT24gRnJpLCBTZXAgMTksIDIwMjUgYXQgMzo1MuKAr1BNIHl1bmh1aSBjdWkgPGN1
aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSBDbMOp
bWVudCwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBGcmksIFNlcCAxOSwgMjAyNSBhdCAzOjE44oCv
UE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gMTkvMDkvMjAyNSAwOTow
MCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+ID4gPiA+ID4gPiBVbmtub3duIE5NSSBjYW4gZm9yY2Ug
dGhlIGtlcm5lbCB0byByZXNwb25kIChlLmcuLCBwYW5pYykgd2hlbiB0aGUKPiA+ID4gPiA+ID4g
PiBzeXN0ZW0gZW5jb3VudGVycyB1bnJlY29nbml6ZWQgY3JpdGljYWwgaGFyZHdhcmUgZXZlbnRz
LCBhaWRpbmcgaW4KPiA+ID4gPiA+ID4gPiB0cm91Ymxlc2hvb3Rpbmcgc3lzdGVtIGZhdWx0cy4g
VGhpcyBpcyBpbXBsZW1lbnRlZCB2aWEgdGhlIFN1cGVydmlzb3IKPiA+ID4gPiA+ID4gPiBTb2Z0
d2FyZSBFdmVudHMgKFNTRSkgZnJhbWV3b3JrLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+
ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgg
ICAgIHwgIDEgKwo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcg
ICB8IDEwICsrKysrCj4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZp
bGUgIHwgIDEgKwo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3NzZV9ubWku
YyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiA+ID4gIDQg
ZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9zc2Vfbm1pLmMKPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gPiA+ID4gPiA+IGluZGV4IDg3NGNjMWQ3
NjAzYTUuLjU4MDFmOTBhODhmNjIgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmgKPiA+ID4gPiA+ID4gPiBAQCAtNDgxLDYgKzQ4MSw3IEBAIGVudW0gc2JpX3Nz
ZV9hdHRyX2lkIHsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAjZGVmaW5lIFNCSV9TU0Vf
RVZFTlRfTE9DQUxfSElHSF9QUklPX1JBUyAgICAweDAwMDAwMDAwCj4gPiA+ID4gPiA+ID4gICNk
ZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9ET1VCTEVfVFJBUCAgICAgICAgICAgICAgMHgwMDAw
MDAwMQo+ID4gPiA+ID4gPiA+ICsjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfVU5LTk9XTl9O
TUkgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBXYXMgdGhpcyBzdWJtaXR0ZWQgdG8gdGhlIFBSUyBXRyA/IFRoaXMgYSBzcGVjaWZpY2F0aW9u
IG1vZGlmaWNhdGlvbiBzbwo+ID4gPiA+ID4gPiBpdCBzaG91bGQgZ28gdGhyb3VnaCB0aGUgdXN1
YWwgcHJvY2Vzcy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgI2RlZmluZSBTQklfU1NFX0VW
RU5UX0dMT0JBTF9ISUdIX1BSSU9fUkFTICAgMHgwMDAwODAwMAo+ID4gPiA+ID4gPiA+ICAjZGVm
aW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUE1VX09WRVJGTE9XICAgICAweDAwMDEwMDAwCj4gPiA+
ID4gPiA+ID4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9MT1dfUFJJT19SQVMgICAgIDB4
MDAxMDAwMDAKPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNj
di9LY29uZmlnIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnCj4gPiA+ID4gPiA+ID4g
aW5kZXggZWQ1YjY2M2FjNWY5MS4uNzQ2YmFjODYyYWM0NiAxMDA2NDQKPiA+ID4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcKPiA+ID4gPiA+ID4gPiArKysgYi9k
cml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcKPiA+ID4gPiA+ID4gPiBAQCAtMTIsNCArMTIs
MTQgQEAgY29uZmlnIFJJU0NWX1NCSV9TU0UKPiA+ID4gPiA+ID4gPiAgICAgICAgIHRoaXMgb3B0
aW9uIHByb3ZpZGVzIHN1cHBvcnQgdG8gcmVnaXN0ZXIgY2FsbGJhY2tzIG9uIHNwZWNpZmljIFNT
RQo+ID4gPiA+ID4gPiA+ICAgICAgICAgZXZlbnRzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gK2NvbmZpZyBSSVNDVl9TU0VfVU5LTk9XTl9OTUkKPiA+ID4gPiA+ID4gPiArICAgICBib29s
ICJFbmFibGUgU0JJIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIHVua25vd24gTk1JIHN1cHBv
cnQiCj4gPiA+ID4gPiA+ID4gKyAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQklfU1NFCj4gPiA+ID4g
PiA+ID4gKyAgICAgZGVmYXVsdCB5Cj4gPiA+ID4gPiA+ID4gKyAgICAgaGVscAo+ID4gPiA+ID4g
PiA+ICsgICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciBkZWxpdmVyaW5nIHVu
a25vd24gTm9uLU1hc2thYmxlIEludGVycnVwdCAoTk1JKQo+ID4gPiA+ID4gPiA+ICsgICAgICAg
bm90aWZpY2F0aW9ucyB2aWEgdGhlIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIChTU0UpIGZy
YW1ld29yay4gV2hlbiBlbmFibGVkLAo+ID4gPiA+ID4gPiA+ICsgICAgICAgdW5rbm93biBOTUlz
IGNhbiB0cmlnZ2VyIGtlcm5lbCByZXNwb25zZXMgKGUuZy4sIHBhbmljKSBmb3IgdW5yZWNvZ25p
emVkIGNyaXRpY2FsCj4gPiA+ID4gPiA+ID4gKyAgICAgICBoYXJkd2FyZSBldmVudHMsIGFpZGlu
ZyBpbiBzeXN0ZW0gZmF1bHQgZGlhZ25vc2lzLgo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiAgZW5kbWVudQo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jp
c2N2L01ha2VmaWxlIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQo+ID4gPiA+ID4g
PiA+IGluZGV4IGM4Nzk1ZDRiYmIyZWEuLjkyNDJjNmNkNWUzZTkgMTAwNjQ0Cj4gPiA+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQo+ID4gPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUKPiA+ID4gPiA+ID4gPiBAQCAtMSwz
ICsxLDQgQEAKPiA+ID4gPiA+ID4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gIG9iai0kKENPTkZJR19SSVNDVl9TQklfU1NF
KSAgICAgICAgICArPSByaXNjdl9zYmlfc3NlLm8KPiA+ID4gPiA+ID4gPiArb2JqLSQoQ09ORklH
X1JJU0NWX1NTRV9VTktOT1dOX05NSSkgICs9IHNzZV9ubWkubwo+ID4gPiA+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3NzZV9ubWkuYyBiL2RyaXZlcnMvZmlybXdh
cmUvcmlzY3Yvc3NlX25taS5jCj4gPiA+ID4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi40MzA2M2Y0MmVmZmYwCj4gPiA+ID4gPiA+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlz
Y3Yvc3NlX25taS5jCj4gPiA+ID4gPiA+ID4gQEAgLTAsMCArMSw3NyBAQAo+ID4gPiA+ID4gPiA+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsKPiA+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9tbS5oPgo+ID4gPiA+ID4gPiA+ICsjaW5jbHVk
ZSA8bGludXgvbm1pLmg+Cj4gPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9yaXNjdl9zYmlf
c3NlLmg+Cj4gPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9zY2hlZC9kZWJ1Zy5oPgo+ID4g
PiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvc3lzY3RsLmg+Cj4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ICsjaW5jbHVkZSA8YXNtL2lycV9yZWdzLmg+Cj4gPiA+ID4gPiA+ID4gKyNpbmNs
dWRlIDxhc20vc2JpLmg+Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICtpbnQgcGFuaWNf
b25fdW5rbm93bl9ubWkgPSAxOwo+ID4gPiA+ID4gPiA+ICtzdHJ1Y3Qgc3NlX2V2ZW50ICpldnQ7
Cj4gPiA+ID4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgY3RsX3RhYmxlX2hlYWRlciAqdW5rbm93bl9u
bWlfc3lzY3RsX2hlYWRlcjsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gK2NvbnN0IHN0
cnVjdCBjdGxfdGFibGUgdW5rbm93bl9ubWlfdGFibGVbXSA9IHsKPiA+ID4gPiA+ID4gPiArICAg
ICB7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAucHJvY25hbWUgICAgICAgPSAicGFuaWNf
ZW5hYmxlIiwKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgIC5kYXRhICAgICAgICAgICA9ICZw
YW5pY19vbl91bmtub3duX25taSwKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgIC5tYXhsZW4g
ICAgICAgICA9IHNpemVvZihpbnQpLAo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgLm1vZGUg
ICAgICAgICAgID0gMDY0NCwKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgIC5wcm9jX2hhbmRs
ZXIgICA9IHByb2NfZG9pbnR2ZWNfbWlubWF4LAo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
LmV4dHJhMSAgICAgICAgID0gU1lTQ1RMX1pFUk8sCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAuZXh0cmEyICAgICAgICAgPSBTWVNDVExfT05FLAo+ID4gPiA+ID4gPiA+ICsgICAgIH0sCj4g
PiA+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICtzdGF0aWMgdm9p
ZCBubWlfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gPiA+ID4gPiArewo+ID4g
PiA+ID4gPiA+ICsgICAgIHByX2VtZXJnKCJOTUkgcmVjZWl2ZWQgZm9yIHVua25vd24gb24gQ1BV
ICVkLlxuIiwgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gKyAgICAgaWYgKHBhbmljX29uX3Vua25vd25fbm1pKQo+ID4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgbm1pX3BhbmljKHJlZ3MsICJOTUk6IE5vdCBjb250aW51aW5nIik7Cj4gPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgIHByX2VtZXJnKCJEYXplZCBhbmQgY29uZnVzZWQsIGJ1
dCB0cnlpbmcgdG8gY29udGludWVcbiIpOwo+ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IEknbSBkYXplZCBhbmQgY29uZnVzZWQgYXMgd2VsbCA7KSBXaGF0J3MgdGhlIHBv
aW50IG9mIHRoaXMgZXhjZXB0Cj4gPiA+ID4gPiA+IGludGVycnVwdGluZyB0aGUga2VybmVsIHdp
dGggYSBwYW5pYyA/IEl0IHNlZW1zIGxpa2UgaXQncyBhIGJldHRlciBpZGVhCj4gPiA+ID4gPiA+
IHRvIGxldCB0aGUgZmlybXdhcmUgaGFuZGxlIHRoYXQgcHJvcGVybHkgYW5kIGRpc3BsYXkgd2hh
dGV2ZXIKPiA+ID4gPiA+ID4gaW5mb3JtYXRpb24gYXJlIG5lZWRlZC4gV2FzIHlvdXIgaWRlYSB0
byBhY3R1YWxseSBmb3JjZSB0aGUga2VybmVsIHRvCj4gPiA+ID4gPiA+IGVudGVyIGluIHNvbWUg
ZGVidWcgbW9kZSA/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlcmUgaXMgYW4gaW1wb3J0YW50IHNj
ZW5hcmlvOiB3aGVuIHRoZSBrZXJuZWwgYmVjb21lcyB1bnJlc3BvbnNpdmUsCj4gPiA+ID4gPiB3
ZSBuZWVkIHRvIHRyaWdnZXIgYW4gdW5rbm93biBOTUkgdG8gY2F1c2UgdGhlIHN5c3RlbSB0byBw
YW5pYygpIGFuZAo+ID4gPiA+ID4gdGhlbiBjb2xsZWN0IHRoZSB2bWNvcmUsIGFuZCBzdWNoIGEg
cmVxdWlyZW1lbnQgaXMgY29tbW9uIG9uIHg4Ngo+ID4gPiA+ID4gc2VydmVycy4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
Q2zDqW1lbnQKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gK3N0YXRp
YyBpbnQgbm1pX3NzZV9oYW5kbGVyKHUzMiBldnQsIHZvaWQgKmFyZywgc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCj4gPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gPiArICAgICBubWlfaGFuZGxlcihy
ZWdzKTsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+
ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgc3Nl
X25taV9pbml0KHZvaWQpCj4gPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gPiArICAgICBpbnQg
cmV0Owo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICAgICBldnQgPSBzc2VfZXZlbnRf
cmVnaXN0ZXIoU0JJX1NTRV9FVkVOVF9MT0NBTF9VTktOT1dOX05NSSwgMCwKPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm1pX3NzZV9oYW5kbGVyLCBOVUxMKTsK
PiA+ID4gPgo+ID4gPiA+IFNob3VsZCB3ZSBhZGQgdGhpcyBVTktOT1dOX05NSSBldmVudCBJRCBp
biBDaGFwdGVyIDE3IG9mIHRoZSBTQkkgc3BlYz8KPiA+ID4KPiA+ID4gVGhlIHJhdGlmaWVkIFNC
SSB2My4wIGRlZmluZXMgYSAiU29mdHdhcmUgaW5qZWN0ZWQgbG9jYWwgZXZlbnQiIChJRCAweGZm
ZmYwMDAwKQo+ID4gPiB3aGljaCBjYW4gYmUgdXNlZCB0byBpbmplY3QgcGFuaWMoKSBvbiBhIHBh
cnRpY3VsYXIgSEFSVCBmcm9tIGFub3RoZXIgSEFSVC4KPiA+Cj4gPiBIYXMgU0JJX1NTRV9FVkVO
VF9MT0NBTF9TT0ZUV0FSRSAoMHhmZmZmMDAwMCkgYmVlbiBnaXZlbiBtZWFuaW5nCj4gPiBjdXJy
ZW50bHk/IFRoZSBzY2VuYXJpbyBvZiB0aGUgdW5rbm93biBOTUkgaXMgdGhhdCBhZnRlciBhIEhB
UlQKPiA+IHJlY2VpdmVzIGFuIGludGVycnVwdCBmcm9tIHRoZSBwbGF0Zm9ybSwgTS1tb2RlIHJl
c3BvbmRzIHRvIHRoaXMKPgo+IFdoaWNoIGludGVycnVwdCA/IEEgc3RhbmRhcmQgb25lIG9yIHBs
YXRmb3JtIHNwZWNpZmljIG9uZSA/CgpQbGF0Zm9ybSBzcGVjaWZpYyBvbmUuCkFyZSB0aGVyZSBh
bnkgcmVjb21tZW5kZWQgZXZlbnQgSURzPyBPciBzaG91bGQgYSBuZXcgVU5LTk9XTiBOTUkgZXZl
bnQKSUQgYmUgYWRkZWQgdG8gdGhlIFNCSSBzcGVjPwoKPgo+ID4gaW50ZXJydXB0IGFuZCB0aGVu
IGVudGVycyBTLW1vZGUgdG8gZXhlY3V0ZSB0aGUgcmVnaXN0ZXJlZCBoYW5kbGVyLgo+ID4gQ2Fu
IFNCSV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkUgYmUgdXNlZCBkaXJlY3RseT8KPiA+Cj4gPgo+
ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBBbnVwCj4gPgo+ID4gVGhhbmtzLAo+ID4gWXVuaHVp
CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
