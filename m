Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5C6C61DD9
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2c4JbnRbAgMwaK8wXAzUTcxP17H62QTijsofnTk8Yiw=; b=h5zMLE4TGyL5Ob
	FxfBg9i7y4aAUoYu0a8FC0CLPr8E0NtK5W5LahJmt+W/GN3dl6nUPq1dkrpg/H3i0cYd8DhEvKU/B
	QQ8RGXFtLHftTaKjkuDt2sg9gnsh86ntT/kqFvaJBTVDH45pBjacgZDXmo7rSS4Gv29rREMPlwres
	Q4tW4k/oJ8BOPQGO+mNrNI9oZ1dKYDUzk5YGiic8kSahPG7YAAvKM7ozps3+EZbgbWV43gSO+j+Rj
	wm6zZHGkiTWg1JfbWlxZyrMvThQGp9P8aoKvN6+NtNyvxZyijLsYAQCRHK4rTjYlXGiIs/TwHktnU
	ywmV/PnZ/VKnnDLERadA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0L2k-000000074Ct-2rJx;
	Sat, 29 Aug 2026 15:32:30 +0000
Received: from out-93.mta1.migadu.com ([2001:41d0:203:375::5d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0L2h-000000074CJ-0n92
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 15:32:29 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rVDiljO1F/6NW9J+RzyY5uFSv7wjCnJUzm58AOKLow4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788017536; v=1; x=1788622336;
 b=IAiGhBJV3ErO51HVBRJFLsS8+hV8bglKXR/gQMNrCWIXzS1wPrQBtvO5rXPHawySit5P0ht2
 alwtPClTtQEKSI+z9CC7W6mJrQ3i0TT7n6tXH87LupeVrCEzZhyMRDBP6uALftDaCsnB5U0khy5
 TxQYp3C9DUoU561WFe7quXgMWmyxD/wcWEDi+fT38p6TedHw8QHInleV1keouByW1PmP9xb6Ix4
 vemyBxO3gvM1qcgmldaeh2L8fzPrF6pG8YNobiQq9A25cnVxIQfWoU48mNXgPWIPyNxt0o8P03B
 NG6DMIr1YnIAwLvzt4qs2GFBFTbIVuhxNixC+F7WPHhOA==
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b9416c6ab96456f8;
	Sat, 29 Aug 2026 15:32:06 +0000
X-Mizu-Trace-ID: b9416c6ab96456f8
X-Migadu-Flow: FLOW_OUT
Date: Sat, 29 Aug 2026 23:32:02 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apL7ctZhcN5t77Yu@wyuan.org>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_083227_833151_283F5FA5 
X-CRM114-Status: GOOD (  11.36  )
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

SGksIGl0J3MgbWUgYWdhaW4gOy0pCgpPbiBTYXQsIEF1ZyAyOSwgMjAyNiBhdCAxMjoxNToxMFBN
ICswODAwLCBZdWthaSBXdSB3cm90ZToKPiBVcGRhdGUgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2
L3ZtLWxheW91dC5yc3QgdHJhbnNsYXRpb24uCj4gCj4gVXBkYXRlIHRoZSB0cmFuc2xhdGlvbiB0
aHJvdWdoIGNvbW1pdCA5NTQyNjBmZjVhNDYKPiAoIlJldmVydCAiUklTQy1WOiBtbTogRG9jdW1l
bnQgbW1hcCBjaGFuZ2VzIiIpCgpTb21laG93IEkgZ3Vlc3MgeW91IGRpZG4ndCBnZXQgdGhlIGFj
dHVhbCBtZWFuaW5nIGJlaGluZCB0aGlzICJVcGRhdGUgeHh4CnRocm91Z2ggY29tbWl0Li4uIi4K
CkNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLiBJZiB5b3Ugd3JpdGUgdGhpcyBsaW5lIGluIHlvdXIg
Y29tbWl0IG1lc3NhZ2UuClRoZW4gaXQgbWVhbnMgaWYgd2UgYXBwbHkgdGhpcyBwYXRjaCBvZiB5
b3Vycy4gVGhlIENoaW5lc2UgZG9jdW1lbnRhdGlvbgpvZiB0aGlzIGZpbGUgc2hvdWxkIGJlIGFs
cmVhZHkgX2NvbXBsZXRlbHlfIHN5bmNocm9uaXplZC4KCkhvd2V2ZXIsIHRoZSBjdXJyZW50IHRy
YW5zbGF0aW9uIG9mIHRoaXMgZmlsZSBpcyBtaXNzaW5nIHRoaXMgcGFydDoKClJJU0MtViBMaW51
eCBLZXJuZWwgU1Y1NwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCi4uLiB3aGljaCBpcyBub3Qg
dHJhbnNsYXRlZC9zeW5jaHJvbml6ZWQgaW4geW91ciBwYXRjaC4KCgpOb3RlIHRoYXQgSSdtIG5v
dCBibGFtaW5nIG9uIHlvdSBmb3IgdGhpcy4gQnV0IEkgZmVlbCB0aGlzIGlzIGEgcG9pbnQKdGhh
dCBhIG5ld2NvbWVyIG1pZ2h0IGZpbmQgY29uZnVzaW5nLCBpbmNsdWRpbmcgbWUgYW5kIENoZW4t
WXUgYSBjb3VwbGUKb2Ygd2Vla3MgYWdvLCBpZiBkaWQgbm90IHJlYWQgdGhlIHNjcmlwdC4KCk91
ciBjdXJyZW50IGhvdy10by5yc3Qgb25seSBhc2tzIHRvIHdyaXRlIHRoaXMgbGluZSBpbiB0aGUg
Y29tbWl0Cm1lc3NhZ2UgYnV0IGRvZXMgbm90IGV4cGxhaW4gdGhlIHJlc3VsdHMgb3IgdGhlIGFj
dHVhbCB3b3JrIGJlaGluZCBpdC4KClsuLi5dCglVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91
Z2ggY29tbWl0IGIwODBlNTIxMTBlYQoJKCJkb2NzOiB1cGRhdGUgc2VsZi1wcm90ZWN0aW9uIF9f
cm9fYWZ0ZXJfaW5pdCBzdGF0dXMiKQoJIyDor7fmiafooYwgZ2l0IGxvZyAtLW9uZWxpbmUgPOaC
qOe/u+ivkeeahOiLseaWh+aWh+aho+i3r+W+hD7vvIzlubbmm7/mjaLkuIrov7DlhoXlrrkKCglT
byB3aGVuIGEgbmV3Y29tZXIgY29tZXMgYW5kIGp1c3QgZG9lcyB3aGF0IHRoaXMgYXNrcywgd2l0
aG91dAoJY29uc2lkZXJpbmcgd2hldGhlciBoaXMvaGVyL2l0cyB0cmFuc2xhdGlvbiBpcyBjb21w
bGV0ZWx5CglzeW5jaHJvbml6ZWQgb3Igbm90LCBvdXIgc2NyaXB0IHdvdWxkIGJlIGtpbmQgb2Yg
aW5hY2N1cmF0ZS4gPwoKTWF5YmUgd2UgY2FuIGFkZCBhIGRlc2NyaXB0aW9uIG9yIGEgaGludCBs
aWtlOgoKSWYgeW91ciBjdXJyZW50IGNoYW5nZXMgbWFrZSB0aGUgdHJhbnNsYXRpb24gY29tcGxl
dGVseSBpbiBsaW5lIHdpdGggdGhlCkVuZ2xpc2ggdmVyc2lvbiwgdGhlbiBwbGVhc2UgYWRkIHRo
aXMgbGluZSBhZnRlciB5b3VyIGRlc2NyaXB0aW9ucyBhbmQKYmVmb3JlIGEgYmxhbmsgbGluZSBh
bmQgeW91ciBzaWduLW9mZjoKClVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQg
ZTgzYzUxNjMzMTZmCihJbml0aWFsIHJldmlzaW9uIG9mICJnaXQiLCB0aGUgaW5mb3JtYXRpb24g
bWFuYWdlciBmcm9tIGhlbGwpCgouLnRoZW4gZm9sbG93cyBhIHRlbXBsYXRlIGNvbW1pdCBtZXNz
YWdlCgoKQW55IGlkZWFzPwoKKFNob3VsZCBJIGNjIHRoZSBvcmlnaW5hbCBhdXRob3JzIG9mIHRo
ZSBzY3JpcHQ/KQoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
