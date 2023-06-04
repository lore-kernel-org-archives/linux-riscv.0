Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403FFC7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpXwe69ym/Wa/NXUJ6X+jj5wgs6ERlyS9Spa6Uj67Ak=; b=pJrG/0wo6xhI6S
	VDn6lQu5ZMuaLhj/IWkYLaPVn2ngLNPA8kHGnDYNAcZPUrJ9Yzb0KATc2AYfiqHvlzhbeSdoBBbR3
	IJ3IwIGAN6+dnLDAbRdxAKj9YfAti9elAaYsenP6feJuzu1s7kIZLM9PQFIOcF7WW2qScF0dqx7jz
	9+/RbKVvmYPgwuAHJb3OZoVXB9mNl6WHGMBfp3YfqezHHTu7w8awFBFLezgSfkGg6hh73lRzO/gq9
	/17ptLaNh4Q6TVoFyZvQAaErNWsc4DVDZUddpCWApwGacOmSYVsGfiiPK1WhP/r5h4TMFK03+jnGg
	uDTKoC/SEWZo65akZcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5mP3-00C52W-1c;
	Sun, 04 Jun 2023 12:00:09 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5mOz-00C51m-2t
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 12:00:07 +0000
Date: Sun, 4 Jun 2023 14:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685880002; bh=OkG7uO8YzqEC3izO7nBZOeWbSn787YshNFNDaJf+U4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiwL8f6waRULbxeIVeME2C/BwO2s2vLwiyJVo9qV0a3hbuLyKfUYgqKDwpbjoK/bq
	 wT+4dFbzVQELme2OyvPw2OBpWXXZEyKpcT+XnRVN+1t/pserWYUOV4hDntHgYBhUIE
	 vVMsiPMNrXLBddX+q9xMQNZCEvF1ZrnW90RfC08I=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Zhangjin Wu <falcon@tinylab.org>, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 02/12] tools/nolibc: add missing nanoseconds support
 for __NR_statx
Message-ID: <0c0537d6-5cba-43e9-8ca2-0e1605d64e8a@t-8ch.de>
References: <cover.1685777982.git.falcon@tinylab.org>
 <bcb69a382bbb68826f974ef4f521c8f1c60e47bc.1685777982.git.falcon@tinylab.org>
 <ZHxzC6X5dgzmH+Ek@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHxzC6X5dgzmH+Ek@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_050006_115456_1798DAE8 
X-CRM114-Status: GOOD (  12.32  )
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

T24gMjAyMy0wNi0wNCAxMzoxODozNSswMjAwLCBXaWxseSBUYXJyZWF1IHdyb3RlOgo+IE9uIFNh
dCwgSnVuIDAzLCAyMDIzIGF0IDA0OjAyOjA0UE0gKzA4MDAsIFpoYW5namluIFd1IHdyb3RlOgo+
ID4gQ29tbWl0IGE4OWM5MzdkNzgxYSAoInRvb2xzL25vbGliYzogc3VwcG9ydCBuYW5vc2Vjb25k
cyBpbiBzdGF0KCkiKQo+ID4gYWRkZWQgbmFub3NlY29uZHMgZm9yIHN0YXQoKSBidXQgbWlzc2Vk
IHRoZSBzdGF0eCBjYXNlLCB0aGlzIGFkZHMgaXQuCj4gPiAKPiA+IFRoZSBzdHhfYXRpbWUsIHN0
eF9tdGltZSwgc3R4X2N0aW1lIGFyZSBpbiB0eXBlIG9mICdzdHJ1Y3QKPiA+IHN0YXR4X3RpbWVz
dGFtcCcsIHdoaWNoIGlzIGluY29tcGF0aWJsZSB3aXRoICdzdHJ1Y3QgdGltZXNwZWMnLCBzaG91
bGQKPiA+IGNvbnZlcnQgZXhwbGljaXRseS4KPiA+IAo+ID4gICAgIC8qIGluY2x1ZGUvdWFwaS9s
aW51eC9zdGF0LmggKi8KPiA+IAo+ID4gICAgIHN0cnVjdCBzdGF0eF90aW1lc3RhbXAgewo+ID4g
ICAgIAlfX3M2NAl0dl9zZWM7Cj4gPiAgICAgCV9fdTMyCXR2X25zZWM7Cj4gPiAgICAgCV9fczMy
CV9fcmVzZXJ2ZWQ7Cj4gPiAgICAgfTsKPiA+IAo+ID4gICAgIC8qIGluY2x1ZGUvdWFwaS9saW51
eC90aW1lLmggKi8KPiA+ICAgICBzdHJ1Y3QgdGltZXNwZWMgewo+ID4gICAgIAlfX2tlcm5lbF9v
bGRfdGltZV90CXR2X3NlYzsJCS8qIHNlY29uZHMgKi8KPiA+ICAgICAJbG9uZwkJCXR2X25zZWM7
CS8qIG5hbm9zZWNvbmRzICovCj4gPiAgICAgfTsKPiA+IAo+ID4gV2l0aG91dCB0aGlzIHBhdGNo
LCB0aGUgc3RhdF90aW1lc3RhbXBzIHRlc3QgY2FzZSB3b3VsZCBmYWlsIHdoZW4KPiA+IF9fTlJf
c3RhdHggZGVmaW5lZC4KPiA+IAo+ID4gRml4ZXM6IGE4OWM5MzdkNzgxYSAoInRvb2xzL25vbGli
Yzogc3VwcG9ydCBuYW5vc2Vjb25kcyBpbiBzdGF0KCkiKQo+ID4gU3VnZ2VzdGVkLWJ5OiBUaG9t
YXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Cj4gPiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8zYTNlZGQ0OC0xYWNlLTRjODktODllOC05YzU5NGRk
MWIzYzlAdC04Y2guZGUvCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZ2ppbiBXdSA8ZmFsY29uQHRp
bnlsYWIub3JnPgo+IAo+IFRoYW5rIHlvdS4gSSd2ZSBxdWV1ZWQgaXQgaW1tZWRpYXRlbHkgYWZ0
ZXIgVGhvbWFzJyBwYXRjaC4KPiBJJ2xsIGxldCB0aGUgdHdvIG9mIHlvdSB0ZWxsIG1lIGlmIGl0
J3MgYmV0dGVyIHRvIHNxdWFzaCB0aGVtCj4gdG9nZXRoZXIgdG8gYXZvaWQgYnJlYWtpbmcgYmlz
ZWN0IGFuZCBtYXJrIHlvdSBjby1hdXRob3JzLgoKU3F1YXNoaW5nIHRoZW0gc291bmRzIGxpa2Ug
dGhlIGNvcnJlY3Qgc29sdXRpb24gdG8gbWUuCgpUaG9tYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
