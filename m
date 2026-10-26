Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A02606A326
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 20:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FI04QXEO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=h7xeCGNs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z4KmCgo/qPQaVOAoboUaUJMN87A4hh1Y8e+mJKCw1RY=; b=FI04QXEOm4id1Lnw+n8abTnYLc
	AhmioSpUrNtAajgctb6sCyMzGnytC/UB3mY67E1nI/G4jmYz8PXgKEDZmBtzxcpu++yMwg68Sg/7k
	WPBEtOlV7CJCgHc68BVHuG+WWHYe/YvJGKzsE/ufxVnJ9OsDhyGJ73qihzz8jU3//cK5zQYjD44IY
	LGHkaGhBFMPeGQf1KgXIpKNs1FsJcdw8OPa2uvG9EyUxu4/u4ouWl4pZN3zecQSVYuarBChJGxosR
	yI0+3o+lxj6yTtZ86eOiS/3sHaCPd5RYmMsbkqvjoutLyPMQYyakfyBvO2xBU8QbKEa2uub7f82pQ
	3sBILT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRHd-00000003Da0-1C3M;
	Mon, 26 Oct 2026 20:27:05 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRHZ-00000003DZe-2P5N
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 20:27:03 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8b0f59a5fdeso28157517b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1793046420; x=1793651220; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gci4HjhmuUam9CppAlJdjHIOy42WtCn64qZovch60/I=;
        b=h7xeCGNsUVveYY+DA/X0766R++lfbcAu+MlpIJlWlbCztHKG+El0U+xLwIssWbsaMd
         A6JvMMwv8dcnDSnpkrhmngs5LWLQ9sC3xIiFVz5I+8XNO64dmOQ8KxfSxIR6hrGSs3Qx
         Kux7LlUE+X/CqWpCphiqOfcfnZnYIHakk6ewlclUMe0KxlL263jO9VUVYzvE04zvOrvu
         wTU1SpXabqF2Hy/rbgDsjVUZc10fYj66FPWXbAmiTfnJv3+RS/wX4BuUB1o4Vv2sMMOY
         zD8XD86OvSWKgByIy93I+pswleCKufsh8+Z2Nrlp8+BMQnn9Wm+6y+RqmNCOpvhEbIkV
         NZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046420; x=1793651220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gci4HjhmuUam9CppAlJdjHIOy42WtCn64qZovch60/I=;
        b=HLGVbGzDjGKqruCdHqhvFY1n6PKQFaVVyirpGft7dre7PjUZ0vIOyJG1JEIUWZEmXg
         cZSeN/dn03e+tRtw/CEy0GgQyP7c0mFZCPF9tUaukr8KCX5UBVgOFrXWznSdaFPXALQa
         e4mf+I8w/mUD/l+1b0vmL41X7s0fIcz1HKcudhiK2UwEwNBFG2fvc73YKVXZna01FB7f
         Ot/4mZoiTq/bYcJaQZ9zXNcoF/g07T4N4UQ1mtsEk03x1pPGrkWItpLY5Mw3/KCATv4k
         sHs5Det06PHN8krNjahYtX58cbHlLXPegco8dHVIUp7C3+nqojKniv0tGMkOk3USqr9d
         HpKg==
X-Forwarded-Encrypted: i=1; AKwUvBztj9PyNr7ArZQz1p3o1K01SIrkCoPW/nPamop0It5MX/o0jHw5SAWK7jcAore3YQZBYUXcCYuN0UyFsQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK8PmAzzMPbLI9sbiVkCSPTiZELI4WvjngQ7MG6Enc5EVAT8kTI
	QjyogPRRSz+HhmhL3eo9ljK+7PhDedwHw0xR8t1JIaGkPiglSuJxg4YPvQP8gRg5MMw=
