Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A1B606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a+iQbOEq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=SCAyeLtc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xTtpU3ppYZfsKRNBoNnfqiXC9bSUTBk0rodMSZTqsNs=; b=a+iQbOEqz91CR4fYimFnSkmuoW
	T3/katpmQweqV87b/tQloWrXKLpYyuMxsnLq+PBmmNg0uPAVeTJ5upCPwCtA3NFdJwEkuFlwMPQ+Y
	MEdhcZFCrgEB4xmhtXRUa/lHDCFxhqieeV6aZKt3EnVjXPnTOcL3NuwG9ZA5wevsncFGR5kLOw9A6
	OMG+eAgS/x3t9/fkJW2UiTrTtNmrYe4u0xOB79Q6EfGG4F4jjMPj/iyocXI+iqsVvH+Hzr9shcwLb
	wcGx2/o5KWxlvehK5xBiUALVJmD9nZM3HwVbO3icqDqpCUu+OvIRpwO4cHI9SqNAD11atV9tCxRHX
	l/5xah8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3da-0000000CJTB-2JsG;
	Thu, 19 Nov 2026 15:01:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3dY-0000000CJSa-0iRb
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 15:01:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so22716535e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 07:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795100477; cv=none;
        d=google.com; s=arc-20260327;
        b=q/B/KjbrYIAc4Ij2b1ysgAuOidZCAcntvAKBt+JdQHlQz4DkqRv6u0VpJh+M7xYsbg
         qVYnQGtX/FqhBg2h+/8NyCv0F+ovRl5Y3WeyyN2GeQeXzsvygxY3GqwtuwtDHg/Tm+gS
         5xweoovan+QpVc5msVzrwj+O1FOAvDAoKSuDeDqvRyPTTlyzXR2NfQyTjksRCekRs/uf
         rGAAjbbl0IQZWMzYh4MAA2xJr+3XDSNFzV6B0SvZ7ImAcGw3CaHsGdgFTsL59xVXDhjm
         DylsmKD+AApaxzO0VTfVGPGFgVJYqA80Onf5lzJvOSr9Ufp4L/tWPLm2pGA8PW6+5m72
         MPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RnqHNzlTcadbdRnn6+q/pLt5ZICBBqMuBrJP4IdL8vQ=;
        fh=mbojhq+UppjEIWCWTJEuW5nVfnhFEberLPDlKLOMUco=;
        b=aGkSG1tAeawG6nfq+5c4TYwBjuzi1ZBpBi3inCFYRKZqnCFrTNo3v2qlubriKgjWA5
         L7qS5Xj3FS26YB7rvuy6R7ZsXG0sJ6GGYnf1bfNFquz/qvFwXyYu8TKLNZq1sHZBZlE3
         qCZPdLYWMYGvz7uw9MDmzWblPDdf1D5dZdeEkOAiM6e065sPu5Q8yb8QNviNOA9WRhGa
         wWD3S9SNWqbd0fCTxDT2LuauVwymiphfyom6CoQoBVDeGMoeiS0qAv8lcVl7OqJLP2Yy
         BfOouOJ0y8xGBqqsFandr6P3mzN7q2mczsI0GytyQxfb5/6yd1SW+J2c0U+hSTkwVU5m
         x2jA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795100477; x=1795705277; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RnqHNzlTcadbdRnn6+q/pLt5ZICBBqMuBrJP4IdL8vQ=;
        b=SCAyeLtcRgWtKFfIfVXih1n3le9zEpOHzp7PoQLeDzDdp+tMgSdworGnXOmQ2cggJ4
         Wq3TsQNI1m/tC6SfK4qqtBWO1/5hAAIHzfX89kpCZNAr1N6Kf2FdU51Kc0q7TUKyrHji
         cYac5s0rp+prvE4ECCJ7IlRxjasjgC3+KjIv4Vkxua+VYwmdQha6Blg/wdk/eDE92s2B
         /GFEtq+gOYs+auJKMMUbOq+lYRAAzjcLHkxSyzLt60UXjK3doSFrIX7T2VYwyznTgF0n
         GfjNTeVgrPJJjgvX/uIzzLHKHA5RlS5ah+ASwPD2bgkN+tqc0ABuBqEZa82ConlOxvWg
         CaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100477; x=1795705277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnqHNzlTcadbdRnn6+q/pLt5ZICBBqMuBrJP4IdL8vQ=;
        b=wv0Xugtd/E+pX+LphFWJgV19NqMosV279dj5P048eFEERgo9QqfmtxZVMlHdzo0VNw
         wbP3hOgwGqFAuxBDVtKiCxPb2w7A6HwYGb4cIlDozxCuF8bnB5kBW6TUhTJ/62u16+W3
         MreUQu7dTOaTFR0SlHyAWL5xG1lVbgE/A8j91VOOAsJMxMEIhpCA71x2HGPEltGdTDf0
         6buwzoMXCOK2iRS4awChAT7oMKkEeOZtfK8cIPlZ2HwB9Ri+AzjRnScuqjqTJqytm8XY
         mbYN+TGphLqqgGFBiU5R+xBD3cFj4BjEbXkj90Kw2Pn2nlbcNeq182h2UHmaCyueTDb8
         qkfQ==
