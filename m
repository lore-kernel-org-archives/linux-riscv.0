Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A07BC3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZPR8aW1do48as2jQEQiiurwx5rmapJDg1kWI2PcYG4=; b=sYHHviHE1mYW5f
	7tMFVVfXoRsqUnr+phWHDZJcCRe7/JzGUED5HAo0v7YOmzQiReiYr/VhAyUZPdwFz/GFTUEKQu4cQ
	IHbHAwhxliK6viaqO5a7MoSX7okMYfibSTjZLASAcVOvhGLmMy5oTVMbvsR1hpjHxNUgM9fB2c56b
	RwzalxhVnWbS8hrj6J+Lh6U347stFU5YoG8C6a9esz6i//hQkVLbkqgsCjQJaiEGt9etnhDrZRCsV
	zIOMnMS8FDRZUtRjrXRTCdB/P31zGL5R7ri+tEMbgpbubs8EpdDujpIEqJ815v8sbq6EsJBeqQhOe
	g55oCVgZaCshAJq0B5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMjP-00000003Z9p-1qZb;
	Fri, 09 May 2025 12:21:35 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLbk-00000003OEp-3Dj6
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 11:09:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac2c663a3daso387082166b.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746788975; x=1747393775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvCseEsNXn2YDR22ofVS1EjuRoUQXxujlI0mWYKfm9A=;
        b=j1mwVy+t98SkdNX13GUOjfRssDXUo5/3x9VBPB2hpyQOkcUx6ooI1JEdhH9HDrul7k
         E2jd4jmXh6jeLmYXAEvMVWwnz1NTU8bAO3KTPutZxHP+M85BcO1KtZw1rFGPRlL0bN7/
         N3/50XSazmcmQ2s23iriw0xHo3KX4AVIDINdbLJRwOcuPy40c/4sTwXz2t7PlBvikPGL
         tPugX7mnbjr4+DSywFzWYSRBUX3Dlx5PdAduV5L/D7jJGenYLTimyrhCcOPbxk37Yreq
         jUIQufFyrlZzCZsho5jZBGbVksW37Pl1wYoYmRzgwTHNMKEpMk38rD2qScMDm5/8mq3P
         WUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788975; x=1747393775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvCseEsNXn2YDR22ofVS1EjuRoUQXxujlI0mWYKfm9A=;
        b=i8l13MVcKCEk6suNZiJrhBQS7bYpqaEQ7zN6RT1+SNfZWhVnO+ZlQgZo2XJvDbDA7e
         DT28EVVAAw2mlgoy+57k/cjeBg4s3XgwARxP46ZG78DffnJBVyWSMuEXyMIIRcLx/T3c
         kI7L8xzKfwKqTkmFPq7S9Sg/3/0wIlvZH2dACTBCbDgj7/rypAGIDaGudUnn/j8kQ7iK
         j8q9cBjJdLK8thFa4uhzGXhf76YT2dxBP3AfvORXaTJOc5h78l62Iy6n13AMlj44VEyj
         Dkcg+OvZitRpjcV8lyJlJzBgQLUMUgUQDil4FFoYG7k7xMZODYka/1BwJKL9SHEJ6VnD
         JWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBEhIoB050KbQeKqgP5U4J+u/iVZb0oPZRGX0vcWj3mrXML+tdihl8w+CxTOwAyiJkubQhfqrrVz5akw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPVDk+FlSiCbiftP/0GOmXHy5gtOrlCUu2nr6kIs68cNf+JRem
	79YGqPXAZLICRkCh2UVKqdO6MWMct4gWDu34zrp1k+ogWkzaiTBk54VeLWQ5UujpZQQdEImHgum
	JZQFkfL0hwScYDP86loWAQKgqUOzKiQybwudvEQ==
X-Gm-Gg: ASbGncsg2wrCU5ZOWhoZZAFk+/G+uwNQ+UrJRbpl1prcU79TYzEQ+4KYDCwEw4+BoR8
	T7L+g6N+QlApko956iw56NlsR89Ll0SoYPrinKqgxWHW7APcVyrmA0lCiqRZkbHW3fHzbBlsVfu
	jueV92hGbIDBOQu2yVOQJKjfmgaVJcC7UP4xDjGLcVq7igQDobp2k12g==
X-Google-Smtp-Source: AGHT+IHolmFqWEGC4AyYal+IeZ3IwV5YHOWUsjQ6qySOfZum5CD2COEsMayA91FRo6y4k+ibRc9NvWuirdTrS8RhJ24=
X-Received: by 2002:a17:907:724f:b0:acb:5343:e75 with SMTP id
 a640c23a62f3a-ad2190afc7amr206746066b.34.1746788973864; Fri, 09 May 2025
 04:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr> <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr> <20250508123046.GA3706@willie-the-truck>