X-Gm-Gg: AYBFou2MXaS+d6PeyyHZ7IP9SYBmMC3IBSpgQz8Dd1r8WV170Mqdzc1fkn7Anma884c
	N0XA8AhcW/Uo98dUAjcp5NnO1lfTwOSgbhqACO2YW86KMAMjQVFAQ+45OPdUfnyv7LnbeXDqPQE
	O5Wwd/wlbPr0QhBjG2pX+RuZ+3EGkKBi9hPRcNy141+j90nFcr4GDmz2CurDX3gv2gq4bHvuTUZ
	x281gA9xwOPbI569PmhXmaTVxpmT9LU1/rJF0oesVXHuiG024xaH5Dkugn3bDqe495uFf6jOnqf
	D+VeOK565Wjtn0mj9411Fo0tm4S3a+srvaH5UGXNkxPghsbF9XPh3Gsh7YSSoD61/t9UbWpMWaD
	XYqfTHCAuiuwzRuQZopXNBLTOBpDZtBguzo935haIZdyYP1qpb5ko2+ytVJpkuL/obBElSrxbIG
	v3aVhWEk63m3YbyQpjg+n3VMc2A3KB91E3t7sDZ6ViT8990POqRXIUS8DkzifgULlsC+M3flmz9
	jQsnsXjugTsySPec4jgkHF0fT3hqWmw84jgQFf4k2pnIXcAH9oWbiDgujrwvypg1+g=
X-Received: by 2002:a05:690c:fc2:b0:81f:e7c5:f420 with SMTP id 00721157ae682-8b166b92716mr58087467b3.20.1793046419789;
        Mon, 26 Oct 2026 13:26:59 -0700 (PDT)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e656162sm1512807b3.44.2026.10.26.13.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:26:59 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:26:58 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, zong.li@sifive.com, wangruikang@iscas.ac.cn,
	debug@rivosinc.com, qirui.001@bytedance.com, guoziyi114@gmail.com,
	samuel.holland@sifive.com, ben.dooks@codethink.co.uk,
	cyrilbur@tenstorrent.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re:  riscv: Fix SR_SUM leakage across context switches
Message-ID: <at-3kvwKj9m02P7J@Tao-Chiu's-Mac>
References: <20261022083212.84721-1-cuiyunhui@bytedance.com>
 <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
 <CAEEQ3wkS2niNwzS25jhvT55fSDWF_anYkLW5PZS0MsvUOq2vBQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wkS2niNwzS25jhvT55fSDWF_anYkLW5PZS0MsvUOq2vBQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_132701_757804_ABEAA2AF 
