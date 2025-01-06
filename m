Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AA7E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 03:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPWFJKxPMfQy8d+oX5kPGAfVNnXeGQvytB+43Ki7TPw=; b=HrDOasJm1twip6
	vDiOeaZGZisJoWNITgYt/GKmDDIffzdepqItqhTDPJoJ3NbUewSkvffuQqcIWXaRubINzPOnqvO7R
	7qiBWJGdnk4dfO/or/Zhmjfl3FWaSfkWC6vIxPo/rwCs4RX0P5Xk19chU+Q1HvT5sM3j4oCn4eFud
	t5C4LVNaI0aeEvLoXPi75jNDTcXidl9FvEFSyl58BjT3xKy9WBuT0ubU3En5BGOQRh+VFreZ5yRMj
	5ck+15GwcgGamqJmycwpGRDDSYzCFQhxd2ozRdK3wy8Mi2278GLR30M541Duvgdoc8f7QrnD3kML6
	1klS/UmECa7OcFr7zlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUe9B-000000009vQ-0t4V;
	Mon, 06 Jan 2025 03:51:21 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUe7w-000000009lu-2zdY
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 03:50:07 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso15658629a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jan 2025 19:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736135398; x=1736740198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/CQCfwbCGmNbncAnjTVlLDBhrllfolDtdV4jFWfmgY=;
        b=VTWjw4+E8suzl8KY7F/aL4w0g+nRgiS8BdE00CTrZ0MKJIZE5143ZlM6WEMQ6tdPTn
         g05g0uitwOBkCxOuv7TlqlySkjXFm+DhXloIvPOQbOkdQm1zreRUYDqc3dTwXkDnf5dp
         ew6d8TC1WJsQsnoMqdyzg9rhZwFS1MLBisrFsYN4DkoNDbQHepd39Q3mG1MLnV+5cVwv
         /L4HWBul2AXFDXYY0wc2pHmPUQvtnw76m/qRmaeQXOL6JlV0yUbaCKa4LBYhwBSsckkS
         yZKvAXIfTGTvSYtUPx2/bVIgU5Zl1AIpwmjD5sbGZzSHRrCx93weWJ9ZelUh3/UGH4I9
         BCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736135398; x=1736740198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/CQCfwbCGmNbncAnjTVlLDBhrllfolDtdV4jFWfmgY=;
        b=QpC/N9E9oRgQL8G/971DBZBmhfH2SnuRtQQHRp7pX15/qPFlMyoz+sNxHoSOfWpol8
         PM6TYfs1s4DGO2PgwuEAdYWZubcvFpBETTwSMa3uX+WozRw7CSDGv4KO+EUZSxBEaivt
         wTmXRnB+cehKb1rtsI09x7JTy6Hpc/sQtkhCBl1j2hSS2V+fPf/MEBp7cEtH+wkMpiVC
         QasubzNwDi9oRbl7AGGT5IdUFgYR+OXcGQvjy4Hs16XgiBFIqrpWDfxctBApERBYSzon
         QE/M4/TvXqz9JL6DdD71ej2gS4Yfh3kDzExA3/Jk4wBQtXOgTgkmCCTMo0VmefNa2Rr/
         5xhg==
X-Forwarded-Encrypted: i=1; AJvYcCWW6uY9hcaj3sb9YSPExxCgYjZpnsnMzNGhlJMm/FqAayu+pNIwQVJpKKsNA793FpfGgpgfhRw8/sSEcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoXxaJLltNI0xjBxhdySXmPhVXysu1rz3v0ZTxAK7tnJO1RBb0
	bBJ3kTAJA3c/tW/cGwu6sZMP80XywF7ZyF3ngh9SG19/+iEVcP9YXS3CCQZ7L6A=
X-Gm-Gg: ASbGnctdD7UqgKjeCf3PAaq7EB2LNL3/rK+uYQIGxrPpgWpnTVLBq8e+yHBfkCaQcp0
	rpntulmqfCmvuJDzXEp5pNwJYf6x2naqwg7b9EcLkOKefe4+lc4mLrjzoxms7E0dsGsXm0VVPId
	7SlReWrzopwDNcRnBnmTXl3HzfrQG2KQ2RuapGMRJW+HkDO6pyi8fIa8hyIX7x04Jer0USC7S3b
	ONTKl8bs356w/qQU5jXphvBR2zpIHFBAihTZy43hj7HSVzyJuX1RUcnpt8jkI+jHW/lo81ygvc7
	TtP8Vw==
