Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9F5C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMy0hW+t4Zkwndn+cNJxDNgQCQqH+rQSoanjIK3d36Q=; b=dEaxV9tjekxDGB
	baaapTczeYnFdqU2Z0lk4JNNrDmikFyndHjCKwAOErGNayTtIyHPymkhTevUUL30aLut0Bi1ZV/jR
	gsZg5/iNgBb5lK0MDHCjP7q7wx7TSwtOzGSa5sYr7tJJq2kLENp6ouND4jZFOVBEjahPQGxuZs7Ug
	3DHnV2bbHozr5irds3pesV8b1Ot0R/ynPfavVFomNjd012+ORc0iBaxDDynXg0U5QNIE5ykt6iDIJ
	NxbsVBqFXpqt3RPKJEKfcOKcNFeptfiWMAowGA+gyJSR23gR45theqgVM5IBwBDUtW1Jt5Woo2BKc
	FS3bHiBsB21HVJ9hzvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5oy-00GdhJ-0j; Mon, 07 Nov 2022 17:22:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5ov-00Gdeu-5f
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 17:22:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4CA4B611D9;
	Mon,  7 Nov 2022 17:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B76DC433D7;
	Mon,  7 Nov 2022 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667841717;
	bh=I73tNza4oxz8JX4yGvw/47qdbUlRa9qyt36gyUC68qY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Hfq/PCBTSirpCpEvqjM6/q+o3q1tAAJbMNmyPnIGlLcvgwCPVNCQfyjycNO6BXj0K
	 FpAPlRG1zH5GQGo8+NvMt0QiZwtqrnPlRUunSiB81PeR1M8yIiNBSjy1CLSK2zF9Sw
	 OiqLDSzUjGLZIWqeoLttICGwWzB2Kv89qSq9m1SCsa0suthy9mkD4tWul39OM1nX4l
	 yYhhRPWbDjpmPDt6PEb2BReKaJl+oO9K1wprRkZ22anYTQb+qr6Mi+b/UX4fR37U51
	 4X22DNjH9fX29+0nOCB+AwuO8o8glPBhUrxbP3wbEpCVlDAWcAMJuqtX9ZmGBrYKKK
	 3nlJNfN7LXLoA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chris Stillson <stillson@rivosinc.com>
Cc: Greentime Hu <greentime.hu@sifive.com>, Guo Ren
 <guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 04/17] riscv: Add vector feature to compile
In-Reply-To: <20220921214439.1491510-4-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-4-stillson@rivosinc.com>
Date: Mon, 07 Nov 2022 18:21:54 +0100
Message-ID: <87zgd2d6j1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_092201_268470_F1D0174C 
X-CRM114-Status: GOOD (  17.17  )
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

W0Nyb3BwaW5nIHRoZSBodWdlIENjOi1saXN0Ll0KCkNocmlzIFN0aWxsc29uIDxzdGlsbHNvbkBy
aXZvc2luYy5jb20+IHdyaXRlczoKCj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJh
YmEuY29tPgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGNvbmZpZyBvcHRpb24gd2hpY2ggY291
bGQgZW5hYmxlIGFzc2VtYmxlcidzCj4gdmVjdG9yIGZlYXR1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBH
cmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEdy
ZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
S2NvbmZpZyAgfCAxNSArKysrKysrKysrKysrLS0KPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSB8ICAx
ICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
IGluZGV4IGVkNjZjMzFlNDY1NS4uZTI5NGQ4NWJmYjdkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC00MzIsNyArNDMyLDE3
IEBAIGNvbmZpZyBGUFUKPiAgCj4gIAkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVy
ZSwgc2F5IFkuCj4gIAo+IC1lbmRtZW51ICMgIlBsYXRmb3JtIHR5cGUiCj4gK2NvbmZpZyBWRUNU
T1IKPiArCWJvb2wgIlZFQ1RPUiBzdXBwb3J0Igo+ICsJZGVwZW5kcyBvbiBHQ0NfVkVSU0lPTiA+
PSAxMjAwMDAgfHwgQ0xBTkdfVkVSU0lPTiA+PSAxMzAwMDAKPiArCWRlZmF1bHQgbgo+ICsJaGVs
cAo+ICsJICBTYXkgTiBoZXJlIGlmIHlvdSB3YW50IHRvIGRpc2FibGUgYWxsIHZlY3RvciByZWxh
dGVkIHByb2NlZHVyZQo+ICsJICBpbiB0aGUga2VybmVsLgo+ICsKPiArCSAgSWYgeW91IGRvbid0
IGtub3cgd2hhdCB0byBkbyBoZXJlLCBzYXkgWS4KPiArCj4gK2VuZG1lbnUKCiJWRUNUT1IiIGlz
IG5vdCByZWFsbHkgY29uc2lzdGVudCB0byBob3cgdGhlIG90aGVyIGNvbmZpZ3MgYXJlIG5hbWVk
OwpSSVNDVl9JU0FfViwgUklTQ1ZfSVNBX1ZFQ1RPUiwgUklTQ1ZfVkVDVE9SPwoKCkJqw7ZybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
