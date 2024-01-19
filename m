Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91554C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hV9Kr1EmkOmXFFuLxLTL+8GvxI4ebtrOb3aYEbvYMhA=; b=jTbFxg76Wz1uhY
	paluxUMmixNbpoV0H+6dDnChzsCdFVuzl4L3PxO+aVS+5yt8PmNwj2tNV0Yo1UTu1BqkatE79EqVe
	j8vQQ1reg16IJzpXFOW44KneeDZH6IgeJCqdRBl80hLeVJ1i2sjK+EYPwfwR8ukpOWnuNdn3ksMlQ
	L2qkp5KDQkI6XPLGqxQUwYbiSPbJLwx0p1D2S5pHTlToGCiVc1mR+Oo47NGHRCcke0DkZlUa7iIxv
	9vthWB8AU7rXvrrddUA9Gctg0AbTK15b3k59x0JjrQWEAr1RVMXm9eHGVnHPIhKP1Mz69K0FB++6Z
	I48CRtzY6nWAVCpHf/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQtC8-006Kkf-30;
	Fri, 19 Jan 2024 18:02:20 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQtC6-006Kk4-0E;
	Fri, 19 Jan 2024 18:02:19 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5f68af028afso8915877b3.2;
        Fri, 19 Jan 2024 10:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705687335; x=1706292135; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5b/i454jUf4ojxYvY+VxBq+cGu5zdwzrcVsmFXePrUc=;
        b=OEi993k+6f5Xjnmhh5XDgRGc91MGh9eggssk/yOPXTs2UfUaVpP5lzW69Hl4G5GMMQ
         VwPVUgfQqa/UvHy1oOzkoTRRfaB2oWakam02ywjlhvJ9mBrOPfVv/buxbj++rll09dmT
         2lisP8IaZxLwjql2wwWpaC0uBMTlrXtpotcHKlSLXNOYcXygq4zeKL/H+tl42cBaUkMr
         y0Iwxdu2iI6rKWTAptUrXNiGTNHryAAX/R5+g0YVdsCCDGCegsNDfYbYw35jKQaPEcFP
         ROnQiOMFq+u8yqnXflTLYHIRUczLkbXHnje3f7rlikLyA/Usjr0d20riiRgp7CPFlwE5
         yHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705687335; x=1706292135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5b/i454jUf4ojxYvY+VxBq+cGu5zdwzrcVsmFXePrUc=;
        b=b9bzniPGTp90Teth2ah1Na6bWqmZRf55dNWYr7UvZBB9b3g0sNV3mZNad3dwtwfkOY
         mN+WvmBEJj5yuUKpoUtrCCt2fheW9qwoUMsU2rYxr3mzYr45QLrnlLdPYmBfCTjl7xhE
         dyRS+38LQ01Q5yqmPZ3ZByCjcJZfmm3wdL5auRsGYaMVI5cxCoM2xNZHVn2fsU6beVtP
         +t57Ave66g/GnZxp3pNduMFpZva5DPY5Xi8VwyDbb4pbNvBOoJP8jvINO5XsJroqCuw3
         eQob7VnZ9IgTee0hE1cmyzTUyitOS2CTYvxpzkCqCKn/fpQHUkD7fdHklgGq141ly3l+
         vLIg==
X-Gm-Message-State: AOJu0YxnttplwDLD/vN84FLNtD8Vpz0UJ2GDphwnEsN8X5f+bhI47MwS
	1PFX1BNt8lmkxcGHlB/KO78TOphHgGRgOLfel247wwvkYJqdsC15
X-Google-Smtp-Source: AGHT+IH9gcZrsox+4pkG+XVC3K2DCkhX2jg2gbQvfcMMKA5AWgDkyl6PTnKywYab9xjZ/eqMztcaSA==
X-Received: by 2002:a0d:e003:0:b0:5ff:9567:c81 with SMTP id j3-20020a0de003000000b005ff95670c81mr286738ywe.22.1705687334593;
        Fri, 19 Jan 2024 10:02:14 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2288:782e:a717:678d])
        by smtp.gmail.com with ESMTPSA id n68-20020a0dcb47000000b005ff877093easm1389519ywd.143.2024.01.19.10.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 10:02:14 -0800 (PST)