X-Forwarded-Encrypted: i=1; AL+hErHIEpxE7jIFi5WvMTLWR+0g37Yh8IxgqxTvadcqk/2wRA6M5FWkka/LEgNAtnhxbiL3k2ZyUOZNzeSOOw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/wNDsCP3WPRva6FAKnG+RgXkpaDpTHdAbvsd05nsYMyLSyits9
	WkRUtnaYx8S2gC/GV3eAMz9h+OZ7c9el5DB37BvaaQGqx2FMqORuF0FIaXZ4+OlHyN8b9Mu08Mz
	uVGKgHEa0LsPwhZtttiY9eJ2O3aaVOgZDNOak3W7DQA==
X-Gm-Gg: AYBFou2S26OkyKzqZ+6wqLu7LBqtSStuzIJr5G6eUodMvAlNsCPuuJ+BWayAHkRBfuz
	m2PEUoRthX+44EjkEqQj1tyAGaX25uFC9j+D7ssvIvpoLbjbQ8/DMfsJIh9MnYV2iBnB3UpsnmV
	lvHXbApMKFmBOb/UdmTJpihQt/nVnwzLNxqqW1DDp4ELrzIFbOhCR0auBBe4he9UCCzNNPG3Xid
	QowFbR1eK7wzey9rLoisA8NC2DTPdQ/jCluT5wJQH+jgvUU2FT+DHDG6Ib4uPY5v873CVYPRBov
	gwzyvtDB7k2EccQLLybU6TTvDEm+UE9mvVbZ7gqQg7x4XWhL5pta/fqdTMKumjxLcGa3Ve97pn+
	ymi8me2GhVmg9aQin32ATcAWkz5vR46SFY0SOtecFC2NTU/ED7+7fMgxCe7ugPwIwyF7s6GK1vQ
	Rro7pHJc82mtisBQN44idxxd5DFwPjxUi6tBtIiEQ/t9GCWnImnARtUYpE
X-Received: by 2002:a05:600c:19d2:b0:4a7:c366:d791 with SMTP id
 5b1f17b1804b1-4bb7d6cc14amr126502605e9.1.1795100477039; Thu, 19 Nov 2026
 07:01:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118092147.2017658-1-prajwal.n@oss.qualcomm.com> <20261118092147.2017658-2-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261118092147.2017658-2-prajwal.n@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:31:03 +0530
X-Gm-Features: Aa3M54pqdSyMpxAUEyGq383herjDzFKNCIiZY_1f2mIpsmKm3yMLScXr3WzE5ZM
Message-ID: <CAAhSdy2zvLE51Ttn-=Z=7B_UY_dOD-a2RCLCwCsFp+KsB9=jDw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] RISC-V: Add defines for the RISC-V SBI
 watchdog extension
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	wim@linux-watchdog.org, linux@roeck-us.net, radim.krcmar@oss.qualcomm.com, 
	anup.patel@oss.qualcomm.com, linux-riscv@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_070120_263085_E23AE880 
