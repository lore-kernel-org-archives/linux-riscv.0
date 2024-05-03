Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DC8C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZWaD7Iq6tyc6W0z6p1JtqA8zo0tOG2/peCjW/1aOCI=; b=O8Q5IwR6pYlbts
	T8oZXNB3+5AykCEbUfUY8xa7bDICXLekyYA633O+/QLsaQGu0FYFk29U5vz3t7fNpFTThBN5MFYon
	vUcNAXkzs1eAqc+9uSY4HxcKnSB5BxHDQPJMpZ6UHDOkwFhOsVsEnz9BiJhmUP1qqwtAsCoY9q7vw
	VXAjWzTMpVZQfKUSBU9faLbzrvozfObULvGqq+ZPj3KoyrMU7f4582noIjxt/FTy0dx+ZK4H/lt0l
	FsiGxKa++z/iLJ3hOnm+Dd33ZCG6RFK9moavzKtl1mmqiBK/yxYmQrTylvXcQPFvUDKSrVh3f0qM4
	3mAgmGNxteleM8xuSHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oUJ-0000000FhaK-0EOE;
	Fri, 03 May 2024 08:41:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oUD-0000000FhYP-3Hs4;
	Fri, 03 May 2024 08:41:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A19761D33;
	Fri,  3 May 2024 08:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131ABC4AF19;
	Fri,  3 May 2024 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714725705;
	bh=W69xgXC3xL1qD328FsH2Bn3aVb/I3Y7DWq/sG4PLpOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MX6LMJWOsj2HpakEDhG6oQQlRQNVnt4sTrZXlgZMUHSPA5BP21dzndYWkV2jSZE5C
	 JpvZirb8+T33lBn1eM61891V3/LxhM4vVQgj51kQoph+TegI0zaiDADJbhZzIMT+ec
	 brpiL9QXnyYv+UJZXd4l7vm1Jcwy61HZ5C1oPX94+j5kj/CXUOIm3j1pGkch8fUpK1
	 pHfv69TYCvZuhVQORz0MtqiBT3bc3AOykKi+5NCA2PgEySUWsyacYUxtZs6ETskytx
	 8Gq4s3BywSQvei9ruOy5ZLE4llo+gDSnjL8mccGOLxbaOhvNZSnVLGj25gPKwM/sWy
	 GbizqQv8cEb/w==
Date: Fri, 3 May 2024 09:41:39 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: mfd: Use full path to other schemas
Message-ID: <20240503084139.GK1227636@google.com>
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
 <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
 <0af10387-ddfb-47b0-b59e-eeba1644be1c@kernel.org>
 <20240503082444.GJ1227636@google.com>
 <72f94454-867f-4a6c-90c8-134db2ce150e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72f94454-867f-4a6c-90c8-134db2ce150e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_014145_890553_4B8D37B9 
X-CRM114-Status: GOOD (  15.86  )
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

