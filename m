Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7D0E77180
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 11:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAJobJ3wrwhvg5fp4nLZBR2cqIaZldskoN1Bnk7bL0s=; b=fc2s5/ywWHqorR
	8nGrO7S6zsjk0VoR5JdMt+wj3KDn7K8JpTNSiUB0Geg3YtGtNwm+Rpjjc9ClpugklowHJKTHNj+tL
	AHqWCBSZ285+lhxA+xVEdW7f6GF9UdeiCiCMUz909GYcHocyzTPsUKp8Z9X9Tea7SjZ9v0RxHaEVS
	iVmTswZlABO1s7ZvGHZVZwbUGYzhEk7waV3ZlcGDgbBV9bVL45vEyGmcuKMLVrUr+/iBi5VG22cYu
	S8N6AdTvXtaVnZOm9GfHO36chTGbF0JeoaavsL5vYgbIkouIHS/1aoegNH4bHjHZv5PH5h29xHEUg
	n/Idapq55KNOTtCYJlbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbzF-00000007VXR-0xgb;
	Mon, 09 Dec 2024 11:31:37 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbz1-00000007VTU-37i9
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 11:31:24 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-46760d9e4daso6445131cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 03:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733743882; x=1734348682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv059c/gl9yEVwmaE22LugFlYT0Oq+b13AMGJcZXSIs=;
        b=m4wPL0gSxNQ5zb2TwIb+dptFDiqqcSpspYw65T6pcAnlrTm+NiPzRLUc+0xMEvRwyJ
         rL0L4WHhZFPHRHvhpEbo4K9b0xQi8gGWyHShsGokqvYxI9tt2RWObarEdfsG3n9HYQw/
         a9UdcDrrZpUegpMMsytAPd7DYW2CnKieO2Nk+TgbWXET5hcQRsdW28C8lJpUKpezPlIK
         O9gVQfn6fKKqEZQlNgG5zW2DuTKhB45mkwh74JGUzRF1rKaY6pt0FP2mCxNJq/u/FRkC
         /xNmbcBoa2cnKC3O/iF44AvkyztND3KP/iN6ExkmtRosiZ02r9xPDwljG0rdUgO0umMI
         +/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733743882; x=1734348682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv059c/gl9yEVwmaE22LugFlYT0Oq+b13AMGJcZXSIs=;
        b=lx8vD7Kdv6JNp+OrvkgQ0VT0k7zpZ7orBw6WcTHtawLQgO7RSFlFvKgkj1LZ35A6FG
         n35GvYlNpGjM8WXBYaw8b/WuF7x4KT9FpQqrT2PS6oPjz2b7At+xZfLH/oD5+8pcu+JJ
         TxcHuoyroTBn9os905MJnLne6fJjhapTm/1Fym9kZyY5clpx6Qb8lvWz8eP+Ub1VNEVz
         BkdCnAmp4SC92ck6XilAwcUinHBNM0M3zmepn1Pzlptc2YJ2cI3Z+SAYlN6FwcwDMfgO
         QexmwY9qrF+9CBKSdZ/TDElw+Rkon+S/ugcZsi1XtN/REuWBJyLQg7wYgPt7+TIkvJN+
         SMcA==
X-Forwarded-Encrypted: i=1; AJvYcCWH6dJnOvqMUMJ/czy7pvDNde3SvF5lqFOFkICveRHXqk7a0Z0zf6x4l3I4uibLtaoPUt5PtpzEij6llw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIngTa0kzihOSC3oeI5hFdUnFdCky5ADrcV/xx9GKr/uDYwn++
	tpDpl2mreCVhdBwh2JD69va2GerBPl6kXJknIxsCZwnlsR56go08+Mh06jIBGYC90l/2TRqc9bZ
	yKJ+LS9m/kBkP91GWzjBpIMwRpdGHtw==
X-Gm-Gg: ASbGncsyn6RRCkFnPhEroO4yfGe31B8F4C5a6AAOvX3QDJZPibPA8ZWqRaTx62DmhTx
	LkajLgqWU+4uH9IZlJqa5Oj/aymiqECw=
X-Google-Smtp-Source: AGHT+IHzwwk5VzRE+bAS7irOdqZiT8NZLGj5VPzm62ZlvJpVIkcX47OELAY/49XpLxkla+ZJlVsQC9Ywwb6FCaGRwOI=
X-Received: by 2002:a05:622a:4a1a:b0:467:681c:425f with SMTP id
 d75a77b69052e-467681c44famr43464881cf.4.1733743881821; Mon, 09 Dec 2024
 03:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20241209095113.41154-1-luxu.kernel@bytedance.com>
 <87v7vtw234.fsf@all.your.base.are.belong.to.us> <CAPYmKFtq4zT4Jk0QyGnZacQJ=6JY-kgQuiGYrbjsfDE+r36QBA@mail.gmail.com>
