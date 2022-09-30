Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7B3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UATyv4+3vMseSrvXudceMgjhlDlPQvo8YKLksUHIMhU=; b=BbTDkXp2eo9Kde
	fhlIdVdi/erSDzIsr/gvJZpFkaP2E0AFS/X4D07Wy6aYD3arpb0eFZS+BUga29ZhUQ8XtpfUrt26v
	AM69YNAP6QMDDgB4j3tQ6j9bZYVqT85QJHHTpkW8p7lHnaCOKSVv0M4MTfu6zlyBSsSG7kGshN3ou
	1KJjAqJ3Zcbk64pCwiEIgezGiQer4VEEdCFu9aGADUOPdKxMPA5d93tfsWM3wXt5WC6Q95xbV+mvp
	htZ1040jxSCWMJzclxXKZxn1pnvnHsVWrVR2bC3CkbRfcstxHA3O/y1ZZQwW+BemHhi0fPazB1rEM
	Ui2Q7AdbLValQGigmotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBBw-0081Z0-3e; Fri, 30 Sep 2022 08:16:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBBl-0081UR-Bt; Fri, 30 Sep 2022 08:16:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 69959CE2451;
	Fri, 30 Sep 2022 08:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24966C433D7;
	Fri, 30 Sep 2022 08:15:51 +0000 (UTC)
Date: Fri, 30 Sep 2022 09:15:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: will@kernel.org, guoren@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mhiramat@kernel.org,
	rostedt@goodmis.org, maz@kernel.org, alexandru.elisei@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
Message-ID: <YzaltNF5PqYq4x4O@arm.com>
References: <20220927022435.129965-1-liaochang1@huawei.com>
 <20220927022435.129965-4-liaochang1@huawei.com>
 <YzXM4qMZlNWh/JJy@arm.com>
 <c301bfbe-afa8-ab1a-9062-56e4612fdf2c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c301bfbe-afa8-ab1a-9062-56e4612fdf2c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_011605_799569_AC627237 
X-CRM114-Status: GOOD (  17.41  )
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

T24gRnJpLCBTZXAgMzAsIDIwMjIgYXQgMDk6MDI6MjBBTSArMDgwMCwgbGlhb2NoYW5nIChBKSB3
cm90ZToKPiAKPiAKPiDlnKggMjAyMi85LzMwIDA6NTAsIENhdGFsaW4gTWFyaW5hcyDlhpnpgZM6
Cj4gPiBPbiBUdWUsIFNlcCAyNywgMjAyMiBhdCAxMDoyNDozNUFNICswODAwLCBMaWFvIENoYW5n
IHdyb3RlOgo+ID4+IFNpbmdsZS1zdGVwIHNsb3Qgd291bGQgbm90IGJlIHVzZWQgdW50aWwga3By
b2JlIGlzIGVuYWJsZWQsIHRoYXQgbWVhbnMKPiA+PiBubyByYWNlIGNvbmRpdGlvbiBvY2N1cnMg
b24gaXQgdW5kZXIgU01QLCBoZW5jZSBpdCBpcyBzYWZlIHRvIHBhY3RoIHNzCj4gPj4gc2xvdCB3
aXRob3V0IHN0b3BwaW5nIG1hY2hpbmUuCj4gPj4KPiA+PiBTaW5jZSBJIGFuZCBEIGNhY2hlcyBh
cmUgY29oZXJlbnQgd2l0aGluIHNpbmdsZS1zdGVwIHNsb3QgZnJvbQo+ID4+IGFhcmNoNjRfaW5z
bl9wYXRjaF90ZXh0X25vc3luYygpLCBoZW5jZSBubyBuZWVkIHRvIGRvIGl0IGFnYWluIHZpYQo+
ID4+IGZsdXNoX2ljYWNoZV9yYW5nZSgpLgo+ID4+Cj4gPj4gQWNrZWQtYnk6IFdpbGwgRGVhY29u
IDx3aWxsQGtlcm5lbC5vcmc+Cj4gPj4gQWNrZWQtYnk6IE1hc2FtaSBIaXJhbWF0c3UgKEdvb2ds
ZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+Cj4gPj4gU2lnbmVkLW9mZi1ieTogTGlhbyBDaGFuZyA8
bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+ID4+IC0tLQo+ID4+ICBhcmNoL2FybTY0L2tlcm5lbC9w
cm9iZXMva3Byb2Jlcy5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBX
aGF0J3MgeW91ciBleHBlY3RhdGlvbiB3aXRoIHRoaXMgc2VyaWVzLCBzaG91bGQgdGhlIGFyY2gg
bWFpbnRhaW5lcnMKPiA+IGp1c3QgcGljayB0aGUgaW5kaXZpZHVhbCBwYXRjaGVzPwo+IAo+IFll
cywgb3Igc2hvdWxkIGkgc3BsaXQgdGhpcyBzZXJpZXMgaW50byBpbmRpdmlkdWFsIHBhdGNoPwoK
Tm8gbmVlZCB0bywgSSBjYW4gcGljayB0aGUgYXJtNjQgcGF0Y2guIElmIHRoZSBvdGhlciBtYWlu
dGFpbmVycyBkb24ndAptZXJnZSB0aGUgcGF0Y2hlcywgeW91IG1pZ2h0IHdhbnQgdG8gcG9zdCB0
aGVtIGFnYWluIGluZGl2aWR1YWxseSBhcyB0bwphdm9pZCBjb25mdXNpb24uCgotLSAKQ2F0YWxp
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