X-Google-Smtp-Source: AGHT+IHpHJsHb9mpdlPf1WMyDHeUmOQ71xKKXnSQB+gdiLoxCAO6i7uhLAJzOXuDIN6Nxvn4zgv7zA==
X-Received: by 2002:a17:90b:53c8:b0:2ee:c2df:5d30 with SMTP id 98e67ed59e1d1-2f452eb11e2mr54849162a91.26.1736135398510;
        Sun, 05 Jan 2025 19:49:58 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447799048sm32821110a91.10.2025.01.05.19.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 19:49:58 -0800 (PST)
Message-ID: <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
Date: Mon, 6 Jan 2025 11:49:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, peterz@infradead.org,
 akpm@linux-foundation.org
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_195004_773590_DF8B5BC2 
X-CRM114-Status: GOOD (  28.47  )
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

SGkgS2V2aW4sCgpPbiAyMDI1LzEvMyAyMToyNywgS2V2aW4gQnJvZHNreSB3cm90ZToKPiBPbiAw
My8wMS8yMDI1IDEwOjM1LCBRaSBaaGVuZyB3cm90ZToKPj4gT24gMjAyNS8xLzMgMTc6MTMsIFFp
IFpoZW5nIHdyb3RlOgo+Pj4gT24gMjAyNS8xLzMgMTY6MDIsIEtldmluIEJyb2Rza3kgd3JvdGU6
Cj4+Pj4gT24gMDMvMDEvMjAyNSAwNDo0OCwgUWkgWmhlbmcgd3JvdGU6Cj4+Pj4+IFsuLi5dCj4+
Pj4+Cj4+Pj4+IEluIF9fdGxiX2JhdGNoX2ZyZWVfZW5jb2RlZF9wYWdlcygpLCB3ZSBjYW4gaW5k
ZWVkIGRldGVjdCBQYWdlVGFibGUoKQo+Pj4+PiBhbmQgY2FsbCBwYWdldGFibGVfZHRvcigpIHRv
IGR0b3IgdGhlIHBhZ2UgdGFibGUgcGFnZXMuCj4+Pj4+IEJ1dCBfX3RsYl9iYXRjaF9mcmVlX2Vu
Y29kZWRfcGFnZXMoKSBpcyBhbHNvIHVzZWQgdG8gZnJlZSBub3JtYWwgcGFnZXMKPj4+Pj4gKG5v
dCBwYWdlIHRhYmxlIHBhZ2VzKSwgc28gSSBkb24ndCB3YW50IHRvIGFkZCBvdmVyaGVhZCB0aGVy
ZS4KPj4+Pgo+Pj4+IEludGVyZXN0aW5nLCBjYW4gYSB0bGIgYmF0Y2ggcmVmZXIgdG8gcGFnZXMg
dGhhbiBhcmUgbm90IFBUUHMgdGhlbj8KPj4+Cj4+PiBZZXMsIHlvdSBjYW4gc2VlIHRoZSBjYWxs
ZXIgb2YgX190bGJfcmVtb3ZlX2ZvbGlvX3BhZ2VzKCkgb3IKPj4+IHRsYl9yZW1vdmVfcGFnZV9z
aXplKCkuCj4gCj4gSSBoYWQgYSBicmllZiBsb29rIGJ1dCBjbGVhcmx5IG5vdCBhIGdvb2QgZW5v
dWdoIG9uZSEgSSBoYWRuJ3QgcmVhbGlzZWQKPiB0aGF0ICJ0YWJsZSIgaW4gdGxiX3JlbW92ZV90
YWJsZSgpIG1lYW5zIFBUUCwgd2hpbGUgInBhZ2UiIGluCj4gdGxiX3JlbW92ZV9wYWdlKCkgY2Fu
IG1lYW4gYW55IHBhZ2UsIGFuZCBpdCdzIG1ha2luZyBtb3JlIHNlbnNlIG5vdy4KPiAKPiBbLi4u
XQo+IAo+Pj4KPj4+IEZvciBhcm0sIHRoZSBjYWxsIHRvIHBhZ2V0YWJsZV9kdG9yKCkgaXMgaW5k
ZWVkIG1pc3NlZCBpbiB0aGUKPj4+IG5vbi1NTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFIGNhc2Uu
IFRoaXMgbmVlZHMgdG8gYmUgZml4ZWQuIEJ1dCB3ZQo+Pj4gY2FuJ3QgZml4IHRoaXMgYnkgYWRk
aW5nIHBhZ2V0YWJsZV9kdG9yKCkgdG8gdGxiX3JlbW92ZV90YWJsZSgpLAo+Pj4gYmVjYXVzZSBz
b21lIGFyY2hpdGVjdHVyZXMgY2FsbCB0bGJfcmVtb3ZlX3RhYmxlKCkgYnV0IGRvbid0IHN1cHBv
cnQKPj4+IHBhZ2UgdGFibGUgc3RhdGlzdGljcywgbGlrZSBzcGFyYy4KPiAKPiBXaGVuIEkgaW52
ZXN0aWdhdGVkIHRoaXMgZm9yIG15IG93biBzZXJpZXMsIEkgZm91bmQgdGhhdCB0aGUgb25seSBj
YXNlCj4gd2hlcmUgY3Rvci9kdG9yIGFyZSBub3QgY2FsbGVkIGZvciBwYWdlLXNpemVkIHBhZ2Ug
dGFibGVzIGlzIDMyLWJpdAo+IHNwYXJjIChzZWUgdGFibGUgYXQgdGhlIGVuZCBvZiBbMV0pLiBI
b3dldmVyIG9ubHkgNjQtYml0IHNwYXJjIG1ha2VzIHVzZQo+IG9mIHRsYl9yZW1vdmVfdGFibGUo
KSAoYXQgUFRFIGxldmVsLCB3aGVyZSBjdG9yL2R0b3IgYXJlIGFscmVhZHkgY2FsbGVkKS4KClRo
YW5rcyBmb3IgcHJvdmlkaW5nIHRoaXMgaW5mb3JtYXRpb24uCgo+IAo+IFNvIHJlYWxseSBjYWxs
aW5nIHBhZ2V0YWJsZV9kdG9yKCkgZnJvbSB0bGJfcmVtb3ZlX3RhYmxlKCkgaW4gdGhlCj4gbm9u
LU1NVV9HQVRIRVJfVEFCTEVfRlJFRSBjYXNlIHNlZW1zIHRvIGJlIHRoZSBvYnZpb3VzIHRoaW5n
IHRvIGRvLgoKUmlnaHQuIEN1cnJlbnRseSwgb25seSBwb3dlcnBjLCBzcGFyYyBhbmQgeDg2IHdp
bGwgZGlyZWN0bHkgY2FsbAp0bGJfcmVtb3ZlX3RhYmxlKCksIGFuZCBhbGwgb2YgdGhlbSBhcmUg
aW4gdGhlIE1NVV9HQVRIRVJfVEFCTEVfRlJFRQpjYXNlLiBUaGVyZWZvcmUsIEkgdGhpbmsgdGhl
IG1vZGlmaWNhdGlvbiB5b3UgbWVudGlvbmVkIGJlbG93IGlzCmZlYXNpYmxlLgoKSW4gc3VtbWFy
eSwgY3VycmVudGx5IG9ubHkgYXJtIGNhbGxzIHRsYl9yZW1vdmVfdGFibGUoKSBpbiB0aGUKbm9u
LU1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgY2FzZS4gU28gSSB0aGluayB3ZSBjYW4gYWRkIHRo
aXMgZml4CmRpcmVjdGx5IHRvIHBhdGNoICM4LiBJZiBJIGhhdmVuJ3QgbWlzc2VkIGFueXRoaW5n
LCBJJ2xsIHNlbmQgYW4KdXBkYXRlZCBwYXRjaCAjOC4KCj4gCj4gT25jZSB0aGlzIGlzIGRvbmUs
IHdlIHNob3VsZCBiZSBhYmxlIHRvIHJlcGxhY2UgYWxsIHRob3NlIGNvbmZ1c2luZwo+IGNhbGxz
IHRvIHRsYl9yZW1vdmVfcGFnZSgpIG9uIFBUUHMgd2l0aCB0bGJfcmVtb3ZlX3RhYmxlKCkgYW5k
IHJlbW92ZQo+IHRoZSBleHBsaWNpdCBjYWxsIHRvIHBhZ2V0YWJsZV9kdG9yKCkuIEFJVUkgdGhp
cyBpcyBlc3NlbnRpYWxseSB3aGF0Cj4gUGV0ZXIgc3VnZ2VzdGVkIG9uIHYzIFsyXS4KClNpbmNl
IHRoaXMgcGF0Y2ggc2VyaWVzIGlzIG1haW5seSBmb3IgYnVnIGZpeCwgSSB0aGluayB0aGF0IHRo
ZXNlIHRoaW5ncwpjYW4gYmUgZG9uZSBpbiBzZXBhcmF0ZSBwYXRjaCBzZXJpZXMgbGF0ZXIuCgo+
IAo+IFsxXQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMjQxMjE5MTY0NDI1
LjIyNzcwMjItMS1rZXZpbi5icm9kc2t5QGFybS5jb20vCj4gWzJdCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbW0vMjAyNTAxMDMxMTE0NTcuR0MyMjkzNEBub2lzeS5wcm9ncmFtbWlu
Zy5raWNrcy1hc3MubmV0Lwo+IAo+IFsuLi5dCj4gCj4+IE9yIGNhbiB3ZSBqdXN0IG5vdCBsZXQg
dGxiX3JlbW92ZV90YWJsZSgpIGZhbGwgYmFjayB0bwo+PiB0bGJfcmVtb3ZlX3BhZ2UoKT8gTGlr
ZSB0aGUgZm9sbG93aW5nOgo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90
bGIuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgKPj4gaW5kZXggYTU5MjA1ODYzZjQzMS4u
MzU0ZmZhYTRiZDEyMCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaAo+
PiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oCj4+IEBAIC0xOTUsOCArMTk1LDYgQEAK
Pj4gIMKgICrCoCB2YXJpb3VzIHB0ZXBfZ2V0X2FuZF9jbGVhcigpIGZ1bmN0aW9ucy4KPj4gIMKg
ICovCj4+Cj4+IC0jaWZkZWYgQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRQo+PiAtCj4+ICDC
oHN0cnVjdCBtbXVfdGFibGVfYmF0Y2ggewo+PiAgwqAjaWZkZWYgQ09ORklHX01NVV9HQVRIRVJf
UkNVX1RBQkxFX0ZSRUUKPj4gIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCByY3VfaGVhZMKgwqDCoMKg
wqDCoMKgwqAgcmN1Owo+PiBAQCAtMjE5LDE2ICsyMTcsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
X190bGJfcmVtb3ZlX3RhYmxlKHZvaWQgKnRhYmxlKQo+Pgo+PiAgwqBleHRlcm4gdm9pZCB0bGJf
cmVtb3ZlX3RhYmxlKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHZvaWQgKnRhYmxlKTsKPj4KPj4g
LSNlbHNlIC8qICFDT05GSUdfTU1VX0dBVEhFUl9IQVZFX1RBQkxFX0ZSRUUgKi8KPj4gLQo+PiAt
LyoKPj4gLSAqIFdpdGhvdXQgTU1VX0dBVEhFUl9UQUJMRV9GUkVFIHRoZSBhcmNoaXRlY3R1cmUg
aXMgYXNzdW1lZCB0byBoYXZlCj4+IHBhZ2UgYmFzZWQKPj4gLSAqIHBhZ2UgZGlyZWN0b3JpZXMg
YW5kIHdlIGNhbiB1c2UgdGhlIG5vcm1hbCBwYWdlIGJhdGNoaW5nIHRvIGZyZWUKPj4gdGhlbS4K
Pj4gLSAqLwo+PiAtI2RlZmluZSB0bGJfcmVtb3ZlX3RhYmxlKHRsYiwgcGFnZSkgdGxiX3JlbW92
ZV9wYWdlKCh0bGIpLCAocGFnZSkpCj4gCj4gV2Ugc3RpbGwgbmVlZCBhIGRpZmZlcmVudCBpbXBs
ZW1lbnRhdGlvbiBvZiB0bGJfcmVtb3ZlX3RhYmxlKCkgaW4gdGhpcwo+IGNhc2UuIFdlIGNvdWxk
IGRlZmluZSBpdCBpbmxpbmUgaGVyZToKPiAKPiBzdGF0aWMgaW5saW5lIHZvaWQgdGxiX3JlbW92
ZV90YWJsZShzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCB2b2lkICp0YWJsZSkKPiB7Cj4gIMKgwqDC
oCBzdHJ1Y3QgcGFnZSAqcGFnZSA9IHRhYmxlOwo+IAo+ICDCoMKgwqAgcGFnZXRhYmxlX2R0b3Io
cGFnZV9wdGRlc2MocGFnZSkpOwo+ICDCoMKgwqAgdGxiX3JlbW92ZV9wYWdlKHBhZ2UpOwo+IH0K
ClJpZ2h0LiBBcyBJIHNhaWQgYWJvdmUsIHdpbGwgYWRkIHRoaXMgdG8gdGhlIHVwZGF0ZWQgcGF0
Y2ggIzguCgpUaGFua3MhCgo+IAo+IC0gS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