In-Reply-To: <CAPYmKFtq4zT4Jk0QyGnZacQJ=6JY-kgQuiGYrbjsfDE+r36QBA@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Mon, 9 Dec 2024 12:31:10 +0100
Message-ID: <CAJ+HfNhYb9wNJ5m7-VEo1=FdRJ_h4fBYm2YqS+q=T6xrth2sSA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] riscv: mm: Fix the out of bound issue
 of vmemmap address
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, alexghiti@rivosinc.com, 
	bjorn@rivosinc.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_033123_791212_21B79C9A 
X-CRM114-Status: GOOD (  31.16  )
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

SGksCgpPbiBNb24sIDkgRGVjIDIwMjQgYXQgMTI6MjUsIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEJqw7ZybiwKPgo+IFRoYW5rcyBmb3IgeW91ciBjb21t
ZW50LiBJcyBpdCBPSyB0byBpbnRyb2R1Y2UgdGhlIG5ldyBhbmQgdW51c2VkCj4gdmFyaWFibGUg
J3ZtZW1tYXBfc3RhcnRfcGZuJyB3aGVuIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUCBpcwo+IGRp
c2FibGVkPwoKVGhlIGRlY2xhcmF0aW9uLCB5ZXMuIERlZmluaXRpb24sIG5vIQoKCkNoZWVycywK
QmrDtnJuCgo+IE9uIE1vbiwgRGVjIDksIDIwMjQgYXQgNzowM+KAr1BNIEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE1pbm9yIG5pdHMgYmVsb3c7IFRvbyBt
YW55IGlmZGVmcy4KPiA+Cj4gPiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3Jp
dGVzOgo+ID4KPiA+ID4gSW4gc3BhcnNlIHZtZW1tYXAgbW9kZWwsIHRoZSB2aXJ0dWFsIGFkZHJl
c3Mgb2Ygdm1lbW1hcCBpcyBjYWxjdWxhdGVkIGFzOgo+ID4gPiAoKHN0cnVjdCBwYWdlICopVk1F
TU1BUF9TVEFSVCAtIChwaHlzX3JhbV9iYXNlID4+IFBBR0VfU0hJRlQpKS4KPiA+ID4gQW5kIHRo
ZSBzdHJ1Y3QgcGFnZSdzIHZhIGNhbiBiZSBjYWxjdWxhdGVkIHdpdGggYW4gb2Zmc2V0Ogo+ID4g
PiAodm1lbW1hcCArIChwZm4pKS4KPiA+ID4KPiA+ID4gSG93ZXZlciwgd2hlbiBpbml0aWFsaXpp
bmcgc3RydWN0IHBhZ2VzLCBrZXJuZWwgYWN0dWFsbHkgc3RhcnRzIGZyb20gdGhlCj4gPiA+IGZp
cnN0IHBhZ2UgZnJvbSB0aGUgc2FtZSBzZWN0aW9uIHRoYXQgcGh5c19yYW1fYmFzZSBiZWxvbmdz
IHRvLiBJZiB0aGUKPiA+ID4gZmlyc3QgcGFnZSdzIHBoeXNpY2FsIGFkZHJlc3MgaXMgbm90IChw
aHlzX3JhbV9iYXNlID4+IFBBR0VfU0hJRlQpLCB0aGVuCj4gPiA+IHdlIGdldCBhbiB2YSBiZWxv
dyBWTUVNTUFQX1NUQVJUIHdoZW4gY2FsY3VsYXRpbmcgdmEgZm9yIGl0J3Mgc3RydWN0IHBhZ2Uu
Cj4gPiA+Cj4gPiA+IEZvciBleGFtcGxlLCBpZiBwaHlzX3JhbV9iYXNlIHN0YXJ0cyBmcm9tIDB4
ODIwMDAwMDAgd2l0aCBwZm4gMHg4MjAwMCwgdGhlCj4gPiA+IGZpcnN0IHBhZ2UgaW4gdGhlIHNh
bWUgc2VjdGlvbiBpcyBhY3R1YWxseSBwZm4gMHg4MDAwMC4gRHVyaW5nCj4gPiA+IGluaXRfdW5h
dmFpbGFibGVfcmFuZ2UoKSwgd2Ugd2lsbCBpbml0aWFsaXplIHN0cnVjdCBwYWdlIGZvciBwZm4g
MHg4MDAwMAo+ID4gPiB3aXRoIHZpcnR1YWwgYWRkcmVzcyAoKHN0cnVjdCBwYWdlICopVk1FTU1B
UF9TVEFSVCAtIDB4MjAwMCksIHdoaWNoIGlzCj4gPiA+IGJlbG93IFZNRU1NQVBfU1RBUlQgYXMg
d2VsbCBhcyBQQ0lfSU9fRU5ELgo+ID4gPgo+ID4gPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGlzIGJ1
ZyBieSBpbnRyb2R1Y2luZyBhIG5ldyB2YXJpYWJsZQo+ID4gPiAndm1lbW1hcF9zdGFydF9wZm4n
IHdoaWNoIGlzIGFsaWduZWQgd2l0aCBtZW1vcnkgc2VjdGlvbiBzaXplIGFuZCB1c2luZwo+ID4g
PiBpdCB0byBjYWxjdWxhdGUgdm1lbW1hcCBhZGRyZXNzIGluc3RlYWQgb2YgcGh5c19yYW1fYmFz
ZS4KPiA+ID4KPiA+ID4gRml4ZXM6IGExMWRkNDlkY2I5MyAoInJpc2N2OiBTcGFyc2UtTWVtb3J5
L3ZtZW1tYXAgb3V0LW9mLWJvdW5kcyBmaXgiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8
bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BhZ2UuaCAgICB8ICA0ICsrKysKPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oIHwgIDQgKysrLQo+ID4gPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAg
ICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysKPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2Uu
aAo+ID4gPiBpbmRleCA3MWFhYmM1YzY3MTMuLmExYmUxYWRjZmI4NSAxMDA2NDQKPiA+ID4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wYWdlLmgKPiA+ID4gQEAgLTEyMyw2ICsxMjMsMTAgQEAgc3RydWN0IGtlcm5l
bF9tYXBwaW5nIHsKPiA+ID4gIGV4dGVybiBzdHJ1Y3Qga2VybmVsX21hcHBpbmcga2VybmVsX21h
cDsKPiA+ID4gIGV4dGVybiBwaHlzX2FkZHJfdCBwaHlzX3JhbV9iYXNlOwo+ID4gPgo+ID4gPiAr
I2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUAo+ID4KPiA+IE5vdCBuZWVkZWQsIGFuZCBz
aG91bGQgYmUgcmVtb3ZlZC4KPiA+Cj4gPiA+ICtleHRlcm4gdW5zaWduZWQgbG9uZyB2bWVtbWFw
X3N0YXJ0X3BmbjsKPiA+ID4gKyNlbmRpZgo+ID4gPiArCj4gPiA+ICAjZGVmaW5lIGlzX2tlcm5l
bF9tYXBwaW5nKHgpIFwKPiA+ID4gICAgICAgKCh4KSA+PSBrZXJuZWxfbWFwLnZpcnRfYWRkciAm
JiAoeCkgPCAoa2VybmVsX21hcC52aXJ0X2FkZHIgKyBrZXJuZWxfbWFwLnNpemUpKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiBpbmRleCBkNGU5OWVlZjkwYWMuLmUy
ZGJkNGI5YTY4NiAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4g
QEAgLTg3LDcgKzg3LDkgQEAKPiA+ID4gICAqIERlZmluZSB2bWVtbWFwIGZvciBwZm5fdG9fcGFn
ZSAmIHBhZ2VfdG9fcGZuIGNhbGxzLiBOZWVkZWQgaWYga2VybmVsCj4gPiA+ICAgKiBpcyBjb25m
aWd1cmVkIHdpdGggQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQIGVuYWJsZWQuCj4gPiA+ICAgKi8K
PiA+ID4gLSNkZWZpbmUgdm1lbW1hcCAgICAgICAgICAgICAgKChzdHJ1Y3QgcGFnZSAqKVZNRU1N
QVBfU1RBUlQgLSAocGh5c19yYW1fYmFzZSA+PiBQQUdFX1NISUZUKSkKPiA+ID4gKyNpZmRlZiBD
T05GSUdfU1BBUlNFTUVNX1ZNRU1NQVAKPiA+Cj4gPiBEaXRvLCBwbGVhc2UgcmVtb3ZlLgo+ID4K
PiA+ID4gKyNkZWZpbmUgdm1lbW1hcCAgICAgICAgICAgICAgKChzdHJ1Y3QgcGFnZSAqKVZNRU1N
QVBfU1RBUlQgLSB2bWVtbWFwX3N0YXJ0X3BmbikKPiA+ID4gKyNlbmRpZgo+ID4gPgo+ID4gPiAg
I2RlZmluZSBQQ0lfSU9fU0laRSAgICAgIFNaXzE2TQo+ID4gPiAgI2RlZmluZSBQQ0lfSU9fRU5E
ICAgICAgIFZNRU1NQVBfU1RBUlQKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5p
dC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ID4gaW5kZXggMGU4YzIwYWRjZDk4Li5lN2M1
MmQ2NDdmNTAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiA+ICsr
KyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiA+IEBAIC0zMiw2ICszMiw5IEBACj4gPiA+ICAj
aW5jbHVkZSA8YXNtL251bWEuaD4KPiA+ID4gICNpbmNsdWRlIDxhc20vcGd0YWJsZS5oPgo+ID4g
PiAgI2luY2x1ZGUgPGFzbS9zZWN0aW9ucy5oPgo+ID4gPiArI2lmZGVmIENPTkZJR19TUEFSU0VN
RU1fVk1FTU1BUAo+ID4KPiA+IE5vdCBuZWVkZWQsIHBsZWFzZSByZW1vdmUuCj4gPgo+ID4gPiAr
I2luY2x1ZGUgPGFzbS9zcGFyc2VtZW0uaD4KPiA+ID4gKyNlbmRpZgo+ID4gPiAgI2luY2x1ZGUg
PGFzbS9zb2MuaD4KPiA+ID4gICNpbmNsdWRlIDxhc20vdGxiZmx1c2guaD4KPiA+ID4KPiA+ID4g
QEAgLTYyLDYgKzY1LDEzIEBAIEVYUE9SVF9TWU1CT0wocGd0YWJsZV9sNV9lbmFibGVkKTsKPiA+
ID4gIHBoeXNfYWRkcl90IHBoeXNfcmFtX2Jhc2UgX19yb19hZnRlcl9pbml0Owo+ID4gPiAgRVhQ
T1JUX1NZTUJPTChwaHlzX3JhbV9iYXNlKTsKPiA+ID4KPiA+ID4gKyNpZmRlZiBDT05GSUdfU1BB
UlNFTUVNX1ZNRU1NQVAKPiA+ID4gKyNkZWZpbmUgVk1FTU1BUF9BRERSX0FMSUdOICAgKDFVTEwg
PDwgU0VDVElPTl9TSVpFX0JJVFMpCj4gPiA+ICsKPiA+ID4gK3Vuc2lnbmVkIGxvbmcgdm1lbW1h
cF9zdGFydF9wZm4gX19yb19hZnRlcl9pbml0Owo+ID4gPiArRVhQT1JUX1NZTUJPTCh2bWVtbWFw
X3N0YXJ0X3Bmbik7Cj4gPiA+ICsjZW5kaWYKPiA+ID4gKwo+ID4gPiAgdW5zaWduZWQgbG9uZyBl
bXB0eV96ZXJvX3BhZ2VbUEFHRV9TSVpFIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpXQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX3Bh
Z2VfYWxpZ25lZF9ic3M7Cj4gPiA+ICBFWFBPUlRfU1lNQk9MKGVtcHR5X3plcm9fcGFnZSk7Cj4g
PiA+IEBAIC0yNDMsNiArMjUzLDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ib290bWVt
KHZvaWQpCj4gPiA+ICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfWElQX0tFUk5FTCkpCj4g
PiA+ICAgICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0o
KSAmIFBNRF9NQVNLOwo+ID4gPgo+ID4gPiArI2lmZGVmIENPTkZJR19TUEFSU0VNRU1fVk1FTU1B
UAo+ID4gPiArICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1hJUF9LRVJORUwpKQo+ID4gPiAr
ICAgICAgICAgICAgIHZtZW1tYXBfc3RhcnRfcGZuID0gcm91bmRfZG93bihwaHlzX3JhbV9iYXNl
LCBWTUVNTUFQX0FERFJfQUxJR04pID4+IFBBR0VfU0hJRlQ7Cj4gPiA+ICsjZW5kaWYKPiA+ID4g
Kwo+ID4KPiA+IFBsZWFzZSBmb2xkIHRoaXMgaW50byB0aGUgaWYtc3RhdGVtZW50IGFib3ZlLCBl
LmcuOgo+ID4gICB8ICAgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVMKSkg
ewo+ID4gICB8ICAgICAgICAgICAgICAgICBwaHlzX3JhbV9iYXNlID0gbWVtYmxvY2tfc3RhcnRf
b2ZfRFJBTSgpICYgUE1EX01BU0s7Cj4gPiAgIHwgI2lmIGRlZmluZWQoQ09ORklHX1NQQVJTRU1F
TV9WTUVNTUFQKQo+ID4gICB8ICAgICAgICAgICAgICAgICB2bWVtbWFwX3N0YXJ0X3BmbiA9IHJv
dW5kX2Rvd24ocGh5c19yYW1fYmFzZSwgVk1FTU1BUF9BRERSX0FMSUdOKSA+PiBQQUdFX1NISUZU
Owo+ID4gICB8ICNlbmRpZgo+ID4gICB8ICAgICAgICAgfQo+ID4KPiA+Cj4gPiBCasO2cm4KPgo+
IEJlc3QgUmVnYXJkcywKPgo+IFh1IEx1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