In-Reply-To: <20250508123046.GA3706@willie-the-truck>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 9 May 2025 13:09:22 +0200
X-Gm-Features: AX0GCFtetDfDezkP8vUdVhHiVYD6YKsFtOYLD7hY4r0bKx1J-4Tcdfpu2fXv07A
Message-ID: <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
To: Will Deacon <will@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Ryan Roberts <ryan.roberts@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040937_067611_945E5DFC 
X-CRM114-Status: GOOD (  36.42  )
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

SGkgV2lsbCwKCk9uIFRodSwgTWF5IDgsIDIwMjUgYXQgMjozMOKAr1BNIFdpbGwgRGVhY29uIDx3
aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgZm9sa3MsCj4KPiBPbiBNb24sIE1heSAwNSwg
MjAyNSBhdCAwNjowODo1MFBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBPbiAy
OS8wNC8yMDI1IDE2OjA5LCBSeWFuIFJvYmVydHMgd3JvdGU6Cj4gPiA+IE9uIDA3LzA0LzIwMjUg
MTM6MDQsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+ID4gPiBDYW4gc29tZW9uZSBmcm9tIGFy
bTY0IHJldmlldyB0aGlzPyBJIHRoaW5rIGl0J3MgcHJlZmVyYWJsZSB0byBzaGFyZSB0aGUgc2Ft
ZQo+ID4gPiA+IGltcGxlbWVudGF0aW9uIGJldHdlZW4gcmlzY3YgYW5kIGFybTY0Lgo+ID4gPiBJ
J3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgdGhpcyBmb3IgYSB3aGlsZSBhbmQgaGFkIHNvbWUgY29u
dmVyc2F0aW9ucyBpbnRlcm5hbGx5Lgo+ID4gPiBUaGlzIHBhdGNoc2V0IGhhcyBib3RoIHByb3Mg
YW5kIGNvbnMuCj4gPiA+Cj4gPiA+IEluIHRoZSBwcm9zIGNvbHVtbiwgaXQgaW5jcmVhc2VzIGNv
ZGUgcmV1c2UgaW4gYW4gYXJlYSB0aGF0IGhhcyBoYWQgcXVpdGUgb2YgZmV3Cj4gPiA+IGJ1Z3Mg
cG9wcGluZyB1cCBsYXRlbHk7IHNvIHRoaXMgd291bGQgYnJpbmcgbW9yZSBleWVzIGFuZCBob3Bl
ZnVsbHkgaGlnaGVyCj4gPiA+IHF1YWxpdHkgaW4gdGhlIGxvbmcgcnVuLgo+ID4gPgo+ID4gPiBC
dXQgaW4gdGhlIGNvbnMgY29sdW1uLCB3ZSBoYXZlIHNlZW4gSFcgZXJyYXRhIGluIHNpbWlsYXIg
YXJlYXMgaW4gdGhlIHBhc3QgYW5kCj4gPiA+IEknbSBuZXJ2b3VzIHRoYXQgYnkgaG9pc3Rpbmcg
dGhpcyBjb2RlIHRvIG1tLCB3ZSBtYWtlIGl0IGhhcmRlciB0byB3b3JrYXJvdW5kCj4gPiA+IGFu
eSBmdXR1cmUgZXJyYXRhLiBBZGRpdGlvbmFsbHkgSSBjYW4gaW1hZ2luZSB0aGF0IHRoaXMgY2hh
bmdlIGNvdWxkIG1ha2UgaXQKPiA+ID4gaGFyZGVyIHRvIHN1cHBvcnQgZnV0dXJlIEFybSBhcmNo
aXRlY3R1cmUgZW5oYW5jZW1lbnRzLgo+ID4gPgo+ID4gPiBJIGFwcHJlY2lhdGUgdGhlIGNvbnMg
YXJlIG5vdCBzdHJvbmcgKnRlY2huaWNhbCogYXJndW1lbnRzIGJ1dCBuZXZlcnRoZWxlc3MgdGhl
eQo+ID4gPiBhcmUgd2lubmluZyBvdXQgaW4gdGhpcyBjYXNlOyBNeSBvcGluaW9uIGlzIHRoYXQg
d2Ugc2hvdWxkIGtlZXAgdGhlIGFybTY0Cj4gPiA+IGltcGxlbWVudGF0aW9ucyBvZiBodWdlX3B0
ZV8gKGFuZCBjb250cHRlXyB0b28gLSBJIGtub3cgeW91IGhhdmUgYSBzZXBhcmF0ZQo+ID4gPiBz
ZXJpZXMgZm9yIHRoaXMpIHByaXZhdGUgdG8gYXJtNjQuCj4gPiA+Cj4gPiA+IFNvcnJ5IGFib3V0
IHRoYXQuCj4gPiA+Cj4gPiA+ID4gVGhlIGVuZCBnb2FsIGlzIHRoZSBzdXBwb3J0IG9mIG1USFAg
dXNpbmcgc3ZuYXBvdCBvbiByaXNjdiwgd2hpY2ggd2Ugd2FudCBzb29uLAo+ID4gPiA+IHNvIGlm
IHRoYXQgcGF0Y2hzZXQgZG9lcyBub3QgZ2FpbiBhbnkgdHJhY3Rpb24sIEknbGwganVzdCBjb3B5
L3Bhc3RlIHRoZSBhcm02NAo+ID4gPiA+IGltcGxlbWVudGF0aW9uIGludG8gcmlzY3YuCj4gPiA+
IFRoaXMgY29weS9wYXN0ZSBhcHByb2FjaCB3b3VsZCBiZSBteSBwcmVmZXJlbmNlLgo+ID4KPiA+
Cj4gPiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJIGRpc2FncmVlIHdpdGggdGhpcyBhcHByb2FjaCwg
dGhlIHJpc2N2IGFuZCBhcm02NAo+ID4gaW1wbGVtZW50YXRpb25zIGFyZSAqZXhhY3RseSogdGhl
IHNhbWUgc28gaXQgc291bmRzIHdlaXJkIHRvIGR1cGxpY2F0ZSBjb2RlLAo+ID4gdGhlIHByb3Mg
eW91IG1lbnRpb24gb3V0d2VpZ2ggdGhlIGNvbnMuCj4gPgo+ID4gVW5sZXNzIEknbSBtaXNzaW5n
IHNvbWV0aGluZyBhYm91dCB0aGUgZXJyYXRhcz8gVG8gbWUsIHRoYXQncyBlYXNpbHkgZml4ZWQK
PiA+IGJ5IHByb3ZpZGluZyBhcmNoIHNwZWNpZmljIG92ZXJyaWRlcyBubz8gQ2FuIHlvdSBkZXNj
cmliZSB3aGF0IHNvcnQgb2YKPiA+IGVycmF0YXMgd291bGQgbm90IGZpdCB0aGVuPwo+Cj4gSWYg
d2Ugc3RhcnQgd2l0aCB0aGUgY29tbW9uIGltcGxlbWVudGF0aW9uIHlvdSBoYXZlIGhlcmUsIG5v
dGhpbmcKPiBwcmV2ZW50cyB1cyBmcm9tIGZvcmtpbmcgdGhlIGNvZGUgaW4gZnV0dXJlIGlmIHRo
ZSBhcmNoaXRlY3R1cmVzIGRpdmVyZ2UKPiBzbyBJJ2QgYmUgaW5jbGluZWQgdG8gbWVyZ2UgdGhp
cyBzZXJpZXMgYW5kIHNlZSBob3cgd2UgZ2V0IG9uLiBIb3dldmVyLAo+IG9uZSB0aGluZyBJICpk
byogdGhpbmsgd2UgbmVlZCB0byBlbnN1cmUgaXMgdGhhdCB0aGUgcmVsZXZhbnQgZm9sa3MgZnJv
bQo+IGJvdGggYXJtNjQgKGkuZS4gUnlhbikgYW5kIHJpc2N2IChpLmUuIEFsZXhhbmRyZSkgYXJl
IGNjJ2Qgb24gY2hhbmdlcyB0bwo+IHRoZSBjb21tb24gY29kZS4gT3RoZXJ3aXNlLCBpdCdzIGdv
aW5nIHRvIGJlIGEgc3RlcCBiYWNrd2FyZHMgaW4gdGVybXMKPiBvZiBtYWludGFpbmFiaWxpdHku
Cj4KPiBDb3VsZCB3ZSBhZGQgc29tZXRoaW5nIHRvIE1BSU5UQUlORVJTIHNvIHRoYXQgdGhlIG5l
dyBmaWxlIHBpY2tzIHlvdSBib3RoCj4gdXAgYXMgcmV2aWV3ZXJzPwoKSSdtIGFkZGluZyBMb3Jl
bnpvIGFzIGhlIGlzIGNsZWFuaW5nIHRoZSBtbSBNQUlOVEFJTkVSUyBlbnRyaWVzLgoKQExvcmVu
em86IHNob3VsZCB3ZSBhZGQgYSBuZXcgc2VjdGlvbiAiQ09OVFBURSIgZm9yIHRoaXM/IEZZSSwg
aHVnZXRsYgppcyB0aGUgZmlyc3QgcGF0Y2hzZXQsIEkgaGF2ZSBhbm90aGVyIHBhdGNoc2V0IHRv
IG1lcmdlIFRIUCBjb250cHRlCnN1cHBvcnQgWzFdIGFzIHdlbGwgc28gdGhlICJIVUdFVExCIiBz
ZWN0aW9uIGRvZXMgbm90IHNlZW0gdG8gYmUgYQpnb29kIGZpdC4KClsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDUwODE5MTkzMS40NjA2MC0xLWFsZXhnaGl0aUBy
aXZvc2luYy5jb20vCgpUaGFua3MsCgpBbGV4Cgo+Cj4gV2lsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
