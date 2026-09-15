Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F84AC88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 03:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJP40OjLBCfc9lTnKoAwHgDQUaetN6x41Vn3gHs4cSs=; b=xLwWOkdRALXZ/b
	kvrGafYHFaa/HYy6kSS8n+NDb/8gVeyA9RdJUEeu54YfX3PJYBnmVNXRz21PT0d+BPxnK+AmczcQO
	98l2xqfFhpA/SgXPkfcVuM5nM7ZS10O3mCxqy8LINgFT6uW/thwhG0Uko7+6KCMykKw57TWv/1XBg
	ksP04hRnwvV0C2hLHZM1I/+ASpWxGb5FdLsWAqbTS7zEl7XZvISVcqx8JgGBE1FYWZdRTSrAr/j4o
	+3j9jJW73Led3Y0t40148Wfu38LfQPxIuIUUWSoO1g72ShjkdqRZ+lQ21gdkkyK3WjyPWfTyKQO4u
	q0pAWPLu68I/S/vYIhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6K5i-000000059A2-0sWg;
	Tue, 15 Sep 2026 03:44:18 +0000
Received: from out-253.mta0.migadu.com ([91.218.175.253] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6K5f-0000000599W-00SX
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 03:44:17 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2jbiWJDhwAbn+oByjgdLcODIoTIBG0rf4hLnt0gIZpg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789443848; v=1; x=1790048648;
 b=VDGPRjWVRw5huhHU3D6rBe5Sbi6KjQupuEJp8oKy8akPkGU+PNEdzDSkmeq3XrJv199PHLyY
 l0uxxWK16+YzvU1RBYzybSDTJoaA+tZ5oL9PNAN9/YTKelwHlncFPb+Li6AvhLDXm0uAbf2nzQX
 +YM6Ko5qoWZrEVrvQwnK68Hw=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 83cc88a87bac19b3;
	Tue, 15 Sep 2026 03:44:08 +0000
X-Mizu-Trace-ID: 83cc88a87bac19b3
X-Migadu-Flow: FLOW_OUT
Message-ID: <02a03893-b092-433b-8b28-586dcb5a54bc@linux.dev>
Date: Tue, 15 Sep 2026 11:43:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: lib: Fix ZBB strnlen wrap-around regression on
 huge counts
To: shao.mingyin@zte.com.cn, pjw@kernel.org, mikey@neuling.org
Cc: jiangfeng@kylinos.cn, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, zhang.yue5@zte.com.cn,
 david.laight.linux@gmail.com
References: <20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_204415_517138_C644653E 
X-CRM114-Status: GOOD (  11.77  )
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

SGksCgpPbiAyMDI2LzkvMTQgMTY6MjEsIHNoYW8ubWluZ3lpbkB6dGUuY29tLmNuIHdyb3RlOgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2xpYi9zdHJubGVuLlMgYi9hcmNoL3Jpc2N2L2xpYi9z
dHJubGVuLlMKPiBpbmRleCBhODkxMTYwNWMyNDguLjUyOGVlNzk5NTk2OSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2xpYi9zdHJubGVuLlMKPiArKysgYi9hcmNoL3Jpc2N2L2xpYi9zdHJubGVu
LlMKPiBAQCAtNjcsNyArNjcsNyBAQCBzdHJubGVuX3piYjoKPiAgIAkgKiAgIGExIC0gTWF4IGxl
bmd0aCBvZiBzdHJpbmcKPiAgIAkgKgo+ICAgCSAqIENsb2JiZXJzCj4gLQkgKiAgIHQwLCB0MSwg
dDIsIHQzLCB0NAo+ICsJICogICB0MCwgdDEsIHQyLCB0MywgdDQsIHQ1Cj4gICAJICovCj4KPiAg
IAkvKiBJZiBtYXhsZW4gaXMgMCwgcmV0dXJuIDAuICovCj4gQEAgLTg3LDkgKzg3LDIyIEBAIHN0
cm5sZW5femJiOgo+ICAgCSAqIEFsaWduZWQgYm91bmRhcnkuICBVc2UgdGhlIGFkZHJlc3Mgb2Yg
dGhlIGxhc3QgdmFsaWQgYnl0ZQo+ICAgCSAqIChzICsgY291bnQgLSAxKSB0byBhdm9pZCBsb2Fk
aW5nIGEgd29yZCBwYXN0IHRoZSBjb3VudAo+ICAgCSAqIGJvdW5kYXJ5IGluIHRoZSBsb29wIGJl
bG93LiAgY291bnQgPT0gMCBpcyBoYW5kbGVkIGFib3ZlLgo+ICsJICoKPiArCSAqIFNhdHVyYXRl
IHRoZSBib3VuZGFyeSB3aGVuIHMgKyBjb3VudCB3cmFwcyBhcm91bmQgKHZlcnkgbGFyZ2UKPiAr
CSAqIGNvdW50cywgZS5nLiBTSVpFX01BWCBwYXNzZWQgYnkgRk9SVElGWSBzdHJjYXQvc3RybGNh
dCB3aXRoIGEKPiArCSAqIGRlc3RpbmF0aW9uIHdob3NlIHNpemUgaXMgdW5rbm93biBhdCBjb21w
aWxlIHRpbWUpLiAgV2l0aG91dAo+ICsJICogdGhpcywgdGhlIHdyYXBwZWQgYm91bmRhcnkgbGFu
ZHMgYmVmb3JlIHMgYW5kIHRoZSBwcmUtbG9vcAo+ICsJICogZ3VhcmQgYmVsb3cgYWx3YXlzIGV4
aXRzLCByZXR1cm5pbmcgYSB0cnVuY2F0ZWQgbGVuZ3RoLgo+ICsJICogU2F0dXJhdGluZyBtYWtl
cyB0aGUgc2NhbiBlcXVpdmFsZW50IHRvIHN0cmxlbigpLgo+ICsJICoKPiArCSAqIEtlZXAgdGhl
IHNhdHVyYXRpb24gYnJhbmNobGVzcyBzbyB0aGF0IHRoZSBub3JtYWwgcGF0aCBkb2VzCj4gKwkg
KiBub3QgY2FycnkgYSB0YWtlbiBicmFuY2ggdGhhdCBjb3VsZCBiZSBtaXNwcmVkaWN0ZWQuCj4g
ICAJICovCj4gICAJYWRkCXQ0LCBhMCwgYTEKPiAgIAlhZGRpCXQ0LCB0NCwgLTEKPiArCXNsdHUJ
dDUsIHQ0LCBhMAkvKiBEaWQgcyArIGNvdW50IHdyYXAgYXJvdW5kPyAqLwo+ICsJc3ViCXQ1LCB6
ZXJvLCB0NQkvKiAtMSBpZiB3cmFwcGVkLCAwIG90aGVyd2lzZSAqLwo+ICsJb3IJdDQsIHQ0LCB0
NQkvKiBTYXR1cmF0ZSB0byB0aGUgdG9wIG9mIHRoZSBhZGRyZXNzIHNwYWNlICovCllvdSBjYW4g
c2F2ZSBvbmUgaW5zdHJ1Y3Rpb24gYnkgdXNpbmcgWmJiIG1pbnUgaW5zdHJ1Y3Rpb24uCgpFcXVh
dGlvbjogc2F0dXJhdGluZ19hZGQocywgY291bnQgLSAxKSA9PSBzICsgbWluKGNvdW50IC0gMSwg
fnMpLCBnaXZlbiAKdGhhdCBjb3VudCA+PSAxLgoKIMKgIMKgIGFkZGnCoCDCoCB0NCwgYTEsIC0x
CiDCoCDCoCBub3TCoCDCoCB0MSwgYTAKIMKgIMKgIG1pbnXCoCDCoCB0NCwgdDQsIHQxCiDCoCDC
oCBhZGTCoCDCoCB0NCwgYTAsIHQ0Cj4gICAJYW5kaQl0NCwgdDQsIC1TWlJFRwo+Cj4gICAJLyog
R2V0IHRoZSBmaXJzdCB3b3JkLiAgKi8KS2luZCByZWdhcmRzLApRaW5nZmFuZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