X-CRM114-Status: GOOD (  33.50  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgMTA6NTA6NDVQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBBbmR5LAo+IAo+IE9uIEZyaSwgT2N0IDIzLCAyMDI2IGF0IDY6MTnigK9BTSBBbmR5
IENoaXUgPHRjaGl1QHRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgWXVuaHVpLAo+
ID4KPiA+IE9uIFRodSwgT2N0IDIyLCAyMDI2IGF0IDA0OjMyOjEyUE0gKzA4MDAsIFl1bmh1aSBD
dWkgd3JvdGU6Cj4gPiA+IF9fc3dpdGNoX3RvKCkgc2F2ZXMgdGhlIHNzdGF0dXMgdmFsdWUgb2Yg
cHJldiBhbmQgcmVzdG9yZXMgdGhlIFNSX1NVTSBiaXQKPiA+ID4gb2YgbmV4dCB3aXRoIGNzcnMu
IEhvd2V2ZXIsIGNzcnMgb25seSBzZXRzIGJpdHMuIElmIHByZXYgaGFzIFNSX1NVTSBzZXQKPiA+
ID4gYW5kIG5leHQgaGFzIFNSX1NVTSBjbGVhciBpbiBpdHMgc2F2ZWQgc3RhdGUsIHRoZSBvbGQg
U1JfU1VNIGJpdCByZW1haW5zCj4gPiA+IHNldCBpbiBzc3RhdHVzLgo+ID4gPgo+ID4gPiBUaGlz
IGxldHMgbmV4dCBydW4gd2l0aCB1c2VyIG1lbW9yeSBhY2Nlc3MgZW5hYmxlZCBldmVuIHRob3Vn
aCBpdHMgc2F2ZWQKPiA+ID4gU1JfU1VNIHN0YXRlIGlzIGNsZWFyLgo+ID4gPgo+ID4gPiBVc2Ug
Y3NycmMgdG8gc2F2ZSB0aGUgc3N0YXR1cyB2YWx1ZSBvZiBwcmV2IGFuZCBjbGVhciBTUl9TVU0g
ZnJvbSB0aGUKPiA+ID4gbGl2ZSBDU1IgYmVmb3JlIHJlc3RvcmluZyB0aGUgc2F2ZWQgU1JfU1VN
IHN0YXRlIG9mIG5leHQuIFRoaXMga2VlcHMKPiA+ID4gcHJldidzIFNSX1NVTSBzdGF0ZSBpbnRh
Y3QsIHdoaWxlIHByZXZlbnRpbmcgaXQgZnJvbSBsZWFraW5nIHRvIG5leHQuCj4gPgo+ID4gRG8g
eW91IGhhdmUgYSB3YXkgdG8gdHJpZ2dlciB0aGlzIGJ1ZyBvbiBleGlzdGluZyBjb2RlIG9yIGlz
IGl0IHRoZSBjYWUKPiA+IHdoZXJlIHRoZSBidWcgY291bGQgaGFwcGVuIGJ1dCB3ZSBuZXZlciBl
eHBlcmllbmNlZCBpdCBpbiByZWFsIGxpZmU/Cj4gPgo+ID4gSWYgSSB1bmRlcnN0YW5kIGNvcnJl
Y3RseSwgdGhpcyBjYW4gb25seSBoYXBwZW4gd2hlbiB0aGUgdXNlciBhY2Nlc3MKPiA+IHJvdXRp
bmcgdm9sdXRhcmlseSBtYWtlcyBhIHNjaGVkdWxlKCkgY2FsbCBtaWQtZmxpZ2h0LCBvciBhIGNv
ZGUgZm9nZXRzCj4gPiB0byB0dXJuIG9mZiBTUl9TVU0gcmlnaHQgYWZ0ZXIgYW4gdXNlciBhY2Nl
c3MgYW5kIGhhcyBhIGxpdmUgU1JfU1VNIHdoZW4KPiA+IGNhbGxpbmcgc2NoZWR1bGUgc29tZSB0
aW1lIGFmdGVyLiBCb3RoIGNhc2Ugc2hvdWxkIGJlIGEgYnVnIGFzIFNSX1NVTQo+ID4gc2hvdWxk
bid0IGxpdmUgaW4gdGhlIGtlcm5lbCBjb2RlIHRoYXQgaXMgbm90IGRvaW5nIHVzZXIgYWNjZXNz
Lgo+ID4KPiA+IEEgdHJhcC1pbnRyb2R1Y2VkIGNvbnRleHQgc3dpdGNoIHdvdWxkIGludGVycnVw
dCBhIGNvZGUgdGhhdCBoYXZlIFNSX1NVTQo+ID4gc2V0LiBIb3dldmVyLCBzaW5jZSB0aGUgYml0
IGlzIGNsZWFyZWQgYXQgZXZlcnkgZXhjZXB0aW9uIGVudHJ5LCB0aGUKPiA+IGNvbnRleHQgc3dp
dGNoIGNvZGUgd291bGQgbm90IHNlZSBhIGxpdmUgU1JfU1VNLiBTZWVpbmcgdGhlIGJpdCBzZXQg
aW4KPiA+IHRoaXMgY2FzZSBtZWFucyBzb21ldGhpbmcgaXMgbm90IHR1cm5pbmcgU1JfU1VNIG9m
ZiBwcm9wZXJseS4KPiA+Cj4gPiBJIGFnZ3JlZSB0aGF0IHRoaXMgaXMgdGhlIGJldHRlciB3YXkg
dG8gaGFuZGxlIFNSX1NVTSBpbiBhIGNvbnRleHQgc3dpdGNoCj4gPiBidXQgYXR0YWNoaW5nIGEg
Y2FsbCB0cmFjZSBvciBzdGF0aW5nIHRoYXQgIldlIGhhdmUgbm90IGNhdWdodCB0aGlzIGluCj4g
PiByZWFsIHdvcmxkIGR1ZSB0byAuLi4iIGluIHRoZSBjb21taXQgbWVzc2FnZSB3b3VsZCBiZSBh
cHByZWNpYXRlZC4KPiA+Cj4gCj4gSSBkb24ndCB0aGluayB3ZSBuZWVkIGEgImJldHRlciB3YXki
IHRvIGp1c3RpZnkgdGhpcy4gVGhpcyBpcyBhIGJ1ZyBpbgo+IF9fc3dpdGNoX3RvKCkuIE9uZSBw
b3NzaWJsZSBwYXRoIHRvIGhpdCBpdCBpcwo+IHVzZXJfd3JpdGVfYWNjZXNzX2JlZ2luKCkgLi4u
IGxvY2FsX2JoX2VuYWJsZSgpLgo+IAoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCBZdW5o
dWkuIEkndmUgbG9va2VkIGludG8gdGhlIGNvZGUgYW5kIHRoaXMKcmV2ZWFscyBhIGJpZ2dlciBw
cm9ibGVtOiBjYWxsaW5nIGxvY2FsX2JoX2VuYWJsZSgpIHdoaWxlIGhhdmluZyBhIGxpdmUKU1Jf
U1VNIGlzIG5vdCBzYWZlLiBsb2NhbF9iaF9lbmFibGUoKSBjYW4gY2FsbCBzb2Z0aXJxIGlubGlu
ZSwgd2hpY2gKY2FsbHMgaW50byB1c2VyY29weSBpbiBwZXJmIGFuZCBCUEYuIFNpbmNlIHRoZSBs
YXRlciBjb3B5IGFzc3VtZXMgYmVpbmcKY2FsbGVkIHdpdGggU1JfU1VNIGRpc2FibGVkLCBpdCB0
aGVuIGZsaXBzIHRoZSBiaXQgYW5kIHJldHVybnMgd2l0aDEKU1JfU1VNIHNpbGVudGx5IHR1cm5l
ZCBvZmYuCgpUaGUgdW5zYWZlX2NvcHlfe3RvLGZyb219X3VzZXIoKSB3aXRoIHNpemUgPj0gNzY4
IGNhbiB0YWtlIHRoaXMgcGF0aCBhbmQKY2FsbHMgbG9jYWxfYmhfZW5hYmxlKCkgd2l0aCBTUl9T
VU0gZW5hYmxlZCB1bmRlciBrZXJuZWxfdmVjdG9yX2JlZ2luKCkKCkkgYW0gZ29pbmcgdG8gc2Vu
ZCBhIHBhdGNoIHRoYXQgcHJldmVudCBjYWxsaW5nIGxvY2FsX2JoX2VuYWJsZSgpIGluCmtlcm5l
bF92ZWN0b3JfYmVnaW4oKS4gdGhlIGdldF9jcHVfdmVjdG9yX2NvdGV4dCgpIGlzIGFjdHVhbGx5
IHRvbyBzdHJvbmcKZm9yIHRoZSByZXF1aXJlbWVudC4gT3RoZXJ3aXNlLCB3ZSBzaG91bGQgY29u
c2lkZXIgZ2F0aW5nIHZlY3Rvcml6ZWQKdWNvcHkgZnJvbSB1bnNhZmVfKiBwYXRoLgoKQXMgZm9y
IHRoaXMgcGF0Y2g6CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDx0Y2hpdUB0ZW5zdG9ycmVudC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