Date: Fri, 19 Jan 2024 10:02:13 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org, patches@amperecomputing.com,
	rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kuba@kernel.org, vschneid@redhat.com,
	mingo@kernel.org, akpm@linux-foundation.org, vbabka@suse.cz,
	tglx@linutronix.de, jpoimboe@kernel.org, ndesaulniers@google.com,
	mikelley@microsoft.com, mhiramat@kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
	cl@os.amperecomputing.com
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <Zaq5JT6SaiogCEkT@yury-ThinkPad>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
 <Zao13I4Bb0tur0fZ@kernel.org>
 <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_100218_114702_2ACC8BD0 
X-CRM114-Status: GOOD (  37.57  )
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

T24gRnJpLCBKYW4gMTksIDIwMjQgYXQgMDQ6NTA6NTNQTSArMDgwMCwgU2hpamllIEh1YW5nIHdy
b3RlOgo+IAo+IOWcqCAyMDI0LzEvMTkgMTY6NDIsIE1pa2UgUmFwb3BvcnQg5YaZ6YGTOgo+ID4g
T24gRnJpLCBKYW4gMTksIDIwMjQgYXQgMDI6NDY6MTZQTSArMDgwMCwgU2hpamllIEh1YW5nIHdy
b3RlOgo+ID4gPiDlnKggMjAyNC8xLzE5IDEyOjQyLCBZdXJ5IE5vcm92IOWGmemBkzoKPiA+ID4g
PiBUaGlzIGFkZHMgYW5vdGhlciBsZXZlbCBvZiBpbmRpcmVjdGlvbiwgSSB0aGluay4gQ3VycmVu
dGx5IGNwdV90b19ub2RlCj4gPiA+ID4gaXMgYSBzaW1wbGUgaW5saW5lci4gQWZ0ZXIgdGhlIHBh
dGNoIGl0IHdvdWxkIGJlIGEgcmVhbCBmdW5jdGlvbiB3aXRoCj4gPiA+ID4gYWxsIHRoZSBhc3Nv
Y2lhdGUgb3ZlcmhlYWQuIENhbiB5b3Ugc2hhcmUgYSBibG9hdC1vLW1ldGVyIG91dHB1dCBoZXJl
Pwo+ID4gPiAjLi9zY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgdm1saW51eCB2bWxpbnV4Lm5ldwo+ID4g
PiBhZGQvcmVtb3ZlOiA2LzEgZ3Jvdy9zaHJpbms6IDYxLzUxIHVwL2Rvd246IDExNjgvLTU4OCAo
NTgwKQo+ID4gPiBGdW5jdGlvbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvbGTCoMKgwqDCoCBuZXfCoMKgIGRl
bHRhCj4gPiA+IG51bWFfdXBkYXRlX2NwdcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTQ4wqDCoMKgwqAgMjQ0wqDCoMKgwqAgKzk2Cj4g
PiA+IAo+ID4gPiAgwqAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLih0byBtYW55IHRvIHNraXApCj4gPiA+IAo+
ID4gPiBUb3RhbDogQmVmb3JlPTMyOTkwMTMwLCBBZnRlcj0zMjk5MDcxMCwgY2hnICswLjAwJQo+
ID4gSXQncyBub3Qgb25seSBhYm91dCB0ZXh0IHNpemUsIHRoZSBpbmRpcmVjdCBjYWxsIGFsc28g
aHVydHMgcGVyZm9ybWFuY2UKPiAKPiBUaGUgY3B1X3RvX25vZGUoKSBpcyBjYWxsZWQgYXQgdmVy
eSBsb3cgZnJlcXVlbmN5LCBtb3N0IG9mIHRoZSB0aW1lcyBpcyBpbgo+IHRoZSBrZXJuZWwgYm9v
dGluZyB0aW1lLgogClRoYXQgZG9lc24ndCBtYXR0ZXIuIFRoaXMgZnVuY3Rpb24gaXMgYSBzaW1w
bGUgaW5saW5lciB0aGF0IGRlcmVmZXJlbmNlcwphIHBvaW50ZXIsIGFuZCBJIGJlbGlldmUgYWxs
IG9mIHVzIHdhbnQgdG8ga2VlcCBpdCBzaW1wbGUuIAogCj4gPiA+ID4gUmVnYXJkbGVzcywgSSBk
b24ndCB0aGluayB0aGF0IHRoZSBhcHByb2FjaCBpcyBjb3JyZWN0LiBBcyBwZXIgeW91cgo+ID4g
PiA+IGRlc2NyaXB0aW9uLCBzb21lIGluaXRpYWxpemF0aW9uIGZ1bmN0aW9ucyBlcnJvbmVvdXNs
eSBjYWxsCj4gPiA+ID4gY3B1X3RvX25vZGUoKSBpbnN0ZWFkIG9mIGVhcmx5X2NwdV90b19ub2Rl
KCkgd2hpY2ggZXhpc3RzIHNwZWNpZmljYWxseQo+ID4gPiA+IGZvciB0aGF0IGNhc2UuCj4gPiA+
ID4gCj4gPiA+ID4gSWYgdGhlIGFib3ZlIGNvcnJlY3QsIGl0J3MgY2xlYXJseSBhIGNhbGxlciBw
cm9ibGVtLCBhbmQgdGhlIGZpeCBpcyB0bwo+ID4gPiA+IHNpbXBseSBzd2l0Y2ggYWxsIHRob3Nl
IGNhbGxlcnMgdG8gdXNlIGVhcmx5IHZlcnNpb24uCj4gPiA+IEl0IGlzIGVhc3kgdG8gY2hhbmdl
IHRvIGVhcmx5X2NwdV90b19ub2RlKCkgZm9yIHNjaGVkX2luaXQoKSwKPiA+ID4gaW5pdF9zY2hl
ZF9mYWlyX2NsYXNzKCkKPiA+ID4gCj4gPiA+IGFuZCB3b3JrcXVldWVfaW5pdF9lYXJseSgpLiBU
aGVzZSB0aHJlZSBwbGFjZXMgY2FsbCB0aGUgY3B1X3RvX25vZGUoKSBpbiB0aGUKPiA+ID4gX19p
bml0IGZ1bmN0aW9uLgo+ID4gPiAKPiA+ID4gCj4gPiA+IEJ1dCBpdCBpcyBhIGxpdHRsZSBoYXJk
IHRvIGNoYW5nZSB0aGUgZWFybHlfdHJhY2VfaW5pdCgpLCBzaW5jZSBpdCBjYWxscwo+ID4gPiBj
cHVfdG9fbm9kZSBpbiB0aGUgZGVlcAo+ID4gPiAKPiA+ID4gZnVuY3Rpb24gc3RhY2s6Cj4gPiA+
IAo+ID4gPiAgwqAgZWFybHlfdHJhY2VfaW5pdCgpIC0tPiByaW5nX2J1ZmZlcl9hbGxvYygpIC0t
PnJiX2FsbG9jYXRlX2NwdV9idWZmZXIoKQo+ID4gPiAKPiA+ID4gCj4gPiA+IEZvciBlYXJseV90
cmFjZV9pbml0KCksIHdlIG5lZWQgdG8gY2hhbmdlIG1vcmUgY29kZS4KPiA+ID4gCj4gPiA+IAo+
ID4gPiBBbnl3YXksIElmIHdlIHRoaW5rIGl0IGlzIG5vdCBhIGdvb2QgaWRlYSB0byBjaGFuZ2Ug
dGhlIGNvbW1vbiBjb2RlLCBJIGFtCj4gPiA+IG9ha3kgdG9vLgo+ID4gSXMgdGhlcmUgYSBmdW5k
YW1lbnRhbCByZWFzb24gdG8gaGF2ZSBlYXJseV9jcHVfdG9fbm9kZSgpIGF0IGFsbD8KPiAKPiBU
aGUgZWFybHlfY3B1X3RvX25vZGUgZG9lcyBub3Qgd29yayBvbiBzb21lIEFSQ0hzICh3aGljaCBz
dXBwb3J0IHRoZSBOVU1BKSwKPiBzdWNoCj4gCj4gYXPCoCBTUEFSQywgTUlQUyBhbmQgUzM5MC4K
ClNvLCB5b3VyIGFwcHJvYWNoIHdvdWxkbid0IHdvcmsgZWl0aGVyLCByaWdodD8gSSB0aGluayB5
b3UndmUgZ290IGEKdGVzdGluZyBib3QgcmVwb3J0IG9uIGl0IGFscmVhZHkuLi4KCllvdSBjYW4g
bWFrZSBpdCBsaWtlIHRoaXM6CgogICNpZmRlZiBDT05GSUdfQVJDSF9OT19FQVJMWV9DUFVfVE9f
Tk9ERQogICNkZWZpbmUgZWFybHlfY3B1X3RvX25vZGUgY3B1X3RvX25vZGUKICAjZW5kaWYKIAo+
ID4gSXQgc2VlbXMgdGhhdCBhbGwgdGhlIG1hcHBpbmdzIGFyZSBrbm93biBieSB0aGUgZW5kIG9m
IHNldHVwX2FyY2goKSBhbmQgdGhlCj4gPiBpbml0aWFsaXphdGlvbiBvZiBudW1hX25vZGUgY2Fu
IGJlIG1vdmVkIGVhcmxpZXIuCj4gPiA+ID4gSSB3b3VsZCBhbHNvIGluaXRpYWxpemUgdGhlIG51
bWFfbm9kZSB3aXRoIE5VTUFfTk9fTk9ERSBhdCBkZWNsYXJhdGlvbiwKPiA+ID4gPiBzbyB0aGF0
IGlmIHNvbWVvbmUgY2FsbHMgY3B1X3RvX25vZGUoKSBiZWZvcmUgdGhlIHZhcmlhYmxlIGlzIHBy
b3Blcmx5Cj4gPiA+ID4gaW5pdGlhbGl6ZWQgYXQgcnVudGltZSwgaGUnbGwgZ2V0IE5PX05PREUs
IHdoaWNoIGlzIG9idmlvdXNseSBhbiBlcnJvci4KPiA+ID4gRXZlbiB3ZSBzZXQgdGhlIG51bWFf
bm9kZSB3aXRoIE5VTUFfTk9fTk9ERSwgaXQgZG9lcyBub3QgYWx3YXlzIHByb2R1Y2UKPiA+ID4g
ZXJyb3IuCgpZb3UgY2FuIHByaW50IHRoaXMgZXJyb3IgeW91cnNlbGY6CgogICNpZm5kZWYgY3B1
X3RvX25vZGUKICBzdGF0aWMgaW5saW5lIGludCBjcHVfdG9fbm9kZShpbnQgY3B1KQogIHsKICAg
ICAgICBpbnQgbm9kZSA9IHBlcl9jcHUobnVtYV9ub2RlLCBjcHUpOwoKICAjaWZkZWYgQ09ORklH
X0RFQlVHX1BFUl9DUFVfTUFQUwogICAgICAgIGlmIChub2RlID09IE5VTUFfTk9fTk9ERSkKICAg
ICAgICAgICAgICAgIHByX2VyciguLi4pOwogICNlbmRpZgoKICAgICAgICAgIHJldHVybiBub2Rl
OwogIH0KICAjZW5kaWYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