T24gRnJpLCAwMyBNYXkgMjAyNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gT24gMDMv
MDUvMjAyNCAxMDoyNCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gRnJpLCAwMyBNYXkgMjAyNCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+IAo+ID4+IE9uIDAzLzA1LzIwMjQgMTA6MDgs
IFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gPj4+Cj4gPj4+Cj4gPj4+IE9uIDUvMy8yNCAwODoyMSwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+Pj4+ICAuLi4vYmluZGluZ3MvbWZkL3NhbXN1
bmcsczJtcGEwMS55YW1sICAgICAgICAgfCAgMiArLQo+ID4+Pj4gIC4uLi9iaW5kaW5ncy9tZmQv
c2Ftc3VuZyxzMm1wczExLnlhbWwgICAgICAgICB8IDEyICsrLS0tCj4gPj4+PiAgLi4uL2JpbmRp
bmdzL21mZC9zYW1zdW5nLHM1bTg3NjcueWFtbCAgICAgICAgIHwgIDQgKy0KPiA+Pj4KPiA+Pj4g
UmV2aWV3ZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPiA+
Pgo+ID4+IFNvIHRoaXMgc2hvdWxkIGJlIEFjay4gWW91IGNhbm5vdCByZXZpZXcgcGFydCBvZiB0
aGUgcGF0Y2ggKCJJIGhhdmUKPiA+PiBjYXJyaWVkIG91dCBhIHRlY2huaWNhbCByZXZpZXcgb2Yg
dGhpcyBwYXRjaC4uLiIpLgo+ID4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjgtcmM1L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJz
dAo+ID4gCj4gPiBSZXZpZXdlZC1ieSBpcyB0b3RhbGx5IGFwcHJvcHJpYXRlIGhlcmUuCj4gCj4g
U3VibWl0dGluZyBwYXRjaGVzIGlzIGNsZWFyIG9uIHRoYXQ6Cj4gIkEgUmV2aWV3ZWQtYnkgdGFn
IGlzIGEgc3RhdGVtZW50IG9mIG9waW5pb24gdGhhdCB0aGUgcGF0Y2ggaXMgYW4iCj4gTm90ICJ0
aGUgcGF0Y2ggb3IgcGFydCBvZiBwYXRjaCIKPiAKPiBBbmQgYWNrOgo+ICIgSXQgaXMgYSByZWNv
cmQgdGhhdCB0aGUgYWNrZXIgaGFzIGF0IGxlYXN0IHJldmlld2VkIHRoZSBwYXRjaCAuLi4uCj4g
QWNrZWQtYnk6IGRvZXMgbm90IG5lY2Vzc2FyaWx5IGluZGljYXRlIGFja25vd2xlZGdlbWVudCBv
ZiB0aGUgZW50aXJlCj4gcGF0Y2guIgo+IAo+IFNvIG5vLCByZXZpZXdpbmcgcGFydCBvZiB0aGUg
cGF0Y2ggbWVhbnMgeW91IEFjayBpdC4gRXNwZWNpYWxseSB0aGF0IGluCj4gZ2l0IGxvZyB0aGUg
UmIgdGFnIHdpbGwgc3VnZ2VzdCBlbnRpcmUgcGF0Y2ggd2FzIHJldmlld2VkLCB3aGlsZSBpdCB3
YXMKPiBub3QgdHJ1ZS4gUmV2aWV3IG9mIDgwJSBvZiBwYXRjaCBkaWQgbm90IGhhcHBlbi4KCkkg
cmVhZCB0aGlzIGRpZmZlcmVudGx5LgoKSSBkb24ndCBzZWUgYW55IHJlYXNvbiB3aHkgb25seSBh
IHJlbGV2YW50IHBhcnQgb2YgYSBwYXRjaCBjYW4ndCBiZQpjb3ZlcmVkIGJ5IGEgUmV2aWV3ZWQt
YnkuICBJdCBkb2Vzbid0IGV4cGxpY2l0bHkgc2F5IHRoYXQgeW91IGNhbid0IGRvCnRoYXQuICBJ
ZiB0aGUgc3RhdGVtZW50IG1lYW50IHRoYXQsIGl0IHdvdWxkIGhhdmUgdXNlZCBtb3JlIGluY2x1
c2l2ZQpsYW5ndWFnZSBsaWtlICJ3aG9sZSBwYXRjaCIgb3IgImFsbCBvZiB0aGUgcGF0Y2giLCBi
dXQgaXQgcmVmcmFpbnMgZnJvbQpkb2luZyBzby4KCk15IGludGVycHJldGF0aW9uIGlzIHRoYXQg
dGhlIGV4cGxpY2l0bmVzcyBvZiB0aGUgQWNrZWQtYnkgc3RhdGVtZW50IGlzCnRvIHByb3ZpZGUg
ZXh0cmEgcHJvdGVjdGlvbiB0byBNYWludGFpbmVycyB0aGF0IG9ubHkgcmV2aWV3IGFuZCBwcm92
aWRlCkFja3MgZm9yIGNodW5rcyB0aGF0IHRoZXkgYXJlIHJlc3BvbnNpYmxlIGZvci4KCldoYXRl
dmVyIHRoZSBjYXNlLCB0aGlzIGlzIGEgcHJldHR5IG5pdHBpY2t5IHBvaW50LgoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