X-CRM114-Status: GOOD (  13.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMjo1MuKAr1BNIFByYWp3YWwgTiA8cHJhandhbC5uQG9z
cy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQWRkIHRoZSBTQkkgd2F0Y2hkb2cgZXh0ZW5zaW9u
IElEIGFuZCBmdW5jdGlvbiBJRHMgZm9yIHN1cHBvcnRlZAo+IG9wZXJhdGlvbnMsIGluY2x1ZGlu
ZyBzdGFydCwgc3RvcCwgcGF0LCBhbmQgYXR0cmlidXRlIHJlYWQgYW5kIHdyaXRlLgo+Cj4gRGVm
aW5lIHRoZSBhdHRyaWJ1dGUgSURzIGV4cG9zZWQgYnkgdGhlIFNCSSB3YXRjaGRvZyBleHRlbnNp
b24sIGluY2x1ZGluZwo+IHdhdGNoZG9nIGNhcGFiaWxpdGllcyBzdWNoIGFzIE1TSSBzdXBwb3J0
IGFuZCBjb25maWd1cmFibGUgd2F0Y2hkb2cKPiBwYXJhbWV0ZXJzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogUHJhandhbCBOIDxwcmFqd2FsLm5Ab3NzLnF1YWxjb21tLmNvbT4KCkxHVE0uCgpSZXZpZXdl
ZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4g
LS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oCj4gaW5kZXggZmQ2MjY2YTdiMzM5Li5mMmIwYjBjOWY2YjEgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmgKPiBAQCAtNDAsNiArNDAsNyBAQCBlbnVtIHNiaV9leHRfaWQgewo+ICAgICAg
ICAgU0JJX0VYVF9GV0ZUID0gMHg0NjU3NDY1NCwKPiAgICAgICAgIFNCSV9FWFRfTVBYWSA9IDB4
NEQ1MDU4NTksCj4gICAgICAgICBTQklfRVhUX0RCVFIgPSAweDQ0NDI1NDUyLAo+ICsgICAgICAg
U0JJX0VYVF9XRFQgPSAweDU3NDQ1NCwKPgo+ICAgICAgICAgLyogRXhwZXJpbWVudGFscyBleHRl
bnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCj4gICAgICAgICBTQklfRVhUX0VY
UEVSSU1FTlRBTF9TVEFSVCA9IDB4MDgwMDAwMDAsCj4gQEAgLTUzNiw2ICs1MzcsMzEgQEAgdW5p
b24gc2JpX2RidHJfc2htZW1fZW50cnkgewo+ICAgICAgICAgc3RydWN0IHNiaV9kYnRyX2lkX21z
ZyBpZDsKPiAgfTsKPgo+ICsvKiBTQkkgd2F0Y2hkb2cgZnVuY3Rpb24gSURzICovCj4gK2VudW0g
c2JpX2V4dF93ZHRfZmlkIHsKPiArICAgICAgIFNCSV9FWFRfV0FUQ0hET0dfUkVBRF9BVFRSSUJV
VEUgPSAwLAo+ICsgICAgICAgU0JJX0VYVF9XQVRDSERPR19XUklURV9BVFRSSUJVVEUsCj4gKyAg
ICAgICBTQklfRVhUX1dBVENIRE9HX1dSSVRFX05PVElGX01TSV9NRVNTQUdFLAo+ICsgICAgICAg
U0JJX0VYVF9XQVRDSERPR19TVEFSVCwKPiArICAgICAgIFNCSV9FWFRfV0FUQ0hET0dfU1RPUCwK
PiArICAgICAgIFNCSV9FWFRfV0FUQ0hET0dfUEFULAo+ICt9Owo+ICsKPiArLyogU0JJIHdhdGNo
ZG9nIGF0dHJpYnV0ZXMgKi8KPiArZW51bSBzYmlfZXh0X3dkdF9hdHRyaWJ1dGVfaWQgewo+ICsg
ICAgICAgU0JJX1dBVENIRE9HX0NBUEFCSUxJVFkgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAw
MCwKPiArICAgICAgIFNCSV9XQVRDSERPR19TVEFURSAgICAgICAgICAgICAgICAgICAgICA9IDB4
MDAwMDAwMDEsCj4gKyAgICAgICBTQklfV0FUQ0hET0dfTUlOX1BFUklPRCAgICAgICAgICAgICAg
ICAgPSAweDAwMDAwMDAyLAo+ICsgICAgICAgU0JJX1dBVENIRE9HX1BFUklPRCAgICAgICAgICAg
ICAgICAgICAgID0gMHgwMDAwMDAwMywKPiArICAgICAgIFNCSV9XQVRDSERPR19USU1FX0xFRlQg
ICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDQsCj4gKyAgICAgICBTQklfV0FUQ0hET0dfTk9U
SUZfVElNRSAgICAgICAgICAgICAgICAgPSAweDAwMDAwMDA1LAo+ICsgICAgICAgU0JJX1dBVENI
RE9HX05PVElGX01TSV9BRERSX0xPVyAgICAgICAgID0gMHgwMDAwMDAwNiwKPiArICAgICAgIFNC
SV9XQVRDSERPR19OT1RJRl9NU0lfQUREUl9ISUdIICAgICAgICA9IDB4MDAwMDAwMDcsCj4gKyAg
ICAgICBTQklfV0FUQ0hET0dfTk9USUZfTVNJX0RBVEEgICAgICAgICAgICAgPSAweDAwMDAwMDA4
LAo+ICsgICAgICAgU0JJX1dBVENIRE9HX0FUVFJfTUFYICAgICAgICAgICAgICAgICAgID0gMHgw
MDAwMDAwOSwKPiArICAgICAgIFNCSV9XQVRDSERPR19BVFRSX1JFU0VSVkVEX01BWCAgICAgICAg
ICA9IDB4RkZGRkZGRkYKPiArfTsKPiArCj4gIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICov
Cj4gICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9ERUZBVUxUICAgICAgIDB4MQo+ICAjZGVmaW5l
IFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJRlQgICAyNAo+IC0tCj4gMi40My4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
